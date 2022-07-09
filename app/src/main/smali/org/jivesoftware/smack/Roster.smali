.class public Lorg/jivesoftware/smack/Roster;
.super Ljava/lang/Object;
.source "Roster.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jivesoftware/smack/Roster$RosterPacketListener;,
        Lorg/jivesoftware/smack/Roster$PresencePacketListener;,
        Lorg/jivesoftware/smack/Roster$SubscriptionMode;
    }
.end annotation


# static fields
.field private static defaultSubscriptionMode:Lorg/jivesoftware/smack/Roster$SubscriptionMode;


# instance fields
.field private connection:Lorg/jivesoftware/smack/Connection;

.field private final entries:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/jivesoftware/smack/RosterEntry;",
            ">;"
        }
    .end annotation
.end field

.field private final groups:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/jivesoftware/smack/RosterGroup;",
            ">;"
        }
    .end annotation
.end field

.field private presenceMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/jivesoftware/smack/packet/Presence;",
            ">;>;"
        }
    .end annotation
.end field

.field private presencePacketListener:Lorg/jivesoftware/smack/Roster$PresencePacketListener;

.field rosterInitialized:Z

.field private final rosterListeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smack/RosterListener;",
            ">;"
        }
    .end annotation
.end field

.field private subscriptionMode:Lorg/jivesoftware/smack/Roster$SubscriptionMode;

.field private final unfiledEntries:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smack/RosterEntry;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 56
    sget-object v0, Lorg/jivesoftware/smack/Roster$SubscriptionMode;->accept_all:Lorg/jivesoftware/smack/Roster$SubscriptionMode;

    sput-object v0, Lorg/jivesoftware/smack/Roster;->defaultSubscriptionMode:Lorg/jivesoftware/smack/Roster$SubscriptionMode;

    return-void
.end method

.method constructor <init>(Lorg/jivesoftware/smack/Connection;)V
    .locals 5
    .param p1, "connection"    # Lorg/jivesoftware/smack/Connection;

    .prologue
    const/4 v4, 0x0

    .line 100
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 66
    const/4 v3, 0x0

    iput-boolean v3, p0, Lorg/jivesoftware/smack/Roster;->rosterInitialized:Z

    .line 69
    invoke-static {}, Lorg/jivesoftware/smack/Roster;->getDefaultSubscriptionMode()Lorg/jivesoftware/smack/Roster$SubscriptionMode;

    move-result-object v3

    iput-object v3, p0, Lorg/jivesoftware/smack/Roster;->subscriptionMode:Lorg/jivesoftware/smack/Roster$SubscriptionMode;

    .line 101
    iput-object p1, p0, Lorg/jivesoftware/smack/Roster;->connection:Lorg/jivesoftware/smack/Connection;

    .line 102
    new-instance v3, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v3}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v3, p0, Lorg/jivesoftware/smack/Roster;->groups:Ljava/util/Map;

    .line 103
    new-instance v3, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-direct {v3}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    iput-object v3, p0, Lorg/jivesoftware/smack/Roster;->unfiledEntries:Ljava/util/List;

    .line 104
    new-instance v3, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v3}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v3, p0, Lorg/jivesoftware/smack/Roster;->entries:Ljava/util/Map;

    .line 105
    new-instance v3, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-direct {v3}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    iput-object v3, p0, Lorg/jivesoftware/smack/Roster;->rosterListeners:Ljava/util/List;

    .line 106
    new-instance v3, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v3}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v3, p0, Lorg/jivesoftware/smack/Roster;->presenceMap:Ljava/util/Map;

    .line 108
    new-instance v2, Lorg/jivesoftware/smack/filter/PacketTypeFilter;

    const-class v3, Lorg/jivesoftware/smack/packet/RosterPacket;

    invoke-direct {v2, v3}, Lorg/jivesoftware/smack/filter/PacketTypeFilter;-><init>(Ljava/lang/Class;)V

    .line 109
    .local v2, "rosterFilter":Lorg/jivesoftware/smack/filter/PacketFilter;
    new-instance v3, Lorg/jivesoftware/smack/Roster$RosterPacketListener;

    invoke-direct {v3, p0, v4}, Lorg/jivesoftware/smack/Roster$RosterPacketListener;-><init>(Lorg/jivesoftware/smack/Roster;Lorg/jivesoftware/smack/Roster$1;)V

    invoke-virtual {p1, v3, v2}, Lorg/jivesoftware/smack/Connection;->addPacketListener(Lorg/jivesoftware/smack/PacketListener;Lorg/jivesoftware/smack/filter/PacketFilter;)V

    .line 111
    new-instance v1, Lorg/jivesoftware/smack/filter/PacketTypeFilter;

    const-class v3, Lorg/jivesoftware/smack/packet/Presence;

    invoke-direct {v1, v3}, Lorg/jivesoftware/smack/filter/PacketTypeFilter;-><init>(Ljava/lang/Class;)V

    .line 112
    .local v1, "presenceFilter":Lorg/jivesoftware/smack/filter/PacketFilter;
    new-instance v3, Lorg/jivesoftware/smack/Roster$PresencePacketListener;

    invoke-direct {v3, p0, v4}, Lorg/jivesoftware/smack/Roster$PresencePacketListener;-><init>(Lorg/jivesoftware/smack/Roster;Lorg/jivesoftware/smack/Roster$1;)V

    iput-object v3, p0, Lorg/jivesoftware/smack/Roster;->presencePacketListener:Lorg/jivesoftware/smack/Roster$PresencePacketListener;

    .line 113
    iget-object v3, p0, Lorg/jivesoftware/smack/Roster;->presencePacketListener:Lorg/jivesoftware/smack/Roster$PresencePacketListener;

    invoke-virtual {p1, v3, v1}, Lorg/jivesoftware/smack/Connection;->addPacketListener(Lorg/jivesoftware/smack/PacketListener;Lorg/jivesoftware/smack/filter/PacketFilter;)V

    .line 116
    new-instance v0, Lorg/jivesoftware/smack/Roster$1;

    invoke-direct {v0, p0}, Lorg/jivesoftware/smack/Roster$1;-><init>(Lorg/jivesoftware/smack/Roster;)V

    .line 131
    .local v0, "connectionListener":Lorg/jivesoftware/smack/ConnectionListener;
    iget-object v3, p0, Lorg/jivesoftware/smack/Roster;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v3}, Lorg/jivesoftware/smack/Connection;->isConnected()Z

    move-result v3

    if-nez v3, :cond_0

    .line 132
    new-instance v3, Lorg/jivesoftware/smack/Roster$2;

    invoke-direct {v3, p0, v0}, Lorg/jivesoftware/smack/Roster$2;-><init>(Lorg/jivesoftware/smack/Roster;Lorg/jivesoftware/smack/ConnectionListener;)V

    invoke-static {v3}, Lorg/jivesoftware/smack/Connection;->addConnectionCreationListener(Lorg/jivesoftware/smack/ConnectionCreationListener;)V

    .line 144
    :goto_0
    return-void

    .line 142
    :cond_0
    invoke-virtual {p1, v0}, Lorg/jivesoftware/smack/Connection;->addConnectionListener(Lorg/jivesoftware/smack/ConnectionListener;)V

    goto :goto_0
