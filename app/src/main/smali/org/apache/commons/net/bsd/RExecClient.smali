.class public Lorg/apache/commons/net/bsd/RExecClient;
.super Lorg/apache/commons/net/SocketClient;
.source "RExecClient.java"


# static fields
.field public static final DEFAULT_PORT:I = 0x200


# instance fields
.field private __remoteVerificationEnabled:Z

.field protected _errorStream_:Ljava/io/InputStream;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 116
    invoke-direct {p0}, Lorg/apache/commons/net/SocketClient;-><init>()V

    .line 117
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/commons/net/bsd/RExecClient;->_errorStream_:Ljava/io/InputStream;

    .line 118
    const/16 v0, 0x200

    invoke-virtual {p0, v0}, Lorg/apache/commons/net/bsd/RExecClient;->setDefaultPort(I)V

    .line 119
    return-void
.end method


# virtual methods
.method _createErrorStream()Ljava/io/InputStream;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 90
    iget-object v2, p0, Lorg/apache/commons/net/bsd/RExecClient;->_serverSocketFactory_:Ljavax/net/ServerSocketFactory;

    const/4 v3, 0x1

    invoke-virtual {p0}, Lorg/apache/commons/net/bsd/RExecClient;->getLocalAddress()Ljava/net/InetAddress;

    move-result-object v4

    invoke-virtual {v2, v5, v3, v4}, Ljavax/net/ServerSocketFactory;->createServerSocket(IILjava/net/InetAddress;)Ljava/net/ServerSocket;

    move-result-object v0

    .line 92
    .local v0, "server":Ljava/net/ServerSocket;
    iget-object v2, p0, Lorg/apache/commons/net/bsd/RExecClient;->_output_:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/net/ServerSocket;->getLocalPort()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->getBytes()[B

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/OutputStream;->write([B)V

    .line 93
    iget-object v2, p0, Lorg/apache/commons/net/bsd/RExecClient;->_output_:Ljava/io/OutputStream;

    invoke-virtual {v2, v5}, Ljava/io/OutputStream;->write(I)V

    .line 94
    iget-object v2, p0, Lorg/apache/commons/net/bsd/RExecClient;->_output_:Ljava/io/OutputStream;

    invoke-virtual {v2}, Ljava/io/OutputStream;->flush()V

    .line 96
    invoke-virtual {v0}, Ljava/net/ServerSocket;->accept()Ljava/net/Socket;

    move-result-object v1

    .line 97
    .local v1, "socket":Ljava/net/Socket;
    invoke-virtual {v0}, Ljava/net/ServerSocket;->close()V

    .line 99
    iget-boolean v2, p0, Lorg/apache/commons/net/bsd/RExecClient;->__remoteVerificationEnabled:Z

    if-eqz v2, :cond_0

    invoke-virtual {p0, v1}, Lorg/apache/commons/net/bsd/RExecClient;->verifyRemote(Ljava/net/Socket;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 101
    invoke-virtual {v1}, Ljava/net/Socket;->close()V

    .line 102
    new-instance v2, Ljava/io/IOException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "Security violation: unexpected connection attempt by "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Ljava/net/Socket;->getInetAddress()Ljava/net/InetAddress;

    move-result-object v4

    invoke-virtual {v4}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 107
    :cond_0
    new-instance v2, Lorg/apache/commons/net/io/SocketInputStream;

    invoke-virtual {v1}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v3

    invoke-direct {v2, v1, v3}, Lorg/apache/commons/net/io/SocketInputStream;-><init>(Ljava/net/Socket;Ljava/io/InputStream;)V

    return-object v2
.end method

.method public disconnect()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 255
    iget-object v0, p0, Lorg/apache/commons/net/bsd/RExecClient;->_errorStream_:Ljava/io/InputStream;

    if-eqz v0, :cond_0

    .line 256
    iget-object v0, p0, Lorg/apache/commons/net/bsd/RExecClient;->_errorStream_:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 258
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/commons/net/bsd/RExecClient;->_errorStream_:Ljava/io/InputStream;

    .line 259
    invoke-super {p0}, Lorg/apache/commons/net/SocketClient;->disconnect()V

    .line 260
    return-void
.end method

.method public getErrorStream()Ljava/io/InputStream;
    .locals 1

    .prologue
    .line 162
    iget-object v0, p0, Lorg/apache/commons/net/bsd/RExecClient;->_errorStream_:Ljava/io/InputStream;

    return-object v0
.end method

.method public getInputStream()Ljava/io/InputStream;
    .locals 1

    .prologue
    .line 132
    iget-object v0, p0, Lorg/apache/commons/net/bsd/RExecClient;->_input_:Ljava/io/InputStream;

    return-object v0
.end method

.method public getOutputStream()Ljava/io/OutputStream;
    .locals 1

    .prologue
    .line 146
    iget-object v0, p0, Lorg/apache/commons/net/bsd/RExecClient;->_output_:Ljava/io/OutputStream;

    return-object v0
.end method

.method public final isRemoteVerificationEnabled()Z
    .locals 1

    .prologue
    .line 286
    iget-boolean v0, p0, Lorg/apache/commons/net/bsd/RExecClient;->__remoteVerificationEnabled:Z

    return v0
.end method

.method public rexec(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "username"    # Ljava/lang/String;
    .param p2, "password"    # Ljava/lang/String;
    .param p3, "command"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 243
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Lorg/apache/commons/net/bsd/RExecClient;->rexec(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 244
    return-void
.end method

.method public rexec(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 5
    .param p1, "username"    # Ljava/lang/String;
    .param p2, "password"    # Ljava/lang/String;
    .param p3, "command"    # Ljava/lang/String;
    .param p4, "separateErrorStream"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 204
    if-eqz p4, :cond_0

    .line 206
    invoke-virtual {p0}, Lorg/apache/commons/net/bsd/RExecClient;->_createErrorStream()Ljava/io/InputStream;

    move-result-object v2

    iput-object v2, p0, Lorg/apache/commons/net/bsd/RExecClient;->_errorStream_:Ljava/io/InputStream;

    .line 213
    :goto_0
    iget-object v2, p0, Lorg/apache/commons/net/bsd/RExecClient;->_output_:Ljava/io/OutputStream;

    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/OutputStream;->write([B)V

    .line 214
    iget-object v2, p0, Lorg/apache/commons/net/bsd/RExecClient;->_output_:Ljava/io/OutputStream;

    invoke-virtual {v2, v4}, Ljava/io/OutputStream;->write(I)V

    .line 215
    iget-object v2, p0, Lorg/apache/commons/net/bsd/RExecClient;->_output_:Ljava/io/OutputStream;

    invoke-virtual {p2}, Ljava/lang/String;->getBytes()[B

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/OutputStream;->write([B)V

    .line 216
    iget-object v2, p0, Lorg/apache/commons/net/bsd/RExecClient;->_output_:Ljava/io/OutputStream;

    invoke-virtual {v2, v4}, Ljava/io/OutputStream;->write(I)V

    .line 217
    iget-object v2, p0, Lorg/apache/commons/net/bsd/RExecClient;->_output_:Ljava/io/OutputStream;

    invoke-virtual {p3}, Ljava/lang/String;->getBytes()[B

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/OutputStream;->write([B)V

    .line 218
    iget-object v2, p0, Lorg/apache/commons/net/bsd/RExecClient;->_output_:Ljava/io/OutputStream;

    invoke-virtual {v2, v4}, Ljava/io/OutputStream;->write(I)V

    .line 219
    iget-object v2, p0, Lorg/apache/commons/net/bsd/RExecClient;->_output_:Ljava/io/OutputStream;

    invoke-virtual {v2}, Ljava/io/OutputStream;->flush()V

    .line 221
    iget-object v2, p0, Lorg/apache/commons/net/bsd/RExecClient;->_input_:Ljava/io/InputStream;

    invoke-virtual {v2}, Ljava/io/InputStream;->read()I

    move-result v1

    .line 222
    .local v1, "ch":I
    if-lez v1, :cond_2

    .line 223
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 225
    .local v0, "buffer":Ljava/lang/StringBuilder;
    :goto_1
    iget-object v2, p0, Lorg/apache/commons/net/bsd/RExecClient;->_input_:Ljava/io/InputStream;

    invoke-virtual {v2}, Ljava/io/InputStream;->read()I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_1

    const/16 v2, 0xa

    if-eq v1, v2, :cond_1

    .line 226
    int-to-char v2, v1

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 210
    .end local v0    # "buffer":Ljava/lang/StringBuilder;
    .end local v1    # "ch":I
    :cond_0
    iget-object v2, p0, Lorg/apache/commons/net/bsd/RExecClient;->_output_:Ljava/io/OutputStream;

    invoke-virtual {v2, v4}, Ljava/io/OutputStream;->write(I)V

    goto :goto_0

    .line 229
    .restart local v0    # "buffer":Ljava/lang/StringBuilder;
    .restart local v1    # "ch":I
    :cond_1
    new-instance v2, Ljava/io/IOException;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 230
    .end local v0    # "buffer":Ljava/lang/StringBuilder;
    :cond_2
    if-gez v1, :cond_3

    .line 231
    new-instance v2, Ljava/io/IOException;

    const-string/jumbo v3, "Server closed connection."

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 233
    :cond_3
    return-void
.end method

.method public final setRemoteVerificationEnabled(Z)V
    .locals 0
    .param p1, "enable"    # Z

    .prologue
    .line 274
    iput-boolean p1, p0, Lorg/apache/commons/net/bsd/RExecClient;->__remoteVerificationEnabled:Z

    .line 275
    return-void
.end method
