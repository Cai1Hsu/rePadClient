.class public Lcom/edutech/cloudclientsetting/activity/PreferredCipherSuiteSSLSocketFactory;
.super Ljavax/net/ssl/SSLSocketFactory;
.source "PreferredCipherSuiteSSLSocketFactory.java"


# static fields
.field private static final PREFERRED_CIPHER_SUITE:Ljava/lang/String; = "SSL_RSA_WITH_RC4_128_MD5"


# instance fields
.field private final delegate:Ljavax/net/ssl/SSLSocketFactory;


# direct methods
.method public constructor <init>(Ljavax/net/ssl/SSLSocketFactory;)V
    .locals 0
    .param p1, "delegate"    # Ljavax/net/ssl/SSLSocketFactory;

    .prologue
    .line 18
    invoke-direct {p0}, Ljavax/net/ssl/SSLSocketFactory;-><init>()V

    .line 19
    iput-object p1, p0, Lcom/edutech/cloudclientsetting/activity/PreferredCipherSuiteSSLSocketFactory;->delegate:Ljavax/net/ssl/SSLSocketFactory;

    .line 20
    return-void
.end method

.method private static setupPreferredDefaultCipherSuites(Ljavax/net/ssl/SSLSocketFactory;)[Ljava/lang/String;
    .locals 4
    .param p0, "sslSocketFactory"    # Ljavax/net/ssl/SSLSocketFactory;

    .prologue
    .line 69
    invoke-virtual {p0}, Ljavax/net/ssl/SSLSocketFactory;->getDefaultCipherSuites()[Ljava/lang/String;

    move-result-object v0

    .line 70
    .local v0, "defaultCipherSuites":[Ljava/lang/String;
    new-instance v1, Ljava/util/ArrayList;

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 71
    .local v1, "suitesList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const-string/jumbo v2, "SSL_RSA_WITH_RC4_128_MD5"

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 72
    const/4 v2, 0x0

    const-string/jumbo v3, "SSL_RSA_WITH_RC4_128_MD5"

    invoke-virtual {v1, v2, v3}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 73
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    new-array v2, v2, [Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Ljava/lang/String;

    return-object v2
.end method

.method private static setupPreferredSupportedCipherSuites(Ljavax/net/ssl/SSLSocketFactory;)[Ljava/lang/String;
    .locals 4
    .param p0, "sslSocketFactory"    # Ljavax/net/ssl/SSLSocketFactory;

    .prologue
    .line 76
    invoke-virtual {p0}, Ljavax/net/ssl/SSLSocketFactory;->getSupportedCipherSuites()[Ljava/lang/String;

    move-result-object v1

    .line 77
    .local v1, "supportedCipherSuites":[Ljava/lang/String;
    new-instance v0, Ljava/util/ArrayList;

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 78
    .local v0, "suitesList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const-string/jumbo v2, "SSL_RSA_WITH_RC4_128_MD5"

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 79
    const/4 v2, 0x0

    const-string/jumbo v3, "SSL_RSA_WITH_RC4_128_MD5"

    invoke-virtual {v0, v2, v3}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 80
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    new-array v2, v2, [Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Ljava/lang/String;

    return-object v2
.end method


# virtual methods
.method public createSocket(Ljava/lang/String;I)Ljava/net/Socket;
    .locals 3
    .param p1, "arg0"    # Ljava/lang/String;
    .param p2, "arg1"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/net/UnknownHostException;
        }
    .end annotation

    .prologue
    .line 32
    iget-object v2, p0, Lcom/edutech/cloudclientsetting/activity/PreferredCipherSuiteSSLSocketFactory;->delegate:Ljavax/net/ssl/SSLSocketFactory;

    invoke-virtual {v2, p1, p2}, Ljavax/net/ssl/SSLSocketFactory;->createSocket(Ljava/lang/String;I)Ljava/net/Socket;

    move-result-object v1

    .line 33
    .local v1, "socket":Ljava/net/Socket;
    iget-object v2, p0, Lcom/edutech/cloudclientsetting/activity/PreferredCipherSuiteSSLSocketFactory;->delegate:Ljavax/net/ssl/SSLSocketFactory;

    invoke-static {v2}, Lcom/edutech/cloudclientsetting/activity/PreferredCipherSuiteSSLSocketFactory;->setupPreferredDefaultCipherSuites(Ljavax/net/ssl/SSLSocketFactory;)[Ljava/lang/String;

    move-result-object v0

    .local v0, "cipherSuites":[Ljava/lang/String;
    move-object v2, v1

    .line 34
    check-cast v2, Ljavax/net/ssl/SSLSocket;

    invoke-virtual {v2, v0}, Ljavax/net/ssl/SSLSocket;->setEnabledCipherSuites([Ljava/lang/String;)V

    .line 35
    return-object v1
.end method

.method public createSocket(Ljava/lang/String;ILjava/net/InetAddress;I)Ljava/net/Socket;
    .locals 3
    .param p1, "arg0"    # Ljava/lang/String;
    .param p2, "arg1"    # I
    .param p3, "arg2"    # Ljava/net/InetAddress;
    .param p4, "arg3"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/net/UnknownHostException;
        }
    .end annotation

    .prologue
    .line 55
    iget-object v2, p0, Lcom/edutech/cloudclientsetting/activity/PreferredCipherSuiteSSLSocketFactory;->delegate:Ljavax/net/ssl/SSLSocketFactory;

    invoke-virtual {v2, p1, p2, p3, p4}, Ljavax/net/ssl/SSLSocketFactory;->createSocket(Ljava/lang/String;ILjava/net/InetAddress;I)Ljava/net/Socket;

    move-result-object v1

    .line 56
    .local v1, "socket":Ljava/net/Socket;
    iget-object v2, p0, Lcom/edutech/cloudclientsetting/activity/PreferredCipherSuiteSSLSocketFactory;->delegate:Ljavax/net/ssl/SSLSocketFactory;

    invoke-static {v2}, Lcom/edutech/cloudclientsetting/activity/PreferredCipherSuiteSSLSocketFactory;->setupPreferredDefaultCipherSuites(Ljavax/net/ssl/SSLSocketFactory;)[Ljava/lang/String;

    move-result-object v0

    .local v0, "cipherSuites":[Ljava/lang/String;
    move-object v2, v1

    .line 57
    check-cast v2, Ljavax/net/ssl/SSLSocket;

    invoke-virtual {v2, v0}, Ljavax/net/ssl/SSLSocket;->setEnabledCipherSuites([Ljava/lang/String;)V

    .line 58
    return-object v1
.end method

.method public createSocket(Ljava/net/InetAddress;I)Ljava/net/Socket;
    .locals 3
    .param p1, "arg0"    # Ljava/net/InetAddress;
    .param p2, "arg1"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 39
    iget-object v2, p0, Lcom/edutech/cloudclientsetting/activity/PreferredCipherSuiteSSLSocketFactory;->delegate:Ljavax/net/ssl/SSLSocketFactory;

    invoke-virtual {v2, p1, p2}, Ljavax/net/ssl/SSLSocketFactory;->createSocket(Ljava/net/InetAddress;I)Ljava/net/Socket;

    move-result-object v1

    .line 40
    .local v1, "socket":Ljava/net/Socket;
    iget-object v2, p0, Lcom/edutech/cloudclientsetting/activity/PreferredCipherSuiteSSLSocketFactory;->delegate:Ljavax/net/ssl/SSLSocketFactory;

    invoke-static {v2}, Lcom/edutech/cloudclientsetting/activity/PreferredCipherSuiteSSLSocketFactory;->setupPreferredDefaultCipherSuites(Ljavax/net/ssl/SSLSocketFactory;)[Ljava/lang/String;

    move-result-object v0

    .local v0, "cipherSuites":[Ljava/lang/String;
    move-object v2, v1

    .line 41
    check-cast v2, Ljavax/net/ssl/SSLSocket;

    invoke-virtual {v2, v0}, Ljavax/net/ssl/SSLSocket;->setEnabledCipherSuites([Ljava/lang/String;)V

    .line 42
    return-object v1
.end method

.method public createSocket(Ljava/net/InetAddress;ILjava/net/InetAddress;I)Ljava/net/Socket;
    .locals 3
    .param p1, "arg0"    # Ljava/net/InetAddress;
    .param p2, "arg1"    # I
    .param p3, "arg2"    # Ljava/net/InetAddress;
    .param p4, "arg3"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 63
    iget-object v2, p0, Lcom/edutech/cloudclientsetting/activity/PreferredCipherSuiteSSLSocketFactory;->delegate:Ljavax/net/ssl/SSLSocketFactory;

    invoke-virtual {v2, p1, p2, p3, p4}, Ljavax/net/ssl/SSLSocketFactory;->createSocket(Ljava/net/InetAddress;ILjava/net/InetAddress;I)Ljava/net/Socket;

    move-result-object v1

    .line 64
    .local v1, "socket":Ljava/net/Socket;
    iget-object v2, p0, Lcom/edutech/cloudclientsetting/activity/PreferredCipherSuiteSSLSocketFactory;->delegate:Ljavax/net/ssl/SSLSocketFactory;

    invoke-static {v2}, Lcom/edutech/cloudclientsetting/activity/PreferredCipherSuiteSSLSocketFactory;->setupPreferredDefaultCipherSuites(Ljavax/net/ssl/SSLSocketFactory;)[Ljava/lang/String;

    move-result-object v0

    .local v0, "cipherSuites":[Ljava/lang/String;
    move-object v2, v1

    .line 65
    check-cast v2, Ljavax/net/ssl/SSLSocket;

    invoke-virtual {v2, v0}, Ljavax/net/ssl/SSLSocket;->setEnabledCipherSuites([Ljava/lang/String;)V

    .line 66
    return-object v1
.end method

.method public createSocket(Ljava/net/Socket;Ljava/lang/String;IZ)Ljava/net/Socket;
    .locals 3
    .param p1, "arg0"    # Ljava/net/Socket;
    .param p2, "arg1"    # Ljava/lang/String;
    .param p3, "arg2"    # I
    .param p4, "arg3"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 47
    iget-object v2, p0, Lcom/edutech/cloudclientsetting/activity/PreferredCipherSuiteSSLSocketFactory;->delegate:Ljavax/net/ssl/SSLSocketFactory;

    invoke-virtual {v2, p1, p2, p3, p4}, Ljavax/net/ssl/SSLSocketFactory;->createSocket(Ljava/net/Socket;Ljava/lang/String;IZ)Ljava/net/Socket;

    move-result-object v1

    .line 48
    .local v1, "socket":Ljava/net/Socket;
    iget-object v2, p0, Lcom/edutech/cloudclientsetting/activity/PreferredCipherSuiteSSLSocketFactory;->delegate:Ljavax/net/ssl/SSLSocketFactory;

    invoke-static {v2}, Lcom/edutech/cloudclientsetting/activity/PreferredCipherSuiteSSLSocketFactory;->setupPreferredDefaultCipherSuites(Ljavax/net/ssl/SSLSocketFactory;)[Ljava/lang/String;

    move-result-object v0

    .local v0, "cipherSuites":[Ljava/lang/String;
    move-object v2, v1

    .line 49
    check-cast v2, Ljavax/net/ssl/SSLSocket;

    invoke-virtual {v2, v0}, Ljavax/net/ssl/SSLSocket;->setEnabledCipherSuites([Ljava/lang/String;)V

    .line 50
    return-object v1
.end method

.method public getDefaultCipherSuites()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 23
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/PreferredCipherSuiteSSLSocketFactory;->delegate:Ljavax/net/ssl/SSLSocketFactory;

    invoke-static {v0}, Lcom/edutech/cloudclientsetting/activity/PreferredCipherSuiteSSLSocketFactory;->setupPreferredDefaultCipherSuites(Ljavax/net/ssl/SSLSocketFactory;)[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSupportedCipherSuites()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 27
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/PreferredCipherSuiteSSLSocketFactory;->delegate:Ljavax/net/ssl/SSLSocketFactory;

    invoke-static {v0}, Lcom/edutech/cloudclientsetting/activity/PreferredCipherSuiteSSLSocketFactory;->setupPreferredSupportedCipherSuites(Ljavax/net/ssl/SSLSocketFactory;)[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
