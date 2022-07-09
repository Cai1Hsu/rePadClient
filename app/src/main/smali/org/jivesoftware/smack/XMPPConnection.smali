.class public Lorg/jivesoftware/smack/XMPPConnection;
.super Lorg/jivesoftware/smack/Connection;
.source "XMPPConnection.java"


# instance fields
.field private anonymous:Z

.field private authenticated:Z

.field private compressionMethods:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private connected:Z

.field connectionID:Ljava/lang/String;

.field packetReader:Lorg/jivesoftware/smack/PacketReader;

.field packetWriter:Lorg/jivesoftware/smack/PacketWriter;

.field roster:Lorg/jivesoftware/smack/Roster;

.field private serverAckdCompression:Z

.field socket:Ljava/net/Socket;

.field private volatile socketClosed:Z

.field private user:Ljava/lang/String;

.field private usingTLS:Z

.field private wasAuthenticated:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 3
    .param p1, "serviceName"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 149
    new-instance v0, Lorg/jivesoftware/smack/ConnectionConfiguration;

    invoke-direct {v0, p1}, Lorg/jivesoftware/smack/ConnectionConfiguration;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v0}, Lorg/jivesoftware/smack/Connection;-><init>(Lorg/jivesoftware/smack/ConnectionConfiguration;)V

    .line 73
    iput-object v2, p0, Lorg/jivesoftware/smack/XMPPConnection;->connectionID:Ljava/lang/String;

    .line 74
    iput-object v2, p0, Lorg/jivesoftware/smack/XMPPConnection;->user:Ljava/lang/String;

    .line 75
    iput-boolean v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->connected:Z

    .line 78
    iput-boolean v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->socketClosed:Z

    .line 83
    iput-boolean v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->authenticated:Z

    .line 88
    iput-boolean v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->wasAuthenticated:Z

    .line 89
    iput-boolean v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->anonymous:Z

    .line 90
    iput-boolean v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->usingTLS:Z

    .line 95
    iput-object v2, p0, Lorg/jivesoftware/smack/XMPPConnection;->roster:Lorg/jivesoftware/smack/Roster;

    .line 105
    iput-boolean v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->serverAckdCompression:Z

    .line 150
    iget-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->config:Lorg/jivesoftware/smack/ConnectionConfiguration;

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smack/ConnectionConfiguration;->setCompressionEnabled(Z)V

    .line 151
    iget-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->config:Lorg/jivesoftware/smack/ConnectionConfiguration;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smack/ConnectionConfiguration;->setSASLAuthenticationEnabled(Z)V

    .line 152
    iget-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->config:Lorg/jivesoftware/smack/ConnectionConfiguration;

    sget-boolean v1, Lorg/jivesoftware/smack/XMPPConnection;->DEBUG_ENABLED:Z

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smack/ConnectionConfiguration;->setDebuggerEnabled(Z)V

    .line 153
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljavax/security/auth/callback/CallbackHandler;)V
    .locals 3
    .param p1, "serviceName"    # Ljava/lang/String;
    .param p2, "callbackHandler"    # Ljavax/security/auth/callback/CallbackHandler;

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 132
    new-instance v0, Lorg/jivesoftware/smack/ConnectionConfiguration;

    invoke-direct {v0, p1}, Lorg/jivesoftware/smack/ConnectionConfiguration;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v0}, Lorg/jivesoftware/smack/Connection;-><init>(Lorg/jivesoftware/smack/ConnectionConfiguration;)V

    .line 73
    iput-object v2, p0, Lorg/jivesoftware/smack/XMPPConnection;->connectionID:Ljava/lang/String;

    .line 74
    iput-object v2, p0, Lorg/jivesoftware/smack/XMPPConnection;->user:Ljava/lang/String;

    .line 75
    iput-boolean v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->connected:Z

    .line 78
    iput-boolean v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->socketClosed:Z

    .line 83
    iput-boolean v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->authenticated:Z

    .line 88
    iput-boolean v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->wasAuthenticated:Z

    .line 89
    iput-boolean v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->anonymous:Z

    .line 90
    iput-boolean v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->usingTLS:Z

    .line 95
    iput-object v2, p0, Lorg/jivesoftware/smack/XMPPConnection;->roster:Lorg/jivesoftware/smack/Roster;

    .line 105
    iput-boolean v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->serverAckdCompression:Z

    .line 133
    iget-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->config:Lorg/jivesoftware/smack/ConnectionConfiguration;

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smack/ConnectionConfiguration;->setCompressionEnabled(Z)V

    .line 134
    iget-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->config:Lorg/jivesoftware/smack/ConnectionConfiguration;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smack/ConnectionConfiguration;->setSASLAuthenticationEnabled(Z)V

    .line 135
    iget-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->config:Lorg/jivesoftware/smack/ConnectionConfiguration;

    sget-boolean v1, Lorg/jivesoftware/smack/XMPPConnection;->DEBUG_ENABLED:Z

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smack/ConnectionConfiguration;->setDebuggerEnabled(Z)V

    .line 136
    iget-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->config:Lorg/jivesoftware/smack/ConnectionConfiguration;

    invoke-virtual {v0, p2}, Lorg/jivesoftware/smack/ConnectionConfiguration;->setCallbackHandler(Ljavax/security/auth/callback/CallbackHandler;)V

    .line 137
    return-void
.end method

.method public constructor <init>(Lorg/jivesoftware/smack/ConnectionConfiguration;)V
    .locals 2
    .param p1, "config"    # Lorg/jivesoftware/smack/ConnectionConfiguration;

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x0

    .line 165
    invoke-direct {p0, p1}, Lorg/jivesoftware/smack/Connection;-><init>(Lorg/jivesoftware/smack/ConnectionConfiguration;)V

    .line 73
    iput-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->connectionID:Ljava/lang/String;

    .line 74
    iput-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->user:Ljava/lang/String;

    .line 75
    iput-boolean v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->connected:Z

    .line 78
    iput-boolean v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->socketClosed:Z

    .line 83
    iput-boolean v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->authenticated:Z

    .line 88
    iput-boolean v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->wasAuthenticated:Z

    .line 89
    iput-boolean v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->anonymous:Z

    .line 90
    iput-boolean v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->usingTLS:Z

    .line 95
    iput-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->roster:Lorg/jivesoftware/smack/Roster;

    .line 105
    iput-boolean v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->serverAckdCompression:Z

    .line 166
    return-void
.end method

.method public constructor <init>(Lorg/jivesoftware/smack/ConnectionConfiguration;Ljavax/security/auth/callback/CallbackHandler;)V
    .locals 2
    .param p1, "config"    # Lorg/jivesoftware/smack/ConnectionConfiguration;
    .param p2, "callbackHandler"    # Ljavax/security/auth/callback/CallbackHandler;

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x0

    .line 187
    invoke-direct {p0, p1}, Lorg/jivesoftware/smack/Connection;-><init>(Lorg/jivesoftware/smack/ConnectionConfiguration;)V

    .line 73
    iput-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->connectionID:Ljava/lang/String;

    .line 74
    iput-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->user:Ljava/lang/String;

    .line 75
    iput-boolean v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->connected:Z

    .line 78
    iput-boolean v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->socketClosed:Z

    .line 83
    iput-boolean v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->authenticated:Z

    .line 88
    iput-boolean v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->wasAuthenticated:Z

    .line 89
    iput-boolean v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->anonymous:Z

    .line 90
    iput-boolean v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->usingTLS:Z

    .line 95
    iput-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->roster:Lorg/jivesoftware/smack/Roster;

    .line 105
    iput-boolean v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->serverAckdCompression:Z

    .line 188
    invoke-virtual {p1, p2}, Lorg/jivesoftware/smack/ConnectionConfiguration;->setCallbackHandler(Ljavax/security/auth/callback/CallbackHandler;)V

    .line 189
    return-void
.end method

