.class public Lorg/jivesoftware/smackx/workgroup/user/Workgroup;
.super Ljava/lang/Object;
.source "Workgroup.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jivesoftware/smackx/workgroup/user/Workgroup$JoinQueuePacket;
    }
.end annotation


# instance fields
.field private connection:Lorg/jivesoftware/smack/Connection;

.field private inQueue:Z

.field private invitationListeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smackx/workgroup/WorkgroupInvitationListener;",
            ">;"
        }
    .end annotation
.end field

.field private queueListeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smackx/workgroup/user/QueueListener;",
            ">;"
        }
    .end annotation
.end field

.field private queuePosition:I

.field private queueRemainingTime:I

.field private workgroupJID:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lorg/jivesoftware/smack/Connection;)V
    .locals 3
    .param p1, "workgroupJID"    # Ljava/lang/String;
    .param p2, "connection"    # Lorg/jivesoftware/smack/Connection;

    .prologue
    const/4 v1, -0x1

    .line 77
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 64
    iput v1, p0, Lorg/jivesoftware/smackx/workgroup/user/Workgroup;->queuePosition:I

    .line 65
    iput v1, p0, Lorg/jivesoftware/smackx/workgroup/user/Workgroup;->queueRemainingTime:I

    .line 79
    invoke-virtual {p2}, Lorg/jivesoftware/smack/Connection;->isAuthenticated()Z

    move-result v1

    if-nez v1, :cond_0

    .line 80
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string/jumbo v2, "Must login to server before creating workgroup."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 83
    :cond_0
    iput-object p1, p0, Lorg/jivesoftware/smackx/workgroup/user/Workgroup;->workgroupJID:Ljava/lang/String;

    .line 84
    iput-object p2, p0, Lorg/jivesoftware/smackx/workgroup/user/Workgroup;->connection:Lorg/jivesoftware/smack/Connection;

    .line 85
    const/4 v1, 0x0

    iput-boolean v1, p0, Lorg/jivesoftware/smackx/workgroup/user/Workgroup;->inQueue:Z

    .line 86
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lorg/jivesoftware/smackx/workgroup/user/Workgroup;->invitationListeners:Ljava/util/List;

    .line 87
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lorg/jivesoftware/smackx/workgroup/user/Workgroup;->queueListeners:Ljava/util/List;

    .line 90
    new-instance v1, Lorg/jivesoftware/smackx/workgroup/user/Workgroup$1;

    invoke-direct {v1, p0}, Lorg/jivesoftware/smackx/workgroup/user/Workgroup$1;-><init>(Lorg/jivesoftware/smackx/workgroup/user/Workgroup;)V

    invoke-virtual {p0, v1}, Lorg/jivesoftware/smackx/workgroup/user/Workgroup;->addQueueListener(Lorg/jivesoftware/smackx/workgroup/user/QueueListener;)V

    .line 113
    new-instance v1, Lorg/jivesoftware/smackx/workgroup/user/Workgroup$2;

    invoke-direct {v1, p0}, Lorg/jivesoftware/smackx/workgroup/user/Workgroup$2;-><init>(Lorg/jivesoftware/smackx/workgroup/user/Workgroup;)V

    invoke-static {p2, v1}, Lorg/jivesoftware/smackx/muc/MultiUserChat;->addInvitationListener(Lorg/jivesoftware/smack/Connection;Lorg/jivesoftware/smackx/muc/InvitationListener;)V

    .line 124
    new-instance v0, Lorg/jivesoftware/smack/filter/PacketTypeFilter;

    const-class v1, Lorg/jivesoftware/smack/packet/Message;

    invoke-direct {v0, v1}, Lorg/jivesoftware/smack/filter/PacketTypeFilter;-><init>(Ljava/lang/Class;)V

    .line 126
    .local v0, "typeFilter":Lorg/jivesoftware/smack/filter/PacketFilter;
    new-instance v1, Lorg/jivesoftware/smackx/workgroup/user/Workgroup$3;

    invoke-direct {v1, p0}, Lorg/jivesoftware/smackx/workgroup/user/Workgroup$3;-><init>(Lorg/jivesoftware/smackx/workgroup/user/Workgroup;)V

    invoke-virtual {p2, v1, v0}, Lorg/jivesoftware/smack/Connection;->addPacketListener(Lorg/jivesoftware/smack/PacketListener;Lorg/jivesoftware/smack/filter/PacketFilter;)V

    .line 131
    return-void
.end method

.method static synthetic access$002(Lorg/jivesoftware/smackx/workgroup/user/Workgroup;Z)Z
    .locals 0
    .param p0, "x0"    # Lorg/jivesoftware/smackx/workgroup/user/Workgroup;
    .param p1, "x1"    # Z

    .prologue
    .line 56
    iput-boolean p1, p0, Lorg/jivesoftware/smackx/workgroup/user/Workgroup;->inQueue:Z

    return p1
.end method

.method static synthetic access$102(Lorg/jivesoftware/smackx/workgroup/user/Workgroup;I)I
    .locals 0
    .param p0, "x0"    # Lorg/jivesoftware/smackx/workgroup/user/Workgroup;
    .param p1, "x1"    # I

    .prologue
    .line 56
    iput p1, p0, Lorg/jivesoftware/smackx/workgroup/user/Workgroup;->queuePosition:I

    return p1
.end method

.method static synthetic access$202(Lorg/jivesoftware/smackx/workgroup/user/Workgroup;I)I
    .locals 0
    .param p0, "x0"    # Lorg/jivesoftware/smackx/workgroup/user/Workgroup;
    .param p1, "x1"    # I

    .prologue
    .line 56
    iput p1, p0, Lorg/jivesoftware/smackx/workgroup/user/Workgroup;->queueRemainingTime:I

    return p1
.end method

.method static synthetic access$300(Lorg/jivesoftware/smackx/workgroup/user/Workgroup;Lorg/jivesoftware/smack/packet/Packet;)V
    .locals 0
    .param p0, "x0"    # Lorg/jivesoftware/smackx/workgroup/user/Workgroup;
    .param p1, "x1"    # Lorg/jivesoftware/smack/packet/Packet;

    .prologue
    .line 56
    invoke-direct {p0, p1}, Lorg/jivesoftware/smackx/workgroup/user/Workgroup;->handlePacket(Lorg/jivesoftware/smack/packet/Packet;)V

    return-void
.end method

.method static synthetic access$400(Lorg/jivesoftware/smackx/workgroup/user/Workgroup;)Lorg/jivesoftware/smack/Connection;
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smackx/workgroup/user/Workgroup;

    .prologue
    .line 56
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/user/Workgroup;->connection:Lorg/jivesoftware/smack/Connection;

    return-object v0
.end method

.method private fireInvitationEvent(Lorg/jivesoftware/smackx/workgroup/WorkgroupInvitation;)V
    .locals 4
    .param p1, "invitation"    # Lorg/jivesoftware/smackx/workgroup/WorkgroupInvitation;

    .prologue
    .line 489
    iget-object v3, p0, Lorg/jivesoftware/smackx/workgroup/user/Workgroup;->invitationListeners:Ljava/util/List;

    monitor-enter v3

    .line 490
    :try_start_0
    iget-object v2, p0, Lorg/jivesoftware/smackx/workgroup/user/Workgroup;->invitationListeners:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/jivesoftware/smackx/workgroup/WorkgroupInvitationListener;>;"
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 491
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jivesoftware/smackx/workgroup/WorkgroupInvitationListener;

    .line 492
    .local v1, "listener":Lorg/jivesoftware/smackx/workgroup/WorkgroupInvitationListener;
    invoke-interface {v1, p1}, Lorg/jivesoftware/smackx/workgroup/WorkgroupInvitationListener;->invitationReceived(Lorg/jivesoftware/smackx/workgroup/WorkgroupInvitation;)V

    goto :goto_0

    .line 494
    .end local v0    # "i":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/jivesoftware/smackx/workgroup/WorkgroupInvitationListener;>;"
    .end local v1    # "listener":Lorg/jivesoftware/smackx/workgroup/WorkgroupInvitationListener;
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2

    .restart local v0    # "i":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/jivesoftware/smackx/workgroup/WorkgroupInvitationListener;>;"
    :cond_0
    :try_start_1
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 495
    return-void