.end method

.method static synthetic access$1000(Lorg/jivesoftware/smack/Roster;)Ljava/util/Map;
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smack/Roster;

    .prologue
    .line 50
    iget-object v0, p0, Lorg/jivesoftware/smack/Roster;->groups:Ljava/util/Map;

    return-object v0
.end method

.method static synthetic access$1100(Lorg/jivesoftware/smack/Roster;Ljava/util/Collection;Ljava/util/Collection;Ljava/util/Collection;)V
    .locals 0
    .param p0, "x0"    # Lorg/jivesoftware/smack/Roster;
    .param p1, "x1"    # Ljava/util/Collection;
    .param p2, "x2"    # Ljava/util/Collection;
    .param p3, "x3"    # Ljava/util/Collection;

    .prologue
    .line 50
    invoke-direct {p0, p1, p2, p3}, Lorg/jivesoftware/smack/Roster;->fireRosterChangedEvent(Ljava/util/Collection;Ljava/util/Collection;Ljava/util/Collection;)V

    return-void
.end method

.method static synthetic access$200(Lorg/jivesoftware/smack/Roster;)V
    .locals 0
    .param p0, "x0"    # Lorg/jivesoftware/smack/Roster;

    .prologue
    .line 50
    invoke-direct {p0}, Lorg/jivesoftware/smack/Roster;->setOfflinePresences()V

    return-void
.end method

.method static synthetic access$300(Lorg/jivesoftware/smack/Roster;)Lorg/jivesoftware/smack/Connection;
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smack/Roster;

    .prologue
    .line 50
    iget-object v0, p0, Lorg/jivesoftware/smack/Roster;->connection:Lorg/jivesoftware/smack/Connection;

    return-object v0
.end method

