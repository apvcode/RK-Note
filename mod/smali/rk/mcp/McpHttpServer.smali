.class final Lrk/mcp/McpHttpServer;
.super Ljava/lang/Object;
.source "McpHttpServer.java"


# static fields
.field private static final MAX_BODY:I = 0x40000

.field private static final PROTOCOLS:[Ljava/lang/String;

.field private static final UTF8:Ljava/nio/charset/Charset;

.field private static volatile error:Ljava/lang/String;

.field private static pool:Ljava/util/concurrent/ExecutorService;

.field private static socket:Ljava/net/ServerSocket;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .line 28
    const-string v0, "UTF-8"

    invoke-static {v0}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v0

    sput-object v0, Lrk/mcp/McpHttpServer;->UTF8:Ljava/nio/charset/Charset;

    .line 29
    const-string v0, "2025-03-26"

    const-string v1, "2024-11-05"

    const-string v2, "2025-06-18"

    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lrk/mcp/McpHttpServer;->PROTOCOLS:[Ljava/lang/String;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Landroid/content/Context;Ljava/net/Socket;)V
    .registers 2

    .line 27
    invoke-static {p0, p1}, Lrk/mcp/McpHttpServer;->serve(Landroid/content/Context;Ljava/net/Socket;)V

    return-void
.end method

.method static synthetic access$100()Ljava/util/concurrent/ExecutorService;
    .registers 1

    .line 27
    sget-object v0, Lrk/mcp/McpHttpServer;->pool:Ljava/util/concurrent/ExecutorService;

    return-object v0
.end method

.method static synthetic access$200(Ljava/net/Socket;)V
    .registers 1

    .line 27
    invoke-static {p0}, Lrk/mcp/McpHttpServer;->close(Ljava/net/Socket;)V

    return-void
.end method

.method private static close(Ljava/net/Socket;)V
    .registers 1

    .line 180
    :try_start_0
    invoke-virtual {p0}, Ljava/net/Socket;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_3} :catch_4

    goto :goto_5

    :catch_4
    move-exception p0

    :goto_5
    return-void
.end method

.method static error()Ljava/lang/String;
    .registers 1

    .line 40
    sget-object v0, Lrk/mcp/McpHttpServer;->error:Ljava/lang/String;

    return-object v0
.end method

