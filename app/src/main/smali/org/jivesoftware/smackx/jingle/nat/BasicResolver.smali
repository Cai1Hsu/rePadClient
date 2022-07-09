.class public Lorg/jivesoftware/smackx/jingle/nat/BasicResolver;
.super Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;
.source "BasicResolver.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 42
    invoke-direct {p0}, Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;-><init>()V

    .line 43
    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 122
    return-void
.end method

.method public initialize()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 117
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/nat/BasicResolver;->setInitialized()V

    .line 118
    return-void
.end method

.method public declared-synchronized resolve(Lorg/jivesoftware/smackx/jingle/JingleSession;)V
    .locals 8
    .param p1, "session"    # Lorg/jivesoftware/smackx/jingle/JingleSession;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 53
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/nat/BasicResolver;->setResolveInit()V

    .line 55
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/nat/BasicResolver;->clearCandidates()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 57
    const/4 v4, 0x0

    .line 60
    .local v4, "ifaces":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/net/NetworkInterface;>;"
    :try_start_1
    invoke-static {}, Ljava/net/NetworkInterface;->getNetworkInterfaces()Ljava/util/Enumeration;
    :try_end_1
    .catch Ljava/net/SocketException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v4

    .line 65
    :cond_0
    :goto_0
    :try_start_2
    invoke-interface {v4}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v6

    if-eqz v6, :cond_4

    .line 67
    invoke-interface {v4}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/net/NetworkInterface;

    .line 68
    .local v3, "iface":Ljava/net/NetworkInterface;
    invoke-virtual {v3}, Ljava/net/NetworkInterface;->getInetAddresses()Ljava/util/Enumeration;

    move-result-object v2

    .line 70
    .local v2, "iaddresses":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/net/InetAddress;>;"
    :cond_1
    invoke-interface {v2}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v6

    if-eqz v6, :cond_0

    .line 71
    invoke-interface {v2}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/net/InetAddress;

    .line 72
    .local v1, "iaddress":Ljava/net/InetAddress;
    invoke-virtual {v1}, Ljava/net/InetAddress;->isLoopbackAddress()Z

    move-result v6

    if-nez v6, :cond_1

    invoke-virtual {v1}, Ljava/net/InetAddress;->isLinkLocalAddress()Z

    move-result v6

    if-nez v6, :cond_1

    invoke-virtual {v1}, Ljava/net/InetAddress;->isSiteLocalAddress()Z

    move-result v6

    if-nez v6, :cond_1

    .line 73
    new-instance v5, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Fixed;

    invoke-virtual {v1}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_2

    invoke-virtual {v1}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v6

    :goto_1
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/nat/BasicResolver;->getFreePort()I

    move-result v7

    invoke-direct {v5, v6, v7}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Fixed;-><init>(Ljava/lang/String;I)V

    .line 74
    .local v5, "tr":Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    invoke-virtual {v1}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_3

    invoke-virtual {v1}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v6

    :goto_2
    invoke-virtual {v5, v6}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->setLocalIp(Ljava/lang/String;)V

    .line 75
    invoke-virtual {p0, v5}, Lorg/jivesoftware/smackx/jingle/nat/BasicResolver;->addCandidate(Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;)V

    .line 76
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/nat/BasicResolver;->setResolveEnd()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 114
    .end local v1    # "iaddress":Ljava/net/InetAddress;
    .end local v2    # "iaddresses":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/net/InetAddress;>;"
    .end local v3    # "iface":Ljava/net/NetworkInterface;
    .end local v5    # "tr":Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    :goto_3
    monitor-exit p0

    return-void

    .line 61
    :catch_0
    move-exception v0

    .line 62
    .local v0, "e":Ljava/net/SocketException;
    :try_start_3
    invoke-virtual {v0}, Ljava/net/SocketException;->printStackTrace()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    .line 53
    .end local v0    # "e":Ljava/net/SocketException;
    .end local v4    # "ifaces":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/net/NetworkInterface;>;"
    :catchall_0
    move-exception v6

    monitor-exit p0

    throw v6

    .line 73
    .restart local v1    # "iaddress":Ljava/net/InetAddress;
    .restart local v2    # "iaddresses":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/net/InetAddress;>;"
    .restart local v3    # "iface":Ljava/net/NetworkInterface;
    .restart local v4    # "ifaces":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/net/NetworkInterface;>;"
    :cond_2
    :try_start_4
    invoke-virtual {v1}, Ljava/net/InetAddress;->getHostName()Ljava/lang/String;

    move-result-object v6

    goto :goto_1

    .line 74
    .restart local v5    # "tr":Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    :cond_3
    invoke-virtual {v1}, Ljava/net/InetAddress;->getHostName()Ljava/lang/String;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    move-result-object v6

    goto :goto_2

    .line 83
    .end local v1    # "iaddress":Ljava/net/InetAddress;
    .end local v2    # "iaddresses":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/net/InetAddress;>;"
    .end local v3    # "iface":Ljava/net/NetworkInterface;
    .end local v5    # "tr":Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    :cond_4
    :try_start_5
    invoke-static {}, Ljava/net/NetworkInterface;->getNetworkInterfaces()Ljava/util/Enumeration;
    :try_end_5
    .catch Ljava/net/SocketException; {:try_start_5 .. :try_end_5} :catch_1
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    move-result-object v4

    .line 88
    :cond_5
    :goto_4
    :try_start_6
    invoke-interface {v4}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v6

    if-eqz v6, :cond_9

    .line 90
    invoke-interface {v4}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/net/NetworkInterface;

    .line 91
    .restart local v3    # "iface":Ljava/net/NetworkInterface;
    invoke-virtual {v3}, Ljava/net/NetworkInterface;->getInetAddresses()Ljava/util/Enumeration;

    move-result-object v2

    .line 93
    .restart local v2    # "iaddresses":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/net/InetAddress;>;"
    :cond_6
    invoke-interface {v2}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v6

    if-eqz v6, :cond_5

    .line 94
    invoke-interface {v2}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/net/InetAddress;

    .line 95
    .restart local v1    # "iaddress":Ljava/net/InetAddress;
    invoke-virtual {v1}, Ljava/net/InetAddress;->isLoopbackAddress()Z

    move-result v6

    if-nez v6, :cond_6

    invoke-virtual {v1}, Ljava/net/InetAddress;->isLinkLocalAddress()Z

    move-result v6

    if-nez v6, :cond_6

    .line 96
    new-instance v5, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Fixed;

    invoke-virtual {v1}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_7

    invoke-virtual {v1}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v6

    :goto_5
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/nat/BasicResolver;->getFreePort()I

    move-result v7

    invoke-direct {v5, v6, v7}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Fixed;-><init>(Ljava/lang/String;I)V

    .line 97
    .restart local v5    # "tr":Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    invoke-virtual {v1}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_8

    invoke-virtual {v1}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v6

    :goto_6
    invoke-virtual {v5, v6}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->setLocalIp(Ljava/lang/String;)V

    .line 98
    invoke-virtual {p0, v5}, Lorg/jivesoftware/smackx/jingle/nat/BasicResolver;->addCandidate(Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;)V

    .line 99
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/nat/BasicResolver;->setResolveEnd()V

    goto :goto_3

    .line 84
    .end local v1    # "iaddress":Ljava/net/InetAddress;
    .end local v2    # "iaddresses":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/net/InetAddress;>;"
    .end local v3    # "iface":Ljava/net/NetworkInterface;
    .end local v5    # "tr":Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    :catch_1
    move-exception v0

    .line 85
    .restart local v0    # "e":Ljava/net/SocketException;
    invoke-virtual {v0}, Ljava/net/SocketException;->printStackTrace()V

    goto :goto_4

    .line 96
    .end local v0    # "e":Ljava/net/SocketException;
    .restart local v1    # "iaddress":Ljava/net/InetAddress;
    .restart local v2    # "iaddresses":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/net/InetAddress;>;"
    .restart local v3    # "iface":Ljava/net/NetworkInterface;
    :cond_7
    invoke-virtual {v1}, Ljava/net/InetAddress;->getHostName()Ljava/lang/String;

    move-result-object v6

    goto :goto_5

    .line 97
    .restart local v5    # "tr":Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    :cond_8
    invoke-virtual {v1}, Ljava/net/InetAddress;->getHostName()Ljava/lang/String;
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    move-result-object v6

    goto :goto_6

    .line 106
    .end local v1    # "iaddress":Ljava/net/InetAddress;
    .end local v2    # "iaddresses":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/net/InetAddress;>;"
    .end local v3    # "iface":Ljava/net/NetworkInterface;
    .end local v5    # "tr":Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    :cond_9
    :try_start_7
    new-instance v5, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Fixed;

    invoke-static {}, Ljava/net/InetAddress;->getLocalHost()Ljava/net/InetAddress;

    move-result-object v6

    invoke-virtual {v6}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_a

    invoke-static {}, Ljava/net/InetAddress;->getLocalHost()Ljava/net/InetAddress;

    move-result-object v6

    invoke-virtual {v6}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v6

    :goto_7
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/nat/BasicResolver;->getFreePort()I

    move-result v7

    invoke-direct {v5, v6, v7}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Fixed;-><init>(Ljava/lang/String;I)V

    .line 107
    .restart local v5    # "tr":Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    invoke-static {}, Ljava/net/InetAddress;->getLocalHost()Ljava/net/InetAddress;

    move-result-object v6

    invoke-virtual {v6}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_b

    invoke-static {}, Ljava/net/InetAddress;->getLocalHost()Ljava/net/InetAddress;

    move-result-object v6

    invoke-virtual {v6}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v6

    :goto_8
    invoke-virtual {v5, v6}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->setLocalIp(Ljava/lang/String;)V

    .line 108
    invoke-virtual {p0, v5}, Lorg/jivesoftware/smackx/jingle/nat/BasicResolver;->addCandidate(Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;)V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_2
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 112
    .end local v5    # "tr":Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    :goto_9
    :try_start_8
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/nat/BasicResolver;->setResolveEnd()V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    goto/16 :goto_3

    .line 106
    :cond_a
    :try_start_9
    invoke-static {}, Ljava/net/InetAddress;->getLocalHost()Ljava/net/InetAddress;

    move-result-object v6

    invoke-virtual {v6}, Ljava/net/InetAddress;->getHostName()Ljava/lang/String;

    move-result-object v6

    goto :goto_7

    .line 107
    .restart local v5    # "tr":Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    :cond_b
    invoke-static {}, Ljava/net/InetAddress;->getLocalHost()Ljava/net/InetAddress;

    move-result-object v6

    invoke-virtual {v6}, Ljava/net/InetAddress;->getHostName()Ljava/lang/String;
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_2
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    move-result-object v6

    goto :goto_8

    .line 109
    .end local v5    # "tr":Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    :catch_2
    move-exception v0

    .line 110
    .local v0, "e":Ljava/lang/Exception;
    :try_start_a
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    goto :goto_9
.end method
