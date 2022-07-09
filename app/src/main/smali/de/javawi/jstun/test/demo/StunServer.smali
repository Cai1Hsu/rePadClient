.class public Lde/javawi/jstun/test/demo/StunServer;
.super Ljava/lang/Object;
.source "StunServer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lde/javawi/jstun/test/demo/StunServer$StunServerReceiverThread;
    }
.end annotation


# static fields
.field private static final LOGGER:Lorg/apache/commons/logging/Log;


# instance fields
.field sockets:Ljava/util/Vector;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Vector",
            "<",
            "Ljava/net/DatagramSocket;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 51
    const-class v0, Lde/javawi/jstun/test/demo/StunServer;

    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    sput-object v0, Lde/javawi/jstun/test/demo/StunServer;->LOGGER:Lorg/apache/commons/logging/Log;

    return-void
.end method

.method public constructor <init>(ILjava/net/InetAddress;ILjava/net/InetAddress;)V
    .locals 2
    .param p1, "primaryPort"    # I
    .param p2, "primary"    # Ljava/net/InetAddress;
    .param p3, "secondaryPort"    # I
    .param p4, "secondary"    # Ljava/net/InetAddress;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/SocketException;
        }
    .end annotation

    .prologue
    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lde/javawi/jstun/test/demo/StunServer;->sockets:Ljava/util/Vector;

    .line 56
    iget-object v0, p0, Lde/javawi/jstun/test/demo/StunServer;->sockets:Ljava/util/Vector;

    new-instance v1, Ljava/net/DatagramSocket;

    invoke-direct {v1, p1, p2}, Ljava/net/DatagramSocket;-><init>(ILjava/net/InetAddress;)V

    invoke-virtual {v0, v1}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 57
    iget-object v0, p0, Lde/javawi/jstun/test/demo/StunServer;->sockets:Ljava/util/Vector;

    new-instance v1, Ljava/net/DatagramSocket;

    invoke-direct {v1, p3, p2}, Ljava/net/DatagramSocket;-><init>(ILjava/net/InetAddress;)V

    invoke-virtual {v0, v1}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 58
    iget-object v0, p0, Lde/javawi/jstun/test/demo/StunServer;->sockets:Ljava/util/Vector;

    new-instance v1, Ljava/net/DatagramSocket;

    invoke-direct {v1, p1, p4}, Ljava/net/DatagramSocket;-><init>(ILjava/net/InetAddress;)V

    invoke-virtual {v0, v1}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 59
    iget-object v0, p0, Lde/javawi/jstun/test/demo/StunServer;->sockets:Ljava/util/Vector;

    new-instance v1, Ljava/net/DatagramSocket;

    invoke-direct {v1, p3, p4}, Ljava/net/DatagramSocket;-><init>(ILjava/net/InetAddress;)V

    invoke-virtual {v0, v1}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 60
    return-void
.end method

.method static synthetic access$000()Lorg/apache/commons/logging/Log;
    .locals 1

    .prologue
    .line 50
    sget-object v0, Lde/javawi/jstun/test/demo/StunServer;->LOGGER:Lorg/apache/commons/logging/Log;

    return-object v0
.end method

