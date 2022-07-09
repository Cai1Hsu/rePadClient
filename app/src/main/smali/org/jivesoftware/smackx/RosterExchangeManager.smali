.class public Lorg/jivesoftware/smackx/RosterExchangeManager;
.super Ljava/lang/Object;
.source "RosterExchangeManager.java"


# instance fields
.field private con:Lorg/jivesoftware/smack/Connection;

.field private packetFilter:Lorg/jivesoftware/smack/filter/PacketFilter;

.field private packetListener:Lorg/jivesoftware/smack/PacketListener;

.field private rosterExchangeListeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smackx/RosterExchangeListener;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lorg/jivesoftware/smack/Connection;)V
    .locals 3
    .param p1, "con"    # Lorg/jivesoftware/smack/Connection;

    .prologue
    .line 61
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smackx/RosterExchangeManager;->rosterExchangeListeners:Ljava/util/List;

    .line 53
    new-instance v0, Lorg/jivesoftware/smack/filter/PacketExtensionFilter;

    const-string/jumbo v1, "x"

    const-string/jumbo v2, "jabber:x:roster"

    invoke-direct {v0, v1, v2}, Lorg/jivesoftware/smack/filter/PacketExtensionFilter;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    iput-object v0, p0, Lorg/jivesoftware/smackx/RosterExchangeManager;->packetFilter:Lorg/jivesoftware/smack/filter/PacketFilter;

    .line 62
    iput-object p1, p0, Lorg/jivesoftware/smackx/RosterExchangeManager;->con:Lorg/jivesoftware/smack/Connection;

    .line 63
    invoke-direct {p0}, Lorg/jivesoftware/smackx/RosterExchangeManager;->init()V

    .line 64
    return-void
.end method

.method static synthetic access$000(Lorg/jivesoftware/smackx/RosterExchangeManager;Ljava/lang/String;Ljava/util/Iterator;)V
    .locals 0
    .param p0, "x0"    # Lorg/jivesoftware/smackx/RosterExchangeManager;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Ljava/util/Iterator;

    .prologue
    .line 47
    invoke-direct {p0, p1, p2}, Lorg/jivesoftware/smackx/RosterExchangeManager;->fireRosterExchangeListeners(Ljava/lang/String;Ljava/util/Iterator;)V

    return-void
.end method