.end method

.method private fireQueueDepartedEvent()V
    .locals 4

    .prologue
    .line 507
    iget-object v3, p0, Lorg/jivesoftware/smackx/workgroup/user/Workgroup;->queueListeners:Ljava/util/List;

    monitor-enter v3

    .line 508
    :try_start_0
    iget-object v2, p0, Lorg/jivesoftware/smackx/workgroup/user/Workgroup;->queueListeners:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/jivesoftware/smackx/workgroup/user/QueueListener;>;"
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 509
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jivesoftware/smackx/workgroup/user/QueueListener;

    .line 510
    .local v1, "listener":Lorg/jivesoftware/smackx/workgroup/user/QueueListener;
    invoke-interface {v1}, Lorg/jivesoftware/smackx/workgroup/user/QueueListener;->departedQueue()V

    goto :goto_0

    .line 512
    .end local v0    # "i":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/jivesoftware/smackx/workgroup/user/QueueListener;>;"
    .end local v1    # "listener":Lorg/jivesoftware/smackx/workgroup/user/QueueListener;
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2

    .restart local v0    # "i":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/jivesoftware/smackx/workgroup/user/QueueListener;>;"
    :cond_0
    :try_start_1
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 513
    return-void
.end method

.method private fireQueueJoinedEvent()V
    .locals 4

    .prologue
    .line 498
    iget-object v3, p0, Lorg/jivesoftware/smackx/workgroup/user/Workgroup;->queueListeners:Ljava/util/List;

    monitor-enter v3

    .line 499
    :try_start_0
    iget-object v2, p0, Lorg/jivesoftware/smackx/workgroup/user/Workgroup;->queueListeners:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/jivesoftware/smackx/workgroup/user/QueueListener;>;"
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 500
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jivesoftware/smackx/workgroup/user/QueueListener;

    .line 501
    .local v1, "listener":Lorg/jivesoftware/smackx/workgroup/user/QueueListener;
    invoke-interface {v1}, Lorg/jivesoftware/smackx/workgroup/user/QueueListener;->joinedQueue()V

    goto :goto_0

    .line 503
    .end local v0    # "i":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/jivesoftware/smackx/workgroup/user/QueueListener;>;"
    .end local v1    # "listener":Lorg/jivesoftware/smackx/workgroup/user/QueueListener;
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2

    .restart local v0    # "i":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/jivesoftware/smackx/workgroup/user/QueueListener;>;"
    :cond_0
    :try_start_1
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 504
    return-void
.end method

.method private fireQueuePositionEvent(I)V
    .locals 4
    .param p1, "currentPosition"    # I

    .prologue
    .line 516
    iget-object v3, p0, Lorg/jivesoftware/smackx/workgroup/user/Workgroup;->queueListeners:Ljava/util/List;

    monitor-enter v3

    .line 517
    :try_start_0
    iget-object v2, p0, Lorg/jivesoftware/smackx/workgroup/user/Workgroup;->queueListeners:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/jivesoftware/smackx/workgroup/user/QueueListener;>;"
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 518
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jivesoftware/smackx/workgroup/user/QueueListener;

    .line 519
    .local v1, "listener":Lorg/jivesoftware/smackx/workgroup/user/QueueListener;
    invoke-interface {v1, p1}, Lorg/jivesoftware/smackx/workgroup/user/QueueListener;->queuePositionUpdated(I)V

    goto :goto_0

    .line 521
    .end local v0    # "i":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/jivesoftware/smackx/workgroup/user/QueueListener;>;"
    .end local v1    # "listener":Lorg/jivesoftware/smackx/workgroup/user/QueueListener;
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2

    .restart local v0    # "i":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/jivesoftware/smackx/workgroup/user/QueueListener;>;"
    :cond_0
    :try_start_1
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 522
    return-void
.end method

.method private fireQueueTimeEvent(I)V
    .locals 4
    .param p1, "secondsRemaining"    # I

    .prologue
    .line 525
    iget-object v3, p0, Lorg/jivesoftware/smackx/workgroup/user/Workgroup;->queueListeners:Ljava/util/List;

    monitor-enter v3

    .line 526
    :try_start_0
    iget-object v2, p0, Lorg/jivesoftware/smackx/workgroup/user/Workgroup;->queueListeners:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/jivesoftware/smackx/workgroup/user/QueueListener;>;"
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 527
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jivesoftware/smackx/workgroup/user/QueueListener;

    .line 528
    .local v1, "listener":Lorg/jivesoftware/smackx/workgroup/user/QueueListener;
    invoke-interface {v1, p1}, Lorg/jivesoftware/smackx/workgroup/user/QueueListener;->queueWaitTimeUpdated(I)V

    goto :goto_0

    .line 530
    .end local v0    # "i":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/jivesoftware/smackx/workgroup/user/QueueListener;>;"
    .end local v1    # "listener":Lorg/jivesoftware/smackx/workgroup/user/QueueListener;
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2

    .restart local v0    # "i":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/jivesoftware/smackx/workgroup/user/QueueListener;>;"
    :cond_0
    :try_start_1
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 531
    return-void
.end method

.method private getChatSettings(Ljava/lang/String;I)Lorg/jivesoftware/smackx/workgroup/settings/ChatSettings;
    .locals 6
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "type"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 663
    new-instance v1, Lorg/jivesoftware/smackx/workgroup/settings/ChatSettings;

    invoke-direct {v1}, Lorg/jivesoftware/smackx/workgroup/settings/ChatSettings;-><init>()V

    .line 664
    .local v1, "request":Lorg/jivesoftware/smackx/workgroup/settings/ChatSettings;
    if-eqz p1, :cond_0

    .line 665
    invoke-virtual {v1, p1}, Lorg/jivesoftware/smackx/workgroup/settings/ChatSettings;->setKey(Ljava/lang/String;)V

    .line 667
    :cond_0
    const/4 v3, -0x1

    if-eq p2, v3, :cond_1

    .line 668
    invoke-virtual {v1, p2}, Lorg/jivesoftware/smackx/workgroup/settings/ChatSettings;->setType(I)V

    .line 670
    :cond_1
    sget-object v3, Lorg/jivesoftware/smack/packet/IQ$Type;->GET:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {v1, v3}, Lorg/jivesoftware/smackx/workgroup/settings/ChatSettings;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 671
    iget-object v3, p0, Lorg/jivesoftware/smackx/workgroup/user/Workgroup;->workgroupJID:Ljava/lang/String;

    invoke-virtual {v1, v3}, Lorg/jivesoftware/smackx/workgroup/settings/ChatSettings;->setTo(Ljava/lang/String;)V

    .line 673
    iget-object v3, p0, Lorg/jivesoftware/smackx/workgroup/user/Workgroup;->connection:Lorg/jivesoftware/smack/Connection;

    new-instance v4, Lorg/jivesoftware/smack/filter/PacketIDFilter;

    invoke-virtual {v1}, Lorg/jivesoftware/smackx/workgroup/settings/ChatSettings;->getPacketID()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/jivesoftware/smack/filter/PacketIDFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v4}, Lorg/jivesoftware/smack/Connection;->createPacketCollector(Lorg/jivesoftware/smack/filter/PacketFilter;)Lorg/jivesoftware/smack/PacketCollector;

    move-result-object v0

    .line 674
    .local v0, "collector":Lorg/jivesoftware/smack/PacketCollector;
    iget-object v3, p0, Lorg/jivesoftware/smackx/workgroup/user/Workgroup;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v3, v1}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 677
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getPacketReplyTimeout()I

    move-result v3

    int-to-long v4, v3

    invoke-virtual {v0, v4, v5}, Lorg/jivesoftware/smack/PacketCollector;->nextResult(J)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v2

    check-cast v2, Lorg/jivesoftware/smackx/workgroup/settings/ChatSettings;

    .line 680
    .local v2, "response":Lorg/jivesoftware/smackx/workgroup/settings/ChatSettings;
    invoke-virtual {v0}, Lorg/jivesoftware/smack/PacketCollector;->cancel()V

    .line 681
    if-nez v2, :cond_2

    .line 682
    new-instance v3, Lorg/jivesoftware/smack/XMPPException;

    const-string/jumbo v4, "No response from server."

    invoke-direct {v3, v4}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 684
    :cond_2
    invoke-virtual {v2}, Lorg/jivesoftware/smackx/workgroup/settings/ChatSettings;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v3

    if-eqz v3, :cond_3

    .line 685
    new-instance v3, Lorg/jivesoftware/smack/XMPPException;

    invoke-virtual {v2}, Lorg/jivesoftware/smackx/workgroup/settings/ChatSettings;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/jivesoftware/smack/XMPPException;-><init>(Lorg/jivesoftware/smack/packet/XMPPError;)V

    throw v3

    .line 687
    :cond_3
    return-object v2