.method public static main([Ljava/lang/String;)V
    .locals 9
    .param p0, "args"    # [Ljava/lang/String;

    .prologue
    .line 240
    :try_start_0
    array-length v5, p0

    const/4 v6, 0x4

    if-eq v5, v6, :cond_0

    .line 241
    sget-object v5, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string/jumbo v6, "usage: java de.javawi.jstun.test.demo.StunServer PORT1 IP1 PORT2 IP2"

    invoke-virtual {v5, v6}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 242
    sget-object v5, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v5}, Ljava/io/PrintStream;->println()V

    .line 243
    sget-object v5, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string/jumbo v6, " PORT1 - the first port that should be used by the server"

    invoke-virtual {v5, v6}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 244
    sget-object v5, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string/jumbo v6, "   IP1 - the first ip address that should be used by the server"

    invoke-virtual {v5, v6}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 245
    sget-object v5, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string/jumbo v6, " PORT2 - the second port that should be used by the server"

    invoke-virtual {v5, v6}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 246
    sget-object v5, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string/jumbo v6, "   IP2 - the second ip address that should be used by the server"

    invoke-virtual {v5, v6}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 247
    const/4 v5, 0x0

    invoke-static {v5}, Ljava/lang/System;->exit(I)V

    .line 249
    :cond_0
    new-instance v0, Ljava/util/logging/FileHandler;

    const-string/jumbo v5, "logging_server.txt"

    invoke-direct {v0, v5}, Ljava/util/logging/FileHandler;-><init>(Ljava/lang/String;)V

    .line 250
    .local v0, "fh":Ljava/util/logging/Handler;
    new-instance v5, Ljava/util/logging/SimpleFormatter;

    invoke-direct {v5}, Ljava/util/logging/SimpleFormatter;-><init>()V

    invoke-virtual {v0, v5}, Ljava/util/logging/Handler;->setFormatter(Ljava/util/logging/Formatter;)V

    .line 251
    const-string/jumbo v5, "de.javawi.stun"

    invoke-static {v5}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/util/logging/Logger;->addHandler(Ljava/util/logging/Handler;)V

    .line 252
    const-string/jumbo v5, "de.javawi.stun"

    invoke-static {v5}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v5

    sget-object v6, Ljava/util/logging/Level;->ALL:Ljava/util/logging/Level;

    invoke-virtual {v5, v6}, Ljava/util/logging/Logger;->setLevel(Ljava/util/logging/Level;)V

    .line 253
    new-instance v3, Lde/javawi/jstun/test/demo/StunServer;

    const/4 v5, 0x0

    aget-object v5, p0, v5

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    const/4 v6, 0x1

    aget-object v6, p0, v6

    invoke-static {v6}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v6

    const/4 v7, 0x2

    aget-object v7, p0, v7

    invoke-static {v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v7

    const/4 v8, 0x3

    aget-object v8, p0, v8

    invoke-static {v8}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v8

    invoke-direct {v3, v5, v6, v7, v8}, Lde/javawi/jstun/test/demo/StunServer;-><init>(ILjava/net/InetAddress;ILjava/net/InetAddress;)V

    .line 257
    .local v3, "ss":Lde/javawi/jstun/test/demo/StunServer;
    invoke-virtual {v3}, Lde/javawi/jstun/test/demo/StunServer;->start()V
    :try_end_0
    .catch Ljava/net/SocketException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/net/UnknownHostException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2

    .line 265
    .end local v0    # "fh":Ljava/util/logging/Handler;
    .end local v3    # "ss":Lde/javawi/jstun/test/demo/StunServer;
    :goto_0
    return-void

    .line 258
    :catch_0
    move-exception v2

    .line 259
    .local v2, "se":Ljava/net/SocketException;
    invoke-virtual {v2}, Ljava/net/SocketException;->printStackTrace()V

    goto :goto_0

    .line 260
    .end local v2    # "se":Ljava/net/SocketException;
    :catch_1
    move-exception v4

    .line 261
    .local v4, "uhe":Ljava/net/UnknownHostException;
    invoke-virtual {v4}, Ljava/net/UnknownHostException;->printStackTrace()V

    goto :goto_0

    .line 262
    .end local v4    # "uhe":Ljava/net/UnknownHostException;
    :catch_2
    move-exception v1

    .line 263
    .local v1, "ioe":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0
.end method


# virtual methods
.method public start()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/SocketException;
        }
    .end annotation

    .prologue
    .line 63
    iget-object v3, p0, Lde/javawi/jstun/test/demo/StunServer;->sockets:Ljava/util/Vector;

    invoke-virtual {v3}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/net/DatagramSocket;

    .line 64
    .local v1, "socket":Ljava/net/DatagramSocket;
    const/16 v3, 0x7d0

    invoke-virtual {v1, v3}, Ljava/net/DatagramSocket;->setReceiveBufferSize(I)V

    .line 65
    new-instance v2, Lde/javawi/jstun/test/demo/StunServer$StunServerReceiverThread;

    invoke-direct {v2, p0, v1}, Lde/javawi/jstun/test/demo/StunServer$StunServerReceiverThread;-><init>(Lde/javawi/jstun/test/demo/StunServer;Ljava/net/DatagramSocket;)V

    .line 66
    .local v2, "ssrt":Lde/javawi/jstun/test/demo/StunServer$StunServerReceiverThread;
    invoke-virtual {v2}, Lde/javawi/jstun/test/demo/StunServer$StunServerReceiverThread;->start()V

    goto :goto_0

    .line 68
    .end local v1    # "socket":Ljava/net/DatagramSocket;
    .end local v2    # "ssrt":Lde/javawi/jstun/test/demo/StunServer$StunServerReceiverThread;
    :cond_0
    return-void
.end method
