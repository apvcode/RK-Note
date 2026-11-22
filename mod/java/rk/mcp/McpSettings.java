package rk.mcp;

import android.app.Activity;
import android.app.Dialog;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.os.PersistableBundle;
import android.view.View;
import android.widget.CompoundButton;
import android.widget.TextView;
import android.widget.Toast;
import java.security.SecureRandom;

/**
 * The "MCP server" switch of RK Note and everything around it: the flag, the token, starting and stopping the server.
 * The server lets an assistant on this same phone (devx) read the schedule, homework and marks. It is off until the
 * person turns it on, listens on 127.0.0.1 only and answers only to the token shown in the settings.
 */
public final class McpSettings {
    public static final String PREFS = "rk_mcp";
    public static final int PORT = 47822;

    private McpSettings() {}

    private static SharedPreferences prefs(Context c) { return c.getApplicationContext().getSharedPreferences(PREFS, 0); }

    public static boolean enabled(Context c) { return prefs(c).getBoolean("enabled", false); }

    /** The secret the assistant must send. Made once, on first use, from the system's secure random source. */
    public static synchronized String token(Context c) {
        SharedPreferences p = prefs(c);
        String t = p.getString("token", null);
        if (t == null || t.length() < 32) {
            t = newToken();
            p.edit().putString("token", t).commit();
        }
        return t;
    }

    public static synchronized String regenerate(Context c) {
        String t = newToken();
        prefs(c).edit().putString("token", t).commit();
        return t;
    }

    private static String newToken() {
        byte[] b = new byte[24];
        new SecureRandom().nextBytes(b);
        StringBuilder s = new StringBuilder("rk_");
        for (byte x : b) s.append(String.format("%02x", x));
        return s.toString();
    }

    public static void setEnabled(Context c, boolean on) {
        prefs(c).edit().putBoolean("enabled", on).commit();
        if (on) start(c); else stop(c);
    }

    /** Called when the app starts: a server that was left on comes back after the app was closed or the phone restarted. */
    public static void resume(Context c) {
        try { if (enabled(c)) start(c); } catch (Throwable ignored) { /* the app must never fail to start because of this */ }
    }

    /** The server lives in this process (no service, so no notification); McpWakeProvider brings the process back for it. */
    static void start(Context c) { McpHttpServer.start(c.getApplicationContext()); }

    static void stop(Context c) { McpHttpServer.stop(); }

    /** Fills the "MCP server" block of the settings dialog (found by tags) and wires its switch and buttons. */
    public static void bind(Dialog dialog, Activity activity) {
        try {
            if (dialog.getWindow() == null) return;
            View root = dialog.getWindow().getDecorView();
            View sw = root.findViewWithTag("rk_mcp_switch");
            final View panel = root.findViewWithTag("rk_mcp_panel");
            final TextView token = (TextView) root.findViewWithTag("rk_mcp_token");
            final TextView status = (TextView) root.findViewWithTag("rk_mcp_status");
            View copy = root.findViewWithTag("rk_mcp_copy");
            View renew = root.findViewWithTag("rk_mcp_renew");
            if (!(sw instanceof CompoundButton) || panel == null || token == null || status == null) return;
            final Context app = activity.getApplicationContext();
            final Activity host = activity;
            final CompoundButton toggle = (CompoundButton) sw;
            final Handler ui = new Handler(Looper.getMainLooper());
            final Runnable refresh = new Runnable() {
                @Override public void run() {
                    boolean on = enabled(app);
                    panel.setVisibility(on ? View.VISIBLE : View.GONE);
                    token.setText(on ? token(app) : "");
                    if (!on) return;
                    String err = McpHttpServer.error();
                    if (McpHttpServer.running()) status.setText("Работает: 127.0.0.1:" + PORT + ". Доступен только на этом телефоне.");
                    else if (err != null) status.setText("Не запустился: " + err);
                    else status.setText("Запускается…");
                }
            };
            toggle.setChecked(enabled(app));
            refresh.run();
            toggle.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
                @Override public void onCheckedChanged(CompoundButton b, boolean on) {
                    if (on == enabled(app)) return;
                    setEnabled(app, on);
                    refresh.run();
                    ui.postDelayed(refresh, 600);
                    ui.postDelayed(refresh, 1800);
                }
            });
            if (copy != null) copy.setOnClickListener(new View.OnClickListener() {
                @Override public void onClick(View v) {
                    ClipboardManager cm = (ClipboardManager) app.getSystemService(Context.CLIPBOARD_SERVICE);
                    ClipData data = ClipData.newPlainText("RK Note MCP", token(app));
                    if (Build.VERSION.SDK_INT >= 33) {
                        PersistableBundle extras = new PersistableBundle();
                        extras.putBoolean("android.content.extra.IS_SENSITIVE", true);
                        data.getDescription().setExtras(extras);
                    }
                    if (cm != null) cm.setPrimaryClip(data);
                    Toast.makeText(app, "Токен скопирован", Toast.LENGTH_SHORT).show();
                }
            });
            if (renew != null) renew.setOnClickListener(new View.OnClickListener() {
                @Override public void onClick(View v) {
                    regenerate(app);
                    refresh.run();
                    Toast.makeText(app, "Новый токен. В devx вставь его заново", Toast.LENGTH_LONG).show();
                }
            });
        } catch (Throwable e) {
            android.util.Log.e("RKMcp", "Settings block", e);
        }
    }
}
