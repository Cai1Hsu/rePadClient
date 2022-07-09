.class public Lorg/jivesoftware/smackx/ServiceDiscoveryManager;
.super Ljava/lang/Object;
.source "ServiceDiscoveryManager.java"


# static fields
.field private static final DEFAULT_IDENTITY_CATEGORY:Ljava/lang/String; = "client"

.field private static final DEFAULT_IDENTITY_NAME:Ljava/lang/String; = "Smack"

.field private static final DEFAULT_IDENTITY_TYPE:Ljava/lang/String; = "pc"

.field private static identities:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;",
            ">;"
        }
    .end annotation
.end field

.field private static instances:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lorg/jivesoftware/smack/Connection;",
            "Lorg/jivesoftware/smackx/ServiceDiscoveryManager;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private capsManager:Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;

.field private connection:Lorg/jivesoftware/smack/Connection;

.field private extendedInfo:Lorg/jivesoftware/smackx/packet/DataForm;

.field private final features:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private nodeInformationProviders:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/jivesoftware/smackx/NodeInformationProvider;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    .line 57
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    sput-object v0, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->identities:Ljava/util/List;

    .line 61
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    sput-object v0, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->instances:Ljava/util/Map;

    .line 72
    new-instance v0, Lorg/jivesoftware/smackx/ServiceDiscoveryManager$1;

    invoke-direct {v0}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager$1;-><init>()V

    invoke-static {v0}, Lorg/jivesoftware/smack/Connection;->addConnectionCreationListener(Lorg/jivesoftware/smack/ConnectionCreationListener;)V

    .line 77
    sget-object v0, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->identities:Ljava/util/List;

    new-instance v1, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;

    const-string/jumbo v2, "client"

    const-string/jumbo v3, "Smack"

    const-string/jumbo v4, "pc"

    invoke-direct {v1, v2, v3, v4}, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 78
    return-void
.end method

.method public constructor <init>(Lorg/jivesoftware/smack/Connection;)V
    .locals 1
    .param p1, "connection"    # Lorg/jivesoftware/smack/Connection;

    .prologue
    .line 87
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 65
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->features:Ljava/util/Set;

    .line 66
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->extendedInfo:Lorg/jivesoftware/smackx/packet/DataForm;

    .line 67
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->nodeInformationProviders:Ljava/util/Map;

    .line 88
    iput-object p1, p0, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->connection:Lorg/jivesoftware/smack/Connection;

    .line 90
    invoke-direct {p0}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->init()V

    .line 91
    return-void
.end method

.method static synthetic access$000(Lorg/jivesoftware/smackx/ServiceDiscoveryManager;)Lorg/jivesoftware/smack/Connection;
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smackx/ServiceDiscoveryManager;

    .prologue
    .line 51
    iget-object v0, p0, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->connection:Lorg/jivesoftware/smack/Connection;

    return-object v0
.end method

.method static synthetic access$100()Ljava/util/Map;
    .locals 1

    .prologue
    .line 51
    sget-object v0, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->instances:Ljava/util/Map;

    return-object v0
.end method

.method static synthetic access$200(Lorg/jivesoftware/smackx/ServiceDiscoveryManager;Ljava/lang/String;)Lorg/jivesoftware/smackx/NodeInformationProvider;
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smackx/ServiceDiscoveryManager;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 51
    invoke-direct {p0, p1}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->getNodeInformationProvider(Ljava/lang/String;)Lorg/jivesoftware/smackx/NodeInformationProvider;

    move-result-object v0

    return-object v0
.end method

