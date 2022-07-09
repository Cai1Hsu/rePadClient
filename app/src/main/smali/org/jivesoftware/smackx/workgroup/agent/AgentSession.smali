.class public Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;
.super Ljava/lang/Object;
.source "AgentSession.java"


# instance fields
.field private agent:Lorg/jivesoftware/smackx/workgroup/agent/Agent;

.field private agentRoster:Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster;

.field private connection:Lorg/jivesoftware/smack/Connection;

.field private final invitationListeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smackx/workgroup/WorkgroupInvitationListener;",
            ">;"
        }
    .end annotation
.end field

.field private maxChats:I

.field private final metaData:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field private final offerListeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smackx/workgroup/agent/OfferListener;",
            ">;"
        }
    .end annotation
.end field

.field private online:Z

.field private packetListener:Lorg/jivesoftware/smack/PacketListener;

.field private presenceMode:Lorg/jivesoftware/smack/packet/Presence$Mode;

.field private final queueUsersListeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smackx/workgroup/agent/QueueUsersListener;",
            ">;"
        }
    .end annotation
.end field

.field private queues:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue;",
            ">;"
        }
    .end annotation
.end field

.field private transcriptManager:Lorg/jivesoftware/smackx/workgroup/agent/TranscriptManager;

.field private transcriptSearchManager:Lorg/jivesoftware/smackx/workgroup/agent/TranscriptSearchManager;

.field private workgroupJID:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lorg/jivesoftware/smack/Connection;)V
    .locals 3
    .param p1, "workgroupJID"    # Ljava/lang/String;
    .param p2, "connection"    # Lorg/jivesoftware/smack/Connection;

    .prologue
    .line 87
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 61
    const/4 v1, 0x0

    iput-boolean v1, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->online:Z

    .line 72
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->agentRoster:Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster;

    .line 89
    invoke-virtual {p2}, Lorg/jivesoftware/smack/Connection;->isAuthenticated()Z

    move-result v1

    if-nez v1, :cond_0

    .line 90
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string/jumbo v2, "Must login to server before creating workgroup."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 93
    :cond_0
    iput-object p1, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->workgroupJID:Ljava/lang/String;

    .line 94
    iput-object p2, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->connection:Lorg/jivesoftware/smack/Connection;

    .line 95
    new-instance v1, Lorg/jivesoftware/smackx/workgroup/agent/TranscriptManager;

    invoke-direct {v1, p2}, Lorg/jivesoftware/smackx/workgroup/agent/TranscriptManager;-><init>(Lorg/jivesoftware/smack/Connection;)V

    iput-object v1, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->transcriptManager:Lorg/jivesoftware/smackx/workgroup/agent/TranscriptManager;

    .line 96
    new-instance v1, Lorg/jivesoftware/smackx/workgroup/agent/TranscriptSearchManager;

    invoke-direct {v1, p2}, Lorg/jivesoftware/smackx/workgroup/agent/TranscriptSearchManager;-><init>(Lorg/jivesoftware/smack/Connection;)V

    iput-object v1, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->transcriptSearchManager:Lorg/jivesoftware/smackx/workgroup/agent/TranscriptSearchManager;

    .line 98
    const/4 v1, -0x1

    iput v1, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->maxChats:I

    .line 100
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->metaData:Ljava/util/Map;

    .line 102
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->queues:Ljava/util/Map;

    .line 104
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->offerListeners:Ljava/util/List;

    .line 105
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->invitationListeners:Ljava/util/List;

    .line 106
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->queueUsersListeners:Ljava/util/List;

    .line 109
    new-instance v0, Lorg/jivesoftware/smack/filter/OrFilter;

    invoke-direct {v0}, Lorg/jivesoftware/smack/filter/OrFilter;-><init>()V

    .line 110
    .local v0, "filter":Lorg/jivesoftware/smack/filter/OrFilter;
    new-instance v1, Lorg/jivesoftware/smack/filter/PacketTypeFilter;

    const-class v2, Lorg/jivesoftware/smackx/workgroup/packet/OfferRequestProvider$OfferRequestPacket;

    invoke-direct {v1, v2}, Lorg/jivesoftware/smack/filter/PacketTypeFilter;-><init>(Ljava/lang/Class;)V

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smack/filter/OrFilter;->addFilter(Lorg/jivesoftware/smack/filter/PacketFilter;)V

    .line 111
    new-instance v1, Lorg/jivesoftware/smack/filter/PacketTypeFilter;

    const-class v2, Lorg/jivesoftware/smackx/workgroup/packet/OfferRevokeProvider$OfferRevokePacket;

    invoke-direct {v1, v2}, Lorg/jivesoftware/smack/filter/PacketTypeFilter;-><init>(Ljava/lang/Class;)V

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smack/filter/OrFilter;->addFilter(Lorg/jivesoftware/smack/filter/PacketFilter;)V

    .line 112
    new-instance v1, Lorg/jivesoftware/smack/filter/PacketTypeFilter;

    const-class v2, Lorg/jivesoftware/smack/packet/Presence;

    invoke-direct {v1, v2}, Lorg/jivesoftware/smack/filter/PacketTypeFilter;-><init>(Ljava/lang/Class;)V

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smack/filter/OrFilter;->addFilter(Lorg/jivesoftware/smack/filter/PacketFilter;)V

    .line 113
    new-instance v1, Lorg/jivesoftware/smack/filter/PacketTypeFilter;

    const-class v2, Lorg/jivesoftware/smack/packet/Message;

    invoke-direct {v1, v2}, Lorg/jivesoftware/smack/filter/PacketTypeFilter;-><init>(Ljava/lang/Class;)V

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smack/filter/OrFilter;->addFilter(Lorg/jivesoftware/smack/filter/PacketFilter;)V

    .line 115
    new-instance v1, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession$1;

    invoke-direct {v1, p0}, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession$1;-><init>(Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;)V

    iput-object v1, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->packetListener:Lorg/jivesoftware/smack/PacketListener;

    .line 125
    iget-object v1, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->packetListener:Lorg/jivesoftware/smack/PacketListener;

    invoke-virtual {p2, v1, v0}, Lorg/jivesoftware/smack/Connection;->addPacketListener(Lorg/jivesoftware/smack/PacketListener;Lorg/jivesoftware/smack/filter/PacketFilter;)V

    .line 127
    new-instance v1, Lorg/jivesoftware/smackx/workgroup/agent/Agent;

    invoke-direct {v1, p2, p1}, Lorg/jivesoftware/smackx/workgroup/agent/Agent;-><init>(Lorg/jivesoftware/smack/Connection;Ljava/lang/String;)V

    iput-object v1, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->agent:Lorg/jivesoftware/smackx/workgroup/agent/Agent;

    .line 128
    return-void
.end method

.method static synthetic access$000(Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;Lorg/jivesoftware/smack/packet/Packet;)V
    .locals 0
    .param p0, "x0"    # Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;
    .param p1, "x1"    # Lorg/jivesoftware/smack/packet/Packet;

    .prologue
    .line 55
    invoke-direct {p0, p1}, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->handlePacket(Lorg/jivesoftware/smack/packet/Packet;)V

    return-void
.end method

.method private fireInvitationEvent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V
    .locals 10
    .param p1, "groupChatJID"    # Ljava/lang/String;
    .param p2, "sessionID"    # Ljava/lang/String;
    .param p3, "body"    # Ljava/lang/String;
    .param p4, "from"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;>;)V"
        }
    .end annotation

    .prologue
    .line 647
    .local p5, "metaData":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    new-instance v0, Lorg/jivesoftware/smackx/workgroup/WorkgroupInvitation;

    iget-object v1, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v1}, Lorg/jivesoftware/smack/Connection;->getUser()Ljava/lang/String;

    move-result-object v1

    iget-object v3, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->workgroupJID:Ljava/lang/String;

    move-object v2, p1

    move-object v4, p2

    move-object v5, p3

    move-object v6, p4

    move-object v7, p5

    invoke-direct/range {v0 .. v7}, Lorg/jivesoftware/smackx/workgroup/WorkgroupInvitation;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 650
    .local v0, "invitation":Lorg/jivesoftware/smackx/workgroup/WorkgroupInvitation;
    iget-object v2, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->invitationListeners:Ljava/util/List;

    monitor-enter v2

    .line 651
    :try_start_0
    iget-object v1, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->invitationListeners:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    .local v8, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lorg/jivesoftware/smackx/workgroup/WorkgroupInvitationListener;

    .line 652
    .local v9, "listener":Lorg/jivesoftware/smackx/workgroup/WorkgroupInvitationListener;
    invoke-interface {v9, v0}, Lorg/jivesoftware/smackx/workgroup/WorkgroupInvitationListener;->invitationReceived(Lorg/jivesoftware/smackx/workgroup/WorkgroupInvitation;)V

    goto :goto_0

    .line 654
    .end local v8    # "i$":Ljava/util/Iterator;
    .end local v9    # "listener":Lorg/jivesoftware/smackx/workgroup/WorkgroupInvitationListener;
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .restart local v8    # "i$":Ljava/util/Iterator;
    :cond_0
    :try_start_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 655
    return-void
.end method

.method private fireOfferRequestEvent(Lorg/jivesoftware/smackx/workgroup/packet/OfferRequestProvider$OfferRequestPacket;)V
    .locals 14
    .param p1, "requestPacket"    # Lorg/jivesoftware/smackx/workgroup/packet/OfferRequestProvider$OfferRequestPacket;

    .prologue
    .line 622
    new-instance v0, Lorg/jivesoftware/smackx/workgroup/agent/Offer;

    iget-object v1, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {p1}, Lorg/jivesoftware/smackx/workgroup/packet/OfferRequestProvider$OfferRequestPacket;->getUserID()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1}, Lorg/jivesoftware/smackx/workgroup/packet/OfferRequestProvider$OfferRequestPacket;->getUserJID()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0}, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->getWorkgroupJID()Ljava/lang/String;

    move-result-object v5

    new-instance v6, Ljava/util/Date;

    new-instance v2, Ljava/util/Date;

    invoke-direct {v2}, Ljava/util/Date;-><init>()V

    invoke-virtual {v2}, Ljava/util/Date;->getTime()J

    move-result-wide v8

    invoke-virtual {p1}, Lorg/jivesoftware/smackx/workgroup/packet/OfferRequestProvider$OfferRequestPacket;->getTimeout()I

    move-result v2

    mul-int/lit16 v2, v2, 0x3e8

    int-to-long v12, v2

    add-long/2addr v8, v12

    invoke-direct {v6, v8, v9}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {p1}, Lorg/jivesoftware/smackx/workgroup/packet/OfferRequestProvider$OfferRequestPacket;->getSessionID()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p1}, Lorg/jivesoftware/smackx/workgroup/packet/OfferRequestProvider$OfferRequestPacket;->getMetaData()Ljava/util/Map;

    move-result-object v8

    invoke-virtual {p1}, Lorg/jivesoftware/smackx/workgroup/packet/OfferRequestProvider$OfferRequestPacket;->getContent()Lorg/jivesoftware/smackx/workgroup/agent/OfferContent;

    move-result-object v9

    move-object v2, p0

    invoke-direct/range {v0 .. v9}, Lorg/jivesoftware/smackx/workgroup/agent/Offer;-><init>(Lorg/jivesoftware/smack/Connection;Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Date;Ljava/lang/String;Ljava/util/Map;Lorg/jivesoftware/smackx/workgroup/agent/OfferContent;)V

    .line 627
    .local v0, "offer":Lorg/jivesoftware/smackx/workgroup/agent/Offer;
    iget-object v2, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->offerListeners:Ljava/util/List;

    monitor-enter v2

    .line 628
    :try_start_0
    iget-object v1, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->offerListeners:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v10

    .local v10, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lorg/jivesoftware/smackx/workgroup/agent/OfferListener;

    .line 629
    .local v11, "listener":Lorg/jivesoftware/smackx/workgroup/agent/OfferListener;
    invoke-interface {v11, v0}, Lorg/jivesoftware/smackx/workgroup/agent/OfferListener;->offerReceived(Lorg/jivesoftware/smackx/workgroup/agent/Offer;)V

    goto :goto_0

    .line 631
    .end local v10    # "i$":Ljava/util/Iterator;
    .end local v11    # "listener":Lorg/jivesoftware/smackx/workgroup/agent/OfferListener;
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .restart local v10    # "i$":Ljava/util/Iterator;
    :cond_0
    :try_start_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 632
    return-void
.end method