.method static synthetic access$400(Lorg/jivesoftware/smack/Roster;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smack/Roster;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 50
    invoke-direct {p0, p1}, Lorg/jivesoftware/smack/Roster;->getPresenceMapKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$500(Lorg/jivesoftware/smack/Roster;)Ljava/util/Map;
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smack/Roster;

    .prologue
    .line 50
    iget-object v0, p0, Lorg/jivesoftware/smack/Roster;->presenceMap:Ljava/util/Map;

    return-object v0
.end method

.method static synthetic access$600(Lorg/jivesoftware/smack/Roster;)Ljava/util/Map;
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smack/Roster;

    .prologue
    .line 50
    iget-object v0, p0, Lorg/jivesoftware/smack/Roster;->entries:Ljava/util/Map;

    return-object v0
.end method

.method static synthetic access$700(Lorg/jivesoftware/smack/Roster;Lorg/jivesoftware/smack/packet/Presence;)V
    .locals 0
    .param p0, "x0"    # Lorg/jivesoftware/smack/Roster;
    .param p1, "x1"    # Lorg/jivesoftware/smack/packet/Presence;

    .prologue
    .line 50
    invoke-direct {p0, p1}, Lorg/jivesoftware/smack/Roster;->fireRosterPresenceEvent(Lorg/jivesoftware/smack/packet/Presence;)V

    return-void
.end method

.method static synthetic access$800(Lorg/jivesoftware/smack/Roster;)Lorg/jivesoftware/smack/Roster$SubscriptionMode;
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smack/Roster;

    .prologue
    .line 50
    iget-object v0, p0, Lorg/jivesoftware/smack/Roster;->subscriptionMode:Lorg/jivesoftware/smack/Roster$SubscriptionMode;

    return-object v0
.end method

.method static synthetic access$900(Lorg/jivesoftware/smack/Roster;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smack/Roster;

    .prologue
    .line 50
    iget-object v0, p0, Lorg/jivesoftware/smack/Roster;->unfiledEntries:Ljava/util/List;

    return-object v0
.end method

.method private fireRosterChangedEvent(Ljava/util/Collection;Ljava/util/Collection;Ljava/util/Collection;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 646
    .local p1, "addedEntries":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    .local p2, "updatedEntries":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    .local p3, "deletedEntries":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    iget-object v2, p0, Lorg/jivesoftware/smack/Roster;->rosterListeners:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jivesoftware/smack/RosterListener;

    .line 647
    .local v1, "listener":Lorg/jivesoftware/smack/RosterListener;
    invoke-interface {p1}, Ljava/util/Collection;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_1

    .line 648
    invoke-interface {v1, p1}, Lorg/jivesoftware/smack/RosterListener;->entriesAdded(Ljava/util/Collection;)V

    .line 650
    :cond_1
    invoke-interface {p2}, Ljava/util/Collection;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_2

    .line 651
    invoke-interface {v1, p2}, Lorg/jivesoftware/smack/RosterListener;->entriesUpdated(Ljava/util/Collection;)V

    .line 653
    :cond_2
    invoke-interface {p3}, Ljava/util/Collection;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_0

    .line 654
    invoke-interface {v1, p3}, Lorg/jivesoftware/smack/RosterListener;->entriesDeleted(Ljava/util/Collection;)V

    goto :goto_0

    .line 657
    .end local v1    # "listener":Lorg/jivesoftware/smack/RosterListener;
    :cond_3
    return-void
.end method

.method private fireRosterPresenceEvent(Lorg/jivesoftware/smack/packet/Presence;)V
    .locals 3
    .param p1, "presence"    # Lorg/jivesoftware/smack/packet/Presence;

    .prologue
    .line 665
    iget-object v2, p0, Lorg/jivesoftware/smack/Roster;->rosterListeners:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jivesoftware/smack/RosterListener;

    .line 666
    .local v1, "listener":Lorg/jivesoftware/smack/RosterListener;
    invoke-interface {v1, p1}, Lorg/jivesoftware/smack/RosterListener;->presenceChanged(Lorg/jivesoftware/smack/packet/Presence;)V

    goto :goto_0

    .line 668
    .end local v1    # "listener":Lorg/jivesoftware/smack/RosterListener;
    :cond_0
    return-void
.end method

.method public static getDefaultSubscriptionMode()Lorg/jivesoftware/smack/Roster$SubscriptionMode;
    .locals 1

    .prologue
    .line 80
    sget-object v0, Lorg/jivesoftware/smack/Roster;->defaultSubscriptionMode:Lorg/jivesoftware/smack/Roster$SubscriptionMode;

    return-object v0
.end method

.method private getPresenceMapKey(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "user"    # Ljava/lang/String;

    .prologue
    .line 606
    if-nez p1, :cond_0

    .line 607
    const/4 v1, 0x0

    .line 613
    :goto_0
    return-object v1

    .line 609
    :cond_0
    move-object v0, p1

    .line 610
    .local v0, "key":Ljava/lang/String;
    invoke-virtual {p0, p1}, Lorg/jivesoftware/smack/Roster;->contains(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 611
    invoke-static {p1}, Lorg/jivesoftware/smack/util/StringUtils;->parseBareAddress(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 613
    :cond_1
    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method public static setDefaultSubscriptionMode(Lorg/jivesoftware/smack/Roster$SubscriptionMode;)V
    .locals 0
    .param p0, "subscriptionMode"    # Lorg/jivesoftware/smack/Roster$SubscriptionMode;

    .prologue
    .line 92
    sput-object p0, Lorg/jivesoftware/smack/Roster;->defaultSubscriptionMode:Lorg/jivesoftware/smack/Roster$SubscriptionMode;

    .line 93
    return-void
.end method

.method private setOfflinePresences()V
    .locals 8

    .prologue
    .line 623
    iget-object v6, p0, Lorg/jivesoftware/smack/Roster;->presenceMap:Ljava/util/Map;

    invoke-interface {v6}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 624
    .local v5, "user":Ljava/lang/String;
    iget-object v6, p0, Lorg/jivesoftware/smack/Roster;->presenceMap:Ljava/util/Map;

    invoke-interface {v6, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map;

    .line 625
    .local v4, "resources":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/jivesoftware/smack/packet/Presence;>;"
    if-eqz v4, :cond_0

    .line 626
    invoke-interface {v4}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 627
    .local v3, "resource":Ljava/lang/String;
    new-instance v2, Lorg/jivesoftware/smack/packet/Presence;

    sget-object v6, Lorg/jivesoftware/smack/packet/Presence$Type;->unavailable:Lorg/jivesoftware/smack/packet/Presence$Type;

    invoke-direct {v2, v6}, Lorg/jivesoftware/smack/packet/Presence;-><init>(Lorg/jivesoftware/smack/packet/Presence$Type;)V

    .line 628
    .local v2, "packetUnavailable":Lorg/jivesoftware/smack/packet/Presence;
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, "/"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Lorg/jivesoftware/smack/packet/Presence;->setFrom(Ljava/lang/String;)V

    .line 629
    iget-object v6, p0, Lorg/jivesoftware/smack/Roster;->presencePacketListener:Lorg/jivesoftware/smack/Roster$PresencePacketListener;

    invoke-virtual {v6, v2}, Lorg/jivesoftware/smack/Roster$PresencePacketListener;->processPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    goto :goto_0

    .line 633
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v2    # "packetUnavailable":Lorg/jivesoftware/smack/packet/Presence;
    .end local v3    # "resource":Ljava/lang/String;
    .end local v4    # "resources":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/jivesoftware/smack/packet/Presence;>;"
    .end local v5    # "user":Ljava/lang/String;
    :cond_1
    return-void
.end method


# virtual methods
.method public addRosterListener(Lorg/jivesoftware/smack/RosterListener;)V
    .locals 1
    .param p1, "rosterListener"    # Lorg/jivesoftware/smack/RosterListener;

    .prologue
    .line 201
    iget-object v0, p0, Lorg/jivesoftware/smack/Roster;->rosterListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 202
    iget-object v0, p0, Lorg/jivesoftware/smack/Roster;->rosterListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 204
    :cond_0
    return-void
.end method

.method cleanup()V
    .locals 1

    .prologue
    .line 589
    iget-object v0, p0, Lorg/jivesoftware/smack/Roster;->rosterListeners:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 590
    return-void
.end method

.method public contains(Ljava/lang/String;)Z
    .locals 1
    .param p1, "user"    # Ljava/lang/String;

    .prologue
    .line 407
    invoke-virtual {p0, p1}, Lorg/jivesoftware/smack/Roster;->getEntry(Ljava/lang/String;)Lorg/jivesoftware/smack/RosterEntry;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public createEntry(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V
    .locals 12
    .param p1, "user"    # Ljava/lang/String;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "groups"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 254
    iget-object v9, p0, Lorg/jivesoftware/smack/Roster;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v9}, Lorg/jivesoftware/smack/Connection;->isAuthenticated()Z

    move-result v9

    if-nez v9, :cond_0

    .line 255
    new-instance v9, Ljava/lang/IllegalStateException;

    const-string/jumbo v10, "Not logged in to server."

    invoke-direct {v9, v10}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 257
    :cond_0
    iget-object v9, p0, Lorg/jivesoftware/smack/Roster;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v9}, Lorg/jivesoftware/smack/Connection;->isAnonymous()Z

    move-result v9

    if-eqz v9, :cond_1

    .line 258
    new-instance v9, Ljava/lang/IllegalStateException;

    const-string/jumbo v10, "Anonymous users can\'t have a roster."

    invoke-direct {v9, v10}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 262
    :cond_1
    new-instance v8, Lorg/jivesoftware/smack/packet/RosterPacket;

    invoke-direct {v8}, Lorg/jivesoftware/smack/packet/RosterPacket;-><init>()V

    .line 263
    .local v8, "rosterPacket":Lorg/jivesoftware/smack/packet/RosterPacket;
    sget-object v9, Lorg/jivesoftware/smack/packet/IQ$Type;->SET:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {v8, v9}, Lorg/jivesoftware/smack/packet/RosterPacket;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 264
    new-instance v4, Lorg/jivesoftware/smack/packet/RosterPacket$Item;

    invoke-direct {v4, p1, p2}, Lorg/jivesoftware/smack/packet/RosterPacket$Item;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 265
    .local v4, "item":Lorg/jivesoftware/smack/packet/RosterPacket$Item;
    if-eqz p3, :cond_3

    .line 266
    move-object v0, p3

    .local v0, "arr$":[Ljava/lang/String;
    array-length v5, v0

    .local v5, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_0
    if-ge v3, v5, :cond_3

    aget-object v2, v0, v3

    .line 267
    .local v2, "group":Ljava/lang/String;
    if-eqz v2, :cond_2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v9

    if-lez v9, :cond_2

    .line 268
    invoke-virtual {v4, v2}, Lorg/jivesoftware/smack/packet/RosterPacket$Item;->addGroupName(Ljava/lang/String;)V

    .line 266
    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 272
    .end local v0    # "arr$":[Ljava/lang/String;
    .end local v2    # "group":Ljava/lang/String;
    .end local v3    # "i$":I
    .end local v5    # "len$":I
    :cond_3
    invoke-virtual {v8, v4}, Lorg/jivesoftware/smack/packet/RosterPacket;->addRosterItem(Lorg/jivesoftware/smack/packet/RosterPacket$Item;)V

    .line 274
    iget-object v9, p0, Lorg/jivesoftware/smack/Roster;->connection:Lorg/jivesoftware/smack/Connection;

    new-instance v10, Lorg/jivesoftware/smack/filter/PacketIDFilter;

    invoke-virtual {v8}, Lorg/jivesoftware/smack/packet/RosterPacket;->getPacketID()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11}, Lorg/jivesoftware/smack/filter/PacketIDFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9, v10}, Lorg/jivesoftware/smack/Connection;->createPacketCollector(Lorg/jivesoftware/smack/filter/PacketFilter;)Lorg/jivesoftware/smack/PacketCollector;

    move-result-object v1

    .line 276
    .local v1, "collector":Lorg/jivesoftware/smack/PacketCollector;
    iget-object v9, p0, Lorg/jivesoftware/smack/Roster;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v9, v8}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 277
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getPacketReplyTimeout()I

    move-result v9

    int-to-long v10, v9

    invoke-virtual {v1, v10, v11}, Lorg/jivesoftware/smack/PacketCollector;->nextResult(J)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v7

    check-cast v7, Lorg/jivesoftware/smack/packet/IQ;

    .line 278
    .local v7, "response":Lorg/jivesoftware/smack/packet/IQ;
    invoke-virtual {v1}, Lorg/jivesoftware/smack/PacketCollector;->cancel()V

    .line 279
    if-nez v7, :cond_4

    .line 280
    new-instance v9, Lorg/jivesoftware/smack/XMPPException;

    const-string/jumbo v10, "No response from the server."

    invoke-direct {v9, v10}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 283
    :cond_4
    invoke-virtual {v7}, Lorg/jivesoftware/smack/packet/IQ;->getType()Lorg/jivesoftware/smack/packet/IQ$Type;

    move-result-object v9

    sget-object v10, Lorg/jivesoftware/smack/packet/IQ$Type;->ERROR:Lorg/jivesoftware/smack/packet/IQ$Type;

    if-ne v9, v10, :cond_5

    .line 284
    new-instance v9, Lorg/jivesoftware/smack/XMPPException;

    invoke-virtual {v7}, Lorg/jivesoftware/smack/packet/IQ;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v10

    invoke-direct {v9, v10}, Lorg/jivesoftware/smack/XMPPException;-><init>(Lorg/jivesoftware/smack/packet/XMPPError;)V

    throw v9

    .line 288
    :cond_5
    new-instance v6, Lorg/jivesoftware/smack/packet/Presence;

    sget-object v9, Lorg/jivesoftware/smack/packet/Presence$Type;->subscribe:Lorg/jivesoftware/smack/packet/Presence$Type;

    invoke-direct {v6, v9}, Lorg/jivesoftware/smack/packet/Presence;-><init>(Lorg/jivesoftware/smack/packet/Presence$Type;)V

    .line 289
    .local v6, "presencePacket":Lorg/jivesoftware/smack/packet/Presence;
    invoke-virtual {v6, p1}, Lorg/jivesoftware/smack/packet/Presence;->setTo(Ljava/lang/String;)V

    .line 290
    iget-object v9, p0, Lorg/jivesoftware/smack/Roster;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v9, v6}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 291
    return-void
.end method

.method public createGroup(Ljava/lang/String;)Lorg/jivesoftware/smack/RosterGroup;
    .locals 4
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 227
    iget-object v1, p0, Lorg/jivesoftware/smack/Roster;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v1}, Lorg/jivesoftware/smack/Connection;->isAuthenticated()Z

    move-result v1

    if-nez v1, :cond_0

    .line 228
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string/jumbo v2, "Not logged in to server."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 230
    :cond_0
    iget-object v1, p0, Lorg/jivesoftware/smack/Roster;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v1}, Lorg/jivesoftware/smack/Connection;->isAnonymous()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 231
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string/jumbo v2, "Anonymous users can\'t have a roster."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 233
    :cond_1
    iget-object v1, p0, Lorg/jivesoftware/smack/Roster;->groups:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 234
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Group with name "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, " alread exists."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 237
    :cond_2
    new-instance v0, Lorg/jivesoftware/smack/RosterGroup;

    iget-object v1, p0, Lorg/jivesoftware/smack/Roster;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-direct {v0, p1, v1}, Lorg/jivesoftware/smack/RosterGroup;-><init>(Ljava/lang/String;Lorg/jivesoftware/smack/Connection;)V

    .line 238
    .local v0, "group":Lorg/jivesoftware/smack/RosterGroup;
    iget-object v1, p0, Lorg/jivesoftware/smack/Roster;->groups:Ljava/util/Map;

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 239
    return-object v0
.end method

.method public getEntries()Ljava/util/Collection;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Lorg/jivesoftware/smack/RosterEntry;",
            ">;"
        }
    .end annotation

    .prologue
    .line 352
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 354
    .local v0, "allEntries":Ljava/util/Set;, "Ljava/util/Set<Lorg/jivesoftware/smack/RosterEntry;>;"
    invoke-virtual {p0}, Lorg/jivesoftware/smack/Roster;->getGroups()Ljava/util/Collection;

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

    check-cast v2, Lorg/jivesoftware/smack/RosterGroup;

    .line 355
    .local v2, "rosterGroup":Lorg/jivesoftware/smack/RosterGroup;
    invoke-virtual {v2}, Lorg/jivesoftware/smack/RosterGroup;->getEntries()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    goto :goto_0

    .line 358
    .end local v2    # "rosterGroup":Lorg/jivesoftware/smack/RosterGroup;
    :cond_0
    iget-object v3, p0, Lorg/jivesoftware/smack/Roster;->unfiledEntries:Ljava/util/List;

    invoke-interface {v0, v3}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 360
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableCollection(Ljava/util/Collection;)Ljava/util/Collection;

    move-result-object v3

    return-object v3
