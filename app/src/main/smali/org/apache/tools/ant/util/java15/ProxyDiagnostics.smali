.class public Lorg/apache/tools/ant/util/java15/ProxyDiagnostics;
.super Ljava/lang/Object;
.source "ProxyDiagnostics.java"


# static fields
.field public static final DEFAULT_DESTINATION:Ljava/lang/String; = "http://ant.apache.org/"


# instance fields
.field private destURI:Ljava/net/URI;

.field private destination:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 69
    const-string/jumbo v0, "http://ant.apache.org/"

    invoke-direct {p0, v0}, Lorg/apache/tools/ant/util/java15/ProxyDiagnostics;-><init>(Ljava/lang/String;)V

    .line 70
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 2
    .param p1, "destination"    # Ljava/lang/String;

    .prologue
    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 56
    iput-object p1, p0, Lorg/apache/tools/ant/util/java15/ProxyDiagnostics;->destination:Ljava/lang/String;

    .line 58
    :try_start_0
    new-instance v1, Ljava/net/URI;

    invoke-direct {v1, p1}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    iput-object v1, p0, Lorg/apache/tools/ant/util/java15/ProxyDiagnostics;->destURI:Ljava/net/URI;
    :try_end_0
    .catch Ljava/net/URISyntaxException; {:try_start_0 .. :try_end_0} :catch_0

    .line 62
    return-void

    .line 59
    :catch_0
    move-exception v0

    .line 60
    .local v0, "e":Ljava/net/URISyntaxException;
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v1, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 9

    .prologue
    .line 77
    invoke-static {}, Ljava/net/ProxySelector;->getDefault()Ljava/net/ProxySelector;

    move-result-object v7

    .line 78
    .local v7, "selector":Ljava/net/ProxySelector;
    iget-object v8, p0, Lorg/apache/tools/ant/util/java15/ProxyDiagnostics;->destURI:Ljava/net/URI;

    invoke-virtual {v7, v8}, Ljava/net/ProxySelector;->select(Ljava/net/URI;)Ljava/util/List;

    move-result-object v3

    .line 79
    .local v3, "list":Ljava/util/List;
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    .line 80
    .local v6, "result":Ljava/lang/StringBuffer;
    invoke-interface {v3}, Ljava/util/List;->listIterator()Ljava/util/ListIterator;

    move-result-object v4

    .line 81
    .local v4, "proxies":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_3

    .line 82
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/net/Proxy;

    .line 83
    .local v5, "proxy":Ljava/net/Proxy;
    invoke-virtual {v5}, Ljava/net/Proxy;->address()Ljava/net/SocketAddress;

    move-result-object v1

    .line 84
    .local v1, "address":Ljava/net/SocketAddress;
    if-nez v1, :cond_0

    .line 85
    const-string/jumbo v8, "Direct connection\n"

    invoke-virtual {v6, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_0

    .line 87
    :cond_0
    invoke-virtual {v5}, Ljava/net/Proxy;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 88
    instance-of v8, v1, Ljava/net/InetSocketAddress;

    if-eqz v8, :cond_1

    move-object v2, v1

    .line 89
    check-cast v2, Ljava/net/InetSocketAddress;

    .line 90
    .local v2, "ina":Ljava/net/InetSocketAddress;
    const/16 v8, 0x20

    invoke-virtual {v6, v8}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 91
    invoke-virtual {v2}, Ljava/net/InetSocketAddress;->getHostName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 92
    const/16 v8, 0x3a

    invoke-virtual {v6, v8}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 93
    invoke-virtual {v2}, Ljava/net/InetSocketAddress;->getPort()I

    move-result v8

    invoke-virtual {v6, v8}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    .line 94
    invoke-virtual {v2}, Ljava/net/InetSocketAddress;->isUnresolved()Z

    move-result v8

    if-eqz v8, :cond_2

    .line 95
    const-string/jumbo v8, " [unresolved]"

    invoke-virtual {v6, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 103
    .end local v2    # "ina":Ljava/net/InetSocketAddress;
    :cond_1
    :goto_1
    const/16 v8, 0xa

    invoke-virtual {v6, v8}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_0

    .line 97
    .restart local v2    # "ina":Ljava/net/InetSocketAddress;
    :cond_2
    invoke-virtual {v2}, Ljava/net/InetSocketAddress;->getAddress()Ljava/net/InetAddress;

    move-result-object v0

    .line 98
    .local v0, "addr":Ljava/net/InetAddress;
    const-string/jumbo v8, " ["

    invoke-virtual {v6, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 99
    invoke-virtual {v0}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 100
    const/16 v8, 0x5d

    invoke-virtual {v6, v8}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_1

    .line 106
    .end local v0    # "addr":Ljava/net/InetAddress;
    .end local v1    # "address":Ljava/net/SocketAddress;
    .end local v2    # "ina":Ljava/net/InetSocketAddress;
    .end local v5    # "proxy":Ljava/net/Proxy;
    :cond_3
    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    return-object v8
.end method
