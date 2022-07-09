.class public Lcom/edutech/cloudclientsetting/activity/SSLSocketFactoryExtended;
.super Ljavax/net/ssl/SSLSocketFactory;
.source "SSLSocketFactoryExtended.java"


# instance fields
.field private mCiphers:[Ljava/lang/String;

.field private mProtocols:[Ljava/lang/String;

.field private mSSLContext:Ljavax/net/ssl/SSLContext;


# direct methods
.method public constructor <init>()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchAlgorithmException;,
            Ljava/security/KeyManagementException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 30
    invoke-direct {p0}, Ljavax/net/ssl/SSLSocketFactory;-><init>()V

    .line 32
    invoke-direct {p0, v0, v0, v0}, Lcom/edutech/cloudclientsetting/activity/SSLSocketFactoryExtended;->initSSLSocketFactoryEx([Ljavax/net/ssl/KeyManager;[Ljavax/net/ssl/TrustManager;Ljava/security/SecureRandom;)V

    .line 33
    return-void
.end method

.method private initSSLSocketFactoryEx([Ljavax/net/ssl/KeyManager;[Ljavax/net/ssl/TrustManager;Ljava/security/SecureRandom;)V
    .locals 4
    .param p1, "km"    # [Ljavax/net/ssl/KeyManager;
    .param p2, "tm"    # [Ljavax/net/ssl/TrustManager;
    .param p3, "random"    # Ljava/security/SecureRandom;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchAlgorithmException;,
            Ljava/security/KeyManagementException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 103
    const-string/jumbo v1, "TLS"

    invoke-static {v1}, Ljavax/net/ssl/SSLContext;->getInstance(Ljava/lang/String;)Ljavax/net/ssl/SSLContext;

    move-result-object v1

    iput-object v1, p0, Lcom/edutech/cloudclientsetting/activity/SSLSocketFactoryExtended;->mSSLContext:Ljavax/net/ssl/SSLContext;

    .line 104
    const/4 v1, 0x1

    new-array v0, v1, [Ljavax/net/ssl/TrustManager;

    const/4 v1, 0x0

    new-instance v2, Lcom/edutech/cloudclientsetting/activity/SSLSocketFactoryExtended$1;

    invoke-direct {v2, p0}, Lcom/edutech/cloudclientsetting/activity/SSLSocketFactoryExtended$1;-><init>(Lcom/edutech/cloudclientsetting/activity/SSLSocketFactoryExtended;)V

    aput-object v2, v0, v1

    .line 118
    .local v0, "trustAllCerts":[Ljavax/net/ssl/TrustManager;
    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/SSLSocketFactoryExtended;->mSSLContext:Ljavax/net/ssl/SSLContext;

    invoke-virtual {v1, v3, v0, v3}, Ljavax/net/ssl/SSLContext;->init([Ljavax/net/ssl/KeyManager;[Ljavax/net/ssl/TrustManager;Ljava/security/SecureRandom;)V

    .line 120
    invoke-virtual {p0}, Lcom/edutech/cloudclientsetting/activity/SSLSocketFactoryExtended;->GetProtocolList()[Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/edutech/cloudclientsetting/activity/SSLSocketFactoryExtended;->mProtocols:[Ljava/lang/String;

    .line 121
    invoke-virtual {p0}, Lcom/edutech/cloudclientsetting/activity/SSLSocketFactoryExtended;->GetCipherList()[Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/edutech/cloudclientsetting/activity/SSLSocketFactoryExtended;->mCiphers:[Ljava/lang/String;

    .line 122
    return-void
.end method


# virtual methods
.method protected GetCipherList()[Ljava/lang/String;
    .locals 7

    .prologue
    .line 164
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 165
    .local v1, "resultList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    iget-object v3, p0, Lcom/edutech/cloudclientsetting/activity/SSLSocketFactoryExtended;->mSSLContext:Ljavax/net/ssl/SSLContext;

    invoke-virtual {v3}, Ljavax/net/ssl/SSLContext;->getSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v0

    .line 166
    .local v0, "factory":Ljavax/net/ssl/SSLSocketFactory;
    invoke-virtual {v0}, Ljavax/net/ssl/SSLSocketFactory;->getSupportedCipherSuites()[Ljava/lang/String;

    move-result-object v4

    array-length v5, v4

    const/4 v3, 0x0

    :goto_0
    if-lt v3, v5, :cond_0

    .line 173
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v3

    new-array v3, v3, [Ljava/lang/String;

    invoke-interface {v1, v3}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Ljava/lang/String;

    return-object v3

    .line 166
    :cond_0
    aget-object v2, v4, v3

    .line 167
    .local v2, "s":Ljava/lang/String;
    const-string/jumbo v6, "CipherSuite type = "

    invoke-static {v6, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 168
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 166
    add-int/lit8 v3, v3, 0x1

    goto :goto_0
.end method

.method protected GetProtocolList()[Ljava/lang/String;
    .locals 12

    .prologue
    const/4 v10, 0x1

    const/4 v11, 0x0

    .line 126
    const/4 v9, 0x4

    new-array v6, v9, [Ljava/lang/String;

    const-string/jumbo v9, "TLSv1"

    aput-object v9, v6, v11

    const-string/jumbo v9, "TLSv1.1"

    aput-object v9, v6, v10

    const/4 v9, 0x2

    const-string/jumbo v10, "TLSv1.2"

    aput-object v10, v6, v9

    const/4 v9, 0x3

    const-string/jumbo v10, "TLSv1.3"

    aput-object v10, v6, v9

    .line 127
    .local v6, "protocols":[Ljava/lang/String;
    const/4 v1, 0x0

    .line 129
    .local v1, "availableProtocols":[Ljava/lang/String;
    const/4 v8, 0x0

    .line 133
    .local v8, "socket":Ljavax/net/ssl/SSLSocket;
    :try_start_0
    iget-object v9, p0, Lcom/edutech/cloudclientsetting/activity/SSLSocketFactoryExtended;->mSSLContext:Ljavax/net/ssl/SSLContext;

    invoke-virtual {v9}, Ljavax/net/ssl/SSLContext;->getSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v3

    .line 134
    .local v3, "factory":Ljavax/net/ssl/SSLSocketFactory;
    invoke-virtual {v3}, Ljavax/net/ssl/SSLSocketFactory;->createSocket()Ljava/net/Socket;

    move-result-object v9

    move-object v0, v9

    check-cast v0, Ljavax/net/ssl/SSLSocket;

    move-object v8, v0

    .line 136
    invoke-virtual {v8}, Ljavax/net/ssl/SSLSocket;->getSupportedProtocols()[Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    .line 144
    if-eqz v8, :cond_0

    .line 146
    :try_start_1
    invoke-virtual {v8}, Ljavax/net/ssl/SSLSocket;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_3

    .line 151
    :cond_0
    :goto_0
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 152
    .local v7, "resultList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_1
    array-length v9, v6

    if-lt v4, v9, :cond_3

    .line 159
    new-array v9, v11, [Ljava/lang/String;

    invoke-interface {v7, v9}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v9

    check-cast v9, [Ljava/lang/String;

    .end local v3    # "factory":Ljavax/net/ssl/SSLSocketFactory;
    .end local v4    # "i":I
    .end local v7    # "resultList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_1
    :goto_2
    return-object v9

    .line 138
    :catch_0
    move-exception v2

    .line 140
    .local v2, "e":Ljava/lang/Exception;
    const/4 v9, 0x1

    :try_start_2
    new-array v9, v9, [Ljava/lang/String;

    const/4 v10, 0x0

    const-string/jumbo v11, "TLSv1"

    aput-object v11, v9, v10
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 144
    if-eqz v8, :cond_1

    .line 146
    :try_start_3
    invoke-virtual {v8}, Ljavax/net/ssl/SSLSocket;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1

    goto :goto_2

    .line 147
    :catch_1
    move-exception v10

    goto :goto_2

    .line 143
    .end local v2    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v9

    .line 144
    if-eqz v8, :cond_2

    .line 146
    :try_start_4
    invoke-virtual {v8}, Ljavax/net/ssl/SSLSocket;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2

    .line 149
    :cond_2
    :goto_3
    throw v9

    .line 154
    .restart local v3    # "factory":Ljavax/net/ssl/SSLSocketFactory;
    .restart local v4    # "i":I
    .restart local v7    # "resultList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_3
    aget-object v9, v6, v4

    invoke-static {v1, v9}, Ljava/util/Arrays;->binarySearch([Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v5

    .line 155
    .local v5, "idx":I
    if-ltz v5, :cond_4

    .line 156
    aget-object v9, v6, v4

    invoke-interface {v7, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 152
    :cond_4
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 147
    .end local v3    # "factory":Ljavax/net/ssl/SSLSocketFactory;
    .end local v4    # "i":I
    .end local v5    # "idx":I
    .end local v7    # "resultList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :catch_2
    move-exception v10

    goto :goto_3

    .restart local v3    # "factory":Ljavax/net/ssl/SSLSocketFactory;
    :catch_3
    move-exception v9

    goto :goto_0
.end method

.method public createSocket(Ljava/lang/String;I)Ljava/net/Socket;
    .locals 3
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "port"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 91
    iget-object v2, p0, Lcom/edutech/cloudclientsetting/activity/SSLSocketFactoryExtended;->mSSLContext:Ljavax/net/ssl/SSLContext;

    invoke-virtual {v2}, Ljavax/net/ssl/SSLContext;->getSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v0

    .line 92
    .local v0, "factory":Ljavax/net/ssl/SSLSocketFactory;
    invoke-virtual {v0, p1, p2}, Ljavax/net/ssl/SSLSocketFactory;->createSocket(Ljava/lang/String;I)Ljava/net/Socket;

    move-result-object v1

    check-cast v1, Ljavax/net/ssl/SSLSocket;

    .line 94
    .local v1, "ss":Ljavax/net/ssl/SSLSocket;
    iget-object v2, p0, Lcom/edutech/cloudclientsetting/activity/SSLSocketFactoryExtended;->mProtocols:[Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljavax/net/ssl/SSLSocket;->setEnabledProtocols([Ljava/lang/String;)V

    .line 95
    iget-object v2, p0, Lcom/edutech/cloudclientsetting/activity/SSLSocketFactoryExtended;->mCiphers:[Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljavax/net/ssl/SSLSocket;->setEnabledCipherSuites([Ljava/lang/String;)V

    .line 97
    return-object v1
.end method

.method public createSocket(Ljava/lang/String;ILjava/net/InetAddress;I)Ljava/net/Socket;
    .locals 3
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "port"    # I
    .param p3, "localHost"    # Ljava/net/InetAddress;
    .param p4, "localPort"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 69
    iget-object v2, p0, Lcom/edutech/cloudclientsetting/activity/SSLSocketFactoryExtended;->mSSLContext:Ljavax/net/ssl/SSLContext;

    invoke-virtual {v2}, Ljavax/net/ssl/SSLContext;->getSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v0

    .line 70
    .local v0, "factory":Ljavax/net/ssl/SSLSocketFactory;
    invoke-virtual {v0, p1, p2, p3, p4}, Ljavax/net/ssl/SSLSocketFactory;->createSocket(Ljava/lang/String;ILjava/net/InetAddress;I)Ljava/net/Socket;

    move-result-object v1

    check-cast v1, Ljavax/net/ssl/SSLSocket;

    .line 72
    .local v1, "ss":Ljavax/net/ssl/SSLSocket;
    iget-object v2, p0, Lcom/edutech/cloudclientsetting/activity/SSLSocketFactoryExtended;->mProtocols:[Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljavax/net/ssl/SSLSocket;->setEnabledProtocols([Ljava/lang/String;)V

    .line 73
    iget-object v2, p0, Lcom/edutech/cloudclientsetting/activity/SSLSocketFactoryExtended;->mCiphers:[Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljavax/net/ssl/SSLSocket;->setEnabledCipherSuites([Ljava/lang/String;)V

    .line 75
    return-object v1
.end method

.method public createSocket(Ljava/net/InetAddress;I)Ljava/net/Socket;
    .locals 3
    .param p1, "host"    # Ljava/net/InetAddress;
    .param p2, "port"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 80
    iget-object v2, p0, Lcom/edutech/cloudclientsetting/activity/SSLSocketFactoryExtended;->mSSLContext:Ljavax/net/ssl/SSLContext;

    invoke-virtual {v2}, Ljavax/net/ssl/SSLContext;->getSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v0

    .line 81
    .local v0, "factory":Ljavax/net/ssl/SSLSocketFactory;
    invoke-virtual {v0, p1, p2}, Ljavax/net/ssl/SSLSocketFactory;->createSocket(Ljava/net/InetAddress;I)Ljava/net/Socket;

    move-result-object v1

    check-cast v1, Ljavax/net/ssl/SSLSocket;

    .line 83
    .local v1, "ss":Ljavax/net/ssl/SSLSocket;
    iget-object v2, p0, Lcom/edutech/cloudclientsetting/activity/SSLSocketFactoryExtended;->mProtocols:[Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljavax/net/ssl/SSLSocket;->setEnabledProtocols([Ljava/lang/String;)V

    .line 84
    iget-object v2, p0, Lcom/edutech/cloudclientsetting/activity/SSLSocketFactoryExtended;->mCiphers:[Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljavax/net/ssl/SSLSocket;->setEnabledCipherSuites([Ljava/lang/String;)V

    .line 86
    return-object v1
.end method

.method public createSocket(Ljava/net/InetAddress;ILjava/net/InetAddress;I)Ljava/net/Socket;
    .locals 3
    .param p1, "address"    # Ljava/net/InetAddress;
    .param p2, "port"    # I
    .param p3, "localAddress"    # Ljava/net/InetAddress;
    .param p4, "localPort"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 58
    iget-object v2, p0, Lcom/edutech/cloudclientsetting/activity/SSLSocketFactoryExtended;->mSSLContext:Ljavax/net/ssl/SSLContext;

    invoke-virtual {v2}, Ljavax/net/ssl/SSLContext;->getSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v0

    .line 59
    .local v0, "factory":Ljavax/net/ssl/SSLSocketFactory;
    invoke-virtual {v0, p1, p2, p3, p4}, Ljavax/net/ssl/SSLSocketFactory;->createSocket(Ljava/net/InetAddress;ILjava/net/InetAddress;I)Ljava/net/Socket;

    move-result-object v1

    check-cast v1, Ljavax/net/ssl/SSLSocket;

    .line 61
    .local v1, "ss":Ljavax/net/ssl/SSLSocket;
    iget-object v2, p0, Lcom/edutech/cloudclientsetting/activity/SSLSocketFactoryExtended;->mProtocols:[Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljavax/net/ssl/SSLSocket;->setEnabledProtocols([Ljava/lang/String;)V

    .line 62
    iget-object v2, p0, Lcom/edutech/cloudclientsetting/activity/SSLSocketFactoryExtended;->mCiphers:[Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljavax/net/ssl/SSLSocket;->setEnabledCipherSuites([Ljava/lang/String;)V

    .line 64
    return-object v1
.end method

.method public createSocket(Ljava/net/Socket;Ljava/lang/String;IZ)Ljava/net/Socket;
    .locals 3
    .param p1, "s"    # Ljava/net/Socket;
    .param p2, "host"    # Ljava/lang/String;
    .param p3, "port"    # I
    .param p4, "autoClose"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 47
    iget-object v2, p0, Lcom/edutech/cloudclientsetting/activity/SSLSocketFactoryExtended;->mSSLContext:Ljavax/net/ssl/SSLContext;

    invoke-virtual {v2}, Ljavax/net/ssl/SSLContext;->getSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v0

    .line 48
    .local v0, "factory":Ljavax/net/ssl/SSLSocketFactory;
    invoke-virtual {v0, p1, p2, p3, p4}, Ljavax/net/ssl/SSLSocketFactory;->createSocket(Ljava/net/Socket;Ljava/lang/String;IZ)Ljava/net/Socket;

    move-result-object v1

    check-cast v1, Ljavax/net/ssl/SSLSocket;

    .line 50
    .local v1, "ss":Ljavax/net/ssl/SSLSocket;
    iget-object v2, p0, Lcom/edutech/cloudclientsetting/activity/SSLSocketFactoryExtended;->mProtocols:[Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljavax/net/ssl/SSLSocket;->setEnabledProtocols([Ljava/lang/String;)V

    .line 51
    iget-object v2, p0, Lcom/edutech/cloudclientsetting/activity/SSLSocketFactoryExtended;->mCiphers:[Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljavax/net/ssl/SSLSocket;->setEnabledCipherSuites([Ljava/lang/String;)V

    .line 53
    return-object v1
.end method

.method public getDefaultCipherSuites()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 37
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/SSLSocketFactoryExtended;->mCiphers:[Ljava/lang/String;

    return-object v0
.end method

.method public getSupportedCipherSuites()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 42
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/SSLSocketFactoryExtended;->mCiphers:[Ljava/lang/String;

    return-object v0
.end method