.method public static canPublishItems(Lorg/jivesoftware/smackx/packet/DiscoverInfo;)Z
    .locals 1
    .param p0, "info"    # Lorg/jivesoftware/smackx/packet/DiscoverInfo;

    .prologue
    .line 634
    const-string/jumbo v0, "http://jabber.org/protocol/disco#publish"

    invoke-virtual {p0, v0}, Lorg/jivesoftware/smackx/packet/DiscoverInfo;->containsFeature(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static getIdentities()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;",
            ">;"
        }
    .end annotation

    .prologue
    .line 173
    sget-object v0, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->identities:Ljava/util/List;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public static getIdentityName()Ljava/lang/String;
    .locals 3

    .prologue
    .line 111
    sget-object v1, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->identities:Ljava/util/List;

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;

    .line 112
    .local v0, "identity":Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;
    if-eqz v0, :cond_0

    .line 113
    invoke-virtual {v0}, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;->getName()Ljava/lang/String;

    move-result-object v1

    .line 115
    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static getIdentityType()Ljava/lang/String;
    .locals 3

    .prologue
    .line 141
    sget-object v1, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->identities:Ljava/util/List;

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;

    .line 142
    .local v0, "identity":Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;
    if-eqz v0, :cond_0

    .line 143
    invoke-virtual {v0}, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;->getType()Ljava/lang/String;

    move-result-object v1

    .line 145
    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static getInstanceFor(Lorg/jivesoftware/smack/Connection;)Lorg/jivesoftware/smackx/ServiceDiscoveryManager;
    .locals 1
    .param p0, "connection"    # Lorg/jivesoftware/smack/Connection;

    .prologue
    .line 100
    sget-object v0, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->instances:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;

    return-object v0
.end method

.method private getNodeInformationProvider(Ljava/lang/String;)Lorg/jivesoftware/smackx/NodeInformationProvider;
    .locals 1
    .param p1, "node"    # Ljava/lang/String;

    .prologue
    .line 324
    if-nez p1, :cond_0

    .line 325
    const/4 v0, 0x0

    .line 327
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->nodeInformationProviders:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smackx/NodeInformationProvider;

    goto :goto_0
.end method

.method private init()V
    .locals 4

    .prologue
    .line 182
    sget-object v2, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->instances:Ljava/util/Map;

    iget-object v3, p0, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-interface {v2, v3, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 184
    const-string/jumbo v2, "http://jabber.org/protocol/disco#info"

    invoke-virtual {p0, v2}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->addFeature(Ljava/lang/String;)V

    .line 185
    const-string/jumbo v2, "http://jabber.org/protocol/disco#items"

    invoke-virtual {p0, v2}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->addFeature(Ljava/lang/String;)V

    .line 189
    iget-object v2, p0, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->connection:Lorg/jivesoftware/smack/Connection;

    new-instance v3, Lorg/jivesoftware/smackx/ServiceDiscoveryManager$2;

    invoke-direct {v3, p0}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager$2;-><init>(Lorg/jivesoftware/smackx/ServiceDiscoveryManager;)V

    invoke-virtual {v2, v3}, Lorg/jivesoftware/smack/Connection;->addConnectionListener(Lorg/jivesoftware/smack/ConnectionListener;)V

    .line 213
    new-instance v0, Lorg/jivesoftware/smack/filter/PacketTypeFilter;

    const-class v2, Lorg/jivesoftware/smackx/packet/DiscoverItems;

    invoke-direct {v0, v2}, Lorg/jivesoftware/smack/filter/PacketTypeFilter;-><init>(Ljava/lang/Class;)V

    .line 214
    .local v0, "packetFilter":Lorg/jivesoftware/smack/filter/PacketFilter;
    new-instance v1, Lorg/jivesoftware/smackx/ServiceDiscoveryManager$3;

    invoke-direct {v1, p0}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager$3;-><init>(Lorg/jivesoftware/smackx/ServiceDiscoveryManager;)V

    .line 244
    .local v1, "packetListener":Lorg/jivesoftware/smack/PacketListener;
    iget-object v2, p0, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v2, v1, v0}, Lorg/jivesoftware/smack/Connection;->addPacketListener(Lorg/jivesoftware/smack/PacketListener;Lorg/jivesoftware/smack/filter/PacketFilter;)V

    .line 248
    new-instance v0, Lorg/jivesoftware/smack/filter/PacketTypeFilter;

    .end local v0    # "packetFilter":Lorg/jivesoftware/smack/filter/PacketFilter;
    const-class v2, Lorg/jivesoftware/smackx/packet/DiscoverInfo;

    invoke-direct {v0, v2}, Lorg/jivesoftware/smack/filter/PacketTypeFilter;-><init>(Ljava/lang/Class;)V

    .line 249
    .restart local v0    # "packetFilter":Lorg/jivesoftware/smack/filter/PacketFilter;
    new-instance v1, Lorg/jivesoftware/smackx/ServiceDiscoveryManager$4;

    .end local v1    # "packetListener":Lorg/jivesoftware/smack/PacketListener;
    invoke-direct {v1, p0}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager$4;-><init>(Lorg/jivesoftware/smackx/ServiceDiscoveryManager;)V

    .line 289
    .restart local v1    # "packetListener":Lorg/jivesoftware/smack/PacketListener;
    iget-object v2, p0, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v2, v1, v0}, Lorg/jivesoftware/smack/Connection;->addPacketListener(Lorg/jivesoftware/smack/PacketListener;Lorg/jivesoftware/smack/filter/PacketFilter;)V

    .line 290
    return-void
