.class Lorg/jivesoftware/smackx/jingle/nat/STUNResolver$2;
.super Ljava/lang/Object;
.source "STUNResolver.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/jivesoftware/smackx/jingle/nat/STUNResolver;->initialize()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/jivesoftware/smackx/jingle/nat/STUNResolver;


# direct methods
.method constructor <init>(Lorg/jivesoftware/smackx/jingle/nat/STUNResolver;)V
    .locals 0

    .prologue
    .line 303
    iput-object p1, p0, Lorg/jivesoftware/smackx/jingle/nat/STUNResolver$2;->this$0:Lorg/jivesoftware/smackx/jingle/nat/STUNResolver;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 12

    .prologue
    .line 308
    :try_start_0
    invoke-static {}, Ljava/net/NetworkInterface;->getNetworkInterfaces()Ljava/util/Enumeration;

    move-result-object v8

    .line 312
    .local v8, "ifaces":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/net/NetworkInterface;>;"
    :cond_0
    invoke-interface {v8}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v10

    if-eqz v10, :cond_5

    .line 314
    invoke-interface {v8}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/net/NetworkInterface;

    .line 315
    .local v7, "iface":Ljava/net/NetworkInterface;
    invoke-virtual {v7}, Ljava/net/NetworkInterface;->getInetAddresses()Ljava/util/Enumeration;

    move-result-object v6

    .line 317
    .local v6, "iaddresses":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/net/InetAddress;>;"
    :cond_1
    :goto_0
    invoke-interface {v6}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v10

    if-eqz v10, :cond_0

    .line 318
    invoke-interface {v6}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/net/InetAddress;

    .line 319
    .local v5, "iaddress":Ljava/net/InetAddress;
    invoke-virtual {v5}, Ljava/net/InetAddress;->isLoopbackAddress()Z

    move-result v10

    if-nez v10, :cond_1

    invoke-virtual {v5}, Ljava/net/InetAddress;->isLinkLocalAddress()Z

    move-result v10

    if-nez v10, :cond_1

    .line 323
    const/4 v0, 0x0

    .line 324
    .local v0, "candAddress":Ljava/lang/String;
    const/4 v1, -0x1

    .line 326
    .local v1, "candPort":I
    new-instance v9, Lde/javawi/jstun/test/DiscoveryTest;

    iget-object v10, p0, Lorg/jivesoftware/smackx/jingle/nat/STUNResolver$2;->this$0:Lorg/jivesoftware/smackx/jingle/nat/STUNResolver;

    iget-object v10, v10, Lorg/jivesoftware/smackx/jingle/nat/STUNResolver;->currentServer:Lorg/jivesoftware/smackx/jingle/nat/STUNResolver$STUNService;

    invoke-virtual {v10}, Lorg/jivesoftware/smackx/jingle/nat/STUNResolver$STUNService;->getHostname()Ljava/lang/String;

    move-result-object v10

    iget-object v11, p0, Lorg/jivesoftware/smackx/jingle/nat/STUNResolver$2;->this$0:Lorg/jivesoftware/smackx/jingle/nat/STUNResolver;

    iget-object v11, v11, Lorg/jivesoftware/smackx/jingle/nat/STUNResolver;->currentServer:Lorg/jivesoftware/smackx/jingle/nat/STUNResolver$STUNService;

    invoke-virtual {v11}, Lorg/jivesoftware/smackx/jingle/nat/STUNResolver$STUNService;->getPort()I

    move-result v11

    invoke-direct {v9, v5, v10, v11}, Lde/javawi/jstun/test/DiscoveryTest;-><init>(Ljava/net/InetAddress;Ljava/lang/String;I)V
    :try_end_0
    .catch Ljava/net/SocketException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 334
    .local v9, "test":Lde/javawi/jstun/test/DiscoveryTest;
    :try_start_1
    invoke-virtual {v9}, Lde/javawi/jstun/test/DiscoveryTest;->test()Lde/javawi/jstun/test/DiscoveryInfo;

    move-result-object v3

    .line 336
    .local v3, "di":Lde/javawi/jstun/test/DiscoveryInfo;
    invoke-virtual {v3}, Lde/javawi/jstun/test/DiscoveryInfo;->getPublicIP()Ljava/net/InetAddress;

    move-result-object v10

    if-eqz v10, :cond_2

    invoke-virtual {v3}, Lde/javawi/jstun/test/DiscoveryInfo;->getPublicIP()Ljava/net/InetAddress;

    move-result-object v10

    invoke-virtual {v10}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v0

    .line 340
    :goto_1
    iget-object v10, p0, Lorg/jivesoftware/smackx/jingle/nat/STUNResolver$2;->this$0:Lorg/jivesoftware/smackx/jingle/nat/STUNResolver;

    iget v10, v10, Lorg/jivesoftware/smackx/jingle/nat/STUNResolver;->defaultPort:I

    if-nez v10, :cond_3

    .line 341
    iget-object v10, p0, Lorg/jivesoftware/smackx/jingle/nat/STUNResolver$2;->this$0:Lorg/jivesoftware/smackx/jingle/nat/STUNResolver;

    invoke-virtual {v10}, Lorg/jivesoftware/smackx/jingle/nat/STUNResolver;->getFreePort()I

    move-result v1

    .line 348
    :goto_2
    if-eqz v0, :cond_1

    if-ltz v1, :cond_1

    .line 349
    new-instance v2, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Fixed;

    invoke-direct {v2, v0, v1}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Fixed;-><init>(Ljava/lang/String;I)V

    .line 351
    .local v2, "candidate":Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    invoke-virtual {v5}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v10

    if-eqz v10, :cond_4

    invoke-virtual {v5}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v10

    :goto_3
    invoke-virtual {v2, v10}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->setLocalIp(Ljava/lang/String;)V

    .line 352
    iget-object v10, p0, Lorg/jivesoftware/smackx/jingle/nat/STUNResolver$2;->this$0:Lorg/jivesoftware/smackx/jingle/nat/STUNResolver;

    invoke-virtual {v10, v2}, Lorg/jivesoftware/smackx/jingle/nat/STUNResolver;->addCandidate(Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;)V

    .line 354
    iget-object v10, p0, Lorg/jivesoftware/smackx/jingle/nat/STUNResolver$2;->this$0:Lorg/jivesoftware/smackx/jingle/nat/STUNResolver;

    invoke-virtual {v2}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->getIp()Ljava/lang/String;

    move-result-object v11

    iput-object v11, v10, Lorg/jivesoftware/smackx/jingle/nat/STUNResolver;->resolvedPublicIP:Ljava/lang/String;

    .line 355
    iget-object v10, p0, Lorg/jivesoftware/smackx/jingle/nat/STUNResolver$2;->this$0:Lorg/jivesoftware/smackx/jingle/nat/STUNResolver;

    invoke-virtual {v2}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->getLocalIp()Ljava/lang/String;

    move-result-object v11

    iput-object v11, v10, Lorg/jivesoftware/smackx/jingle/nat/STUNResolver;->resolvedLocalIP:Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/net/SocketException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 370
    iget-object v10, p0, Lorg/jivesoftware/smackx/jingle/nat/STUNResolver$2;->this$0:Lorg/jivesoftware/smackx/jingle/nat/STUNResolver;

    invoke-virtual {v10}, Lorg/jivesoftware/smackx/jingle/nat/STUNResolver;->setInitialized()V

    .line 372
    .end local v0    # "candAddress":Ljava/lang/String;
    .end local v1    # "candPort":I
    .end local v2    # "candidate":Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    .end local v3    # "di":Lde/javawi/jstun/test/DiscoveryInfo;
    .end local v5    # "iaddress":Ljava/net/InetAddress;
    .end local v6    # "iaddresses":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/net/InetAddress;>;"
    .end local v7    # "iface":Ljava/net/NetworkInterface;
    .end local v8    # "ifaces":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/net/NetworkInterface;>;"
    .end local v9    # "test":Lde/javawi/jstun/test/DiscoveryTest;
    :goto_4
    return-void

    .line 336
    .restart local v0    # "candAddress":Ljava/lang/String;
    .restart local v1    # "candPort":I
    .restart local v3    # "di":Lde/javawi/jstun/test/DiscoveryInfo;
    .restart local v5    # "iaddress":Ljava/net/InetAddress;
    .restart local v6    # "iaddresses":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/net/InetAddress;>;"
    .restart local v7    # "iface":Ljava/net/NetworkInterface;
    .restart local v8    # "ifaces":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/net/NetworkInterface;>;"
    .restart local v9    # "test":Lde/javawi/jstun/test/DiscoveryTest;
    :cond_2
    const/4 v0, 0x0

    goto :goto_1

    .line 343
    :cond_3
    :try_start_2
    iget-object v10, p0, Lorg/jivesoftware/smackx/jingle/nat/STUNResolver$2;->this$0:Lorg/jivesoftware/smackx/jingle/nat/STUNResolver;

    iget v1, v10, Lorg/jivesoftware/smackx/jingle/nat/STUNResolver;->defaultPort:I

    goto :goto_2

    .line 351
    .restart local v2    # "candidate":Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    :cond_4
    invoke-virtual {v5}, Ljava/net/InetAddress;->getHostName()Ljava/lang/String;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/net/SocketException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result-object v10

    goto :goto_3

    .line 359
    .end local v2    # "candidate":Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    .end local v3    # "di":Lde/javawi/jstun/test/DiscoveryInfo;
    :catch_0
    move-exception v4

    .line 360
    .local v4, "e":Ljava/lang/Exception;
    :try_start_3
    invoke-static {}, Lorg/jivesoftware/smackx/jingle/nat/STUNResolver;->access$000()Lorg/jivesoftware/smackx/jingle/SmackLogger;

    move-result-object v10

    invoke-virtual {v4}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11, v4}, Lorg/jivesoftware/smackx/jingle/SmackLogger;->error(Ljava/lang/String;Ljava/lang/Exception;)V
    :try_end_3
    .catch Ljava/net/SocketException; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto/16 :goto_0

    .line 366
    .end local v0    # "candAddress":Ljava/lang/String;
    .end local v1    # "candPort":I
    .end local v4    # "e":Ljava/lang/Exception;
    .end local v5    # "iaddress":Ljava/net/InetAddress;
    .end local v6    # "iaddresses":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/net/InetAddress;>;"
    .end local v7    # "iface":Ljava/net/NetworkInterface;
    .end local v8    # "ifaces":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/net/NetworkInterface;>;"
    .end local v9    # "test":Lde/javawi/jstun/test/DiscoveryTest;
    :catch_1
    move-exception v4

    .line 367
    .local v4, "e":Ljava/net/SocketException;
    :try_start_4
    invoke-static {}, Lorg/jivesoftware/smackx/jingle/nat/STUNResolver;->access$000()Lorg/jivesoftware/smackx/jingle/SmackLogger;

    move-result-object v10

    invoke-virtual {v4}, Ljava/net/SocketException;->getMessage()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11, v4}, Lorg/jivesoftware/smackx/jingle/SmackLogger;->error(Ljava/lang/String;Ljava/lang/Exception;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 370
    iget-object v10, p0, Lorg/jivesoftware/smackx/jingle/nat/STUNResolver$2;->this$0:Lorg/jivesoftware/smackx/jingle/nat/STUNResolver;

    invoke-virtual {v10}, Lorg/jivesoftware/smackx/jingle/nat/STUNResolver;->setInitialized()V

    goto :goto_4

    .end local v4    # "e":Ljava/net/SocketException;
    .restart local v8    # "ifaces":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/net/NetworkInterface;>;"
    :cond_5
    iget-object v10, p0, Lorg/jivesoftware/smackx/jingle/nat/STUNResolver$2;->this$0:Lorg/jivesoftware/smackx/jingle/nat/STUNResolver;

    invoke-virtual {v10}, Lorg/jivesoftware/smackx/jingle/nat/STUNResolver;->setInitialized()V

    goto :goto_4

    .end local v8    # "ifaces":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/net/NetworkInterface;>;"
    :catchall_0
    move-exception v10

    iget-object v11, p0, Lorg/jivesoftware/smackx/jingle/nat/STUNResolver$2;->this$0:Lorg/jivesoftware/smackx/jingle/nat/STUNResolver;

    invoke-virtual {v11}, Lorg/jivesoftware/smackx/jingle/nat/STUNResolver;->setInitialized()V

    throw v10
.end method