.method private static error(Ljava/lang/Object;ILjava/lang/String;)Ljava/lang/String;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 224
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    const-string v1, "jsonrpc"

    const-string v2, "2.0"

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "id"

    invoke-virtual {v0, v1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p0

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    const-string v1, "code"

    invoke-virtual {v0, v1, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object p1

    const-string v0, "message"

    invoke-virtual {p1, v0, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p1

    const-string p2, "error"

    invoke-virtual {p0, p2, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p0

    invoke-virtual {p0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static handle(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .registers 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 187
    const-string v0, "protocolVersion"

    :try_start_2
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_7} :catch_14b

    .line 188
    const-string p1, "method"

    invoke-virtual {v1, p1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 189
    const-string v2, "id"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_17

    const/4 p0, 0x0

    return-object p0

    .line 190
    :cond_17
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    .line 191
    const-string v4, "params"

    invoke-virtual {v1, v4}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    .line 192
    if-nez v1, :cond_28

    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 195
    :cond_28
    :try_start_28
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v4

    const/4 v5, 0x0

    sparse-switch v4, :sswitch_data_158

    :cond_30
    goto :goto_59

    :sswitch_31
    const-string v4, "initialize"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_30

    const/4 v4, 0x0

    goto :goto_5a

    :sswitch_3b
    const-string v4, "tools/list"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_30

    const/4 v4, 0x2

    goto :goto_5a

    :sswitch_45
    const-string v4, "tools/call"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_30

    const/4 v4, 0x3

    goto :goto_5a

    :sswitch_4f
    const-string v4, "ping"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4
    :try_end_55
    .catch Ljava/lang/Exception; {:try_start_28 .. :try_end_55} :catch_12b

    if-eqz v4, :cond_30

    const/4 v4, 0x1

    goto :goto_5a

    :goto_59
    const/4 v4, -0x1

    :goto_5a
    const-string v6, "name"

    const-string v7, "tools"

    packed-switch v4, :pswitch_data_16a

    .line 214
    :try_start_61
    new-instance p0, Ljava/lang/StringBuilder;

    goto/16 :goto_113

    .line 210
    :pswitch_65
    const-string v0, "arguments"

    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 211
    invoke-virtual {v1, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-nez v0, :cond_76

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    :cond_76
    invoke-static {p0, v1, v0}, Lrk/mcp/McpTools;->call(Landroid/content/Context;Ljava/lang/String;Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object p0

    .line 212
    goto/16 :goto_f7

    .line 208
    :pswitch_7c
    new-instance p0, Lorg/json/JSONObject;

    invoke-direct {p0}, Lorg/json/JSONObject;-><init>()V

    invoke-static {}, Lrk/mcp/McpTools;->list()Lorg/json/JSONArray;

    move-result-object v0

    invoke-virtual {p0, v7, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p0

    goto :goto_f7

    .line 207
    :pswitch_8a
    new-instance p0, Lorg/json/JSONObject;

    invoke-direct {p0}, Lorg/json/JSONObject;-><init>()V

    goto :goto_f7

    .line 197
    :pswitch_90
    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 198
    sget-object v1, Lrk/mcp/McpHttpServer;->PROTOCOLS:[Ljava/lang/String;

    aget-object v1, v1, v5

    .line 199
    sget-object v4, Lrk/mcp/McpHttpServer;->PROTOCOLS:[Ljava/lang/String;

    array-length v8, v4

    const/4 v9, 0x0

    :goto_9c
    if-ge v9, v8, :cond_aa

    aget-object v10, v4, v9

    invoke-virtual {v10, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_a7

    move-object v1, v10

    :cond_a7
    add-int/lit8 v9, v9, 0x1

    goto :goto_9c

    .line 200
    :cond_aa
    new-instance p0, Lorg/json/JSONObject;

    invoke-direct {p0}, Lorg/json/JSONObject;-><init>()V

    .line 201
    invoke-virtual {p0, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p0

    const-string v0, "capabilities"

    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    const-string v8, "listChanged"

    .line 202
    invoke-virtual {v4, v8, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    move-result-object v4

    invoke-virtual {v1, v7, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p0

    const-string v0, "serverInfo"

    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    const-string v4, "rk-note"

    .line 203
    invoke-virtual {v1, v6, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v1

    const-string v4, "title"

    const-string v5, "RK Note"

    invoke-virtual {v1, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v1

    const-string v4, "version"

    const-string v5, "1.0"

    invoke-virtual {v1, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p0

    const-string v0, "instructions"

    const-string v1, "RK Note is the school diary (Eljur) on this phone. Tools read the lesson schedule with bell times, homework, marks and the student\'s own homework notes. Diary days appear only after the diary has been opened in RK Note for that week."

    .line 204
    invoke-virtual {p0, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p0

    .line 205
    nop

    .line 216
    :goto_f7
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    const-string v1, "jsonrpc"

    const-string v4, "2.0"

    invoke-virtual {v0, v1, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "result"

    invoke-virtual {v0, v1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p0

    invoke-virtual {p0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 214
    :goto_113
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Method not found: "

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const/16 v0, -0x7f59

    invoke-static {v3, v0, p0}, Lrk/mcp/McpHttpServer;->error(Ljava/lang/Object;ILjava/lang/String;)Ljava/lang/String;

    move-result-object p0
    :try_end_12a
    .catch Ljava/lang/Exception; {:try_start_61 .. :try_end_12a} :catch_12b

    return-object p0

    .line 217
    :catch_12b
    move-exception p0

    .line 218
    const-string v0, "RKMcp"

    invoke-static {v0, p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 219
    invoke-virtual {p0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_140

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p0

    goto :goto_144

    :cond_140
    invoke-virtual {p0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p0

    :goto_144
    const/16 p1, -0x7f5b

    invoke-static {v3, p1, p0}, Lrk/mcp/McpHttpServer;->error(Ljava/lang/Object;ILjava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 187
    :catch_14b
    move-exception p0

    sget-object p0, Lorg/json/JSONObject;->NULL:Ljava/lang/Object;

    const/16 p1, -0x7fbc

    const-string v0, "Parse error"

    invoke-static {p0, p1, v0}, Lrk/mcp/McpHttpServer;->error(Ljava/lang/Object;ILjava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    nop

    :sswitch_data_158
    .sparse-switch
        0x348172 -> :sswitch_4f
        0x1db8f212 -> :sswitch_45
        0x1dbd2852 -> :sswitch_3b
        0x33ebcb90 -> :sswitch_31
    .end sparse-switch

    :pswitch_data_16a
    .packed-switch 0x0
        :pswitch_90
        :pswitch_8a
        :pswitch_7c
        :pswitch_65
    .end packed-switch
.end method

.method private static readLine(Ljava/io/InputStream;)Ljava/lang/String;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 143
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 145
    :goto_5
    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    move-result v1

    if-ltz v1, :cond_28

    .line 146
    const/16 v2, 0xa

    if-ne v1, v2, :cond_10

    goto :goto_28

    .line 147
    :cond_10
    const/16 v2, 0xd

    if-eq v1, v2, :cond_17

    invoke-virtual {v0, v1}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 148
    :cond_17
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v1

    const/16 v2, 0x2000

    if-gt v1, v2, :cond_20

    goto :goto_5

    :cond_20
    new-instance p0, Ljava/io/IOException;

    const-string v0, "Line too long"

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 150
    :cond_28
    :goto_28
    if-gez v1, :cond_32

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result p0

    if-nez p0, :cond_32

    const/4 p0, 0x0

    return-object p0

    .line 151
    :cond_32
    new-instance p0, Ljava/lang/String;

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v0

    sget-object v1, Lrk/mcp/McpHttpServer;->UTF8:Ljava/nio/charset/Charset;

    invoke-direct {p0, v0, v1}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    return-object p0
.end method

.method private static reply(Ljava/net/Socket;ILjava/lang/String;Ljava/lang/String;)V
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 156
    sparse-switch p1, :sswitch_data_84

    .line 167
    const-string v0, "Error"

    goto :goto_23

    .line 166
    :sswitch_6
    const-string v0, "Service Unavailable"

    goto :goto_23

    .line 165
    :sswitch_9
    const-string v0, "Payload Too Large"

    goto :goto_23

    .line 164
    :sswitch_c
    const-string v0, "Length Required"

    goto :goto_23

    .line 163
    :sswitch_f
    const-string v0, "Method Not Allowed"

    goto :goto_23

    .line 162
    :sswitch_12
    const-string v0, "Not Found"

    goto :goto_23

    .line 161
    :sswitch_15
    const-string v0, "Forbidden"

    goto :goto_23

    .line 160
    :sswitch_18
    const-string v0, "Unauthorized"

    goto :goto_23

    .line 159
    :sswitch_1b
    const-string v0, "Bad Request"

    goto :goto_23

    .line 158
    :sswitch_1e
    const-string v0, "Accepted"

    goto :goto_23

    .line 157
    :sswitch_21
    const-string v0, "OK"

    .line 169
    :goto_23
    if-nez p3, :cond_29

    const/4 p3, 0x0

    new-array p3, p3, [B

    goto :goto_2f

    :cond_29
    sget-object v1, Lrk/mcp/McpHttpServer;->UTF8:Ljava/nio/charset/Charset;

    invoke-virtual {p3, v1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p3

    .line 170
    :goto_2f
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "HTTP/1.1 "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const/16 v1, 0x20

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, "\r\n"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    .line 171
    if-eqz p2, :cond_54

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_5c

    .line 172
    :cond_54
    array-length p2, p3

    if-lez p2, :cond_5c

    const-string p2, "Content-Type: text/plain; charset=utf-8\r\n"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 173
    :cond_5c
    :goto_5c
    const-string p2, "Content-Length: "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    array-length v0, p3

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string v0, "\r\nConnection: close\r\n\r\n"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 174
    invoke-virtual {p0}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object p0

    .line 175
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    sget-object p2, Lrk/mcp/McpHttpServer;->UTF8:Ljava/nio/charset/Charset;

    invoke-virtual {p1, p2}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/io/OutputStream;->write([B)V

    .line 176
    invoke-virtual {p0, p3}, Ljava/io/OutputStream;->write([B)V

    .line 177
    invoke-virtual {p0}, Ljava/io/OutputStream;->flush()V

    .line 178
    return-void

    :sswitch_data_84
    .sparse-switch
        0xc8 -> :sswitch_21
        0xca -> :sswitch_1e
        0x190 -> :sswitch_1b
        0x191 -> :sswitch_18
        0x193 -> :sswitch_15
        0x194 -> :sswitch_12
        0x195 -> :sswitch_f
        0x19b -> :sswitch_c
        0x19d -> :sswitch_9
        0x1f7 -> :sswitch_6
    .end sparse-switch
.end method

.method static declared-synchronized running()Z
    .registers 2

    const-class v0, Lrk/mcp/McpHttpServer;

    monitor-enter v0

    .line 38
    :try_start_3
    sget-object v1, Lrk/mcp/McpHttpServer;->socket:Ljava/net/ServerSocket;

    if-eqz v1, :cond_11

    sget-object v1, Lrk/mcp/McpHttpServer;->socket:Ljava/net/ServerSocket;

    invoke-virtual {v1}, Ljava/net/ServerSocket;->isClosed()Z

    move-result v1
    :try_end_d
    .catchall {:try_start_3 .. :try_end_d} :catchall_14

    if-nez v1, :cond_11

    const/4 v1, 0x1

    goto :goto_12

    :cond_11
    const/4 v1, 0x0

    :goto_12
    monitor-exit v0

    return v1

    .line 38
    :catchall_14
    move-exception v1

    :try_start_15
    monitor-exit v0
    :try_end_16
    .catchall {:try_start_15 .. :try_end_16} :catchall_14

    throw v1
.end method

.method private static serve(Landroid/content/Context;Ljava/net/Socket;)V
    .registers 16

    .line 90
    const-string v0, "content-length"

    const/16 v1, 0x2710

    :try_start_4
    invoke-virtual {p1, v1}, Ljava/net/Socket;->setSoTimeout(I)V

    .line 91
    invoke-virtual {p1}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v1

    .line 92
    invoke-static {v1}, Lrk/mcp/McpHttpServer;->readLine(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v2
    :try_end_f
    .catchall {:try_start_4 .. :try_end_f} :catchall_1a6

    .line 93
    if-nez v2, :cond_15

    .line 138
    invoke-static {p1}, Lrk/mcp/McpHttpServer;->close(Ljava/net/Socket;)V

    .line 93
    return-void

    .line 94
    :cond_15
    :try_start_15
    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 95
    array-length v3, v2

    const/4 v4, 0x2

    const/16 v5, 0x190

    const/4 v6, 0x0

    if-ge v3, v4, :cond_2b

    const-string p0, "Bad request"

    invoke-static {p1, v5, v6, p0}, Lrk/mcp/McpHttpServer;->reply(Ljava/net/Socket;ILjava/lang/String;Ljava/lang/String;)V
    :try_end_27
    .catchall {:try_start_15 .. :try_end_27} :catchall_1a6

    .line 138
    invoke-static {p1}, Lrk/mcp/McpHttpServer;->close(Ljava/net/Socket;)V

    .line 95
    return-void

    .line 96
    :cond_2b
    const/4 v3, 0x0

    :try_start_2c
    aget-object v4, v2, v3

    const/4 v7, 0x1

    aget-object v2, v2, v7

    .line 97
    new-instance v8, Ljava/util/HashMap;

    invoke-direct {v8}, Ljava/util/HashMap;-><init>()V

    .line 98
    const/4 v9, 0x0

    :goto_37
    const/16 v10, 0x40

    if-ge v9, v10, :cond_72

    .line 99
    invoke-static {v1}, Lrk/mcp/McpHttpServer;->readLine(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v10
    :try_end_3f
    .catchall {:try_start_2c .. :try_end_3f} :catchall_1a6

    .line 100
    if-nez v10, :cond_45

    .line 138
    invoke-static {p1}, Lrk/mcp/McpHttpServer;->close(Ljava/net/Socket;)V

    .line 100
    return-void

    .line 101
    :cond_45
    :try_start_45
    invoke-virtual {v10}, Ljava/lang/String;->isEmpty()Z

    move-result v11

    if-eqz v11, :cond_4c

    goto :goto_72

    .line 102
    :cond_4c
    const/16 v11, 0x3a

    invoke-virtual {v10, v11}, Ljava/lang/String;->indexOf(I)I

    move-result v11

    .line 103
    if-lez v11, :cond_6f

    invoke-virtual {v10, v3, v11}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v12

    sget-object v13, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v12, v13}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v12

    add-int/lit8 v11, v11, 0x1

    invoke-virtual {v10, v11}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v10

    invoke-interface {v8, v12, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 98
    :cond_6f
    add-int/lit8 v9, v9, 0x1

    goto :goto_37

    .line 105
    :cond_72
    :goto_72
    nop

    .line 106
    invoke-interface {v8, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v9
    :try_end_77
    .catchall {:try_start_45 .. :try_end_77} :catchall_1a6

    if-eqz v9, :cond_8e

    .line 107
    :try_start_79
    invoke-interface {v8, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0
    :try_end_83
    .catch Ljava/lang/NumberFormatException; {:try_start_79 .. :try_end_83} :catch_84
    .catchall {:try_start_79 .. :try_end_83} :catchall_1a6

    goto :goto_8f

    :catch_84
    move-exception p0

    :try_start_85
    const-string p0, "Bad length"

    invoke-static {p1, v5, v6, p0}, Lrk/mcp/McpHttpServer;->reply(Ljava/net/Socket;ILjava/lang/String;Ljava/lang/String;)V
    :try_end_8a
    .catchall {:try_start_85 .. :try_end_8a} :catchall_1a6

    .line 138
    invoke-static {p1}, Lrk/mcp/McpHttpServer;->close(Ljava/net/Socket;)V

    .line 107
    return-void

    .line 106
    :cond_8e
    const/4 v0, 0x0

    .line 109
    :goto_8f
    :try_start_8f
    const-string v5, "transfer-encoding"

    invoke-interface {v8, v5}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_a2

    const-string p0, "Length required"

    const/16 v0, 0x19b

    invoke-static {p1, v0, v6, p0}, Lrk/mcp/McpHttpServer;->reply(Ljava/net/Socket;ILjava/lang/String;Ljava/lang/String;)V
    :try_end_9e
    .catchall {:try_start_8f .. :try_end_9e} :catchall_1a6

    .line 138
    invoke-static {p1}, Lrk/mcp/McpHttpServer;->close(Ljava/net/Socket;)V

    .line 109
    return-void

    .line 110
    :cond_a2
    if-ltz v0, :cond_19b

    const/high16 v5, 0x40000

    if-le v0, v5, :cond_aa

    goto/16 :goto_19b

    .line 111
    :cond_aa
    :try_start_aa
    new-array v5, v0, [B

    .line 112
    const/4 v9, 0x0

    :goto_ad
    if-ge v9, v0, :cond_bd

    .line 113
    sub-int v10, v0, v9

    invoke-virtual {v1, v5, v9, v10}, Ljava/io/InputStream;->read([BII)I

    move-result v10
    :try_end_b5
    .catchall {:try_start_aa .. :try_end_b5} :catchall_1a6

    .line 114
    if-gez v10, :cond_bb

    .line 138
    invoke-static {p1}, Lrk/mcp/McpHttpServer;->close(Ljava/net/Socket;)V

    .line 114
    return-void

    .line 115
    :cond_bb
    add-int/2addr v9, v10

    .line 116
    goto :goto_ad

    .line 118
    :cond_bd
    :try_start_bd
    const-string v0, "host"

    invoke-interface {v8, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 119
    if-eqz v0, :cond_d8

    const-string v1, "127.0.0.1:47822"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_d7

    const-string v1, "localhost:47822"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_d8

    :cond_d7
    goto :goto_d9

    :cond_d8
    const/4 v7, 0x0

    .line 120
    :goto_d9
    const-string v0, "origin"

    invoke-interface {v8, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_190

    if-nez v7, :cond_e5

    goto/16 :goto_190

    .line 121
    :cond_e5
    const/16 v0, 0x3f

    invoke-virtual {v2, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 122
    if-ltz v0, :cond_f1

    invoke-virtual {v2, v3, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 123
    :cond_f1
    const-string v0, "/mcp"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_10c

    const-string v0, "/mcp/"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_10c

    const-string p0, "Not found"

    const/16 v0, 0x194

    invoke-static {p1, v0, v6, p0}, Lrk/mcp/McpHttpServer;->reply(Ljava/net/Socket;ILjava/lang/String;Ljava/lang/String;)V
    :try_end_108
    .catchall {:try_start_bd .. :try_end_108} :catchall_1a6

    .line 138
    invoke-static {p1}, Lrk/mcp/McpHttpServer;->close(Ljava/net/Socket;)V

    .line 123
    return-void

    .line 124
    :cond_10c
    :try_start_10c
    const-string v0, "authorization"

    invoke-interface {v8, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 125
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Bearer "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {p0}, Lrk/mcp/McpSettings;->token(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 126
    if-eqz v0, :cond_183

    sget-object v2, Lrk/mcp/McpHttpServer;->UTF8:Ljava/nio/charset/Charset;

    invoke-virtual {v0, v2}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v0

    sget-object v2, Lrk/mcp/McpHttpServer;->UTF8:Ljava/nio/charset/Charset;

    invoke-virtual {v1, v2}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v1

    invoke-static {v0, v1}, Ljava/security/MessageDigest;->isEqual([B[B)Z

    move-result v0

    if-nez v0, :cond_140

    goto :goto_183

    .line 130
    :cond_140
    invoke-static {p0}, Lrk/mcp/McpSettings;->enabled(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_151

    const-string p0, "The MCP server is switched off."

    const/16 v0, 0x1f7

    invoke-static {p1, v0, v6, p0}, Lrk/mcp/McpHttpServer;->reply(Ljava/net/Socket;ILjava/lang/String;Ljava/lang/String;)V
    :try_end_14d
    .catchall {:try_start_10c .. :try_end_14d} :catchall_1a6

    .line 138
    invoke-static {p1}, Lrk/mcp/McpHttpServer;->close(Ljava/net/Socket;)V

    .line 130
    return-void

    .line 131
    :cond_151
    :try_start_151
    const-string v0, "POST"

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_166

    const-string p0, "Allow: POST"

    const-string v0, "POST only"

    const/16 v1, 0x195

    invoke-static {p1, v1, p0, v0}, Lrk/mcp/McpHttpServer;->reply(Ljava/net/Socket;ILjava/lang/String;Ljava/lang/String;)V
    :try_end_162
    .catchall {:try_start_151 .. :try_end_162} :catchall_1a6

    .line 138
    invoke-static {p1}, Lrk/mcp/McpHttpServer;->close(Ljava/net/Socket;)V

    .line 131
    return-void

    .line 132
    :cond_166
    :try_start_166
    new-instance v0, Ljava/lang/String;

    sget-object v1, Lrk/mcp/McpHttpServer;->UTF8:Ljava/nio/charset/Charset;

    invoke-direct {v0, v5, v1}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    invoke-static {p0, v0}, Lrk/mcp/McpHttpServer;->handle(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 133
    if-nez p0, :cond_17b

    const-string p0, ""

    const/16 v0, 0xca

    invoke-static {p1, v0, v6, p0}, Lrk/mcp/McpHttpServer;->reply(Ljava/net/Socket;ILjava/lang/String;Ljava/lang/String;)V

    goto :goto_1ae

    .line 134
    :cond_17b
    const-string v0, "Content-Type: application/json; charset=utf-8"

    const/16 v1, 0xc8

    invoke-static {p1, v1, v0, p0}, Lrk/mcp/McpHttpServer;->reply(Ljava/net/Socket;ILjava/lang/String;Ljava/lang/String;)V

    goto :goto_1ae

    .line 127
    :cond_183
    :goto_183
    const-string p0, "WWW-Authenticate: Bearer realm=\"RK Note\""

    const-string v0, "The token is wrong. Copy it again from the RK Note settings."

    const/16 v1, 0x191

    invoke-static {p1, v1, p0, v0}, Lrk/mcp/McpHttpServer;->reply(Ljava/net/Socket;ILjava/lang/String;Ljava/lang/String;)V
    :try_end_18c
    .catchall {:try_start_166 .. :try_end_18c} :catchall_1a6

    .line 138
    invoke-static {p1}, Lrk/mcp/McpHttpServer;->close(Ljava/net/Socket;)V

    .line 128
    return-void

    .line 120
    :cond_190
    :goto_190
    :try_start_190
    const-string p0, "Forbidden"

    const/16 v0, 0x193

    invoke-static {p1, v0, v6, p0}, Lrk/mcp/McpHttpServer;->reply(Ljava/net/Socket;ILjava/lang/String;Ljava/lang/String;)V
    :try_end_197
    .catchall {:try_start_190 .. :try_end_197} :catchall_1a6

    .line 138
    invoke-static {p1}, Lrk/mcp/McpHttpServer;->close(Ljava/net/Socket;)V

    .line 120
    return-void

    .line 110
    :cond_19b
    :goto_19b
    :try_start_19b
    const-string p0, "Too large"

    const/16 v0, 0x19d

    invoke-static {p1, v0, v6, p0}, Lrk/mcp/McpHttpServer;->reply(Ljava/net/Socket;ILjava/lang/String;Ljava/lang/String;)V
    :try_end_1a2
    .catchall {:try_start_19b .. :try_end_1a2} :catchall_1a6

    .line 138
    invoke-static {p1}, Lrk/mcp/McpHttpServer;->close(Ljava/net/Socket;)V

    .line 110
    return-void

    .line 135
    :catchall_1a6
    move-exception p0

    .line 136
    :try_start_1a7
    const-string v0, "RKMcp"

    const-string v1, "request"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_1ae
    .catchall {:try_start_1a7 .. :try_end_1ae} :catchall_1b3

    .line 138
    :goto_1ae
    invoke-static {p1}, Lrk/mcp/McpHttpServer;->close(Ljava/net/Socket;)V

    .line 139
    nop

    .line 140
    return-void

    .line 138
    :catchall_1b3
    move-exception p0

    invoke-static {p1}, Lrk/mcp/McpHttpServer;->close(Ljava/net/Socket;)V

    .line 139
    throw p0
.end method

.method static declared-synchronized start(Landroid/content/Context;)V
    .registers 8

    const-class v0, Lrk/mcp/McpHttpServer;

    monitor-enter v0

    .line 43
    :try_start_3
    invoke-static {}, Lrk/mcp/McpHttpServer;->running()Z

    move-result v1
    :try_end_7
    .catchall {:try_start_3 .. :try_end_7} :catchall_6d

    if-eqz v1, :cond_b

    monitor-exit v0

    return-void

    .line 45
    :cond_b
    :try_start_b
    new-instance v1, Ljava/net/ServerSocket;

    invoke-direct {v1}, Ljava/net/ServerSocket;-><init>()V

    .line 46
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/net/ServerSocket;->setReuseAddress(Z)V

    .line 47
    new-instance v3, Ljava/net/InetSocketAddress;

    const/4 v4, 0x4

    new-array v5, v4, [B

    fill-array-data v5, :array_70

    invoke-static {v5}, Ljava/net/InetAddress;->getByAddress([B)Ljava/net/InetAddress;

    move-result-object v5

    const v6, 0xbace

    invoke-direct {v3, v5, v6}, Ljava/net/InetSocketAddress;-><init>(Ljava/net/InetAddress;I)V

    const/16 v5, 0x8

    invoke-virtual {v1, v3, v5}, Ljava/net/ServerSocket;->bind(Ljava/net/SocketAddress;I)V

    .line 48
    sput-object v1, Lrk/mcp/McpHttpServer;->socket:Ljava/net/ServerSocket;

    .line 49
    const/4 v3, 0x0

    sput-object v3, Lrk/mcp/McpHttpServer;->error:Ljava/lang/String;

    .line 50
    new-instance v3, Lrk/mcp/McpHttpServer$1;

    invoke-direct {v3}, Lrk/mcp/McpHttpServer$1;-><init>()V

    invoke-static {v4, v3}, Ljava/util/concurrent/Executors;->newFixedThreadPool(ILjava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ExecutorService;

    move-result-object v3

    sput-object v3, Lrk/mcp/McpHttpServer;->pool:Ljava/util/concurrent/ExecutorService;

    .line 57
    new-instance v3, Ljava/lang/Thread;

    new-instance v4, Lrk/mcp/McpHttpServer$2;

    invoke-direct {v4, v1, p0}, Lrk/mcp/McpHttpServer$2;-><init>(Ljava/net/ServerSocket;Landroid/content/Context;)V

    const-string p0, "rk-mcp-accept"

    invoke-direct {v3, v4, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 73
    invoke-virtual {v3, v2}, Ljava/lang/Thread;->setDaemon(Z)V

    .line 74
    invoke-virtual {v3}, Ljava/lang/Thread;->start()V
    :try_end_4d
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_4d} :catch_4e
    .catchall {:try_start_b .. :try_end_4d} :catchall_6d

    .line 78
    goto :goto_6b

    .line 75
    :catch_4e
    move-exception p0

    .line 76
    :try_start_4f
    invoke-virtual {p0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_5e

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    goto :goto_62

    :cond_5e
    invoke-virtual {p0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v1

    :goto_62
    sput-object v1, Lrk/mcp/McpHttpServer;->error:Ljava/lang/String;

    .line 77
    const-string v1, "RKMcp"

    const-string v2, "Could not listen on port 47822"

    invoke-static {v1, v2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_6b
    .catchall {:try_start_4f .. :try_end_6b} :catchall_6d

    .line 79
    :goto_6b
    monitor-exit v0

    return-void

    .line 42
    :catchall_6d
    move-exception p0

    :try_start_6e
    monitor-exit v0
    :try_end_6f
    .catchall {:try_start_6e .. :try_end_6f} :catchall_6d

    throw p0

    :array_70
    .array-data 1
        0x7ft
        0x0t
        0x0t
        0x1t
    .end array-data
.end method

.method static declared-synchronized stop()V
    .registers 3

    const-class v0, Lrk/mcp/McpHttpServer;

    monitor-enter v0

    .line 82
    :try_start_3
    sget-object v1, Lrk/mcp/McpHttpServer;->socket:Ljava/net/ServerSocket;
    :try_end_5
    .catchall {:try_start_3 .. :try_end_5} :catchall_1e

    const/4 v2, 0x0

    if-eqz v1, :cond_11

    :try_start_8
    sget-object v1, Lrk/mcp/McpHttpServer;->socket:Ljava/net/ServerSocket;

    invoke-virtual {v1}, Ljava/net/ServerSocket;->close()V
    :try_end_d
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_d} :catch_e
    .catchall {:try_start_8 .. :try_end_d} :catchall_1e

    goto :goto_f

    :catch_e
    move-exception v1

    :goto_f
    :try_start_f
    sput-object v2, Lrk/mcp/McpHttpServer;->socket:Ljava/net/ServerSocket;

    .line 83
    :cond_11
    sget-object v1, Lrk/mcp/McpHttpServer;->pool:Ljava/util/concurrent/ExecutorService;

    if-eqz v1, :cond_1c

    sget-object v1, Lrk/mcp/McpHttpServer;->pool:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v1}, Ljava/util/concurrent/ExecutorService;->shutdownNow()Ljava/util/List;

    sput-object v2, Lrk/mcp/McpHttpServer;->pool:Ljava/util/concurrent/ExecutorService;
    :try_end_1c
    .catchall {:try_start_f .. :try_end_1c} :catchall_1e

    .line 84
    :cond_1c
    monitor-exit v0

    return-void

    .line 81
    :catchall_1e
    move-exception v1

    :try_start_1f
    monitor-exit v0
    :try_end_20
    .catchall {:try_start_1f .. :try_end_20} :catchall_1e

    throw v1
.end method