.end method

.method public getEntry(Ljava/lang/String;)Lorg/jivesoftware/smack/RosterEntry;
    .locals 2
    .param p1, "user"    # Ljava/lang/String;

    .prologue
    .line 392
    if-nez p1, :cond_0

    .line 393
    const/4 v0, 0x0

    .line 395
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lorg/jivesoftware/smack/Roster;->entries:Ljava/util/Map;

    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smack/RosterEntry;

    goto :goto_0
.end method

.method public getEntryCount()I
    .locals 1

    .prologue
    .line 342
    invoke-virtual {p0}, Lorg/jivesoftware/smack/Roster;->getEntries()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->size()I

    move-result v0

    return v0
.end method

.method public getGroup(Ljava/lang/String;)Lorg/jivesoftware/smack/RosterGroup;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 418
    iget-object v0, p0, Lorg/jivesoftware/smack/Roster;->groups:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smack/RosterGroup;

    return-object v0
.end method

.method public getGroupCount()I
    .locals 1

    .prologue
    .line 427
    iget-object v0, p0, Lorg/jivesoftware/smack/Roster;->groups:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    return v0
.end method

.method public getGroups()Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Lorg/jivesoftware/smack/RosterGroup;",
            ">;"
        }
    .end annotation

    .prologue
    .line 436
    iget-object v0, p0, Lorg/jivesoftware/smack/Roster;->groups:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableCollection(Ljava/util/Collection;)Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method

