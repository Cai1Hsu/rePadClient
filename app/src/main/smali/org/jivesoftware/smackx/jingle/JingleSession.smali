.class public Lorg/jivesoftware/smackx/jingle/JingleSession;
.super Lorg/jivesoftware/smackx/jingle/JingleNegotiator;
.source "JingleSession.java"

# interfaces
.implements Lorg/jivesoftware/smackx/jingle/media/MediaReceivedListener;


# static fields
.field private static final LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;

.field private static final randomGenerator:Ljava/util/Random;

.field private static final sessions:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Lorg/jivesoftware/smack/Connection;",
            "Lorg/jivesoftware/smackx/jingle/JingleSession;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private connection:Lorg/jivesoftware/smack/Connection;

.field connectionListener:Lorg/jivesoftware/smack/ConnectionListener;

.field private contentNegotiators:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smackx/jingle/ContentNegotiator;",
            ">;"
        }
    .end annotation
.end field

.field private initiator:Ljava/lang/String;

.field protected jingleMediaManagers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smackx/jingle/media/JingleMediaManager;",
            ">;"
        }
    .end annotation
.end field

.field private mediaSessionMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/jivesoftware/smackx/jingle/media/JingleMediaSession;",
            ">;"
        }
    .end annotation
.end field

.field packetFilter:Lorg/jivesoftware/smack/filter/PacketFilter;

.field packetListener:Lorg/jivesoftware/smack/PacketListener;

.field private responder:Ljava/lang/String;

.field private sessionInitPacketID:Ljava/lang/String;

.field private sessionState:Lorg/jivesoftware/smackx/jingle/JingleSessionState;

.field private sid:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 62
    const-class v0, Lorg/jivesoftware/smackx/jingle/JingleSession;

    invoke-static {v0}, Lorg/jivesoftware/smackx/jingle/SmackLogger;->getLogger(Ljava/lang/Class;)Lorg/jivesoftware/smackx/jingle/SmackLogger;

    move-result-object v0

    sput-object v0, Lorg/jivesoftware/smackx/jingle/JingleSession;->LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;

    .line 65
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lorg/jivesoftware/smackx/jingle/JingleSession;->sessions:Ljava/util/HashMap;

    .line 67
    new-instance v0, Ljava/util/Random;

    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    sput-object v0, Lorg/jivesoftware/smackx/jingle/JingleSession;->randomGenerator:Ljava/util/Random;

    return-void
.end method