.method private connectUsingConfiguration(Lorg/jivesoftware/smack/ConnectionConfiguration;)V
    .locals 17
    .param p1, "config"    # Lorg/jivesoftware/smack/ConnectionConfiguration;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 555
    const/4 v2, 0x0

    .line 556
    .local v2, "exception":Lorg/jivesoftware/smack/XMPPException;
    invoke-virtual/range {p1 .. p1}, Lorg/jivesoftware/smack/ConnectionConfiguration;->getHostAddresses()Ljava/util/List;

    move-result-object v15

    invoke-interface {v15}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    .line 557
    .local v9, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/jivesoftware/smack/util/dns/HostAddress;>;"
    new-instance v3, Ljava/util/LinkedList;

    invoke-direct {v3}, Ljava/util/LinkedList;-><init>()V

    .line 558
    .local v3, "failedAddresses":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smack/util/dns/HostAddress;>;"
    const/4 v14, 0x0

    .line 559
    .local v14, "xmppIOError":Z
    :cond_0
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_1

    .line 560
    const/4 v2, 0x0

    .line 561
    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/jivesoftware/smack/util/dns/HostAddress;

    .line 562
    .local v6, "hostAddress":Lorg/jivesoftware/smack/util/dns/HostAddress;
    invoke-virtual {v6}, Lorg/jivesoftware/smack/util/dns/HostAddress;->getFQDN()Ljava/lang/String;

    move-result-object v5

    .line 563
    .local v5, "host":Ljava/lang/String;
    invoke-virtual {v6}, Lorg/jivesoftware/smack/util/dns/HostAddress;->getPort()I

    move-result v10

    .line 565
    .local v10, "port":I
    :try_start_0
    invoke-virtual/range {p1 .. p1}, Lorg/jivesoftware/smack/ConnectionConfiguration;->getSocketFactory()Ljavax/net/SocketFactory;

    move-result-object v15

    if-nez v15, :cond_2

    .line 566
    new-instance v15, Ljava/net/Socket;

    invoke-direct {v15, v5, v10}, Ljava/net/Socket;-><init>(Ljava/lang/String;I)V

    move-object/from16 v0, p0

    iput-object v15, v0, Lorg/jivesoftware/smack/XMPPConnection;->socket:Ljava/net/Socket;
    :try_end_0
    .catch Ljava/net/UnknownHostException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 581
    :goto_0
    if-nez v2, :cond_3

    .line 583
    move-object/from16 v0, p1

    invoke-virtual {v0, v6}, Lorg/jivesoftware/smack/ConnectionConfiguration;->setUsedHostAddress(Lorg/jivesoftware/smack/util/dns/HostAddress;)V

    .line 607
    .end local v5    # "host":Ljava/lang/String;
    .end local v6    # "hostAddress":Lorg/jivesoftware/smack/util/dns/HostAddress;
    .end local v10    # "port":I
    :cond_1
    const/4 v15, 0x0

    move-object/from16 v0, p0

    iput-boolean v15, v0, Lorg/jivesoftware/smack/XMPPConnection;->socketClosed:Z

    .line 608
    invoke-direct/range {p0 .. p0}, Lorg/jivesoftware/smack/XMPPConnection;->initConnection()V

    .line 609
    return-void

    .line 569
    .restart local v5    # "host":Ljava/lang/String;
    .restart local v6    # "hostAddress":Lorg/jivesoftware/smack/util/dns/HostAddress;
    .restart local v10    # "port":I
    :cond_2
    :try_start_1
    invoke-virtual/range {p1 .. p1}, Lorg/jivesoftware/smack/ConnectionConfiguration;->getSocketFactory()Ljavax/net/SocketFactory;

    move-result-object v15

    invoke-virtual {v15, v5, v10}, Ljavax/net/SocketFactory;->createSocket(Ljava/lang/String;I)Ljava/net/Socket;

    move-result-object v15

    move-object/from16 v0, p0

    iput-object v15, v0, Lorg/jivesoftware/smack/XMPPConnection;->socket:Ljava/net/Socket;
    :try_end_1
    .catch Ljava/net/UnknownHostException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 571
    :catch_0
    move-exception v12

    .line 572
    .local v12, "uhe":Ljava/net/UnknownHostException;
    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v16, "Could not connect to "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string/jumbo v16, ":"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string/jumbo v16, "."

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 573
    .local v1, "errorMessage":Ljava/lang/String;
    new-instance v2, Lorg/jivesoftware/smack/XMPPException;

    .end local v2    # "exception":Lorg/jivesoftware/smack/XMPPException;
    new-instance v15, Lorg/jivesoftware/smack/packet/XMPPError;

    sget-object v16, Lorg/jivesoftware/smack/packet/XMPPError$Condition;->remote_server_timeout:Lorg/jivesoftware/smack/packet/XMPPError$Condition;

    move-object/from16 v0, v16

    invoke-direct {v15, v0, v1}, Lorg/jivesoftware/smack/packet/XMPPError;-><init>(Lorg/jivesoftware/smack/packet/XMPPError$Condition;Ljava/lang/String;)V

    invoke-direct {v2, v1, v15, v12}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;Lorg/jivesoftware/smack/packet/XMPPError;Ljava/lang/Throwable;)V

    .line 580
    .restart local v2    # "exception":Lorg/jivesoftware/smack/XMPPException;
    goto :goto_0

    .line 575
    .end local v1    # "errorMessage":Ljava/lang/String;
    .end local v12    # "uhe":Ljava/net/UnknownHostException;
    :catch_1
    move-exception v8

    .line 576
    .local v8, "ioe":Ljava/io/IOException;
    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v16, "XMPPError connecting to "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string/jumbo v16, ":"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string/jumbo v16, "."

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 577
    .restart local v1    # "errorMessage":Ljava/lang/String;
    new-instance v2, Lorg/jivesoftware/smack/XMPPException;

    .end local v2    # "exception":Lorg/jivesoftware/smack/XMPPException;
    new-instance v15, Lorg/jivesoftware/smack/packet/XMPPError;

    sget-object v16, Lorg/jivesoftware/smack/packet/XMPPError$Condition;->remote_server_error:Lorg/jivesoftware/smack/packet/XMPPError$Condition;

    move-object/from16 v0, v16

    invoke-direct {v15, v0, v1}, Lorg/jivesoftware/smack/packet/XMPPError;-><init>(Lorg/jivesoftware/smack/packet/XMPPError$Condition;Ljava/lang/String;)V

    invoke-direct {v2, v1, v15, v8}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;Lorg/jivesoftware/smack/packet/XMPPError;Ljava/lang/Throwable;)V

    .line 579
    .restart local v2    # "exception":Lorg/jivesoftware/smack/XMPPException;
    const/4 v14, 0x1

    goto/16 :goto_0

    .line 586
    .end local v1    # "errorMessage":Ljava/lang/String;
    .end local v8    # "ioe":Ljava/io/IOException;
    :cond_3
    invoke-virtual {v6, v2}, Lorg/jivesoftware/smack/util/dns/HostAddress;->setException(Ljava/lang/Exception;)V

    .line 587
    invoke-interface {v3, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 588
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-nez v15, :cond_0

    .line 592
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    .line 593
    .local v11, "sb":Ljava/lang/StringBuilder;
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    .local v7, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_4

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/jivesoftware/smack/util/dns/HostAddress;

    .line 594
    .local v4, "fha":Lorg/jivesoftware/smack/util/dns/HostAddress;
    invoke-virtual {v4}, Lorg/jivesoftware/smack/util/dns/HostAddress;->getErrorMessage()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v11, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 595
    const-string/jumbo v15, "; "

    invoke-virtual {v11, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 598
    .end local v4    # "fha":Lorg/jivesoftware/smack/util/dns/HostAddress;
    :cond_4
    if-eqz v14, :cond_5

    .line 599
    new-instance v13, Lorg/jivesoftware/smack/packet/XMPPError;

    sget-object v15, Lorg/jivesoftware/smack/packet/XMPPError$Condition;->remote_server_error:Lorg/jivesoftware/smack/packet/XMPPError$Condition;

    invoke-direct {v13, v15}, Lorg/jivesoftware/smack/packet/XMPPError;-><init>(Lorg/jivesoftware/smack/packet/XMPPError$Condition;)V

    .line 604
    .local v13, "xmppError":Lorg/jivesoftware/smack/packet/XMPPError;
    :goto_2
    new-instance v15, Lorg/jivesoftware/smack/XMPPException;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-direct {v15, v0, v13}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;Lorg/jivesoftware/smack/packet/XMPPError;)V

    throw v15

    .line 602
    .end local v13    # "xmppError":Lorg/jivesoftware/smack/packet/XMPPError;
    :cond_5
    new-instance v13, Lorg/jivesoftware/smack/packet/XMPPError;

    sget-object v15, Lorg/jivesoftware/smack/packet/XMPPError$Condition;->remote_server_timeout:Lorg/jivesoftware/smack/packet/XMPPError$Condition;

    invoke-direct {v13, v15}, Lorg/jivesoftware/smack/packet/XMPPError;-><init>(Lorg/jivesoftware/smack/packet/XMPPError$Condition;)V

    .restart local v13    # "xmppError":Lorg/jivesoftware/smack/packet/XMPPError;
    goto :goto_2
.end method

.method private initConnection()V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x1

    const/4 v4, 0x0

    const/4 v7, 0x0

    .line 618
    iget-object v5, p0, Lorg/jivesoftware/smack/XMPPConnection;->packetReader:Lorg/jivesoftware/smack/PacketReader;

    if-eqz v5, :cond_0

    iget-object v5, p0, Lorg/jivesoftware/smack/XMPPConnection;->packetWriter:Lorg/jivesoftware/smack/PacketWriter;

    if-nez v5, :cond_7

    .line 619
    .local v2, "isFirstInitialization":Z
    :cond_0
    :goto_0
    iput-object v7, p0, Lorg/jivesoftware/smack/XMPPConnection;->compressionHandler:Lorg/jivesoftware/smack/compression/XMPPInputOutputStream;

    .line 620
    iput-boolean v4, p0, Lorg/jivesoftware/smack/XMPPConnection;->serverAckdCompression:Z

    .line 623
    invoke-direct {p0}, Lorg/jivesoftware/smack/XMPPConnection;->initReaderAndWriter()V

    .line 626
    if-eqz v2, :cond_8

    .line 627
    :try_start_0
    new-instance v5, Lorg/jivesoftware/smack/PacketWriter;

    invoke-direct {v5, p0}, Lorg/jivesoftware/smack/PacketWriter;-><init>(Lorg/jivesoftware/smack/XMPPConnection;)V

    iput-object v5, p0, Lorg/jivesoftware/smack/XMPPConnection;->packetWriter:Lorg/jivesoftware/smack/PacketWriter;

    .line 628
    new-instance v5, Lorg/jivesoftware/smack/PacketReader;

    invoke-direct {v5, p0}, Lorg/jivesoftware/smack/PacketReader;-><init>(Lorg/jivesoftware/smack/XMPPConnection;)V

    iput-object v5, p0, Lorg/jivesoftware/smack/XMPPConnection;->packetReader:Lorg/jivesoftware/smack/PacketReader;

    .line 632
    iget-object v5, p0, Lorg/jivesoftware/smack/XMPPConnection;->config:Lorg/jivesoftware/smack/ConnectionConfiguration;

    invoke-virtual {v5}, Lorg/jivesoftware/smack/ConnectionConfiguration;->isDebuggerEnabled()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 633
    iget-object v5, p0, Lorg/jivesoftware/smack/XMPPConnection;->debugger:Lorg/jivesoftware/smack/debugger/SmackDebugger;

    invoke-interface {v5}, Lorg/jivesoftware/smack/debugger/SmackDebugger;->getReaderListener()Lorg/jivesoftware/smack/PacketListener;

    move-result-object v5

    const/4 v6, 0x0

    invoke-virtual {p0, v5, v6}, Lorg/jivesoftware/smack/XMPPConnection;->addPacketListener(Lorg/jivesoftware/smack/PacketListener;Lorg/jivesoftware/smack/filter/PacketFilter;)V

    .line 634
    iget-object v5, p0, Lorg/jivesoftware/smack/XMPPConnection;->debugger:Lorg/jivesoftware/smack/debugger/SmackDebugger;

    invoke-interface {v5}, Lorg/jivesoftware/smack/debugger/SmackDebugger;->getWriterListener()Lorg/jivesoftware/smack/PacketListener;

    move-result-object v5

    if-eqz v5, :cond_1

    .line 635
    iget-object v5, p0, Lorg/jivesoftware/smack/XMPPConnection;->debugger:Lorg/jivesoftware/smack/debugger/SmackDebugger;

    invoke-interface {v5}, Lorg/jivesoftware/smack/debugger/SmackDebugger;->getWriterListener()Lorg/jivesoftware/smack/PacketListener;

    move-result-object v5

    const/4 v6, 0x0

    invoke-virtual {p0, v5, v6}, Lorg/jivesoftware/smack/XMPPConnection;->addPacketSendingListener(Lorg/jivesoftware/smack/PacketListener;Lorg/jivesoftware/smack/filter/PacketFilter;)V

    .line 645
    :cond_1
    :goto_1
    iget-object v5, p0, Lorg/jivesoftware/smack/XMPPConnection;->packetWriter:Lorg/jivesoftware/smack/PacketWriter;

    invoke-virtual {v5}, Lorg/jivesoftware/smack/PacketWriter;->startup()V

    .line 648
    iget-object v5, p0, Lorg/jivesoftware/smack/XMPPConnection;->packetReader:Lorg/jivesoftware/smack/PacketReader;

    invoke-virtual {v5}, Lorg/jivesoftware/smack/PacketReader;->startup()V

    .line 651
    const/4 v5, 0x1

    iput-boolean v5, p0, Lorg/jivesoftware/smack/XMPPConnection;->connected:Z

    .line 653
    if-eqz v2, :cond_9

    .line 655
    invoke-static {}, Lorg/jivesoftware/smack/XMPPConnection;->getConnectionCreationListeners()Ljava/util/Collection;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_a

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/jivesoftware/smack/ConnectionCreationListener;

    .line 656
    .local v3, "listener":Lorg/jivesoftware/smack/ConnectionCreationListener;
    invoke-interface {v3, p0}, Lorg/jivesoftware/smack/ConnectionCreationListener;->connectionCreated(Lorg/jivesoftware/smack/Connection;)V
    :try_end_0
    .catch Lorg/jivesoftware/smack/XMPPException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    .line 664
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v3    # "listener":Lorg/jivesoftware/smack/ConnectionCreationListener;
    :catch_0
    move-exception v0

    .line 668
    .local v0, "ex":Lorg/jivesoftware/smack/XMPPException;
    iget-object v5, p0, Lorg/jivesoftware/smack/XMPPConnection;->packetWriter:Lorg/jivesoftware/smack/PacketWriter;

    if-eqz v5, :cond_2

    .line 670
    :try_start_1
    iget-object v5, p0, Lorg/jivesoftware/smack/XMPPConnection;->packetWriter:Lorg/jivesoftware/smack/PacketWriter;

    invoke-virtual {v5}, Lorg/jivesoftware/smack/PacketWriter;->shutdown()V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_5

    .line 673
    :goto_3
    iput-object v7, p0, Lorg/jivesoftware/smack/XMPPConnection;->packetWriter:Lorg/jivesoftware/smack/PacketWriter;

    .line 675
    :cond_2
    iget-object v5, p0, Lorg/jivesoftware/smack/XMPPConnection;->packetReader:Lorg/jivesoftware/smack/PacketReader;

    if-eqz v5, :cond_3

    .line 677
    :try_start_2
    iget-object v5, p0, Lorg/jivesoftware/smack/XMPPConnection;->packetReader:Lorg/jivesoftware/smack/PacketReader;

    invoke-virtual {v5}, Lorg/jivesoftware/smack/PacketReader;->shutdown()V
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_4

    .line 680
    :goto_4
    iput-object v7, p0, Lorg/jivesoftware/smack/XMPPConnection;->packetReader:Lorg/jivesoftware/smack/PacketReader;

    .line 682
    :cond_3
    iget-object v5, p0, Lorg/jivesoftware/smack/XMPPConnection;->reader:Ljava/io/Reader;

    if-eqz v5, :cond_4

    .line 684
    :try_start_3
    iget-object v5, p0, Lorg/jivesoftware/smack/XMPPConnection;->reader:Ljava/io/Reader;

    invoke-virtual {v5}, Ljava/io/Reader;->close()V
    :try_end_3
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_3

    .line 687
    :goto_5
    iput-object v7, p0, Lorg/jivesoftware/smack/XMPPConnection;->reader:Ljava/io/Reader;

    .line 689
    :cond_4
    iget-object v5, p0, Lorg/jivesoftware/smack/XMPPConnection;->writer:Ljava/io/Writer;

    if-eqz v5, :cond_5

    .line 691
    :try_start_4
    iget-object v5, p0, Lorg/jivesoftware/smack/XMPPConnection;->writer:Ljava/io/Writer;

    invoke-virtual {v5}, Ljava/io/Writer;->close()V
    :try_end_4
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_2

    .line 694
    :goto_6
    iput-object v7, p0, Lorg/jivesoftware/smack/XMPPConnection;->writer:Ljava/io/Writer;

    .line 696
    :cond_5
    iget-object v5, p0, Lorg/jivesoftware/smack/XMPPConnection;->socket:Ljava/net/Socket;

    if-eqz v5, :cond_6

    .line 698
    :try_start_5
    iget-object v5, p0, Lorg/jivesoftware/smack/XMPPConnection;->socket:Ljava/net/Socket;

    invoke-virtual {v5}, Ljava/net/Socket;->close()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_1

    .line 701
    :goto_7
    iput-object v7, p0, Lorg/jivesoftware/smack/XMPPConnection;->socket:Ljava/net/Socket;

    .line 703
    :cond_6
    iget-boolean v5, p0, Lorg/jivesoftware/smack/XMPPConnection;->authenticated:Z

    invoke-direct {p0, v5}, Lorg/jivesoftware/smack/XMPPConnection;->setWasAuthenticated(Z)V

    .line 704
    iput-boolean v4, p0, Lorg/jivesoftware/smack/XMPPConnection;->authenticated:Z

    .line 705
    iput-boolean v4, p0, Lorg/jivesoftware/smack/XMPPConnection;->connected:Z

    .line 707
    throw v0

    .end local v0    # "ex":Lorg/jivesoftware/smack/XMPPException;
    .end local v2    # "isFirstInitialization":Z
    :cond_7
    move v2, v4

    .line 618
    goto/16 :goto_0

    .line 640
    .restart local v2    # "isFirstInitialization":Z
    :cond_8
    :try_start_6
    iget-object v5, p0, Lorg/jivesoftware/smack/XMPPConnection;->packetWriter:Lorg/jivesoftware/smack/PacketWriter;

    invoke-virtual {v5}, Lorg/jivesoftware/smack/PacketWriter;->init()V

    .line 641
    iget-object v5, p0, Lorg/jivesoftware/smack/XMPPConnection;->packetReader:Lorg/jivesoftware/smack/PacketReader;

    invoke-virtual {v5}, Lorg/jivesoftware/smack/PacketReader;->init()V

    goto :goto_1

    .line 659
    :cond_9
    iget-boolean v5, p0, Lorg/jivesoftware/smack/XMPPConnection;->wasAuthenticated:Z

    if-nez v5, :cond_a

    .line 660
    invoke-virtual {p0}, Lorg/jivesoftware/smack/XMPPConnection;->notifyReconnection()V
    :try_end_6
    .catch Lorg/jivesoftware/smack/XMPPException; {:try_start_6 .. :try_end_6} :catch_0

    .line 709
    :cond_a
    return-void

    .line 700
    .restart local v0    # "ex":Lorg/jivesoftware/smack/XMPPException;
    :catch_1
    move-exception v5

    goto :goto_7

    .line 693
    :catch_2
    move-exception v5

    goto :goto_6

    .line 686
    :catch_3
    move-exception v5

    goto :goto_5

    .line 679
    :catch_4
    move-exception v5

    goto :goto_4

    .line 672
    :catch_5
    move-exception v5

    goto :goto_3
.end method

.method private initReaderAndWriter()V
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 713
    :try_start_0
    iget-object v4, p0, Lorg/jivesoftware/smack/XMPPConnection;->compressionHandler:Lorg/jivesoftware/smack/compression/XMPPInputOutputStream;

    if-nez v4, :cond_0

    .line 714
    new-instance v4, Ljava/io/BufferedReader;

    new-instance v5, Ljava/io/InputStreamReader;

    iget-object v6, p0, Lorg/jivesoftware/smack/XMPPConnection;->socket:Ljava/net/Socket;

    invoke-virtual {v6}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v6

    const-string/jumbo v7, "UTF-8"

    invoke-direct {v5, v6, v7}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    invoke-direct {v4, v5}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    iput-object v4, p0, Lorg/jivesoftware/smack/XMPPConnection;->reader:Ljava/io/Reader;

    .line 716
    new-instance v4, Ljava/io/BufferedWriter;

    new-instance v5, Ljava/io/OutputStreamWriter;

    iget-object v6, p0, Lorg/jivesoftware/smack/XMPPConnection;->socket:Ljava/net/Socket;

    invoke-virtual {v6}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v6

    const-string/jumbo v7, "UTF-8"

    invoke-direct {v5, v6, v7}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/lang/String;)V

    invoke-direct {v4, v5}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V

    iput-object v4, p0, Lorg/jivesoftware/smack/XMPPConnection;->writer:Ljava/io/Writer;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 746
    :goto_0
    invoke-virtual {p0}, Lorg/jivesoftware/smack/XMPPConnection;->initDebugger()V

    .line 747
    return-void

    .line 721
    :cond_0
    :try_start_1
    iget-object v4, p0, Lorg/jivesoftware/smack/XMPPConnection;->compressionHandler:Lorg/jivesoftware/smack/compression/XMPPInputOutputStream;

    iget-object v5, p0, Lorg/jivesoftware/smack/XMPPConnection;->socket:Ljava/net/Socket;

    invoke-virtual {v5}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v5

    invoke-virtual {v4, v5}, Lorg/jivesoftware/smack/compression/XMPPInputOutputStream;->getOutputStream(Ljava/io/OutputStream;)Ljava/io/OutputStream;

    move-result-object v3

    .line 722
    .local v3, "os":Ljava/io/OutputStream;
    new-instance v4, Ljava/io/BufferedWriter;

    new-instance v5, Ljava/io/OutputStreamWriter;

    const-string/jumbo v6, "UTF-8"

    invoke-direct {v5, v3, v6}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/lang/String;)V

    invoke-direct {v4, v5}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V

    iput-object v4, p0, Lorg/jivesoftware/smack/XMPPConnection;->writer:Ljava/io/Writer;

    .line 724
    iget-object v4, p0, Lorg/jivesoftware/smack/XMPPConnection;->compressionHandler:Lorg/jivesoftware/smack/compression/XMPPInputOutputStream;

    iget-object v5, p0, Lorg/jivesoftware/smack/XMPPConnection;->socket:Ljava/net/Socket;

    invoke-virtual {v5}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v5

    invoke-virtual {v4, v5}, Lorg/jivesoftware/smack/compression/XMPPInputOutputStream;->getInputStream(Ljava/io/InputStream;)Ljava/io/InputStream;

    move-result-object v2

    .line 725
    .local v2, "is":Ljava/io/InputStream;
    new-instance v4, Ljava/io/BufferedReader;

    new-instance v5, Ljava/io/InputStreamReader;

    const-string/jumbo v6, "UTF-8"

    invoke-direct {v5, v2, v6}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    invoke-direct {v4, v5}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    iput-object v4, p0, Lorg/jivesoftware/smack/XMPPConnection;->reader:Ljava/io/Reader;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 727
    .end local v2    # "is":Ljava/io/InputStream;
    .end local v3    # "os":Ljava/io/OutputStream;
    :catch_0
    move-exception v0

    .line 728
    .local v0, "e":Ljava/lang/Exception;
    :try_start_2
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 729
    const/4 v4, 0x0

    iput-object v4, p0, Lorg/jivesoftware/smack/XMPPConnection;->compressionHandler:Lorg/jivesoftware/smack/compression/XMPPInputOutputStream;

    .line 730
    new-instance v4, Ljava/io/BufferedReader;

    new-instance v5, Ljava/io/InputStreamReader;

    iget-object v6, p0, Lorg/jivesoftware/smack/XMPPConnection;->socket:Ljava/net/Socket;

    invoke-virtual {v6}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v6

    const-string/jumbo v7, "UTF-8"

    invoke-direct {v5, v6, v7}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    invoke-direct {v4, v5}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    iput-object v4, p0, Lorg/jivesoftware/smack/XMPPConnection;->reader:Ljava/io/Reader;

    .line 732
    new-instance v4, Ljava/io/BufferedWriter;

    new-instance v5, Ljava/io/OutputStreamWriter;

    iget-object v6, p0, Lorg/jivesoftware/smack/XMPPConnection;->socket:Ljava/net/Socket;

    invoke-virtual {v6}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v6

    const-string/jumbo v7, "UTF-8"

    invoke-direct {v5, v6, v7}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/lang/String;)V

    invoke-direct {v4, v5}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V

    iput-object v4, p0, Lorg/jivesoftware/smack/XMPPConnection;->writer:Ljava/io/Writer;
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_0

    .line 737
    .end local v0    # "e":Ljava/lang/Exception;
    :catch_1
    move-exception v1

    .line 738
    .local v1, "ioe":Ljava/io/IOException;
    new-instance v4, Lorg/jivesoftware/smack/XMPPException;

    const-string/jumbo v5, "XMPPError establishing connection with server."

    new-instance v6, Lorg/jivesoftware/smack/packet/XMPPError;

    sget-object v7, Lorg/jivesoftware/smack/packet/XMPPError$Condition;->remote_server_error:Lorg/jivesoftware/smack/packet/XMPPError$Condition;

    const-string/jumbo v8, "XMPPError establishing connection with server."

    invoke-direct {v6, v7, v8}, Lorg/jivesoftware/smack/packet/XMPPError;-><init>(Lorg/jivesoftware/smack/packet/XMPPError$Condition;Ljava/lang/String;)V

    invoke-direct {v4, v5, v6, v1}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;Lorg/jivesoftware/smack/packet/XMPPError;Ljava/lang/Throwable;)V

    throw v4
