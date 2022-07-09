.class public Lorg/jivesoftware/smackx/commands/AdHocCommandManager;
.super Ljava/lang/Object;
.source "AdHocCommandManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jivesoftware/smackx/commands/AdHocCommandManager$AdHocCommandInfo;
    }
.end annotation


# static fields
.field private static final DISCO_NAMESPACE:Ljava/lang/String; = "http://jabber.org/protocol/commands"

.field private static final SESSION_TIMEOUT:I = 0x78

.field private static final discoNode:Ljava/lang/String; = "http://jabber.org/protocol/commands"

.field private static instances:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lorg/jivesoftware/smack/Connection;",
            "Lorg/jivesoftware/smackx/commands/AdHocCommandManager;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private commands:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/jivesoftware/smackx/commands/AdHocCommandManager$AdHocCommandInfo;",
            ">;"
        }
    .end annotation
.end field

.field private connection:Lorg/jivesoftware/smack/Connection;

.field private executingCommands:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/jivesoftware/smackx/commands/LocalCommand;",
            ">;"
        }
    .end annotation
.end field

.field private sessionsSweeper:Ljava/lang/Thread;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 72
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    sput-object v0, Lorg/jivesoftware/smackx/commands/AdHocCommandManager;->instances:Ljava/util/Map;

    .line 81
    new-instance v0, Lorg/jivesoftware/smackx/commands/AdHocCommandManager$1;

    invoke-direct {v0}, Lorg/jivesoftware/smackx/commands/AdHocCommandManager$1;-><init>()V

    invoke-static {v0}, Lorg/jivesoftware/smack/Connection;->addConnectionCreationListener(Lorg/jivesoftware/smack/ConnectionCreationListener;)V

    .line 86
    return-void
.end method

.method private constructor <init>(Lorg/jivesoftware/smack/Connection;)V
    .locals 1
    .param p1, "connection"    # Lorg/jivesoftware/smack/Connection;

    .prologue
    .line 125
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 114
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smackx/commands/AdHocCommandManager;->commands:Ljava/util/Map;

    .line 122
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smackx/commands/AdHocCommandManager;->executingCommands:Ljava/util/Map;

    .line 126
    iput-object p1, p0, Lorg/jivesoftware/smackx/commands/AdHocCommandManager;->connection:Lorg/jivesoftware/smack/Connection;

    .line 127
    invoke-direct {p0}, Lorg/jivesoftware/smackx/commands/AdHocCommandManager;->init()V

    .line 128
    return-void
.end method

.method synthetic constructor <init>(Lorg/jivesoftware/smack/Connection;Lorg/jivesoftware/smackx/commands/AdHocCommandManager$1;)V
    .locals 0
    .param p1, "x0"    # Lorg/jivesoftware/smack/Connection;
    .param p2, "x1"    # Lorg/jivesoftware/smackx/commands/AdHocCommandManager$1;

    .prologue
    .line 57
    invoke-direct {p0, p1}, Lorg/jivesoftware/smackx/commands/AdHocCommandManager;-><init>(Lorg/jivesoftware/smack/Connection;)V

    return-void
.end method

.method static synthetic access$100(Lorg/jivesoftware/smackx/commands/AdHocCommandManager;)Lorg/jivesoftware/smack/Connection;
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smackx/commands/AdHocCommandManager;

    .prologue
    .line 57
    iget-object v0, p0, Lorg/jivesoftware/smackx/commands/AdHocCommandManager;->connection:Lorg/jivesoftware/smack/Connection;

    return-object v0
.end method

.method static synthetic access$200()Ljava/util/Map;
    .locals 1

    .prologue
    .line 57
    sget-object v0, Lorg/jivesoftware/smackx/commands/AdHocCommandManager;->instances:Ljava/util/Map;

    return-object v0
.end method

.method static synthetic access$300(Lorg/jivesoftware/smackx/commands/AdHocCommandManager;)Ljava/util/Collection;
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smackx/commands/AdHocCommandManager;

    .prologue
    .line 57
    invoke-direct {p0}, Lorg/jivesoftware/smackx/commands/AdHocCommandManager;->getRegisteredCommands()Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$400(Lorg/jivesoftware/smackx/commands/AdHocCommandManager;Lorg/jivesoftware/smackx/packet/AdHocCommandData;)V
    .locals 0
    .param p0, "x0"    # Lorg/jivesoftware/smackx/commands/AdHocCommandManager;
    .param p1, "x1"    # Lorg/jivesoftware/smackx/packet/AdHocCommandData;

    .prologue
    .line 57
    invoke-direct {p0, p1}, Lorg/jivesoftware/smackx/commands/AdHocCommandManager;->processAdHocCommand(Lorg/jivesoftware/smackx/packet/AdHocCommandData;)V

    return-void
.end method

.method static synthetic access$500(Lorg/jivesoftware/smackx/commands/AdHocCommandManager;)Ljava/util/Map;
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smackx/commands/AdHocCommandManager;

    .prologue
    .line 57
    iget-object v0, p0, Lorg/jivesoftware/smackx/commands/AdHocCommandManager;->executingCommands:Ljava/util/Map;

    return-object v0
.end method

.method public static getAddHocCommandsManager(Lorg/jivesoftware/smack/Connection;)Lorg/jivesoftware/smackx/commands/AdHocCommandManager;
    .locals 1
    .param p0, "connection"    # Lorg/jivesoftware/smack/Connection;

    .prologue
    .line 96
    sget-object v0, Lorg/jivesoftware/smackx/commands/AdHocCommandManager;->instances:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smackx/commands/AdHocCommandManager;

    return-object v0
.end method

.method private getRegisteredCommands()Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Lorg/jivesoftware/smackx/commands/AdHocCommandManager$AdHocCommandInfo;",
            ">;"
        }
    .end annotation

    .prologue
    .line 710
    iget-object v0, p0, Lorg/jivesoftware/smackx/commands/AdHocCommandManager;->commands:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method