.method public constructor <init>(Lorg/jivesoftware/smack/Connection;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V
    .locals 1
    .param p1, "conn"    # Lorg/jivesoftware/smack/Connection;
    .param p2, "initiator"    # Ljava/lang/String;
    .param p3, "responder"    # Ljava/lang/String;
    .param p4, "sessionid"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jivesoftware/smack/Connection;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smackx/jingle/media/JingleMediaManager;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 111
    .local p5, "jingleMediaManagers":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smackx/jingle/media/JingleMediaManager;>;"
    invoke-direct {p0}, Lorg/jivesoftware/smackx/jingle/JingleNegotiator;-><init>()V

    .line 83
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/jivesoftware/smackx/jingle/JingleSession;->jingleMediaManagers:Ljava/util/List;

    .line 113
    iput-object p2, p0, Lorg/jivesoftware/smackx/jingle/JingleSession;->initiator:Ljava/lang/String;

    .line 114
    iput-object p3, p0, Lorg/jivesoftware/smackx/jingle/JingleSession;->responder:Ljava/lang/String;

    .line 115
    iput-object p4, p0, Lorg/jivesoftware/smackx/jingle/JingleSession;->sid:Ljava/lang/String;

    .line 116
    iput-object p5, p0, Lorg/jivesoftware/smackx/jingle/JingleSession;->jingleMediaManagers:Ljava/util/List;

    .line 117
    invoke-virtual {p0, p0}, Lorg/jivesoftware/smackx/jingle/JingleSession;->setSession(Lorg/jivesoftware/smackx/jingle/JingleSession;)V

    .line 118
    iput-object p1, p0, Lorg/jivesoftware/smackx/jingle/JingleSession;->connection:Lorg/jivesoftware/smack/Connection;

    .line 121
    invoke-static {}, Lorg/jivesoftware/smackx/jingle/JingleSessionStateUnknown;->getInstance()Lorg/jivesoftware/smackx/jingle/JingleSessionState;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/jivesoftware/smackx/jingle/JingleSession;->setSessionState(Lorg/jivesoftware/smackx/jingle/JingleSessionState;)V

    .line 123
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smackx/jingle/JingleSession;->contentNegotiators:Ljava/util/List;

    .line 124
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smackx/jingle/JingleSession;->mediaSessionMap:Ljava/util/Map;

    .line 127
    invoke-direct {p0}, Lorg/jivesoftware/smackx/jingle/JingleSession;->registerInstance()V

    .line 128
    invoke-direct {p0, p1}, Lorg/jivesoftware/smackx/jingle/JingleSession;->installConnectionListeners(Lorg/jivesoftware/smack/Connection;)V

    .line 129
    return-void
.end method

.method public constructor <init>(Lorg/jivesoftware/smack/Connection;Lorg/jivesoftware/smackx/jingle/JingleSessionRequest;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V
    .locals 6
    .param p1, "conn"    # Lorg/jivesoftware/smack/Connection;
    .param p2, "request"    # Lorg/jivesoftware/smackx/jingle/JingleSessionRequest;
    .param p3, "initiator"    # Ljava/lang/String;
    .param p4, "responder"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jivesoftware/smack/Connection;",
            "Lorg/jivesoftware/smackx/jingle/JingleSessionRequest;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smackx/jingle/media/JingleMediaManager;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 145
    .local p5, "jingleMediaManagers":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smackx/jingle/media/JingleMediaManager;>;"
    invoke-static {}, Lorg/jivesoftware/smackx/jingle/JingleSession;->generateSessionId()Ljava/lang/String;

    move-result-object v4

    move-object v0, p0

    move-object v1, p1

    move-object v2, p3

    move-object v3, p4

    move-object v5, p5

    invoke-direct/range {v0 .. v5}, Lorg/jivesoftware/smackx/jingle/JingleSession;-><init>(Lorg/jivesoftware/smack/Connection;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V

    .line 147
    return-void
.end method

.method static synthetic access$000(Lorg/jivesoftware/smackx/jingle/JingleSession;Lorg/jivesoftware/smack/Connection;)V
    .locals 0
    .param p0, "x0"    # Lorg/jivesoftware/smackx/jingle/JingleSession;
    .param p1, "x1"    # Lorg/jivesoftware/smack/Connection;

    .prologue
    .line 60
    invoke-direct {p0, p1}, Lorg/jivesoftware/smackx/jingle/JingleSession;->unregisterInstanceFor(Lorg/jivesoftware/smack/Connection;)V

    return-void
.end method

.method static synthetic access$100()Lorg/jivesoftware/smackx/jingle/SmackLogger;
    .locals 1

    .prologue
    .line 60
    sget-object v0, Lorg/jivesoftware/smackx/jingle/JingleSession;->LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;

    return-object v0
.end method

.method static synthetic access$200(Lorg/jivesoftware/smackx/jingle/JingleSession;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smackx/jingle/JingleSession;

    .prologue
    .line 60
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/JingleSession;->contentNegotiators:Ljava/util/List;

    return-object v0
.end method

.method public static createError(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILorg/jivesoftware/smack/packet/XMPPError;)Lorg/jivesoftware/smack/packet/IQ;
    .locals 4
    .param p0, "ID"    # Ljava/lang/String;
    .param p1, "to"    # Ljava/lang/String;
    .param p2, "from"    # Ljava/lang/String;
    .param p3, "errCode"    # I
    .param p4, "error"    # Lorg/jivesoftware/smack/packet/XMPPError;

    .prologue
    .line 1065
    sget-object v1, Lorg/jivesoftware/smack/packet/IQ$Type;->ERROR:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-static {p0, p1, p2, v1}, Lorg/jivesoftware/smackx/jingle/JingleSession;->createIQ(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/jivesoftware/smack/packet/IQ$Type;)Lorg/jivesoftware/smack/packet/IQ;

    move-result-object v0

    .line 1066
    .local v0, "iqError":Lorg/jivesoftware/smack/packet/IQ;
    invoke-virtual {v0, p4}, Lorg/jivesoftware/smack/packet/IQ;->setError(Lorg/jivesoftware/smack/packet/XMPPError;)V

    .line 1068
    sget-object v1, Lorg/jivesoftware/smackx/jingle/JingleSession;->LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Created Error Packet:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Lorg/jivesoftware/smack/packet/IQ;->toXML()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/jivesoftware/smackx/jingle/SmackLogger;->debug(Ljava/lang/String;)V

    .line 1070
    return-object v0
.end method

.method public static createIQ(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/jivesoftware/smack/packet/IQ$Type;)Lorg/jivesoftware/smack/packet/IQ;
    .locals 1
    .param p0, "ID"    # Ljava/lang/String;
    .param p1, "to"    # Ljava/lang/String;
    .param p2, "from"    # Ljava/lang/String;
    .param p3, "type"    # Lorg/jivesoftware/smack/packet/IQ$Type;

    .prologue
    .line 1034
    new-instance v0, Lorg/jivesoftware/smackx/jingle/JingleSession$6;

    invoke-direct {v0}, Lorg/jivesoftware/smackx/jingle/JingleSession$6;-><init>()V

    .line 1040
    .local v0, "iqPacket":Lorg/jivesoftware/smack/packet/IQ;
    invoke-virtual {v0, p0}, Lorg/jivesoftware/smack/packet/IQ;->setPacketID(Ljava/lang/String;)V

    .line 1041
    invoke-virtual {v0, p1}, Lorg/jivesoftware/smack/packet/IQ;->setTo(Ljava/lang/String;)V

    .line 1042
    invoke-virtual {v0, p2}, Lorg/jivesoftware/smack/packet/IQ;->setFrom(Ljava/lang/String;)V

    .line 1043
    invoke-virtual {v0, p3}, Lorg/jivesoftware/smack/packet/IQ;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 1045
    return-object v0
.end method

.method protected static generateSessionId()Ljava/lang/String;
    .locals 2

    .prologue
    .line 232
    sget-object v0, Lorg/jivesoftware/smackx/jingle/JingleSession;->randomGenerator:Ljava/util/Random;

    invoke-virtual {v0}, Ljava/util/Random;->nextLong()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Math;->abs(J)J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getInstanceFor(Lorg/jivesoftware/smack/Connection;)Lorg/jivesoftware/smackx/jingle/JingleSession;
    .locals 4
    .param p0, "con"    # Lorg/jivesoftware/smack/Connection;

    .prologue
    .line 605
    if-nez p0, :cond_0

    .line 606
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v3, "Connection cannot be null"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 609
    :cond_0
    const/4 v1, 0x0

    .line 610
    .local v1, "result":Lorg/jivesoftware/smackx/jingle/JingleSession;
    sget-object v3, Lorg/jivesoftware/smackx/jingle/JingleSession;->sessions:Ljava/util/HashMap;

    monitor-enter v3

    .line 611
    :try_start_0
    sget-object v2, Lorg/jivesoftware/smackx/jingle/JingleSession;->sessions:Ljava/util/HashMap;

    invoke-virtual {v2, p0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 612
    sget-object v2, Lorg/jivesoftware/smackx/jingle/JingleSession;->sessions:Ljava/util/HashMap;

    invoke-virtual {v2, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    move-object v0, v2

    check-cast v0, Lorg/jivesoftware/smackx/jingle/JingleSession;

    move-object v1, v0

    .line 614
    :cond_1
    monitor-exit v3

    .line 616
    return-object v1

    .line 614
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2
.end method

.method private installConnectionListeners(Lorg/jivesoftware/smack/Connection;)V
    .locals 1
    .param p1, "connection"    # Lorg/jivesoftware/smack/Connection;

    .prologue
    .line 626
    if-eqz p1, :cond_0

    .line 627
    new-instance v0, Lorg/jivesoftware/smackx/jingle/JingleSession$1;

    invoke-direct {v0, p0, p1}, Lorg/jivesoftware/smackx/jingle/JingleSession$1;-><init>(Lorg/jivesoftware/smackx/jingle/JingleSession;Lorg/jivesoftware/smack/Connection;)V

    iput-object v0, p0, Lorg/jivesoftware/smackx/jingle/JingleSession;->connectionListener:Lorg/jivesoftware/smack/ConnectionListener;

    .line 645
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/JingleSession;->connectionListener:Lorg/jivesoftware/smack/ConnectionListener;

    invoke-virtual {p1, v0}, Lorg/jivesoftware/smack/Connection;->addConnectionListener(Lorg/jivesoftware/smack/ConnectionListener;)V

    .line 647
    :cond_0
    return-void
.end method

.method private registerInstance()V
    .locals 3

    .prologue
    .line 592
    sget-object v1, Lorg/jivesoftware/smackx/jingle/JingleSession;->sessions:Ljava/util/HashMap;

    monitor-enter v1

    .line 593
    :try_start_0
    sget-object v0, Lorg/jivesoftware/smackx/jingle/JingleSession;->sessions:Ljava/util/HashMap;

    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/JingleSession;->getConnection()Lorg/jivesoftware/smack/Connection;

    move-result-object v2

    invoke-virtual {v0, v2, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 594
    monitor-exit v1

    .line 595
    return-void

    .line 594
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method private removeConnectionListener()V
    .locals 2

    .prologue
    .line 650
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/JingleSession;->connectionListener:Lorg/jivesoftware/smack/ConnectionListener;

    if-eqz v0, :cond_0

    .line 651
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/JingleSession;->getConnection()Lorg/jivesoftware/smack/Connection;

    move-result-object v0

    iget-object v1, p0, Lorg/jivesoftware/smackx/jingle/JingleSession;->connectionListener:Lorg/jivesoftware/smack/ConnectionListener;

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smack/Connection;->removeConnectionListener(Lorg/jivesoftware/smack/ConnectionListener;)V

    .line 653
    sget-object v0, Lorg/jivesoftware/smackx/jingle/JingleSession;->LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;

    const-string/jumbo v1, "JINGLE SESSION: REMOVE CONNECTION LISTENER"

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smackx/jingle/SmackLogger;->debug(Ljava/lang/String;)V

    .line 655
    :cond_0
    return-void
.end method

.method private startNegotiators()V
    .locals 4

    .prologue
    .line 1191
    iget-object v3, p0, Lorg/jivesoftware/smackx/jingle/JingleSession;->contentNegotiators:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;

    .line 1192
    .local v0, "contentNegotiator":Lorg/jivesoftware/smackx/jingle/ContentNegotiator;
    invoke-virtual {v0}, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;->getTransportNegotiator()Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;

    move-result-object v2

    .line 1193
    .local v2, "transNeg":Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;
    invoke-virtual {v2}, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->start()V

    goto :goto_0

    .line 1195
    .end local v0    # "contentNegotiator":Lorg/jivesoftware/smackx/jingle/ContentNegotiator;
    .end local v2    # "transNeg":Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;
    :cond_0
    return-void
.end method

.method private unregisterInstanceFor(Lorg/jivesoftware/smack/Connection;)V
    .locals 2
    .param p1, "connection"    # Lorg/jivesoftware/smack/Connection;

    .prologue
    .line 583
    sget-object v1, Lorg/jivesoftware/smackx/jingle/JingleSession;->sessions:Ljava/util/HashMap;

    monitor-enter v1

    .line 584
    :try_start_0
    sget-object v0, Lorg/jivesoftware/smackx/jingle/JingleSession;->sessions:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 585
    monitor-exit v1

    .line 586
    return-void

    .line 585
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method


# virtual methods
.method public addContentNegotiator(Lorg/jivesoftware/smackx/jingle/ContentNegotiator;)V
    .locals 1
    .param p1, "inContentNegotiator"    # Lorg/jivesoftware/smackx/jingle/ContentNegotiator;

    .prologue
    .line 389
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/JingleSession;->contentNegotiators:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 390
    return-void
.end method

.method public addJingleMediaSession(Ljava/lang/String;Lorg/jivesoftware/smackx/jingle/media/JingleMediaSession;)V
    .locals 1
    .param p1, "mediaManagerName"    # Ljava/lang/String;
    .param p2, "mediaSession"    # Lorg/jivesoftware/smackx/jingle/media/JingleMediaSession;

    .prologue
    .line 1203
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/JingleSession;->mediaSessionMap:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1204
    return-void
.end method

.method public addMediaListener(Lorg/jivesoftware/smackx/jingle/listeners/JingleMediaListener;)V
    .locals 3
    .param p1, "li"    # Lorg/jivesoftware/smackx/jingle/listeners/JingleMediaListener;

    .prologue
    .line 746
    iget-object v2, p0, Lorg/jivesoftware/smackx/jingle/JingleSession;->contentNegotiators:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;

    .line 747
    .local v0, "contentNegotiator":Lorg/jivesoftware/smackx/jingle/ContentNegotiator;
    invoke-virtual {v0}, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;->getMediaNegotiator()Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 748
    invoke-virtual {v0}, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;->getMediaNegotiator()Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;

    move-result-object v2

    invoke-virtual {v2, p1}, Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;->addListener(Lorg/jivesoftware/smackx/jingle/listeners/JingleListener;)V

    goto :goto_0

    .line 752
    .end local v0    # "contentNegotiator":Lorg/jivesoftware/smackx/jingle/ContentNegotiator;
    :cond_1
    return-void
.end method

.method public addTransportListener(Lorg/jivesoftware/smackx/jingle/listeners/JingleTransportListener;)V
    .locals 3
    .param p1, "li"    # Lorg/jivesoftware/smackx/jingle/listeners/JingleTransportListener;

    .prologue
    .line 775
    iget-object v2, p0, Lorg/jivesoftware/smackx/jingle/JingleSession;->contentNegotiators:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;

    .line 776
    .local v0, "contentNegotiator":Lorg/jivesoftware/smackx/jingle/ContentNegotiator;
    invoke-virtual {v0}, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;->getTransportNegotiator()Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 777
    invoke-virtual {v0}, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;->getTransportNegotiator()Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;

    move-result-object v2

    invoke-virtual {v2, p1}, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->addListener(Lorg/jivesoftware/smackx/jingle/listeners/JingleListener;)V

    goto :goto_0

    .line 780
    .end local v0    # "contentNegotiator":Lorg/jivesoftware/smackx/jingle/ContentNegotiator;
    :cond_1
    return-void
.end method

.method public close()V
    .locals 7

    .prologue
    .line 991
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/JingleSession;->isClosed()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 1012
    :goto_0
    return-void

    .line 995
    :cond_0
    invoke-static {}, Lorg/jivesoftware/smackx/jingle/JingleSessionStateEnded;->getInstance()Lorg/jivesoftware/smackx/jingle/JingleSessionState;

    move-result-object v4

    invoke-virtual {p0, v4}, Lorg/jivesoftware/smackx/jingle/JingleSession;->setSessionState(Lorg/jivesoftware/smackx/jingle/JingleSessionState;)V

    .line 997
    iget-object v4, p0, Lorg/jivesoftware/smackx/jingle/JingleSession;->contentNegotiators:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;

    .line 999
    .local v1, "contentNegotiator":Lorg/jivesoftware/smackx/jingle/ContentNegotiator;
    invoke-virtual {v1}, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;->stopJingleMediaSession()V

    .line 1001
    invoke-virtual {v1}, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;->getTransportNegotiator()Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;

    move-result-object v4

    invoke-virtual {v4}, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->getOfferedCandidates()Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :goto_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    .line 1002
    .local v0, "candidate":Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    invoke-virtual {v0}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->removeCandidateEcho()V

    goto :goto_2

    .line 1004
    .end local v0    # "candidate":Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    :cond_1
    invoke-virtual {v1}, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;->close()V

    goto :goto_1

    .line 1006
    .end local v1    # "contentNegotiator":Lorg/jivesoftware/smackx/jingle/ContentNegotiator;
    .end local v3    # "i$":Ljava/util/Iterator;
    :cond_2
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/JingleSession;->removePacketListener()V

    .line 1007
    invoke-direct {p0}, Lorg/jivesoftware/smackx/jingle/JingleSession;->removeConnectionListener()V

    .line 1008
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/JingleSession;->getConnection()Lorg/jivesoftware/smack/Connection;

    move-result-object v4

    iget-object v5, p0, Lorg/jivesoftware/smackx/jingle/JingleSession;->connectionListener:Lorg/jivesoftware/smack/ConnectionListener;

    invoke-virtual {v4, v5}, Lorg/jivesoftware/smack/Connection;->removeConnectionListener(Lorg/jivesoftware/smack/ConnectionListener;)V

    .line 1009
    sget-object v4, Lorg/jivesoftware/smackx/jingle/JingleSession;->LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "Negotiation Closed: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/JingleSession;->getConnection()Lorg/jivesoftware/smack/Connection;

    move-result-object v6

    invoke-virtual {v6}, Lorg/jivesoftware/smack/Connection;->getUser()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, " "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lorg/jivesoftware/smackx/jingle/JingleSession;->sid:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lorg/jivesoftware/smackx/jingle/SmackLogger;->debug(Ljava/lang/String;)V

    .line 1010
    invoke-super {p0}, Lorg/jivesoftware/smackx/jingle/JingleNegotiator;->close()V

    goto :goto_0
.end method

.method public createAck(Lorg/jivesoftware/smack/packet/IQ;)Lorg/jivesoftware/smack/packet/IQ;
    .locals 6
    .param p1, "iq"    # Lorg/jivesoftware/smack/packet/IQ;

    .prologue
    .line 498
    const/4 v1, 0x0

    .line 500
    .local v1, "result":Lorg/jivesoftware/smack/packet/IQ;
    if-eqz p1, :cond_0

    .line 502
    invoke-virtual {p1}, Lorg/jivesoftware/smack/packet/IQ;->getType()Lorg/jivesoftware/smack/packet/IQ$Type;

    move-result-object v2

    sget-object v3, Lorg/jivesoftware/smack/packet/IQ$Type;->SET:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 503
    invoke-virtual {p1}, Lorg/jivesoftware/smack/packet/IQ;->getPacketID()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Lorg/jivesoftware/smack/packet/IQ;->getFrom()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1}, Lorg/jivesoftware/smack/packet/IQ;->getTo()Ljava/lang/String;

    move-result-object v4

    sget-object v5, Lorg/jivesoftware/smack/packet/IQ$Type;->RESULT:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-static {v2, v3, v4, v5}, Lorg/jivesoftware/smackx/jingle/JingleSession;->createIQ(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/jivesoftware/smack/packet/IQ$Type;)Lorg/jivesoftware/smack/packet/IQ;

    move-result-object v0

    .line 507
    .local v0, "ack":Lorg/jivesoftware/smack/packet/IQ;
    move-object v1, v0

    .line 510
    .end local v0    # "ack":Lorg/jivesoftware/smack/packet/IQ;
    :cond_0
    return-object v1
.end method

.method public createJingleError(Lorg/jivesoftware/smack/packet/IQ;Lorg/jivesoftware/smackx/packet/JingleError;)Lorg/jivesoftware/smack/packet/IQ;
    .locals 7
    .param p1, "iq"    # Lorg/jivesoftware/smack/packet/IQ;
    .param p2, "jingleError"    # Lorg/jivesoftware/smackx/packet/JingleError;

    .prologue
    .line 1084
    const/4 v6, 0x0

    .line 1085
    .local v6, "errorPacket":Lorg/jivesoftware/smack/packet/IQ;
    if-eqz p2, :cond_0

    .line 1086
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/JingleSession;->getSid()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lorg/jivesoftware/smack/packet/IQ;->getFrom()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Lorg/jivesoftware/smack/packet/IQ;->getTo()Ljava/lang/String;

    move-result-object v3

    sget-object v4, Lorg/jivesoftware/smack/packet/IQ$Type;->ERROR:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-static {v1, v2, v3, v4}, Lorg/jivesoftware/smackx/jingle/JingleSession;->createIQ(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/jivesoftware/smack/packet/IQ$Type;)Lorg/jivesoftware/smack/packet/IQ;

    move-result-object v6

    .line 1088
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 1089
    .local v5, "extList":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smack/packet/PacketExtension;>;"
    invoke-interface {v5, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1090
    new-instance v0, Lorg/jivesoftware/smack/packet/XMPPError;

    const/4 v1, 0x0

    sget-object v2, Lorg/jivesoftware/smack/packet/XMPPError$Type;->CANCEL:Lorg/jivesoftware/smack/packet/XMPPError$Type;

    invoke-virtual {p2}, Lorg/jivesoftware/smackx/packet/JingleError;->toString()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, ""

    invoke-direct/range {v0 .. v5}, Lorg/jivesoftware/smack/packet/XMPPError;-><init>(ILorg/jivesoftware/smack/packet/XMPPError$Type;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V

    .line 1093
    .local v0, "error":Lorg/jivesoftware/smack/packet/XMPPError;
    invoke-virtual {p1}, Lorg/jivesoftware/smack/packet/IQ;->getPacketID()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v6, v1}, Lorg/jivesoftware/smack/packet/IQ;->setPacketID(Ljava/lang/String;)V

    .line 1094
    invoke-virtual {v6, v0}, Lorg/jivesoftware/smack/packet/IQ;->setError(Lorg/jivesoftware/smack/packet/XMPPError;)V

    .line 1099
    sget-object v1, Lorg/jivesoftware/smackx/jingle/JingleSession;->LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Error sent: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v6}, Lorg/jivesoftware/smack/packet/IQ;->toXML()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/jivesoftware/smackx/jingle/SmackLogger;->error(Ljava/lang/String;)V

    .line 1101
    .end local v0    # "error":Lorg/jivesoftware/smack/packet/XMPPError;
    .end local v5    # "extList":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smack/packet/PacketExtension;>;"
    :cond_0
    return-object v6
.end method

.method public dispatchIncomingPacket(Lorg/jivesoftware/smack/packet/IQ;Ljava/lang/String;)Ljava/util/List;
    .locals 6
    .param p1, "iq"    # Lorg/jivesoftware/smack/packet/IQ;
    .param p2, "id"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jivesoftware/smack/packet/IQ;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smack/packet/IQ;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 347
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 348
    .local v3, "responses":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smack/packet/IQ;>;"
    const/4 v2, 0x0

    .line 350
    .local v2, "response":Lorg/jivesoftware/smack/packet/IQ;
    if-eqz p1, :cond_0

    .line 351
    invoke-virtual {p1}, Lorg/jivesoftware/smack/packet/IQ;->getType()Lorg/jivesoftware/smack/packet/IQ$Type;

    move-result-object v4

    sget-object v5, Lorg/jivesoftware/smack/packet/IQ$Type;->ERROR:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {v4, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 376
    :cond_0
    :goto_0
    if-eqz v2, :cond_1

    .line 378
    invoke-virtual {v2}, Lorg/jivesoftware/smack/packet/IQ;->getPacketID()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Lorg/jivesoftware/smackx/jingle/JingleSession;->addExpectedId(Ljava/lang/String;)V

    .line 379
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 382
    :cond_1
    return-object v3

    .line 354
    :cond_2
    invoke-virtual {p1}, Lorg/jivesoftware/smack/packet/IQ;->getType()Lorg/jivesoftware/smack/packet/IQ$Type;

    move-result-object v4

    sget-object v5, Lorg/jivesoftware/smack/packet/IQ$Type;->RESULT:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {v4, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 356
    invoke-virtual {p1}, Lorg/jivesoftware/smack/packet/IQ;->getPacketID()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Lorg/jivesoftware/smackx/jingle/JingleSession;->isExpectedId(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 360
    invoke-virtual {p1}, Lorg/jivesoftware/smack/packet/IQ;->getPacketID()Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lorg/jivesoftware/smackx/jingle/JingleSession;->sessionInitPacketID:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 361
    invoke-direct {p0}, Lorg/jivesoftware/smackx/jingle/JingleSession;->startNegotiators()V

    .line 363
    :cond_3
    invoke-virtual {p1}, Lorg/jivesoftware/smack/packet/IQ;->getPacketID()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Lorg/jivesoftware/smackx/jingle/JingleSession;->removeExpectedId(Ljava/lang/String;)V

    goto :goto_0

    .line 365
    :cond_4
    instance-of v4, p1, Lorg/jivesoftware/smackx/packet/Jingle;

    if-eqz v4, :cond_0

    move-object v1, p1

    .line 367
    check-cast v1, Lorg/jivesoftware/smackx/packet/Jingle;

    .line 368
    .local v1, "jin":Lorg/jivesoftware/smackx/packet/Jingle;
    invoke-virtual {v1}, Lorg/jivesoftware/smackx/packet/Jingle;->getAction()Lorg/jivesoftware/smackx/jingle/JingleActionEnum;

    move-result-object v0

    .line 372
    .local v0, "action":Lorg/jivesoftware/smackx/jingle/JingleActionEnum;
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/JingleSession;->getSessionState()Lorg/jivesoftware/smackx/jingle/JingleSessionState;

    move-result-object v4

    invoke-virtual {v4, p0, v1, v0}, Lorg/jivesoftware/smackx/jingle/JingleSessionState;->processJingle(Lorg/jivesoftware/smackx/jingle/JingleSession;Lorg/jivesoftware/smackx/packet/Jingle;Lorg/jivesoftware/smackx/jingle/JingleActionEnum;)Lorg/jivesoftware/smack/packet/IQ;

    move-result-object v2

    goto :goto_0
.end method

.method protected doStart()V
    .locals 0

    .prologue
    .line 1182
    return-void
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 534
    if-ne p0, p1, :cond_1

    .line 571
    :cond_0
    :goto_0
    return v1

    .line 537
    :cond_1
    if-nez p1, :cond_2

    move v1, v2

    .line 538
    goto :goto_0

    .line 540
    :cond_2
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_3

    move v1, v2

    .line 541
    goto :goto_0

    :cond_3
    move-object v0, p1

    .line 544
    check-cast v0, Lorg/jivesoftware/smackx/jingle/JingleSession;

    .line 546
    .local v0, "other":Lorg/jivesoftware/smackx/jingle/JingleSession;
    iget-object v3, p0, Lorg/jivesoftware/smackx/jingle/JingleSession;->initiator:Ljava/lang/String;

    if-nez v3, :cond_4

    .line 547
    iget-object v3, v0, Lorg/jivesoftware/smackx/jingle/JingleSession;->initiator:Ljava/lang/String;

    if-eqz v3, :cond_5

    move v1, v2

    .line 548
    goto :goto_0

    .line 550
    :cond_4
    iget-object v3, p0, Lorg/jivesoftware/smackx/jingle/JingleSession;->initiator:Ljava/lang/String;

    iget-object v4, v0, Lorg/jivesoftware/smackx/jingle/JingleSession;->initiator:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_5

    .line 555
    :cond_5
    iget-object v3, p0, Lorg/jivesoftware/smackx/jingle/JingleSession;->responder:Ljava/lang/String;

    if-nez v3, :cond_6

    .line 556
    iget-object v3, v0, Lorg/jivesoftware/smackx/jingle/JingleSession;->responder:Ljava/lang/String;

    if-eqz v3, :cond_7

    move v1, v2

    .line 557
    goto :goto_0

    .line 559
    :cond_6
    iget-object v3, p0, Lorg/jivesoftware/smackx/jingle/JingleSession;->responder:Ljava/lang/String;

    iget-object v4, v0, Lorg/jivesoftware/smackx/jingle/JingleSession;->responder:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_7

    move v1, v2

    .line 560
    goto :goto_0

    .line 563
    :cond_7
    iget-object v3, p0, Lorg/jivesoftware/smackx/jingle/JingleSession;->sid:Ljava/lang/String;

    if-nez v3, :cond_8

    .line 564
    iget-object v3, v0, Lorg/jivesoftware/smackx/jingle/JingleSession;->sid:Ljava/lang/String;

    if-eqz v3, :cond_0

    move v1, v2

    .line 565
    goto :goto_0

    .line 567
    :cond_8
    iget-object v3, p0, Lorg/jivesoftware/smackx/jingle/JingleSession;->sid:Ljava/lang/String;

    iget-object v4, v0, Lorg/jivesoftware/smackx/jingle/JingleSession;->sid:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    move v1, v2

    .line 568
    goto :goto_0
.end method

.method public getConnection()Lorg/jivesoftware/smack/Connection;
    .locals 1

    .prologue
    .line 159
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/JingleSession;->connection:Lorg/jivesoftware/smack/Connection;

    return-object v0
.end method

.method public getInitiator()Ljava/lang/String;
    .locals 1

    .prologue
    .line 155
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/JingleSession;->initiator:Ljava/lang/String;

    return-object v0
.end method

.method public getMediaManagers()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smackx/jingle/media/JingleMediaManager;",
            ">;"
        }
    .end annotation

    .prologue
    .line 178
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/JingleSession;->jingleMediaManagers:Ljava/util/List;

    return-object v0
.end method

.method public getMediaSession(Ljava/lang/String;)Lorg/jivesoftware/smackx/jingle/media/JingleMediaSession;
    .locals 1
    .param p1, "mediaManagerName"    # Ljava/lang/String;

    .prologue
    .line 1213
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/JingleSession;->mediaSessionMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smackx/jingle/media/JingleMediaSession;

    return-object v0
.end method

.method public getResponder()Ljava/lang/String;
    .locals 1

    .prologue
    .line 196
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/JingleSession;->responder:Ljava/lang/String;

    return-object v0
.end method

.method public getSessionState()Lorg/jivesoftware/smackx/jingle/JingleSessionState;
    .locals 1

    .prologue
    .line 247
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/JingleSession;->sessionState:Lorg/jivesoftware/smackx/jingle/JingleSessionState;

    return-object v0
.end method

.method public getSid()Ljava/lang/String;
    .locals 1

    .prologue
    .line 215
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/JingleSession;->sid:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 2

    .prologue
    .line 525
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/JingleSession;->getSid()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/JingleSession;->getInitiator()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lorg/jivesoftware/smackx/packet/Jingle;->getSessionHash(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public isClosed()Z
    .locals 2

    .prologue
    .line 1015
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/JingleSession;->getSessionState()Lorg/jivesoftware/smackx/jingle/JingleSessionState;

    move-result-object v0

    invoke-static {}, Lorg/jivesoftware/smackx/jingle/JingleSessionStateEnded;->getInstance()Lorg/jivesoftware/smackx/jingle/JingleSessionState;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public isFullyEstablished()Z
    .locals 4

    .prologue
    .line 254
    const/4 v2, 0x1

    .line 255
    .local v2, "result":Z
    iget-object v3, p0, Lorg/jivesoftware/smackx/jingle/JingleSession;->contentNegotiators:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;

    .line 256
    .local v0, "contentNegotiator":Lorg/jivesoftware/smackx/jingle/ContentNegotiator;
    invoke-virtual {v0}, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;->isFullyEstablished()Z

    move-result v3

    if-nez v3, :cond_0

    .line 257
    const/4 v2, 0x0

    goto :goto_0

    .line 259
    .end local v0    # "contentNegotiator":Lorg/jivesoftware/smackx/jingle/ContentNegotiator;
    :cond_1
    return v2
.end method

.method public mediaReceived(Ljava/lang/String;)V
    .locals 0
    .param p1, "participant"    # Ljava/lang/String;

    .prologue
    .line 1108
    invoke-virtual {p0, p1}, Lorg/jivesoftware/smackx/jingle/JingleSession;->triggerMediaReceived(Ljava/lang/String;)V

    .line 1109
    return-void
.end method

.method public declared-synchronized receivePacketAndRespond(Lorg/jivesoftware/smack/packet/IQ;)V
    .locals 10
    .param p1, "iq"    # Lorg/jivesoftware/smack/packet/IQ;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 280
    monitor-enter p0

    :try_start_0
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 282
    .local v6, "responses":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smack/packet/IQ;>;"
    const/4 v5, 0x0

    .line 284
    .local v5, "responseId":Ljava/lang/String;
    sget-object v7, Lorg/jivesoftware/smackx/jingle/JingleSession;->LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "Packet: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {p1}, Lorg/jivesoftware/smack/packet/IQ;->toXML()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Lorg/jivesoftware/smackx/jingle/SmackLogger;->debug(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 289
    const/4 v7, 0x0

    :try_start_1
    invoke-virtual {p0, p1, v7}, Lorg/jivesoftware/smackx/jingle/JingleSession;->dispatchIncomingPacket(Lorg/jivesoftware/smack/packet/IQ;Ljava/lang/String;)Ljava/util/List;

    move-result-object v7

    invoke-interface {v6, v7}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 291
    if-eqz p1, :cond_2

    .line 292
    invoke-virtual {p1}, Lorg/jivesoftware/smack/packet/IQ;->getPacketID()Ljava/lang/String;

    move-result-object v5

    .line 297
    iget-object v7, p0, Lorg/jivesoftware/smackx/jingle/JingleSession;->contentNegotiators:Ljava/util/List;

    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;

    .line 302
    .local v0, "contentNegotiator":Lorg/jivesoftware/smackx/jingle/ContentNegotiator;
    invoke-virtual {v0}, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;->isStarted()Z

    move-result v7

    if-nez v7, :cond_0

    .line 303
    invoke-virtual {v0}, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;->start()V

    .line 305
    :cond_0
    invoke-virtual {v0, p1, v5}, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;->dispatchIncomingPacket(Lorg/jivesoftware/smack/packet/IQ;Ljava/lang/String;)Ljava/util/List;

    move-result-object v7

    invoke-interface {v6, v7}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z
    :try_end_1
    .catch Lorg/jivesoftware/smackx/jingle/JingleException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 314
    .end local v0    # "contentNegotiator":Lorg/jivesoftware/smackx/jingle/ContentNegotiator;
    .end local v3    # "i$":Ljava/util/Iterator;
    :catch_0
    move-exception v1

    .line 316
    .local v1, "e":Lorg/jivesoftware/smackx/jingle/JingleException;
    :try_start_2
    invoke-virtual {v1}, Lorg/jivesoftware/smackx/jingle/JingleException;->getError()Lorg/jivesoftware/smackx/packet/JingleError;

    move-result-object v2

    .line 317
    .local v2, "error":Lorg/jivesoftware/smackx/packet/JingleError;
    if-eqz v2, :cond_1

    .line 318
    invoke-virtual {p0, p1, v2}, Lorg/jivesoftware/smackx/jingle/JingleSession;->createJingleError(Lorg/jivesoftware/smack/packet/IQ;Lorg/jivesoftware/smackx/packet/JingleError;)Lorg/jivesoftware/smack/packet/IQ;

    move-result-object v7

    invoke-interface {v6, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 322
    :cond_1
    invoke-virtual {p0, v1}, Lorg/jivesoftware/smackx/jingle/JingleSession;->triggerSessionClosedOnError(Lorg/jivesoftware/smack/XMPPException;)V

    .line 331
    .end local v1    # "e":Lorg/jivesoftware/smackx/jingle/JingleException;
    .end local v2    # "error":Lorg/jivesoftware/smackx/packet/JingleError;
    :cond_2
    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .restart local v3    # "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_3

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/jivesoftware/smack/packet/IQ;

    .line 332
    .local v4, "response":Lorg/jivesoftware/smack/packet/IQ;
    invoke-virtual {p0, v4}, Lorg/jivesoftware/smackx/jingle/JingleSession;->sendPacket(Lorg/jivesoftware/smack/packet/IQ;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1

    .line 280
    .end local v3    # "i$":Ljava/util/Iterator;
    .end local v4    # "response":Lorg/jivesoftware/smack/packet/IQ;
    .end local v5    # "responseId":Ljava/lang/String;
    .end local v6    # "responses":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smack/packet/IQ;>;"
    :catchall_0
    move-exception v7

    monitor-exit p0

    throw v7

    .line 334
    .restart local v3    # "i$":Ljava/util/Iterator;
    .restart local v5    # "responseId":Ljava/lang/String;
    .restart local v6    # "responses":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smack/packet/IQ;>;"
    :cond_3
    monitor-exit p0

    return-void
.end method

.method public removeMediaListener(Lorg/jivesoftware/smackx/jingle/listeners/JingleMediaListener;)V
    .locals 3
    .param p1, "li"    # Lorg/jivesoftware/smackx/jingle/listeners/JingleMediaListener;

    .prologue
    .line 761
    iget-object v2, p0, Lorg/jivesoftware/smackx/jingle/JingleSession;->contentNegotiators:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;

    .line 762
    .local v0, "contentNegotiator":Lorg/jivesoftware/smackx/jingle/ContentNegotiator;
    invoke-virtual {v0}, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;->getMediaNegotiator()Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 763
    invoke-virtual {v0}, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;->getMediaNegotiator()Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;

    move-result-object v2

    invoke-virtual {v2, p1}, Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;->removeListener(Lorg/jivesoftware/smackx/jingle/listeners/JingleListener;)V

    goto :goto_0

    .line 766
    .end local v0    # "contentNegotiator":Lorg/jivesoftware/smackx/jingle/ContentNegotiator;
    :cond_1
    return-void
.end method

.method protected removePacketListener()V
    .locals 2

    .prologue
    .line 661
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/JingleSession;->packetListener:Lorg/jivesoftware/smack/PacketListener;

    if-eqz v0, :cond_0

    .line 662
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/JingleSession;->getConnection()Lorg/jivesoftware/smack/Connection;

    move-result-object v0

    iget-object v1, p0, Lorg/jivesoftware/smackx/jingle/JingleSession;->packetListener:Lorg/jivesoftware/smack/PacketListener;

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smack/Connection;->removePacketListener(Lorg/jivesoftware/smack/PacketListener;)V

    .line 664
    sget-object v0, Lorg/jivesoftware/smackx/jingle/JingleSession;->LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;

    const-string/jumbo v1, "JINGLE SESSION: REMOVE PACKET LISTENER"

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smackx/jingle/SmackLogger;->debug(Ljava/lang/String;)V

    .line 666
    :cond_0
    return-void
.end method

.method public removeTransportListener(Lorg/jivesoftware/smackx/jingle/listeners/JingleTransportListener;)V
    .locals 3
    .param p1, "li"    # Lorg/jivesoftware/smackx/jingle/listeners/JingleTransportListener;

    .prologue
    .line 789
    iget-object v2, p0, Lorg/jivesoftware/smackx/jingle/JingleSession;->contentNegotiators:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;

    .line 790
    .local v0, "contentNegotiator":Lorg/jivesoftware/smackx/jingle/ContentNegotiator;
    invoke-virtual {v0}, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;->getTransportNegotiator()Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 791
    invoke-virtual {v0}, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;->getTransportNegotiator()Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;

    move-result-object v2

    invoke-virtual {v2, p1}, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->removeListener(Lorg/jivesoftware/smackx/jingle/listeners/JingleListener;)V

    goto :goto_0

    .line 794
    .end local v0    # "contentNegotiator":Lorg/jivesoftware/smackx/jingle/ContentNegotiator;
    :cond_1
    return-void
.end method

.method public sendFormattedJingle(Lorg/jivesoftware/smack/packet/IQ;Lorg/jivesoftware/smackx/packet/Jingle;)Lorg/jivesoftware/smackx/packet/Jingle;
    .locals 3
    .param p1, "iq"    # Lorg/jivesoftware/smack/packet/IQ;
    .param p2, "jout"    # Lorg/jivesoftware/smackx/packet/Jingle;

    .prologue
    .line 432
    if-eqz p2, :cond_5

    .line 433
    invoke-virtual {p2}, Lorg/jivesoftware/smackx/packet/Jingle;->getInitiator()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_0

    .line 434
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/JingleSession;->getInitiator()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p2, v2}, Lorg/jivesoftware/smackx/packet/Jingle;->setInitiator(Ljava/lang/String;)V

    .line 437
    :cond_0
    invoke-virtual {p2}, Lorg/jivesoftware/smackx/packet/Jingle;->getResponder()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_1

    .line 438
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/JingleSession;->getResponder()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p2, v2}, Lorg/jivesoftware/smackx/packet/Jingle;->setResponder(Ljava/lang/String;)V

    .line 441
    :cond_1
    invoke-virtual {p2}, Lorg/jivesoftware/smackx/packet/Jingle;->getSid()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_2

    .line 442
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/JingleSession;->getSid()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p2, v2}, Lorg/jivesoftware/smackx/packet/Jingle;->setSid(Ljava/lang/String;)V

    .line 445
    :cond_2
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/JingleSession;->getConnection()Lorg/jivesoftware/smack/Connection;

    move-result-object v2

    invoke-virtual {v2}, Lorg/jivesoftware/smack/Connection;->getUser()Ljava/lang/String;

    move-result-object v0

    .line 446
    .local v0, "me":Ljava/lang/String;
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/JingleSession;->getResponder()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/JingleSession;->getInitiator()Ljava/lang/String;

    move-result-object v1

    .line 448
    .local v1, "other":Ljava/lang/String;
    :goto_0
    invoke-virtual {p2}, Lorg/jivesoftware/smackx/packet/Jingle;->getTo()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_3

    .line 449
    if-eqz p1, :cond_7

    .line 450
    invoke-virtual {p1}, Lorg/jivesoftware/smack/packet/IQ;->getFrom()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p2, v2}, Lorg/jivesoftware/smackx/packet/Jingle;->setTo(Ljava/lang/String;)V

    .line 456
    :cond_3
    :goto_1
    invoke-virtual {p2}, Lorg/jivesoftware/smackx/packet/Jingle;->getFrom()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_4

    .line 457
    if-eqz p1, :cond_8

    .line 458
    invoke-virtual {p1}, Lorg/jivesoftware/smack/packet/IQ;->getTo()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p2, v2}, Lorg/jivesoftware/smackx/packet/Jingle;->setFrom(Ljava/lang/String;)V

    .line 465
    :cond_4
    :goto_2
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/JingleSession;->getConnection()Lorg/jivesoftware/smack/Connection;

    move-result-object v2

    if-eqz v2, :cond_5

    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/JingleSession;->getConnection()Lorg/jivesoftware/smack/Connection;

    move-result-object v2

    invoke-virtual {v2}, Lorg/jivesoftware/smack/Connection;->isConnected()Z

    move-result v2

    if-eqz v2, :cond_5

    .line 466
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/JingleSession;->getConnection()Lorg/jivesoftware/smack/Connection;

    move-result-object v2

    invoke-virtual {v2, p2}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 468
    .end local v0    # "me":Ljava/lang/String;
    .end local v1    # "other":Ljava/lang/String;
    :cond_5
    return-object p2

    .line 446
    .restart local v0    # "me":Ljava/lang/String;
    :cond_6
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/JingleSession;->getResponder()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 452
    .restart local v1    # "other":Ljava/lang/String;
    :cond_7
    invoke-virtual {p2, v1}, Lorg/jivesoftware/smackx/packet/Jingle;->setTo(Ljava/lang/String;)V

    goto :goto_1

    .line 460
    :cond_8
    invoke-virtual {p2, v0}, Lorg/jivesoftware/smackx/packet/Jingle;->setFrom(Ljava/lang/String;)V

    goto :goto_2
.end method

.method public sendFormattedJingle(Lorg/jivesoftware/smackx/packet/Jingle;)Lorg/jivesoftware/smackx/packet/Jingle;
    .locals 1
    .param p1, "jout"    # Lorg/jivesoftware/smackx/packet/Jingle;

    .prologue
    .line 418
    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1}, Lorg/jivesoftware/smackx/jingle/JingleSession;->sendFormattedJingle(Lorg/jivesoftware/smack/packet/IQ;Lorg/jivesoftware/smackx/packet/Jingle;)Lorg/jivesoftware/smackx/packet/Jingle;

    move-result-object v0

    return-object v0
.end method

.method public sendPacket(Lorg/jivesoftware/smack/packet/IQ;)V
    .locals 1
    .param p1, "iq"    # Lorg/jivesoftware/smack/packet/IQ;

    .prologue
    .line 400
    instance-of v0, p1, Lorg/jivesoftware/smackx/packet/Jingle;

    if-eqz v0, :cond_0

    .line 402
    check-cast p1, Lorg/jivesoftware/smackx/packet/Jingle;

    .end local p1    # "iq":Lorg/jivesoftware/smack/packet/IQ;
    invoke-virtual {p0, p1}, Lorg/jivesoftware/smackx/jingle/JingleSession;->sendFormattedJingle(Lorg/jivesoftware/smackx/packet/Jingle;)Lorg/jivesoftware/smackx/packet/Jingle;

    .line 408
    :goto_0
    return-void

    .line 406
    .restart local p1    # "iq":Lorg/jivesoftware/smack/packet/IQ;
    :cond_0
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/JingleSession;->getConnection()Lorg/jivesoftware/smack/Connection;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    goto :goto_0
.end method

.method public setInitiator(Ljava/lang/String;)V
    .locals 0
    .param p1, "initiator"    # Ljava/lang/String;

    .prologue
    .line 169
    iput-object p1, p0, Lorg/jivesoftware/smackx/jingle/JingleSession;->initiator:Ljava/lang/String;

    .line 170
    return-void
.end method

.method public setMediaManagers(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smackx/jingle/media/JingleMediaManager;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 187
    .local p1, "jingleMediaManagers":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smackx/jingle/media/JingleMediaManager;>;"
    iput-object p1, p0, Lorg/jivesoftware/smackx/jingle/JingleSession;->jingleMediaManagers:Ljava/util/List;

    .line 188
    return-void
.end method

.method public setResponder(Ljava/lang/String;)V
    .locals 0
    .param p1, "responder"    # Ljava/lang/String;

    .prologue
    .line 206
    iput-object p1, p0, Lorg/jivesoftware/smackx/jingle/JingleSession;->responder:Ljava/lang/String;

    .line 207
    return-void
.end method

.method public setSessionState(Lorg/jivesoftware/smackx/jingle/JingleSessionState;)V
    .locals 3
    .param p1, "stateIs"    # Lorg/jivesoftware/smackx/jingle/JingleSessionState;

    .prologue
    .line 241
    sget-object v0, Lorg/jivesoftware/smackx/jingle/JingleSession;->LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Session state change: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/jivesoftware/smackx/jingle/JingleSession;->sessionState:Lorg/jivesoftware/smackx/jingle/JingleSessionState;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "->"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smackx/jingle/SmackLogger;->debug(Ljava/lang/String;)V

    .line 242
    invoke-virtual {p1}, Lorg/jivesoftware/smackx/jingle/JingleSessionState;->enter()V

    .line 243
    iput-object p1, p0, Lorg/jivesoftware/smackx/jingle/JingleSession;->sessionState:Lorg/jivesoftware/smackx/jingle/JingleSessionState;

    .line 244
    return-void
.end method

.method protected setSid(Ljava/lang/String;)V
    .locals 0
    .param p1, "sessionId"    # Ljava/lang/String;

    .prologue
    .line 225
    iput-object p1, p0, Lorg/jivesoftware/smackx/jingle/JingleSession;->sid:Ljava/lang/String;

    .line 226
    return-void
.end method

.method public setupListeners()V
    .locals 2

    .prologue
    .line 802
    new-instance v0, Lorg/jivesoftware/smackx/jingle/JingleSession$4;

    invoke-direct {v0, p0}, Lorg/jivesoftware/smackx/jingle/JingleSession$4;-><init>(Lorg/jivesoftware/smackx/jingle/JingleSession;)V

    .line 825
    .local v0, "jingleMediaListener":Lorg/jivesoftware/smackx/jingle/listeners/JingleMediaListener;
    new-instance v1, Lorg/jivesoftware/smackx/jingle/JingleSession$5;

    invoke-direct {v1, p0}, Lorg/jivesoftware/smackx/jingle/JingleSession$5;-><init>(Lorg/jivesoftware/smackx/jingle/JingleSession;)V

    .line 861
    .local v1, "jingleTransportListener":Lorg/jivesoftware/smackx/jingle/listeners/JingleTransportListener;
    invoke-virtual {p0, v0}, Lorg/jivesoftware/smackx/jingle/JingleSession;->addMediaListener(Lorg/jivesoftware/smackx/jingle/listeners/JingleMediaListener;)V

    .line 862
    invoke-virtual {p0, v1}, Lorg/jivesoftware/smackx/jingle/JingleSession;->addTransportListener(Lorg/jivesoftware/smackx/jingle/listeners/JingleTransportListener;)V

    .line 863
    return-void
.end method

.method public startIncoming()V
    .locals 0

    .prologue
    .line 1178
    return-void
.end method

.method public startOutgoing()V
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .prologue
    .line 1118
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/JingleSession;->updatePacketListener()V

    .line 1119
    invoke-static {}, Lorg/jivesoftware/smackx/jingle/JingleSessionStatePending;->getInstance()Lorg/jivesoftware/smackx/jingle/JingleSessionState;

    move-result-object v8

    invoke-virtual {p0, v8}, Lorg/jivesoftware/smackx/jingle/JingleSession;->setSessionState(Lorg/jivesoftware/smackx/jingle/JingleSessionState;)V

    .line 1121
    new-instance v4, Lorg/jivesoftware/smackx/packet/Jingle;

    sget-object v8, Lorg/jivesoftware/smackx/jingle/JingleActionEnum;->SESSION_INITIATE:Lorg/jivesoftware/smackx/jingle/JingleActionEnum;

    invoke-direct {v4, v8}, Lorg/jivesoftware/smackx/packet/Jingle;-><init>(Lorg/jivesoftware/smackx/jingle/JingleActionEnum;)V

    .line 1124
    .local v4, "jingle":Lorg/jivesoftware/smackx/packet/Jingle;
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/JingleSession;->getMediaManagers()Ljava/util/List;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/jivesoftware/smackx/jingle/media/JingleMediaManager;

    .line 1125
    .local v5, "mediaManager":Lorg/jivesoftware/smackx/jingle/media/JingleMediaManager;
    new-instance v0, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;

    const-string/jumbo v8, "initiator"

    invoke-virtual {v5}, Lorg/jivesoftware/smackx/jingle/media/JingleMediaManager;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v0, p0, v8, v9}, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;-><init>(Lorg/jivesoftware/smackx/jingle/JingleSession;Ljava/lang/String;Ljava/lang/String;)V

    .line 1128
    .local v0, "contentNeg":Lorg/jivesoftware/smackx/jingle/ContentNegotiator;
    new-instance v8, Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;

    invoke-virtual {v5}, Lorg/jivesoftware/smackx/jingle/media/JingleMediaManager;->getPayloads()Ljava/util/List;

    move-result-object v9

    invoke-direct {v8, p0, v5, v9, v0}, Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;-><init>(Lorg/jivesoftware/smackx/jingle/JingleSession;Lorg/jivesoftware/smackx/jingle/media/JingleMediaManager;Ljava/util/List;Lorg/jivesoftware/smackx/jingle/ContentNegotiator;)V

    invoke-virtual {v0, v8}, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;->setMediaNegotiator(Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;)V

    .line 1130
    invoke-virtual {v5}, Lorg/jivesoftware/smackx/jingle/media/JingleMediaManager;->getTransportManager()Lorg/jivesoftware/smackx/jingle/nat/JingleTransportManager;

    move-result-object v7

    .line 1131
    .local v7, "transportManager":Lorg/jivesoftware/smackx/jingle/nat/JingleTransportManager;
    const/4 v6, 0x0

    .line 1133
    .local v6, "resolver":Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;
    :try_start_0
    invoke-virtual {v7, p0}, Lorg/jivesoftware/smackx/jingle/nat/JingleTransportManager;->getResolver(Lorg/jivesoftware/smackx/jingle/JingleSession;)Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;
    :try_end_0
    .catch Lorg/jivesoftware/smack/XMPPException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v6

    .line 1138
    :goto_1
    invoke-virtual {v6}, Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;->getType()Lorg/jivesoftware/smackx/jingle/nat/TransportResolver$Type;

    move-result-object v8

    sget-object v9, Lorg/jivesoftware/smackx/jingle/nat/TransportResolver$Type;->rawupd:Lorg/jivesoftware/smackx/jingle/nat/TransportResolver$Type;

    invoke-virtual {v8, v9}, Lorg/jivesoftware/smackx/jingle/nat/TransportResolver$Type;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 1139
    new-instance v8, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator$RawUdp;

    invoke-direct {v8, p0, v6, v0}, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator$RawUdp;-><init>(Lorg/jivesoftware/smackx/jingle/JingleSession;Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;Lorg/jivesoftware/smackx/jingle/ContentNegotiator;)V

    invoke-virtual {v0, v8}, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;->setTransportNegotiator(Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;)V

    .line 1141
    :cond_0
    invoke-virtual {v6}, Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;->getType()Lorg/jivesoftware/smackx/jingle/nat/TransportResolver$Type;

    move-result-object v8

    sget-object v9, Lorg/jivesoftware/smackx/jingle/nat/TransportResolver$Type;->ice:Lorg/jivesoftware/smackx/jingle/nat/TransportResolver$Type;

    invoke-virtual {v8, v9}, Lorg/jivesoftware/smackx/jingle/nat/TransportResolver$Type;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 1142
    new-instance v8, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator$Ice;

    invoke-direct {v8, p0, v6, v0}, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator$Ice;-><init>(Lorg/jivesoftware/smackx/jingle/JingleSession;Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;Lorg/jivesoftware/smackx/jingle/ContentNegotiator;)V

    invoke-virtual {v0, v8}, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;->setTransportNegotiator(Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;)V

    .line 1145
    :cond_1
    invoke-virtual {p0, v0}, Lorg/jivesoftware/smackx/jingle/JingleSession;->addContentNegotiator(Lorg/jivesoftware/smackx/jingle/ContentNegotiator;)V

    goto :goto_0

    .line 1134
    :catch_0
    move-exception v2

    .line 1135
    .local v2, "e":Lorg/jivesoftware/smack/XMPPException;
    invoke-virtual {v2}, Lorg/jivesoftware/smack/XMPPException;->printStackTrace()V

    goto :goto_1

    .line 1149
    .end local v0    # "contentNeg":Lorg/jivesoftware/smackx/jingle/ContentNegotiator;
    .end local v2    # "e":Lorg/jivesoftware/smack/XMPPException;
    .end local v5    # "mediaManager":Lorg/jivesoftware/smackx/jingle/media/JingleMediaManager;
    .end local v6    # "resolver":Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;
    .end local v7    # "transportManager":Lorg/jivesoftware/smackx/jingle/nat/JingleTransportManager;
    :cond_2
    iget-object v8, p0, Lorg/jivesoftware/smackx/jingle/JingleSession;->contentNegotiators:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_3

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;

    .line 1150
    .local v1, "contentNegotiator":Lorg/jivesoftware/smackx/jingle/ContentNegotiator;
    invoke-virtual {v1}, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;->getJingleContent()Lorg/jivesoftware/smackx/packet/JingleContent;

    move-result-object v8

    invoke-virtual {v4, v8}, Lorg/jivesoftware/smackx/packet/Jingle;->addContent(Lorg/jivesoftware/smackx/packet/JingleContent;)V

    goto :goto_2

    .line 1154
    .end local v1    # "contentNegotiator":Lorg/jivesoftware/smackx/jingle/ContentNegotiator;
    :cond_3
    invoke-virtual {v4}, Lorg/jivesoftware/smackx/packet/Jingle;->getPacketID()Ljava/lang/String;

    move-result-object v8

    iput-object v8, p0, Lorg/jivesoftware/smackx/jingle/JingleSession;->sessionInitPacketID:Ljava/lang/String;

    .line 1156
    invoke-virtual {p0, v4}, Lorg/jivesoftware/smackx/jingle/JingleSession;->sendPacket(Lorg/jivesoftware/smack/packet/IQ;)V

    .line 1159
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/JingleSession;->setupListeners()V

    .line 1170
    return-void
.end method

.method public terminate()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 969
    const-string/jumbo v0, "Closed Locally"

    invoke-virtual {p0, v0}, Lorg/jivesoftware/smackx/jingle/JingleSession;->terminate(Ljava/lang/String;)V

    .line 970
    return-void
.end method

.method public terminate(Ljava/lang/String;)V
    .locals 4
    .param p1, "reason"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 978
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/JingleSession;->isClosed()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 985
    :goto_0
    return-void

    .line 980
    :cond_0
    sget-object v1, Lorg/jivesoftware/smackx/jingle/JingleSession;->LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Terminate "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/jivesoftware/smackx/jingle/SmackLogger;->debug(Ljava/lang/String;)V

    .line 981
    new-instance v0, Lorg/jivesoftware/smackx/packet/Jingle;

    sget-object v1, Lorg/jivesoftware/smackx/jingle/JingleActionEnum;->SESSION_TERMINATE:Lorg/jivesoftware/smackx/jingle/JingleActionEnum;

    invoke-direct {v0, v1}, Lorg/jivesoftware/smackx/packet/Jingle;-><init>(Lorg/jivesoftware/smackx/jingle/JingleActionEnum;)V

    .line 982
    .local v0, "jout":Lorg/jivesoftware/smackx/packet/Jingle;
    sget-object v1, Lorg/jivesoftware/smack/packet/IQ$Type;->SET:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smackx/packet/Jingle;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 983
    invoke-virtual {p0, v0}, Lorg/jivesoftware/smackx/jingle/JingleSession;->sendPacket(Lorg/jivesoftware/smack/packet/IQ;)V

    .line 984
    invoke-virtual {p0, p1}, Lorg/jivesoftware/smackx/jingle/JingleSession;->triggerSessionClosed(Ljava/lang/String;)V

    goto :goto_0
.end method

.method protected triggerMediaReceived(Ljava/lang/String;)V
    .locals 5
    .param p1, "participant"    # Ljava/lang/String;

    .prologue
    .line 926
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/JingleSession;->getListenersList()Ljava/util/List;

    move-result-object v2

    .line 927
    .local v2, "listeners":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smackx/jingle/listeners/JingleListener;>;"
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jivesoftware/smackx/jingle/listeners/JingleListener;

    .line 928
    .local v1, "li":Lorg/jivesoftware/smackx/jingle/listeners/JingleListener;
    instance-of v4, v1, Lorg/jivesoftware/smackx/jingle/listeners/JingleSessionListener;

    if-eqz v4, :cond_0

    move-object v3, v1

    .line 929
    check-cast v3, Lorg/jivesoftware/smackx/jingle/listeners/JingleSessionListener;

    .line 930
    .local v3, "sli":Lorg/jivesoftware/smackx/jingle/listeners/JingleSessionListener;
    invoke-interface {v3, p0, p1}, Lorg/jivesoftware/smackx/jingle/listeners/JingleSessionListener;->sessionMediaReceived(Lorg/jivesoftware/smackx/jingle/JingleSession;Ljava/lang/String;)V

    goto :goto_0

    .line 933
    .end local v1    # "li":Lorg/jivesoftware/smackx/jingle/listeners/JingleListener;
    .end local v3    # "sli":Lorg/jivesoftware/smackx/jingle/listeners/JingleSessionListener;
    :cond_1
    return-void
.end method

.method protected triggerSessionClosed(Ljava/lang/String;)V
    .locals 5
    .param p1, "reason"    # Ljava/lang/String;

    .prologue
    .line 879
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/JingleSession;->getListenersList()Ljava/util/List;

    move-result-object v2

    .line 880
    .local v2, "listeners":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smackx/jingle/listeners/JingleListener;>;"
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jivesoftware/smackx/jingle/listeners/JingleListener;

    .line 881
    .local v1, "li":Lorg/jivesoftware/smackx/jingle/listeners/JingleListener;
    instance-of v4, v1, Lorg/jivesoftware/smackx/jingle/listeners/JingleSessionListener;

    if-eqz v4, :cond_0

    move-object v3, v1

    .line 882
    check-cast v3, Lorg/jivesoftware/smackx/jingle/listeners/JingleSessionListener;

    .line 883
    .local v3, "sli":Lorg/jivesoftware/smackx/jingle/listeners/JingleSessionListener;
    invoke-interface {v3, p1, p0}, Lorg/jivesoftware/smackx/jingle/listeners/JingleSessionListener;->sessionClosed(Ljava/lang/String;Lorg/jivesoftware/smackx/jingle/JingleSession;)V

    goto :goto_0

    .line 886
    .end local v1    # "li":Lorg/jivesoftware/smackx/jingle/listeners/JingleListener;
    .end local v3    # "sli":Lorg/jivesoftware/smackx/jingle/listeners/JingleSessionListener;
    :cond_1
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/JingleSession;->close()V

    .line 887
    return-void
.end method

.method protected triggerSessionClosedOnError(Lorg/jivesoftware/smack/XMPPException;)V
    .locals 8
    .param p1, "exc"    # Lorg/jivesoftware/smack/XMPPException;

    .prologue
    .line 893
    iget-object v7, p0, Lorg/jivesoftware/smackx/jingle/JingleSession;->contentNegotiators:Ljava/util/List;

    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;

    .line 895
    .local v1, "contentNegotiator":Lorg/jivesoftware/smackx/jingle/ContentNegotiator;
    invoke-virtual {v1}, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;->stopJingleMediaSession()V

    .line 897
    invoke-virtual {v1}, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;->getTransportNegotiator()Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;

    move-result-object v7

    invoke-virtual {v7}, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->getOfferedCandidates()Ljava/util/List;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    .line 898
    .local v0, "candidate":Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    invoke-virtual {v0}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->removeCandidateEcho()V

    goto :goto_0

    .line 900
    .end local v0    # "candidate":Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    .end local v1    # "contentNegotiator":Lorg/jivesoftware/smackx/jingle/ContentNegotiator;
    .end local v3    # "i$":Ljava/util/Iterator;
    :cond_1
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/JingleSession;->getListenersList()Ljava/util/List;

    move-result-object v5

    .line 901
    .local v5, "listeners":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smackx/jingle/listeners/JingleListener;>;"
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_2
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/jivesoftware/smackx/jingle/listeners/JingleListener;

    .line 902
    .local v4, "li":Lorg/jivesoftware/smackx/jingle/listeners/JingleListener;
    instance-of v7, v4, Lorg/jivesoftware/smackx/jingle/listeners/JingleSessionListener;

    if-eqz v7, :cond_2

    move-object v6, v4

    .line 903
    check-cast v6, Lorg/jivesoftware/smackx/jingle/listeners/JingleSessionListener;

    .line 904
    .local v6, "sli":Lorg/jivesoftware/smackx/jingle/listeners/JingleSessionListener;
    invoke-interface {v6, p1, p0}, Lorg/jivesoftware/smackx/jingle/listeners/JingleSessionListener;->sessionClosedOnError(Lorg/jivesoftware/smack/XMPPException;Lorg/jivesoftware/smackx/jingle/JingleSession;)V

    goto :goto_1

    .line 907
    .end local v4    # "li":Lorg/jivesoftware/smackx/jingle/listeners/JingleListener;
    .end local v6    # "sli":Lorg/jivesoftware/smackx/jingle/listeners/JingleSessionListener;
    :cond_3
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/JingleSession;->close()V

    .line 908
    return-void
.end method

.method protected updatePacketListener()V
    .locals 3

    .prologue
    .line 673
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/JingleSession;->removePacketListener()V

    .line 675
    sget-object v0, Lorg/jivesoftware/smackx/jingle/JingleSession;->LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;

    const-string/jumbo v1, "UpdatePacketListener"

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smackx/jingle/SmackLogger;->debug(Ljava/lang/String;)V

    .line 677
    new-instance v0, Lorg/jivesoftware/smackx/jingle/JingleSession$2;

    invoke-direct {v0, p0}, Lorg/jivesoftware/smackx/jingle/JingleSession$2;-><init>(Lorg/jivesoftware/smackx/jingle/JingleSession;)V

    iput-object v0, p0, Lorg/jivesoftware/smackx/jingle/JingleSession;->packetListener:Lorg/jivesoftware/smack/PacketListener;

    .line 687
    new-instance v0, Lorg/jivesoftware/smackx/jingle/JingleSession$3;

    invoke-direct {v0, p0}, Lorg/jivesoftware/smackx/jingle/JingleSession$3;-><init>(Lorg/jivesoftware/smackx/jingle/JingleSession;)V

    iput-object v0, p0, Lorg/jivesoftware/smackx/jingle/JingleSession;->packetFilter:Lorg/jivesoftware/smack/filter/PacketFilter;

    .line 734
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/JingleSession;->getConnection()Lorg/jivesoftware/smack/Connection;

    move-result-object v0

    iget-object v1, p0, Lorg/jivesoftware/smackx/jingle/JingleSession;->packetListener:Lorg/jivesoftware/smack/PacketListener;

    iget-object v2, p0, Lorg/jivesoftware/smackx/jingle/JingleSession;->packetFilter:Lorg/jivesoftware/smack/filter/PacketFilter;

    invoke-virtual {v0, v1, v2}, Lorg/jivesoftware/smack/Connection;->addPacketListener(Lorg/jivesoftware/smack/PacketListener;Lorg/jivesoftware/smack/filter/PacketFilter;)V

    .line 735
    return-void
.end method