.method private fireRosterExchangeListeners(Ljava/lang/String;Ljava/util/Iterator;)V
    .locals 4
    .param p1, "from"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Iterator",
            "<",
            "Lorg/jivesoftware/smackx/RemoteRosterEntry;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 153
    .local p2, "remoteRosterEntries":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/jivesoftware/smackx/RemoteRosterEntry;>;"
    const/4 v1, 0x0

    .line 154
    .local v1, "listeners":[Lorg/jivesoftware/smackx/RosterExchangeListener;
    iget-object v3, p0, Lorg/jivesoftware/smackx/RosterExchangeManager;->rosterExchangeListeners:Ljava/util/List;

    monitor-enter v3

    .line 155
    :try_start_0
    iget-object v2, p0, Lorg/jivesoftware/smackx/RosterExchangeManager;->rosterExchangeListeners:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    new-array v1, v2, [Lorg/jivesoftware/smackx/RosterExchangeListener;

    .line 156
    iget-object v2, p0, Lorg/jivesoftware/smackx/RosterExchangeManager;->rosterExchangeListeners:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 157
    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 158
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v2, v1

    if-ge v0, v2, :cond_0

    .line 159
    aget-object v2, v1, v0

    invoke-interface {v2, p1, p2}, Lorg/jivesoftware/smackx/RosterExchangeListener;->entriesReceived(Ljava/lang/String;Ljava/util/Iterator;)V

    .line 158
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 157
    .end local v0    # "i":I
    :catchall_0
    move-exception v2

    :try_start_1
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v2

    .line 161
    .restart local v0    # "i":I
    :cond_0
    return-void
.end method

.method private init()V
    .locals 3

    .prologue
    .line 165
    new-instance v0, Lorg/jivesoftware/smackx/RosterExchangeManager$1;

    invoke-direct {v0, p0}, Lorg/jivesoftware/smackx/RosterExchangeManager$1;-><init>(Lorg/jivesoftware/smackx/RosterExchangeManager;)V

    iput-object v0, p0, Lorg/jivesoftware/smackx/RosterExchangeManager;->packetListener:Lorg/jivesoftware/smack/PacketListener;

    .line 175
    iget-object v0, p0, Lorg/jivesoftware/smackx/RosterExchangeManager;->con:Lorg/jivesoftware/smack/Connection;

    iget-object v1, p0, Lorg/jivesoftware/smackx/RosterExchangeManager;->packetListener:Lorg/jivesoftware/smack/PacketListener;

    iget-object v2, p0, Lorg/jivesoftware/smackx/RosterExchangeManager;->packetFilter:Lorg/jivesoftware/smack/filter/PacketFilter;

    invoke-virtual {v0, v1, v2}, Lorg/jivesoftware/smack/Connection;->addPacketListener(Lorg/jivesoftware/smack/PacketListener;Lorg/jivesoftware/smack/filter/PacketFilter;)V

    .line 176
    return-void
.end method


# virtual methods
.method public addRosterListener(Lorg/jivesoftware/smackx/RosterExchangeListener;)V
    .locals 2
    .param p1, "rosterExchangeListener"    # Lorg/jivesoftware/smackx/RosterExchangeListener;

    .prologue
    .line 73
    iget-object v1, p0, Lorg/jivesoftware/smackx/RosterExchangeManager;->rosterExchangeListeners:Ljava/util/List;

    monitor-enter v1

    .line 74
    :try_start_0
    iget-object v0, p0, Lorg/jivesoftware/smackx/RosterExchangeManager;->rosterExchangeListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 75
    iget-object v0, p0, Lorg/jivesoftware/smackx/RosterExchangeManager;->rosterExchangeListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 77
    :cond_0
    monitor-exit v1

    .line 78
    return-void

    .line 77
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public destroy()V
    .locals 2

    .prologue
    .line 179
    iget-object v0, p0, Lorg/jivesoftware/smackx/RosterExchangeManager;->con:Lorg/jivesoftware/smack/Connection;

    if-eqz v0, :cond_0

    .line 180
    iget-object v0, p0, Lorg/jivesoftware/smackx/RosterExchangeManager;->con:Lorg/jivesoftware/smack/Connection;

    iget-object v1, p0, Lorg/jivesoftware/smackx/RosterExchangeManager;->packetListener:Lorg/jivesoftware/smack/PacketListener;

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smack/Connection;->removePacketListener(Lorg/jivesoftware/smack/PacketListener;)V

    .line 182
    :cond_0
    return-void
.end method

.method protected finalize()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 184
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/RosterExchangeManager;->destroy()V

    .line 185
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    .line 186
    return-void
.end method

.method public removeRosterListener(Lorg/jivesoftware/smackx/RosterExchangeListener;)V
    .locals 2
    .param p1, "rosterExchangeListener"    # Lorg/jivesoftware/smackx/RosterExchangeListener;

    .prologue
    .line 87
    iget-object v1, p0, Lorg/jivesoftware/smackx/RosterExchangeManager;->rosterExchangeListeners:Ljava/util/List;

    monitor-enter v1

    .line 88
    :try_start_0
    iget-object v0, p0, Lorg/jivesoftware/smackx/RosterExchangeManager;->rosterExchangeListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 89
    monitor-exit v1

    .line 90
    return-void

    .line 89
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public send(Lorg/jivesoftware/smack/Roster;Ljava/lang/String;)V
    .locals 3
    .param p1, "roster"    # Lorg/jivesoftware/smack/Roster;
    .param p2, "targetUserID"    # Ljava/lang/String;

    .prologue
    .line 101
    new-instance v0, Lorg/jivesoftware/smack/packet/Message;

    invoke-direct {v0, p2}, Lorg/jivesoftware/smack/packet/Message;-><init>(Ljava/lang/String;)V

    .line 103
    .local v0, "msg":Lorg/jivesoftware/smack/packet/Message;
    new-instance v1, Lorg/jivesoftware/smackx/packet/RosterExchange;

    invoke-direct {v1, p1}, Lorg/jivesoftware/smackx/packet/RosterExchange;-><init>(Lorg/jivesoftware/smack/Roster;)V

    .line 104
    .local v1, "rosterExchange":Lorg/jivesoftware/smackx/packet/RosterExchange;
    invoke-virtual {v0, v1}, Lorg/jivesoftware/smack/packet/Message;->addExtension(Lorg/jivesoftware/smack/packet/PacketExtension;)V

    .line 107
    iget-object v2, p0, Lorg/jivesoftware/smackx/RosterExchangeManager;->con:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v2, v0}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 108
    return-void
.end method

.method public send(Lorg/jivesoftware/smack/RosterEntry;Ljava/lang/String;)V
    .locals 3
    .param p1, "rosterEntry"    # Lorg/jivesoftware/smack/RosterEntry;
    .param p2, "targetUserID"    # Ljava/lang/String;

    .prologue
    .line 118
    new-instance v0, Lorg/jivesoftware/smack/packet/Message;

    invoke-direct {v0, p2}, Lorg/jivesoftware/smack/packet/Message;-><init>(Ljava/lang/String;)V

    .line 120
    .local v0, "msg":Lorg/jivesoftware/smack/packet/Message;
    new-instance v1, Lorg/jivesoftware/smackx/packet/RosterExchange;

    invoke-direct {v1}, Lorg/jivesoftware/smackx/packet/RosterExchange;-><init>()V

    .line 121
    .local v1, "rosterExchange":Lorg/jivesoftware/smackx/packet/RosterExchange;
    invoke-virtual {v1, p1}, Lorg/jivesoftware/smackx/packet/RosterExchange;->addRosterEntry(Lorg/jivesoftware/smack/RosterEntry;)V

    .line 122
    invoke-virtual {v0, v1}, Lorg/jivesoftware/smack/packet/Message;->addExtension(Lorg/jivesoftware/smack/packet/PacketExtension;)V

    .line 125
    iget-object v2, p0, Lorg/jivesoftware/smackx/RosterExchangeManager;->con:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v2, v0}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 126
    return-void