.method private init()V
    .locals 5

    .prologue
    .line 261
    sget-object v2, Lorg/jivesoftware/smackx/commands/AdHocCommandManager;->instances:Ljava/util/Map;

    iget-object v3, p0, Lorg/jivesoftware/smackx/commands/AdHocCommandManager;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-interface {v2, v3, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 265
    iget-object v2, p0, Lorg/jivesoftware/smackx/commands/AdHocCommandManager;->connection:Lorg/jivesoftware/smack/Connection;

    new-instance v3, Lorg/jivesoftware/smackx/commands/AdHocCommandManager$4;

    invoke-direct {v3, p0}, Lorg/jivesoftware/smackx/commands/AdHocCommandManager$4;-><init>(Lorg/jivesoftware/smackx/commands/AdHocCommandManager;)V

    invoke-virtual {v2, v3}, Lorg/jivesoftware/smack/Connection;->addConnectionListener(Lorg/jivesoftware/smack/ConnectionListener;)V

    .line 295
    iget-object v2, p0, Lorg/jivesoftware/smackx/commands/AdHocCommandManager;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-static {v2}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->getInstanceFor(Lorg/jivesoftware/smack/Connection;)Lorg/jivesoftware/smackx/ServiceDiscoveryManager;

    move-result-object v2

    const-string/jumbo v3, "http://jabber.org/protocol/commands"

    invoke-virtual {v2, v3}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->addFeature(Ljava/lang/String;)V

    .line 301
    iget-object v2, p0, Lorg/jivesoftware/smackx/commands/AdHocCommandManager;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-static {v2}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->getInstanceFor(Lorg/jivesoftware/smack/Connection;)Lorg/jivesoftware/smackx/ServiceDiscoveryManager;

    move-result-object v2

    const-string/jumbo v3, "http://jabber.org/protocol/commands"

    new-instance v4, Lorg/jivesoftware/smackx/commands/AdHocCommandManager$5;

    invoke-direct {v4, p0}, Lorg/jivesoftware/smackx/commands/AdHocCommandManager$5;-><init>(Lorg/jivesoftware/smackx/commands/AdHocCommandManager;)V

    invoke-virtual {v2, v3, v4}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->setNodeInformationProvider(Ljava/lang/String;Lorg/jivesoftware/smackx/NodeInformationProvider;)V

    .line 336
    new-instance v1, Lorg/jivesoftware/smackx/commands/AdHocCommandManager$6;

    invoke-direct {v1, p0}, Lorg/jivesoftware/smackx/commands/AdHocCommandManager$6;-><init>(Lorg/jivesoftware/smackx/commands/AdHocCommandManager;)V

    .line 343
    .local v1, "listener":Lorg/jivesoftware/smack/PacketListener;
    new-instance v0, Lorg/jivesoftware/smack/filter/PacketTypeFilter;

    const-class v2, Lorg/jivesoftware/smackx/packet/AdHocCommandData;

    invoke-direct {v0, v2}, Lorg/jivesoftware/smack/filter/PacketTypeFilter;-><init>(Ljava/lang/Class;)V

    .line 344
    .local v0, "filter":Lorg/jivesoftware/smack/filter/PacketFilter;
    iget-object v2, p0, Lorg/jivesoftware/smackx/commands/AdHocCommandManager;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v2, v1, v0}, Lorg/jivesoftware/smack/Connection;->addPacketListener(Lorg/jivesoftware/smack/PacketListener;Lorg/jivesoftware/smack/filter/PacketFilter;)V

    .line 346
    const/4 v2, 0x0

    iput-object v2, p0, Lorg/jivesoftware/smackx/commands/AdHocCommandManager;->sessionsSweeper:Ljava/lang/Thread;

    .line 347
    return-void
.end method