.method private fireOfferRevokeEvent(Lorg/jivesoftware/smackx/workgroup/packet/OfferRevokeProvider$OfferRevokePacket;)V
    .locals 9
    .param p1, "orp"    # Lorg/jivesoftware/smackx/workgroup/packet/OfferRevokeProvider$OfferRevokePacket;

    .prologue
    .line 635
    new-instance v0, Lorg/jivesoftware/smackx/workgroup/agent/RevokedOffer;

    invoke-virtual {p1}, Lorg/jivesoftware/smackx/workgroup/packet/OfferRevokeProvider$OfferRevokePacket;->getUserJID()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lorg/jivesoftware/smackx/workgroup/packet/OfferRevokeProvider$OfferRevokePacket;->getUserID()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0}, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->getWorkgroupJID()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1}, Lorg/jivesoftware/smackx/workgroup/packet/OfferRevokeProvider$OfferRevokePacket;->getSessionID()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1}, Lorg/jivesoftware/smackx/workgroup/packet/OfferRevokeProvider$OfferRevokePacket;->getReason()Ljava/lang/String;

    move-result-object v5

    new-instance v6, Ljava/util/Date;

    invoke-direct {v6}, Ljava/util/Date;-><init>()V

    invoke-direct/range {v0 .. v6}, Lorg/jivesoftware/smackx/workgroup/agent/RevokedOffer;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Date;)V

    .line 638
    .local v0, "revokedOffer":Lorg/jivesoftware/smackx/workgroup/agent/RevokedOffer;
    iget-object v2, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->offerListeners:Ljava/util/List;

    monitor-enter v2

    .line 639
    :try_start_0
    iget-object v1, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->offerListeners:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    .local v7, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lorg/jivesoftware/smackx/workgroup/agent/OfferListener;

    .line 640
    .local v8, "listener":Lorg/jivesoftware/smackx/workgroup/agent/OfferListener;
    invoke-interface {v8, v0}, Lorg/jivesoftware/smackx/workgroup/agent/OfferListener;->offerRevoked(Lorg/jivesoftware/smackx/workgroup/agent/RevokedOffer;)V

    goto :goto_0

    .line 642
    .end local v7    # "i$":Ljava/util/Iterator;
    .end local v8    # "listener":Lorg/jivesoftware/smackx/workgroup/agent/OfferListener;
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .restart local v7    # "i$":Ljava/util/Iterator;
    :cond_0
    :try_start_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 643
    return-void
.end method

.method private fireQueueUsersEvent(Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue;Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue$Status;ILjava/util/Date;Ljava/util/Set;)V
    .locals 4
    .param p1, "queue"    # Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue;
    .param p2, "status"    # Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue$Status;
    .param p3, "averageWaitTime"    # I
    .param p4, "oldestEntry"    # Ljava/util/Date;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue;",
            "Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue$Status;",
            "I",
            "Ljava/util/Date;",
            "Ljava/util/Set",
            "<",
            "Lorg/jivesoftware/smackx/workgroup/QueueUser;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 659
    .local p5, "users":Ljava/util/Set;, "Ljava/util/Set<Lorg/jivesoftware/smackx/workgroup/QueueUser;>;"
    iget-object v3, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->queueUsersListeners:Ljava/util/List;

    monitor-enter v3

    .line 660
    :try_start_0
    iget-object v2, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->queueUsersListeners:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jivesoftware/smackx/workgroup/agent/QueueUsersListener;

    .line 661
    .local v1, "listener":Lorg/jivesoftware/smackx/workgroup/agent/QueueUsersListener;
    if-eqz p2, :cond_1

    .line 662
    invoke-interface {v1, p1, p2}, Lorg/jivesoftware/smackx/workgroup/agent/QueueUsersListener;->statusUpdated(Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue;Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue$Status;)V

    .line 664
    :cond_1
    const/4 v2, -0x1

    if-eq p3, v2, :cond_2

    .line 665
    invoke-interface {v1, p1, p3}, Lorg/jivesoftware/smackx/workgroup/agent/QueueUsersListener;->averageWaitTimeUpdated(Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue;I)V

    .line 667
    :cond_2
    if-eqz p4, :cond_3

    .line 668
    invoke-interface {v1, p1, p4}, Lorg/jivesoftware/smackx/workgroup/agent/QueueUsersListener;->oldestEntryUpdated(Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue;Ljava/util/Date;)V

    .line 670
    :cond_3
    if-eqz p5, :cond_0

    .line 671
    invoke-interface {v1, p1, p5}, Lorg/jivesoftware/smackx/workgroup/agent/QueueUsersListener;->usersUpdated(Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue;Ljava/util/Set;)V

    goto :goto_0

    .line 674
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v1    # "listener":Lorg/jivesoftware/smackx/workgroup/agent/QueueUsersListener;
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2

    .restart local v0    # "i$":Ljava/util/Iterator;
    :cond_4
    :try_start_1
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 675
    return-void
.end method

.method private handlePacket(Lorg/jivesoftware/smack/packet/Packet;)V
    .locals 23
    .param p1, "packet"    # Lorg/jivesoftware/smack/packet/Packet;

    .prologue
    .line 680
    move-object/from16 v0, p1

    instance-of v2, v0, Lorg/jivesoftware/smackx/workgroup/packet/OfferRequestProvider$OfferRequestPacket;

    if-eqz v2, :cond_1

    .line 682
    new-instance v21, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession$2;

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession$2;-><init>(Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;)V

    .line 687
    .local v21, "reply":Lorg/jivesoftware/smack/packet/IQ;
    invoke-virtual/range {p1 .. p1}, Lorg/jivesoftware/smack/packet/Packet;->getPacketID()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, v21

    invoke-virtual {v0, v2}, Lorg/jivesoftware/smack/packet/IQ;->setPacketID(Ljava/lang/String;)V

    .line 688
    invoke-virtual/range {p1 .. p1}, Lorg/jivesoftware/smack/packet/Packet;->getFrom()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, v21

    invoke-virtual {v0, v2}, Lorg/jivesoftware/smack/packet/IQ;->setTo(Ljava/lang/String;)V

    .line 689
    sget-object v2, Lorg/jivesoftware/smack/packet/IQ$Type;->RESULT:Lorg/jivesoftware/smack/packet/IQ$Type;

    move-object/from16 v0, v21

    invoke-virtual {v0, v2}, Lorg/jivesoftware/smack/packet/IQ;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 690
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->connection:Lorg/jivesoftware/smack/Connection;

    move-object/from16 v0, v21

    invoke-virtual {v2, v0}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 692
    check-cast p1, Lorg/jivesoftware/smackx/workgroup/packet/OfferRequestProvider$OfferRequestPacket;

    .end local p1    # "packet":Lorg/jivesoftware/smack/packet/Packet;
    invoke-direct/range {p0 .. p1}, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->fireOfferRequestEvent(Lorg/jivesoftware/smackx/workgroup/packet/OfferRequestProvider$OfferRequestPacket;)V

    .line 789
    .end local v21    # "reply":Lorg/jivesoftware/smack/packet/IQ;
    :cond_0
    :goto_0
    return-void

    .line 694
    .restart local p1    # "packet":Lorg/jivesoftware/smack/packet/Packet;
    :cond_1
    move-object/from16 v0, p1

    instance-of v2, v0, Lorg/jivesoftware/smack/packet/Presence;

    if-eqz v2, :cond_6

    move-object/from16 v17, p1

    .line 695
    check-cast v17, Lorg/jivesoftware/smack/packet/Presence;

    .line 701
    .local v17, "presence":Lorg/jivesoftware/smack/packet/Presence;
    invoke-virtual/range {v17 .. v17}, Lorg/jivesoftware/smack/packet/Presence;->getFrom()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lorg/jivesoftware/smack/util/StringUtils;->parseResource(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    .line 702
    .local v19, "queueName":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->queues:Ljava/util/Map;

    move-object/from16 v0, v19

    invoke-interface {v2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue;

    .line 704
    .local v3, "queue":Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue;
    if-nez v3, :cond_2

    .line 705
    new-instance v3, Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue;

    .end local v3    # "queue":Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue;
    move-object/from16 v0, v19

    invoke-direct {v3, v0}, Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue;-><init>(Ljava/lang/String;)V

    .line 706
    .restart local v3    # "queue":Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue;
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->queues:Ljava/util/Map;

    move-object/from16 v0, v19

    invoke-interface {v2, v0, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 710
    :cond_2
    sget-object v2, Lorg/jivesoftware/smackx/workgroup/packet/QueueOverview;->ELEMENT_NAME:Ljava/lang/String;

    sget-object v4, Lorg/jivesoftware/smackx/workgroup/packet/QueueOverview;->NAMESPACE:Ljava/lang/String;

    move-object/from16 v0, v17

    invoke-virtual {v0, v2, v4}, Lorg/jivesoftware/smack/packet/Presence;->getExtension(Ljava/lang/String;Ljava/lang/String;)Lorg/jivesoftware/smack/packet/PacketExtension;

    move-result-object v20

    check-cast v20, Lorg/jivesoftware/smackx/workgroup/packet/QueueOverview;

    .line 711
    .local v20, "queueOverview":Lorg/jivesoftware/smackx/workgroup/packet/QueueOverview;
    if-eqz v20, :cond_4

    .line 712
    invoke-virtual/range {v20 .. v20}, Lorg/jivesoftware/smackx/workgroup/packet/QueueOverview;->getStatus()Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue$Status;

    move-result-object v2

    if-nez v2, :cond_3

    .line 713
    sget-object v2, Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue$Status;->CLOSED:Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue$Status;

    invoke-virtual {v3, v2}, Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue;->setStatus(Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue$Status;)V

    .line 718
    :goto_1
    invoke-virtual/range {v20 .. v20}, Lorg/jivesoftware/smackx/workgroup/packet/QueueOverview;->getAverageWaitTime()I

    move-result v2

    invoke-virtual {v3, v2}, Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue;->setAverageWaitTime(I)V

    .line 719
    invoke-virtual/range {v20 .. v20}, Lorg/jivesoftware/smackx/workgroup/packet/QueueOverview;->getOldestEntry()Ljava/util/Date;

    move-result-object v2

    invoke-virtual {v3, v2}, Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue;->setOldestEntry(Ljava/util/Date;)V

    .line 721
    invoke-virtual/range {v20 .. v20}, Lorg/jivesoftware/smackx/workgroup/packet/QueueOverview;->getStatus()Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue$Status;

    move-result-object v4

    invoke-virtual/range {v20 .. v20}, Lorg/jivesoftware/smackx/workgroup/packet/QueueOverview;->getAverageWaitTime()I

    move-result v5

    invoke-virtual/range {v20 .. v20}, Lorg/jivesoftware/smackx/workgroup/packet/QueueOverview;->getOldestEntry()Ljava/util/Date;

    move-result-object v6

    const/4 v7, 0x0

    move-object/from16 v2, p0

    invoke-direct/range {v2 .. v7}, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->fireQueueUsersEvent(Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue;Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue$Status;ILjava/util/Date;Ljava/util/Set;)V

    goto :goto_0

    .line 716
    :cond_3
    invoke-virtual/range {v20 .. v20}, Lorg/jivesoftware/smackx/workgroup/packet/QueueOverview;->getStatus()Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue$Status;

    move-result-object v2

    invoke-virtual {v3, v2}, Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue;->setStatus(Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue$Status;)V

    goto :goto_1

    .line 729
    :cond_4
    const-string/jumbo v2, "notify-queue-details"

    const-string/jumbo v4, "http://jabber.org/protocol/workgroup"

    move-object/from16 v0, p1

    invoke-virtual {v0, v2, v4}, Lorg/jivesoftware/smack/packet/Packet;->getExtension(Ljava/lang/String;Ljava/lang/String;)Lorg/jivesoftware/smack/packet/PacketExtension;

    move-result-object v18

    check-cast v18, Lorg/jivesoftware/smackx/workgroup/packet/QueueDetails;

    .line 730
    .local v18, "queueDetails":Lorg/jivesoftware/smackx/workgroup/packet/QueueDetails;
    if-eqz v18, :cond_5

    .line 731
    invoke-virtual/range {v18 .. v18}, Lorg/jivesoftware/smackx/workgroup/packet/QueueDetails;->getUsers()Ljava/util/Set;

    move-result-object v2

    invoke-virtual {v3, v2}, Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue;->setUsers(Ljava/util/Set;)V

    .line 733
    const/4 v4, 0x0

    const/4 v5, -0x1

    const/4 v6, 0x0

    invoke-virtual/range {v18 .. v18}, Lorg/jivesoftware/smackx/workgroup/packet/QueueDetails;->getUsers()Ljava/util/Set;

    move-result-object v7

    move-object/from16 v2, p0

    invoke-direct/range {v2 .. v7}, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->fireQueueUsersEvent(Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue;Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue$Status;ILjava/util/Date;Ljava/util/Set;)V

    goto/16 :goto_0

    .line 738
    :cond_5
    const-string/jumbo v2, "notify-agents"

    const-string/jumbo v4, "http://jabber.org/protocol/workgroup"

    move-object/from16 v0, v17

    invoke-virtual {v0, v2, v4}, Lorg/jivesoftware/smack/packet/Presence;->getExtension(Ljava/lang/String;Ljava/lang/String;)Lorg/jivesoftware/smack/packet/PacketExtension;

    move-result-object v16

    check-cast v16, Lorg/jivesoftware/smack/packet/DefaultPacketExtension;

    .line 739
    .local v16, "notifyAgents":Lorg/jivesoftware/smack/packet/DefaultPacketExtension;
    if-eqz v16, :cond_0

    .line 740
    const-string/jumbo v2, "current-chats"

    move-object/from16 v0, v16

    invoke-virtual {v0, v2}, Lorg/jivesoftware/smack/packet/DefaultPacketExtension;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v10

    .line 741
    .local v10, "currentChats":I
    const-string/jumbo v2, "max-chats"

    move-object/from16 v0, v16

    invoke-virtual {v0, v2}, Lorg/jivesoftware/smack/packet/DefaultPacketExtension;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v12

    .line 742
    .local v12, "maxChats":I
    invoke-virtual {v3, v10}, Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue;->setCurrentChats(I)V

    .line 743
    invoke-virtual {v3, v12}, Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue;->setMaxChats(I)V

    goto/16 :goto_0

    .line 749
    .end local v3    # "queue":Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue;
    .end local v10    # "currentChats":I
    .end local v12    # "maxChats":I
    .end local v16    # "notifyAgents":Lorg/jivesoftware/smack/packet/DefaultPacketExtension;
    .end local v17    # "presence":Lorg/jivesoftware/smack/packet/Presence;
    .end local v18    # "queueDetails":Lorg/jivesoftware/smackx/workgroup/packet/QueueDetails;
    .end local v19    # "queueName":Ljava/lang/String;
    .end local v20    # "queueOverview":Lorg/jivesoftware/smackx/workgroup/packet/QueueOverview;
    :cond_6
    move-object/from16 v0, p1

    instance-of v2, v0, Lorg/jivesoftware/smack/packet/Message;

    if-eqz v2, :cond_a

    move-object/from16 v13, p1

    .line 750
    check-cast v13, Lorg/jivesoftware/smack/packet/Message;

    .line 753
    .local v13, "message":Lorg/jivesoftware/smack/packet/Message;
    const-string/jumbo v2, "x"

    const-string/jumbo v4, "http://jabber.org/protocol/muc#user"

    invoke-virtual {v13, v2, v4}, Lorg/jivesoftware/smack/packet/Message;->getExtension(Ljava/lang/String;Ljava/lang/String;)Lorg/jivesoftware/smack/packet/PacketExtension;

    move-result-object v15

    check-cast v15, Lorg/jivesoftware/smackx/packet/MUCUser;

    .line 755
    .local v15, "mucUser":Lorg/jivesoftware/smackx/packet/MUCUser;
    if-eqz v15, :cond_9

    invoke-virtual {v15}, Lorg/jivesoftware/smackx/packet/MUCUser;->getInvite()Lorg/jivesoftware/smackx/packet/MUCUser$Invite;

    move-result-object v11

    .line 756
    .local v11, "invite":Lorg/jivesoftware/smackx/packet/MUCUser$Invite;
    :goto_2
    if-eqz v11, :cond_0

    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->workgroupJID:Ljava/lang/String;

    invoke-virtual {v11}, Lorg/jivesoftware/smackx/packet/MUCUser$Invite;->getFrom()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 757
    const/4 v6, 0x0

    .line 758
    .local v6, "sessionID":Ljava/lang/String;
    const/4 v9, 0x0

    .line 760
    .local v9, "metaData":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    const-string/jumbo v2, "session"

    const-string/jumbo v4, "http://jivesoftware.com/protocol/workgroup"

    invoke-virtual {v13, v2, v4}, Lorg/jivesoftware/smack/packet/Message;->getExtension(Ljava/lang/String;Ljava/lang/String;)Lorg/jivesoftware/smack/packet/PacketExtension;

    move-result-object v22

    check-cast v22, Lorg/jivesoftware/smackx/workgroup/packet/SessionID;

    .line 762
    .local v22, "sessionIDExt":Lorg/jivesoftware/smackx/workgroup/packet/SessionID;
    if-eqz v22, :cond_7

    .line 763
    invoke-virtual/range {v22 .. v22}, Lorg/jivesoftware/smackx/workgroup/packet/SessionID;->getSessionID()Ljava/lang/String;

    move-result-object v6

    .line 766
    :cond_7
    const-string/jumbo v2, "metadata"

    const-string/jumbo v4, "http://jivesoftware.com/protocol/workgroup"

    invoke-virtual {v13, v2, v4}, Lorg/jivesoftware/smack/packet/Message;->getExtension(Ljava/lang/String;Ljava/lang/String;)Lorg/jivesoftware/smack/packet/PacketExtension;

    move-result-object v14

    check-cast v14, Lorg/jivesoftware/smackx/workgroup/MetaData;

    .line 768
    .local v14, "metaDataExt":Lorg/jivesoftware/smackx/workgroup/MetaData;
    if-eqz v14, :cond_8

    .line 769
    invoke-virtual {v14}, Lorg/jivesoftware/smackx/workgroup/MetaData;->getMetaData()Ljava/util/Map;

    move-result-object v9

    .line 772
    :cond_8
    invoke-virtual {v13}, Lorg/jivesoftware/smack/packet/Message;->getFrom()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v13}, Lorg/jivesoftware/smack/packet/Message;->getBody()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v13}, Lorg/jivesoftware/smack/packet/Message;->getFrom()Ljava/lang/String;

    move-result-object v8

    move-object/from16 v4, p0

    invoke-direct/range {v4 .. v9}, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->fireInvitationEvent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    goto/16 :goto_0

    .line 755
    .end local v6    # "sessionID":Ljava/lang/String;
    .end local v9    # "metaData":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    .end local v11    # "invite":Lorg/jivesoftware/smackx/packet/MUCUser$Invite;
    .end local v14    # "metaDataExt":Lorg/jivesoftware/smackx/workgroup/MetaData;
    .end local v22    # "sessionIDExt":Lorg/jivesoftware/smackx/workgroup/packet/SessionID;
    :cond_9
    const/4 v11, 0x0

    goto :goto_2

    .line 776
    .end local v13    # "message":Lorg/jivesoftware/smack/packet/Message;
    .end local v15    # "mucUser":Lorg/jivesoftware/smackx/packet/MUCUser;
    :cond_a
    move-object/from16 v0, p1

    instance-of v2, v0, Lorg/jivesoftware/smackx/workgroup/packet/OfferRevokeProvider$OfferRevokePacket;

    if-eqz v2, :cond_0

    .line 778
    new-instance v21, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession$3;

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession$3;-><init>(Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;)V

    .line 783
    .restart local v21    # "reply":Lorg/jivesoftware/smack/packet/IQ;
    invoke-virtual/range {p1 .. p1}, Lorg/jivesoftware/smack/packet/Packet;->getPacketID()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, v21

    invoke-virtual {v0, v2}, Lorg/jivesoftware/smack/packet/IQ;->setPacketID(Ljava/lang/String;)V

    .line 784
    sget-object v2, Lorg/jivesoftware/smack/packet/IQ$Type;->RESULT:Lorg/jivesoftware/smack/packet/IQ$Type;

    move-object/from16 v0, v21

    invoke-virtual {v0, v2}, Lorg/jivesoftware/smack/packet/IQ;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 785
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->connection:Lorg/jivesoftware/smack/Connection;

    move-object/from16 v0, v21

    invoke-virtual {v2, v0}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 787
    check-cast p1, Lorg/jivesoftware/smackx/workgroup/packet/OfferRevokeProvider$OfferRevokePacket;

    .end local p1    # "packet":Lorg/jivesoftware/smack/packet/Packet;
    invoke-direct/range {p0 .. p1}, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->fireOfferRevokeEvent(Lorg/jivesoftware/smackx/workgroup/packet/OfferRevokeProvider$OfferRevokePacket;)V

    goto/16 :goto_0
.end method


# virtual methods
.method public addInvitationListener(Lorg/jivesoftware/smackx/workgroup/WorkgroupInvitationListener;)V
    .locals 2
    .param p1, "invitationListener"    # Lorg/jivesoftware/smackx/workgroup/WorkgroupInvitationListener;

    .prologue
    .line 603
    iget-object v1, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->invitationListeners:Ljava/util/List;

    monitor-enter v1

    .line 604
    :try_start_0
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->invitationListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 605
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->invitationListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 607
    :cond_0
    monitor-exit v1

    .line 608
    return-void

    .line 607
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public addOfferListener(Lorg/jivesoftware/smackx/workgroup/agent/OfferListener;)V
    .locals 2
    .param p1, "offerListener"    # Lorg/jivesoftware/smackx/workgroup/agent/OfferListener;

    .prologue
    .line 579
    iget-object v1, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->offerListeners:Ljava/util/List;

    monitor-enter v1

    .line 580
    :try_start_0
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->offerListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 581
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->offerListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 583
    :cond_0
    monitor-exit v1

    .line 584
    return-void

    .line 583
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public addQueueUsersListener(Lorg/jivesoftware/smackx/workgroup/agent/QueueUsersListener;)V
    .locals 2
    .param p1, "listener"    # Lorg/jivesoftware/smackx/workgroup/agent/QueueUsersListener;

    .prologue
    .line 560
    iget-object v1, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->queueUsersListeners:Ljava/util/List;

    monitor-enter v1

    .line 561
    :try_start_0
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->queueUsersListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 562
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->queueUsersListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 564
    :cond_0
    monitor-exit v1

    .line 565
    return-void

    .line 564
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public close()V
    .locals 2

    .prologue
    .line 135
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->connection:Lorg/jivesoftware/smack/Connection;

    iget-object v1, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->packetListener:Lorg/jivesoftware/smack/PacketListener;

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smack/Connection;->removePacketListener(Lorg/jivesoftware/smack/PacketListener;)V

    .line 136
    return-void
.end method

.method public dequeueUser(Ljava/lang/String;)V
    .locals 2
    .param p1, "userID"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 446
    new-instance v0, Lorg/jivesoftware/smackx/workgroup/packet/DepartQueuePacket;

    iget-object v1, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->workgroupJID:Ljava/lang/String;

    invoke-direct {v0, v1}, Lorg/jivesoftware/smackx/workgroup/packet/DepartQueuePacket;-><init>(Ljava/lang/String;)V

    .line 449
    .local v0, "departPacket":Lorg/jivesoftware/smackx/workgroup/packet/DepartQueuePacket;
    iget-object v1, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v1, v0}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 450
    return-void