.end method

.method public send(Lorg/jivesoftware/smack/RosterGroup;Ljava/lang/String;)V
    .locals 5
    .param p1, "rosterGroup"    # Lorg/jivesoftware/smack/RosterGroup;
    .param p2, "targetUserID"    # Ljava/lang/String;

    .prologue
    .line 137
    new-instance v2, Lorg/jivesoftware/smack/packet/Message;

    invoke-direct {v2, p2}, Lorg/jivesoftware/smack/packet/Message;-><init>(Ljava/lang/String;)V

    .line 139
    .local v2, "msg":Lorg/jivesoftware/smack/packet/Message;
    new-instance v3, Lorg/jivesoftware/smackx/packet/RosterExchange;

    invoke-direct {v3}, Lorg/jivesoftware/smackx/packet/RosterExchange;-><init>()V

    .line 140
    .local v3, "rosterExchange":Lorg/jivesoftware/smackx/packet/RosterExchange;
    invoke-virtual {p1}, Lorg/jivesoftware/smack/RosterGroup;->getEntries()Ljava/util/Collection;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smack/RosterEntry;

    .line 141
    .local v0, "entry":Lorg/jivesoftware/smack/RosterEntry;
    invoke-virtual {v3, v0}, Lorg/jivesoftware/smackx/packet/RosterExchange;->addRosterEntry(Lorg/jivesoftware/smack/RosterEntry;)V

    goto :goto_0

    .line 143
    .end local v0    # "entry":Lorg/jivesoftware/smack/RosterEntry;
    :cond_0
    invoke-virtual {v2, v3}, Lorg/jivesoftware/smack/packet/Message;->addExtension(Lorg/jivesoftware/smack/packet/PacketExtension;)V

    .line 146
    iget-object v4, p0, Lorg/jivesoftware/smackx/RosterExchangeManager;->con:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v4, v2}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 147
    return-void
.end method