.end method

.method private renewEntityCapsVersion()V
    .locals 1

    .prologue
    .line 705
    iget-object v0, p0, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->capsManager:Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->capsManager:Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;->entityCapsEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 706
    iget-object v0, p0, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->capsManager:Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;->updateLocalEntityCaps()V

    .line 707
    :cond_0
    return-void
.end method

.method public static setIdentityName(Ljava/lang/String;)V
    .locals 3
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 127
    sget-object v1, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->identities:Ljava/util/List;

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;

    .line 128
    .local v0, "identity":Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;
    new-instance v0, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;

    .end local v0    # "identity":Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;
    const-string/jumbo v1, "client"

    const-string/jumbo v2, "pc"

    invoke-direct {v0, v1, p0, v2}, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 129
    .restart local v0    # "identity":Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;
    sget-object v1, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->identities:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 130
    return-void
.end method

.method public static setIdentityType(Ljava/lang/String;)V
    .locals 3
    .param p0, "type"    # Ljava/lang/String;

    .prologue
    .line 158
    sget-object v1, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->identities:Ljava/util/List;

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;

    .line 159
    .local v0, "identity":Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;
    if-eqz v0, :cond_0

    .line 160
    invoke-virtual {v0, p0}, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;->setType(Ljava/lang/String;)V

    .line 165
    :goto_0
    return-void

    .line 162
    :cond_0
    new-instance v0, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;

    .end local v0    # "identity":Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;
    const-string/jumbo v1, "client"

    const-string/jumbo v2, "Smack"

    invoke-direct {v0, v1, v2, p0}, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 163
    .restart local v0    # "identity":Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;
    sget-object v1, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->identities:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method


# virtual methods
.method public addDiscoverInfoTo(Lorg/jivesoftware/smackx/packet/DiscoverInfo;)V
    .locals 3
    .param p1, "response"    # Lorg/jivesoftware/smackx/packet/DiscoverInfo;

    .prologue
    .line 301
    sget-object v1, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->identities:Ljava/util/List;

    invoke-virtual {p1, v1}, Lorg/jivesoftware/smackx/packet/DiscoverInfo;->addIdentities(Ljava/util/Collection;)V

    .line 304
    iget-object v2, p0, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->features:Ljava/util/Set;

    monitor-enter v2

    .line 305
    :try_start_0
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->getFeatures()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 306
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {p1, v1}, Lorg/jivesoftware/smackx/packet/DiscoverInfo;->addFeature(Ljava/lang/String;)V

    goto :goto_0

    .line 309
    .end local v0    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 308
    .restart local v0    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_0
    :try_start_1
    iget-object v1, p0, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->extendedInfo:Lorg/jivesoftware/smackx/packet/DataForm;

    invoke-virtual {p1, v1}, Lorg/jivesoftware/smackx/packet/DiscoverInfo;->addExtension(Lorg/jivesoftware/smack/packet/PacketExtension;)V

    .line 309
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 310
    return-void