.end method

.method public getAgent()Lorg/jivesoftware/smackx/workgroup/agent/Agent;
    .locals 1

    .prologue
    .line 544
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->agent:Lorg/jivesoftware/smackx/workgroup/agent/Agent;

    return-object v0
.end method

.method public getAgentHistory(Ljava/lang/String;ILjava/util/Date;)Lorg/jivesoftware/smackx/workgroup/ext/history/AgentChatHistory;
    .locals 6
    .param p1, "jid"    # Ljava/lang/String;
    .param p2, "maxSessions"    # I
    .param p3, "startDate"    # Ljava/util/Date;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 864
    if-eqz p3, :cond_0

    .line 865
    new-instance v1, Lorg/jivesoftware/smackx/workgroup/ext/history/AgentChatHistory;

    invoke-direct {v1, p1, p2, p3}, Lorg/jivesoftware/smackx/workgroup/ext/history/AgentChatHistory;-><init>(Ljava/lang/String;ILjava/util/Date;)V

    .line 871
    .local v1, "request":Lorg/jivesoftware/smackx/workgroup/ext/history/AgentChatHistory;
    :goto_0
    sget-object v3, Lorg/jivesoftware/smack/packet/IQ$Type;->GET:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {v1, v3}, Lorg/jivesoftware/smackx/workgroup/ext/history/AgentChatHistory;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 872
    iget-object v3, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->workgroupJID:Ljava/lang/String;

    invoke-virtual {v1, v3}, Lorg/jivesoftware/smackx/workgroup/ext/history/AgentChatHistory;->setTo(Ljava/lang/String;)V

    .line 874
    iget-object v3, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->connection:Lorg/jivesoftware/smack/Connection;

    new-instance v4, Lorg/jivesoftware/smack/filter/PacketIDFilter;

    invoke-virtual {v1}, Lorg/jivesoftware/smackx/workgroup/ext/history/AgentChatHistory;->getPacketID()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/jivesoftware/smack/filter/PacketIDFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v4}, Lorg/jivesoftware/smack/Connection;->createPacketCollector(Lorg/jivesoftware/smack/filter/PacketFilter;)Lorg/jivesoftware/smack/PacketCollector;

    move-result-object v0

    .line 875
    .local v0, "collector":Lorg/jivesoftware/smack/PacketCollector;
    iget-object v3, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v3, v1}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 877
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getPacketReplyTimeout()I

    move-result v3

    int-to-long v4, v3

    invoke-virtual {v0, v4, v5}, Lorg/jivesoftware/smack/PacketCollector;->nextResult(J)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v2

    check-cast v2, Lorg/jivesoftware/smackx/workgroup/ext/history/AgentChatHistory;

    .line 880
    .local v2, "response":Lorg/jivesoftware/smackx/workgroup/ext/history/AgentChatHistory;
    invoke-virtual {v0}, Lorg/jivesoftware/smack/PacketCollector;->cancel()V

    .line 881
    if-nez v2, :cond_1

    .line 882
    new-instance v3, Lorg/jivesoftware/smack/XMPPException;

    const-string/jumbo v4, "No response from server."

    invoke-direct {v3, v4}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 868
    .end local v0    # "collector":Lorg/jivesoftware/smack/PacketCollector;
    .end local v1    # "request":Lorg/jivesoftware/smackx/workgroup/ext/history/AgentChatHistory;
    .end local v2    # "response":Lorg/jivesoftware/smackx/workgroup/ext/history/AgentChatHistory;
    :cond_0
    new-instance v1, Lorg/jivesoftware/smackx/workgroup/ext/history/AgentChatHistory;

    invoke-direct {v1, p1, p2}, Lorg/jivesoftware/smackx/workgroup/ext/history/AgentChatHistory;-><init>(Ljava/lang/String;I)V

    .restart local v1    # "request":Lorg/jivesoftware/smackx/workgroup/ext/history/AgentChatHistory;
    goto :goto_0

    .line 884
    .restart local v0    # "collector":Lorg/jivesoftware/smack/PacketCollector;
    .restart local v2    # "response":Lorg/jivesoftware/smackx/workgroup/ext/history/AgentChatHistory;
    :cond_1
    invoke-virtual {v2}, Lorg/jivesoftware/smackx/workgroup/ext/history/AgentChatHistory;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v3

    if-eqz v3, :cond_2

    .line 885
    new-instance v3, Lorg/jivesoftware/smack/XMPPException;

    invoke-virtual {v2}, Lorg/jivesoftware/smackx/workgroup/ext/history/AgentChatHistory;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/jivesoftware/smack/XMPPException;-><init>(Lorg/jivesoftware/smack/packet/XMPPError;)V

    throw v3

    .line 887
    :cond_2
    return-object v2
