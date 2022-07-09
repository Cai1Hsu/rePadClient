.class public Lde/javawi/jstun/test/demo/DiscoveryTestDemo;
.super Ljava/lang/Object;
.source "DiscoveryTestDemo.java"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field iaddress:Ljava/net/InetAddress;


# direct methods
.method public constructor <init>(Ljava/net/InetAddress;)V
    .locals 0
    .param p1, "iaddress"    # Ljava/net/InetAddress;

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    iput-object p1, p0, Lde/javawi/jstun/test/demo/DiscoveryTestDemo;->iaddress:Ljava/net/InetAddress;

    .line 31
    return-void
.end method

.method public static main([Ljava/lang/String;)V
    .locals 9
    .param p0, "args"    # [Ljava/lang/String;

    .prologue
    .line 52
    :try_start_0
    new-instance v1, Ljava/util/logging/FileHandler;

    const-string/jumbo v7, "logging.txt"

    invoke-direct {v1, v7}, Ljava/util/logging/FileHandler;-><init>(Ljava/lang/String;)V

    .line 53
    .local v1, "fh":Ljava/util/logging/Handler;
    new-instance v7, Ljava/util/logging/SimpleFormatter;

    invoke-direct {v7}, Ljava/util/logging/SimpleFormatter;-><init>()V

    invoke-virtual {v1, v7}, Ljava/util/logging/Handler;->setFormatter(Ljava/util/logging/Formatter;)V

    .line 54
    const-string/jumbo v7, "de.javawi.stun"

    invoke-static {v7}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/util/logging/Logger;->addHandler(Ljava/util/logging/Handler;)V

    .line 55
    const-string/jumbo v7, "de.javawi.stun"

    invoke-static {v7}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v7

    sget-object v8, Ljava/util/logging/Level;->ALL:Ljava/util/logging/Level;

    invoke-virtual {v7, v8}, Ljava/util/logging/Logger;->setLevel(Ljava/util/logging/Level;)V

    .line 57
    invoke-static {}, Ljava/net/NetworkInterface;->getNetworkInterfaces()Ljava/util/Enumeration;

    move-result-object v5

    .line 58
    .local v5, "ifaces":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/net/NetworkInterface;>;"
    :cond_0
    invoke-interface {v5}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v7

    if-eqz v7, :cond_2

    .line 59
    invoke-interface {v5}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/net/NetworkInterface;

    .line 60
    .local v4, "iface":Ljava/net/NetworkInterface;
    invoke-virtual {v4}, Ljava/net/NetworkInterface;->getInetAddresses()Ljava/util/Enumeration;

    move-result-object v3

    .line 61
    .local v3, "iaddresses":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/net/InetAddress;>;"
    :cond_1
    :goto_0
    invoke-interface {v3}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v7

    if-eqz v7, :cond_0

    .line 62
    invoke-interface {v3}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/net/InetAddress;

    .line 63
    .local v2, "iaddress":Ljava/net/InetAddress;
    const-string/jumbo v7, "java.net.Inet4Address"

    invoke-static {v7}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v7, v2}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 64
    invoke-virtual {v2}, Ljava/net/InetAddress;->isLoopbackAddress()Z

    move-result v7

    if-nez v7, :cond_1

    invoke-virtual {v2}, Ljava/net/InetAddress;->isLinkLocalAddress()Z

    move-result v7

    if-nez v7, :cond_1

    .line 65
    new-instance v6, Ljava/lang/Thread;

    new-instance v7, Lde/javawi/jstun/test/demo/DiscoveryTestDemo;

    invoke-direct {v7, v2}, Lde/javawi/jstun/test/demo/DiscoveryTestDemo;-><init>(Ljava/net/InetAddress;)V

    invoke-direct {v6, v7}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 66
    .local v6, "thread":Ljava/lang/Thread;
    invoke-virtual {v6}, Ljava/lang/Thread;->start()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 71
    .end local v1    # "fh":Ljava/util/logging/Handler;
    .end local v2    # "iaddress":Ljava/net/InetAddress;
    .end local v3    # "iaddresses":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/net/InetAddress;>;"
    .end local v4    # "iface":Ljava/net/NetworkInterface;
    .end local v5    # "ifaces":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/net/NetworkInterface;>;"
    .end local v6    # "thread":Ljava/lang/Thread;
    :catch_0
    move-exception v0

    .line 72
    .local v0, "e":Ljava/lang/Exception;
    sget-object v7, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 74
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_2
    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    .line 35
    :try_start_0
    new-instance v2, Lde/javawi/jstun/test/DiscoveryTest;

    iget-object v3, p0, Lde/javawi/jstun/test/demo/DiscoveryTestDemo;->iaddress:Ljava/net/InetAddress;

    const-string/jumbo v4, "jstun.javawi.de"

    const/16 v5, 0xd96

    invoke-direct {v2, v3, v4, v5}, Lde/javawi/jstun/test/DiscoveryTest;-><init>(Ljava/net/InetAddress;Ljava/lang/String;I)V

    .line 41
    .local v2, "test":Lde/javawi/jstun/test/DiscoveryTest;
    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v2}, Lde/javawi/jstun/test/DiscoveryTest;->test()Lde/javawi/jstun/test/DiscoveryInfo;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->println(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/net/BindException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 48
    .end local v2    # "test":Lde/javawi/jstun/test/DiscoveryTest;
    :goto_0
    return-void

    .line 42
    :catch_0
    move-exception v0

    .line 43
    .local v0, "be":Ljava/net/BindException;
    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Lde/javawi/jstun/test/demo/DiscoveryTestDemo;->iaddress:Ljava/net/InetAddress;

    invoke-virtual {v5}, Ljava/net/InetAddress;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, ": "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Ljava/net/BindException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_0

    .line 44
    .end local v0    # "be":Ljava/net/BindException;
    :catch_1
    move-exception v1

    .line 45
    .local v1, "e":Ljava/lang/Exception;
    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 46
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method