.end method

.method public addFeature(Ljava/lang/String;)V
    .locals 2
    .param p1, "feature"    # Ljava/lang/String;

    .prologue
    .line 395
    iget-object v1, p0, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->features:Ljava/util/Set;

    monitor-enter v1

    .line 396
    :try_start_0
    iget-object v0, p0, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->features:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 397
    invoke-direct {p0}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->renewEntityCapsVersion()V

    .line 398
    monitor-exit v1

    .line 399
    return-void

    .line 398
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public canPublishItems(Ljava/lang/String;)Z
    .locals 2
    .param p1, "entityID"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 620
    invoke-virtual {p0, p1}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->discoverInfo(Ljava/lang/String;)Lorg/jivesoftware/smackx/packet/DiscoverInfo;

    move-result-object v0

    .line 621
    .local v0, "info":Lorg/jivesoftware/smackx/packet/DiscoverInfo;
    invoke-static {v0}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->canPublishItems(Lorg/jivesoftware/smackx/packet/DiscoverInfo;)Z

    move-result v1

    return v1
.end method

.method public discoverInfo(Ljava/lang/String;)Lorg/jivesoftware/smackx/packet/DiscoverInfo;
    .locals 4
    .param p1, "entityID"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 494
    if-nez p1, :cond_1

    .line 495
    invoke-virtual {p0, v2, v2}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->discoverInfo(Ljava/lang/String;Ljava/lang/String;)Lorg/jivesoftware/smackx/packet/DiscoverInfo;

    move-result-object v0

    .line 520
    :cond_0
    :goto_0
    return-object v0

    .line 498
    :cond_1
    invoke-static {p1}, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;->getDiscoverInfoByUser(Ljava/lang/String;)Lorg/jivesoftware/smackx/packet/DiscoverInfo;

    move-result-object v0

    .line 500
    .local v0, "info":Lorg/jivesoftware/smackx/packet/DiscoverInfo;
    if-nez v0, :cond_0

    .line 508
    invoke-static {p1}, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;->getNodeVerHashByJid(Ljava/lang/String;)Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager$NodeVerHash;

    move-result-object v1

    .line 512
    .local v1, "nvh":Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager$NodeVerHash;
    if-eqz v1, :cond_2

    invoke-virtual {v1}, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager$NodeVerHash;->getNodeVer()Ljava/lang/String;

    move-result-object v2

    :cond_2
    invoke-virtual {p0, p1, v2}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->discoverInfo(Ljava/lang/String;Ljava/lang/String;)Lorg/jivesoftware/smackx/packet/DiscoverInfo;

    move-result-object v0

    .line 515
    if-eqz v1, :cond_0

    .line 516
    invoke-virtual {v1}, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager$NodeVerHash;->getVer()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1}, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager$NodeVerHash;->getHash()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v0}, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;->verifyDiscoverInfoVersion(Ljava/lang/String;Ljava/lang/String;Lorg/jivesoftware/smackx/packet/DiscoverInfo;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 517
    invoke-virtual {v1}, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager$NodeVerHash;->getNodeVer()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, v0}, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;->addDiscoverInfoByNode(Ljava/lang/String;Lorg/jivesoftware/smackx/packet/DiscoverInfo;)V

    goto :goto_0
.end method