.end method

.method public getAgentRoster()Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster;
    .locals 4

    .prologue
    .line 144
    iget-object v1, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->agentRoster:Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster;

    if-nez v1, :cond_0

    .line 145
    new-instance v1, Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster;

    iget-object v2, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->connection:Lorg/jivesoftware/smack/Connection;

    iget-object v3, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->workgroupJID:Ljava/lang/String;

    invoke-direct {v1, v2, v3}, Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster;-><init>(Lorg/jivesoftware/smack/Connection;Ljava/lang/String;)V

    iput-object v1, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->agentRoster:Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster;

    .line 153
    :cond_0
    const/4 v0, 0x0

    .line 154
    .local v0, "elapsed":I
    :goto_0
    iget-object v1, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->agentRoster:Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster;

    iget-boolean v1, v1, Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster;->rosterInitialized:Z

    if-nez v1, :cond_1

    const/16 v1, 0x7d0

    if-gt v0, v1, :cond_1

    .line 156
    const-wide/16 v2, 0x1f4

    :try_start_0
    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 161
    :goto_1
    add-int/lit16 v0, v0, 0x1f4

    goto :goto_0

    .line 163
    :cond_1
    iget-object v1, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->agentRoster:Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster;

    return-object v1

    .line 158
    :catch_0
    move-exception v1

    goto :goto_1
.end method

.method public getChatMetadata(Ljava/lang/String;)Ljava/util/Map;
    .locals 6
    .param p1, "sessionID"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 985
    new-instance v1, Lorg/jivesoftware/smackx/workgroup/ext/history/ChatMetadata;

    invoke-direct {v1}, Lorg/jivesoftware/smackx/workgroup/ext/history/ChatMetadata;-><init>()V

    .line 986
    .local v1, "request":Lorg/jivesoftware/smackx/workgroup/ext/history/ChatMetadata;
    sget-object v3, Lorg/jivesoftware/smack/packet/IQ$Type;->GET:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {v1, v3}, Lorg/jivesoftware/smackx/workgroup/ext/history/ChatMetadata;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 987
    iget-object v3, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->workgroupJID:Ljava/lang/String;

    invoke-virtual {v1, v3}, Lorg/jivesoftware/smackx/workgroup/ext/history/ChatMetadata;->setTo(Ljava/lang/String;)V

    .line 988
    invoke-virtual {v1, p1}, Lorg/jivesoftware/smackx/workgroup/ext/history/ChatMetadata;->setSessionID(Ljava/lang/String;)V

    .line 990
    iget-object v3, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->connection:Lorg/jivesoftware/smack/Connection;

    new-instance v4, Lorg/jivesoftware/smack/filter/PacketIDFilter;

    invoke-virtual {v1}, Lorg/jivesoftware/smackx/workgroup/ext/history/ChatMetadata;->getPacketID()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/jivesoftware/smack/filter/PacketIDFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v4}, Lorg/jivesoftware/smack/Connection;->createPacketCollector(Lorg/jivesoftware/smack/filter/PacketFilter;)Lorg/jivesoftware/smack/PacketCollector;

    move-result-object v0

    .line 991
    .local v0, "collector":Lorg/jivesoftware/smack/PacketCollector;
    iget-object v3, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v3, v1}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 994
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getPacketReplyTimeout()I

    move-result v3

    int-to-long v4, v3

    invoke-virtual {v0, v4, v5}, Lorg/jivesoftware/smack/PacketCollector;->nextResult(J)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v2

    check-cast v2, Lorg/jivesoftware/smackx/workgroup/ext/history/ChatMetadata;

    .line 997
    .local v2, "response":Lorg/jivesoftware/smackx/workgroup/ext/history/ChatMetadata;
    invoke-virtual {v0}, Lorg/jivesoftware/smack/PacketCollector;->cancel()V

    .line 998
    if-nez v2, :cond_0

    .line 999
    new-instance v3, Lorg/jivesoftware/smack/XMPPException;

    const-string/jumbo v4, "No response from server."

    invoke-direct {v3, v4}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 1001
    :cond_0
    invoke-virtual {v2}, Lorg/jivesoftware/smackx/workgroup/ext/history/ChatMetadata;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 1002
    new-instance v3, Lorg/jivesoftware/smack/XMPPException;

    invoke-virtual {v2}, Lorg/jivesoftware/smackx/workgroup/ext/history/ChatMetadata;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/jivesoftware/smack/XMPPException;-><init>(Lorg/jivesoftware/smack/packet/XMPPError;)V

    throw v3

    .line 1004
    :cond_1
    invoke-virtual {v2}, Lorg/jivesoftware/smackx/workgroup/ext/history/ChatMetadata;->getMetadata()Ljava/util/Map;

    move-result-object v3

    return-object v3
.end method

.method public getGenericSettings(Lorg/jivesoftware/smack/Connection;Ljava/lang/String;)Lorg/jivesoftware/smackx/workgroup/settings/GenericSettings;
    .locals 6
    .param p1, "con"    # Lorg/jivesoftware/smack/Connection;
    .param p2, "query"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 1122
    new-instance v2, Lorg/jivesoftware/smackx/workgroup/settings/GenericSettings;

    invoke-direct {v2}, Lorg/jivesoftware/smackx/workgroup/settings/GenericSettings;-><init>()V

    .line 1123
    .local v2, "setting":Lorg/jivesoftware/smackx/workgroup/settings/GenericSettings;
    sget-object v3, Lorg/jivesoftware/smack/packet/IQ$Type;->GET:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {v2, v3}, Lorg/jivesoftware/smackx/workgroup/settings/GenericSettings;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 1124
    iget-object v3, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->workgroupJID:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lorg/jivesoftware/smackx/workgroup/settings/GenericSettings;->setTo(Ljava/lang/String;)V

    .line 1126
    iget-object v3, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->connection:Lorg/jivesoftware/smack/Connection;

    new-instance v4, Lorg/jivesoftware/smack/filter/PacketIDFilter;

    invoke-virtual {v2}, Lorg/jivesoftware/smackx/workgroup/settings/GenericSettings;->getPacketID()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/jivesoftware/smack/filter/PacketIDFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v4}, Lorg/jivesoftware/smack/Connection;->createPacketCollector(Lorg/jivesoftware/smack/filter/PacketFilter;)Lorg/jivesoftware/smack/PacketCollector;

    move-result-object v0

    .line 1127
    .local v0, "collector":Lorg/jivesoftware/smack/PacketCollector;
    iget-object v3, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v3, v2}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 1129
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getPacketReplyTimeout()I

    move-result v3

    int-to-long v4, v3

    invoke-virtual {v0, v4, v5}, Lorg/jivesoftware/smack/PacketCollector;->nextResult(J)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v1

    check-cast v1, Lorg/jivesoftware/smackx/workgroup/settings/GenericSettings;

    .line 1132
    .local v1, "response":Lorg/jivesoftware/smackx/workgroup/settings/GenericSettings;
    invoke-virtual {v0}, Lorg/jivesoftware/smack/PacketCollector;->cancel()V

    .line 1133
    if-nez v1, :cond_0

    .line 1134
    new-instance v3, Lorg/jivesoftware/smack/XMPPException;

    const-string/jumbo v4, "No response from server on status set."

    invoke-direct {v3, v4}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 1136
    :cond_0
    invoke-virtual {v1}, Lorg/jivesoftware/smackx/workgroup/settings/GenericSettings;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 1137
    new-instance v3, Lorg/jivesoftware/smack/XMPPException;

    invoke-virtual {v1}, Lorg/jivesoftware/smackx/workgroup/settings/GenericSettings;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/jivesoftware/smack/XMPPException;-><init>(Lorg/jivesoftware/smack/packet/XMPPError;)V

    throw v3

    .line 1139
    :cond_1
    return-object v1
.end method

.method public getMacros(Z)Lorg/jivesoftware/smackx/workgroup/ext/macros/MacroGroup;
    .locals 6
    .param p1, "global"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 926
    new-instance v1, Lorg/jivesoftware/smackx/workgroup/ext/macros/Macros;

    invoke-direct {v1}, Lorg/jivesoftware/smackx/workgroup/ext/macros/Macros;-><init>()V

    .line 927
    .local v1, "request":Lorg/jivesoftware/smackx/workgroup/ext/macros/Macros;
    sget-object v3, Lorg/jivesoftware/smack/packet/IQ$Type;->GET:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {v1, v3}, Lorg/jivesoftware/smackx/workgroup/ext/macros/Macros;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 928
    iget-object v3, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->workgroupJID:Ljava/lang/String;

    invoke-virtual {v1, v3}, Lorg/jivesoftware/smackx/workgroup/ext/macros/Macros;->setTo(Ljava/lang/String;)V

    .line 929
    if-nez p1, :cond_0

    const/4 v3, 0x1

    :goto_0
    invoke-virtual {v1, v3}, Lorg/jivesoftware/smackx/workgroup/ext/macros/Macros;->setPersonal(Z)V

    .line 931
    iget-object v3, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->connection:Lorg/jivesoftware/smack/Connection;

    new-instance v4, Lorg/jivesoftware/smack/filter/PacketIDFilter;

    invoke-virtual {v1}, Lorg/jivesoftware/smackx/workgroup/ext/macros/Macros;->getPacketID()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/jivesoftware/smack/filter/PacketIDFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v4}, Lorg/jivesoftware/smack/Connection;->createPacketCollector(Lorg/jivesoftware/smack/filter/PacketFilter;)Lorg/jivesoftware/smack/PacketCollector;

    move-result-object v0

    .line 932
    .local v0, "collector":Lorg/jivesoftware/smack/PacketCollector;
    iget-object v3, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v3, v1}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 935
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getPacketReplyTimeout()I

    move-result v3

    int-to-long v4, v3

    invoke-virtual {v0, v4, v5}, Lorg/jivesoftware/smack/PacketCollector;->nextResult(J)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v2

    check-cast v2, Lorg/jivesoftware/smackx/workgroup/ext/macros/Macros;

    .line 938
    .local v2, "response":Lorg/jivesoftware/smackx/workgroup/ext/macros/Macros;
    invoke-virtual {v0}, Lorg/jivesoftware/smack/PacketCollector;->cancel()V

    .line 939
    if-nez v2, :cond_1

    .line 940
    new-instance v3, Lorg/jivesoftware/smack/XMPPException;

    const-string/jumbo v4, "No response from server."

    invoke-direct {v3, v4}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 929
    .end local v0    # "collector":Lorg/jivesoftware/smack/PacketCollector;
    .end local v2    # "response":Lorg/jivesoftware/smackx/workgroup/ext/macros/Macros;
    :cond_0
    const/4 v3, 0x0

    goto :goto_0

    .line 942
    .restart local v0    # "collector":Lorg/jivesoftware/smack/PacketCollector;
    .restart local v2    # "response":Lorg/jivesoftware/smackx/workgroup/ext/macros/Macros;
    :cond_1
    invoke-virtual {v2}, Lorg/jivesoftware/smackx/workgroup/ext/macros/Macros;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v3

    if-eqz v3, :cond_2

    .line 943
    new-instance v3, Lorg/jivesoftware/smack/XMPPException;

    invoke-virtual {v2}, Lorg/jivesoftware/smackx/workgroup/ext/macros/Macros;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/jivesoftware/smack/XMPPException;-><init>(Lorg/jivesoftware/smack/packet/XMPPError;)V

    throw v3

    .line 945
    :cond_2
    invoke-virtual {v2}, Lorg/jivesoftware/smackx/workgroup/ext/macros/Macros;->getRootGroup()Lorg/jivesoftware/smackx/workgroup/ext/macros/MacroGroup;

    move-result-object v3

    return-object v3
.end method

.method public getMaxChats()I
    .locals 1

    .prologue
    .line 181
    iget v0, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->maxChats:I

    return v0
.end method

.method public getMetaData(Ljava/lang/String;)Ljava/util/List;
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 238
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->metaData:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    return-object v0
.end method

