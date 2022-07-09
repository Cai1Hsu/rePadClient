.class public Lorg/jivesoftware/smackx/PEPManager;
.super Ljava/lang/Object;
.source "PEPManager.java"


# instance fields
.field private connection:Lorg/jivesoftware/smack/Connection;

.field private packetFilter:Lorg/jivesoftware/smack/filter/PacketFilter;

.field private packetListener:Lorg/jivesoftware/smack/PacketListener;

.field private pepListeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smackx/PEPListener;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lorg/jivesoftware/smack/Connection;)V
    .locals 3
    .param p1, "connection"    # Lorg/jivesoftware/smack/Connection;

    .prologue
    .line 77
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 65
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smackx/PEPManager;->pepListeners:Ljava/util/List;

    .line 69
    new-instance v0, Lorg/jivesoftware/smack/filter/PacketExtensionFilter;

    const-string/jumbo v1, "event"

    const-string/jumbo v2, "http://jabber.org/protocol/pubsub#event"

    invoke-direct {v0, v1, v2}, Lorg/jivesoftware/smack/filter/PacketExtensionFilter;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    iput-object v0, p0, Lorg/jivesoftware/smackx/PEPManager;->packetFilter:Lorg/jivesoftware/smack/filter/PacketFilter;

    .line 78
    iput-object p1, p0, Lorg/jivesoftware/smackx/PEPManager;->connection:Lorg/jivesoftware/smack/Connection;

    .line 79
    invoke-direct {p0}, Lorg/jivesoftware/smackx/PEPManager;->init()V

    .line 80
    return-void
.end method

.method static synthetic access$000(Lorg/jivesoftware/smackx/PEPManager;Ljava/lang/String;Lorg/jivesoftware/smackx/packet/PEPEvent;)V
    .locals 0
    .param p0, "x0"    # Lorg/jivesoftware/smackx/PEPManager;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Lorg/jivesoftware/smackx/packet/PEPEvent;

    .prologue
    .line 63
    invoke-direct {p0, p1, p2}, Lorg/jivesoftware/smackx/PEPManager;->firePEPListeners(Ljava/lang/String;Lorg/jivesoftware/smackx/packet/PEPEvent;)V

    return-void
.end method