.end method

.method private handlePacket(Lorg/jivesoftware/smack/packet/Packet;)V
    .locals 14
    .param p1, "packet"    # Lorg/jivesoftware/smack/packet/Packet;

    .prologue
    const/4 v3, -0x1

    .line 536
    instance-of v1, p1, Lorg/jivesoftware/smack/packet/Message;

    if-eqz v1, :cond_0

    move-object v9, p1

    .line 537
    check-cast v9, Lorg/jivesoftware/smack/packet/Message;

    .line 539
    .local v9, "msg":Lorg/jivesoftware/smack/packet/Message;
    const-string/jumbo v1, "depart-queue"

    const-string/jumbo v2, "http://jabber.org/protocol/workgroup"

    invoke-virtual {v9, v1, v2}, Lorg/jivesoftware/smack/packet/Message;->getExtension(Ljava/lang/String;Ljava/lang/String;)Lorg/jivesoftware/smack/packet/PacketExtension;

    move-result-object v11

    .line 540
    .local v11, "pe":Lorg/jivesoftware/smack/packet/PacketExtension;
    const-string/jumbo v1, "queue-status"

    const-string/jumbo v2, "http://jabber.org/protocol/workgroup"

    invoke-virtual {v9, v1, v2}, Lorg/jivesoftware/smack/packet/Message;->getExtension(Ljava/lang/String;Ljava/lang/String;)Lorg/jivesoftware/smack/packet/PacketExtension;

    move-result-object v12

    .line 542
    .local v12, "queueStatus":Lorg/jivesoftware/smack/packet/PacketExtension;
    if-eqz v11, :cond_1

    .line 543
    invoke-direct {p0}, Lorg/jivesoftware/smackx/workgroup/user/Workgroup;->fireQueueDepartedEvent()V

    .line 583
    .end local v9    # "msg":Lorg/jivesoftware/smack/packet/Message;
    .end local v11    # "pe":Lorg/jivesoftware/smack/packet/PacketExtension;
    .end local v12    # "queueStatus":Lorg/jivesoftware/smack/packet/PacketExtension;
    :cond_0
    :goto_0
    return-void

    .line 545
    .restart local v9    # "msg":Lorg/jivesoftware/smack/packet/Message;
    .restart local v11    # "pe":Lorg/jivesoftware/smack/packet/PacketExtension;
    .restart local v12    # "queueStatus":Lorg/jivesoftware/smack/packet/PacketExtension;
    :cond_1
    if-eqz v12, :cond_3

    move-object v13, v12

    .line 546
    check-cast v13, Lorg/jivesoftware/smackx/workgroup/packet/QueueUpdate;

    .line 547
    .local v13, "queueUpdate":Lorg/jivesoftware/smackx/workgroup/packet/QueueUpdate;
    invoke-virtual {v13}, Lorg/jivesoftware/smackx/workgroup/packet/QueueUpdate;->getPosition()I

    move-result v1

    if-eq v1, v3, :cond_2

    .line 548
    invoke-virtual {v13}, Lorg/jivesoftware/smackx/workgroup/packet/QueueUpdate;->getPosition()I

    move-result v1

    invoke-direct {p0, v1}, Lorg/jivesoftware/smackx/workgroup/user/Workgroup;->fireQueuePositionEvent(I)V

    .line 550
    :cond_2
    invoke-virtual {v13}, Lorg/jivesoftware/smackx/workgroup/packet/QueueUpdate;->getRemaingTime()I

    move-result v1

    if-eq v1, v3, :cond_0

    .line 551
    invoke-virtual {v13}, Lorg/jivesoftware/smackx/workgroup/packet/QueueUpdate;->getRemaingTime()I

    move-result v1

    invoke-direct {p0, v1}, Lorg/jivesoftware/smackx/workgroup/user/Workgroup;->fireQueueTimeEvent(I)V

    goto :goto_0

    .line 557
    .end local v13    # "queueUpdate":Lorg/jivesoftware/smackx/workgroup/packet/QueueUpdate;
    :cond_3
    const-string/jumbo v1, "x"

    const-string/jumbo v2, "http://jabber.org/protocol/muc#user"

    invoke-virtual {v9, v1, v2}, Lorg/jivesoftware/smack/packet/Message;->getExtension(Ljava/lang/String;Ljava/lang/String;)Lorg/jivesoftware/smack/packet/PacketExtension;

    move-result-object v10

    check-cast v10, Lorg/jivesoftware/smackx/packet/MUCUser;

    .line 558
    .local v10, "mucUser":Lorg/jivesoftware/smackx/packet/MUCUser;
    if-eqz v10, :cond_6

    invoke-virtual {v10}, Lorg/jivesoftware/smackx/packet/MUCUser;->getInvite()Lorg/jivesoftware/smackx/packet/MUCUser$Invite;

    move-result-object v8

    .line 559
    .local v8, "invite":Lorg/jivesoftware/smackx/packet/MUCUser$Invite;
    :goto_1
    if-eqz v8, :cond_0

    iget-object v1, p0, Lorg/jivesoftware/smackx/workgroup/user/Workgroup;->workgroupJID:Ljava/lang/String;

    invoke-virtual {v8}, Lorg/jivesoftware/smackx/packet/MUCUser$Invite;->getFrom()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 560
    const/4 v4, 0x0

    .line 561
    .local v4, "sessionID":Ljava/lang/String;
    const/4 v7, 0x0

    .line 563
    .local v7, "metaData":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    const-string/jumbo v1, "session"

    const-string/jumbo v2, "http://jivesoftware.com/protocol/workgroup"

    invoke-virtual {v9, v1, v2}, Lorg/jivesoftware/smack/packet/Message;->getExtension(Ljava/lang/String;Ljava/lang/String;)Lorg/jivesoftware/smack/packet/PacketExtension;

    move-result-object v11

    .line 565
    if-eqz v11, :cond_4

    .line 566
    check-cast v11, Lorg/jivesoftware/smackx/workgroup/packet/SessionID;

    .end local v11    # "pe":Lorg/jivesoftware/smack/packet/PacketExtension;
    invoke-virtual {v11}, Lorg/jivesoftware/smackx/workgroup/packet/SessionID;->getSessionID()Ljava/lang/String;

    move-result-object v4

    .line 569
    :cond_4
    const-string/jumbo v1, "metadata"

    const-string/jumbo v2, "http://jivesoftware.com/protocol/workgroup"

    invoke-virtual {v9, v1, v2}, Lorg/jivesoftware/smack/packet/Message;->getExtension(Ljava/lang/String;Ljava/lang/String;)Lorg/jivesoftware/smack/packet/PacketExtension;

    move-result-object v11

    .line 571
    .restart local v11    # "pe":Lorg/jivesoftware/smack/packet/PacketExtension;
    if-eqz v11, :cond_5

    .line 572
    check-cast v11, Lorg/jivesoftware/smackx/workgroup/MetaData;

    .end local v11    # "pe":Lorg/jivesoftware/smack/packet/PacketExtension;
    invoke-virtual {v11}, Lorg/jivesoftware/smackx/workgroup/MetaData;->getMetaData()Ljava/util/Map;

    move-result-object v7

    .line 575
    :cond_5
    new-instance v0, Lorg/jivesoftware/smackx/workgroup/WorkgroupInvitation;

    iget-object v1, p0, Lorg/jivesoftware/smackx/workgroup/user/Workgroup;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v1}, Lorg/jivesoftware/smack/Connection;->getUser()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v9}, Lorg/jivesoftware/smack/packet/Message;->getFrom()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lorg/jivesoftware/smackx/workgroup/user/Workgroup;->workgroupJID:Ljava/lang/String;

    invoke-virtual {v9}, Lorg/jivesoftware/smack/packet/Message;->getBody()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v9}, Lorg/jivesoftware/smack/packet/Message;->getFrom()Ljava/lang/String;

    move-result-object v6

    invoke-direct/range {v0 .. v7}, Lorg/jivesoftware/smackx/workgroup/WorkgroupInvitation;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 579
    .local v0, "inv":Lorg/jivesoftware/smackx/workgroup/WorkgroupInvitation;
    invoke-direct {p0, v0}, Lorg/jivesoftware/smackx/workgroup/user/Workgroup;->fireInvitationEvent(Lorg/jivesoftware/smackx/workgroup/WorkgroupInvitation;)V

    goto/16 :goto_0

    .line 558
    .end local v0    # "inv":Lorg/jivesoftware/smackx/workgroup/WorkgroupInvitation;
    .end local v4    # "sessionID":Ljava/lang/String;
    .end local v7    # "metaData":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    .end local v8    # "invite":Lorg/jivesoftware/smackx/packet/MUCUser$Invite;
    .restart local v11    # "pe":Lorg/jivesoftware/smack/packet/PacketExtension;
    :cond_6
    const/4 v8, 0x0

    goto :goto_1