.method public getNote(Ljava/lang/String;)Lorg/jivesoftware/smackx/workgroup/ext/notes/ChatNotes;
    .locals 6
    .param p1, "sessionID"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 831
    new-instance v1, Lorg/jivesoftware/smackx/workgroup/ext/notes/ChatNotes;

    invoke-direct {v1}, Lorg/jivesoftware/smackx/workgroup/ext/notes/ChatNotes;-><init>()V

    .line 832
    .local v1, "request":Lorg/jivesoftware/smackx/workgroup/ext/notes/ChatNotes;
    sget-object v3, Lorg/jivesoftware/smack/packet/IQ$Type;->GET:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {v1, v3}, Lorg/jivesoftware/smackx/workgroup/ext/notes/ChatNotes;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 833
    iget-object v3, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->workgroupJID:Ljava/lang/String;

    invoke-virtual {v1, v3}, Lorg/jivesoftware/smackx/workgroup/ext/notes/ChatNotes;->setTo(Ljava/lang/String;)V

    .line 834
    invoke-virtual {v1, p1}, Lorg/jivesoftware/smackx/workgroup/ext/notes/ChatNotes;->setSessionID(Ljava/lang/String;)V

    .line 836
    iget-object v3, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->connection:Lorg/jivesoftware/smack/Connection;

    new-instance v4, Lorg/jivesoftware/smack/filter/PacketIDFilter;

    invoke-virtual {v1}, Lorg/jivesoftware/smackx/workgroup/ext/notes/ChatNotes;->getPacketID()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/jivesoftware/smack/filter/PacketIDFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v4}, Lorg/jivesoftware/smack/Connection;->createPacketCollector(Lorg/jivesoftware/smack/filter/PacketFilter;)Lorg/jivesoftware/smack/PacketCollector;

    move-result-object v0

    .line 837
    .local v0, "collector":Lorg/jivesoftware/smack/PacketCollector;
    iget-object v3, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v3, v1}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 839
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getPacketReplyTimeout()I

    move-result v3

    int-to-long v4, v3

    invoke-virtual {v0, v4, v5}, Lorg/jivesoftware/smack/PacketCollector;->nextResult(J)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v2

    check-cast v2, Lorg/jivesoftware/smackx/workgroup/ext/notes/ChatNotes;

    .line 842
    .local v2, "response":Lorg/jivesoftware/smackx/workgroup/ext/notes/ChatNotes;
    invoke-virtual {v0}, Lorg/jivesoftware/smack/PacketCollector;->cancel()V

    .line 843
    if-nez v2, :cond_0

    .line 844
    new-instance v3, Lorg/jivesoftware/smack/XMPPException;

    const-string/jumbo v4, "No response from server."

    invoke-direct {v3, v4}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 846
    :cond_0
    invoke-virtual {v2}, Lorg/jivesoftware/smackx/workgroup/ext/notes/ChatNotes;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 847
    new-instance v3, Lorg/jivesoftware/smack/XMPPException;

    invoke-virtual {v2}, Lorg/jivesoftware/smackx/workgroup/ext/notes/ChatNotes;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/jivesoftware/smack/XMPPException;-><init>(Lorg/jivesoftware/smack/packet/XMPPError;)V

    throw v3

    .line 849
    :cond_1
    return-object v2
.end method

.method public getOccupantsInfo(Ljava/lang/String;)Lorg/jivesoftware/smackx/workgroup/packet/OccupantsInfo;
    .locals 6
    .param p1, "roomID"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 511
    new-instance v1, Lorg/jivesoftware/smackx/workgroup/packet/OccupantsInfo;

    invoke-direct {v1, p1}, Lorg/jivesoftware/smackx/workgroup/packet/OccupantsInfo;-><init>(Ljava/lang/String;)V

    .line 512
    .local v1, "request":Lorg/jivesoftware/smackx/workgroup/packet/OccupantsInfo;
    sget-object v3, Lorg/jivesoftware/smack/packet/IQ$Type;->GET:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {v1, v3}, Lorg/jivesoftware/smackx/workgroup/packet/OccupantsInfo;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 513
    iget-object v3, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->workgroupJID:Ljava/lang/String;

    invoke-virtual {v1, v3}, Lorg/jivesoftware/smackx/workgroup/packet/OccupantsInfo;->setTo(Ljava/lang/String;)V

    .line 515
    iget-object v3, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->connection:Lorg/jivesoftware/smack/Connection;

    new-instance v4, Lorg/jivesoftware/smack/filter/PacketIDFilter;

    invoke-virtual {v1}, Lorg/jivesoftware/smackx/workgroup/packet/OccupantsInfo;->getPacketID()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/jivesoftware/smack/filter/PacketIDFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v4}, Lorg/jivesoftware/smack/Connection;->createPacketCollector(Lorg/jivesoftware/smack/filter/PacketFilter;)Lorg/jivesoftware/smack/PacketCollector;

    move-result-object v0

    .line 516
    .local v0, "collector":Lorg/jivesoftware/smack/PacketCollector;
    iget-object v3, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v3, v1}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 518
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getPacketReplyTimeout()I

    move-result v3

    int-to-long v4, v3

    invoke-virtual {v0, v4, v5}, Lorg/jivesoftware/smack/PacketCollector;->nextResult(J)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v2

    check-cast v2, Lorg/jivesoftware/smackx/workgroup/packet/OccupantsInfo;

    .line 521
    .local v2, "response":Lorg/jivesoftware/smackx/workgroup/packet/OccupantsInfo;
    invoke-virtual {v0}, Lorg/jivesoftware/smack/PacketCollector;->cancel()V

    .line 522
    if-nez v2, :cond_0

    .line 523
    new-instance v3, Lorg/jivesoftware/smack/XMPPException;

    const-string/jumbo v4, "No response from server."

    invoke-direct {v3, v4}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 525
    :cond_0
    invoke-virtual {v2}, Lorg/jivesoftware/smackx/workgroup/packet/OccupantsInfo;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 526
    new-instance v3, Lorg/jivesoftware/smack/XMPPException;

    invoke-virtual {v2}, Lorg/jivesoftware/smackx/workgroup/packet/OccupantsInfo;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/jivesoftware/smack/XMPPException;-><init>(Lorg/jivesoftware/smack/packet/XMPPError;)V

    throw v3

    .line 528
    :cond_1
    return-object v2
.end method

.method public getPresenceMode()Lorg/jivesoftware/smack/packet/Presence$Mode;
    .locals 1

    .prologue
    .line 172
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->presenceMode:Lorg/jivesoftware/smack/packet/Presence$Mode;

    return-object v0
.end method

.method public getQueue(Ljava/lang/String;)Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue;
    .locals 1
    .param p1, "queueName"    # Ljava/lang/String;

    .prologue
    .line 552
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->queues:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue;

    return-object v0
.end method

.method public getQueues()Ljava/util/Iterator;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<",
            "Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue;",
            ">;"
        }
    .end annotation

    .prologue
    .line 556
    new-instance v0, Ljava/util/HashMap;

    iget-object v1, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->queues:Ljava/util/Map;

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method public getSearchSettings()Lorg/jivesoftware/smackx/workgroup/settings/SearchSettings;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 897
    new-instance v1, Lorg/jivesoftware/smackx/workgroup/settings/SearchSettings;

    invoke-direct {v1}, Lorg/jivesoftware/smackx/workgroup/settings/SearchSettings;-><init>()V

    .line 898
    .local v1, "request":Lorg/jivesoftware/smackx/workgroup/settings/SearchSettings;
    sget-object v3, Lorg/jivesoftware/smack/packet/IQ$Type;->GET:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {v1, v3}, Lorg/jivesoftware/smackx/workgroup/settings/SearchSettings;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 899
    iget-object v3, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->workgroupJID:Ljava/lang/String;

    invoke-virtual {v1, v3}, Lorg/jivesoftware/smackx/workgroup/settings/SearchSettings;->setTo(Ljava/lang/String;)V

    .line 901
    iget-object v3, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->connection:Lorg/jivesoftware/smack/Connection;

    new-instance v4, Lorg/jivesoftware/smack/filter/PacketIDFilter;

    invoke-virtual {v1}, Lorg/jivesoftware/smackx/workgroup/settings/SearchSettings;->getPacketID()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/jivesoftware/smack/filter/PacketIDFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v4}, Lorg/jivesoftware/smack/Connection;->createPacketCollector(Lorg/jivesoftware/smack/filter/PacketFilter;)Lorg/jivesoftware/smack/PacketCollector;

    move-result-object v0

    .line 902
    .local v0, "collector":Lorg/jivesoftware/smack/PacketCollector;
    iget-object v3, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v3, v1}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 905
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getPacketReplyTimeout()I

    move-result v3

    int-to-long v4, v3

    invoke-virtual {v0, v4, v5}, Lorg/jivesoftware/smack/PacketCollector;->nextResult(J)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v2

    check-cast v2, Lorg/jivesoftware/smackx/workgroup/settings/SearchSettings;

    .line 908
    .local v2, "response":Lorg/jivesoftware/smackx/workgroup/settings/SearchSettings;
    invoke-virtual {v0}, Lorg/jivesoftware/smack/PacketCollector;->cancel()V

    .line 909
    if-nez v2, :cond_0

    .line 910
    new-instance v3, Lorg/jivesoftware/smack/XMPPException;

    const-string/jumbo v4, "No response from server."

    invoke-direct {v3, v4}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 912
    :cond_0
    invoke-virtual {v2}, Lorg/jivesoftware/smackx/workgroup/settings/SearchSettings;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 913
    new-instance v3, Lorg/jivesoftware/smack/XMPPException;

    invoke-virtual {v2}, Lorg/jivesoftware/smackx/workgroup/settings/SearchSettings;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/jivesoftware/smack/XMPPException;-><init>(Lorg/jivesoftware/smack/packet/XMPPError;)V

    throw v3

    .line 915
    :cond_1
    return-object v2
.end method

.method public getTranscript(Ljava/lang/String;)Lorg/jivesoftware/smackx/workgroup/packet/Transcript;
    .locals 2
    .param p1, "sessionID"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 472
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->transcriptManager:Lorg/jivesoftware/smackx/workgroup/agent/TranscriptManager;

    iget-object v1, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->workgroupJID:Ljava/lang/String;

    invoke-virtual {v0, v1, p1}, Lorg/jivesoftware/smackx/workgroup/agent/TranscriptManager;->getTranscript(Ljava/lang/String;Ljava/lang/String;)Lorg/jivesoftware/smackx/workgroup/packet/Transcript;

    move-result-object v0

    return-object v0
.end method

.method public getTranscriptSearchForm()Lorg/jivesoftware/smackx/Form;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 484
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->transcriptSearchManager:Lorg/jivesoftware/smackx/workgroup/agent/TranscriptSearchManager;

    iget-object v1, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->workgroupJID:Ljava/lang/String;

    invoke-static {v1}, Lorg/jivesoftware/smack/util/StringUtils;->parseServer(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smackx/workgroup/agent/TranscriptSearchManager;->getSearchForm(Ljava/lang/String;)Lorg/jivesoftware/smackx/Form;

    move-result-object v0

    return-object v0
.end method

.method public getTranscripts(Ljava/lang/String;)Lorg/jivesoftware/smackx/workgroup/packet/Transcripts;
    .locals 2
    .param p1, "userID"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 461
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->transcriptManager:Lorg/jivesoftware/smackx/workgroup/agent/TranscriptManager;

    iget-object v1, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->workgroupJID:Ljava/lang/String;

    invoke-virtual {v0, v1, p1}, Lorg/jivesoftware/smackx/workgroup/agent/TranscriptManager;->getTranscripts(Ljava/lang/String;Ljava/lang/String;)Lorg/jivesoftware/smackx/workgroup/packet/Transcripts;

    move-result-object v0

    return-object v0
.end method

.method public getWorkgroupJID()Ljava/lang/String;
    .locals 1

    .prologue
    .line 535
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->workgroupJID:Ljava/lang/String;

    return-object v0
.end method

.method public hasMonitorPrivileges(Lorg/jivesoftware/smack/Connection;)Z
    .locals 6
    .param p1, "con"    # Lorg/jivesoftware/smack/Connection;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 1143
    new-instance v1, Lorg/jivesoftware/smackx/workgroup/packet/MonitorPacket;

    invoke-direct {v1}, Lorg/jivesoftware/smackx/workgroup/packet/MonitorPacket;-><init>()V

    .line 1144
    .local v1, "request":Lorg/jivesoftware/smackx/workgroup/packet/MonitorPacket;
    sget-object v3, Lorg/jivesoftware/smack/packet/IQ$Type;->GET:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {v1, v3}, Lorg/jivesoftware/smackx/workgroup/packet/MonitorPacket;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 1145
    iget-object v3, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->workgroupJID:Ljava/lang/String;

    invoke-virtual {v1, v3}, Lorg/jivesoftware/smackx/workgroup/packet/MonitorPacket;->setTo(Ljava/lang/String;)V

    .line 1147
    iget-object v3, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->connection:Lorg/jivesoftware/smack/Connection;

    new-instance v4, Lorg/jivesoftware/smack/filter/PacketIDFilter;

    invoke-virtual {v1}, Lorg/jivesoftware/smackx/workgroup/packet/MonitorPacket;->getPacketID()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/jivesoftware/smack/filter/PacketIDFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v4}, Lorg/jivesoftware/smack/Connection;->createPacketCollector(Lorg/jivesoftware/smack/filter/PacketFilter;)Lorg/jivesoftware/smack/PacketCollector;

    move-result-object v0

    .line 1148
    .local v0, "collector":Lorg/jivesoftware/smack/PacketCollector;
    iget-object v3, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v3, v1}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 1150
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getPacketReplyTimeout()I

    move-result v3

    int-to-long v4, v3

    invoke-virtual {v0, v4, v5}, Lorg/jivesoftware/smack/PacketCollector;->nextResult(J)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v2

    check-cast v2, Lorg/jivesoftware/smackx/workgroup/packet/MonitorPacket;

    .line 1153
    .local v2, "response":Lorg/jivesoftware/smackx/workgroup/packet/MonitorPacket;
    invoke-virtual {v0}, Lorg/jivesoftware/smack/PacketCollector;->cancel()V

    .line 1154
    if-nez v2, :cond_0

    .line 1155
    new-instance v3, Lorg/jivesoftware/smack/XMPPException;

    const-string/jumbo v4, "No response from server on status set."

    invoke-direct {v3, v4}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 1157
    :cond_0
    invoke-virtual {v2}, Lorg/jivesoftware/smackx/workgroup/packet/MonitorPacket;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 1158
    new-instance v3, Lorg/jivesoftware/smack/XMPPException;

    invoke-virtual {v2}, Lorg/jivesoftware/smackx/workgroup/packet/MonitorPacket;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/jivesoftware/smack/XMPPException;-><init>(Lorg/jivesoftware/smack/packet/XMPPError;)V

    throw v3

    .line 1160
    :cond_1
    invoke-virtual {v2}, Lorg/jivesoftware/smackx/workgroup/packet/MonitorPacket;->isMonitor()Z

    move-result v3

    return v3