.end method

.method private maybeGetCompressionHandler()Lorg/jivesoftware/smack/compression/XMPPInputOutputStream;
    .locals 4

    .prologue
    .line 910
    iget-object v3, p0, Lorg/jivesoftware/smack/XMPPConnection;->compressionMethods:Ljava/util/Collection;

    if-eqz v3, :cond_1

    .line 911
    sget-object v3, Lorg/jivesoftware/smack/XMPPConnection;->compressionHandlers:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smack/compression/XMPPInputOutputStream;

    .line 912
    .local v0, "handler":Lorg/jivesoftware/smack/compression/XMPPInputOutputStream;
    invoke-virtual {v0}, Lorg/jivesoftware/smack/compression/XMPPInputOutputStream;->isSupported()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 915
    invoke-virtual {v0}, Lorg/jivesoftware/smack/compression/XMPPInputOutputStream;->getCompressionMethod()Ljava/lang/String;

    move-result-object v2

    .line 916
    .local v2, "method":Ljava/lang/String;
    iget-object v3, p0, Lorg/jivesoftware/smack/XMPPConnection;->compressionMethods:Ljava/util/Collection;

    invoke-interface {v3, v2}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 920
    .end local v0    # "handler":Lorg/jivesoftware/smack/compression/XMPPInputOutputStream;
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v2    # "method":Ljava/lang/String;
    :goto_0
    return-object v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private requestStreamCompression(Ljava/lang/String;)V
    .locals 4
    .param p1, "method"    # Ljava/lang/String;

    .prologue
    .line 971
    :try_start_0
    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->writer:Ljava/io/Writer;

    const-string/jumbo v2, "<compress xmlns=\'http://jabber.org/protocol/compress\'>"

    invoke-virtual {v1, v2}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 972
    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->writer:Ljava/io/Writer;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "<method>"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "</method></compress>"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 973
    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->writer:Ljava/io/Writer;

    invoke-virtual {v1}, Ljava/io/Writer;->flush()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 978
    :goto_0
    return-void

    .line 975
    :catch_0
    move-exception v0

    .line 976
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {p0, v0}, Lorg/jivesoftware/smack/XMPPConnection;->notifyConnectionError(Ljava/lang/Exception;)V

    goto :goto_0
