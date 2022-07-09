.class public Lorg/apache/commons/net/ftp/FTPHTTPClient;
.super Lorg/apache/commons/net/ftp/FTPClient;
.source "FTPHTTPClient.java"


# static fields
.field private static final CRLF:[B


# instance fields
.field private final base64:Lorg/apache/commons/net/util/Base64;

.field private final proxyHost:Ljava/lang/String;

.field private final proxyPassword:Ljava/lang/String;

.field private final proxyPort:I

.field private final proxyUsername:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 45
    const/4 v0, 0x2

    new-array v0, v0, [B

    fill-array-data v0, :array_0

    sput-object v0, Lorg/apache/commons/net/ftp/FTPHTTPClient;->CRLF:[B

    return-void

    nop

    :array_0
    .array-data 1
        0xdt
        0xat
    .end array-data
.end method

.method public constructor <init>(Ljava/lang/String;I)V
    .locals 1
    .param p1, "proxyHost"    # Ljava/lang/String;
    .param p2, "proxyPort"    # I

    .prologue
    const/4 v0, 0x0

    .line 56
    invoke-direct {p0, p1, p2, v0, v0}, Lorg/apache/commons/net/ftp/FTPHTTPClient;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    .line 57
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "proxyHost"    # Ljava/lang/String;
    .param p2, "proxyPort"    # I
    .param p3, "proxyUser"    # Ljava/lang/String;
    .param p4, "proxyPass"    # Ljava/lang/String;

    .prologue
    .line 48
    invoke-direct {p0}, Lorg/apache/commons/net/ftp/FTPClient;-><init>()V

    .line 46
    new-instance v0, Lorg/apache/commons/net/util/Base64;

    invoke-direct {v0}, Lorg/apache/commons/net/util/Base64;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/net/ftp/FTPHTTPClient;->base64:Lorg/apache/commons/net/util/Base64;

    .line 49
    iput-object p1, p0, Lorg/apache/commons/net/ftp/FTPHTTPClient;->proxyHost:Ljava/lang/String;

    .line 50
    iput p2, p0, Lorg/apache/commons/net/ftp/FTPHTTPClient;->proxyPort:I

    .line 51
    iput-object p3, p0, Lorg/apache/commons/net/ftp/FTPHTTPClient;->proxyUsername:Ljava/lang/String;

    .line 52
    iput-object p4, p0, Lorg/apache/commons/net/ftp/FTPHTTPClient;->proxyPassword:Ljava/lang/String;

    .line 53
    return-void
.end method

.method private tunnelHandshake(Ljava/lang/String;ILjava/io/InputStream;Ljava/io/OutputStream;)V
    .locals 16
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "port"    # I
    .param p3, "input"    # Ljava/io/InputStream;
    .param p4, "output"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .prologue
    .line 138
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v14, "CONNECT "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    move-object/from16 v0, p1

    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string/jumbo v14, ":"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    move/from16 v0, p2

    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string/jumbo v14, " HTTP/1.1"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 139
    .local v3, "connectString":Ljava/lang/String;
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v14, "Host: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    move-object/from16 v0, p1

    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string/jumbo v14, ":"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    move/from16 v0, p2

    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 141
    .local v5, "hostString":Ljava/lang/String;
    const-string/jumbo v13, "UTF-8"

    invoke-virtual {v3, v13}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v13

    move-object/from16 v0, p4

    invoke-virtual {v0, v13}, Ljava/io/OutputStream;->write([B)V

    .line 142
    sget-object v13, Lorg/apache/commons/net/ftp/FTPHTTPClient;->CRLF:[B

    move-object/from16 v0, p4

    invoke-virtual {v0, v13}, Ljava/io/OutputStream;->write([B)V

    .line 143
    const-string/jumbo v13, "UTF-8"

    invoke-virtual {v5, v13}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v13

    move-object/from16 v0, p4

    invoke-virtual {v0, v13}, Ljava/io/OutputStream;->write([B)V

    .line 144
    sget-object v13, Lorg/apache/commons/net/ftp/FTPHTTPClient;->CRLF:[B

    move-object/from16 v0, p4

    invoke-virtual {v0, v13}, Ljava/io/OutputStream;->write([B)V

    .line 146
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/apache/commons/net/ftp/FTPHTTPClient;->proxyUsername:Ljava/lang/String;

    if-eqz v13, :cond_0

    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/apache/commons/net/ftp/FTPHTTPClient;->proxyPassword:Ljava/lang/String;

    if-eqz v13, :cond_0

    .line 147
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/apache/commons/net/ftp/FTPHTTPClient;->proxyUsername:Ljava/lang/String;

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string/jumbo v14, ":"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/apache/commons/net/ftp/FTPHTTPClient;->proxyPassword:Ljava/lang/String;

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 148
    .local v1, "auth":Ljava/lang/String;
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v14, "Proxy-Authorization: Basic "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/apache/commons/net/ftp/FTPHTTPClient;->base64:Lorg/apache/commons/net/util/Base64;

    const-string/jumbo v15, "UTF-8"

    invoke-virtual {v1, v15}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v15

    invoke-virtual {v14, v15}, Lorg/apache/commons/net/util/Base64;->encodeToString([B)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 150
    .local v4, "header":Ljava/lang/String;
    const-string/jumbo v13, "UTF-8"

    invoke-virtual {v4, v13}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v13

    move-object/from16 v0, p4

    invoke-virtual {v0, v13}, Ljava/io/OutputStream;->write([B)V

    .line 152
    .end local v1    # "auth":Ljava/lang/String;
    .end local v4    # "header":Ljava/lang/String;
    :cond_0
    sget-object v13, Lorg/apache/commons/net/ftp/FTPHTTPClient;->CRLF:[B

    move-object/from16 v0, p4

    invoke-virtual {v0, v13}, Ljava/io/OutputStream;->write([B)V

    .line 154
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    .line 155
    .local v11, "response":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    new-instance v9, Ljava/io/BufferedReader;

    new-instance v13, Ljava/io/InputStreamReader;

    move-object/from16 v0, p3

    invoke-direct {v13, v0}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v9, v13}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 158
    .local v9, "reader":Ljava/io/BufferedReader;
    invoke-virtual {v9}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v7

    .line 159
    .local v7, "line":Ljava/lang/String;
    :goto_0
    if-eqz v7, :cond_1

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v13

    if-lez v13, :cond_1

    .line 160
    invoke-interface {v11, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 159
    invoke-virtual {v9}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v7

    goto :goto_0

    .line 163
    :cond_1
    invoke-interface {v11}, Ljava/util/List;->size()I

    move-result v12

    .line 164
    .local v12, "size":I
    if-nez v12, :cond_2

    .line 165
    new-instance v13, Ljava/io/IOException;

    const-string/jumbo v14, "No response from proxy"

    invoke-direct {v13, v14}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v13

    .line 168
    :cond_2
    const/4 v2, 0x0

    .line 169
    .local v2, "code":Ljava/lang/String;
    const/4 v13, 0x0

    invoke-interface {v11, v13}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    .line 170
    .local v10, "resp":Ljava/lang/String;
    const-string/jumbo v13, "HTTP/"

    invoke-virtual {v10, v13}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_3

    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v13

    const/16 v14, 0xc

    if-lt v13, v14, :cond_3

    .line 171
    const/16 v13, 0x9

    const/16 v14, 0xc

    invoke-virtual {v10, v13, v14}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 176
    const-string/jumbo v13, "200"

    invoke-virtual {v13, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_5

    .line 177
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    .line 178
    .local v8, "msg":Ljava/lang/StringBuilder;
    const-string/jumbo v13, "HTTPTunnelConnector: connection failed\r\n"

    invoke-virtual {v8, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 179
    const-string/jumbo v13, "Response received from the proxy:\r\n"

    invoke-virtual {v8, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 180
    invoke-interface {v11}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .local v6, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_4

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    .end local v7    # "line":Ljava/lang/String;
    check-cast v7, Ljava/lang/String;

    .line 181
    .restart local v7    # "line":Ljava/lang/String;
    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 182
    const-string/jumbo v13, "\r\n"

    invoke-virtual {v8, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 173
    .end local v6    # "i$":Ljava/util/Iterator;
    .end local v8    # "msg":Ljava/lang/StringBuilder;
    :cond_3
    new-instance v13, Ljava/io/IOException;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v15, "Invalid response from proxy: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-direct {v13, v14}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v13

    .line 184
    .restart local v6    # "i$":Ljava/util/Iterator;
    .restart local v8    # "msg":Ljava/lang/StringBuilder;
    :cond_4
    new-instance v13, Ljava/io/IOException;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-direct {v13, v14}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v13

    .line 186
    .end local v6    # "i$":Ljava/util/Iterator;
    .end local v8    # "msg":Ljava/lang/StringBuilder;
    :cond_5
    return-void
.end method


# virtual methods
.method protected _openDataConnection_(ILjava/lang/String;)Ljava/net/Socket;
    .locals 1
    .param p1, "command"    # I
    .param p2, "arg"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 70
    invoke-super {p0, p1, p2}, Lorg/apache/commons/net/ftp/FTPClient;->_openDataConnection_(ILjava/lang/String;)Ljava/net/Socket;

    move-result-object v0

    return-object v0
.end method

.method protected _openDataConnection_(Ljava/lang/String;Ljava/lang/String;)Ljava/net/Socket;
    .locals 12
    .param p1, "command"    # Ljava/lang/String;
    .param p2, "arg"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    const/4 v6, 0x0

    .line 82
    invoke-virtual {p0}, Lorg/apache/commons/net/ftp/FTPHTTPClient;->getDataConnectionMode()I

    move-result v7

    const/4 v8, 0x2

    if-eq v7, v8, :cond_0

    .line 83
    new-instance v5, Ljava/lang/IllegalStateException;

    const-string/jumbo v6, "Only passive connection mode supported"

    invoke-direct {v5, v6}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 86
    :cond_0
    invoke-virtual {p0}, Lorg/apache/commons/net/ftp/FTPHTTPClient;->getRemoteAddress()Ljava/net/InetAddress;

    move-result-object v7

    instance-of v2, v7, Ljava/net/Inet6Address;

    .line 88
    .local v2, "isInet6Address":Z
    invoke-virtual {p0}, Lorg/apache/commons/net/ftp/FTPHTTPClient;->isUseEPSVwithIPv4()Z

    move-result v7

    if-nez v7, :cond_1

    if-eqz v2, :cond_3

    :cond_1
    const/4 v0, 0x1

    .line 89
    .local v0, "attemptEPSV":Z
    :goto_0
    if-eqz v0, :cond_4

    invoke-virtual {p0}, Lorg/apache/commons/net/ftp/FTPHTTPClient;->epsv()I

    move-result v7

    const/16 v8, 0xe5

    if-ne v7, v8, :cond_4

    .line 90
    iget-object v7, p0, Lorg/apache/commons/net/ftp/FTPHTTPClient;->_replyLines:Ljava/util/ArrayList;

    invoke-virtual {v7, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {p0, v5}, Lorg/apache/commons/net/ftp/FTPHTTPClient;->_parseExtendedPassiveModeReply(Ljava/lang/String;)V

    .line 102
    :goto_1
    new-instance v4, Ljava/net/Socket;

    iget-object v5, p0, Lorg/apache/commons/net/ftp/FTPHTTPClient;->proxyHost:Ljava/lang/String;

    iget v7, p0, Lorg/apache/commons/net/ftp/FTPHTTPClient;->proxyPort:I

    invoke-direct {v4, v5, v7}, Ljava/net/Socket;-><init>(Ljava/lang/String;I)V

    .line 103
    .local v4, "socket":Ljava/net/Socket;
    invoke-virtual {v4}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v1

    .line 104
    .local v1, "is":Ljava/io/InputStream;
    invoke-virtual {v4}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v3

    .line 105
    .local v3, "os":Ljava/io/OutputStream;
    invoke-virtual {p0}, Lorg/apache/commons/net/ftp/FTPHTTPClient;->getPassiveHost()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0}, Lorg/apache/commons/net/ftp/FTPHTTPClient;->getPassivePort()I

    move-result v7

    invoke-direct {p0, v5, v7, v1, v3}, Lorg/apache/commons/net/ftp/FTPHTTPClient;->tunnelHandshake(Ljava/lang/String;ILjava/io/InputStream;Ljava/io/OutputStream;)V

    .line 106
    invoke-virtual {p0}, Lorg/apache/commons/net/ftp/FTPHTTPClient;->getRestartOffset()J

    move-result-wide v8

    const-wide/16 v10, 0x0

    cmp-long v5, v8, v10

    if-lez v5, :cond_7

    invoke-virtual {p0}, Lorg/apache/commons/net/ftp/FTPHTTPClient;->getRestartOffset()J

    move-result-wide v8

    invoke-virtual {p0, v8, v9}, Lorg/apache/commons/net/ftp/FTPHTTPClient;->restart(J)Z

    move-result v5

    if-nez v5, :cond_7

    .line 107
    invoke-virtual {v4}, Ljava/net/Socket;->close()V

    move-object v4, v6

    .line 116
    .end local v1    # "is":Ljava/io/InputStream;
    .end local v3    # "os":Ljava/io/OutputStream;
    .end local v4    # "socket":Ljava/net/Socket;
    :cond_2
    :goto_2
    return-object v4

    .end local v0    # "attemptEPSV":Z
    :cond_3
    move v0, v5

    .line 88
    goto :goto_0

    .line 92
    .restart local v0    # "attemptEPSV":Z
    :cond_4
    if-eqz v2, :cond_5

    move-object v4, v6

    .line 93
    goto :goto_2

    .line 96
    :cond_5
    invoke-virtual {p0}, Lorg/apache/commons/net/ftp/FTPHTTPClient;->pasv()I

    move-result v7

    const/16 v8, 0xe3

    if-eq v7, v8, :cond_6

    move-object v4, v6

    .line 97
    goto :goto_2

    .line 99
    :cond_6
    iget-object v7, p0, Lorg/apache/commons/net/ftp/FTPHTTPClient;->_replyLines:Ljava/util/ArrayList;

    invoke-virtual {v7, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {p0, v5}, Lorg/apache/commons/net/ftp/FTPHTTPClient;->_parsePassiveModeReply(Ljava/lang/String;)V

    goto :goto_1

    .line 111
    .restart local v1    # "is":Ljava/io/InputStream;
    .restart local v3    # "os":Ljava/io/OutputStream;
    .restart local v4    # "socket":Ljava/net/Socket;
    :cond_7
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/net/ftp/FTPHTTPClient;->sendCommand(Ljava/lang/String;Ljava/lang/String;)I

    move-result v5

    invoke-static {v5}, Lorg/apache/commons/net/ftp/FTPReply;->isPositivePreliminary(I)Z

    move-result v5

    if-nez v5, :cond_2

    .line 112
    invoke-virtual {v4}, Ljava/net/Socket;->close()V

    move-object v4, v6

    .line 113
    goto :goto_2
.end method

.method public connect(Ljava/lang/String;I)V
    .locals 5
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "port"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/SocketException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 122
    new-instance v2, Ljava/net/Socket;

    iget-object v3, p0, Lorg/apache/commons/net/ftp/FTPHTTPClient;->proxyHost:Ljava/lang/String;

    iget v4, p0, Lorg/apache/commons/net/ftp/FTPHTTPClient;->proxyPort:I

    invoke-direct {v2, v3, v4}, Ljava/net/Socket;-><init>(Ljava/lang/String;I)V

    iput-object v2, p0, Lorg/apache/commons/net/ftp/FTPHTTPClient;->_socket_:Ljava/net/Socket;

    .line 123
    iget-object v2, p0, Lorg/apache/commons/net/ftp/FTPHTTPClient;->_socket_:Ljava/net/Socket;

    invoke-virtual {v2}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v2

    iput-object v2, p0, Lorg/apache/commons/net/ftp/FTPHTTPClient;->_input_:Ljava/io/InputStream;

    .line 124
    iget-object v2, p0, Lorg/apache/commons/net/ftp/FTPHTTPClient;->_socket_:Ljava/net/Socket;

    invoke-virtual {v2}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v2

    iput-object v2, p0, Lorg/apache/commons/net/ftp/FTPHTTPClient;->_output_:Ljava/io/OutputStream;

    .line 126
    :try_start_0
    iget-object v2, p0, Lorg/apache/commons/net/ftp/FTPHTTPClient;->_input_:Ljava/io/InputStream;

    iget-object v3, p0, Lorg/apache/commons/net/ftp/FTPHTTPClient;->_output_:Ljava/io/OutputStream;

    invoke-direct {p0, p1, p2, v2, v3}, Lorg/apache/commons/net/ftp/FTPHTTPClient;->tunnelHandshake(Ljava/lang/String;ILjava/io/InputStream;Ljava/io/OutputStream;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 133
    invoke-super {p0}, Lorg/apache/commons/net/ftp/FTPClient;->_connectAction_()V

    .line 134
    return-void

    .line 128
    :catch_0
    move-exception v0

    .line 129
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Ljava/io/IOException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Could not connect to "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, " using port "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 130
    .local v1, "ioe":Ljava/io/IOException;
    invoke-virtual {v1, v0}, Ljava/io/IOException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 131
    throw v1
.end method