.method public discoverInfo(Ljava/lang/String;Ljava/lang/String;)Lorg/jivesoftware/smackx/packet/DiscoverInfo;
    .locals 6
    .param p1, "entityID"    # Ljava/lang/String;
    .param p2, "node"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 538
    new-instance v1, Lorg/jivesoftware/smackx/packet/DiscoverInfo;

    invoke-direct {v1}, Lorg/jivesoftware/smackx/packet/DiscoverInfo;-><init>()V

    .line 539
    .local v1, "disco":Lorg/jivesoftware/smackx/packet/DiscoverInfo;
    sget-object v3, Lorg/jivesoftware/smack/packet/IQ$Type;->GET:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {v1, v3}, Lorg/jivesoftware/smackx/packet/DiscoverInfo;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 540
    invoke-virtual {v1, p1}, Lorg/jivesoftware/smackx/packet/DiscoverInfo;->setTo(Ljava/lang/String;)V

    .line 541
    invoke-virtual {v1, p2}, Lorg/jivesoftware/smackx/packet/DiscoverInfo;->setNode(Ljava/lang/String;)V

    .line 544
    iget-object v3, p0, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->connection:Lorg/jivesoftware/smack/Connection;

    new-instance v4, Lorg/jivesoftware/smack/filter/PacketIDFilter;

    invoke-virtual {v1}, Lorg/jivesoftware/smackx/packet/DiscoverInfo;->getPacketID()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/jivesoftware/smack/filter/PacketIDFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v4}, Lorg/jivesoftware/smack/Connection;->createPacketCollector(Lorg/jivesoftware/smack/filter/PacketFilter;)Lorg/jivesoftware/smack/PacketCollector;

    move-result-object v0

    .line 547
    .local v0, "collector":Lorg/jivesoftware/smack/PacketCollector;
    iget-object v3, p0, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v3, v1}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 550
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getPacketReplyTimeout()I

    move-result v3

    int-to-long v4, v3

    invoke-virtual {v0, v4, v5}, Lorg/jivesoftware/smack/PacketCollector;->nextResult(J)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v2

    check-cast v2, Lorg/jivesoftware/smack/packet/IQ;

    .line 552
    .local v2, "result":Lorg/jivesoftware/smack/packet/IQ;
    invoke-virtual {v0}, Lorg/jivesoftware/smack/PacketCollector;->cancel()V

    .line 553
    if-nez v2, :cond_0

    .line 554
    new-instance v3, Lorg/jivesoftware/smack/XMPPException;

    const-string/jumbo v4, "No response from the server."

    invoke-direct {v3, v4}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 556
    :cond_0
    invoke-virtual {v2}, Lorg/jivesoftware/smack/packet/IQ;->getType()Lorg/jivesoftware/smack/packet/IQ$Type;

    move-result-object v3

    sget-object v4, Lorg/jivesoftware/smack/packet/IQ$Type;->ERROR:Lorg/jivesoftware/smack/packet/IQ$Type;

    if-ne v3, v4, :cond_1

    .line 557
    new-instance v3, Lorg/jivesoftware/smack/XMPPException;

    invoke-virtual {v2}, Lorg/jivesoftware/smack/packet/IQ;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/jivesoftware/smack/XMPPException;-><init>(Lorg/jivesoftware/smack/packet/XMPPError;)V

    throw v3

    .line 559
    :cond_1
    check-cast v2, Lorg/jivesoftware/smackx/packet/DiscoverInfo;

    .end local v2    # "result":Lorg/jivesoftware/smack/packet/IQ;
    return-object v2
.end method

.method public discoverItems(Ljava/lang/String;)Lorg/jivesoftware/smackx/packet/DiscoverItems;
    .locals 1
    .param p1, "entityID"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 570
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->discoverItems(Ljava/lang/String;Ljava/lang/String;)Lorg/jivesoftware/smackx/packet/DiscoverItems;

    move-result-object v0

    return-object v0
.end method