.end method

.method public isOnline()Z
    .locals 1

    .prologue
    .line 190
    iget-boolean v0, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->online:Z

    return v0
.end method

.method public makeRoomOwner(Lorg/jivesoftware/smack/Connection;Ljava/lang/String;)V
    .locals 6
    .param p1, "con"    # Lorg/jivesoftware/smack/Connection;
    .param p2, "sessionID"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 1165
    new-instance v1, Lorg/jivesoftware/smackx/workgroup/packet/MonitorPacket;

    invoke-direct {v1}, Lorg/jivesoftware/smackx/workgroup/packet/MonitorPacket;-><init>()V

    .line 1166
    .local v1, "request":Lorg/jivesoftware/smackx/workgroup/packet/MonitorPacket;
    sget-object v3, Lorg/jivesoftware/smack/packet/IQ$Type;->SET:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {v1, v3}, Lorg/jivesoftware/smackx/workgroup/packet/MonitorPacket;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 1167
    iget-object v3, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->workgroupJID:Ljava/lang/String;

    invoke-virtual {v1, v3}, Lorg/jivesoftware/smackx/workgroup/packet/MonitorPacket;->setTo(Ljava/lang/String;)V

    .line 1168
    invoke-virtual {v1, p2}, Lorg/jivesoftware/smackx/workgroup/packet/MonitorPacket;->setSessionID(Ljava/lang/String;)V

    .line 1171
    iget-object v3, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->connection:Lorg/jivesoftware/smack/Connection;

    new-instance v4, Lorg/jivesoftware/smack/filter/PacketIDFilter;

    invoke-virtual {v1}, Lorg/jivesoftware/smackx/workgroup/packet/MonitorPacket;->getPacketID()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/jivesoftware/smack/filter/PacketIDFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v4}, Lorg/jivesoftware/smack/Connection;->createPacketCollector(Lorg/jivesoftware/smack/filter/PacketFilter;)Lorg/jivesoftware/smack/PacketCollector;

    move-result-object v0

    .line 1172
    .local v0, "collector":Lorg/jivesoftware/smack/PacketCollector;
    iget-object v3, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v3, v1}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 1174
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getPacketReplyTimeout()I

    move-result v3

    int-to-long v4, v3

    invoke-virtual {v0, v4, v5}, Lorg/jivesoftware/smack/PacketCollector;->nextResult(J)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v2

    .line 1177
    .local v2, "response":Lorg/jivesoftware/smack/packet/Packet;
    invoke-virtual {v0}, Lorg/jivesoftware/smack/PacketCollector;->cancel()V

    .line 1178
    if-nez v2, :cond_0

    .line 1179
    new-instance v3, Lorg/jivesoftware/smack/XMPPException;

    const-string/jumbo v4, "No response from server on status set."

    invoke-direct {v3, v4}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 1181
    :cond_0
    invoke-virtual {v2}, Lorg/jivesoftware/smack/packet/Packet;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 1182
    new-instance v3, Lorg/jivesoftware/smack/XMPPException;

    invoke-virtual {v2}, Lorg/jivesoftware/smack/packet/Packet;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/jivesoftware/smack/XMPPException;-><init>(Lorg/jivesoftware/smack/packet/XMPPError;)V

    throw v3

    .line 1184
    :cond_1
    return-void
.end method

.method public removeInvitationListener(Lorg/jivesoftware/smackx/workgroup/WorkgroupInvitationListener;)V
    .locals 2
    .param p1, "invitationListener"    # Lorg/jivesoftware/smackx/workgroup/WorkgroupInvitationListener;

    .prologue
    .line 616
    iget-object v1, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->invitationListeners:Ljava/util/List;

    monitor-enter v1

    .line 617
    :try_start_0
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->invitationListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 618
    monitor-exit v1

    .line 619
    return-void

    .line 618
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public removeMetaData(Ljava/lang/String;)V
    .locals 4
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 221
    iget-object v2, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->metaData:Ljava/util/Map;

    monitor-enter v2

    .line 222
    :try_start_0
    iget-object v1, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->metaData:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 224
    .local v0, "oldVal":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-eqz v0, :cond_0

    .line 225
    iget-object v1, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->presenceMode:Lorg/jivesoftware/smack/packet/Presence$Mode;

    iget v3, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->maxChats:I

    invoke-virtual {p0, v1, v3}, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->setStatus(Lorg/jivesoftware/smack/packet/Presence$Mode;I)V

    .line 227
    :cond_0
    monitor-exit v2

    .line 228
    return-void

    .line 227
    .end local v0    # "oldVal":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public removeOfferListener(Lorg/jivesoftware/smackx/workgroup/agent/OfferListener;)V
    .locals 2
    .param p1, "offerListener"    # Lorg/jivesoftware/smackx/workgroup/agent/OfferListener;

    .prologue
    .line 592
    iget-object v1, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->offerListeners:Ljava/util/List;

    monitor-enter v1

    .line 593
    :try_start_0
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->offerListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

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

.method public removeQueueUsersListener(Lorg/jivesoftware/smackx/workgroup/agent/QueueUsersListener;)V
    .locals 2
    .param p1, "listener"    # Lorg/jivesoftware/smackx/workgroup/agent/QueueUsersListener;

    .prologue
    .line 568
    iget-object v1, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->queueUsersListeners:Ljava/util/List;

    monitor-enter v1

    .line 569
    :try_start_0
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->queueUsersListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 570
    monitor-exit v1

    .line 571
    return-void

    .line 570
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public saveMacros(Lorg/jivesoftware/smackx/workgroup/ext/macros/MacroGroup;)V
    .locals 6
    .param p1, "group"    # Lorg/jivesoftware/smackx/workgroup/ext/macros/MacroGroup;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 955
    new-instance v1, Lorg/jivesoftware/smackx/workgroup/ext/macros/Macros;

    invoke-direct {v1}, Lorg/jivesoftware/smackx/workgroup/ext/macros/Macros;-><init>()V

    .line 956
    .local v1, "request":Lorg/jivesoftware/smackx/workgroup/ext/macros/Macros;
    sget-object v3, Lorg/jivesoftware/smack/packet/IQ$Type;->SET:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {v1, v3}, Lorg/jivesoftware/smackx/workgroup/ext/macros/Macros;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 957
    iget-object v3, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->workgroupJID:Ljava/lang/String;

    invoke-virtual {v1, v3}, Lorg/jivesoftware/smackx/workgroup/ext/macros/Macros;->setTo(Ljava/lang/String;)V

    .line 958
    const/4 v3, 0x1

    invoke-virtual {v1, v3}, Lorg/jivesoftware/smackx/workgroup/ext/macros/Macros;->setPersonal(Z)V

    .line 959
    invoke-virtual {v1, p1}, Lorg/jivesoftware/smackx/workgroup/ext/macros/Macros;->setPersonalMacroGroup(Lorg/jivesoftware/smackx/workgroup/ext/macros/MacroGroup;)V

    .line 961
    iget-object v3, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->connection:Lorg/jivesoftware/smack/Connection;

    new-instance v4, Lorg/jivesoftware/smack/filter/PacketIDFilter;

    invoke-virtual {v1}, Lorg/jivesoftware/smackx/workgroup/ext/macros/Macros;->getPacketID()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/jivesoftware/smack/filter/PacketIDFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v4}, Lorg/jivesoftware/smack/Connection;->createPacketCollector(Lorg/jivesoftware/smack/filter/PacketFilter;)Lorg/jivesoftware/smack/PacketCollector;

    move-result-object v0

    .line 962
    .local v0, "collector":Lorg/jivesoftware/smack/PacketCollector;
    iget-object v3, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v3, v1}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 965
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getPacketReplyTimeout()I

    move-result v3

    int-to-long v4, v3

    invoke-virtual {v0, v4, v5}, Lorg/jivesoftware/smack/PacketCollector;->nextResult(J)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v2

    check-cast v2, Lorg/jivesoftware/smack/packet/IQ;

    .line 968
    .local v2, "response":Lorg/jivesoftware/smack/packet/IQ;
    invoke-virtual {v0}, Lorg/jivesoftware/smack/PacketCollector;->cancel()V

    .line 969
    if-nez v2, :cond_0

    .line 970
    new-instance v3, Lorg/jivesoftware/smack/XMPPException;

    const-string/jumbo v4, "No response from server on status set."

    invoke-direct {v3, v4}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 972
    :cond_0
    invoke-virtual {v2}, Lorg/jivesoftware/smack/packet/IQ;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 973
    new-instance v3, Lorg/jivesoftware/smack/XMPPException;

    invoke-virtual {v2}, Lorg/jivesoftware/smack/packet/IQ;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/jivesoftware/smack/XMPPException;-><init>(Lorg/jivesoftware/smack/packet/XMPPError;)V

    throw v3

    .line 975
    :cond_1
    return-void
.end method

.method public searchTranscripts(Lorg/jivesoftware/smackx/Form;)Lorg/jivesoftware/smackx/ReportedData;
    .locals 2
    .param p1, "completedForm"    # Lorg/jivesoftware/smackx/Form;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 497
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->transcriptSearchManager:Lorg/jivesoftware/smackx/workgroup/agent/TranscriptSearchManager;

    iget-object v1, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->workgroupJID:Ljava/lang/String;

    invoke-static {v1}, Lorg/jivesoftware/smack/util/StringUtils;->parseServer(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Lorg/jivesoftware/smackx/workgroup/agent/TranscriptSearchManager;->submitSearch(Ljava/lang/String;Lorg/jivesoftware/smackx/Form;)Lorg/jivesoftware/smackx/ReportedData;

    move-result-object v0

    return-object v0
.end method

.method public sendRoomInvitation(Lorg/jivesoftware/smackx/workgroup/packet/RoomInvitation$Type;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 7
    .param p1, "type"    # Lorg/jivesoftware/smackx/workgroup/packet/RoomInvitation$Type;
    .param p2, "invitee"    # Ljava/lang/String;
    .param p3, "sessionID"    # Ljava/lang/String;
    .param p4, "reason"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 1035
    new-instance v1, Lorg/jivesoftware/smackx/workgroup/packet/RoomInvitation;

    invoke-direct {v1, p1, p2, p3, p4}, Lorg/jivesoftware/smackx/workgroup/packet/RoomInvitation;-><init>(Lorg/jivesoftware/smackx/workgroup/packet/RoomInvitation$Type;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1036
    .local v1, "invitation":Lorg/jivesoftware/smackx/workgroup/packet/RoomInvitation;
    new-instance v2, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession$4;

    invoke-direct {v2, p0, v1}, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession$4;-><init>(Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;Lorg/jivesoftware/smackx/workgroup/packet/RoomInvitation;)V

    .line 1042
    .local v2, "iq":Lorg/jivesoftware/smack/packet/IQ;
    sget-object v4, Lorg/jivesoftware/smack/packet/IQ$Type;->SET:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {v2, v4}, Lorg/jivesoftware/smack/packet/IQ;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 1043
    iget-object v4, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->workgroupJID:Ljava/lang/String;

    invoke-virtual {v2, v4}, Lorg/jivesoftware/smack/packet/IQ;->setTo(Ljava/lang/String;)V

    .line 1044
    iget-object v4, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v4}, Lorg/jivesoftware/smack/Connection;->getUser()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Lorg/jivesoftware/smack/packet/IQ;->setFrom(Ljava/lang/String;)V

    .line 1046
    iget-object v4, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->connection:Lorg/jivesoftware/smack/Connection;

    new-instance v5, Lorg/jivesoftware/smack/filter/PacketIDFilter;

    invoke-virtual {v2}, Lorg/jivesoftware/smack/packet/IQ;->getPacketID()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Lorg/jivesoftware/smack/filter/PacketIDFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v5}, Lorg/jivesoftware/smack/Connection;->createPacketCollector(Lorg/jivesoftware/smack/filter/PacketFilter;)Lorg/jivesoftware/smack/PacketCollector;

    move-result-object v0

    .line 1047
    .local v0, "collector":Lorg/jivesoftware/smack/PacketCollector;
    iget-object v4, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v4, v2}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 1049
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getPacketReplyTimeout()I

    move-result v4

    int-to-long v4, v4

    invoke-virtual {v0, v4, v5}, Lorg/jivesoftware/smack/PacketCollector;->nextResult(J)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v3

    check-cast v3, Lorg/jivesoftware/smack/packet/IQ;

    .line 1052
    .local v3, "response":Lorg/jivesoftware/smack/packet/IQ;
    invoke-virtual {v0}, Lorg/jivesoftware/smack/PacketCollector;->cancel()V

    .line 1053
    if-nez v3, :cond_0

    .line 1054
    new-instance v4, Lorg/jivesoftware/smack/XMPPException;

    const-string/jumbo v5, "No response from server."

    invoke-direct {v4, v5}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 1056
    :cond_0
    invoke-virtual {v3}, Lorg/jivesoftware/smack/packet/IQ;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v4

    if-eqz v4, :cond_1

    .line 1057
    new-instance v4, Lorg/jivesoftware/smack/XMPPException;

    invoke-virtual {v3}, Lorg/jivesoftware/smack/packet/IQ;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/jivesoftware/smack/XMPPException;-><init>(Lorg/jivesoftware/smack/packet/XMPPError;)V

    throw v4

    .line 1059
    :cond_1
    return-void