.end method

.method private setWasAuthenticated(Z)V
    .locals 1
    .param p1, "wasAuthenticated"    # Z

    .prologue
    .line 1054
    iget-boolean v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->wasAuthenticated:Z

    if-nez v0, :cond_0

    .line 1055
    iput-boolean p1, p0, Lorg/jivesoftware/smack/XMPPConnection;->wasAuthenticated:Z

    .line 1057
    :cond_0
    return-void
.end method

.method private useCompression()Z
    .locals 2

    .prologue
    .line 944
    iget-boolean v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->authenticated:Z

    if-eqz v0, :cond_0

    .line 945
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "Compression should be negotiated before authentication."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 948
    :cond_0
    invoke-direct {p0}, Lorg/jivesoftware/smack/XMPPConnection;->maybeGetCompressionHandler()Lorg/jivesoftware/smack/compression/XMPPInputOutputStream;

    move-result-object v0

    iput-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->compressionHandler:Lorg/jivesoftware/smack/compression/XMPPInputOutputStream;

    if-eqz v0, :cond_1

    .line 949
    iget-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->compressionHandler:Lorg/jivesoftware/smack/compression/XMPPInputOutputStream;

    invoke-virtual {v0}, Lorg/jivesoftware/smack/compression/XMPPInputOutputStream;->getCompressionMethod()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/jivesoftware/smack/XMPPConnection;->requestStreamCompression(Ljava/lang/String;)V

    .line 951
    monitor-enter p0

    .line 953
    :try_start_0
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getPacketReplyTimeout()I

    move-result v0

    mul-int/lit8 v0, v0, 0x5

    int-to-long v0, v0

    invoke-virtual {p0, v0, v1}, Ljava/lang/Object;->wait(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 958
    :goto_0
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 959
    invoke-virtual {p0}, Lorg/jivesoftware/smack/XMPPConnection;->isUsingCompression()Z

    move-result v0

    .line 961
    :goto_1
    return v0

    .line 958
    :catchall_0
    move-exception v0

    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0

    .line 961
    :cond_1
    const/4 v0, 0x0

    goto :goto_1

    .line 955
    :catch_0
    move-exception v0

    goto :goto_0
.end method


# virtual methods
.method public addPacketWriterInterceptor(Lorg/jivesoftware/smack/PacketInterceptor;Lorg/jivesoftware/smack/filter/PacketFilter;)V
    .locals 0
    .param p1, "packetInterceptor"    # Lorg/jivesoftware/smack/PacketInterceptor;
    .param p2, "packetFilter"    # Lorg/jivesoftware/smack/filter/PacketFilter;

    .prologue
    .line 515
    invoke-virtual {p0, p1, p2}, Lorg/jivesoftware/smack/XMPPConnection;->addPacketInterceptor(Lorg/jivesoftware/smack/PacketInterceptor;Lorg/jivesoftware/smack/filter/PacketFilter;)V

    .line 516
    return-void
.end method

.method public addPacketWriterListener(Lorg/jivesoftware/smack/PacketListener;Lorg/jivesoftware/smack/filter/PacketFilter;)V
    .locals 0
    .param p1, "packetListener"    # Lorg/jivesoftware/smack/PacketListener;
    .param p2, "packetFilter"    # Lorg/jivesoftware/smack/filter/PacketFilter;

    .prologue
    .line 541
    invoke-virtual {p0, p1, p2}, Lorg/jivesoftware/smack/XMPPConnection;->addPacketSendingListener(Lorg/jivesoftware/smack/PacketListener;Lorg/jivesoftware/smack/filter/PacketFilter;)V

    .line 542
    return-void
.end method

.method public connect()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 1026
    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->config:Lorg/jivesoftware/smack/ConnectionConfiguration;

    invoke-direct {p0, v1}, Lorg/jivesoftware/smack/XMPPConnection;->connectUsingConfiguration(Lorg/jivesoftware/smack/ConnectionConfiguration;)V

    .line 1029
    iget-boolean v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->connected:Z

    if-eqz v1, :cond_0

    iget-boolean v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->wasAuthenticated:Z

    if-eqz v1, :cond_0

    .line 1032
    :try_start_0
    invoke-virtual {p0}, Lorg/jivesoftware/smack/XMPPConnection;->isAnonymous()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1034
    invoke-virtual {p0}, Lorg/jivesoftware/smack/XMPPConnection;->loginAnonymously()V

    .line 1040
    :goto_0
    invoke-virtual {p0}, Lorg/jivesoftware/smack/XMPPConnection;->notifyReconnection()V

    .line 1046
    :cond_0
    :goto_1
    return-void

    .line 1037
    :cond_1
    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->config:Lorg/jivesoftware/smack/ConnectionConfiguration;

    invoke-virtual {v1}, Lorg/jivesoftware/smack/ConnectionConfiguration;->getUsername()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lorg/jivesoftware/smack/XMPPConnection;->config:Lorg/jivesoftware/smack/ConnectionConfiguration;

    invoke-virtual {v2}, Lorg/jivesoftware/smack/ConnectionConfiguration;->getPassword()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lorg/jivesoftware/smack/XMPPConnection;->config:Lorg/jivesoftware/smack/ConnectionConfiguration;

    invoke-virtual {v3}, Lorg/jivesoftware/smack/ConnectionConfiguration;->getResource()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v1, v2, v3}, Lorg/jivesoftware/smack/XMPPConnection;->login(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/jivesoftware/smack/XMPPException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 1042
    :catch_0
    move-exception v0

    .line 1043
    .local v0, "e":Lorg/jivesoftware/smack/XMPPException;
    invoke-virtual {v0}, Lorg/jivesoftware/smack/XMPPException;->printStackTrace()V

    goto :goto_1
.end method

.method public declared-synchronized disconnect(Lorg/jivesoftware/smack/packet/Presence;)V
    .locals 1
    .param p1, "unavailablePresence"    # Lorg/jivesoftware/smack/packet/Presence;

    .prologue
    .line 472
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->packetReader:Lorg/jivesoftware/smack/PacketReader;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->packetWriter:Lorg/jivesoftware/smack/PacketWriter;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_1

    .line 491
    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    .line 476
    :cond_1
    :try_start_1
    invoke-virtual {p0}, Lorg/jivesoftware/smack/XMPPConnection;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 480
    invoke-virtual {p0, p1}, Lorg/jivesoftware/smack/XMPPConnection;->shutdown(Lorg/jivesoftware/smack/packet/Presence;)V

    .line 482
    iget-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->roster:Lorg/jivesoftware/smack/Roster;

    if-eqz v0, :cond_2

    .line 483
    iget-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->roster:Lorg/jivesoftware/smack/Roster;

    invoke-virtual {v0}, Lorg/jivesoftware/smack/Roster;->cleanup()V

    .line 484
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->roster:Lorg/jivesoftware/smack/Roster;

    .line 487
    :cond_2
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->wasAuthenticated:Z

    .line 489
    iget-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->packetWriter:Lorg/jivesoftware/smack/PacketWriter;

    invoke-virtual {v0}, Lorg/jivesoftware/smack/PacketWriter;->cleanup()V

    .line 490
    iget-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->packetReader:Lorg/jivesoftware/smack/PacketReader;

    invoke-virtual {v0}, Lorg/jivesoftware/smack/PacketReader;->cleanup()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 472
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getConnectionID()Ljava/lang/String;
    .locals 1

    .prologue
    .line 192
    invoke-virtual {p0}, Lorg/jivesoftware/smack/XMPPConnection;->isConnected()Z

    move-result v0

    if-nez v0, :cond_0

    .line 193
    const/4 v0, 0x0

    .line 195
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->connectionID:Ljava/lang/String;

    goto :goto_0
.end method

.method public getRoster()Lorg/jivesoftware/smack/Roster;
    .locals 10

    .prologue
    .line 327
    monitor-enter p0

    .line 330
    :try_start_0
    invoke-virtual {p0}, Lorg/jivesoftware/smack/XMPPConnection;->isAuthenticated()Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-virtual {p0}, Lorg/jivesoftware/smack/XMPPConnection;->isAnonymous()Z

    move-result v6

    if-eqz v6, :cond_2

    .line 331
    :cond_0
    iget-object v6, p0, Lorg/jivesoftware/smack/XMPPConnection;->roster:Lorg/jivesoftware/smack/Roster;

    if-nez v6, :cond_1

    .line 332
    new-instance v6, Lorg/jivesoftware/smack/Roster;

    invoke-direct {v6, p0}, Lorg/jivesoftware/smack/Roster;-><init>(Lorg/jivesoftware/smack/Connection;)V

    iput-object v6, p0, Lorg/jivesoftware/smack/XMPPConnection;->roster:Lorg/jivesoftware/smack/Roster;

    .line 334
    :cond_1
    iget-object v6, p0, Lorg/jivesoftware/smack/XMPPConnection;->roster:Lorg/jivesoftware/smack/Roster;

    monitor-exit p0

    .line 368
    :goto_0
    return-object v6

    .line 336
    :cond_2
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 338
    iget-object v6, p0, Lorg/jivesoftware/smack/XMPPConnection;->config:Lorg/jivesoftware/smack/ConnectionConfiguration;

    invoke-virtual {v6}, Lorg/jivesoftware/smack/ConnectionConfiguration;->isRosterLoadedAtLogin()Z

    move-result v6

    if-nez v6, :cond_3

    .line 339
    iget-object v6, p0, Lorg/jivesoftware/smack/XMPPConnection;->roster:Lorg/jivesoftware/smack/Roster;

    invoke-virtual {v6}, Lorg/jivesoftware/smack/Roster;->reload()V

    .line 348
    :cond_3
    iget-object v6, p0, Lorg/jivesoftware/smack/XMPPConnection;->roster:Lorg/jivesoftware/smack/Roster;

    iget-boolean v6, v6, Lorg/jivesoftware/smack/Roster;->rosterInitialized:Z

    if-nez v6, :cond_5

    .line 350
    :try_start_1
    iget-object v7, p0, Lorg/jivesoftware/smack/XMPPConnection;->roster:Lorg/jivesoftware/smack/Roster;

    monitor-enter v7
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    .line 351
    :try_start_2
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getPacketReplyTimeout()I

    move-result v6

    int-to-long v4, v6

    .line 352
    .local v4, "waitTime":J
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    .line 353
    .local v2, "start":J
    :goto_1
    iget-object v6, p0, Lorg/jivesoftware/smack/XMPPConnection;->roster:Lorg/jivesoftware/smack/Roster;

    iget-boolean v6, v6, Lorg/jivesoftware/smack/Roster;->rosterInitialized:Z

    if-nez v6, :cond_4

    .line 354
    const-wide/16 v8, 0x0

    cmp-long v6, v4, v8

    if-gtz v6, :cond_6

    .line 362
    :cond_4
    monitor-exit v7
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 368
    .end local v2    # "start":J
    .end local v4    # "waitTime":J
    :cond_5
    :goto_2
    iget-object v6, p0, Lorg/jivesoftware/smack/XMPPConnection;->roster:Lorg/jivesoftware/smack/Roster;

    goto :goto_0

    .line 336
    :catchall_0
    move-exception v6

    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v6

    .line 357
    .restart local v2    # "start":J
    .restart local v4    # "waitTime":J
    :cond_6
    :try_start_4
    iget-object v6, p0, Lorg/jivesoftware/smack/XMPPConnection;->roster:Lorg/jivesoftware/smack/Roster;

    invoke-virtual {v6, v4, v5}, Ljava/lang/Object;->wait(J)V

    .line 358
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 359
    .local v0, "now":J
    sub-long v8, v0, v2

    sub-long/2addr v4, v8

    .line 360
    move-wide v2, v0

    .line 361
    goto :goto_1

    .line 362
    .end local v0    # "now":J
    .end local v2    # "start":J
    .end local v4    # "waitTime":J
    :catchall_1
    move-exception v6

    monitor-exit v7
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    :try_start_5
    throw v6
    :try_end_5
    .catch Ljava/lang/InterruptedException; {:try_start_5 .. :try_end_5} :catch_0

    .line 364
    :catch_0
    move-exception v6

    goto :goto_2
.end method

.method public getUser()Ljava/lang/String;
    .locals 1

    .prologue
    .line 199
    invoke-virtual {p0}, Lorg/jivesoftware/smack/XMPPConnection;->isAuthenticated()Z

    move-result v0

    if-nez v0, :cond_0

    .line 200
    const/4 v0, 0x0

    .line 202
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->user:Ljava/lang/String;

    goto :goto_0
.end method

.method public isAnonymous()Z
    .locals 1

    .prologue
    .line 388
    iget-boolean v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->anonymous:Z

    return v0
.end method

.method public isAuthenticated()Z
    .locals 1

    .prologue
    .line 384
    iget-boolean v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->authenticated:Z

    return v0
.end method

.method public isConnected()Z
    .locals 1

    .prologue
    .line 372
    iget-boolean v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->connected:Z

    return v0
.end method

.method public isSecureConnection()Z
    .locals 1

    .prologue
    .line 376
    invoke-virtual {p0}, Lorg/jivesoftware/smack/XMPPConnection;->isUsingTLS()Z

    move-result v0

    return v0
.end method

.method public isSocketClosed()Z
    .locals 1

    .prologue
    .line 380
    iget-boolean v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->socketClosed:Z

    return v0
.end method

.method public isUsingCompression()Z
    .locals 1

    .prologue
    .line 924
    iget-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->compressionHandler:Lorg/jivesoftware/smack/compression/XMPPInputOutputStream;

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->serverAckdCompression:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isUsingTLS()Z
    .locals 1

    .prologue
    .line 760
    iget-boolean v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->usingTLS:Z

    return v0
.end method

.method public declared-synchronized login(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p1, "username"    # Ljava/lang/String;
    .param p2, "password"    # Ljava/lang/String;
    .param p3, "resource"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 207
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/jivesoftware/smack/XMPPConnection;->isConnected()Z

    move-result v1

    if-nez v1, :cond_0

    .line 208
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string/jumbo v2, "Not connected to server."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 207
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1

    .line 210
    :cond_0
    :try_start_1
    iget-boolean v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->authenticated:Z

    if-eqz v1, :cond_1

    .line 211
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string/jumbo v2, "Already logged in to server."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 214
    :cond_1
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    .line 217
    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->config:Lorg/jivesoftware/smack/ConnectionConfiguration;

    invoke-virtual {v1}, Lorg/jivesoftware/smack/ConnectionConfiguration;->isSASLAuthenticationEnabled()Z

    move-result v1

    if-eqz v1, :cond_9

    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->saslAuthentication:Lorg/jivesoftware/smack/SASLAuthentication;

    invoke-virtual {v1}, Lorg/jivesoftware/smack/SASLAuthentication;->hasNonAnonymousAuthentication()Z

    move-result v1

    if-eqz v1, :cond_9

    .line 220
    if-eqz p2, :cond_8

    .line 221
    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->saslAuthentication:Lorg/jivesoftware/smack/SASLAuthentication;

    invoke-virtual {v1, p1, p2, p3}, Lorg/jivesoftware/smack/SASLAuthentication;->authenticate(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 234
    .local v0, "response":Ljava/lang/String;
    :goto_0
    if-eqz v0, :cond_a

    .line 235
    iput-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->user:Ljava/lang/String;

    .line 237
    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->config:Lorg/jivesoftware/smack/ConnectionConfiguration;

    invoke-static {v0}, Lorg/jivesoftware/smack/util/StringUtils;->parseServer(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/jivesoftware/smack/ConnectionConfiguration;->setServiceName(Ljava/lang/String;)V

    .line 247
    :cond_2
    :goto_1
    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->config:Lorg/jivesoftware/smack/ConnectionConfiguration;

    invoke-virtual {v1}, Lorg/jivesoftware/smack/ConnectionConfiguration;->isCompressionEnabled()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 248
    invoke-direct {p0}, Lorg/jivesoftware/smack/XMPPConnection;->useCompression()Z

    .line 252
    :cond_3
    const/4 v1, 0x1

    iput-boolean v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->authenticated:Z

    .line 253
    const/4 v1, 0x0

    iput-boolean v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->anonymous:Z

    .line 256
    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->roster:Lorg/jivesoftware/smack/Roster;

    if-nez v1, :cond_4

    .line 257
    new-instance v1, Lorg/jivesoftware/smack/Roster;

    invoke-direct {v1, p0}, Lorg/jivesoftware/smack/Roster;-><init>(Lorg/jivesoftware/smack/Connection;)V

    iput-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->roster:Lorg/jivesoftware/smack/Roster;

    .line 259
    :cond_4
    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->config:Lorg/jivesoftware/smack/ConnectionConfiguration;

    invoke-virtual {v1}, Lorg/jivesoftware/smack/ConnectionConfiguration;->isRosterLoadedAtLogin()Z

    move-result v1

    if-eqz v1, :cond_5

    .line 260
    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->roster:Lorg/jivesoftware/smack/Roster;

    invoke-virtual {v1}, Lorg/jivesoftware/smack/Roster;->reload()V

    .line 264
    :cond_5
    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->config:Lorg/jivesoftware/smack/ConnectionConfiguration;

    invoke-virtual {v1}, Lorg/jivesoftware/smack/ConnectionConfiguration;->isSendPresence()Z

    move-result v1

    if-eqz v1, :cond_6

    .line 265
    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->packetWriter:Lorg/jivesoftware/smack/PacketWriter;

    new-instance v2, Lorg/jivesoftware/smack/packet/Presence;

    sget-object v3, Lorg/jivesoftware/smack/packet/Presence$Type;->available:Lorg/jivesoftware/smack/packet/Presence$Type;

    invoke-direct {v2, v3}, Lorg/jivesoftware/smack/packet/Presence;-><init>(Lorg/jivesoftware/smack/packet/Presence$Type;)V

    invoke-virtual {v1, v2}, Lorg/jivesoftware/smack/PacketWriter;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 269
    :cond_6
    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->config:Lorg/jivesoftware/smack/ConnectionConfiguration;

    invoke-virtual {v1, p1, p2, p3}, Lorg/jivesoftware/smack/ConnectionConfiguration;->setLoginInfo(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 275
    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->config:Lorg/jivesoftware/smack/ConnectionConfiguration;

    invoke-virtual {v1}, Lorg/jivesoftware/smack/ConnectionConfiguration;->isDebuggerEnabled()Z

    move-result v1

    if-eqz v1, :cond_7

    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->debugger:Lorg/jivesoftware/smack/debugger/SmackDebugger;

    if-eqz v1, :cond_7

    .line 276
    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->debugger:Lorg/jivesoftware/smack/debugger/SmackDebugger;

    iget-object v2, p0, Lorg/jivesoftware/smack/XMPPConnection;->user:Ljava/lang/String;

    invoke-interface {v1, v2}, Lorg/jivesoftware/smack/debugger/SmackDebugger;->userHasLogged(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 278
    :cond_7
    monitor-exit p0

    return-void

    .line 224
    .end local v0    # "response":Ljava/lang/String;
    :cond_8
    :try_start_2
    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->saslAuthentication:Lorg/jivesoftware/smack/SASLAuthentication;

    iget-object v2, p0, Lorg/jivesoftware/smack/XMPPConnection;->config:Lorg/jivesoftware/smack/ConnectionConfiguration;

    invoke-virtual {v2}, Lorg/jivesoftware/smack/ConnectionConfiguration;->getCallbackHandler()Ljavax/security/auth/callback/CallbackHandler;

    move-result-object v2

    invoke-virtual {v1, p1, p3, v2}, Lorg/jivesoftware/smack/SASLAuthentication;->authenticate(Ljava/lang/String;Ljava/lang/String;Ljavax/security/auth/callback/CallbackHandler;)Ljava/lang/String;

    move-result-object v0

    .restart local v0    # "response":Ljava/lang/String;
    goto :goto_0

    .line 230
    .end local v0    # "response":Ljava/lang/String;
    :cond_9
    new-instance v1, Lorg/jivesoftware/smack/NonSASLAuthentication;

    invoke-direct {v1, p0}, Lorg/jivesoftware/smack/NonSASLAuthentication;-><init>(Lorg/jivesoftware/smack/Connection;)V

    invoke-virtual {v1, p1, p2, p3}, Lorg/jivesoftware/smack/NonSASLAuthentication;->authenticate(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .restart local v0    # "response":Ljava/lang/String;
    goto :goto_0

    .line 240
    :cond_a
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "@"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lorg/jivesoftware/smack/XMPPConnection;->getServiceName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->user:Ljava/lang/String;

    .line 241
    if-eqz p3, :cond_2

    .line 242
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lorg/jivesoftware/smack/XMPPConnection;->user:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->user:Ljava/lang/String;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto/16 :goto_1
.end method

.method public declared-synchronized loginAnonymously()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 282
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/jivesoftware/smack/XMPPConnection;->isConnected()Z

    move-result v1

    if-nez v1, :cond_0

    .line 283
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string/jumbo v2, "Not connected to server."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 282
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1

    .line 285
    :cond_0
    :try_start_1
    iget-boolean v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->authenticated:Z

    if-eqz v1, :cond_1

    .line 286
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string/jumbo v2, "Already logged in to server."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 290
    :cond_1
    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->config:Lorg/jivesoftware/smack/ConnectionConfiguration;

    invoke-virtual {v1}, Lorg/jivesoftware/smack/ConnectionConfiguration;->isSASLAuthenticationEnabled()Z

    move-result v1

    if-eqz v1, :cond_4

    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->saslAuthentication:Lorg/jivesoftware/smack/SASLAuthentication;

    invoke-virtual {v1}, Lorg/jivesoftware/smack/SASLAuthentication;->hasAnonymousAuthentication()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 292
    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->saslAuthentication:Lorg/jivesoftware/smack/SASLAuthentication;

    invoke-virtual {v1}, Lorg/jivesoftware/smack/SASLAuthentication;->authenticateAnonymously()Ljava/lang/String;

    move-result-object v0

    .line 300
    .local v0, "response":Ljava/lang/String;
    :goto_0
    iput-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->user:Ljava/lang/String;

    .line 302
    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->config:Lorg/jivesoftware/smack/ConnectionConfiguration;

    invoke-static {v0}, Lorg/jivesoftware/smack/util/StringUtils;->parseServer(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/jivesoftware/smack/ConnectionConfiguration;->setServiceName(Ljava/lang/String;)V

    .line 305
    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->config:Lorg/jivesoftware/smack/ConnectionConfiguration;

    invoke-virtual {v1}, Lorg/jivesoftware/smack/ConnectionConfiguration;->isCompressionEnabled()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 306
    invoke-direct {p0}, Lorg/jivesoftware/smack/XMPPConnection;->useCompression()Z

    .line 310
    :cond_2
    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->packetWriter:Lorg/jivesoftware/smack/PacketWriter;

    new-instance v2, Lorg/jivesoftware/smack/packet/Presence;

    sget-object v3, Lorg/jivesoftware/smack/packet/Presence$Type;->available:Lorg/jivesoftware/smack/packet/Presence$Type;

    invoke-direct {v2, v3}, Lorg/jivesoftware/smack/packet/Presence;-><init>(Lorg/jivesoftware/smack/packet/Presence$Type;)V

    invoke-virtual {v1, v2}, Lorg/jivesoftware/smack/PacketWriter;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 313
    const/4 v1, 0x1

    iput-boolean v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->authenticated:Z

    .line 314
    const/4 v1, 0x1

    iput-boolean v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->anonymous:Z

    .line 320
    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->config:Lorg/jivesoftware/smack/ConnectionConfiguration;

    invoke-virtual {v1}, Lorg/jivesoftware/smack/ConnectionConfiguration;->isDebuggerEnabled()Z

    move-result v1

    if-eqz v1, :cond_3

    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->debugger:Lorg/jivesoftware/smack/debugger/SmackDebugger;

    if-eqz v1, :cond_3

    .line 321
    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->debugger:Lorg/jivesoftware/smack/debugger/SmackDebugger;

    iget-object v2, p0, Lorg/jivesoftware/smack/XMPPConnection;->user:Ljava/lang/String;

    invoke-interface {v1, v2}, Lorg/jivesoftware/smack/debugger/SmackDebugger;->userHasLogged(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 323
    :cond_3
    monitor-exit p0

    return-void

    .line 296
    .end local v0    # "response":Ljava/lang/String;
    :cond_4
    :try_start_2
    new-instance v1, Lorg/jivesoftware/smack/NonSASLAuthentication;

    invoke-direct {v1, p0}, Lorg/jivesoftware/smack/NonSASLAuthentication;-><init>(Lorg/jivesoftware/smack/Connection;)V

    invoke-virtual {v1}, Lorg/jivesoftware/smack/NonSASLAuthentication;->authenticateAnonymously()Ljava/lang/String;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result-object v0

    .restart local v0    # "response":Ljava/lang/String;
    goto :goto_0
.end method

.method declared-synchronized notifyConnectionError(Ljava/lang/Exception;)V
    .locals 5
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 1067
    monitor-enter p0

    :try_start_0
    iget-object v3, p0, Lorg/jivesoftware/smack/XMPPConnection;->packetReader:Lorg/jivesoftware/smack/PacketReader;

    iget-boolean v3, v3, Lorg/jivesoftware/smack/PacketReader;->done:Z

    if-eqz v3, :cond_1

    iget-object v3, p0, Lorg/jivesoftware/smack/XMPPConnection;->packetWriter:Lorg/jivesoftware/smack/PacketWriter;

    iget-boolean v3, v3, Lorg/jivesoftware/smack/PacketWriter;->done:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v3, :cond_1

    .line 1086
    :cond_0
    monitor-exit p0

    return-void

    .line 1069
    :cond_1
    :try_start_1
    iget-object v3, p0, Lorg/jivesoftware/smack/XMPPConnection;->packetReader:Lorg/jivesoftware/smack/PacketReader;

    const/4 v4, 0x1

    iput-boolean v4, v3, Lorg/jivesoftware/smack/PacketReader;->done:Z

    .line 1070
    iget-object v3, p0, Lorg/jivesoftware/smack/XMPPConnection;->packetWriter:Lorg/jivesoftware/smack/PacketWriter;

    const/4 v4, 0x1

    iput-boolean v4, v3, Lorg/jivesoftware/smack/PacketWriter;->done:Z

    .line 1072
    new-instance v3, Lorg/jivesoftware/smack/packet/Presence;

    sget-object v4, Lorg/jivesoftware/smack/packet/Presence$Type;->unavailable:Lorg/jivesoftware/smack/packet/Presence$Type;

    invoke-direct {v3, v4}, Lorg/jivesoftware/smack/packet/Presence;-><init>(Lorg/jivesoftware/smack/packet/Presence$Type;)V

    invoke-virtual {p0, v3}, Lorg/jivesoftware/smack/XMPPConnection;->shutdown(Lorg/jivesoftware/smack/packet/Presence;)V

    .line 1074
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    .line 1076
    invoke-virtual {p0}, Lorg/jivesoftware/smack/XMPPConnection;->getConnectionListeners()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/jivesoftware/smack/ConnectionListener;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1078
    .local v2, "listener":Lorg/jivesoftware/smack/ConnectionListener;
    :try_start_2
    invoke-interface {v2, p1}, Lorg/jivesoftware/smack/ConnectionListener;->connectionClosedOnError(Ljava/lang/Exception;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 1080
    :catch_0
    move-exception v0

    .line 1083
    .local v0, "e2":Ljava/lang/Exception;
    :try_start_3
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    .line 1067
    .end local v0    # "e2":Ljava/lang/Exception;
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v2    # "listener":Lorg/jivesoftware/smack/ConnectionListener;
    :catchall_0
    move-exception v3

    monitor-exit p0

    throw v3
.end method

.method protected notifyReconnection()V
    .locals 4

    .prologue
    .line 1093
    invoke-virtual {p0}, Lorg/jivesoftware/smack/XMPPConnection;->getConnectionListeners()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/jivesoftware/smack/ConnectionListener;

    .line 1095
    .local v2, "listener":Lorg/jivesoftware/smack/ConnectionListener;
    :try_start_0
    invoke-interface {v2}, Lorg/jivesoftware/smack/ConnectionListener;->reconnectionSuccessful()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 1097
    :catch_0
    move-exception v0

    .line 1100
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    .line 1103
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v2    # "listener":Lorg/jivesoftware/smack/ConnectionListener;
    :cond_0
    return-void
.end method

.method proceedTLSReceived()V
    .locals 23
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 798
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/XMPPConnection;->config:Lorg/jivesoftware/smack/ConnectionConfiguration;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lorg/jivesoftware/smack/ConnectionConfiguration;->getCustomSSLContext()Ljavax/net/ssl/SSLContext;

    move-result-object v7

    .line 799
    .local v7, "context":Ljavax/net/ssl/SSLContext;
    const/4 v11, 0x0

    .line 800
    .local v11, "ks":Ljava/security/KeyStore;
    const/4 v10, 0x0

    .line 801
    .local v10, "kms":[Ljavax/net/ssl/KeyManager;
    const/4 v14, 0x0

    .line 803
    .local v14, "pcb":Ljavax/security/auth/callback/PasswordCallback;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/XMPPConnection;->config:Lorg/jivesoftware/smack/ConnectionConfiguration;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lorg/jivesoftware/smack/ConnectionConfiguration;->getCallbackHandler()Ljavax/security/auth/callback/CallbackHandler;

    move-result-object v18

    if-nez v18, :cond_2

    .line 804
    const/4 v11, 0x0

    .line 861
    :cond_0
    :goto_0
    if-nez v7, :cond_1

    .line 862
    const-string/jumbo v18, "TLS"

    invoke-static/range {v18 .. v18}, Ljavax/net/ssl/SSLContext;->getInstance(Ljava/lang/String;)Ljavax/net/ssl/SSLContext;

    move-result-object v7

    .line 863
    const/16 v18, 0x1

    move/from16 v0, v18

    new-array v0, v0, [Ljavax/net/ssl/TrustManager;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    new-instance v20, Lorg/jivesoftware/smack/ServerTrustManager;

    invoke-virtual/range {p0 .. p0}, Lorg/jivesoftware/smack/XMPPConnection;->getServiceName()Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/XMPPConnection;->config:Lorg/jivesoftware/smack/ConnectionConfiguration;

    move-object/from16 v22, v0

    invoke-direct/range {v20 .. v22}, Lorg/jivesoftware/smack/ServerTrustManager;-><init>(Ljava/lang/String;Lorg/jivesoftware/smack/ConnectionConfiguration;)V

    aput-object v20, v18, v19

    new-instance v19, Ljava/security/SecureRandom;

    invoke-direct/range {v19 .. v19}, Ljava/security/SecureRandom;-><init>()V

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v7, v10, v0, v1}, Ljavax/net/ssl/SSLContext;->init([Ljavax/net/ssl/KeyManager;[Ljavax/net/ssl/TrustManager;Ljava/security/SecureRandom;)V

    .line 866
    :cond_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/XMPPConnection;->socket:Ljava/net/Socket;

    move-object/from16 v17, v0

    .line 868
    .local v17, "plain":Ljava/net/Socket;
    invoke-virtual {v7}, Ljavax/net/ssl/SSLContext;->getSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v18

    invoke-virtual/range {v17 .. v17}, Ljava/net/Socket;->getInetAddress()Ljava/net/InetAddress;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v17 .. v17}, Ljava/net/Socket;->getPort()I

    move-result v20

    const/16 v21, 0x1

    move-object/from16 v0, v18

    move-object/from16 v1, v17

    move-object/from16 v2, v19

    move/from16 v3, v20

    move/from16 v4, v21

    invoke-virtual {v0, v1, v2, v3, v4}, Ljavax/net/ssl/SSLSocketFactory;->createSocket(Ljava/net/Socket;Ljava/lang/String;IZ)Ljava/net/Socket;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/jivesoftware/smack/XMPPConnection;->socket:Ljava/net/Socket;

    .line 870
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/XMPPConnection;->socket:Ljava/net/Socket;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    invoke-virtual/range {v18 .. v19}, Ljava/net/Socket;->setSoTimeout(I)V

    .line 871
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/XMPPConnection;->socket:Ljava/net/Socket;

    move-object/from16 v18, v0

    const/16 v19, 0x1

    invoke-virtual/range {v18 .. v19}, Ljava/net/Socket;->setKeepAlive(Z)V

    .line 873
    invoke-direct/range {p0 .. p0}, Lorg/jivesoftware/smack/XMPPConnection;->initReaderAndWriter()V

    .line 875
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/XMPPConnection;->socket:Ljava/net/Socket;

    move-object/from16 v18, v0

    check-cast v18, Ljavax/net/ssl/SSLSocket;

    invoke-virtual/range {v18 .. v18}, Ljavax/net/ssl/SSLSocket;->startHandshake()V

    .line 886
    const/16 v18, 0x1

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lorg/jivesoftware/smack/XMPPConnection;->usingTLS:Z

    .line 889
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/XMPPConnection;->packetWriter:Lorg/jivesoftware/smack/PacketWriter;

    move-object/from16 v18, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/XMPPConnection;->writer:Ljava/io/Writer;

    move-object/from16 v19, v0

    invoke-virtual/range {v18 .. v19}, Lorg/jivesoftware/smack/PacketWriter;->setWriter(Ljava/io/Writer;)V

    .line 891
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/XMPPConnection;->packetWriter:Lorg/jivesoftware/smack/PacketWriter;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lorg/jivesoftware/smack/PacketWriter;->openStream()V

    .line 892
    return-void

    .line 805
    .end local v17    # "plain":Ljava/net/Socket;
    :cond_2
    if-nez v7, :cond_0

    .line 807
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/XMPPConnection;->config:Lorg/jivesoftware/smack/ConnectionConfiguration;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lorg/jivesoftware/smack/ConnectionConfiguration;->getKeystoreType()Ljava/lang/String;

    move-result-object v18

    const-string/jumbo v19, "NONE"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_3

    .line 808
    const/4 v11, 0x0

    .line 809
    const/4 v14, 0x0

    .line 846
    :goto_1
    const-string/jumbo v18, "SunX509"

    invoke-static/range {v18 .. v18}, Ljavax/net/ssl/KeyManagerFactory;->getInstance(Ljava/lang/String;)Ljavax/net/ssl/KeyManagerFactory;

    move-result-object v9

    .line 848
    .local v9, "kmf":Ljavax/net/ssl/KeyManagerFactory;
    if-nez v14, :cond_6

    .line 849
    const/16 v18, 0x0

    :try_start_0
    move-object/from16 v0, v18

    invoke-virtual {v9, v11, v0}, Ljavax/net/ssl/KeyManagerFactory;->init(Ljava/security/KeyStore;[C)V

    .line 854
    :goto_2
    invoke-virtual {v9}, Ljavax/net/ssl/KeyManagerFactory;->getKeyManagers()[Ljavax/net/ssl/KeyManager;
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_2

    move-result-object v10

    goto/16 :goto_0

    .line 811
    .end local v9    # "kmf":Ljavax/net/ssl/KeyManagerFactory;
    :cond_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/XMPPConnection;->config:Lorg/jivesoftware/smack/ConnectionConfiguration;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lorg/jivesoftware/smack/ConnectionConfiguration;->getKeystoreType()Ljava/lang/String;

    move-result-object v18

    const-string/jumbo v19, "PKCS11"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_4

    .line 813
    :try_start_1
    const-string/jumbo v18, "sun.security.pkcs11.SunPKCS11"

    invoke-static/range {v18 .. v18}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v18

    const/16 v19, 0x1

    move/from16 v0, v19

    new-array v0, v0, [Ljava/lang/Class;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    const-class v21, Ljava/io/InputStream;

    aput-object v21, v19, v20

    invoke-virtual/range {v18 .. v19}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v5

    .line 814
    .local v5, "c":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v19, "name = SmartCard\nlibrary = "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/XMPPConnection;->config:Lorg/jivesoftware/smack/ConnectionConfiguration;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lorg/jivesoftware/smack/ConnectionConfiguration;->getPKCS11Library()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    .line 815
    .local v16, "pkcs11Config":Ljava/lang/String;
    new-instance v6, Ljava/io/ByteArrayInputStream;

    invoke-virtual/range {v16 .. v16}, Ljava/lang/String;->getBytes()[B

    move-result-object v18

    move-object/from16 v0, v18

    invoke-direct {v6, v0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 816
    .local v6, "config":Ljava/io/ByteArrayInputStream;
    const/16 v18, 0x1

    move/from16 v0, v18

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    aput-object v6, v18, v19

    move-object/from16 v0, v18

    invoke-virtual {v5, v0}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/security/Provider;

    .line 817
    .local v13, "p":Ljava/security/Provider;
    invoke-static {v13}, Ljava/security/Security;->addProvider(Ljava/security/Provider;)I

    .line 818
    const-string/jumbo v18, "PKCS11"

    move-object/from16 v0, v18

    invoke-static {v0, v13}, Ljava/security/KeyStore;->getInstance(Ljava/lang/String;Ljava/security/Provider;)Ljava/security/KeyStore;

    move-result-object v11

    .line 819
    new-instance v15, Ljavax/security/auth/callback/PasswordCallback;

    const-string/jumbo v18, "PKCS11 Password: "

    const/16 v19, 0x0

    move-object/from16 v0, v18

    move/from16 v1, v19

    invoke-direct {v15, v0, v1}, Ljavax/security/auth/callback/PasswordCallback;-><init>(Ljava/lang/String;Z)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 820
    .end local v14    # "pcb":Ljavax/security/auth/callback/PasswordCallback;
    .local v15, "pcb":Ljavax/security/auth/callback/PasswordCallback;
    :try_start_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/XMPPConnection;->config:Lorg/jivesoftware/smack/ConnectionConfiguration;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lorg/jivesoftware/smack/ConnectionConfiguration;->getCallbackHandler()Ljavax/security/auth/callback/CallbackHandler;

    move-result-object v18

    const/16 v19, 0x1

    move/from16 v0, v19

    new-array v0, v0, [Ljavax/security/auth/callback/Callback;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    aput-object v15, v19, v20

    invoke-interface/range {v18 .. v19}, Ljavax/security/auth/callback/CallbackHandler;->handle([Ljavax/security/auth/callback/Callback;)V

    .line 821
    const/16 v18, 0x0

    invoke-virtual {v15}, Ljavax/security/auth/callback/PasswordCallback;->getPassword()[C

    move-result-object v19

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v11, v0, v1}, Ljava/security/KeyStore;->load(Ljava/io/InputStream;[C)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_4

    move-object v14, v15

    .line 826
    .end local v15    # "pcb":Ljavax/security/auth/callback/PasswordCallback;
    .restart local v14    # "pcb":Ljavax/security/auth/callback/PasswordCallback;
    goto/16 :goto_1

    .line 823
    .end local v5    # "c":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    .end local v6    # "config":Ljava/io/ByteArrayInputStream;
    .end local v13    # "p":Ljava/security/Provider;
    .end local v16    # "pkcs11Config":Ljava/lang/String;
    :catch_0
    move-exception v8

    .line 824
    .local v8, "e":Ljava/lang/Exception;
    :goto_3
    const/4 v11, 0x0

    .line 825
    const/4 v14, 0x0

    .line 826
    goto/16 :goto_1

    .line 828
    .end local v8    # "e":Ljava/lang/Exception;
    :cond_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/XMPPConnection;->config:Lorg/jivesoftware/smack/ConnectionConfiguration;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lorg/jivesoftware/smack/ConnectionConfiguration;->getKeystoreType()Ljava/lang/String;

    move-result-object v18

    const-string/jumbo v19, "Apple"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_5

    .line 829
    const-string/jumbo v18, "KeychainStore"

    const-string/jumbo v19, "Apple"

    invoke-static/range {v18 .. v19}, Ljava/security/KeyStore;->getInstance(Ljava/lang/String;Ljava/lang/String;)Ljava/security/KeyStore;

    move-result-object v11

    .line 830
    const/16 v18, 0x0

    const/16 v19, 0x0

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v11, v0, v1}, Ljava/security/KeyStore;->load(Ljava/io/InputStream;[C)V

    goto/16 :goto_1

    .line 835
    :cond_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/XMPPConnection;->config:Lorg/jivesoftware/smack/ConnectionConfiguration;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lorg/jivesoftware/smack/ConnectionConfiguration;->getKeystoreType()Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v18 .. v18}, Ljava/security/KeyStore;->getInstance(Ljava/lang/String;)Ljava/security/KeyStore;

    move-result-object v11

    .line 837
    :try_start_3
    new-instance v15, Ljavax/security/auth/callback/PasswordCallback;

    const-string/jumbo v18, "Keystore Password: "

    const/16 v19, 0x0

    move-object/from16 v0, v18

    move/from16 v1, v19

    invoke-direct {v15, v0, v1}, Ljavax/security/auth/callback/PasswordCallback;-><init>(Ljava/lang/String;Z)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    .line 838
    .end local v14    # "pcb":Ljavax/security/auth/callback/PasswordCallback;
    .restart local v15    # "pcb":Ljavax/security/auth/callback/PasswordCallback;
    :try_start_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/XMPPConnection;->config:Lorg/jivesoftware/smack/ConnectionConfiguration;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lorg/jivesoftware/smack/ConnectionConfiguration;->getCallbackHandler()Ljavax/security/auth/callback/CallbackHandler;

    move-result-object v18

    const/16 v19, 0x1

    move/from16 v0, v19

    new-array v0, v0, [Ljavax/security/auth/callback/Callback;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    aput-object v15, v19, v20

    invoke-interface/range {v18 .. v19}, Ljavax/security/auth/callback/CallbackHandler;->handle([Ljavax/security/auth/callback/Callback;)V

    .line 839
    new-instance v18, Ljava/io/FileInputStream;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/XMPPConnection;->config:Lorg/jivesoftware/smack/ConnectionConfiguration;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lorg/jivesoftware/smack/ConnectionConfiguration;->getKeystorePath()Ljava/lang/String;

    move-result-object v19

    invoke-direct/range {v18 .. v19}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    invoke-virtual {v15}, Ljavax/security/auth/callback/PasswordCallback;->getPassword()[C

    move-result-object v19

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v11, v0, v1}, Ljava/security/KeyStore;->load(Ljava/io/InputStream;[C)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3

    move-object v14, v15

    .line 844
    .end local v15    # "pcb":Ljavax/security/auth/callback/PasswordCallback;
    .restart local v14    # "pcb":Ljavax/security/auth/callback/PasswordCallback;
    goto/16 :goto_1

    .line 841
    :catch_1
    move-exception v8

    .line 842
    .restart local v8    # "e":Ljava/lang/Exception;
    :goto_4
    const/4 v11, 0x0

    .line 843
    const/4 v14, 0x0

    goto/16 :goto_1

    .line 851
    .end local v8    # "e":Ljava/lang/Exception;
    .restart local v9    # "kmf":Ljavax/net/ssl/KeyManagerFactory;
    :cond_6
    :try_start_5
    invoke-virtual {v14}, Ljavax/security/auth/callback/PasswordCallback;->getPassword()[C

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v9, v11, v0}, Ljavax/net/ssl/KeyManagerFactory;->init(Ljava/security/KeyStore;[C)V

    .line 852
    invoke-virtual {v14}, Ljavax/security/auth/callback/PasswordCallback;->clearPassword()V
    :try_end_5
    .catch Ljava/lang/NullPointerException; {:try_start_5 .. :try_end_5} :catch_2

    goto/16 :goto_2

    .line 855
    :catch_2
    move-exception v12

    .line 856
    .local v12, "npe":Ljava/lang/NullPointerException;
    const/4 v10, 0x0

    goto/16 :goto_0

    .line 841
    .end local v9    # "kmf":Ljavax/net/ssl/KeyManagerFactory;
    .end local v12    # "npe":Ljava/lang/NullPointerException;
    .end local v14    # "pcb":Ljavax/security/auth/callback/PasswordCallback;
    .restart local v15    # "pcb":Ljavax/security/auth/callback/PasswordCallback;
    :catch_3
    move-exception v8

    move-object v14, v15

    .end local v15    # "pcb":Ljavax/security/auth/callback/PasswordCallback;
    .restart local v14    # "pcb":Ljavax/security/auth/callback/PasswordCallback;
    goto :goto_4

    .line 823
    .end local v14    # "pcb":Ljavax/security/auth/callback/PasswordCallback;
    .restart local v5    # "c":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    .restart local v6    # "config":Ljava/io/ByteArrayInputStream;
    .restart local v13    # "p":Ljava/security/Provider;
    .restart local v15    # "pcb":Ljavax/security/auth/callback/PasswordCallback;
    .restart local v16    # "pkcs11Config":Ljava/lang/String;
    :catch_4
    move-exception v8

    move-object v14, v15

    .end local v15    # "pcb":Ljavax/security/auth/callback/PasswordCallback;
    .restart local v14    # "pcb":Ljavax/security/auth/callback/PasswordCallback;
    goto/16 :goto_3
.end method

.method public removePacketWriterInterceptor(Lorg/jivesoftware/smack/PacketInterceptor;)V
    .locals 0
    .param p1, "packetInterceptor"    # Lorg/jivesoftware/smack/PacketInterceptor;

    .prologue
    .line 525
    invoke-virtual {p0, p1}, Lorg/jivesoftware/smack/XMPPConnection;->removePacketInterceptor(Lorg/jivesoftware/smack/PacketInterceptor;)V

    .line 526
    return-void
.end method

.method public removePacketWriterListener(Lorg/jivesoftware/smack/PacketListener;)V
    .locals 0
    .param p1, "packetListener"    # Lorg/jivesoftware/smack/PacketListener;

    .prologue
    .line 551
    invoke-virtual {p0, p1}, Lorg/jivesoftware/smack/XMPPConnection;->removePacketSendingListener(Lorg/jivesoftware/smack/PacketListener;)V

    .line 552
    return-void
.end method

.method public sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V
    .locals 2
    .param p1, "packet"    # Lorg/jivesoftware/smack/packet/Packet;

    .prologue
    .line 494
    invoke-virtual {p0}, Lorg/jivesoftware/smack/XMPPConnection;->isConnected()Z

    move-result v0

    if-nez v0, :cond_0

    .line 495
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "Not connected to server."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 497
    :cond_0
    if-nez p1, :cond_1

    .line 498
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "Packet is null."

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 500
    :cond_1
    iget-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->packetWriter:Lorg/jivesoftware/smack/PacketWriter;

    invoke-virtual {v0, p1}, Lorg/jivesoftware/smack/PacketWriter;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 501
    return-void
.end method

.method setAvailableCompressionMethods(Ljava/util/Collection;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 900
    .local p1, "methods":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    iput-object p1, p0, Lorg/jivesoftware/smack/XMPPConnection;->compressionMethods:Ljava/util/Collection;

    .line 901
    return-void
.end method

.method protected shutdown(Lorg/jivesoftware/smack/packet/Presence;)V
    .locals 6
    .param p1, "unavailablePresence"    # Lorg/jivesoftware/smack/packet/Presence;

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x0

    .line 402
    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->packetWriter:Lorg/jivesoftware/smack/PacketWriter;

    if-eqz v1, :cond_0

    .line 403
    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->packetWriter:Lorg/jivesoftware/smack/PacketWriter;

    invoke-virtual {v1, p1}, Lorg/jivesoftware/smack/PacketWriter;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 406
    :cond_0
    iget-boolean v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->authenticated:Z

    invoke-direct {p0, v1}, Lorg/jivesoftware/smack/XMPPConnection;->setWasAuthenticated(Z)V

    .line 407
    iput-boolean v4, p0, Lorg/jivesoftware/smack/XMPPConnection;->authenticated:Z

    .line 409
    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->packetReader:Lorg/jivesoftware/smack/PacketReader;

    if-eqz v1, :cond_1

    .line 410
    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->packetReader:Lorg/jivesoftware/smack/PacketReader;

    invoke-virtual {v1}, Lorg/jivesoftware/smack/PacketReader;->shutdown()V

    .line 412
    :cond_1
    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->packetWriter:Lorg/jivesoftware/smack/PacketWriter;

    if-eqz v1, :cond_2

    .line 413
    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->packetWriter:Lorg/jivesoftware/smack/PacketWriter;

    invoke-virtual {v1}, Lorg/jivesoftware/smack/PacketWriter;->shutdown()V

    .line 418
    :cond_2
    const-wide/16 v2, 0x96

    :try_start_0
    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 428
    :goto_0
    const/4 v1, 0x1

    iput-boolean v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->socketClosed:Z

    .line 430
    :try_start_1
    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->socket:Ljava/net/Socket;

    invoke-virtual {v1}, Ljava/net/Socket;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 436
    :goto_1
    iput-boolean v4, p0, Lorg/jivesoftware/smack/XMPPConnection;->connected:Z

    .line 439
    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->reader:Ljava/io/Reader;

    if-eqz v1, :cond_3

    .line 443
    :try_start_2
    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->reader:Ljava/io/Reader;

    invoke-virtual {v1}, Ljava/io/Reader;->close()V
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_4

    .line 446
    :goto_2
    iput-object v5, p0, Lorg/jivesoftware/smack/XMPPConnection;->reader:Ljava/io/Reader;

    .line 448
    :cond_3
    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->writer:Ljava/io/Writer;

    if-eqz v1, :cond_4

    .line 452
    :try_start_3
    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->writer:Ljava/io/Writer;

    invoke-virtual {v1}, Ljava/io/Writer;->close()V
    :try_end_3
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_3

    .line 455
    :goto_3
    iput-object v5, p0, Lorg/jivesoftware/smack/XMPPConnection;->writer:Ljava/io/Writer;

    .line 461
    :cond_4
    :try_start_4
    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->socket:Ljava/net/Socket;

    invoke-virtual {v1}, Ljava/net/Socket;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2

    .line 467
    :goto_4
    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->saslAuthentication:Lorg/jivesoftware/smack/SASLAuthentication;

    invoke-virtual {v1}, Lorg/jivesoftware/smack/SASLAuthentication;->init()V

    .line 468
    return-void

    .line 431
    :catch_0
    move-exception v0

    .line 432
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1

    .line 420
    .end local v0    # "e":Ljava/lang/Exception;
    :catch_1
    move-exception v1

    goto :goto_0

    .line 463
    :catch_2
    move-exception v1

    goto :goto_4

    .line 454
    :catch_3
    move-exception v1

    goto :goto_3

    .line 445
    :catch_4
    move-exception v1

    goto :goto_2
.end method

.method startStreamCompression()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 986
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->serverAckdCompression:Z

    .line 988
    invoke-direct {p0}, Lorg/jivesoftware/smack/XMPPConnection;->initReaderAndWriter()V

    .line 991
    iget-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->packetWriter:Lorg/jivesoftware/smack/PacketWriter;

    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->writer:Ljava/io/Writer;

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smack/PacketWriter;->setWriter(Ljava/io/Writer;)V

    .line 993
    iget-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->packetWriter:Lorg/jivesoftware/smack/PacketWriter;

    invoke-virtual {v0}, Lorg/jivesoftware/smack/PacketWriter;->openStream()V

    .line 995
    monitor-enter p0

    .line 996
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->notify()V

    .line 997
    monitor-exit p0

    .line 998
    return-void

    .line 997
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method startTLSReceived(Z)V
    .locals 3
    .param p1, "required"    # Z

    .prologue
    .line 770
    if-eqz p1, :cond_1

    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->config:Lorg/jivesoftware/smack/ConnectionConfiguration;

    invoke-virtual {v1}, Lorg/jivesoftware/smack/ConnectionConfiguration;->getSecurityMode()Lorg/jivesoftware/smack/ConnectionConfiguration$SecurityMode;

    move-result-object v1

    sget-object v2, Lorg/jivesoftware/smack/ConnectionConfiguration$SecurityMode;->disabled:Lorg/jivesoftware/smack/ConnectionConfiguration$SecurityMode;

    if-ne v1, v2, :cond_1

    .line 772
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string/jumbo v2, "TLS required by server but not allowed by connection configuration"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v1}, Lorg/jivesoftware/smack/XMPPConnection;->notifyConnectionError(Ljava/lang/Exception;)V

    .line 788
    :cond_0
    :goto_0
    return-void

    .line 777
    :cond_1
    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->config:Lorg/jivesoftware/smack/ConnectionConfiguration;

    invoke-virtual {v1}, Lorg/jivesoftware/smack/ConnectionConfiguration;->getSecurityMode()Lorg/jivesoftware/smack/ConnectionConfiguration$SecurityMode;

    move-result-object v1

    sget-object v2, Lorg/jivesoftware/smack/ConnectionConfiguration$SecurityMode;->disabled:Lorg/jivesoftware/smack/ConnectionConfiguration$SecurityMode;

    if-eq v1, v2, :cond_0

    .line 782
    :try_start_0
    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->writer:Ljava/io/Writer;

    const-string/jumbo v2, "<starttls xmlns=\"urn:ietf:params:xml:ns:xmpp-tls\"/>"

    invoke-virtual {v1, v2}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 783
    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->writer:Ljava/io/Writer;

    invoke-virtual {v1}, Ljava/io/Writer;->flush()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 785
    :catch_0
    move-exception v0

    .line 786
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {p0, v0}, Lorg/jivesoftware/smack/XMPPConnection;->notifyConnectionError(Ljava/lang/Exception;)V

    goto :goto_0
.end method

.method streamCompressionDenied()V
    .locals 1

    .prologue
    .line 1005
    monitor-enter p0

    .line 1006
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->notify()V

    .line 1007
    monitor-exit p0

    .line 1008
    return-void

    .line 1007
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