.end method


# virtual methods
.method public addInvitationListener(Lorg/jivesoftware/smackx/workgroup/WorkgroupInvitationListener;)V
    .locals 2
    .param p1, "invitationListener"    # Lorg/jivesoftware/smackx/workgroup/WorkgroupInvitationListener;

    .prologue
    .line 470
    iget-object v1, p0, Lorg/jivesoftware/smackx/workgroup/user/Workgroup;->invitationListeners:Ljava/util/List;

    monitor-enter v1

    .line 471
    :try_start_0
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/user/Workgroup;->invitationListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 472
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/user/Workgroup;->invitationListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 474
    :cond_0
    monitor-exit v1

    .line 475
    return-void

    .line 474
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public addQueueListener(Lorg/jivesoftware/smackx/workgroup/user/QueueListener;)V
    .locals 2
    .param p1, "queueListener"    # Lorg/jivesoftware/smackx/workgroup/user/QueueListener;

    .prologue
    .line 445
    iget-object v1, p0, Lorg/jivesoftware/smackx/workgroup/user/Workgroup;->queueListeners:Ljava/util/List;

    monitor-enter v1

    .line 446
    :try_start_0
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/user/Workgroup;->queueListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 447
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/user/Workgroup;->queueListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 449
    :cond_0
    monitor-exit v1

    .line 450
    return-void

    .line 449
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public departQueue()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 416
    iget-boolean v3, p0, Lorg/jivesoftware/smackx/workgroup/user/Workgroup;->inQueue:Z

    if-nez v3, :cond_0

    .line 436
    :goto_0
    return-void

    .line 420
    :cond_0
    new-instance v1, Lorg/jivesoftware/smackx/workgroup/packet/DepartQueuePacket;

    iget-object v3, p0, Lorg/jivesoftware/smackx/workgroup/user/Workgroup;->workgroupJID:Ljava/lang/String;

    invoke-direct {v1, v3}, Lorg/jivesoftware/smackx/workgroup/packet/DepartQueuePacket;-><init>(Ljava/lang/String;)V

    .line 421
    .local v1, "departPacket":Lorg/jivesoftware/smackx/workgroup/packet/DepartQueuePacket;
    iget-object v3, p0, Lorg/jivesoftware/smackx/workgroup/user/Workgroup;->connection:Lorg/jivesoftware/smack/Connection;

    new-instance v4, Lorg/jivesoftware/smack/filter/PacketIDFilter;

    invoke-virtual {v1}, Lorg/jivesoftware/smackx/workgroup/packet/DepartQueuePacket;->getPacketID()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/jivesoftware/smack/filter/PacketIDFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v4}, Lorg/jivesoftware/smack/Connection;->createPacketCollector(Lorg/jivesoftware/smack/filter/PacketFilter;)Lorg/jivesoftware/smack/PacketCollector;

    move-result-object v0

    .line 423
    .local v0, "collector":Lorg/jivesoftware/smack/PacketCollector;
    iget-object v3, p0, Lorg/jivesoftware/smackx/workgroup/user/Workgroup;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v3, v1}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 425
    const-wide/16 v4, 0x1388

    invoke-virtual {v0, v4, v5}, Lorg/jivesoftware/smack/PacketCollector;->nextResult(J)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v2

    check-cast v2, Lorg/jivesoftware/smack/packet/IQ;

    .line 426
    .local v2, "response":Lorg/jivesoftware/smack/packet/IQ;
    invoke-virtual {v0}, Lorg/jivesoftware/smack/PacketCollector;->cancel()V

    .line 427
    if-nez v2, :cond_1

    .line 428
    new-instance v3, Lorg/jivesoftware/smack/XMPPException;

    const-string/jumbo v4, "No response from the server."

    invoke-direct {v3, v4}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 430
    :cond_1
    invoke-virtual {v2}, Lorg/jivesoftware/smack/packet/IQ;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v3

    if-eqz v3, :cond_2

    .line 431
    new-instance v3, Lorg/jivesoftware/smack/XMPPException;

    invoke-virtual {v2}, Lorg/jivesoftware/smack/packet/IQ;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/jivesoftware/smack/XMPPException;-><init>(Lorg/jivesoftware/smack/packet/XMPPError;)V

    throw v3

    .line 435
    :cond_2
    invoke-direct {p0}, Lorg/jivesoftware/smackx/workgroup/user/Workgroup;->fireQueueDepartedEvent()V

    goto :goto_0
.end method

.method public getChatSetting(Ljava/lang/String;)Lorg/jivesoftware/smackx/workgroup/settings/ChatSetting;
    .locals 2
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 630
    const/4 v1, -0x1

    invoke-direct {p0, p1, v1}, Lorg/jivesoftware/smackx/workgroup/user/Workgroup;->getChatSettings(Ljava/lang/String;I)Lorg/jivesoftware/smackx/workgroup/settings/ChatSettings;

    move-result-object v0

    .line 631
    .local v0, "chatSettings":Lorg/jivesoftware/smackx/workgroup/settings/ChatSettings;
    invoke-virtual {v0}, Lorg/jivesoftware/smackx/workgroup/settings/ChatSettings;->getFirstEntry()Lorg/jivesoftware/smackx/workgroup/settings/ChatSetting;

    move-result-object v1

    return-object v1
.end method

.method public getChatSettings()Lorg/jivesoftware/smackx/workgroup/settings/ChatSettings;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 652
    const/4 v0, 0x0

    const/4 v1, -0x1

    invoke-direct {p0, v0, v1}, Lorg/jivesoftware/smackx/workgroup/user/Workgroup;->getChatSettings(Ljava/lang/String;I)Lorg/jivesoftware/smackx/workgroup/settings/ChatSettings;

    move-result-object v0

    return-object v0
.end method