.method public discoverItems(Ljava/lang/String;Ljava/lang/String;)Lorg/jivesoftware/smackx/packet/DiscoverItems;
    .locals 6
    .param p1, "entityID"    # Ljava/lang/String;
    .param p2, "node"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 585
    new-instance v1, Lorg/jivesoftware/smackx/packet/DiscoverItems;

    invoke-direct {v1}, Lorg/jivesoftware/smackx/packet/DiscoverItems;-><init>()V

    .line 586
    .local v1, "disco":Lorg/jivesoftware/smackx/packet/DiscoverItems;
    sget-object v3, Lorg/jivesoftware/smack/packet/IQ$Type;->GET:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {v1, v3}, Lorg/jivesoftware/smackx/packet/DiscoverItems;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 587
    invoke-virtual {v1, p1}, Lorg/jivesoftware/smackx/packet/DiscoverItems;->setTo(Ljava/lang/String;)V

    .line 588
    invoke-virtual {v1, p2}, Lorg/jivesoftware/smackx/packet/DiscoverItems;->setNode(Ljava/lang/String;)V

    .line 591
    iget-object v3, p0, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->connection:Lorg/jivesoftware/smack/Connection;

    new-instance v4, Lorg/jivesoftware/smack/filter/PacketIDFilter;

    invoke-virtual {v1}, Lorg/jivesoftware/smackx/packet/DiscoverItems;->getPacketID()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/jivesoftware/smack/filter/PacketIDFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v4}, Lorg/jivesoftware/smack/Connection;->createPacketCollector(Lorg/jivesoftware/smack/filter/PacketFilter;)Lorg/jivesoftware/smack/PacketCollector;

    move-result-object v0

    .line 594
    .local v0, "collector":Lorg/jivesoftware/smack/PacketCollector;
    iget-object v3, p0, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v3, v1}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 597
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getPacketReplyTimeout()I

    move-result v3

    int-to-long v4, v3

    invoke-virtual {v0, v4, v5}, Lorg/jivesoftware/smack/PacketCollector;->nextResult(J)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v2

    check-cast v2, Lorg/jivesoftware/smack/packet/IQ;

    .line 599
    .local v2, "result":Lorg/jivesoftware/smack/packet/IQ;
    invoke-virtual {v0}, Lorg/jivesoftware/smack/PacketCollector;->cancel()V

    .line 600
    if-nez v2, :cond_0

    .line 601
    new-instance v3, Lorg/jivesoftware/smack/XMPPException;

    const-string/jumbo v4, "No response from the server."

    invoke-direct {v3, v4}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 603
    :cond_0
    invoke-virtual {v2}, Lorg/jivesoftware/smack/packet/IQ;->getType()Lorg/jivesoftware/smack/packet/IQ$Type;

    move-result-object v3

    sget-object v4, Lorg/jivesoftware/smack/packet/IQ$Type;->ERROR:Lorg/jivesoftware/smack/packet/IQ$Type;

    if-ne v3, v4, :cond_1

    .line 604
    new-instance v3, Lorg/jivesoftware/smack/XMPPException;

    invoke-virtual {v2}, Lorg/jivesoftware/smack/packet/IQ;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/jivesoftware/smack/XMPPException;-><init>(Lorg/jivesoftware/smack/packet/XMPPError;)V

    throw v3

    .line 606
    :cond_1
    check-cast v2, Lorg/jivesoftware/smackx/packet/DiscoverItems;

    .end local v2    # "result":Lorg/jivesoftware/smack/packet/IQ;
    return-object v2
.end method

.method public getExtendedInfo()Lorg/jivesoftware/smackx/packet/DataForm;
    .locals 1

    .prologue
    .line 455
    iget-object v0, p0, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->extendedInfo:Lorg/jivesoftware/smackx/packet/DataForm;

    return-object v0
.end method