.method public getPresence(Ljava/lang/String;)Lorg/jivesoftware/smack/packet/Presence;
    .locals 11
    .param p1, "user"    # Ljava/lang/String;

    .prologue
    .line 468
    invoke-static {p1}, Lorg/jivesoftware/smack/util/StringUtils;->parseBareAddress(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-direct {p0, v9}, Lorg/jivesoftware/smack/Roster;->getPresenceMapKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 469
    .local v1, "key":Ljava/lang/String;
    iget-object v9, p0, Lorg/jivesoftware/smack/Roster;->presenceMap:Ljava/util/Map;

    invoke-interface {v9, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/util/Map;

    .line 470
    .local v8, "userPresences":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/jivesoftware/smack/packet/Presence;>;"
    if-nez v8, :cond_0

    .line 471
    new-instance v4, Lorg/jivesoftware/smack/packet/Presence;

    sget-object v9, Lorg/jivesoftware/smack/packet/Presence$Type;->unavailable:Lorg/jivesoftware/smack/packet/Presence$Type;

    invoke-direct {v4, v9}, Lorg/jivesoftware/smack/packet/Presence;-><init>(Lorg/jivesoftware/smack/packet/Presence$Type;)V

    .line 472
    .local v4, "presence":Lorg/jivesoftware/smack/packet/Presence;
    invoke-virtual {v4, p1}, Lorg/jivesoftware/smack/packet/Presence;->setFrom(Ljava/lang/String;)V

    move-object v5, v4

    .line 512
    .end local v4    # "presence":Lorg/jivesoftware/smack/packet/Presence;
    .local v5, "presence":Ljava/lang/Object;
    :goto_0
    return-object v5

    .line 478
    .end local v5    # "presence":Ljava/lang/Object;
    :cond_0
    const/4 v4, 0x0

    .line 480
    .restart local v4    # "presence":Lorg/jivesoftware/smack/packet/Presence;
    invoke-interface {v8}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v9

    invoke-interface {v9}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_1
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_6

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    .line 481
    .local v7, "resource":Ljava/lang/String;
    invoke-interface {v8, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/jivesoftware/smack/packet/Presence;

    .line 482
    .local v2, "p":Lorg/jivesoftware/smack/packet/Presence;
    invoke-virtual {v2}, Lorg/jivesoftware/smack/packet/Presence;->isAvailable()Z

    move-result v9

    if-eqz v9, :cond_1

    .line 486
    if-eqz v4, :cond_2

    invoke-virtual {v2}, Lorg/jivesoftware/smack/packet/Presence;->getPriority()I

    move-result v9

    invoke-virtual {v4}, Lorg/jivesoftware/smack/packet/Presence;->getPriority()I

    move-result v10

    if-le v9, v10, :cond_3

    .line 487
    :cond_2
    move-object v4, v2

    goto :goto_1

    .line 490
    :cond_3
    invoke-virtual {v2}, Lorg/jivesoftware/smack/packet/Presence;->getPriority()I

    move-result v9

    invoke-virtual {v4}, Lorg/jivesoftware/smack/packet/Presence;->getPriority()I

    move-result v10

    if-ne v9, v10, :cond_1

    .line 491
    invoke-virtual {v2}, Lorg/jivesoftware/smack/packet/Presence;->getMode()Lorg/jivesoftware/smack/packet/Presence$Mode;

    move-result-object v3

    .line 493
    .local v3, "pMode":Lorg/jivesoftware/smack/packet/Presence$Mode;
    if-nez v3, :cond_4

    .line 494
    sget-object v3, Lorg/jivesoftware/smack/packet/Presence$Mode;->available:Lorg/jivesoftware/smack/packet/Presence$Mode;

    .line 496
    :cond_4
    invoke-virtual {v4}, Lorg/jivesoftware/smack/packet/Presence;->getMode()Lorg/jivesoftware/smack/packet/Presence$Mode;

    move-result-object v6

    .line 498
    .local v6, "presenceMode":Lorg/jivesoftware/smack/packet/Presence$Mode;
    if-nez v6, :cond_5

    .line 499
    sget-object v6, Lorg/jivesoftware/smack/packet/Presence$Mode;->available:Lorg/jivesoftware/smack/packet/Presence$Mode;

    .line 501
    :cond_5
    invoke-virtual {v3, v6}, Lorg/jivesoftware/smack/packet/Presence$Mode;->compareTo(Ljava/lang/Enum;)I

    move-result v9

    if-gez v9, :cond_1

    .line 502
    move-object v4, v2

    goto :goto_1

    .line 506
    .end local v2    # "p":Lorg/jivesoftware/smack/packet/Presence;
    .end local v3    # "pMode":Lorg/jivesoftware/smack/packet/Presence$Mode;
    .end local v6    # "presenceMode":Lorg/jivesoftware/smack/packet/Presence$Mode;
    .end local v7    # "resource":Ljava/lang/String;
    :cond_6
    if-nez v4, :cond_7

    .line 507
    new-instance v4, Lorg/jivesoftware/smack/packet/Presence;

    .end local v4    # "presence":Lorg/jivesoftware/smack/packet/Presence;
    sget-object v9, Lorg/jivesoftware/smack/packet/Presence$Type;->unavailable:Lorg/jivesoftware/smack/packet/Presence$Type;

    invoke-direct {v4, v9}, Lorg/jivesoftware/smack/packet/Presence;-><init>(Lorg/jivesoftware/smack/packet/Presence$Type;)V

    .line 508
    .restart local v4    # "presence":Lorg/jivesoftware/smack/packet/Presence;
    invoke-virtual {v4, p1}, Lorg/jivesoftware/smack/packet/Presence;->setFrom(Ljava/lang/String;)V

    move-object v5, v4

    .line 509
    .restart local v5    # "presence":Ljava/lang/Object;
    goto :goto_0

    .end local v5    # "presence":Ljava/lang/Object;
    :cond_7
    move-object v5, v4

    .line 512
    .restart local v5    # "presence":Ljava/lang/Object;
    goto :goto_0
.end method

.method public getPresenceResource(Ljava/lang/String;)Lorg/jivesoftware/smack/packet/Presence;
    .locals 6
    .param p1, "userWithResource"    # Ljava/lang/String;

    .prologue
    .line 527
    invoke-direct {p0, p1}, Lorg/jivesoftware/smack/Roster;->getPresenceMapKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 528
    .local v0, "key":Ljava/lang/String;
    invoke-static {p1}, Lorg/jivesoftware/smack/util/StringUtils;->parseResource(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 529
    .local v3, "resource":Ljava/lang/String;
    iget-object v5, p0, Lorg/jivesoftware/smack/Roster;->presenceMap:Ljava/util/Map;

    invoke-interface {v5, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map;

    .line 530
    .local v4, "userPresences":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/jivesoftware/smack/packet/Presence;>;"
    if-nez v4, :cond_0

    .line 531
    new-instance v1, Lorg/jivesoftware/smack/packet/Presence;

    sget-object v5, Lorg/jivesoftware/smack/packet/Presence$Type;->unavailable:Lorg/jivesoftware/smack/packet/Presence$Type;

    invoke-direct {v1, v5}, Lorg/jivesoftware/smack/packet/Presence;-><init>(Lorg/jivesoftware/smack/packet/Presence$Type;)V

    .line 532
    .local v1, "presence":Lorg/jivesoftware/smack/packet/Presence;
    invoke-virtual {v1, p1}, Lorg/jivesoftware/smack/packet/Presence;->setFrom(Ljava/lang/String;)V

    move-object v2, v1

    .line 543
    .end local v1    # "presence":Lorg/jivesoftware/smack/packet/Presence;
    .local v2, "presence":Ljava/lang/Object;
    :goto_0
    return-object v2

    .line 536
    .end local v2    # "presence":Ljava/lang/Object;
    :cond_0
    invoke-interface {v4, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jivesoftware/smack/packet/Presence;

    .line 537
    .restart local v1    # "presence":Lorg/jivesoftware/smack/packet/Presence;
    if-nez v1, :cond_1

    .line 538
    new-instance v1, Lorg/jivesoftware/smack/packet/Presence;

    .end local v1    # "presence":Lorg/jivesoftware/smack/packet/Presence;
    sget-object v5, Lorg/jivesoftware/smack/packet/Presence$Type;->unavailable:Lorg/jivesoftware/smack/packet/Presence$Type;

    invoke-direct {v1, v5}, Lorg/jivesoftware/smack/packet/Presence;-><init>(Lorg/jivesoftware/smack/packet/Presence$Type;)V

    .line 539
    .restart local v1    # "presence":Lorg/jivesoftware/smack/packet/Presence;
    invoke-virtual {v1, p1}, Lorg/jivesoftware/smack/packet/Presence;->setFrom(Ljava/lang/String;)V

    move-object v2, v1

    .line 540
    .restart local v2    # "presence":Ljava/lang/Object;
    goto :goto_0

    .end local v2    # "presence":Ljava/lang/Object;
    :cond_1
    move-object v2, v1

    .line 543
    .restart local v2    # "presence":Ljava/lang/Object;
    goto :goto_0
.end method

.method public getPresences(Ljava/lang/String;)Ljava/util/Iterator;
    .locals 8
    .param p1, "user"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Iterator",
            "<",
            "Lorg/jivesoftware/smack/packet/Presence;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 560
    invoke-direct {p0, p1}, Lorg/jivesoftware/smack/Roster;->getPresenceMapKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 561
    .local v2, "key":Ljava/lang/String;
    iget-object v5, p0, Lorg/jivesoftware/smack/Roster;->presenceMap:Ljava/util/Map;

    invoke-interface {v5, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map;

    .line 562
    .local v4, "userPresences":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/jivesoftware/smack/packet/Presence;>;"
    if-nez v4, :cond_0

    .line 563
    new-instance v3, Lorg/jivesoftware/smack/packet/Presence;

    sget-object v5, Lorg/jivesoftware/smack/packet/Presence$Type;->unavailable:Lorg/jivesoftware/smack/packet/Presence$Type;

    invoke-direct {v3, v5}, Lorg/jivesoftware/smack/packet/Presence;-><init>(Lorg/jivesoftware/smack/packet/Presence$Type;)V

    .line 564
    .local v3, "presence":Lorg/jivesoftware/smack/packet/Presence;
    invoke-virtual {v3, p1}, Lorg/jivesoftware/smack/packet/Presence;->setFrom(Ljava/lang/String;)V

    .line 565
    new-array v5, v7, [Lorg/jivesoftware/smack/packet/Presence;

    aput-object v3, v5, v6

    invoke-static {v5}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .line 580
    .end local v3    # "presence":Lorg/jivesoftware/smack/packet/Presence;
    :goto_0
    return-object v5

    .line 568
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 569
    .local v0, "answer":Ljava/util/Collection;, "Ljava/util/Collection<Lorg/jivesoftware/smack/packet/Presence;>;"
    invoke-interface {v4}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_1
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/jivesoftware/smack/packet/Presence;

    .line 570
    .restart local v3    # "presence":Lorg/jivesoftware/smack/packet/Presence;
    invoke-virtual {v3}, Lorg/jivesoftware/smack/packet/Presence;->isAvailable()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 571
    invoke-interface {v0, v3}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 574
    .end local v3    # "presence":Lorg/jivesoftware/smack/packet/Presence;
    :cond_2
    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_3

    .line 575
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v5

    goto :goto_0

    .line 578
    :cond_3
    new-instance v3, Lorg/jivesoftware/smack/packet/Presence;

    sget-object v5, Lorg/jivesoftware/smack/packet/Presence$Type;->unavailable:Lorg/jivesoftware/smack/packet/Presence$Type;

    invoke-direct {v3, v5}, Lorg/jivesoftware/smack/packet/Presence;-><init>(Lorg/jivesoftware/smack/packet/Presence$Type;)V

    .line 579
    .restart local v3    # "presence":Lorg/jivesoftware/smack/packet/Presence;
    invoke-virtual {v3, p1}, Lorg/jivesoftware/smack/packet/Presence;->setFrom(Ljava/lang/String;)V

    .line 580
    new-array v5, v7, [Lorg/jivesoftware/smack/packet/Presence;

    aput-object v3, v5, v6

    invoke-static {v5}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    goto :goto_0
.end method

.method public getSubscriptionMode()Lorg/jivesoftware/smack/Roster$SubscriptionMode;
    .locals 1

    .prologue
    .line 158
    iget-object v0, p0, Lorg/jivesoftware/smack/Roster;->subscriptionMode:Lorg/jivesoftware/smack/Roster$SubscriptionMode;

    return-object v0
.end method

.method public getUnfiledEntries()Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Lorg/jivesoftware/smack/RosterEntry;",
            ">;"
        }
    .end annotation

    .prologue
    .line 380
    iget-object v0, p0, Lorg/jivesoftware/smack/Roster;->unfiledEntries:Ljava/util/List;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getUnfiledEntryCount()I
    .locals 1

    .prologue
    .line 370
    iget-object v0, p0, Lorg/jivesoftware/smack/Roster;->unfiledEntries:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public reload()V
    .locals 2

    .prologue
    .line 184
    iget-object v0, p0, Lorg/jivesoftware/smack/Roster;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v0}, Lorg/jivesoftware/smack/Connection;->isAuthenticated()Z

    move-result v0

    if-nez v0, :cond_0

    .line 185
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "Not logged in to server."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 187
    :cond_0
    iget-object v0, p0, Lorg/jivesoftware/smack/Roster;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v0}, Lorg/jivesoftware/smack/Connection;->isAnonymous()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 188
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "Anonymous users can\'t have a roster."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 191
    :cond_1
    iget-object v0, p0, Lorg/jivesoftware/smack/Roster;->connection:Lorg/jivesoftware/smack/Connection;

    new-instance v1, Lorg/jivesoftware/smack/packet/RosterPacket;

    invoke-direct {v1}, Lorg/jivesoftware/smack/packet/RosterPacket;-><init>()V

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 192
    return-void
.end method

.method public removeEntry(Lorg/jivesoftware/smack/RosterEntry;)V
    .locals 7
    .param p1, "entry"    # Lorg/jivesoftware/smack/RosterEntry;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 304
    iget-object v4, p0, Lorg/jivesoftware/smack/Roster;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v4}, Lorg/jivesoftware/smack/Connection;->isAuthenticated()Z

    move-result v4

    if-nez v4, :cond_0

    .line 305
    new-instance v4, Ljava/lang/IllegalStateException;

    const-string/jumbo v5, "Not logged in to server."

    invoke-direct {v4, v5}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 307
    :cond_0
    iget-object v4, p0, Lorg/jivesoftware/smack/Roster;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v4}, Lorg/jivesoftware/smack/Connection;->isAnonymous()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 308
    new-instance v4, Ljava/lang/IllegalStateException;

    const-string/jumbo v5, "Anonymous users can\'t have a roster."

    invoke-direct {v4, v5}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 313
    :cond_1
    iget-object v4, p0, Lorg/jivesoftware/smack/Roster;->entries:Ljava/util/Map;

    invoke-virtual {p1}, Lorg/jivesoftware/smack/RosterEntry;->getUser()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_3

    .line 334
    :cond_2
    return-void

    .line 316
    :cond_3
    new-instance v2, Lorg/jivesoftware/smack/packet/RosterPacket;

    invoke-direct {v2}, Lorg/jivesoftware/smack/packet/RosterPacket;-><init>()V

    .line 317
    .local v2, "packet":Lorg/jivesoftware/smack/packet/RosterPacket;
    sget-object v4, Lorg/jivesoftware/smack/packet/IQ$Type;->SET:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {v2, v4}, Lorg/jivesoftware/smack/packet/RosterPacket;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 318
    invoke-static {p1}, Lorg/jivesoftware/smack/RosterEntry;->toRosterItem(Lorg/jivesoftware/smack/RosterEntry;)Lorg/jivesoftware/smack/packet/RosterPacket$Item;

    move-result-object v1

    .line 320
    .local v1, "item":Lorg/jivesoftware/smack/packet/RosterPacket$Item;
    sget-object v4, Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;->remove:Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;

    invoke-virtual {v1, v4}, Lorg/jivesoftware/smack/packet/RosterPacket$Item;->setItemType(Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;)V

    .line 321
    invoke-virtual {v2, v1}, Lorg/jivesoftware/smack/packet/RosterPacket;->addRosterItem(Lorg/jivesoftware/smack/packet/RosterPacket$Item;)V

    .line 322
    iget-object v4, p0, Lorg/jivesoftware/smack/Roster;->connection:Lorg/jivesoftware/smack/Connection;

    new-instance v5, Lorg/jivesoftware/smack/filter/PacketIDFilter;

    invoke-virtual {v2}, Lorg/jivesoftware/smack/packet/RosterPacket;->getPacketID()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Lorg/jivesoftware/smack/filter/PacketIDFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v5}, Lorg/jivesoftware/smack/Connection;->createPacketCollector(Lorg/jivesoftware/smack/filter/PacketFilter;)Lorg/jivesoftware/smack/PacketCollector;

    move-result-object v0

    .line 324
    .local v0, "collector":Lorg/jivesoftware/smack/PacketCollector;
    iget-object v4, p0, Lorg/jivesoftware/smack/Roster;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v4, v2}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 325
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getPacketReplyTimeout()I

    move-result v4

    int-to-long v4, v4

    invoke-virtual {v0, v4, v5}, Lorg/jivesoftware/smack/PacketCollector;->nextResult(J)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v3

    check-cast v3, Lorg/jivesoftware/smack/packet/IQ;

    .line 326
    .local v3, "response":Lorg/jivesoftware/smack/packet/IQ;
    invoke-virtual {v0}, Lorg/jivesoftware/smack/PacketCollector;->cancel()V

    .line 327
    if-nez v3, :cond_4

    .line 328
    new-instance v4, Lorg/jivesoftware/smack/XMPPException;

    const-string/jumbo v5, "No response from the server."

    invoke-direct {v4, v5}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 331
    :cond_4
    invoke-virtual {v3}, Lorg/jivesoftware/smack/packet/IQ;->getType()Lorg/jivesoftware/smack/packet/IQ$Type;

    move-result-object v4

    sget-object v5, Lorg/jivesoftware/smack/packet/IQ$Type;->ERROR:Lorg/jivesoftware/smack/packet/IQ$Type;

    if-ne v4, v5, :cond_2

    .line 332
    new-instance v4, Lorg/jivesoftware/smack/XMPPException;

    invoke-virtual {v3}, Lorg/jivesoftware/smack/packet/IQ;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/jivesoftware/smack/XMPPException;-><init>(Lorg/jivesoftware/smack/packet/XMPPError;)V

    throw v4
.end method

.method public removeRosterListener(Lorg/jivesoftware/smack/RosterListener;)V
    .locals 1
    .param p1, "rosterListener"    # Lorg/jivesoftware/smack/RosterListener;

    .prologue
    .line 213
    iget-object v0, p0, Lorg/jivesoftware/smack/Roster;->rosterListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 214
    return-void
.end method

.method public setSubscriptionMode(Lorg/jivesoftware/smack/Roster$SubscriptionMode;)V
    .locals 0
    .param p1, "subscriptionMode"    # Lorg/jivesoftware/smack/Roster$SubscriptionMode;

    .prologue
    .line 173
    iput-object p1, p0, Lorg/jivesoftware/smack/Roster;->subscriptionMode:Lorg/jivesoftware/smack/Roster$SubscriptionMode;

    .line 174
    return-void
.end method