.method public getChatSettings(I)Lorg/jivesoftware/smackx/workgroup/settings/ChatSettings;
    .locals 1
    .param p1, "type"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 642
    const/4 v0, 0x0

    invoke-direct {p0, v0, p1}, Lorg/jivesoftware/smackx/workgroup/user/Workgroup;->getChatSettings(Ljava/lang/String;I)Lorg/jivesoftware/smackx/workgroup/settings/ChatSettings;

    move-result-object v0

    return-object v0
.end method

.method public getOfflineSettings()Lorg/jivesoftware/smackx/workgroup/settings/OfflineSettings;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 716
    new-instance v1, Lorg/jivesoftware/smackx/workgroup/settings/OfflineSettings;

    invoke-direct {v1}, Lorg/jivesoftware/smackx/workgroup/settings/OfflineSettings;-><init>()V

    .line 717
    .local v1, "request":Lorg/jivesoftware/smackx/workgroup/settings/OfflineSettings;
    sget-object v3, Lorg/jivesoftware/smack/packet/IQ$Type;->GET:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {v1, v3}, Lorg/jivesoftware/smackx/workgroup/settings/OfflineSettings;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 718
    iget-object v3, p0, Lorg/jivesoftware/smackx/workgroup/user/Workgroup;->workgroupJID:Ljava/lang/String;

    invoke-virtual {v1, v3}, Lorg/jivesoftware/smackx/workgroup/settings/OfflineSettings;->setTo(Ljava/lang/String;)V

    .line 720
    iget-object v3, p0, Lorg/jivesoftware/smackx/workgroup/user/Workgroup;->connection:Lorg/jivesoftware/smack/Connection;

    new-instance v4, Lorg/jivesoftware/smack/filter/PacketIDFilter;

    invoke-virtual {v1}, Lorg/jivesoftware/smackx/workgroup/settings/OfflineSettings;->getPacketID()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/jivesoftware/smack/filter/PacketIDFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v4}, Lorg/jivesoftware/smack/Connection;->createPacketCollector(Lorg/jivesoftware/smack/filter/PacketFilter;)Lorg/jivesoftware/smack/PacketCollector;

    move-result-object v0

    .line 721
    .local v0, "collector":Lorg/jivesoftware/smack/PacketCollector;
    iget-object v3, p0, Lorg/jivesoftware/smackx/workgroup/user/Workgroup;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v3, v1}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 724
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getPacketReplyTimeout()I

    move-result v3

    int-to-long v4, v3

    invoke-virtual {v0, v4, v5}, Lorg/jivesoftware/smack/PacketCollector;->nextResult(J)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v2

    check-cast v2, Lorg/jivesoftware/smackx/workgroup/settings/OfflineSettings;

    .line 727
    .local v2, "response":Lorg/jivesoftware/smackx/workgroup/settings/OfflineSettings;
    invoke-virtual {v0}, Lorg/jivesoftware/smack/PacketCollector;->cancel()V

    .line 728
    if-nez v2, :cond_0

    .line 729
    new-instance v3, Lorg/jivesoftware/smack/XMPPException;

    const-string/jumbo v4, "No response from server."

    invoke-direct {v3, v4}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 731
    :cond_0
    invoke-virtual {v2}, Lorg/jivesoftware/smackx/workgroup/settings/OfflineSettings;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 732
    new-instance v3, Lorg/jivesoftware/smack/XMPPException;

    invoke-virtual {v2}, Lorg/jivesoftware/smackx/workgroup/settings/OfflineSettings;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/jivesoftware/smack/XMPPException;-><init>(Lorg/jivesoftware/smack/packet/XMPPError;)V

    throw v3

    .line 734
    :cond_1
    return-object v2
.end method

.method public getQueuePosition()I
    .locals 1

    .prologue
    .line 194
    iget v0, p0, Lorg/jivesoftware/smackx/workgroup/user/Workgroup;->queuePosition:I

    return v0
.end method

.method public getQueueRemainingTime()I
    .locals 1

    .prologue
    .line 208
    iget v0, p0, Lorg/jivesoftware/smackx/workgroup/user/Workgroup;->queueRemainingTime:I

    return v0
.end method

.method public getSoundSettings()Lorg/jivesoftware/smackx/workgroup/settings/SoundSettings;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 744
    new-instance v1, Lorg/jivesoftware/smackx/workgroup/settings/SoundSettings;

    invoke-direct {v1}, Lorg/jivesoftware/smackx/workgroup/settings/SoundSettings;-><init>()V

    .line 745
    .local v1, "request":Lorg/jivesoftware/smackx/workgroup/settings/SoundSettings;
    sget-object v3, Lorg/jivesoftware/smack/packet/IQ$Type;->GET:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {v1, v3}, Lorg/jivesoftware/smackx/workgroup/settings/SoundSettings;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 746
    iget-object v3, p0, Lorg/jivesoftware/smackx/workgroup/user/Workgroup;->workgroupJID:Ljava/lang/String;

    invoke-virtual {v1, v3}, Lorg/jivesoftware/smackx/workgroup/settings/SoundSettings;->setTo(Ljava/lang/String;)V

    .line 748
    iget-object v3, p0, Lorg/jivesoftware/smackx/workgroup/user/Workgroup;->connection:Lorg/jivesoftware/smack/Connection;

    new-instance v4, Lorg/jivesoftware/smack/filter/PacketIDFilter;

    invoke-virtual {v1}, Lorg/jivesoftware/smackx/workgroup/settings/SoundSettings;->getPacketID()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/jivesoftware/smack/filter/PacketIDFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v4}, Lorg/jivesoftware/smack/Connection;->createPacketCollector(Lorg/jivesoftware/smack/filter/PacketFilter;)Lorg/jivesoftware/smack/PacketCollector;

    move-result-object v0

    .line 749
    .local v0, "collector":Lorg/jivesoftware/smack/PacketCollector;
    iget-object v3, p0, Lorg/jivesoftware/smackx/workgroup/user/Workgroup;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v3, v1}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 752
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getPacketReplyTimeout()I

    move-result v3

    int-to-long v4, v3

    invoke-virtual {v0, v4, v5}, Lorg/jivesoftware/smack/PacketCollector;->nextResult(J)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v2

    check-cast v2, Lorg/jivesoftware/smackx/workgroup/settings/SoundSettings;

    .line 755
    .local v2, "response":Lorg/jivesoftware/smackx/workgroup/settings/SoundSettings;
    invoke-virtual {v0}, Lorg/jivesoftware/smack/PacketCollector;->cancel()V

    .line 756
    if-nez v2, :cond_0

    .line 757
    new-instance v3, Lorg/jivesoftware/smack/XMPPException;

    const-string/jumbo v4, "No response from server."

    invoke-direct {v3, v4}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 759
    :cond_0
    invoke-virtual {v2}, Lorg/jivesoftware/smackx/workgroup/settings/SoundSettings;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 760
    new-instance v3, Lorg/jivesoftware/smack/XMPPException;

    invoke-virtual {v2}, Lorg/jivesoftware/smackx/workgroup/settings/SoundSettings;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/jivesoftware/smack/XMPPException;-><init>(Lorg/jivesoftware/smack/packet/XMPPError;)V

    throw v3

    .line 762
    :cond_1
    return-object v2
.end method