.method public getExtendedInfoAsList()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smack/packet/PacketExtension;",
            ">;"
        }
    .end annotation

    .prologue
    .line 465
    const/4 v0, 0x0

    .line 466
    .local v0, "res":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smack/packet/PacketExtension;>;"
    iget-object v1, p0, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->extendedInfo:Lorg/jivesoftware/smackx/packet/DataForm;

    if-eqz v1, :cond_0

    .line 467
    new-instance v0, Ljava/util/ArrayList;

    .end local v0    # "res":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smack/packet/PacketExtension;>;"
    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 468
    .restart local v0    # "res":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smack/packet/PacketExtension;>;"
    iget-object v1, p0, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->extendedInfo:Lorg/jivesoftware/smackx/packet/DataForm;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 470
    :cond_0
    return-object v0
.end method

.method public getFeatures()Ljava/util/Iterator;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 367
    iget-object v1, p0, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->features:Ljava/util/Set;

    monitor-enter v1

    .line 368
    :try_start_0
    new-instance v0, Ljava/util/ArrayList;

    iget-object v2, p0, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->features:Ljava/util/Set;

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    monitor-exit v1

    return-object v0

    .line 369
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public getFeaturesList()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 378
    iget-object v1, p0, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->features:Ljava/util/Set;

    monitor-enter v1

    .line 379
    :try_start_0
    new-instance v0, Ljava/util/LinkedList;

    iget-object v2, p0, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->features:Ljava/util/Set;

    invoke-direct {v0, v2}, Ljava/util/LinkedList;-><init>(Ljava/util/Collection;)V

    monitor-exit v1

    return-object v0

    .line 380
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public includesFeature(Ljava/lang/String;)Z
    .locals 2
    .param p1, "feature"    # Ljava/lang/String;

    .prologue
    .line 423
    iget-object v1, p0, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->features:Ljava/util/Set;

    monitor-enter v1

    .line 424
    :try_start_0
    iget-object v0, p0, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->features:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    monitor-exit v1

    return v0

    .line 425
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public publishItems(Ljava/lang/String;Ljava/lang/String;Lorg/jivesoftware/smackx/packet/DiscoverItems;)V
    .locals 5
    .param p1, "entityID"    # Ljava/lang/String;
    .param p2, "node"    # Ljava/lang/String;
    .param p3, "discoverItems"    # Lorg/jivesoftware/smackx/packet/DiscoverItems;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 665
    sget-object v2, Lorg/jivesoftware/smack/packet/IQ$Type;->SET:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {p3, v2}, Lorg/jivesoftware/smackx/packet/DiscoverItems;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 666
    invoke-virtual {p3, p1}, Lorg/jivesoftware/smackx/packet/DiscoverItems;->setTo(Ljava/lang/String;)V

    .line 667
    invoke-virtual {p3, p2}, Lorg/jivesoftware/smackx/packet/DiscoverItems;->setNode(Ljava/lang/String;)V

    .line 670
    iget-object v2, p0, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->connection:Lorg/jivesoftware/smack/Connection;

    new-instance v3, Lorg/jivesoftware/smack/filter/PacketIDFilter;

    invoke-virtual {p3}, Lorg/jivesoftware/smackx/packet/DiscoverItems;->getPacketID()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/jivesoftware/smack/filter/PacketIDFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Lorg/jivesoftware/smack/Connection;->createPacketCollector(Lorg/jivesoftware/smack/filter/PacketFilter;)Lorg/jivesoftware/smack/PacketCollector;

    move-result-object v0

    .line 673
    .local v0, "collector":Lorg/jivesoftware/smack/PacketCollector;
    iget-object v2, p0, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v2, p3}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 676
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getPacketReplyTimeout()I

    move-result v2

    int-to-long v2, v2

    invoke-virtual {v0, v2, v3}, Lorg/jivesoftware/smack/PacketCollector;->nextResult(J)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v1

    check-cast v1, Lorg/jivesoftware/smack/packet/IQ;

    .line 678
    .local v1, "result":Lorg/jivesoftware/smack/packet/IQ;
    invoke-virtual {v0}, Lorg/jivesoftware/smack/PacketCollector;->cancel()V

    .line 679
    if-nez v1, :cond_0

    .line 680
    new-instance v2, Lorg/jivesoftware/smack/XMPPException;

    const-string/jumbo v3, "No response from the server."

    invoke-direct {v2, v3}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 682
    :cond_0
    invoke-virtual {v1}, Lorg/jivesoftware/smack/packet/IQ;->getType()Lorg/jivesoftware/smack/packet/IQ$Type;

    move-result-object v2

    sget-object v3, Lorg/jivesoftware/smack/packet/IQ$Type;->ERROR:Lorg/jivesoftware/smack/packet/IQ$Type;

    if-ne v2, v3, :cond_1

    .line 683
    new-instance v2, Lorg/jivesoftware/smack/XMPPException;

    invoke-virtual {v1}, Lorg/jivesoftware/smack/packet/IQ;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/jivesoftware/smack/XMPPException;-><init>(Lorg/jivesoftware/smack/packet/XMPPError;)V

    throw v2

    .line 685
    :cond_1
    return-void