.method private firePEPListeners(Ljava/lang/String;Lorg/jivesoftware/smackx/packet/PEPEvent;)V
    .locals 4
    .param p1, "from"    # Ljava/lang/String;
    .param p2, "event"    # Lorg/jivesoftware/smackx/packet/PEPEvent;

    .prologue
    .line 126
    const/4 v1, 0x0

    .line 127
    .local v1, "listeners":[Lorg/jivesoftware/smackx/PEPListener;
    iget-object v3, p0, Lorg/jivesoftware/smackx/PEPManager;->pepListeners:Ljava/util/List;

    monitor-enter v3

    .line 128
    :try_start_0
    iget-object v2, p0, Lorg/jivesoftware/smackx/PEPManager;->pepListeners:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    new-array v1, v2, [Lorg/jivesoftware/smackx/PEPListener;

    .line 129
    iget-object v2, p0, Lorg/jivesoftware/smackx/PEPManager;->pepListeners:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 130
    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 131
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v2, v1

    if-ge v0, v2, :cond_0

    .line 132
    aget-object v2, v1, v0

    invoke-interface {v2, p1, p2}, Lorg/jivesoftware/smackx/PEPListener;->eventReceived(Ljava/lang/String;Lorg/jivesoftware/smackx/packet/PEPEvent;)V

    .line 131
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 130
    .end local v0    # "i":I
    :catchall_0
    move-exception v2

    :try_start_1
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v2

    .line 134
    .restart local v0    # "i":I
    :cond_0
    return-void
.end method

.method private init()V
    .locals 3

    .prologue
    .line 138
    new-instance v0, Lorg/jivesoftware/smackx/PEPManager$1;

    invoke-direct {v0, p0}, Lorg/jivesoftware/smackx/PEPManager$1;-><init>(Lorg/jivesoftware/smackx/PEPManager;)V

    iput-object v0, p0, Lorg/jivesoftware/smackx/PEPManager;->packetListener:Lorg/jivesoftware/smack/PacketListener;

    .line 147
    iget-object v0, p0, Lorg/jivesoftware/smackx/PEPManager;->connection:Lorg/jivesoftware/smack/Connection;

    iget-object v1, p0, Lorg/jivesoftware/smackx/PEPManager;->packetListener:Lorg/jivesoftware/smack/PacketListener;

    iget-object v2, p0, Lorg/jivesoftware/smackx/PEPManager;->packetFilter:Lorg/jivesoftware/smack/filter/PacketFilter;

    invoke-virtual {v0, v1, v2}, Lorg/jivesoftware/smack/Connection;->addPacketListener(Lorg/jivesoftware/smack/PacketListener;Lorg/jivesoftware/smack/filter/PacketFilter;)V

    .line 148
    return-void
.end method


# virtual methods
.method public addPEPListener(Lorg/jivesoftware/smackx/PEPListener;)V
    .locals 2
    .param p1, "pepListener"    # Lorg/jivesoftware/smackx/PEPListener;

    .prologue
    .line 89
    iget-object v1, p0, Lorg/jivesoftware/smackx/PEPManager;->pepListeners:Ljava/util/List;

    monitor-enter v1

    .line 90
    :try_start_0
    iget-object v0, p0, Lorg/jivesoftware/smackx/PEPManager;->pepListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 91
    iget-object v0, p0, Lorg/jivesoftware/smackx/PEPManager;->pepListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 93
    :cond_0
    monitor-exit v1

    .line 94
    return-void

    .line 93
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
    .line 151
    iget-object v0, p0, Lorg/jivesoftware/smackx/PEPManager;->connection:Lorg/jivesoftware/smack/Connection;

    if-eqz v0, :cond_0

    .line 152
    iget-object v0, p0, Lorg/jivesoftware/smackx/PEPManager;->connection:Lorg/jivesoftware/smack/Connection;

    iget-object v1, p0, Lorg/jivesoftware/smackx/PEPManager;->packetListener:Lorg/jivesoftware/smack/PacketListener;

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smack/Connection;->removePacketListener(Lorg/jivesoftware/smack/PacketListener;)V

    .line 154
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
    .line 157
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/PEPManager;->destroy()V

    .line 158
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    .line 159
    return-void
.end method

.method public publish(Lorg/jivesoftware/smackx/packet/PEPItem;)V
    .locals 2
    .param p1, "item"    # Lorg/jivesoftware/smackx/packet/PEPItem;

    .prologue
    .line 114
    new-instance v0, Lorg/jivesoftware/smackx/packet/PEPPubSub;

    invoke-direct {v0, p1}, Lorg/jivesoftware/smackx/packet/PEPPubSub;-><init>(Lorg/jivesoftware/smackx/packet/PEPItem;)V

    .line 115
    .local v0, "pubSub":Lorg/jivesoftware/smackx/packet/PEPPubSub;
    sget-object v1, Lorg/jivesoftware/smack/packet/IQ$Type;->SET:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smackx/packet/PEPPubSub;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 119
    iget-object v1, p0, Lorg/jivesoftware/smackx/PEPManager;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v1, v0}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 120
    return-void
.end method

.method public removePEPListener(Lorg/jivesoftware/smackx/PEPListener;)V
    .locals 2
    .param p1, "pepListener"    # Lorg/jivesoftware/smackx/PEPListener;

    .prologue
    .line 102
    iget-object v1, p0, Lorg/jivesoftware/smackx/PEPManager;->pepListeners:Ljava/util/List;

    monitor-enter v1

    .line 103
    :try_start_0
    iget-object v0, p0, Lorg/jivesoftware/smackx/PEPManager;->pepListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 104
    monitor-exit v1

    .line 105
    return-void

    .line 104
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