.method public getWorkgroupForm()Lorg/jivesoftware/smackx/Form;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 833
    new-instance v2, Lorg/jivesoftware/smackx/workgroup/ext/forms/WorkgroupForm;

    invoke-direct {v2}, Lorg/jivesoftware/smackx/workgroup/ext/forms/WorkgroupForm;-><init>()V

    .line 834
    .local v2, "workgroupForm":Lorg/jivesoftware/smackx/workgroup/ext/forms/WorkgroupForm;
    sget-object v3, Lorg/jivesoftware/smack/packet/IQ$Type;->GET:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {v2, v3}, Lorg/jivesoftware/smackx/workgroup/ext/forms/WorkgroupForm;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 835
    iget-object v3, p0, Lorg/jivesoftware/smackx/workgroup/user/Workgroup;->workgroupJID:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lorg/jivesoftware/smackx/workgroup/ext/forms/WorkgroupForm;->setTo(Ljava/lang/String;)V

    .line 837
    iget-object v3, p0, Lorg/jivesoftware/smackx/workgroup/user/Workgroup;->connection:Lorg/jivesoftware/smack/Connection;

    new-instance v4, Lorg/jivesoftware/smack/filter/PacketIDFilter;

    invoke-virtual {v2}, Lorg/jivesoftware/smackx/workgroup/ext/forms/WorkgroupForm;->getPacketID()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/jivesoftware/smack/filter/PacketIDFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v4}, Lorg/jivesoftware/smack/Connection;->createPacketCollector(Lorg/jivesoftware/smack/filter/PacketFilter;)Lorg/jivesoftware/smack/PacketCollector;

    move-result-object v0

    .line 838
    .local v0, "collector":Lorg/jivesoftware/smack/PacketCollector;
    iget-object v3, p0, Lorg/jivesoftware/smackx/workgroup/user/Workgroup;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v3, v2}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 840
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getPacketReplyTimeout()I

    move-result v3

    int-to-long v4, v3

    invoke-virtual {v0, v4, v5}, Lorg/jivesoftware/smack/PacketCollector;->nextResult(J)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v1

    check-cast v1, Lorg/jivesoftware/smackx/workgroup/ext/forms/WorkgroupForm;

    .line 843
    .local v1, "response":Lorg/jivesoftware/smackx/workgroup/ext/forms/WorkgroupForm;
    invoke-virtual {v0}, Lorg/jivesoftware/smack/PacketCollector;->cancel()V

    .line 844
    if-nez v1, :cond_0

    .line 845
    new-instance v3, Lorg/jivesoftware/smack/XMPPException;

    const-string/jumbo v4, "No response from server on status set."

    invoke-direct {v3, v4}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 847
    :cond_0
    invoke-virtual {v1}, Lorg/jivesoftware/smackx/workgroup/ext/forms/WorkgroupForm;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 848
    new-instance v3, Lorg/jivesoftware/smack/XMPPException;

    invoke-virtual {v1}, Lorg/jivesoftware/smackx/workgroup/ext/forms/WorkgroupForm;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/jivesoftware/smack/XMPPException;-><init>(Lorg/jivesoftware/smack/packet/XMPPError;)V

    throw v3

    .line 850
    :cond_1
    invoke-static {v1}, Lorg/jivesoftware/smackx/Form;->getFormFrom(Lorg/jivesoftware/smack/packet/Packet;)Lorg/jivesoftware/smackx/Form;

    move-result-object v3

    return-object v3
.end method

.method public getWorkgroupJID()Ljava/lang/String;
    .locals 1

    .prologue
    .line 139
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/user/Workgroup;->workgroupJID:Ljava/lang/String;

    return-object v0
.end method

.method public getWorkgroupProperties()Lorg/jivesoftware/smackx/workgroup/settings/WorkgroupProperties;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 772
    new-instance v1, Lorg/jivesoftware/smackx/workgroup/settings/WorkgroupProperties;

    invoke-direct {v1}, Lorg/jivesoftware/smackx/workgroup/settings/WorkgroupProperties;-><init>()V

    .line 773
    .local v1, "request":Lorg/jivesoftware/smackx/workgroup/settings/WorkgroupProperties;
    sget-object v3, Lorg/jivesoftware/smack/packet/IQ$Type;->GET:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {v1, v3}, Lorg/jivesoftware/smackx/workgroup/settings/WorkgroupProperties;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 774
    iget-object v3, p0, Lorg/jivesoftware/smackx/workgroup/user/Workgroup;->workgroupJID:Ljava/lang/String;

    invoke-virtual {v1, v3}, Lorg/jivesoftware/smackx/workgroup/settings/WorkgroupProperties;->setTo(Ljava/lang/String;)V

    .line 776
    iget-object v3, p0, Lorg/jivesoftware/smackx/workgroup/user/Workgroup;->connection:Lorg/jivesoftware/smack/Connection;

    new-instance v4, Lorg/jivesoftware/smack/filter/PacketIDFilter;

    invoke-virtual {v1}, Lorg/jivesoftware/smackx/workgroup/settings/WorkgroupProperties;->getPacketID()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/jivesoftware/smack/filter/PacketIDFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v4}, Lorg/jivesoftware/smack/Connection;->createPacketCollector(Lorg/jivesoftware/smack/filter/PacketFilter;)Lorg/jivesoftware/smack/PacketCollector;

    move-result-object v0

    .line 777
    .local v0, "collector":Lorg/jivesoftware/smack/PacketCollector;
    iget-object v3, p0, Lorg/jivesoftware/smackx/workgroup/user/Workgroup;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v3, v1}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 780
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getPacketReplyTimeout()I

    move-result v3

    int-to-long v4, v3

    invoke-virtual {v0, v4, v5}, Lorg/jivesoftware/smack/PacketCollector;->nextResult(J)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v2

    check-cast v2, Lorg/jivesoftware/smackx/workgroup/settings/WorkgroupProperties;

    .line 783
    .local v2, "response":Lorg/jivesoftware/smackx/workgroup/settings/WorkgroupProperties;
    invoke-virtual {v0}, Lorg/jivesoftware/smack/PacketCollector;->cancel()V

    .line 784
    if-nez v2, :cond_0

    .line 785
    new-instance v3, Lorg/jivesoftware/smack/XMPPException;

    const-string/jumbo v4, "No response from server."

    invoke-direct {v3, v4}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 787
    :cond_0
    invoke-virtual {v2}, Lorg/jivesoftware/smackx/workgroup/settings/WorkgroupProperties;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 788
    new-instance v3, Lorg/jivesoftware/smack/XMPPException;

    invoke-virtual {v2}, Lorg/jivesoftware/smackx/workgroup/settings/WorkgroupProperties;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/jivesoftware/smack/XMPPException;-><init>(Lorg/jivesoftware/smack/packet/XMPPError;)V

    throw v3

    .line 790
    :cond_1
    return-object v2
.end method

.method public getWorkgroupProperties(Ljava/lang/String;)Lorg/jivesoftware/smackx/workgroup/settings/WorkgroupProperties;
    .locals 6
    .param p1, "jid"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 801
    new-instance v1, Lorg/jivesoftware/smackx/workgroup/settings/WorkgroupProperties;

    invoke-direct {v1}, Lorg/jivesoftware/smackx/workgroup/settings/WorkgroupProperties;-><init>()V

    .line 802
    .local v1, "request":Lorg/jivesoftware/smackx/workgroup/settings/WorkgroupProperties;
    invoke-virtual {v1, p1}, Lorg/jivesoftware/smackx/workgroup/settings/WorkgroupProperties;->setJid(Ljava/lang/String;)V

    .line 803
    sget-object v3, Lorg/jivesoftware/smack/packet/IQ$Type;->GET:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {v1, v3}, Lorg/jivesoftware/smackx/workgroup/settings/WorkgroupProperties;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 804
    iget-object v3, p0, Lorg/jivesoftware/smackx/workgroup/user/Workgroup;->workgroupJID:Ljava/lang/String;

    invoke-virtual {v1, v3}, Lorg/jivesoftware/smackx/workgroup/settings/WorkgroupProperties;->setTo(Ljava/lang/String;)V

    .line 806
    iget-object v3, p0, Lorg/jivesoftware/smackx/workgroup/user/Workgroup;->connection:Lorg/jivesoftware/smack/Connection;

    new-instance v4, Lorg/jivesoftware/smack/filter/PacketIDFilter;

    invoke-virtual {v1}, Lorg/jivesoftware/smackx/workgroup/settings/WorkgroupProperties;->getPacketID()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/jivesoftware/smack/filter/PacketIDFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v4}, Lorg/jivesoftware/smack/Connection;->createPacketCollector(Lorg/jivesoftware/smack/filter/PacketFilter;)Lorg/jivesoftware/smack/PacketCollector;

    move-result-object v0

    .line 807
    .local v0, "collector":Lorg/jivesoftware/smack/PacketCollector;
    iget-object v3, p0, Lorg/jivesoftware/smackx/workgroup/user/Workgroup;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v3, v1}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 810
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getPacketReplyTimeout()I

    move-result v3

    int-to-long v4, v3

    invoke-virtual {v0, v4, v5}, Lorg/jivesoftware/smack/PacketCollector;->nextResult(J)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v2

    check-cast v2, Lorg/jivesoftware/smackx/workgroup/settings/WorkgroupProperties;

    .line 813
    .local v2, "response":Lorg/jivesoftware/smackx/workgroup/settings/WorkgroupProperties;
    invoke-virtual {v0}, Lorg/jivesoftware/smack/PacketCollector;->cancel()V

    .line 814
    if-nez v2, :cond_0

    .line 815
    new-instance v3, Lorg/jivesoftware/smack/XMPPException;

    const-string/jumbo v4, "No response from server."

    invoke-direct {v3, v4}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 817
    :cond_0
    invoke-virtual {v2}, Lorg/jivesoftware/smackx/workgroup/settings/WorkgroupProperties;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 818
    new-instance v3, Lorg/jivesoftware/smack/XMPPException;

    invoke-virtual {v2}, Lorg/jivesoftware/smackx/workgroup/settings/WorkgroupProperties;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/jivesoftware/smack/XMPPException;-><init>(Lorg/jivesoftware/smack/packet/XMPPError;)V

    throw v3

    .line 820
    :cond_1
    return-object v2