.method private newInstanceOfCmd(Ljava/lang/String;Ljava/lang/String;)Lorg/jivesoftware/smackx/commands/LocalCommand;
    .locals 6
    .param p1, "commandNode"    # Ljava/lang/String;
    .param p2, "sessionID"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 682
    iget-object v3, p0, Lorg/jivesoftware/smackx/commands/AdHocCommandManager;->commands:Ljava/util/Map;

    invoke-interface {v3, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jivesoftware/smackx/commands/AdHocCommandManager$AdHocCommandInfo;

    .line 685
    .local v1, "commandInfo":Lorg/jivesoftware/smackx/commands/AdHocCommandManager$AdHocCommandInfo;
    :try_start_0
    invoke-virtual {v1}, Lorg/jivesoftware/smackx/commands/AdHocCommandManager$AdHocCommandInfo;->getCommandInstance()Lorg/jivesoftware/smackx/commands/LocalCommand;

    move-result-object v0

    .line 686
    .local v0, "command":Lorg/jivesoftware/smackx/commands/LocalCommand;
    invoke-virtual {v0, p2}, Lorg/jivesoftware/smackx/commands/LocalCommand;->setSessionID(Ljava/lang/String;)V

    .line 687
    invoke-virtual {v1}, Lorg/jivesoftware/smackx/commands/AdHocCommandManager$AdHocCommandInfo;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lorg/jivesoftware/smackx/commands/LocalCommand;->setName(Ljava/lang/String;)V

    .line 688
    invoke-virtual {v1}, Lorg/jivesoftware/smackx/commands/AdHocCommandManager$AdHocCommandInfo;->getNode()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lorg/jivesoftware/smackx/commands/LocalCommand;->setNode(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1

    .line 700
    return-object v0

    .line 690
    .end local v0    # "command":Lorg/jivesoftware/smackx/commands/LocalCommand;
    :catch_0
    move-exception v2

    .line 691
    .local v2, "e":Ljava/lang/InstantiationException;
    invoke-virtual {v2}, Ljava/lang/InstantiationException;->printStackTrace()V

    .line 692
    new-instance v3, Lorg/jivesoftware/smack/XMPPException;

    new-instance v4, Lorg/jivesoftware/smack/packet/XMPPError;

    sget-object v5, Lorg/jivesoftware/smack/packet/XMPPError$Condition;->interna_server_error:Lorg/jivesoftware/smack/packet/XMPPError$Condition;

    invoke-direct {v4, v5}, Lorg/jivesoftware/smack/packet/XMPPError;-><init>(Lorg/jivesoftware/smack/packet/XMPPError$Condition;)V

    invoke-direct {v3, v4}, Lorg/jivesoftware/smack/XMPPException;-><init>(Lorg/jivesoftware/smack/packet/XMPPError;)V

    throw v3

    .line 695
    .end local v2    # "e":Ljava/lang/InstantiationException;
    :catch_1
    move-exception v2

    .line 696
    .local v2, "e":Ljava/lang/IllegalAccessException;
    invoke-virtual {v2}, Ljava/lang/IllegalAccessException;->printStackTrace()V

    .line 697
    new-instance v3, Lorg/jivesoftware/smack/XMPPException;

    new-instance v4, Lorg/jivesoftware/smack/packet/XMPPError;

    sget-object v5, Lorg/jivesoftware/smack/packet/XMPPError$Condition;->interna_server_error:Lorg/jivesoftware/smack/packet/XMPPError$Condition;

    invoke-direct {v4, v5}, Lorg/jivesoftware/smack/packet/XMPPError;-><init>(Lorg/jivesoftware/smack/packet/XMPPError$Condition;)V

    invoke-direct {v3, v4}, Lorg/jivesoftware/smack/XMPPException;-><init>(Lorg/jivesoftware/smack/packet/XMPPError;)V

    throw v3
.end method

.method private processAdHocCommand(Lorg/jivesoftware/smackx/packet/AdHocCommandData;)V
    .locals 14
    .param p1, "requestData"    # Lorg/jivesoftware/smackx/packet/AdHocCommandData;

    .prologue
    .line 375
    invoke-virtual {p1}, Lorg/jivesoftware/smackx/packet/AdHocCommandData;->getType()Lorg/jivesoftware/smack/packet/IQ$Type;

    move-result-object v9

    sget-object v10, Lorg/jivesoftware/smack/packet/IQ$Type;->SET:Lorg/jivesoftware/smack/packet/IQ$Type;

    if-eq v9, v10, :cond_0

    .line 631
    :goto_0
    return-void

    .line 380
    :cond_0
    new-instance v7, Lorg/jivesoftware/smackx/packet/AdHocCommandData;

    invoke-direct {v7}, Lorg/jivesoftware/smackx/packet/AdHocCommandData;-><init>()V

    .line 381
    .local v7, "response":Lorg/jivesoftware/smackx/packet/AdHocCommandData;
    invoke-virtual {p1}, Lorg/jivesoftware/smackx/packet/AdHocCommandData;->getFrom()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v9}, Lorg/jivesoftware/smackx/packet/AdHocCommandData;->setTo(Ljava/lang/String;)V

    .line 382
    invoke-virtual {p1}, Lorg/jivesoftware/smackx/packet/AdHocCommandData;->getPacketID()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v9}, Lorg/jivesoftware/smackx/packet/AdHocCommandData;->setPacketID(Ljava/lang/String;)V

    .line 383
    invoke-virtual {p1}, Lorg/jivesoftware/smackx/packet/AdHocCommandData;->getNode()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v9}, Lorg/jivesoftware/smackx/packet/AdHocCommandData;->setNode(Ljava/lang/String;)V

    .line 384
    invoke-virtual {p1}, Lorg/jivesoftware/smackx/packet/AdHocCommandData;->getTo()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v9}, Lorg/jivesoftware/smackx/packet/AdHocCommandData;->setId(Ljava/lang/String;)V

    .line 386
    invoke-virtual {p1}, Lorg/jivesoftware/smackx/packet/AdHocCommandData;->getSessionID()Ljava/lang/String;

    move-result-object v8

    .line 387
    .local v8, "sessionId":Ljava/lang/String;
    invoke-virtual {p1}, Lorg/jivesoftware/smackx/packet/AdHocCommandData;->getNode()Ljava/lang/String;

    move-result-object v2

    .line 389
    .local v2, "commandNode":Ljava/lang/String;
    if-nez v8, :cond_8

    .line 392
    iget-object v9, p0, Lorg/jivesoftware/smackx/commands/AdHocCommandManager;->commands:Ljava/util/Map;

    invoke-interface {v9, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_1

    .line 395
    sget-object v9, Lorg/jivesoftware/smack/packet/XMPPError$Condition;->item_not_found:Lorg/jivesoftware/smack/packet/XMPPError$Condition;

    invoke-direct {p0, v7, v9}, Lorg/jivesoftware/smackx/commands/AdHocCommandManager;->respondError(Lorg/jivesoftware/smackx/packet/AdHocCommandData;Lorg/jivesoftware/smack/packet/XMPPError$Condition;)V

    goto :goto_0

    .line 400
    :cond_1
    const/16 v9, 0xf

    invoke-static {v9}, Lorg/jivesoftware/smack/util/StringUtils;->randomString(I)Ljava/lang/String;

    move-result-object v8

    .line 405
    :try_start_0
    invoke-direct {p0, v2, v8}, Lorg/jivesoftware/smackx/commands/AdHocCommandManager;->newInstanceOfCmd(Ljava/lang/String;Ljava/lang/String;)Lorg/jivesoftware/smackx/commands/LocalCommand;

    move-result-object v1

    .line 407
    .local v1, "command":Lorg/jivesoftware/smackx/commands/LocalCommand;
    sget-object v9, Lorg/jivesoftware/smack/packet/IQ$Type;->RESULT:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {v7, v9}, Lorg/jivesoftware/smackx/packet/AdHocCommandData;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 408
    invoke-virtual {v1, v7}, Lorg/jivesoftware/smackx/commands/LocalCommand;->setData(Lorg/jivesoftware/smackx/packet/AdHocCommandData;)V

    .line 413
    invoke-virtual {p1}, Lorg/jivesoftware/smackx/packet/AdHocCommandData;->getFrom()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v1, v9}, Lorg/jivesoftware/smackx/commands/LocalCommand;->hasPermission(Ljava/lang/String;)Z

    move-result v9

    if-nez v9, :cond_3

    .line 414
    sget-object v9, Lorg/jivesoftware/smack/packet/XMPPError$Condition;->forbidden:Lorg/jivesoftware/smack/packet/XMPPError$Condition;

    invoke-direct {p0, v7, v9}, Lorg/jivesoftware/smackx/commands/AdHocCommandManager;->respondError(Lorg/jivesoftware/smackx/packet/AdHocCommandData;Lorg/jivesoftware/smack/packet/XMPPError$Condition;)V
    :try_end_0
    .catch Lorg/jivesoftware/smack/XMPPException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 497
    .end local v1    # "command":Lorg/jivesoftware/smackx/commands/LocalCommand;
    :catch_0
    move-exception v3

    .line 501
    .local v3, "e":Lorg/jivesoftware/smack/XMPPException;
    invoke-virtual {v3}, Lorg/jivesoftware/smack/XMPPException;->getXMPPError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v6

    .line 506
    .local v6, "error":Lorg/jivesoftware/smack/packet/XMPPError;
    sget-object v9, Lorg/jivesoftware/smack/packet/XMPPError$Type;->CANCEL:Lorg/jivesoftware/smack/packet/XMPPError$Type;

    invoke-virtual {v6}, Lorg/jivesoftware/smack/packet/XMPPError;->getType()Lorg/jivesoftware/smack/packet/XMPPError$Type;

    move-result-object v10

    invoke-virtual {v9, v10}, Lorg/jivesoftware/smack/packet/XMPPError$Type;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_2

    .line 507
    sget-object v9, Lorg/jivesoftware/smackx/commands/AdHocCommand$Status;->canceled:Lorg/jivesoftware/smackx/commands/AdHocCommand$Status;

    invoke-virtual {v7, v9}, Lorg/jivesoftware/smackx/packet/AdHocCommandData;->setStatus(Lorg/jivesoftware/smackx/commands/AdHocCommand$Status;)V

    .line 508
    iget-object v9, p0, Lorg/jivesoftware/smackx/commands/AdHocCommandManager;->executingCommands:Ljava/util/Map;

    invoke-interface {v9, v8}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 510
    :cond_2
    invoke-direct {p0, v7, v6}, Lorg/jivesoftware/smackx/commands/AdHocCommandManager;->respondError(Lorg/jivesoftware/smackx/packet/AdHocCommandData;Lorg/jivesoftware/smack/packet/XMPPError;)V

    .line 511
    invoke-virtual {v3}, Lorg/jivesoftware/smack/XMPPException;->printStackTrace()V

    goto :goto_0

    .line 418
    .end local v3    # "e":Lorg/jivesoftware/smack/XMPPException;
    .end local v6    # "error":Lorg/jivesoftware/smack/packet/XMPPError;
    .restart local v1    # "command":Lorg/jivesoftware/smackx/commands/LocalCommand;
    :cond_3
    :try_start_1
    invoke-virtual {p1}, Lorg/jivesoftware/smackx/packet/AdHocCommandData;->getAction()Lorg/jivesoftware/smackx/commands/AdHocCommand$Action;

    move-result-object v0

    .line 421
    .local v0, "action":Lorg/jivesoftware/smackx/commands/AdHocCommand$Action;
    if-eqz v0, :cond_4

    sget-object v9, Lorg/jivesoftware/smackx/commands/AdHocCommand$Action;->unknown:Lorg/jivesoftware/smackx/commands/AdHocCommand$Action;

    invoke-virtual {v0, v9}, Lorg/jivesoftware/smackx/commands/AdHocCommand$Action;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_4

    .line 422
    sget-object v9, Lorg/jivesoftware/smack/packet/XMPPError$Condition;->bad_request:Lorg/jivesoftware/smack/packet/XMPPError$Condition;

    sget-object v10, Lorg/jivesoftware/smackx/commands/AdHocCommand$SpecificErrorCondition;->malformedAction:Lorg/jivesoftware/smackx/commands/AdHocCommand$SpecificErrorCondition;

    invoke-direct {p0, v7, v9, v10}, Lorg/jivesoftware/smackx/commands/AdHocCommandManager;->respondError(Lorg/jivesoftware/smackx/packet/AdHocCommandData;Lorg/jivesoftware/smack/packet/XMPPError$Condition;Lorg/jivesoftware/smackx/commands/AdHocCommand$SpecificErrorCondition;)V

    goto/16 :goto_0

    .line 428
    :cond_4
    if-eqz v0, :cond_5

    sget-object v9, Lorg/jivesoftware/smackx/commands/AdHocCommand$Action;->execute:Lorg/jivesoftware/smackx/commands/AdHocCommand$Action;

    invoke-virtual {v0, v9}, Lorg/jivesoftware/smackx/commands/AdHocCommand$Action;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_5

    .line 429
    sget-object v9, Lorg/jivesoftware/smack/packet/XMPPError$Condition;->bad_request:Lorg/jivesoftware/smack/packet/XMPPError$Condition;

    sget-object v10, Lorg/jivesoftware/smackx/commands/AdHocCommand$SpecificErrorCondition;->badAction:Lorg/jivesoftware/smackx/commands/AdHocCommand$SpecificErrorCondition;

    invoke-direct {p0, v7, v9, v10}, Lorg/jivesoftware/smackx/commands/AdHocCommandManager;->respondError(Lorg/jivesoftware/smackx/packet/AdHocCommandData;Lorg/jivesoftware/smack/packet/XMPPError$Condition;Lorg/jivesoftware/smackx/commands/AdHocCommand$SpecificErrorCondition;)V

    goto/16 :goto_0

    .line 436
    :cond_5
    invoke-virtual {v1}, Lorg/jivesoftware/smackx/commands/LocalCommand;->incrementStage()V

    .line 438
    invoke-virtual {v1}, Lorg/jivesoftware/smackx/commands/LocalCommand;->execute()V

    .line 440
    invoke-virtual {v1}, Lorg/jivesoftware/smackx/commands/LocalCommand;->isLastStage()Z

    move-result v9

    if-eqz v9, :cond_7

    .line 442
    sget-object v9, Lorg/jivesoftware/smackx/commands/AdHocCommand$Status;->completed:Lorg/jivesoftware/smackx/commands/AdHocCommand$Status;

    invoke-virtual {v7, v9}, Lorg/jivesoftware/smackx/packet/AdHocCommandData;->setStatus(Lorg/jivesoftware/smackx/commands/AdHocCommand$Status;)V

    .line 494
    :cond_6
    :goto_1
    iget-object v9, p0, Lorg/jivesoftware/smackx/commands/AdHocCommandManager;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v9, v7}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    goto/16 :goto_0

    .line 447
    :cond_7
    sget-object v9, Lorg/jivesoftware/smackx/commands/AdHocCommand$Status;->executing:Lorg/jivesoftware/smackx/commands/AdHocCommand$Status;

    invoke-virtual {v7, v9}, Lorg/jivesoftware/smackx/packet/AdHocCommandData;->setStatus(Lorg/jivesoftware/smackx/commands/AdHocCommand$Status;)V

    .line 448
    iget-object v9, p0, Lorg/jivesoftware/smackx/commands/AdHocCommandManager;->executingCommands:Ljava/util/Map;

    invoke-interface {v9, v8, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 450
    iget-object v9, p0, Lorg/jivesoftware/smackx/commands/AdHocCommandManager;->sessionsSweeper:Ljava/lang/Thread;

    if-nez v9, :cond_6

    .line 451
    new-instance v9, Ljava/lang/Thread;

    new-instance v10, Lorg/jivesoftware/smackx/commands/AdHocCommandManager$7;

    invoke-direct {v10, p0}, Lorg/jivesoftware/smackx/commands/AdHocCommandManager$7;-><init>(Lorg/jivesoftware/smackx/commands/AdHocCommandManager;)V

    invoke-direct {v9, v10}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    iput-object v9, p0, Lorg/jivesoftware/smackx/commands/AdHocCommandManager;->sessionsSweeper:Ljava/lang/Thread;

    .line 488
    iget-object v9, p0, Lorg/jivesoftware/smackx/commands/AdHocCommandManager;->sessionsSweeper:Ljava/lang/Thread;

    const/4 v10, 0x1

    invoke-virtual {v9, v10}, Ljava/lang/Thread;->setDaemon(Z)V

    .line 489
    iget-object v9, p0, Lorg/jivesoftware/smackx/commands/AdHocCommandManager;->sessionsSweeper:Ljava/lang/Thread;

    invoke-virtual {v9}, Ljava/lang/Thread;->start()V
    :try_end_1
    .catch Lorg/jivesoftware/smack/XMPPException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 515
    .end local v0    # "action":Lorg/jivesoftware/smackx/commands/AdHocCommand$Action;
    .end local v1    # "command":Lorg/jivesoftware/smackx/commands/LocalCommand;
    :cond_8
    iget-object v9, p0, Lorg/jivesoftware/smackx/commands/AdHocCommandManager;->executingCommands:Ljava/util/Map;

    invoke-interface {v9, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jivesoftware/smackx/commands/LocalCommand;

    .line 520
    .restart local v1    # "command":Lorg/jivesoftware/smackx/commands/LocalCommand;
    if-nez v1, :cond_9

    .line 521
    sget-object v9, Lorg/jivesoftware/smack/packet/XMPPError$Condition;->bad_request:Lorg/jivesoftware/smack/packet/XMPPError$Condition;

    sget-object v10, Lorg/jivesoftware/smackx/commands/AdHocCommand$SpecificErrorCondition;->badSessionid:Lorg/jivesoftware/smackx/commands/AdHocCommand$SpecificErrorCondition;

    invoke-direct {p0, v7, v9, v10}, Lorg/jivesoftware/smackx/commands/AdHocCommandManager;->respondError(Lorg/jivesoftware/smackx/packet/AdHocCommandData;Lorg/jivesoftware/smack/packet/XMPPError$Condition;Lorg/jivesoftware/smackx/commands/AdHocCommand$SpecificErrorCondition;)V

    goto/16 :goto_0

    .line 527
    :cond_9
    invoke-virtual {v1}, Lorg/jivesoftware/smackx/commands/LocalCommand;->getCreationDate()J

    move-result-wide v4

    .line 528
    .local v4, "creationStamp":J
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v10

    sub-long/2addr v10, v4

    const-wide/32 v12, 0x1d4c0

    cmp-long v9, v10, v12

    if-lez v9, :cond_a

    .line 530
    iget-object v9, p0, Lorg/jivesoftware/smackx/commands/AdHocCommandManager;->executingCommands:Ljava/util/Map;

    invoke-interface {v9, v8}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 533
    sget-object v9, Lorg/jivesoftware/smack/packet/XMPPError$Condition;->not_allowed:Lorg/jivesoftware/smack/packet/XMPPError$Condition;

    sget-object v10, Lorg/jivesoftware/smackx/commands/AdHocCommand$SpecificErrorCondition;->sessionExpired:Lorg/jivesoftware/smackx/commands/AdHocCommand$SpecificErrorCondition;

    invoke-direct {p0, v7, v9, v10}, Lorg/jivesoftware/smackx/commands/AdHocCommandManager;->respondError(Lorg/jivesoftware/smackx/packet/AdHocCommandData;Lorg/jivesoftware/smack/packet/XMPPError$Condition;Lorg/jivesoftware/smackx/commands/AdHocCommand$SpecificErrorCondition;)V

    goto/16 :goto_0

    .line 543
    :cond_a
    monitor-enter v1

    .line 544
    :try_start_2
    invoke-virtual {p1}, Lorg/jivesoftware/smackx/packet/AdHocCommandData;->getAction()Lorg/jivesoftware/smackx/commands/AdHocCommand$Action;

    move-result-object v0

    .line 547
    .restart local v0    # "action":Lorg/jivesoftware/smackx/commands/AdHocCommand$Action;
    if-eqz v0, :cond_b

    sget-object v9, Lorg/jivesoftware/smackx/commands/AdHocCommand$Action;->unknown:Lorg/jivesoftware/smackx/commands/AdHocCommand$Action;

    invoke-virtual {v0, v9}, Lorg/jivesoftware/smackx/commands/AdHocCommand$Action;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_b

    .line 548
    sget-object v9, Lorg/jivesoftware/smack/packet/XMPPError$Condition;->bad_request:Lorg/jivesoftware/smack/packet/XMPPError$Condition;

    sget-object v10, Lorg/jivesoftware/smackx/commands/AdHocCommand$SpecificErrorCondition;->malformedAction:Lorg/jivesoftware/smackx/commands/AdHocCommand$SpecificErrorCondition;

    invoke-direct {p0, v7, v9, v10}, Lorg/jivesoftware/smackx/commands/AdHocCommandManager;->respondError(Lorg/jivesoftware/smackx/packet/AdHocCommandData;Lorg/jivesoftware/smack/packet/XMPPError$Condition;Lorg/jivesoftware/smackx/commands/AdHocCommand$SpecificErrorCondition;)V

    .line 550
    monitor-exit v1

    goto/16 :goto_0

    .line 629
    .end local v0    # "action":Lorg/jivesoftware/smackx/commands/AdHocCommand$Action;
    :catchall_0
    move-exception v9

    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v9

    .line 555
    .restart local v0    # "action":Lorg/jivesoftware/smackx/commands/AdHocCommand$Action;
    :cond_b
    if-eqz v0, :cond_c

    :try_start_3
    sget-object v9, Lorg/jivesoftware/smackx/commands/AdHocCommand$Action;->execute:Lorg/jivesoftware/smackx/commands/AdHocCommand$Action;

    invoke-virtual {v9, v0}, Lorg/jivesoftware/smackx/commands/AdHocCommand$Action;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_d

    .line 556
    :cond_c
    invoke-virtual {v1}, Lorg/jivesoftware/smackx/commands/LocalCommand;->getExecuteAction()Lorg/jivesoftware/smackx/commands/AdHocCommand$Action;

    move-result-object v0

    .line 561
    :cond_d
    invoke-virtual {v1, v0}, Lorg/jivesoftware/smackx/commands/LocalCommand;->isValidAction(Lorg/jivesoftware/smackx/commands/AdHocCommand$Action;)Z

    move-result v9

    if-nez v9, :cond_e

    .line 562
    sget-object v9, Lorg/jivesoftware/smack/packet/XMPPError$Condition;->bad_request:Lorg/jivesoftware/smack/packet/XMPPError$Condition;

    sget-object v10, Lorg/jivesoftware/smackx/commands/AdHocCommand$SpecificErrorCondition;->badAction:Lorg/jivesoftware/smackx/commands/AdHocCommand$SpecificErrorCondition;

    invoke-direct {p0, v7, v9, v10}, Lorg/jivesoftware/smackx/commands/AdHocCommandManager;->respondError(Lorg/jivesoftware/smackx/packet/AdHocCommandData;Lorg/jivesoftware/smack/packet/XMPPError$Condition;Lorg/jivesoftware/smackx/commands/AdHocCommand$SpecificErrorCondition;)V

    .line 564
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto/16 :goto_0

    .line 574
    :cond_e
    :try_start_4
    sget-object v9, Lorg/jivesoftware/smack/packet/IQ$Type;->RESULT:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {v7, v9}, Lorg/jivesoftware/smackx/packet/AdHocCommandData;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 577
    invoke-virtual {v1, v7}, Lorg/jivesoftware/smackx/commands/LocalCommand;->setData(Lorg/jivesoftware/smackx/packet/AdHocCommandData;)V

    .line 579
    sget-object v9, Lorg/jivesoftware/smackx/commands/AdHocCommand$Action;->next:Lorg/jivesoftware/smackx/commands/AdHocCommand$Action;

    invoke-virtual {v9, v0}, Lorg/jivesoftware/smackx/commands/AdHocCommand$Action;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_12

    .line 580
    invoke-virtual {v1}, Lorg/jivesoftware/smackx/commands/LocalCommand;->incrementStage()V

    .line 581
    new-instance v9, Lorg/jivesoftware/smackx/Form;

    invoke-virtual {p1}, Lorg/jivesoftware/smackx/packet/AdHocCommandData;->getForm()Lorg/jivesoftware/smackx/packet/DataForm;

    move-result-object v10

    invoke-direct {v9, v10}, Lorg/jivesoftware/smackx/Form;-><init>(Lorg/jivesoftware/smackx/packet/DataForm;)V

    invoke-virtual {v1, v9}, Lorg/jivesoftware/smackx/commands/LocalCommand;->next(Lorg/jivesoftware/smackx/Form;)V

    .line 582
    invoke-virtual {v1}, Lorg/jivesoftware/smackx/commands/LocalCommand;->isLastStage()Z

    move-result v9

    if-eqz v9, :cond_10

    .line 585
    sget-object v9, Lorg/jivesoftware/smackx/commands/AdHocCommand$Status;->completed:Lorg/jivesoftware/smackx/commands/AdHocCommand$Status;

    invoke-virtual {v7, v9}, Lorg/jivesoftware/smackx/packet/AdHocCommandData;->setStatus(Lorg/jivesoftware/smackx/commands/AdHocCommand$Status;)V

    .line 610
    :cond_f
    :goto_2
    iget-object v9, p0, Lorg/jivesoftware/smackx/commands/AdHocCommandManager;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v9, v7}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V
    :try_end_4
    .catch Lorg/jivesoftware/smack/XMPPException; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 629
    :goto_3
    :try_start_5
    monitor-exit v1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto/16 :goto_0

    .line 589
    :cond_10
    :try_start_6
    sget-object v9, Lorg/jivesoftware/smackx/commands/AdHocCommand$Status;->executing:Lorg/jivesoftware/smackx/commands/AdHocCommand$Status;

    invoke-virtual {v7, v9}, Lorg/jivesoftware/smackx/packet/AdHocCommandData;->setStatus(Lorg/jivesoftware/smackx/commands/AdHocCommand$Status;)V
    :try_end_6
    .catch Lorg/jivesoftware/smack/XMPPException; {:try_start_6 .. :try_end_6} :catch_1
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    goto :goto_2

    .line 612
    :catch_1
    move-exception v3

    .line 616
    .restart local v3    # "e":Lorg/jivesoftware/smack/XMPPException;
    :try_start_7
    invoke-virtual {v3}, Lorg/jivesoftware/smack/XMPPException;->getXMPPError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v6

    .line 621
    .restart local v6    # "error":Lorg/jivesoftware/smack/packet/XMPPError;
    sget-object v9, Lorg/jivesoftware/smack/packet/XMPPError$Type;->CANCEL:Lorg/jivesoftware/smack/packet/XMPPError$Type;

    invoke-virtual {v6}, Lorg/jivesoftware/smack/packet/XMPPError;->getType()Lorg/jivesoftware/smack/packet/XMPPError$Type;

    move-result-object v10

    invoke-virtual {v9, v10}, Lorg/jivesoftware/smack/packet/XMPPError$Type;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_11

    .line 622
    sget-object v9, Lorg/jivesoftware/smackx/commands/AdHocCommand$Status;->canceled:Lorg/jivesoftware/smackx/commands/AdHocCommand$Status;

    invoke-virtual {v7, v9}, Lorg/jivesoftware/smackx/packet/AdHocCommandData;->setStatus(Lorg/jivesoftware/smackx/commands/AdHocCommand$Status;)V

    .line 623
    iget-object v9, p0, Lorg/jivesoftware/smackx/commands/AdHocCommandManager;->executingCommands:Ljava/util/Map;

    invoke-interface {v9, v8}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 625
    :cond_11
    invoke-direct {p0, v7, v6}, Lorg/jivesoftware/smackx/commands/AdHocCommandManager;->respondError(Lorg/jivesoftware/smackx/packet/AdHocCommandData;Lorg/jivesoftware/smack/packet/XMPPError;)V

    .line 627
    invoke-virtual {v3}, Lorg/jivesoftware/smack/XMPPException;->printStackTrace()V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    goto :goto_3

    .line 592
    .end local v3    # "e":Lorg/jivesoftware/smack/XMPPException;
    .end local v6    # "error":Lorg/jivesoftware/smack/packet/XMPPError;
    :cond_12
    :try_start_8
    sget-object v9, Lorg/jivesoftware/smackx/commands/AdHocCommand$Action;->complete:Lorg/jivesoftware/smackx/commands/AdHocCommand$Action;

    invoke-virtual {v9, v0}, Lorg/jivesoftware/smackx/commands/AdHocCommand$Action;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_13

    .line 593
    invoke-virtual {v1}, Lorg/jivesoftware/smackx/commands/LocalCommand;->incrementStage()V

    .line 594
    new-instance v9, Lorg/jivesoftware/smackx/Form;

    invoke-virtual {p1}, Lorg/jivesoftware/smackx/packet/AdHocCommandData;->getForm()Lorg/jivesoftware/smackx/packet/DataForm;

    move-result-object v10

    invoke-direct {v9, v10}, Lorg/jivesoftware/smackx/Form;-><init>(Lorg/jivesoftware/smackx/packet/DataForm;)V

    invoke-virtual {v1, v9}, Lorg/jivesoftware/smackx/commands/LocalCommand;->complete(Lorg/jivesoftware/smackx/Form;)V

    .line 595
    sget-object v9, Lorg/jivesoftware/smackx/commands/AdHocCommand$Status;->completed:Lorg/jivesoftware/smackx/commands/AdHocCommand$Status;

    invoke-virtual {v7, v9}, Lorg/jivesoftware/smackx/packet/AdHocCommandData;->setStatus(Lorg/jivesoftware/smackx/commands/AdHocCommand$Status;)V

    .line 597
    iget-object v9, p0, Lorg/jivesoftware/smackx/commands/AdHocCommandManager;->executingCommands:Ljava/util/Map;

    invoke-interface {v9, v8}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2

    .line 599
    :cond_13
    sget-object v9, Lorg/jivesoftware/smackx/commands/AdHocCommand$Action;->prev:Lorg/jivesoftware/smackx/commands/AdHocCommand$Action;

    invoke-virtual {v9, v0}, Lorg/jivesoftware/smackx/commands/AdHocCommand$Action;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_14

    .line 600
    invoke-virtual {v1}, Lorg/jivesoftware/smackx/commands/LocalCommand;->decrementStage()V

    .line 601
    invoke-virtual {v1}, Lorg/jivesoftware/smackx/commands/LocalCommand;->prev()V

    goto :goto_2

    .line 603
    :cond_14
    sget-object v9, Lorg/jivesoftware/smackx/commands/AdHocCommand$Action;->cancel:Lorg/jivesoftware/smackx/commands/AdHocCommand$Action;

    invoke-virtual {v9, v0}, Lorg/jivesoftware/smackx/commands/AdHocCommand$Action;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_f

    .line 604
    invoke-virtual {v1}, Lorg/jivesoftware/smackx/commands/LocalCommand;->cancel()V

    .line 605
    sget-object v9, Lorg/jivesoftware/smackx/commands/AdHocCommand$Status;->canceled:Lorg/jivesoftware/smackx/commands/AdHocCommand$Status;

    invoke-virtual {v7, v9}, Lorg/jivesoftware/smackx/packet/AdHocCommandData;->setStatus(Lorg/jivesoftware/smackx/commands/AdHocCommand$Status;)V

    .line 607
    iget-object v9, p0, Lorg/jivesoftware/smackx/commands/AdHocCommandManager;->executingCommands:Ljava/util/Map;

    invoke-interface {v9, v8}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_8
    .catch Lorg/jivesoftware/smack/XMPPException; {:try_start_8 .. :try_end_8} :catch_1
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    goto :goto_2
.end method

.method private respondError(Lorg/jivesoftware/smackx/packet/AdHocCommandData;Lorg/jivesoftware/smack/packet/XMPPError$Condition;)V
    .locals 1
    .param p1, "response"    # Lorg/jivesoftware/smackx/packet/AdHocCommandData;
    .param p2, "condition"    # Lorg/jivesoftware/smack/packet/XMPPError$Condition;

    .prologue
    .line 641
    new-instance v0, Lorg/jivesoftware/smack/packet/XMPPError;

    invoke-direct {v0, p2}, Lorg/jivesoftware/smack/packet/XMPPError;-><init>(Lorg/jivesoftware/smack/packet/XMPPError$Condition;)V

    invoke-direct {p0, p1, v0}, Lorg/jivesoftware/smackx/commands/AdHocCommandManager;->respondError(Lorg/jivesoftware/smackx/packet/AdHocCommandData;Lorg/jivesoftware/smack/packet/XMPPError;)V

    .line 642
    return-void
.end method

.method private respondError(Lorg/jivesoftware/smackx/packet/AdHocCommandData;Lorg/jivesoftware/smack/packet/XMPPError$Condition;Lorg/jivesoftware/smackx/commands/AdHocCommand$SpecificErrorCondition;)V
    .locals 2
    .param p1, "response"    # Lorg/jivesoftware/smackx/packet/AdHocCommandData;
    .param p2, "condition"    # Lorg/jivesoftware/smack/packet/XMPPError$Condition;
    .param p3, "specificCondition"    # Lorg/jivesoftware/smackx/commands/AdHocCommand$SpecificErrorCondition;

    .prologue
    .line 654
    new-instance v0, Lorg/jivesoftware/smack/packet/XMPPError;

    invoke-direct {v0, p2}, Lorg/jivesoftware/smack/packet/XMPPError;-><init>(Lorg/jivesoftware/smack/packet/XMPPError$Condition;)V

    .line 655
    .local v0, "error":Lorg/jivesoftware/smack/packet/XMPPError;
    new-instance v1, Lorg/jivesoftware/smackx/packet/AdHocCommandData$SpecificError;

    invoke-direct {v1, p3}, Lorg/jivesoftware/smackx/packet/AdHocCommandData$SpecificError;-><init>(Lorg/jivesoftware/smackx/commands/AdHocCommand$SpecificErrorCondition;)V

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smack/packet/XMPPError;->addExtension(Lorg/jivesoftware/smack/packet/PacketExtension;)V

    .line 656
    invoke-direct {p0, p1, v0}, Lorg/jivesoftware/smackx/commands/AdHocCommandManager;->respondError(Lorg/jivesoftware/smackx/packet/AdHocCommandData;Lorg/jivesoftware/smack/packet/XMPPError;)V

    .line 657
    return-void
.end method

.method private respondError(Lorg/jivesoftware/smackx/packet/AdHocCommandData;Lorg/jivesoftware/smack/packet/XMPPError;)V
    .locals 1
    .param p1, "response"    # Lorg/jivesoftware/smackx/packet/AdHocCommandData;
    .param p2, "error"    # Lorg/jivesoftware/smack/packet/XMPPError;

    .prologue
    .line 666
    sget-object v0, Lorg/jivesoftware/smack/packet/IQ$Type;->ERROR:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {p1, v0}, Lorg/jivesoftware/smackx/packet/AdHocCommandData;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 667
    invoke-virtual {p1, p2}, Lorg/jivesoftware/smackx/packet/AdHocCommandData;->setError(Lorg/jivesoftware/smack/packet/XMPPError;)V

    .line 668
    iget-object v0, p0, Lorg/jivesoftware/smackx/commands/AdHocCommandManager;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v0, p1}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 669
    return-void