.end method

.method public sendRoomTransfer(Lorg/jivesoftware/smackx/workgroup/packet/RoomTransfer$Type;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 7
    .param p1, "type"    # Lorg/jivesoftware/smackx/workgroup/packet/RoomTransfer$Type;
    .param p2, "invitee"    # Ljava/lang/String;
    .param p3, "sessionID"    # Ljava/lang/String;
    .param p4, "reason"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 1087
    new-instance v3, Lorg/jivesoftware/smackx/workgroup/packet/RoomTransfer;

    invoke-direct {v3, p1, p2, p3, p4}, Lorg/jivesoftware/smackx/workgroup/packet/RoomTransfer;-><init>(Lorg/jivesoftware/smackx/workgroup/packet/RoomTransfer$Type;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1088
    .local v3, "transfer":Lorg/jivesoftware/smackx/workgroup/packet/RoomTransfer;
    new-instance v1, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession$5;

    invoke-direct {v1, p0, v3}, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession$5;-><init>(Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;Lorg/jivesoftware/smackx/workgroup/packet/RoomTransfer;)V

    .line 1094
    .local v1, "iq":Lorg/jivesoftware/smack/packet/IQ;
    sget-object v4, Lorg/jivesoftware/smack/packet/IQ$Type;->SET:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {v1, v4}, Lorg/jivesoftware/smack/packet/IQ;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 1095
    iget-object v4, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->workgroupJID:Ljava/lang/String;

    invoke-virtual {v1, v4}, Lorg/jivesoftware/smack/packet/IQ;->setTo(Ljava/lang/String;)V

    .line 1096
    iget-object v4, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v4}, Lorg/jivesoftware/smack/Connection;->getUser()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Lorg/jivesoftware/smack/packet/IQ;->setFrom(Ljava/lang/String;)V

    .line 1098
    iget-object v4, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->connection:Lorg/jivesoftware/smack/Connection;

    new-instance v5, Lorg/jivesoftware/smack/filter/PacketIDFilter;

    invoke-virtual {v1}, Lorg/jivesoftware/smack/packet/IQ;->getPacketID()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Lorg/jivesoftware/smack/filter/PacketIDFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v5}, Lorg/jivesoftware/smack/Connection;->createPacketCollector(Lorg/jivesoftware/smack/filter/PacketFilter;)Lorg/jivesoftware/smack/PacketCollector;

    move-result-object v0

    .line 1099
    .local v0, "collector":Lorg/jivesoftware/smack/PacketCollector;
    iget-object v4, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v4, v1}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 1101
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getPacketReplyTimeout()I

    move-result v4

    int-to-long v4, v4

    invoke-virtual {v0, v4, v5}, Lorg/jivesoftware/smack/PacketCollector;->nextResult(J)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v2

    check-cast v2, Lorg/jivesoftware/smack/packet/IQ;

    .line 1104
    .local v2, "response":Lorg/jivesoftware/smack/packet/IQ;
    invoke-virtual {v0}, Lorg/jivesoftware/smack/PacketCollector;->cancel()V

    .line 1105
    if-nez v2, :cond_0

    .line 1106
    new-instance v4, Lorg/jivesoftware/smack/XMPPException;

    const-string/jumbo v5, "No response from server."

    invoke-direct {v4, v5}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 1108
    :cond_0
    invoke-virtual {v2}, Lorg/jivesoftware/smack/packet/IQ;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v4

    if-eqz v4, :cond_1

    .line 1109
    new-instance v4, Lorg/jivesoftware/smack/XMPPException;

    invoke-virtual {v2}, Lorg/jivesoftware/smack/packet/IQ;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/jivesoftware/smack/XMPPException;-><init>(Lorg/jivesoftware/smack/packet/XMPPError;)V

    throw v4

    .line 1111
    :cond_1
    return-void
.end method

