.class Lorg/jivesoftware/smackx/muc/MultiUserChat$InvitationsMonitor;
.super Ljava/lang/Object;
.source "MultiUserChat.java"

# interfaces
.implements Lorg/jivesoftware/smack/ConnectionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jivesoftware/smackx/muc/MultiUserChat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "InvitationsMonitor"
.end annotation


# static fields
.field private static final monitors:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lorg/jivesoftware/smack/Connection;",
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lorg/jivesoftware/smackx/muc/MultiUserChat$InvitationsMonitor;",
            ">;>;"
        }
    .end annotation
.end field


# instance fields
.field private connection:Lorg/jivesoftware/smack/Connection;

.field private invitationFilter:Lorg/jivesoftware/smack/filter/PacketFilter;

.field private invitationPacketListener:Lorg/jivesoftware/smack/PacketListener;

.field private final invitationsListeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smackx/muc/InvitationListener;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 2576
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Lorg/jivesoftware/smackx/muc/MultiUserChat$InvitationsMonitor;->monitors:Ljava/util/Map;

    return-void
.end method

.method private constructor <init>(Lorg/jivesoftware/smack/Connection;)V
    .locals 1
    .param p1, "connection"    # Lorg/jivesoftware/smack/Connection;

    .prologue
    .line 2610
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2579
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat$InvitationsMonitor;->invitationsListeners:Ljava/util/List;

    .line 2611
    iput-object p1, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat$InvitationsMonitor;->connection:Lorg/jivesoftware/smack/Connection;

    .line 2612
    return-void
.end method

.method static synthetic access$1200(Lorg/jivesoftware/smackx/muc/MultiUserChat$InvitationsMonitor;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/jivesoftware/smack/packet/Message;)V
    .locals 0
    .param p0, "x0"    # Lorg/jivesoftware/smackx/muc/MultiUserChat$InvitationsMonitor;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Ljava/lang/String;
    .param p3, "x3"    # Ljava/lang/String;
    .param p4, "x4"    # Ljava/lang/String;
    .param p5, "x5"    # Lorg/jivesoftware/smack/packet/Message;

    .prologue
    .line 2573
    invoke-direct/range {p0 .. p5}, Lorg/jivesoftware/smackx/muc/MultiUserChat$InvitationsMonitor;->fireInvitationListeners(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/jivesoftware/smack/packet/Message;)V

    return-void
.end method

.method private cancel()V
    .locals 2

    .prologue
    .line 2729
    iget-object v0, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat$InvitationsMonitor;->connection:Lorg/jivesoftware/smack/Connection;

    iget-object v1, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat$InvitationsMonitor;->invitationPacketListener:Lorg/jivesoftware/smack/PacketListener;

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smack/Connection;->removePacketListener(Lorg/jivesoftware/smack/PacketListener;)V

    .line 2730
    iget-object v0, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat$InvitationsMonitor;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v0, p0}, Lorg/jivesoftware/smack/Connection;->removeConnectionListener(Lorg/jivesoftware/smack/ConnectionListener;)V

    .line 2731
    return-void
.end method