.end method


# virtual methods
.method public discoverCommands(Ljava/lang/String;)Lorg/jivesoftware/smackx/packet/DiscoverItems;
    .locals 2
    .param p1, "jid"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 207
    iget-object v1, p0, Lorg/jivesoftware/smackx/commands/AdHocCommandManager;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-static {v1}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->getInstanceFor(Lorg/jivesoftware/smack/Connection;)Lorg/jivesoftware/smackx/ServiceDiscoveryManager;

    move-result-object v0

    .line 209
    .local v0, "serviceDiscoveryManager":Lorg/jivesoftware/smackx/ServiceDiscoveryManager;
    const-string/jumbo v1, "http://jabber.org/protocol/commands"

    invoke-virtual {v0, p1, v1}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->discoverItems(Ljava/lang/String;Ljava/lang/String;)Lorg/jivesoftware/smackx/packet/DiscoverItems;

    move-result-object v1

    return-object v1
.end method

.method public getRemoteCommand(Ljava/lang/String;Ljava/lang/String;)Lorg/jivesoftware/smackx/commands/RemoteCommand;
    .locals 2
    .param p1, "jid"    # Ljava/lang/String;
    .param p2, "node"    # Ljava/lang/String;

    .prologue
    .line 247
    new-instance v0, Lorg/jivesoftware/smackx/commands/RemoteCommand;

    iget-object v1, p0, Lorg/jivesoftware/smackx/commands/AdHocCommandManager;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-direct {v0, v1, p2, p1}, Lorg/jivesoftware/smackx/commands/RemoteCommand;-><init>(Lorg/jivesoftware/smack/Connection;Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public publishCommands(Ljava/lang/String;)V
    .locals 7
    .param p1, "jid"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 219
    iget-object v6, p0, Lorg/jivesoftware/smackx/commands/AdHocCommandManager;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-static {v6}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->getInstanceFor(Lorg/jivesoftware/smack/Connection;)Lorg/jivesoftware/smackx/ServiceDiscoveryManager;

    move-result-object v4

    .line 223
    .local v4, "serviceDiscoveryManager":Lorg/jivesoftware/smackx/ServiceDiscoveryManager;
    new-instance v0, Lorg/jivesoftware/smackx/packet/DiscoverItems;

    invoke-direct {v0}, Lorg/jivesoftware/smackx/packet/DiscoverItems;-><init>()V

    .line 224
    .local v0, "discoverItems":Lorg/jivesoftware/smackx/packet/DiscoverItems;
    invoke-direct {p0}, Lorg/jivesoftware/smackx/commands/AdHocCommandManager;->getRegisteredCommands()Ljava/util/Collection;

    move-result-object v5

    .line 226
    .local v5, "xCommandsList":Ljava/util/Collection;, "Ljava/util/Collection<Lorg/jivesoftware/smackx/commands/AdHocCommandManager$AdHocCommandInfo;>;"
    invoke-interface {v5}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/jivesoftware/smackx/commands/AdHocCommandManager$AdHocCommandInfo;

    .line 227
    .local v2, "info":Lorg/jivesoftware/smackx/commands/AdHocCommandManager$AdHocCommandInfo;
    new-instance v3, Lorg/jivesoftware/smackx/packet/DiscoverItems$Item;

    invoke-virtual {v2}, Lorg/jivesoftware/smackx/commands/AdHocCommandManager$AdHocCommandInfo;->getOwnerJID()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v3, v6}, Lorg/jivesoftware/smackx/packet/DiscoverItems$Item;-><init>(Ljava/lang/String;)V

    .line 228
    .local v3, "item":Lorg/jivesoftware/smackx/packet/DiscoverItems$Item;
    invoke-virtual {v2}, Lorg/jivesoftware/smackx/commands/AdHocCommandManager$AdHocCommandInfo;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v6}, Lorg/jivesoftware/smackx/packet/DiscoverItems$Item;->setName(Ljava/lang/String;)V

    .line 229
    invoke-virtual {v2}, Lorg/jivesoftware/smackx/commands/AdHocCommandManager$AdHocCommandInfo;->getNode()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v6}, Lorg/jivesoftware/smackx/packet/DiscoverItems$Item;->setNode(Ljava/lang/String;)V

    .line 230
    invoke-virtual {v0, v3}, Lorg/jivesoftware/smackx/packet/DiscoverItems;->addItem(Lorg/jivesoftware/smackx/packet/DiscoverItems$Item;)V

    goto :goto_0

    .line 233
    .end local v2    # "info":Lorg/jivesoftware/smackx/commands/AdHocCommandManager$AdHocCommandInfo;
    .end local v3    # "item":Lorg/jivesoftware/smackx/packet/DiscoverItems$Item;
    :cond_0
    const-string/jumbo v6, "http://jabber.org/protocol/commands"

    invoke-virtual {v4, p1, v6, v0}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->publishItems(Ljava/lang/String;Ljava/lang/String;Lorg/jivesoftware/smackx/packet/DiscoverItems;)V

    .line 234
    return-void
