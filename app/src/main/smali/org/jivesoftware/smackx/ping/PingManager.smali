.class public Lorg/jivesoftware/smackx/ping/PingManager;
.super Ljava/lang/Object;
.source "PingManager.java"


# static fields
.field private static instances:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lorg/jivesoftware/smack/Connection;",
            "Lorg/jivesoftware/smackx/ping/PingManager;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private connection:Lorg/jivesoftware/smack/Connection;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 58
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    sput-object v0, Lorg/jivesoftware/smackx/ping/PingManager;->instances:Ljava/util/Map;

    .line 62
    new-instance v0, Lorg/jivesoftware/smackx/ping/PingManager$1;

    invoke-direct {v0}, Lorg/jivesoftware/smackx/ping/PingManager$1;-><init>()V

    invoke-static {v0}, Lorg/jivesoftware/smack/Connection;->addConnectionCreationListener(Lorg/jivesoftware/smack/ConnectionCreationListener;)V

    .line 67
    return-void
.end method

.method private constructor <init>(Lorg/jivesoftware/smack/Connection;)V
    .locals 6
    .param p1, "con"    # Lorg/jivesoftware/smack/Connection;

    .prologue
    .line 88
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 89
    iput-object p1, p0, Lorg/jivesoftware/smackx/ping/PingManager;->connection:Lorg/jivesoftware/smack/Connection;

    .line 90
    iget-object v2, p0, Lorg/jivesoftware/smackx/ping/PingManager;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-static {v2}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->getInstanceFor(Lorg/jivesoftware/smack/Connection;)Lorg/jivesoftware/smackx/ServiceDiscoveryManager;

    move-result-object v1

    .line 93
    .local v1, "sdm":Lorg/jivesoftware/smackx/ServiceDiscoveryManager;
    if-nez v1, :cond_0

    .line 94
    new-instance v1, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;

    .end local v1    # "sdm":Lorg/jivesoftware/smackx/ServiceDiscoveryManager;
    iget-object v2, p0, Lorg/jivesoftware/smackx/ping/PingManager;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-direct {v1, v2}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;-><init>(Lorg/jivesoftware/smack/Connection;)V

    .line 96
    .restart local v1    # "sdm":Lorg/jivesoftware/smackx/ServiceDiscoveryManager;
    :cond_0
    const-string/jumbo v2, "urn:xmpp:ping"

    invoke-virtual {v1, v2}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->addFeature(Ljava/lang/String;)V

    .line 98
    new-instance v0, Lorg/jivesoftware/smack/filter/AndFilter;

    const/4 v2, 0x2

    new-array v2, v2, [Lorg/jivesoftware/smack/filter/PacketFilter;

    const/4 v3, 0x0

    new-instance v4, Lorg/jivesoftware/smack/filter/PacketTypeFilter;

    const-class v5, Lorg/jivesoftware/smack/ping/packet/Ping;

    invoke-direct {v4, v5}, Lorg/jivesoftware/smack/filter/PacketTypeFilter;-><init>(Ljava/lang/Class;)V

    aput-object v4, v2, v3

    const/4 v3, 0x1

    new-instance v4, Lorg/jivesoftware/smack/filter/IQTypeFilter;

    sget-object v5, Lorg/jivesoftware/smack/packet/IQ$Type;->GET:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-direct {v4, v5}, Lorg/jivesoftware/smack/filter/IQTypeFilter;-><init>(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    aput-object v4, v2, v3

    invoke-direct {v0, v2}, Lorg/jivesoftware/smack/filter/AndFilter;-><init>([Lorg/jivesoftware/smack/filter/PacketFilter;)V

    .line 100
    .local v0, "pingPacketFilter":Lorg/jivesoftware/smack/filter/PacketFilter;
    iget-object v2, p0, Lorg/jivesoftware/smackx/ping/PingManager;->connection:Lorg/jivesoftware/smack/Connection;

    new-instance v3, Lorg/jivesoftware/smackx/ping/PingManager$2;

    invoke-direct {v3, p0}, Lorg/jivesoftware/smackx/ping/PingManager$2;-><init>(Lorg/jivesoftware/smackx/ping/PingManager;)V

    invoke-virtual {v2, v3, v0}, Lorg/jivesoftware/smack/Connection;->addPacketListener(Lorg/jivesoftware/smack/PacketListener;Lorg/jivesoftware/smack/filter/PacketFilter;)V

    .line 109
    return-void
.end method

.method synthetic constructor <init>(Lorg/jivesoftware/smack/Connection;Lorg/jivesoftware/smackx/ping/PingManager$1;)V
    .locals 0
    .param p1, "x0"    # Lorg/jivesoftware/smack/Connection;
    .param p2, "x1"    # Lorg/jivesoftware/smackx/ping/PingManager$1;

    .prologue
    .line 57
    invoke-direct {p0, p1}, Lorg/jivesoftware/smackx/ping/PingManager;-><init>(Lorg/jivesoftware/smack/Connection;)V

    return-void
.end method

.method static synthetic access$100(Lorg/jivesoftware/smackx/ping/PingManager;)Lorg/jivesoftware/smack/Connection;
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smackx/ping/PingManager;

    .prologue
    .line 57
    iget-object v0, p0, Lorg/jivesoftware/smackx/ping/PingManager;->connection:Lorg/jivesoftware/smack/Connection;

    return-object v0
.end method

.method public static declared-synchronized getInstanceFor(Lorg/jivesoftware/smack/Connection;)Lorg/jivesoftware/smackx/ping/PingManager;
    .locals 3
    .param p0, "connection"    # Lorg/jivesoftware/smack/Connection;

    .prologue
    .line 80
    const-class v2, Lorg/jivesoftware/smackx/ping/PingManager;

    monitor-enter v2

    :try_start_0
    sget-object v1, Lorg/jivesoftware/smackx/ping/PingManager;->instances:Ljava/util/Map;

    invoke-interface {v1, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smackx/ping/PingManager;

    .line 82
    .local v0, "pingManager":Lorg/jivesoftware/smackx/ping/PingManager;
    if-nez v0, :cond_0

    .line 83
    new-instance v0, Lorg/jivesoftware/smackx/ping/PingManager;

    .end local v0    # "pingManager":Lorg/jivesoftware/smackx/ping/PingManager;
    invoke-direct {v0, p0}, Lorg/jivesoftware/smackx/ping/PingManager;-><init>(Lorg/jivesoftware/smack/Connection;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 85
    .restart local v0    # "pingManager":Lorg/jivesoftware/smackx/ping/PingManager;
    :cond_0
    monitor-exit v2

    return-object v0

    .line 80
    .end local v0    # "pingManager":Lorg/jivesoftware/smackx/ping/PingManager;
    :catchall_0
    move-exception v1

    monitor-exit v2

    throw v1
.end method


# virtual methods
.method public isPingSupported(Ljava/lang/String;)Z
    .locals 2
    .param p1, "jid"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 155
    iget-object v1, p0, Lorg/jivesoftware/smackx/ping/PingManager;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-static {v1}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->getInstanceFor(Lorg/jivesoftware/smack/Connection;)Lorg/jivesoftware/smackx/ServiceDiscoveryManager;

    move-result-object v1

    invoke-virtual {v1, p1}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->discoverInfo(Ljava/lang/String;)Lorg/jivesoftware/smackx/packet/DiscoverInfo;

    move-result-object v0

    .line 156
    .local v0, "result":Lorg/jivesoftware/smackx/packet/DiscoverInfo;
    const-string/jumbo v1, "urn:xmpp:ping"

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smackx/packet/DiscoverInfo;->containsFeature(Ljava/lang/String;)Z

    move-result v1

    return v1
.end method

.method public ping(Ljava/lang/String;)Z
    .locals 2
    .param p1, "jid"    # Ljava/lang/String;

    .prologue
    .line 144
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getPacketReplyTimeout()I

    move-result v0

    int-to-long v0, v0

    invoke-virtual {p0, p1, v0, v1}, Lorg/jivesoftware/smackx/ping/PingManager;->ping(Ljava/lang/String;J)Z

    move-result v0

    return v0
.end method

.method public ping(Ljava/lang/String;J)Z
    .locals 5
    .param p1, "jid"    # Ljava/lang/String;
    .param p2, "pingTimeout"    # J

    .prologue
    const/4 v2, 0x1

    .line 124
    new-instance v1, Lorg/jivesoftware/smack/ping/packet/Ping;

    invoke-direct {v1, p1}, Lorg/jivesoftware/smack/ping/packet/Ping;-><init>(Ljava/lang/String;)V

    .line 127
    .local v1, "ping":Lorg/jivesoftware/smack/ping/packet/Ping;
    :try_start_0
    iget-object v3, p0, Lorg/jivesoftware/smackx/ping/PingManager;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-static {v3, v1}, Lorg/jivesoftware/smack/util/SyncPacketSend;->getReply(Lorg/jivesoftware/smack/Connection;Lorg/jivesoftware/smack/packet/Packet;)Lorg/jivesoftware/smack/packet/Packet;
    :try_end_0
    .catch Lorg/jivesoftware/smack/XMPPException; {:try_start_0 .. :try_end_0} :catch_0

    .line 133
    :cond_0
    :goto_0
    return v2

    .line 129
    :catch_0
    move-exception v0

    .line 131
    .local v0, "exc":Lorg/jivesoftware/smack/XMPPException;
    iget-object v3, p0, Lorg/jivesoftware/smackx/ping/PingManager;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v3}, Lorg/jivesoftware/smack/Connection;->getServiceName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-virtual {v0}, Lorg/jivesoftware/smack/XMPPException;->getSmackError()Lorg/jivesoftware/smack/SmackError;

    move-result-object v3

    sget-object v4, Lorg/jivesoftware/smack/SmackError;->NO_RESPONSE_FROM_SERVER:Lorg/jivesoftware/smack/SmackError;

    if-ne v3, v4, :cond_0

    :cond_1
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public pingMyServer()Z
    .locals 1

    .prologue
    .line 169
    iget-object v0, p0, Lorg/jivesoftware/smackx/ping/PingManager;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v0}, Lorg/jivesoftware/smack/Connection;->getServiceName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/jivesoftware/smackx/ping/PingManager;->ping(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method