.end method

.method public publishItems(Ljava/lang/String;Lorg/jivesoftware/smackx/packet/DiscoverItems;)V
    .locals 1
    .param p1, "entityID"    # Ljava/lang/String;
    .param p2, "discoverItems"    # Lorg/jivesoftware/smackx/packet/DiscoverItems;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 649
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0, p2}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->publishItems(Ljava/lang/String;Ljava/lang/String;Lorg/jivesoftware/smackx/packet/DiscoverItems;)V

    .line 650
    return-void
.end method

.method public removeExtendedInfo()V
    .locals 1

    .prologue
    .line 481
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->extendedInfo:Lorg/jivesoftware/smackx/packet/DataForm;

    .line 482
    invoke-direct {p0}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->renewEntityCapsVersion()V

    .line 483
    return-void
.end method

.method public removeFeature(Ljava/lang/String;)V
    .locals 2
    .param p1, "feature"    # Ljava/lang/String;

    .prologue
    .line 410
    iget-object v1, p0, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->features:Ljava/util/Set;

    monitor-enter v1

    .line 411
    :try_start_0
    iget-object v0, p0, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->features:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 412
    invoke-direct {p0}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->renewEntityCapsVersion()V

    .line 413
    monitor-exit v1

    .line 414
    return-void

    .line 413
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public removeNodeInformationProvider(Ljava/lang/String;)V
    .locals 1
    .param p1, "node"    # Ljava/lang/String;

    .prologue
    .line 358
    iget-object v0, p0, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->nodeInformationProviders:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 359
    return-void
.end method

.method public setEntityCapsManager(Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;)V
    .locals 0
    .param p1, "manager"    # Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;

    .prologue
    .line 697
    iput-object p1, p0, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->capsManager:Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;

    .line 698
    return-void
.end method

.method public setExtendedInfo(Lorg/jivesoftware/smackx/packet/DataForm;)V
    .locals 0
    .param p1, "info"    # Lorg/jivesoftware/smackx/packet/DataForm;

    .prologue
    .line 444
    iput-object p1, p0, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->extendedInfo:Lorg/jivesoftware/smackx/packet/DataForm;

    .line 445
    invoke-direct {p0}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->renewEntityCapsVersion()V

    .line 446
    return-void
.end method

.method public setNodeInformationProvider(Ljava/lang/String;Lorg/jivesoftware/smackx/NodeInformationProvider;)V
    .locals 1
    .param p1, "node"    # Ljava/lang/String;
    .param p2, "listener"    # Lorg/jivesoftware/smackx/NodeInformationProvider;

    .prologue
    .line 344
    iget-object v0, p0, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->nodeInformationProviders:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 345
    return-void
.end method