.end method

.method public registerCommand(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Class;)V
    .locals 1
    .param p1, "node"    # Ljava/lang/String;
    .param p2, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/Class",
            "<+",
            "Lorg/jivesoftware/smackx/commands/LocalCommand;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 143
    .local p3, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<+Lorg/jivesoftware/smackx/commands/LocalCommand;>;"
    new-instance v0, Lorg/jivesoftware/smackx/commands/AdHocCommandManager$2;

    invoke-direct {v0, p0, p3}, Lorg/jivesoftware/smackx/commands/AdHocCommandManager$2;-><init>(Lorg/jivesoftware/smackx/commands/AdHocCommandManager;Ljava/lang/Class;)V

    invoke-virtual {p0, p1, p2, v0}, Lorg/jivesoftware/smackx/commands/AdHocCommandManager;->registerCommand(Ljava/lang/String;Ljava/lang/String;Lorg/jivesoftware/smackx/commands/LocalCommandFactory;)V

    .line 148
    return-void
.end method

.method public registerCommand(Ljava/lang/String;Ljava/lang/String;Lorg/jivesoftware/smackx/commands/LocalCommandFactory;)V
    .locals 3
    .param p1, "node"    # Ljava/lang/String;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "factory"    # Lorg/jivesoftware/smackx/commands/LocalCommandFactory;

    .prologue
    .line 162
    new-instance v0, Lorg/jivesoftware/smackx/commands/AdHocCommandManager$AdHocCommandInfo;

    iget-object v1, p0, Lorg/jivesoftware/smackx/commands/AdHocCommandManager;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v1}, Lorg/jivesoftware/smack/Connection;->getUser()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, p1, p2, v1, p3}, Lorg/jivesoftware/smackx/commands/AdHocCommandManager$AdHocCommandInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/jivesoftware/smackx/commands/LocalCommandFactory;)V

    .line 164
    .local v0, "commandInfo":Lorg/jivesoftware/smackx/commands/AdHocCommandManager$AdHocCommandInfo;
    iget-object v1, p0, Lorg/jivesoftware/smackx/commands/AdHocCommandManager;->commands:Ljava/util/Map;

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 167
    iget-object v1, p0, Lorg/jivesoftware/smackx/commands/AdHocCommandManager;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-static {v1}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->getInstanceFor(Lorg/jivesoftware/smack/Connection;)Lorg/jivesoftware/smackx/ServiceDiscoveryManager;

    move-result-object v1

    new-instance v2, Lorg/jivesoftware/smackx/commands/AdHocCommandManager$3;

    invoke-direct {v2, p0, p2}, Lorg/jivesoftware/smackx/commands/AdHocCommandManager$3;-><init>(Lorg/jivesoftware/smackx/commands/AdHocCommandManager;Ljava/lang/String;)V

    invoke-virtual {v1, p1, v2}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->setNodeInformationProvider(Ljava/lang/String;Lorg/jivesoftware/smackx/NodeInformationProvider;)V

    .line 196
    return-void
.end method
