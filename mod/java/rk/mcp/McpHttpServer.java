package rk.mcp;

import android.content.Context;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.net.ServerSocket;
import java.net.Socket;
import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.ThreadFactory;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 * A very small MCP server ("Streamable HTTP", JSON answers) that listens on 127.0.0.1 only. Every request must carry the
 * token ("Authorization: Bearer ..."), must be addressed to the loopback host and must not come from a web page.
 */
final class McpHttpServer {
    private static final Charset UTF8 = Charset.forName("UTF-8");
    private static final String[] PROTOCOLS = {"2025-06-18", "2025-03-26", "2024-11-05"};
    private static final int MAX_BODY = 256 * 1024;

    private static ServerSocket socket;
    private static ExecutorService pool;
    private static volatile String error;

    private McpHttpServer() {}

    static synchronized boolean running() { return socket != null && !socket.isClosed(); }

    static String error() { return error; }

    static synchronized void start(final Context app) {
        if (running()) return;
        try {
            final ServerSocket s = new ServerSocket();
            s.setReuseAddress(true);
            s.bind(new InetSocketAddress(InetAddress.getByAddress(new byte[]{127, 0, 0, 1}), McpSettings.PORT), 8);
            socket = s;
            error = null;
            pool = Executors.newFixedThreadPool(4, new ThreadFactory() {
                @Override public Thread newThread(Runnable r) {
                    Thread t = new Thread(r, "rk-mcp");
                    t.setDaemon(true);
                    return t;
                }
            });
            Thread acceptor = new Thread(new Runnable() {
                @Override public void run() {
                    while (!s.isClosed()) {
                        try {
                            final Socket c = s.accept();
                            try {
                                pool.execute(new Runnable() { @Override public void run() { serve(app, c); } });
                            } catch (RuntimeException busy) {
                                close(c);
                            }
                        } catch (IOException e) {
                            if (!s.isClosed()) android.util.Log.w("RKMcp", "accept", e);
                        }
                    }
                }
            }, "rk-mcp-accept");
            acceptor.setDaemon(true);
            acceptor.start();
        } catch (IOException e) {
            error = e.getMessage() == null ? e.getClass().getSimpleName() : e.getMessage();
            android.util.Log.e("RKMcp", "Could not listen on port " + McpSettings.PORT, e);
        }
    }

    static synchronized void stop() {
        if (socket != null) { try { socket.close(); } catch (IOException ignored) {} socket = null; }
        if (pool != null) { pool.shutdownNow(); pool = null; }
    }

    // ───────────────────────── one connection ─────────────────────────

    private static void serve(Context app, Socket c) {
        try {
            c.setSoTimeout(10000);
            InputStream in = c.getInputStream();
            String line = readLine(in);
            if (line == null) return;
            String[] parts = line.split(" ");
            if (parts.length < 2) { reply(c, 400, null, "Bad request"); return; }
            String method = parts[0], path = parts[1];
            Map<String, String> headers = new HashMap<>();
            for (int i = 0; i < 64; i++) {
                String h = readLine(in);
                if (h == null) return;
                if (h.isEmpty()) break;
                int at = h.indexOf(':');
                if (at > 0) headers.put(h.substring(0, at).trim().toLowerCase(Locale.ROOT), h.substring(at + 1).trim());
            }
            int length = 0;
            if (headers.containsKey("content-length")) {
                try { length = Integer.parseInt(headers.get("content-length")); } catch (NumberFormatException e) { reply(c, 400, null, "Bad length"); return; }
            }
            if (headers.containsKey("transfer-encoding")) { reply(c, 411, null, "Length required"); return; }
            if (length < 0 || length > MAX_BODY) { reply(c, 413, null, "Too large"); return; }
            byte[] body = new byte[length];
            for (int got = 0; got < length; ) {
                int n = in.read(body, got, length - got);
                if (n < 0) return;
                got += n;
            }
            // A page in a browser can reach 127.0.0.1 too: such a request names an origin, or an unexpected host.
            String host = headers.get("host");
            boolean hostOk = host != null && (host.equals("127.0.0.1:" + McpSettings.PORT) || host.equals("localhost:" + McpSettings.PORT));
            if (headers.containsKey("origin") || !hostOk) { reply(c, 403, null, "Forbidden"); return; }
            int q = path.indexOf('?');
            if (q >= 0) path = path.substring(0, q);
            if (!path.equals("/mcp") && !path.equals("/mcp/")) { reply(c, 404, null, "Not found"); return; }
            String auth = headers.get("authorization");
            String expected = "Bearer " + McpSettings.token(app);
            if (auth == null || !MessageDigest.isEqual(auth.getBytes(UTF8), expected.getBytes(UTF8))) {
                reply(c, 401, "WWW-Authenticate: Bearer realm=\"RK Note\"", "The token is wrong. Copy it again from the RK Note settings.");
                return;
            }
            if (!McpSettings.enabled(app)) { reply(c, 503, null, "The MCP server is switched off."); return; }
            if (!method.equals("POST")) { reply(c, 405, "Allow: POST", "POST only"); return; }
            String answer = handle(app, new String(body, UTF8));
            if (answer == null) reply(c, 202, null, "");
            else reply(c, 200, "Content-Type: application/json; charset=utf-8", answer);
        } catch (Throwable e) {
            android.util.Log.w("RKMcp", "request", e);
        } finally {
            close(c);
        }
    }

