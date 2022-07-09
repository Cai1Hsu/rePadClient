.class Lorg/jivesoftware/smackx/jingle/nat/HttpServer$HttpRequestHandler;
.super Ljava/lang/Object;
.source "HttpServer.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jivesoftware/smackx/jingle/nat/HttpServer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "HttpRequestHandler"
.end annotation


# static fields
.field static final CRLF:Ljava/lang/String; = "\r\n"


# instance fields
.field br:Ljava/io/BufferedReader;

.field input:Ljava/io/InputStream;

.field output:Ljava/io/OutputStream;

.field socket:Ljava/net/Socket;

.field final synthetic this$0:Lorg/jivesoftware/smackx/jingle/nat/HttpServer;


# direct methods
.method public constructor <init>(Lorg/jivesoftware/smackx/jingle/nat/HttpServer;Ljava/net/Socket;)V
    .locals 3
    .param p2, "socket"    # Ljava/net/Socket;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 86
    iput-object p1, p0, Lorg/jivesoftware/smackx/jingle/nat/HttpServer$HttpRequestHandler;->this$0:Lorg/jivesoftware/smackx/jingle/nat/HttpServer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 87
    iput-object p2, p0, Lorg/jivesoftware/smackx/jingle/nat/HttpServer$HttpRequestHandler;->socket:Ljava/net/Socket;

    .line 88
    invoke-virtual {p2}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    iput-object v0, p0, Lorg/jivesoftware/smackx/jingle/nat/HttpServer$HttpRequestHandler;->input:Ljava/io/InputStream;

    .line 89
    invoke-virtual {p2}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v0

    iput-object v0, p0, Lorg/jivesoftware/smackx/jingle/nat/HttpServer$HttpRequestHandler;->output:Ljava/io/OutputStream;

    .line 90
    new-instance v0, Ljava/io/BufferedReader;

    new-instance v1, Ljava/io/InputStreamReader;

    invoke-virtual {p2}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v0, v1}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    iput-object v0, p0, Lorg/jivesoftware/smackx/jingle/nat/HttpServer$HttpRequestHandler;->br:Ljava/io/BufferedReader;

    .line 91
    return-void
.end method