.end method

.method public isAvailable()Z
    .locals 10

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 158
    new-instance v1, Lorg/jivesoftware/smack/packet/Presence;

    sget-object v7, Lorg/jivesoftware/smack/packet/Presence$Type;->available:Lorg/jivesoftware/smack/packet/Presence$Type;

    invoke-direct {v1, v7}, Lorg/jivesoftware/smack/packet/Presence;-><init>(Lorg/jivesoftware/smack/packet/Presence$Type;)V

    .line 159
    .local v1, "directedPresence":Lorg/jivesoftware/smack/packet/Presence;
    iget-object v7, p0, Lorg/jivesoftware/smackx/workgroup/user/Workgroup;->workgroupJID:Ljava/lang/String;

    invoke-virtual {v1, v7}, Lorg/jivesoftware/smack/packet/Presence;->setTo(Ljava/lang/String;)V

    .line 160
    new-instance v4, Lorg/jivesoftware/smack/filter/PacketTypeFilter;

    const-class v7, Lorg/jivesoftware/smack/packet/Presence;

    invoke-direct {v4, v7}, Lorg/jivesoftware/smack/filter/PacketTypeFilter;-><init>(Ljava/lang/Class;)V

    .line 161
    .local v4, "typeFilter":Lorg/jivesoftware/smack/filter/PacketFilter;
    new-instance v2, Lorg/jivesoftware/smack/filter/FromContainsFilter;

    iget-object v7, p0, Lorg/jivesoftware/smackx/workgroup/user/Workgroup;->workgroupJID:Ljava/lang/String;

    invoke-direct {v2, v7}, Lorg/jivesoftware/smack/filter/FromContainsFilter;-><init>(Ljava/lang/String;)V

    .line 162
    .local v2, "fromFilter":Lorg/jivesoftware/smack/filter/PacketFilter;
    iget-object v7, p0, Lorg/jivesoftware/smackx/workgroup/user/Workgroup;->connection:Lorg/jivesoftware/smack/Connection;

    new-instance v8, Lorg/jivesoftware/smack/filter/AndFilter;

    const/4 v9, 0x2

    new-array v9, v9, [Lorg/jivesoftware/smack/filter/PacketFilter;

    aput-object v2, v9, v6

    aput-object v4, v9, v5

    invoke-direct {v8, v9}, Lorg/jivesoftware/smack/filter/AndFilter;-><init>([Lorg/jivesoftware/smack/filter/PacketFilter;)V

    invoke-virtual {v7, v8}, Lorg/jivesoftware/smack/Connection;->createPacketCollector(Lorg/jivesoftware/smack/filter/PacketFilter;)Lorg/jivesoftware/smack/PacketCollector;

    move-result-object v0

    .line 165
    .local v0, "collector":Lorg/jivesoftware/smack/PacketCollector;
    iget-object v7, p0, Lorg/jivesoftware/smackx/workgroup/user/Workgroup;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v7, v1}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 167
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getPacketReplyTimeout()I

    move-result v7

    int-to-long v8, v7

    invoke-virtual {v0, v8, v9}, Lorg/jivesoftware/smack/PacketCollector;->nextResult(J)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v3

    check-cast v3, Lorg/jivesoftware/smack/packet/Presence;

    .line 170
    .local v3, "response":Lorg/jivesoftware/smack/packet/Presence;
    invoke-virtual {v0}, Lorg/jivesoftware/smack/PacketCollector;->cancel()V

    .line 171
    if-nez v3, :cond_1

    .line 178
    :cond_0
    :goto_0
    return v6

    .line 174
    :cond_1
    invoke-virtual {v3}, Lorg/jivesoftware/smack/packet/Presence;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v7

    if-nez v7, :cond_0

    .line 178
    sget-object v7, Lorg/jivesoftware/smack/packet/Presence$Type;->available:Lorg/jivesoftware/smack/packet/Presence$Type;

    invoke-virtual {v3}, Lorg/jivesoftware/smack/packet/Presence;->getType()Lorg/jivesoftware/smack/packet/Presence$Type;

    move-result-object v8

    if-ne v7, v8, :cond_2

    :goto_1
    move v6, v5

    goto :goto_0

    :cond_2
    move v5, v6

    goto :goto_1
.end method

.method public isEmailAvailable()Z
    .locals 5

    .prologue
    .line 697
    iget-object v4, p0, Lorg/jivesoftware/smackx/workgroup/user/Workgroup;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-static {v4}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->getInstanceFor(Lorg/jivesoftware/smack/Connection;)Lorg/jivesoftware/smackx/ServiceDiscoveryManager;

    move-result-object v0

    .line 700
    .local v0, "discoManager":Lorg/jivesoftware/smackx/ServiceDiscoveryManager;
    :try_start_0
    iget-object v4, p0, Lorg/jivesoftware/smackx/workgroup/user/Workgroup;->workgroupJID:Ljava/lang/String;

    invoke-static {v4}, Lorg/jivesoftware/smack/util/StringUtils;->parseServer(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 701
    .local v3, "workgroupService":Ljava/lang/String;
    invoke-virtual {v0, v3}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->discoverInfo(Ljava/lang/String;)Lorg/jivesoftware/smackx/packet/DiscoverInfo;

    move-result-object v2

    .line 702
    .local v2, "infoResult":Lorg/jivesoftware/smackx/packet/DiscoverInfo;
    const-string/jumbo v4, "jive:email:provider"

    invoke-virtual {v2, v4}, Lorg/jivesoftware/smackx/packet/DiscoverInfo;->containsFeature(Ljava/lang/String;)Z
    :try_end_0
    .catch Lorg/jivesoftware/smack/XMPPException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v4

    .line 705
    .end local v2    # "infoResult":Lorg/jivesoftware/smackx/packet/DiscoverInfo;
    .end local v3    # "workgroupService":Ljava/lang/String;
    :goto_0
    return v4

    .line 704
    :catch_0
    move-exception v1

    .line 705
    .local v1, "e":Lorg/jivesoftware/smack/XMPPException;
    const/4 v4, 0x0

    goto :goto_0
.end method

.method public isInQueue()Z
    .locals 1

    .prologue
    .line 148
    iget-boolean v0, p0, Lorg/jivesoftware/smackx/workgroup/user/Workgroup;->inQueue:Z

    return v0
.end method

.method public joinQueue()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 245
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/jivesoftware/smackx/workgroup/user/Workgroup;->joinQueue(Lorg/jivesoftware/smackx/Form;)V

    .line 246
    return-void
.end method

.method public joinQueue(Ljava/util/Map;Ljava/lang/String;)V
    .locals 10
    .param p2, "userID"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 381
    .local p1, "metadata":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    iget-boolean v7, p0, Lorg/jivesoftware/smackx/workgroup/user/Workgroup;->inQueue:Z

    if-eqz v7, :cond_0

    .line 382
    new-instance v7, Ljava/lang/IllegalStateException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "Already in queue "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lorg/jivesoftware/smackx/workgroup/user/Workgroup;->workgroupJID:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 386
    :cond_0
    new-instance v3, Lorg/jivesoftware/smackx/Form;

    const-string/jumbo v7, "submit"

    invoke-direct {v3, v7}, Lorg/jivesoftware/smackx/Form;-><init>(Ljava/lang/String;)V

    .line 387
    .local v3, "form":Lorg/jivesoftware/smackx/Form;
    invoke-interface {p1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .line 388
    .local v4, "iter":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_1

    .line 389
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 390
    .local v5, "name":Ljava/lang/String;
    invoke-interface {p1, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    .line 392
    .local v6, "value":Ljava/lang/String;
    invoke-static {v5}, Lorg/jivesoftware/smack/util/StringUtils;->escapeForXML(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 393
    .local v0, "escapedName":Ljava/lang/String;
    invoke-static {v6}, Lorg/jivesoftware/smack/util/StringUtils;->escapeForXML(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 395
    .local v1, "escapedValue":Ljava/lang/String;
    new-instance v2, Lorg/jivesoftware/smackx/FormField;

    invoke-direct {v2, v0}, Lorg/jivesoftware/smackx/FormField;-><init>(Ljava/lang/String;)V

    .line 396
    .local v2, "field":Lorg/jivesoftware/smackx/FormField;
    const-string/jumbo v7, "text-single"

    invoke-virtual {v2, v7}, Lorg/jivesoftware/smackx/FormField;->setType(Ljava/lang/String;)V

    .line 397
    invoke-virtual {v3, v2}, Lorg/jivesoftware/smackx/Form;->addField(Lorg/jivesoftware/smackx/FormField;)V

    .line 398
    invoke-virtual {v3, v0, v1}, Lorg/jivesoftware/smackx/Form;->setAnswer(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 400
    .end local v0    # "escapedName":Ljava/lang/String;
    .end local v1    # "escapedValue":Ljava/lang/String;
    .end local v2    # "field":Lorg/jivesoftware/smackx/FormField;
    .end local v5    # "name":Ljava/lang/String;
    .end local v6    # "value":Ljava/lang/String;
    :cond_1
    invoke-virtual {p0, v3, p2}, Lorg/jivesoftware/smackx/workgroup/user/Workgroup;->joinQueue(Lorg/jivesoftware/smackx/Form;Ljava/lang/String;)V

    .line 401
    return-void
.end method

.method public joinQueue(Lorg/jivesoftware/smackx/Form;)V
    .locals 1
    .param p1, "answerForm"    # Lorg/jivesoftware/smackx/Form;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 282
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lorg/jivesoftware/smackx/workgroup/user/Workgroup;->joinQueue(Lorg/jivesoftware/smackx/Form;Ljava/lang/String;)V

    .line 283
    return-void
.end method

.method public joinQueue(Lorg/jivesoftware/smackx/Form;Ljava/lang/String;)V
    .locals 6
    .param p1, "answerForm"    # Lorg/jivesoftware/smackx/Form;
    .param p2, "userID"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 320
    iget-boolean v3, p0, Lorg/jivesoftware/smackx/workgroup/user/Workgroup;->inQueue:Z

    if-eqz v3, :cond_0

    .line 321
    new-instance v3, Ljava/lang/IllegalStateException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "Already in queue "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lorg/jivesoftware/smackx/workgroup/user/Workgroup;->workgroupJID:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 324
    :cond_0
    new-instance v1, Lorg/jivesoftware/smackx/workgroup/user/Workgroup$JoinQueuePacket;

    iget-object v3, p0, Lorg/jivesoftware/smackx/workgroup/user/Workgroup;->workgroupJID:Ljava/lang/String;

    invoke-direct {v1, p0, v3, p1, p2}, Lorg/jivesoftware/smackx/workgroup/user/Workgroup$JoinQueuePacket;-><init>(Lorg/jivesoftware/smackx/workgroup/user/Workgroup;Ljava/lang/String;Lorg/jivesoftware/smackx/Form;Ljava/lang/String;)V

    .line 327
    .local v1, "joinPacket":Lorg/jivesoftware/smackx/workgroup/user/Workgroup$JoinQueuePacket;
    iget-object v3, p0, Lorg/jivesoftware/smackx/workgroup/user/Workgroup;->connection:Lorg/jivesoftware/smack/Connection;

    new-instance v4, Lorg/jivesoftware/smack/filter/PacketIDFilter;

    invoke-virtual {v1}, Lorg/jivesoftware/smackx/workgroup/user/Workgroup$JoinQueuePacket;->getPacketID()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/jivesoftware/smack/filter/PacketIDFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v4}, Lorg/jivesoftware/smack/Connection;->createPacketCollector(Lorg/jivesoftware/smack/filter/PacketFilter;)Lorg/jivesoftware/smack/PacketCollector;

    move-result-object v0

    .line 329
    .local v0, "collector":Lorg/jivesoftware/smack/PacketCollector;
    iget-object v3, p0, Lorg/jivesoftware/smackx/workgroup/user/Workgroup;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v3, v1}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 331
    const-wide/16 v4, 0x2710

    invoke-virtual {v0, v4, v5}, Lorg/jivesoftware/smack/PacketCollector;->nextResult(J)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v2

    check-cast v2, Lorg/jivesoftware/smack/packet/IQ;

    .line 334
    .local v2, "response":Lorg/jivesoftware/smack/packet/IQ;
    invoke-virtual {v0}, Lorg/jivesoftware/smack/PacketCollector;->cancel()V

    .line 335
    if-nez v2, :cond_1

    .line 336
    new-instance v3, Lorg/jivesoftware/smack/XMPPException;

    const-string/jumbo v4, "No response from the server."

    invoke-direct {v3, v4}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 338
    :cond_1
    invoke-virtual {v2}, Lorg/jivesoftware/smack/packet/IQ;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v3

    if-eqz v3, :cond_2

    .line 339
    new-instance v3, Lorg/jivesoftware/smack/XMPPException;

    invoke-virtual {v2}, Lorg/jivesoftware/smack/packet/IQ;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/jivesoftware/smack/XMPPException;-><init>(Lorg/jivesoftware/smack/packet/XMPPError;)V

    throw v3

    .line 343
    :cond_2
    invoke-direct {p0}, Lorg/jivesoftware/smackx/workgroup/user/Workgroup;->fireQueueJoinedEvent()V

    .line 344
    return-void
.end method

.method public removeQueueListener(Lorg/jivesoftware/smackx/workgroup/WorkgroupInvitationListener;)V
    .locals 2
    .param p1, "invitationListener"    # Lorg/jivesoftware/smackx/workgroup/WorkgroupInvitationListener;

    .prologue
    .line 483
    iget-object v1, p0, Lorg/jivesoftware/smackx/workgroup/user/Workgroup;->invitationListeners:Ljava/util/List;

    monitor-enter v1

    .line 484
    :try_start_0
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/user/Workgroup;->invitationListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 485
    monitor-exit v1

    .line 486
    return-void

    .line 485
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public removeQueueListener(Lorg/jivesoftware/smackx/workgroup/user/QueueListener;)V
    .locals 2
    .param p1, "queueListener"    # Lorg/jivesoftware/smackx/workgroup/user/QueueListener;

    .prologue
    .line 458
    iget-object v1, p0, Lorg/jivesoftware/smackx/workgroup/user/Workgroup;->queueListeners:Ljava/util/List;

    monitor-enter v1

    .line 459
    :try_start_0
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/user/Workgroup;->queueListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 460
    monitor-exit v1

    .line 461
    return-void

    .line 460
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