    private static String readLine(InputStream in) throws IOException {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        int b;
        while ((b = in.read()) >= 0) {
            if (b == '\n') break;
            if (b != '\r') out.write(b);
            if (out.size() > 8192) throw new IOException("Line too long");
        }
        if (b < 0 && out.size() == 0) return null;
        return new String(out.toByteArray(), UTF8);
    }

    private static void reply(Socket c, int code, String header, String text) throws IOException {
        String reason;
        switch (code) {
            case 200: reason = "OK"; break;
            case 202: reason = "Accepted"; break;
            case 400: reason = "Bad Request"; break;
            case 401: reason = "Unauthorized"; break;
            case 403: reason = "Forbidden"; break;
            case 404: reason = "Not Found"; break;
            case 405: reason = "Method Not Allowed"; break;
            case 411: reason = "Length Required"; break;
            case 413: reason = "Payload Too Large"; break;
            case 503: reason = "Service Unavailable"; break;
            default: reason = "Error";
        }
        byte[] body = text == null ? new byte[0] : text.getBytes(UTF8);
        StringBuilder head = new StringBuilder("HTTP/1.1 ").append(code).append(' ').append(reason).append("\r\n");
        if (header != null) head.append(header).append("\r\n");
        else if (body.length > 0) head.append("Content-Type: text/plain; charset=utf-8\r\n");
        head.append("Content-Length: ").append(body.length).append("\r\nConnection: close\r\n\r\n");
        OutputStream out = c.getOutputStream();
        out.write(head.toString().getBytes(UTF8));
        out.write(body);
        out.flush();
    }

    private static void close(Socket c) { try { c.close(); } catch (IOException ignored) {} }

    // ───────────────────────── JSON-RPC ─────────────────────────

    /** The answer to one message, or null when it needs none (a notification). */
    private static String handle(Context app, String text) throws Exception {
        JSONObject req;
        try { req = new JSONObject(text); } catch (Exception e) { return error(JSONObject.NULL, -32700, "Parse error"); }
        String method = req.optString("method");
        if (!req.has("id")) return null;
        Object id = req.get("id");
        JSONObject params = req.optJSONObject("params");
        if (params == null) params = new JSONObject();
        try {
            JSONObject result;
            switch (method) {
                case "initialize": {
                    String asked = params.optString("protocolVersion");
                    String version = PROTOCOLS[0];
                    for (String p : PROTOCOLS) if (p.equals(asked)) version = p;
                    result = new JSONObject()
                        .put("protocolVersion", version)
                        .put("capabilities", new JSONObject().put("tools", new JSONObject().put("listChanged", false)))
                        .put("serverInfo", new JSONObject().put("name", "rk-note").put("title", "RK Note").put("version", "1.0"))
                        .put("instructions", "RK Note is the school diary (Eljur) on this phone. Tools read the lesson schedule with bell times, homework, marks and the student's own homework notes. Diary days appear only after the diary has been opened in RK Note for that week.");
                    break;
                }
                case "ping": result = new JSONObject(); break;
                case "tools/list": result = new JSONObject().put("tools", McpTools.list()); break;
                case "tools/call": {
                    JSONObject args = params.optJSONObject("arguments");
                    result = McpTools.call(app, params.optString("name"), args == null ? new JSONObject() : args);
                    break;
                }
                default: return error(id, -32601, "Method not found: " + method);
            }
            return new JSONObject().put("jsonrpc", "2.0").put("id", id).put("result", result).toString();
        } catch (Exception e) {
            android.util.Log.w("RKMcp", method, e);
            return error(id, -32603, e.getMessage() == null ? e.getClass().getSimpleName() : e.getMessage());
        }
    }

    private static String error(Object id, int code, String message) throws Exception {
        return new JSONObject().put("jsonrpc", "2.0").put("id", id).put("error", new JSONObject().put("code", code).put("message", message)).toString();
    }
}