.method private fireInvitationListeners(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/jivesoftware/smack/packet/Message;)V
    .locals 11
    .param p1, "room"    # Ljava/lang/String;
    .param p2, "inviter"    # Ljava/lang/String;
    .param p3, "reason"    # Ljava/lang/String;
    .param p4, "password"    # Ljava/lang/String;
    .param p5, "message"    # Lorg/jivesoftware/smack/packet/Message;

    .prologue
    .line 2665
    iget-object v2, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat$InvitationsMonitor;->invitationsListeners:Ljava/util/List;

    monitor-enter v2

    .line 2666
    :try_start_0
    iget-object v1, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat$InvitationsMonitor;->invitationsListeners:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    new-array v10, v1, [Lorg/jivesoftware/smackx/muc/InvitationListener;

    .line 2667
    .local v10, "listeners":[Lorg/jivesoftware/smackx/muc/InvitationListener;
    iget-object v1, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat$InvitationsMonitor;->invitationsListeners:Ljava/util/List;

    invoke-interface {v1, v10}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 2668
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2669
    move-object v7, v10

    .local v7, "arr$":[Lorg/jivesoftware/smackx/muc/InvitationListener;
    array-length v9, v7

    .local v9, "len$":I
    const/4 v8, 0x0

    .local v8, "i$":I
    :goto_0
    if-ge v8, v9, :cond_0

    aget-object v0, v7, v8

    .line 2670
    .local v0, "listener":Lorg/jivesoftware/smackx/muc/InvitationListener;
    iget-object v1, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat$InvitationsMonitor;->connection:Lorg/jivesoftware/smack/Connection;

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    move-object/from16 v6, p5

    invoke-interface/range {v0 .. v6}, Lorg/jivesoftware/smackx/muc/InvitationListener;->invitationReceived(Lorg/jivesoftware/smack/Connection;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/jivesoftware/smack/packet/Message;)V

    .line 2669
    add-int/lit8 v8, v8, 0x1

    goto :goto_0

    .line 2668
    .end local v0    # "listener":Lorg/jivesoftware/smackx/muc/InvitationListener;
    .end local v7    # "arr$":[Lorg/jivesoftware/smackx/muc/InvitationListener;
    .end local v8    # "i$":I
    .end local v9    # "len$":I
    .end local v10    # "listeners":[Lorg/jivesoftware/smackx/muc/InvitationListener;
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1

    .line 2672
    .restart local v7    # "arr$":[Lorg/jivesoftware/smackx/muc/InvitationListener;
    .restart local v8    # "i$":I
    .restart local v9    # "len$":I
    .restart local v10    # "listeners":[Lorg/jivesoftware/smackx/muc/InvitationListener;
    :cond_0
    return-void
.end method

.method public static getInvitationsMonitor(Lorg/jivesoftware/smack/Connection;)Lorg/jivesoftware/smackx/muc/MultiUserChat$InvitationsMonitor;
    .locals 4
    .param p0, "conn"    # Lorg/jivesoftware/smack/Connection;

    .prologue
    .line 2592
    sget-object v1, Lorg/jivesoftware/smackx/muc/MultiUserChat$InvitationsMonitor;->monitors:Ljava/util/Map;

    monitor-enter v1

    .line 2593
    :try_start_0
    sget-object v0, Lorg/jivesoftware/smackx/muc/MultiUserChat$InvitationsMonitor;->monitors:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 2597
    sget-object v0, Lorg/jivesoftware/smackx/muc/MultiUserChat$InvitationsMonitor;->monitors:Ljava/util/Map;

    new-instance v2, Ljava/lang/ref/WeakReference;

    new-instance v3, Lorg/jivesoftware/smackx/muc/MultiUserChat$InvitationsMonitor;

    invoke-direct {v3, p0}, Lorg/jivesoftware/smackx/muc/MultiUserChat$InvitationsMonitor;-><init>(Lorg/jivesoftware/smack/Connection;)V

    invoke-direct {v2, v3}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-interface {v0, p0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2600
    :cond_0
    sget-object v0, Lorg/jivesoftware/smackx/muc/MultiUserChat$InvitationsMonitor;->monitors:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smackx/muc/MultiUserChat$InvitationsMonitor;

    monitor-exit v1

    return-object v0

    .line 2601
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method private init()V
    .locals 3

    .prologue
    .line 2703
    new-instance v0, Lorg/jivesoftware/smack/filter/PacketExtensionFilter;

    const-string/jumbo v1, "x"

    const-string/jumbo v2, "http://jabber.org/protocol/muc#user"

    invoke-direct {v0, v1, v2}, Lorg/jivesoftware/smack/filter/PacketExtensionFilter;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    iput-object v0, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat$InvitationsMonitor;->invitationFilter:Lorg/jivesoftware/smack/filter/PacketFilter;

    .line 2705
    new-instance v0, Lorg/jivesoftware/smackx/muc/MultiUserChat$InvitationsMonitor$1;

    invoke-direct {v0, p0}, Lorg/jivesoftware/smackx/muc/MultiUserChat$InvitationsMonitor$1;-><init>(Lorg/jivesoftware/smackx/muc/MultiUserChat$InvitationsMonitor;)V

    iput-object v0, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat$InvitationsMonitor;->invitationPacketListener:Lorg/jivesoftware/smack/PacketListener;

    .line 2719
    iget-object v0, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat$InvitationsMonitor;->connection:Lorg/jivesoftware/smack/Connection;

    iget-object v1, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat$InvitationsMonitor;->invitationPacketListener:Lorg/jivesoftware/smack/PacketListener;

    iget-object v2, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat$InvitationsMonitor;->invitationFilter:Lorg/jivesoftware/smack/filter/PacketFilter;

    invoke-virtual {v0, v1, v2}, Lorg/jivesoftware/smack/Connection;->addPacketListener(Lorg/jivesoftware/smack/PacketListener;Lorg/jivesoftware/smack/filter/PacketFilter;)V

    .line 2722
    iget-object v0, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat$InvitationsMonitor;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v0, p0}, Lorg/jivesoftware/smack/Connection;->addConnectionListener(Lorg/jivesoftware/smack/ConnectionListener;)V

    .line 2723
    return-void
.end method


# virtual methods
.method public addInvitationListener(Lorg/jivesoftware/smackx/muc/InvitationListener;)V
    .locals 2
    .param p1, "listener"    # Lorg/jivesoftware/smackx/muc/InvitationListener;

    .prologue
    .line 2624
    iget-object v1, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat$InvitationsMonitor;->invitationsListeners:Ljava/util/List;

    monitor-enter v1

    .line 2627
    :try_start_0
    iget-object v0, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat$InvitationsMonitor;->invitationsListeners:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-nez v0, :cond_0

    .line 2628
    invoke-direct {p0}, Lorg/jivesoftware/smackx/muc/MultiUserChat$InvitationsMonitor;->init()V

    .line 2630
    :cond_0
    iget-object v0, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat$InvitationsMonitor;->invitationsListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 2631
    iget-object v0, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat$InvitationsMonitor;->invitationsListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 2633
    :cond_1
    monitor-exit v1

    .line 2634
    return-void

    .line 2633
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public connectionClosed()V
    .locals 0

    .prologue
    .line 2675
    invoke-direct {p0}, Lorg/jivesoftware/smackx/muc/MultiUserChat$InvitationsMonitor;->cancel()V

    .line 2676
    return-void
.end method

.method public connectionClosedOnError(Ljava/lang/Exception;)V
    .locals 0
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 2680
    return-void
.end method

.method public reconnectingIn(I)V
    .locals 0
    .param p1, "seconds"    # I

    .prologue
    .line 2684
    return-void
.end method

.method public reconnectionFailed(Ljava/lang/Exception;)V
    .locals 0
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 2692
    return-void
.end method

.method public reconnectionSuccessful()V
    .locals 0

    .prologue
    .line 2688
    return-void
.end method

.method public removeInvitationListener(Lorg/jivesoftware/smackx/muc/InvitationListener;)V
    .locals 2
    .param p1, "listener"    # Lorg/jivesoftware/smackx/muc/InvitationListener;

    .prologue
    .line 2647
    iget-object v1, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat$InvitationsMonitor;->invitationsListeners:Ljava/util/List;

    monitor-enter v1

    .line 2648
    :try_start_0
    iget-object v0, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat$InvitationsMonitor;->invitationsListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2649
    iget-object v0, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat$InvitationsMonitor;->invitationsListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 2653
    :cond_0
    iget-object v0, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat$InvitationsMonitor;->invitationsListeners:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-nez v0, :cond_1

    .line 2654
    invoke-direct {p0}, Lorg/jivesoftware/smackx/muc/MultiUserChat$InvitationsMonitor;->cancel()V

    .line 2656
    :cond_1
    monitor-exit v1

    .line 2657
    return-void

    .line 2656
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