.method private processRequest()V
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 105
    :cond_0
    :goto_0
    iget-object v9, p0, Lorg/jivesoftware/smackx/jingle/nat/HttpServer$HttpRequestHandler;->br:Ljava/io/BufferedReader;

    invoke-virtual {v9}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v4

    .line 106
    .local v4, "headerLine":Ljava/lang/String;
    invoke-static {}, Lorg/jivesoftware/smackx/jingle/nat/HttpServer;->access$000()Lorg/jivesoftware/smackx/jingle/SmackLogger;

    move-result-object v9

    invoke-virtual {v9, v4}, Lorg/jivesoftware/smackx/jingle/SmackLogger;->debug(Ljava/lang/String;)V

    .line 107
    const-string/jumbo v9, "\r\n"

    invoke-virtual {v4, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_1

    const-string/jumbo v9, ""

    invoke-virtual {v4, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_2

    .line 138
    :cond_1
    :try_start_0
    iget-object v9, p0, Lorg/jivesoftware/smackx/jingle/nat/HttpServer$HttpRequestHandler;->output:Ljava/io/OutputStream;

    invoke-virtual {v9}, Ljava/io/OutputStream;->close()V

    .line 139
    iget-object v9, p0, Lorg/jivesoftware/smackx/jingle/nat/HttpServer$HttpRequestHandler;->br:Ljava/io/BufferedReader;

    invoke-virtual {v9}, Ljava/io/BufferedReader;->close()V

    .line 140
    iget-object v9, p0, Lorg/jivesoftware/smackx/jingle/nat/HttpServer$HttpRequestHandler;->socket:Ljava/net/Socket;

    invoke-virtual {v9}, Ljava/net/Socket;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 146
    :goto_1
    return-void

    .line 109
    :cond_2
    new-instance v5, Ljava/util/StringTokenizer;

    invoke-direct {v5, v4}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;)V

    .line 110
    .local v5, "s":Ljava/util/StringTokenizer;
    invoke-virtual {v5}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v8

    .line 112
    .local v8, "temp":Ljava/lang/String;
    const-string/jumbo v9, "GET"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_0

    .line 114
    const-string/jumbo v6, "Server: Simple httpServer"

    .line 115
    .local v6, "serverLine":Ljava/lang/String;
    const-string/jumbo v1, "text"

    .line 116
    .local v1, "contentTypeLine":Ljava/lang/String;
    const-string/jumbo v3, ""

    .line 118
    .local v3, "entityBody":Ljava/lang/String;
    const-string/jumbo v7, "HTTP/1.0 200 OK\r\n"

    .line 119
    .local v7, "statusLine":Ljava/lang/String;
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v10, "Content-Length: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    new-instance v10, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v11

    invoke-direct {v10, v11}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v10}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string/jumbo v10, "\r\n"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 121
    .local v0, "contentLengthLine":Ljava/lang/String;
    const-string/jumbo v1, "text/html"

    .line 123
    iget-object v9, p0, Lorg/jivesoftware/smackx/jingle/nat/HttpServer$HttpRequestHandler;->output:Ljava/io/OutputStream;

    invoke-virtual {v7}, Ljava/lang/String;->getBytes()[B

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/io/OutputStream;->write([B)V

    .line 125
    iget-object v9, p0, Lorg/jivesoftware/smackx/jingle/nat/HttpServer$HttpRequestHandler;->output:Ljava/io/OutputStream;

    invoke-virtual {v6}, Ljava/lang/String;->getBytes()[B

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/io/OutputStream;->write([B)V

    .line 127
    iget-object v9, p0, Lorg/jivesoftware/smackx/jingle/nat/HttpServer$HttpRequestHandler;->output:Ljava/io/OutputStream;

    invoke-virtual {v1}, Ljava/lang/String;->getBytes()[B

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/io/OutputStream;->write([B)V

    .line 128
    iget-object v9, p0, Lorg/jivesoftware/smackx/jingle/nat/HttpServer$HttpRequestHandler;->output:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/io/OutputStream;->write([B)V

    .line 130
    iget-object v9, p0, Lorg/jivesoftware/smackx/jingle/nat/HttpServer$HttpRequestHandler;->output:Ljava/io/OutputStream;

    const-string/jumbo v10, "\r\n"

    invoke-virtual {v10}, Ljava/lang/String;->getBytes()[B

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/io/OutputStream;->write([B)V

    .line 132
    iget-object v9, p0, Lorg/jivesoftware/smackx/jingle/nat/HttpServer$HttpRequestHandler;->output:Ljava/io/OutputStream;

    invoke-virtual {v3}, Ljava/lang/String;->getBytes()[B

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/io/OutputStream;->write([B)V

    goto/16 :goto_0

    .line 142
    .end local v0    # "contentLengthLine":Ljava/lang/String;
    .end local v1    # "contentTypeLine":Ljava/lang/String;
    .end local v3    # "entityBody":Ljava/lang/String;
    .end local v5    # "s":Ljava/util/StringTokenizer;
    .end local v6    # "serverLine":Ljava/lang/String;
    .end local v7    # "statusLine":Ljava/lang/String;
    .end local v8    # "temp":Ljava/lang/String;
    :catch_0
    move-exception v2

    .line 144
    .local v2, "e":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_1
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 95
    :try_start_0
    invoke-direct {p0}, Lorg/jivesoftware/smackx/jingle/nat/HttpServer$HttpRequestHandler;->processRequest()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 100
    :goto_0
    return-void

    .line 97
    :catch_0
    move-exception v0

    .line 98
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method