.method public setMetaData(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "val"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 202
    iget-object v2, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->metaData:Ljava/util/Map;

    monitor-enter v2

    .line 203
    :try_start_0
    iget-object v1, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->metaData:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 205
    .local v0, "oldVals":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-eqz v0, :cond_0

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 206
    :cond_0
    const/4 v1, 0x0

    invoke-interface {v0, v1, p2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 208
    iget-object v1, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->presenceMode:Lorg/jivesoftware/smack/packet/Presence$Mode;

    iget v3, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->maxChats:I

    invoke-virtual {p0, v1, v3}, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->setStatus(Lorg/jivesoftware/smack/packet/Presence$Mode;I)V

    .line 210
    :cond_1
    monitor-exit v2

    .line 211
    return-void

    .line 210
    .end local v0    # "oldVals":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public setNote(Ljava/lang/String;Ljava/lang/String;)V
    .locals 6
    .param p1, "sessionID"    # Ljava/lang/String;
    .param p2, "note"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 799
    const-string/jumbo v3, "\n"

    const-string/jumbo v4, "\\n"

    invoke-static {p2, v3, v4}, Lorg/jivesoftware/smackx/workgroup/ext/notes/ChatNotes;->replace(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 800
    invoke-static {p2}, Lorg/jivesoftware/smack/util/StringUtils;->escapeForXML(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 802
    new-instance v1, Lorg/jivesoftware/smackx/workgroup/ext/notes/ChatNotes;

    invoke-direct {v1}, Lorg/jivesoftware/smackx/workgroup/ext/notes/ChatNotes;-><init>()V

    .line 803
    .local v1, "notes":Lorg/jivesoftware/smackx/workgroup/ext/notes/ChatNotes;
    sget-object v3, Lorg/jivesoftware/smack/packet/IQ$Type;->SET:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {v1, v3}, Lorg/jivesoftware/smackx/workgroup/ext/notes/ChatNotes;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 804
    iget-object v3, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->workgroupJID:Ljava/lang/String;

    invoke-virtual {v1, v3}, Lorg/jivesoftware/smackx/workgroup/ext/notes/ChatNotes;->setTo(Ljava/lang/String;)V

    .line 805
    invoke-virtual {v1, p1}, Lorg/jivesoftware/smackx/workgroup/ext/notes/ChatNotes;->setSessionID(Ljava/lang/String;)V

    .line 806
    invoke-virtual {v1, p2}, Lorg/jivesoftware/smackx/workgroup/ext/notes/ChatNotes;->setNotes(Ljava/lang/String;)V

    .line 807
    iget-object v3, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->connection:Lorg/jivesoftware/smack/Connection;

    new-instance v4, Lorg/jivesoftware/smack/filter/PacketIDFilter;

    invoke-virtual {v1}, Lorg/jivesoftware/smackx/workgroup/ext/notes/ChatNotes;->getPacketID()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/jivesoftware/smack/filter/PacketIDFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v4}, Lorg/jivesoftware/smack/Connection;->createPacketCollector(Lorg/jivesoftware/smack/filter/PacketFilter;)Lorg/jivesoftware/smack/PacketCollector;

    move-result-object v0

    .line 809
    .local v0, "collector":Lorg/jivesoftware/smack/PacketCollector;
    iget-object v3, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v3, v1}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 811
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getPacketReplyTimeout()I

    move-result v3

    int-to-long v4, v3

    invoke-virtual {v0, v4, v5}, Lorg/jivesoftware/smack/PacketCollector;->nextResult(J)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v2

    check-cast v2, Lorg/jivesoftware/smack/packet/IQ;

    .line 814
    .local v2, "response":Lorg/jivesoftware/smack/packet/IQ;
    invoke-virtual {v0}, Lorg/jivesoftware/smack/PacketCollector;->cancel()V

    .line 815
    if-nez v2, :cond_0

    .line 816
    new-instance v3, Lorg/jivesoftware/smack/XMPPException;

    const-string/jumbo v4, "No response from server on status set."

    invoke-direct {v3, v4}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 818
    :cond_0
    invoke-virtual {v2}, Lorg/jivesoftware/smack/packet/IQ;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 819
    new-instance v3, Lorg/jivesoftware/smack/XMPPException;

    invoke-virtual {v2}, Lorg/jivesoftware/smack/packet/IQ;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/jivesoftware/smack/XMPPException;-><init>(Lorg/jivesoftware/smack/packet/XMPPError;)V

    throw v3

    .line 821
    :cond_1
    return-void
.end method

.method public setOnline(Z)V
    .locals 8
    .param p1, "online"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 251
    iget-boolean v2, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->online:Z

    if-ne v2, p1, :cond_0

    .line 292
    :goto_0
    return-void

    .line 258
    :cond_0
    if-eqz p1, :cond_3

    .line 259
    new-instance v1, Lorg/jivesoftware/smack/packet/Presence;

    sget-object v2, Lorg/jivesoftware/smack/packet/Presence$Type;->available:Lorg/jivesoftware/smack/packet/Presence$Type;

    invoke-direct {v1, v2}, Lorg/jivesoftware/smack/packet/Presence;-><init>(Lorg/jivesoftware/smack/packet/Presence$Type;)V

    .line 260
    .local v1, "presence":Lorg/jivesoftware/smack/packet/Presence;
    iget-object v2, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->workgroupJID:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lorg/jivesoftware/smack/packet/Presence;->setTo(Ljava/lang/String;)V

    .line 261
    new-instance v2, Lorg/jivesoftware/smack/packet/DefaultPacketExtension;

    const-string/jumbo v3, "agent-status"

    const-string/jumbo v4, "http://jabber.org/protocol/workgroup"

    invoke-direct {v2, v3, v4}, Lorg/jivesoftware/smack/packet/DefaultPacketExtension;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Lorg/jivesoftware/smack/packet/Presence;->addExtension(Lorg/jivesoftware/smack/packet/PacketExtension;)V

    .line 264
    iget-object v2, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->connection:Lorg/jivesoftware/smack/Connection;

    new-instance v3, Lorg/jivesoftware/smack/filter/AndFilter;

    const/4 v4, 0x2

    new-array v4, v4, [Lorg/jivesoftware/smack/filter/PacketFilter;

    const/4 v5, 0x0

    new-instance v6, Lorg/jivesoftware/smack/filter/PacketTypeFilter;

    const-class v7, Lorg/jivesoftware/smack/packet/Presence;

    invoke-direct {v6, v7}, Lorg/jivesoftware/smack/filter/PacketTypeFilter;-><init>(Ljava/lang/Class;)V

    aput-object v6, v4, v5

    const/4 v5, 0x1

    new-instance v6, Lorg/jivesoftware/smack/filter/FromContainsFilter;

    iget-object v7, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->workgroupJID:Ljava/lang/String;

    invoke-direct {v6, v7}, Lorg/jivesoftware/smack/filter/FromContainsFilter;-><init>(Ljava/lang/String;)V

    aput-object v6, v4, v5

    invoke-direct {v3, v4}, Lorg/jivesoftware/smack/filter/AndFilter;-><init>([Lorg/jivesoftware/smack/filter/PacketFilter;)V

    invoke-virtual {v2, v3}, Lorg/jivesoftware/smack/Connection;->createPacketCollector(Lorg/jivesoftware/smack/filter/PacketFilter;)Lorg/jivesoftware/smack/PacketCollector;

    move-result-object v0

    .line 266
    .local v0, "collector":Lorg/jivesoftware/smack/PacketCollector;
    iget-object v2, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v2, v1}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 268
    const-wide/16 v2, 0x1388

    invoke-virtual {v0, v2, v3}, Lorg/jivesoftware/smack/PacketCollector;->nextResult(J)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v1

    .end local v1    # "presence":Lorg/jivesoftware/smack/packet/Presence;
    check-cast v1, Lorg/jivesoftware/smack/packet/Presence;

    .line 269
    .restart local v1    # "presence":Lorg/jivesoftware/smack/packet/Presence;
    invoke-virtual {v0}, Lorg/jivesoftware/smack/PacketCollector;->cancel()V

    .line 270
    invoke-virtual {v1}, Lorg/jivesoftware/smack/packet/Presence;->isAvailable()Z

    move-result v2

    if-nez v2, :cond_1

    .line 271
    new-instance v2, Lorg/jivesoftware/smack/XMPPException;

    const-string/jumbo v3, "No response from server on status set."

    invoke-direct {v2, v3}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 274
    :cond_1
    invoke-virtual {v1}, Lorg/jivesoftware/smack/packet/Presence;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v2

    if-eqz v2, :cond_2

    .line 275
    new-instance v2, Lorg/jivesoftware/smack/XMPPException;

    invoke-virtual {v1}, Lorg/jivesoftware/smack/packet/Presence;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/jivesoftware/smack/XMPPException;-><init>(Lorg/jivesoftware/smack/packet/XMPPError;)V

    throw v2

    .line 279
    :cond_2
    iput-boolean p1, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->online:Z

    goto :goto_0

    .line 284
    .end local v0    # "collector":Lorg/jivesoftware/smack/PacketCollector;
    .end local v1    # "presence":Lorg/jivesoftware/smack/packet/Presence;
    :cond_3
    iput-boolean p1, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->online:Z

    .line 286
    new-instance v1, Lorg/jivesoftware/smack/packet/Presence;

    sget-object v2, Lorg/jivesoftware/smack/packet/Presence$Type;->unavailable:Lorg/jivesoftware/smack/packet/Presence$Type;

    invoke-direct {v1, v2}, Lorg/jivesoftware/smack/packet/Presence;-><init>(Lorg/jivesoftware/smack/packet/Presence$Type;)V

    .line 287
    .restart local v1    # "presence":Lorg/jivesoftware/smack/packet/Presence;
    iget-object v2, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->workgroupJID:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lorg/jivesoftware/smack/packet/Presence;->setTo(Ljava/lang/String;)V

    .line 288
    new-instance v2, Lorg/jivesoftware/smack/packet/DefaultPacketExtension;

    const-string/jumbo v3, "agent-status"

    const-string/jumbo v4, "http://jabber.org/protocol/workgroup"

    invoke-direct {v2, v3, v4}, Lorg/jivesoftware/smack/packet/DefaultPacketExtension;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Lorg/jivesoftware/smack/packet/Presence;->addExtension(Lorg/jivesoftware/smack/packet/PacketExtension;)V

    .line 290
    iget-object v2, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v2, v1}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    goto/16 :goto_0
.end method

.method public setStatus(Lorg/jivesoftware/smack/packet/Presence$Mode;I)V
    .locals 1
    .param p1, "presenceMode"    # Lorg/jivesoftware/smack/packet/Presence$Mode;
    .param p2, "maxChats"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 318
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->setStatus(Lorg/jivesoftware/smack/packet/Presence$Mode;ILjava/lang/String;)V

    .line 319
    return-void
.end method

.method public setStatus(Lorg/jivesoftware/smack/packet/Presence$Mode;ILjava/lang/String;)V
    .locals 9
    .param p1, "presenceMode"    # Lorg/jivesoftware/smack/packet/Presence$Mode;
    .param p2, "maxChats"    # I
    .param p3, "status"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 345
    iget-boolean v3, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->online:Z

    if-nez v3, :cond_0

    .line 346
    new-instance v3, Ljava/lang/IllegalStateException;

    const-string/jumbo v4, "Cannot set status when the agent is not online."

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 349
    :cond_0
    if-nez p1, :cond_1

    .line 350
    sget-object p1, Lorg/jivesoftware/smack/packet/Presence$Mode;->available:Lorg/jivesoftware/smack/packet/Presence$Mode;

    .line 352
    :cond_1
    iput-object p1, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->presenceMode:Lorg/jivesoftware/smack/packet/Presence$Mode;

    .line 353
    iput p2, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->maxChats:I

    .line 355
    new-instance v2, Lorg/jivesoftware/smack/packet/Presence;

    sget-object v3, Lorg/jivesoftware/smack/packet/Presence$Type;->available:Lorg/jivesoftware/smack/packet/Presence$Type;

    invoke-direct {v2, v3}, Lorg/jivesoftware/smack/packet/Presence;-><init>(Lorg/jivesoftware/smack/packet/Presence$Type;)V

    .line 356
    .local v2, "presence":Lorg/jivesoftware/smack/packet/Presence;
    invoke-virtual {v2, p1}, Lorg/jivesoftware/smack/packet/Presence;->setMode(Lorg/jivesoftware/smack/packet/Presence$Mode;)V

    .line 357
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->getWorkgroupJID()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/jivesoftware/smack/packet/Presence;->setTo(Ljava/lang/String;)V

    .line 359
    if-eqz p3, :cond_2

    .line 360
    invoke-virtual {v2, p3}, Lorg/jivesoftware/smack/packet/Presence;->setStatus(Ljava/lang/String;)V

    .line 363
    :cond_2
    new-instance v0, Lorg/jivesoftware/smack/packet/DefaultPacketExtension;

    const-string/jumbo v3, "agent-status"

    const-string/jumbo v4, "http://jabber.org/protocol/workgroup"

    invoke-direct {v0, v3, v4}, Lorg/jivesoftware/smack/packet/DefaultPacketExtension;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 365
    .local v0, "agentStatus":Lorg/jivesoftware/smack/packet/DefaultPacketExtension;
    const-string/jumbo v3, "max-chats"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, ""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Lorg/jivesoftware/smack/packet/DefaultPacketExtension;->setValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 366
    invoke-virtual {v2, v0}, Lorg/jivesoftware/smack/packet/Presence;->addExtension(Lorg/jivesoftware/smack/packet/PacketExtension;)V

    .line 367
    new-instance v3, Lorg/jivesoftware/smackx/workgroup/MetaData;

    iget-object v4, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->metaData:Ljava/util/Map;

    invoke-direct {v3, v4}, Lorg/jivesoftware/smackx/workgroup/MetaData;-><init>(Ljava/util/Map;)V

    invoke-virtual {v2, v3}, Lorg/jivesoftware/smack/packet/Presence;->addExtension(Lorg/jivesoftware/smack/packet/PacketExtension;)V

    .line 369
    iget-object v3, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->connection:Lorg/jivesoftware/smack/Connection;

    new-instance v4, Lorg/jivesoftware/smack/filter/AndFilter;

    const/4 v5, 0x2

    new-array v5, v5, [Lorg/jivesoftware/smack/filter/PacketFilter;

    const/4 v6, 0x0

    new-instance v7, Lorg/jivesoftware/smack/filter/PacketTypeFilter;

    const-class v8, Lorg/jivesoftware/smack/packet/Presence;

    invoke-direct {v7, v8}, Lorg/jivesoftware/smack/filter/PacketTypeFilter;-><init>(Ljava/lang/Class;)V

    aput-object v7, v5, v6

    const/4 v6, 0x1

    new-instance v7, Lorg/jivesoftware/smack/filter/FromContainsFilter;

    iget-object v8, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->workgroupJID:Ljava/lang/String;

    invoke-direct {v7, v8}, Lorg/jivesoftware/smack/filter/FromContainsFilter;-><init>(Ljava/lang/String;)V

    aput-object v7, v5, v6

    invoke-direct {v4, v5}, Lorg/jivesoftware/smack/filter/AndFilter;-><init>([Lorg/jivesoftware/smack/filter/PacketFilter;)V

    invoke-virtual {v3, v4}, Lorg/jivesoftware/smack/Connection;->createPacketCollector(Lorg/jivesoftware/smack/filter/PacketFilter;)Lorg/jivesoftware/smack/PacketCollector;

    move-result-object v1

    .line 371
    .local v1, "collector":Lorg/jivesoftware/smack/PacketCollector;
    iget-object v3, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v3, v2}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 373
    const-wide/16 v4, 0x1388

    invoke-virtual {v1, v4, v5}, Lorg/jivesoftware/smack/PacketCollector;->nextResult(J)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v2

    .end local v2    # "presence":Lorg/jivesoftware/smack/packet/Presence;
    check-cast v2, Lorg/jivesoftware/smack/packet/Presence;

    .line 374
    .restart local v2    # "presence":Lorg/jivesoftware/smack/packet/Presence;
    invoke-virtual {v1}, Lorg/jivesoftware/smack/PacketCollector;->cancel()V

    .line 375
    invoke-virtual {v2}, Lorg/jivesoftware/smack/packet/Presence;->isAvailable()Z

    move-result v3

    if-nez v3, :cond_3

    .line 376
    new-instance v3, Lorg/jivesoftware/smack/XMPPException;

    const-string/jumbo v4, "No response from server on status set."

    invoke-direct {v3, v4}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 379
    :cond_3
    invoke-virtual {v2}, Lorg/jivesoftware/smack/packet/Presence;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v3

    if-eqz v3, :cond_4

    .line 380
    new-instance v3, Lorg/jivesoftware/smack/XMPPException;

    invoke-virtual {v2}, Lorg/jivesoftware/smack/packet/Presence;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/jivesoftware/smack/XMPPException;-><init>(Lorg/jivesoftware/smack/packet/XMPPError;)V

    throw v3

    .line 382
    :cond_4
    return-void
.end method

.method public setStatus(Lorg/jivesoftware/smack/packet/Presence$Mode;Ljava/lang/String;)V
    .locals 8
    .param p1, "presenceMode"    # Lorg/jivesoftware/smack/packet/Presence$Mode;
    .param p2, "status"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 401
    iget-boolean v2, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->online:Z

    if-nez v2, :cond_0

    .line 402
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string/jumbo v3, "Cannot set status when the agent is not online."

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 405
    :cond_0
    if-nez p1, :cond_1

    .line 406
    sget-object p1, Lorg/jivesoftware/smack/packet/Presence$Mode;->available:Lorg/jivesoftware/smack/packet/Presence$Mode;

    .line 408
    :cond_1
    iput-object p1, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->presenceMode:Lorg/jivesoftware/smack/packet/Presence$Mode;

    .line 410
    new-instance v1, Lorg/jivesoftware/smack/packet/Presence;

    sget-object v2, Lorg/jivesoftware/smack/packet/Presence$Type;->available:Lorg/jivesoftware/smack/packet/Presence$Type;

    invoke-direct {v1, v2}, Lorg/jivesoftware/smack/packet/Presence;-><init>(Lorg/jivesoftware/smack/packet/Presence$Type;)V

    .line 411
    .local v1, "presence":Lorg/jivesoftware/smack/packet/Presence;
    invoke-virtual {v1, p1}, Lorg/jivesoftware/smack/packet/Presence;->setMode(Lorg/jivesoftware/smack/packet/Presence$Mode;)V

    .line 412
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->getWorkgroupJID()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/jivesoftware/smack/packet/Presence;->setTo(Ljava/lang/String;)V

    .line 414
    if-eqz p2, :cond_2

    .line 415
    invoke-virtual {v1, p2}, Lorg/jivesoftware/smack/packet/Presence;->setStatus(Ljava/lang/String;)V

    .line 417
    :cond_2
    new-instance v2, Lorg/jivesoftware/smackx/workgroup/MetaData;

    iget-object v3, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->metaData:Ljava/util/Map;

    invoke-direct {v2, v3}, Lorg/jivesoftware/smackx/workgroup/MetaData;-><init>(Ljava/util/Map;)V

    invoke-virtual {v1, v2}, Lorg/jivesoftware/smack/packet/Presence;->addExtension(Lorg/jivesoftware/smack/packet/PacketExtension;)V

    .line 419
    iget-object v2, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->connection:Lorg/jivesoftware/smack/Connection;

    new-instance v3, Lorg/jivesoftware/smack/filter/AndFilter;

    const/4 v4, 0x2

    new-array v4, v4, [Lorg/jivesoftware/smack/filter/PacketFilter;

    const/4 v5, 0x0

    new-instance v6, Lorg/jivesoftware/smack/filter/PacketTypeFilter;

    const-class v7, Lorg/jivesoftware/smack/packet/Presence;

    invoke-direct {v6, v7}, Lorg/jivesoftware/smack/filter/PacketTypeFilter;-><init>(Ljava/lang/Class;)V

    aput-object v6, v4, v5

    const/4 v5, 0x1

    new-instance v6, Lorg/jivesoftware/smack/filter/FromContainsFilter;

    iget-object v7, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->workgroupJID:Ljava/lang/String;

    invoke-direct {v6, v7}, Lorg/jivesoftware/smack/filter/FromContainsFilter;-><init>(Ljava/lang/String;)V

    aput-object v6, v4, v5

    invoke-direct {v3, v4}, Lorg/jivesoftware/smack/filter/AndFilter;-><init>([Lorg/jivesoftware/smack/filter/PacketFilter;)V

    invoke-virtual {v2, v3}, Lorg/jivesoftware/smack/Connection;->createPacketCollector(Lorg/jivesoftware/smack/filter/PacketFilter;)Lorg/jivesoftware/smack/PacketCollector;

    move-result-object v0

    .line 422
    .local v0, "collector":Lorg/jivesoftware/smack/PacketCollector;
    iget-object v2, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v2, v1}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 424
    const-wide/16 v2, 0x1388

    invoke-virtual {v0, v2, v3}, Lorg/jivesoftware/smack/PacketCollector;->nextResult(J)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v1

    .end local v1    # "presence":Lorg/jivesoftware/smack/packet/Presence;
    check-cast v1, Lorg/jivesoftware/smack/packet/Presence;

    .line 425
    .restart local v1    # "presence":Lorg/jivesoftware/smack/packet/Presence;
    invoke-virtual {v0}, Lorg/jivesoftware/smack/PacketCollector;->cancel()V

    .line 426
    invoke-virtual {v1}, Lorg/jivesoftware/smack/packet/Presence;->isAvailable()Z

    move-result v2

    if-nez v2, :cond_3

    .line 427
    new-instance v2, Lorg/jivesoftware/smack/XMPPException;

    const-string/jumbo v3, "No response from server on status set."

    invoke-direct {v2, v3}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 430
    :cond_3
    invoke-virtual {v1}, Lorg/jivesoftware/smack/packet/Presence;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v2

    if-eqz v2, :cond_4

    .line 431
    new-instance v2, Lorg/jivesoftware/smack/XMPPException;

    invoke-virtual {v1}, Lorg/jivesoftware/smack/packet/Presence;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/jivesoftware/smack/XMPPException;-><init>(Lorg/jivesoftware/smack/packet/XMPPError;)V

    throw v2

    .line 433
    :cond_4
    return-void
.end method
