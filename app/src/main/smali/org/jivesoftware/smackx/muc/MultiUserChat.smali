.class public Lorg/jivesoftware/smackx/muc/MultiUserChat;
.super Ljava/lang/Object;
.source "MultiUserChat.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jivesoftware/smackx/muc/MultiUserChat$InvitationsMonitor;
    }
.end annotation


# static fields
.field private static final discoNamespace:Ljava/lang/String; = "http://jabber.org/protocol/muc"

.field private static final discoNode:Ljava/lang/String; = "http://jabber.org/protocol/muc#rooms"

.field private static joinedRooms:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lorg/jivesoftware/smack/Connection;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field


# instance fields
.field private connection:Lorg/jivesoftware/smack/Connection;

.field private connectionListeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smack/PacketListener;",
            ">;"
        }
    .end annotation
.end field

.field private final invitationRejectionListeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smackx/muc/InvitationRejectionListener;",
            ">;"
        }
    .end annotation
.end field

.field private joined:Z

.field private messageCollector:Lorg/jivesoftware/smackx/muc/ConnectionDetachedPacketCollector;

.field private messageFilter:Lorg/jivesoftware/smack/filter/PacketFilter;

.field private nickname:Ljava/lang/String;

.field private occupantsMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/jivesoftware/smack/packet/Presence;",
            ">;"
        }
    .end annotation
.end field

.field private final participantStatusListeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smackx/muc/ParticipantStatusListener;",
            ">;"
        }
    .end annotation
.end field

.field private presenceFilter:Lorg/jivesoftware/smack/filter/PacketFilter;

.field private presenceInterceptors:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smack/PacketInterceptor;",
            ">;"
        }
    .end annotation
.end field

.field private room:Ljava/lang/String;

.field private roomListenerMultiplexor:Lorg/jivesoftware/smackx/muc/RoomListenerMultiplexor;

.field private subject:Ljava/lang/String;

.field private final subjectUpdatedListeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smackx/muc/SubjectUpdatedListener;",
            ">;"
        }
    .end annotation
.end field

.field private final userStatusListeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smackx/muc/UserStatusListener;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 83
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->joinedRooms:Ljava/util/Map;

    .line 110
    new-instance v0, Lorg/jivesoftware/smackx/muc/MultiUserChat$1;

    invoke-direct {v0}, Lorg/jivesoftware/smackx/muc/MultiUserChat$1;-><init>()V

    invoke-static {v0}, Lorg/jivesoftware/smack/Connection;->addConnectionCreationListener(Lorg/jivesoftware/smack/ConnectionCreationListener;)V

    .line 145
    return-void
.end method

.method public constructor <init>(Lorg/jivesoftware/smack/Connection;Ljava/lang/String;)V
    .locals 1
    .param p1, "connection"    # Lorg/jivesoftware/smack/Connection;
    .param p2, "room"    # Ljava/lang/String;

    .prologue
    .line 162
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 89
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->nickname:Ljava/lang/String;

    .line 90
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->joined:Z

    .line 91
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->occupantsMap:Ljava/util/Map;

    .line 93
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->invitationRejectionListeners:Ljava/util/List;

    .line 95
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->subjectUpdatedListeners:Ljava/util/List;

    .line 97
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->userStatusListeners:Ljava/util/List;

    .line 99
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->participantStatusListeners:Ljava/util/List;

    .line 103
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->presenceInterceptors:Ljava/util/List;

    .line 107
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->connectionListeners:Ljava/util/List;

    .line 163
    iput-object p1, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->connection:Lorg/jivesoftware/smack/Connection;

    .line 164
    invoke-virtual {p2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->room:Ljava/lang/String;

    .line 165
    invoke-direct {p0}, Lorg/jivesoftware/smackx/muc/MultiUserChat;->init()V

    .line 166
    return-void
.end method

.method static synthetic access$000(Lorg/jivesoftware/smack/Connection;)Ljava/util/Iterator;
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smack/Connection;

    .prologue
    .line 78
    invoke-static {p0}, Lorg/jivesoftware/smackx/muc/MultiUserChat;->getJoinedRooms(Lorg/jivesoftware/smack/Connection;)Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1000(Lorg/jivesoftware/smackx/muc/MultiUserChat;Ljava/lang/String;ZLorg/jivesoftware/smackx/packet/MUCUser;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lorg/jivesoftware/smackx/muc/MultiUserChat;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Z
    .param p3, "x3"    # Lorg/jivesoftware/smackx/packet/MUCUser;
    .param p4, "x4"    # Ljava/lang/String;

    .prologue
    .line 78
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/jivesoftware/smackx/muc/MultiUserChat;->checkPresenceCode(Ljava/lang/String;ZLorg/jivesoftware/smackx/packet/MUCUser;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$102(Lorg/jivesoftware/smackx/muc/MultiUserChat;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Lorg/jivesoftware/smackx/muc/MultiUserChat;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 78
    iput-object p1, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->subject:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$1100(Lorg/jivesoftware/smackx/muc/MultiUserChat;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lorg/jivesoftware/smackx/muc/MultiUserChat;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Ljava/lang/String;

    .prologue
    .line 78
    invoke-direct {p0, p1, p2}, Lorg/jivesoftware/smackx/muc/MultiUserChat;->fireInvitationRejectionListeners(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$200(Lorg/jivesoftware/smackx/muc/MultiUserChat;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lorg/jivesoftware/smackx/muc/MultiUserChat;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Ljava/lang/String;

    .prologue
    .line 78
    invoke-direct {p0, p1, p2}, Lorg/jivesoftware/smackx/muc/MultiUserChat;->fireSubjectUpdatedListeners(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$300(Lorg/jivesoftware/smackx/muc/MultiUserChat;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smackx/muc/MultiUserChat;

    .prologue
    .line 78
    iget-object v0, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->room:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$400(Lorg/jivesoftware/smackx/muc/MultiUserChat;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smackx/muc/MultiUserChat;

    .prologue
    .line 78
    iget-object v0, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->nickname:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$500(Lorg/jivesoftware/smackx/muc/MultiUserChat;)Ljava/util/Map;
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smackx/muc/MultiUserChat;

    .prologue
    .line 78
    iget-object v0, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->occupantsMap:Ljava/util/Map;

    return-object v0
.end method

.method static synthetic access$600(Lorg/jivesoftware/smackx/muc/MultiUserChat;Lorg/jivesoftware/smack/packet/Packet;)Lorg/jivesoftware/smackx/packet/MUCUser;
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smackx/muc/MultiUserChat;
    .param p1, "x1"    # Lorg/jivesoftware/smack/packet/Packet;

    .prologue
    .line 78
    invoke-direct {p0, p1}, Lorg/jivesoftware/smackx/muc/MultiUserChat;->getMUCUserExtension(Lorg/jivesoftware/smack/packet/Packet;)Lorg/jivesoftware/smackx/packet/MUCUser;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$700(Lorg/jivesoftware/smackx/muc/MultiUserChat;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lorg/jivesoftware/smackx/muc/MultiUserChat;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Ljava/lang/String;
    .param p3, "x3"    # Z
    .param p4, "x4"    # Ljava/lang/String;

    .prologue
    .line 78
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/jivesoftware/smackx/muc/MultiUserChat;->checkRoleModifications(Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)V

    return-void
.end method

.method static synthetic access$800(Lorg/jivesoftware/smackx/muc/MultiUserChat;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lorg/jivesoftware/smackx/muc/MultiUserChat;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Ljava/lang/String;
    .param p3, "x3"    # Z
    .param p4, "x4"    # Ljava/lang/String;

    .prologue
    .line 78
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/jivesoftware/smackx/muc/MultiUserChat;->checkAffiliationModifications(Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)V

    return-void
.end method

.method static synthetic access$900(Lorg/jivesoftware/smackx/muc/MultiUserChat;Ljava/lang/String;Ljava/util/List;)V
    .locals 0
    .param p0, "x0"    # Lorg/jivesoftware/smackx/muc/MultiUserChat;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Ljava/util/List;

    .prologue
    .line 78
    invoke-direct {p0, p1, p2}, Lorg/jivesoftware/smackx/muc/MultiUserChat;->fireParticipantStatusListeners(Ljava/lang/String;Ljava/util/List;)V

    return-void
.end method

.method public static addInvitationListener(Lorg/jivesoftware/smack/Connection;Lorg/jivesoftware/smackx/muc/InvitationListener;)V
    .locals 1
    .param p0, "conn"    # Lorg/jivesoftware/smack/Connection;
    .param p1, "listener"    # Lorg/jivesoftware/smackx/muc/InvitationListener;

    .prologue
    .line 800
    invoke-static {p0}, Lorg/jivesoftware/smackx/muc/MultiUserChat$InvitationsMonitor;->getInvitationsMonitor(Lorg/jivesoftware/smack/Connection;)Lorg/jivesoftware/smackx/muc/MultiUserChat$InvitationsMonitor;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/jivesoftware/smackx/muc/MultiUserChat$InvitationsMonitor;->addInvitationListener(Lorg/jivesoftware/smackx/muc/InvitationListener;)V

    .line 801
    return-void
.end method

.method private changeAffiliationByAdmin(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 8
    .param p1, "jid"    # Ljava/lang/String;
    .param p2, "affiliation"    # Ljava/lang/String;
    .param p3, "reason"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 1442
    new-instance v1, Lorg/jivesoftware/smackx/packet/MUCAdmin;

    invoke-direct {v1}, Lorg/jivesoftware/smackx/packet/MUCAdmin;-><init>()V

    .line 1443
    .local v1, "iq":Lorg/jivesoftware/smackx/packet/MUCAdmin;
    iget-object v5, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->room:Ljava/lang/String;

    invoke-virtual {v1, v5}, Lorg/jivesoftware/smackx/packet/MUCAdmin;->setTo(Ljava/lang/String;)V

    .line 1444
    sget-object v5, Lorg/jivesoftware/smack/packet/IQ$Type;->SET:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {v1, v5}, Lorg/jivesoftware/smackx/packet/MUCAdmin;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 1446
    new-instance v2, Lorg/jivesoftware/smackx/packet/MUCAdmin$Item;

    const/4 v5, 0x0

    invoke-direct {v2, p2, v5}, Lorg/jivesoftware/smackx/packet/MUCAdmin$Item;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 1447
    .local v2, "item":Lorg/jivesoftware/smackx/packet/MUCAdmin$Item;
    invoke-virtual {v2, p1}, Lorg/jivesoftware/smackx/packet/MUCAdmin$Item;->setJid(Ljava/lang/String;)V

    .line 1448
    invoke-virtual {v2, p3}, Lorg/jivesoftware/smackx/packet/MUCAdmin$Item;->setReason(Ljava/lang/String;)V

    .line 1449
    invoke-virtual {v1, v2}, Lorg/jivesoftware/smackx/packet/MUCAdmin;->addItem(Lorg/jivesoftware/smackx/packet/MUCAdmin$Item;)V

    .line 1452
    new-instance v4, Lorg/jivesoftware/smack/filter/PacketIDFilter;

    invoke-virtual {v1}, Lorg/jivesoftware/smackx/packet/MUCAdmin;->getPacketID()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/jivesoftware/smack/filter/PacketIDFilter;-><init>(Ljava/lang/String;)V

    .line 1453
    .local v4, "responseFilter":Lorg/jivesoftware/smack/filter/PacketFilter;
    iget-object v5, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v5, v4}, Lorg/jivesoftware/smack/Connection;->createPacketCollector(Lorg/jivesoftware/smack/filter/PacketFilter;)Lorg/jivesoftware/smack/PacketCollector;

    move-result-object v3

    .line 1455
    .local v3, "response":Lorg/jivesoftware/smack/PacketCollector;
    iget-object v5, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v5, v1}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 1457
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getPacketReplyTimeout()I

    move-result v5

    int-to-long v6, v5

    invoke-virtual {v3, v6, v7}, Lorg/jivesoftware/smack/PacketCollector;->nextResult(J)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smack/packet/IQ;

    .line 1459
    .local v0, "answer":Lorg/jivesoftware/smack/packet/IQ;
    invoke-virtual {v3}, Lorg/jivesoftware/smack/PacketCollector;->cancel()V

    .line 1461
    if-nez v0, :cond_0

    .line 1462
    new-instance v5, Lorg/jivesoftware/smack/XMPPException;

    const-string/jumbo v6, "No response from server."

    invoke-direct {v5, v6}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 1464
    :cond_0
    invoke-virtual {v0}, Lorg/jivesoftware/smack/packet/IQ;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v5

    if-eqz v5, :cond_1

    .line 1465
    new-instance v5, Lorg/jivesoftware/smack/XMPPException;

    invoke-virtual {v0}, Lorg/jivesoftware/smack/packet/IQ;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v6

    invoke-direct {v5, v6}, Lorg/jivesoftware/smack/XMPPException;-><init>(Lorg/jivesoftware/smack/packet/XMPPError;)V

    throw v5

    .line 1467
    :cond_1
    return-void
.end method

.method private changeAffiliationByAdmin(Ljava/util/Collection;Ljava/lang/String;)V
    .locals 10
    .param p2, "affiliation"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
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
    .line 1471
    .local p1, "jids":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    new-instance v2, Lorg/jivesoftware/smackx/packet/MUCAdmin;

    invoke-direct {v2}, Lorg/jivesoftware/smackx/packet/MUCAdmin;-><init>()V

    .line 1472
    .local v2, "iq":Lorg/jivesoftware/smackx/packet/MUCAdmin;
    iget-object v7, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->room:Ljava/lang/String;

    invoke-virtual {v2, v7}, Lorg/jivesoftware/smackx/packet/MUCAdmin;->setTo(Ljava/lang/String;)V

    .line 1473
    sget-object v7, Lorg/jivesoftware/smack/packet/IQ$Type;->SET:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {v2, v7}, Lorg/jivesoftware/smackx/packet/MUCAdmin;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 1474
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 1476
    .local v4, "jid":Ljava/lang/String;
    new-instance v3, Lorg/jivesoftware/smackx/packet/MUCAdmin$Item;

    const/4 v7, 0x0

    invoke-direct {v3, p2, v7}, Lorg/jivesoftware/smackx/packet/MUCAdmin$Item;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 1477
    .local v3, "item":Lorg/jivesoftware/smackx/packet/MUCAdmin$Item;
    invoke-virtual {v3, v4}, Lorg/jivesoftware/smackx/packet/MUCAdmin$Item;->setJid(Ljava/lang/String;)V

    .line 1478
    invoke-virtual {v2, v3}, Lorg/jivesoftware/smackx/packet/MUCAdmin;->addItem(Lorg/jivesoftware/smackx/packet/MUCAdmin$Item;)V

    goto :goto_0

    .line 1482
    .end local v3    # "item":Lorg/jivesoftware/smackx/packet/MUCAdmin$Item;
    .end local v4    # "jid":Ljava/lang/String;
    :cond_0
    new-instance v6, Lorg/jivesoftware/smack/filter/PacketIDFilter;

    invoke-virtual {v2}, Lorg/jivesoftware/smackx/packet/MUCAdmin;->getPacketID()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lorg/jivesoftware/smack/filter/PacketIDFilter;-><init>(Ljava/lang/String;)V

    .line 1483
    .local v6, "responseFilter":Lorg/jivesoftware/smack/filter/PacketFilter;
    iget-object v7, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v7, v6}, Lorg/jivesoftware/smack/Connection;->createPacketCollector(Lorg/jivesoftware/smack/filter/PacketFilter;)Lorg/jivesoftware/smack/PacketCollector;

    move-result-object v5

    .line 1485
    .local v5, "response":Lorg/jivesoftware/smack/PacketCollector;
    iget-object v7, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v7, v2}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 1487
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getPacketReplyTimeout()I

    move-result v7

    int-to-long v8, v7

    invoke-virtual {v5, v8, v9}, Lorg/jivesoftware/smack/PacketCollector;->nextResult(J)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smack/packet/IQ;

    .line 1489
    .local v0, "answer":Lorg/jivesoftware/smack/packet/IQ;
    invoke-virtual {v5}, Lorg/jivesoftware/smack/PacketCollector;->cancel()V

    .line 1491
    if-nez v0, :cond_1

    .line 1492
    new-instance v7, Lorg/jivesoftware/smack/XMPPException;

    const-string/jumbo v8, "No response from server."

    invoke-direct {v7, v8}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 1494
    :cond_1
    invoke-virtual {v0}, Lorg/jivesoftware/smack/packet/IQ;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v7

    if-eqz v7, :cond_2

    .line 1495
    new-instance v7, Lorg/jivesoftware/smack/XMPPException;

    invoke-virtual {v0}, Lorg/jivesoftware/smack/packet/IQ;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v8

    invoke-direct {v7, v8}, Lorg/jivesoftware/smack/XMPPException;-><init>(Lorg/jivesoftware/smack/packet/XMPPError;)V

    throw v7

    .line 1497
    :cond_2
    return-void
.end method

.method private changeAffiliationByOwner(Ljava/lang/String;Ljava/lang/String;)V
    .locals 8
    .param p1, "jid"    # Ljava/lang/String;
    .param p2, "affiliation"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 1376
    new-instance v1, Lorg/jivesoftware/smackx/packet/MUCOwner;

    invoke-direct {v1}, Lorg/jivesoftware/smackx/packet/MUCOwner;-><init>()V

    .line 1377
    .local v1, "iq":Lorg/jivesoftware/smackx/packet/MUCOwner;
    iget-object v5, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->room:Ljava/lang/String;

    invoke-virtual {v1, v5}, Lorg/jivesoftware/smackx/packet/MUCOwner;->setTo(Ljava/lang/String;)V

    .line 1378
    sget-object v5, Lorg/jivesoftware/smack/packet/IQ$Type;->SET:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {v1, v5}, Lorg/jivesoftware/smackx/packet/MUCOwner;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 1380
    new-instance v2, Lorg/jivesoftware/smackx/packet/MUCOwner$Item;

    invoke-direct {v2, p2}, Lorg/jivesoftware/smackx/packet/MUCOwner$Item;-><init>(Ljava/lang/String;)V

    .line 1381
    .local v2, "item":Lorg/jivesoftware/smackx/packet/MUCOwner$Item;
    invoke-virtual {v2, p1}, Lorg/jivesoftware/smackx/packet/MUCOwner$Item;->setJid(Ljava/lang/String;)V

    .line 1382
    invoke-virtual {v1, v2}, Lorg/jivesoftware/smackx/packet/MUCOwner;->addItem(Lorg/jivesoftware/smackx/packet/MUCOwner$Item;)V

    .line 1385
    new-instance v4, Lorg/jivesoftware/smack/filter/PacketIDFilter;

    invoke-virtual {v1}, Lorg/jivesoftware/smackx/packet/MUCOwner;->getPacketID()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/jivesoftware/smack/filter/PacketIDFilter;-><init>(Ljava/lang/String;)V

    .line 1386
    .local v4, "responseFilter":Lorg/jivesoftware/smack/filter/PacketFilter;
    iget-object v5, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v5, v4}, Lorg/jivesoftware/smack/Connection;->createPacketCollector(Lorg/jivesoftware/smack/filter/PacketFilter;)Lorg/jivesoftware/smack/PacketCollector;

    move-result-object v3

    .line 1388
    .local v3, "response":Lorg/jivesoftware/smack/PacketCollector;
    iget-object v5, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v5, v1}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 1390
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getPacketReplyTimeout()I

    move-result v5

    int-to-long v6, v5

    invoke-virtual {v3, v6, v7}, Lorg/jivesoftware/smack/PacketCollector;->nextResult(J)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smack/packet/IQ;

    .line 1392
    .local v0, "answer":Lorg/jivesoftware/smack/packet/IQ;
    invoke-virtual {v3}, Lorg/jivesoftware/smack/PacketCollector;->cancel()V

    .line 1394
    if-nez v0, :cond_0

    .line 1395
    new-instance v5, Lorg/jivesoftware/smack/XMPPException;

    const-string/jumbo v6, "No response from server."

    invoke-direct {v5, v6}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 1397
    :cond_0
    invoke-virtual {v0}, Lorg/jivesoftware/smack/packet/IQ;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v5

    if-eqz v5, :cond_1

    .line 1398
    new-instance v5, Lorg/jivesoftware/smack/XMPPException;

    invoke-virtual {v0}, Lorg/jivesoftware/smack/packet/IQ;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v6

    invoke-direct {v5, v6}, Lorg/jivesoftware/smack/XMPPException;-><init>(Lorg/jivesoftware/smack/packet/XMPPError;)V

    throw v5

    .line 1400
    :cond_1
    return-void
.end method

.method private changeAffiliationByOwner(Ljava/util/Collection;Ljava/lang/String;)V
    .locals 10
    .param p2, "affiliation"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
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
    .line 1404
    .local p1, "jids":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    new-instance v2, Lorg/jivesoftware/smackx/packet/MUCOwner;

    invoke-direct {v2}, Lorg/jivesoftware/smackx/packet/MUCOwner;-><init>()V

    .line 1405
    .local v2, "iq":Lorg/jivesoftware/smackx/packet/MUCOwner;
    iget-object v7, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->room:Ljava/lang/String;

    invoke-virtual {v2, v7}, Lorg/jivesoftware/smackx/packet/MUCOwner;->setTo(Ljava/lang/String;)V

    .line 1406
    sget-object v7, Lorg/jivesoftware/smack/packet/IQ$Type;->SET:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {v2, v7}, Lorg/jivesoftware/smackx/packet/MUCOwner;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 1407
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 1409
    .local v4, "jid":Ljava/lang/String;
    new-instance v3, Lorg/jivesoftware/smackx/packet/MUCOwner$Item;

    invoke-direct {v3, p2}, Lorg/jivesoftware/smackx/packet/MUCOwner$Item;-><init>(Ljava/lang/String;)V

    .line 1410
    .local v3, "item":Lorg/jivesoftware/smackx/packet/MUCOwner$Item;
    invoke-virtual {v3, v4}, Lorg/jivesoftware/smackx/packet/MUCOwner$Item;->setJid(Ljava/lang/String;)V

    .line 1411
    invoke-virtual {v2, v3}, Lorg/jivesoftware/smackx/packet/MUCOwner;->addItem(Lorg/jivesoftware/smackx/packet/MUCOwner$Item;)V

    goto :goto_0

    .line 1415
    .end local v3    # "item":Lorg/jivesoftware/smackx/packet/MUCOwner$Item;
    .end local v4    # "jid":Ljava/lang/String;
    :cond_0
    new-instance v6, Lorg/jivesoftware/smack/filter/PacketIDFilter;

    invoke-virtual {v2}, Lorg/jivesoftware/smackx/packet/MUCOwner;->getPacketID()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lorg/jivesoftware/smack/filter/PacketIDFilter;-><init>(Ljava/lang/String;)V

    .line 1416
    .local v6, "responseFilter":Lorg/jivesoftware/smack/filter/PacketFilter;
    iget-object v7, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v7, v6}, Lorg/jivesoftware/smack/Connection;->createPacketCollector(Lorg/jivesoftware/smack/filter/PacketFilter;)Lorg/jivesoftware/smack/PacketCollector;

    move-result-object v5

    .line 1418
    .local v5, "response":Lorg/jivesoftware/smack/PacketCollector;
    iget-object v7, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v7, v2}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 1420
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getPacketReplyTimeout()I

    move-result v7

    int-to-long v8, v7

    invoke-virtual {v5, v8, v9}, Lorg/jivesoftware/smack/PacketCollector;->nextResult(J)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smack/packet/IQ;

    .line 1422
    .local v0, "answer":Lorg/jivesoftware/smack/packet/IQ;
    invoke-virtual {v5}, Lorg/jivesoftware/smack/PacketCollector;->cancel()V

    .line 1424
    if-nez v0, :cond_1

    .line 1425
    new-instance v7, Lorg/jivesoftware/smack/XMPPException;

    const-string/jumbo v8, "No response from server."

    invoke-direct {v7, v8}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 1427
    :cond_1
    invoke-virtual {v0}, Lorg/jivesoftware/smack/packet/IQ;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v7

    if-eqz v7, :cond_2

    .line 1428
    new-instance v7, Lorg/jivesoftware/smack/XMPPException;

    invoke-virtual {v0}, Lorg/jivesoftware/smack/packet/IQ;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v8

    invoke-direct {v7, v8}, Lorg/jivesoftware/smack/XMPPException;-><init>(Lorg/jivesoftware/smack/packet/XMPPError;)V

    throw v7

    .line 1430
    :cond_2
    return-void
.end method

.method private changeRole(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 8
    .param p1, "nickname"    # Ljava/lang/String;
    .param p2, "role"    # Ljava/lang/String;
    .param p3, "reason"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 1500
    new-instance v1, Lorg/jivesoftware/smackx/packet/MUCAdmin;

    invoke-direct {v1}, Lorg/jivesoftware/smackx/packet/MUCAdmin;-><init>()V

    .line 1501
    .local v1, "iq":Lorg/jivesoftware/smackx/packet/MUCAdmin;
    iget-object v5, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->room:Ljava/lang/String;

    invoke-virtual {v1, v5}, Lorg/jivesoftware/smackx/packet/MUCAdmin;->setTo(Ljava/lang/String;)V

    .line 1502
    sget-object v5, Lorg/jivesoftware/smack/packet/IQ$Type;->SET:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {v1, v5}, Lorg/jivesoftware/smackx/packet/MUCAdmin;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 1504
    new-instance v2, Lorg/jivesoftware/smackx/packet/MUCAdmin$Item;

    const/4 v5, 0x0

    invoke-direct {v2, v5, p2}, Lorg/jivesoftware/smackx/packet/MUCAdmin$Item;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 1505
    .local v2, "item":Lorg/jivesoftware/smackx/packet/MUCAdmin$Item;
    invoke-virtual {v2, p1}, Lorg/jivesoftware/smackx/packet/MUCAdmin$Item;->setNick(Ljava/lang/String;)V

    .line 1506
    invoke-virtual {v2, p3}, Lorg/jivesoftware/smackx/packet/MUCAdmin$Item;->setReason(Ljava/lang/String;)V

    .line 1507
    invoke-virtual {v1, v2}, Lorg/jivesoftware/smackx/packet/MUCAdmin;->addItem(Lorg/jivesoftware/smackx/packet/MUCAdmin$Item;)V

    .line 1510
    new-instance v4, Lorg/jivesoftware/smack/filter/PacketIDFilter;

    invoke-virtual {v1}, Lorg/jivesoftware/smackx/packet/MUCAdmin;->getPacketID()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/jivesoftware/smack/filter/PacketIDFilter;-><init>(Ljava/lang/String;)V

    .line 1511
    .local v4, "responseFilter":Lorg/jivesoftware/smack/filter/PacketFilter;
    iget-object v5, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v5, v4}, Lorg/jivesoftware/smack/Connection;->createPacketCollector(Lorg/jivesoftware/smack/filter/PacketFilter;)Lorg/jivesoftware/smack/PacketCollector;

    move-result-object v3

    .line 1513
    .local v3, "response":Lorg/jivesoftware/smack/PacketCollector;
    iget-object v5, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v5, v1}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 1515
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getPacketReplyTimeout()I

    move-result v5

    int-to-long v6, v5

    invoke-virtual {v3, v6, v7}, Lorg/jivesoftware/smack/PacketCollector;->nextResult(J)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smack/packet/IQ;

    .line 1517
    .local v0, "answer":Lorg/jivesoftware/smack/packet/IQ;
    invoke-virtual {v3}, Lorg/jivesoftware/smack/PacketCollector;->cancel()V

    .line 1519
    if-nez v0, :cond_0

    .line 1520
    new-instance v5, Lorg/jivesoftware/smack/XMPPException;

    const-string/jumbo v6, "No response from server."

    invoke-direct {v5, v6}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 1522
    :cond_0
    invoke-virtual {v0}, Lorg/jivesoftware/smack/packet/IQ;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v5

    if-eqz v5, :cond_1

    .line 1523
    new-instance v5, Lorg/jivesoftware/smack/XMPPException;

    invoke-virtual {v0}, Lorg/jivesoftware/smack/packet/IQ;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v6

    invoke-direct {v5, v6}, Lorg/jivesoftware/smack/XMPPException;-><init>(Lorg/jivesoftware/smack/packet/XMPPError;)V

    throw v5

    .line 1525
    :cond_1
    return-void
.end method

.method private changeRole(Ljava/util/Collection;Ljava/lang/String;)V
    .locals 10
    .param p2, "role"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
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
    .line 1528
    .local p1, "nicknames":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    new-instance v2, Lorg/jivesoftware/smackx/packet/MUCAdmin;

    invoke-direct {v2}, Lorg/jivesoftware/smackx/packet/MUCAdmin;-><init>()V

    .line 1529
    .local v2, "iq":Lorg/jivesoftware/smackx/packet/MUCAdmin;
    iget-object v7, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->room:Ljava/lang/String;

    invoke-virtual {v2, v7}, Lorg/jivesoftware/smackx/packet/MUCAdmin;->setTo(Ljava/lang/String;)V

    .line 1530
    sget-object v7, Lorg/jivesoftware/smack/packet/IQ$Type;->SET:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {v2, v7}, Lorg/jivesoftware/smackx/packet/MUCAdmin;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 1531
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 1533
    .local v4, "nickname":Ljava/lang/String;
    new-instance v3, Lorg/jivesoftware/smackx/packet/MUCAdmin$Item;

    const/4 v7, 0x0

    invoke-direct {v3, v7, p2}, Lorg/jivesoftware/smackx/packet/MUCAdmin$Item;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 1534
    .local v3, "item":Lorg/jivesoftware/smackx/packet/MUCAdmin$Item;
    invoke-virtual {v3, v4}, Lorg/jivesoftware/smackx/packet/MUCAdmin$Item;->setNick(Ljava/lang/String;)V

    .line 1535
    invoke-virtual {v2, v3}, Lorg/jivesoftware/smackx/packet/MUCAdmin;->addItem(Lorg/jivesoftware/smackx/packet/MUCAdmin$Item;)V

    goto :goto_0

    .line 1539
    .end local v3    # "item":Lorg/jivesoftware/smackx/packet/MUCAdmin$Item;
    .end local v4    # "nickname":Ljava/lang/String;
    :cond_0
    new-instance v6, Lorg/jivesoftware/smack/filter/PacketIDFilter;

    invoke-virtual {v2}, Lorg/jivesoftware/smackx/packet/MUCAdmin;->getPacketID()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lorg/jivesoftware/smack/filter/PacketIDFilter;-><init>(Ljava/lang/String;)V

    .line 1540
    .local v6, "responseFilter":Lorg/jivesoftware/smack/filter/PacketFilter;
    iget-object v7, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v7, v6}, Lorg/jivesoftware/smack/Connection;->createPacketCollector(Lorg/jivesoftware/smack/filter/PacketFilter;)Lorg/jivesoftware/smack/PacketCollector;

    move-result-object v5

    .line 1542
    .local v5, "response":Lorg/jivesoftware/smack/PacketCollector;
    iget-object v7, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v7, v2}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 1544
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getPacketReplyTimeout()I

    move-result v7

    int-to-long v8, v7

    invoke-virtual {v5, v8, v9}, Lorg/jivesoftware/smack/PacketCollector;->nextResult(J)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smack/packet/IQ;

    .line 1546
    .local v0, "answer":Lorg/jivesoftware/smack/packet/IQ;
    invoke-virtual {v5}, Lorg/jivesoftware/smack/PacketCollector;->cancel()V

    .line 1548
    if-nez v0, :cond_1

    .line 1549
    new-instance v7, Lorg/jivesoftware/smack/XMPPException;

    const-string/jumbo v8, "No response from server."

    invoke-direct {v7, v8}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 1551
    :cond_1
    invoke-virtual {v0}, Lorg/jivesoftware/smack/packet/IQ;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v7

    if-eqz v7, :cond_2

    .line 1552
    new-instance v7, Lorg/jivesoftware/smack/XMPPException;

    invoke-virtual {v0}, Lorg/jivesoftware/smack/packet/IQ;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v8

    invoke-direct {v7, v8}, Lorg/jivesoftware/smack/XMPPException;-><init>(Lorg/jivesoftware/smack/packet/XMPPError;)V

    throw v7

    .line 1554
    :cond_2
    return-void
.end method

.method private checkAffiliationModifications(Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)V
    .locals 4
    .param p1, "oldAffiliation"    # Ljava/lang/String;
    .param p2, "newAffiliation"    # Ljava/lang/String;
    .param p3, "isUserModification"    # Z
    .param p4, "from"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 2398
    const-string/jumbo v1, "owner"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    const-string/jumbo v1, "owner"

    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    .line 2399
    if-eqz p3, :cond_2

    .line 2400
    const-string/jumbo v1, "ownershipRevoked"

    new-array v2, v3, [Ljava/lang/Object;

    invoke-direct {p0, v1, v2}, Lorg/jivesoftware/smackx/muc/MultiUserChat;->fireUserStatusListeners(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 2432
    :cond_0
    :goto_0
    const-string/jumbo v1, "owner"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_8

    const-string/jumbo v1, "owner"

    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    .line 2433
    if-eqz p3, :cond_7

    .line 2434
    const-string/jumbo v1, "ownershipGranted"

    new-array v2, v3, [Ljava/lang/Object;

    invoke-direct {p0, v1, v2}, Lorg/jivesoftware/smackx/muc/MultiUserChat;->fireUserStatusListeners(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 2464
    :cond_1
    :goto_1
    return-void

    .line 2403
    :cond_2
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 2404
    .local v0, "params":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v0, p4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 2405
    const-string/jumbo v1, "ownershipRevoked"

    invoke-direct {p0, v1, v0}, Lorg/jivesoftware/smackx/muc/MultiUserChat;->fireParticipantStatusListeners(Ljava/lang/String;Ljava/util/List;)V

    goto :goto_0

    .line 2409
    .end local v0    # "params":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_3
    const-string/jumbo v1, "admin"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    const-string/jumbo v1, "admin"

    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_5

    .line 2410
    if-eqz p3, :cond_4

    .line 2411
    const-string/jumbo v1, "adminRevoked"

    new-array v2, v3, [Ljava/lang/Object;

    invoke-direct {p0, v1, v2}, Lorg/jivesoftware/smackx/muc/MultiUserChat;->fireUserStatusListeners(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_0

    .line 2414
    :cond_4
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 2415
    .restart local v0    # "params":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v0, p4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 2416
    const-string/jumbo v1, "adminRevoked"

    invoke-direct {p0, v1, v0}, Lorg/jivesoftware/smackx/muc/MultiUserChat;->fireParticipantStatusListeners(Ljava/lang/String;Ljava/util/List;)V

    goto :goto_0

    .line 2420
    .end local v0    # "params":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_5
    const-string/jumbo v1, "member"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string/jumbo v1, "member"

    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 2421
    if-eqz p3, :cond_6

    .line 2422
    const-string/jumbo v1, "membershipRevoked"

    new-array v2, v3, [Ljava/lang/Object;

    invoke-direct {p0, v1, v2}, Lorg/jivesoftware/smackx/muc/MultiUserChat;->fireUserStatusListeners(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_0

    .line 2425
    :cond_6
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 2426
    .restart local v0    # "params":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v0, p4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 2427
    const-string/jumbo v1, "membershipRevoked"

    invoke-direct {p0, v1, v0}, Lorg/jivesoftware/smackx/muc/MultiUserChat;->fireParticipantStatusListeners(Ljava/lang/String;Ljava/util/List;)V

    goto/16 :goto_0

    .line 2437
    .end local v0    # "params":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_7
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 2438
    .restart local v0    # "params":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v0, p4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 2439
    const-string/jumbo v1, "ownershipGranted"

    invoke-direct {p0, v1, v0}, Lorg/jivesoftware/smackx/muc/MultiUserChat;->fireParticipantStatusListeners(Ljava/lang/String;Ljava/util/List;)V

    goto :goto_1

    .line 2443
    .end local v0    # "params":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_8
    const-string/jumbo v1, "admin"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_a

    const-string/jumbo v1, "admin"

    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_a

    .line 2444
    if-eqz p3, :cond_9

    .line 2445
    const-string/jumbo v1, "adminGranted"

    new-array v2, v3, [Ljava/lang/Object;

    invoke-direct {p0, v1, v2}, Lorg/jivesoftware/smackx/muc/MultiUserChat;->fireUserStatusListeners(Ljava/lang/String;[Ljava/lang/Object;)V

    goto/16 :goto_1

    .line 2448
    :cond_9
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 2449
    .restart local v0    # "params":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v0, p4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 2450
    const-string/jumbo v1, "adminGranted"

    invoke-direct {p0, v1, v0}, Lorg/jivesoftware/smackx/muc/MultiUserChat;->fireParticipantStatusListeners(Ljava/lang/String;Ljava/util/List;)V

    goto/16 :goto_1

    .line 2454
    .end local v0    # "params":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_a
    const-string/jumbo v1, "member"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string/jumbo v1, "member"

    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 2455
    if-eqz p3, :cond_b

    .line 2456
    const-string/jumbo v1, "membershipGranted"

    new-array v2, v3, [Ljava/lang/Object;

    invoke-direct {p0, v1, v2}, Lorg/jivesoftware/smackx/muc/MultiUserChat;->fireUserStatusListeners(Ljava/lang/String;[Ljava/lang/Object;)V

    goto/16 :goto_1

    .line 2459
    :cond_b
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 2460
    .restart local v0    # "params":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v0, p4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 2461
    const-string/jumbo v1, "membershipGranted"

    invoke-direct {p0, v1, v0}, Lorg/jivesoftware/smackx/muc/MultiUserChat;->fireParticipantStatusListeners(Ljava/lang/String;Ljava/util/List;)V

    goto/16 :goto_1
.end method

.method private checkPresenceCode(Ljava/lang/String;ZLorg/jivesoftware/smackx/packet/MUCUser;Ljava/lang/String;)V
    .locals 7
    .param p1, "code"    # Ljava/lang/String;
    .param p2, "isUserModification"    # Z
    .param p3, "mucUser"    # Lorg/jivesoftware/smackx/packet/MUCUser;
    .param p4, "from"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x2

    const/4 v6, 0x1

    const/4 v5, 0x0

    const/4 v4, 0x0

    .line 2480
    const-string/jumbo v1, "307"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 2482
    if-eqz p2, :cond_1

    .line 2483
    iput-boolean v4, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->joined:Z

    .line 2485
    const-string/jumbo v1, "kicked"

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {p3}, Lorg/jivesoftware/smackx/packet/MUCUser;->getItem()Lorg/jivesoftware/smackx/packet/MUCUser$Item;

    move-result-object v3

    invoke-virtual {v3}, Lorg/jivesoftware/smackx/packet/MUCUser$Item;->getActor()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v4

    invoke-virtual {p3}, Lorg/jivesoftware/smackx/packet/MUCUser;->getItem()Lorg/jivesoftware/smackx/packet/MUCUser$Item;

    move-result-object v3

    invoke-virtual {v3}, Lorg/jivesoftware/smackx/packet/MUCUser$Item;->getReason()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v6

    invoke-direct {p0, v1, v2}, Lorg/jivesoftware/smackx/muc/MultiUserChat;->fireUserStatusListeners(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 2490
    iget-object v1, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->occupantsMap:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->clear()V

    .line 2491
    iput-object v5, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->nickname:Ljava/lang/String;

    .line 2492
    invoke-direct {p0}, Lorg/jivesoftware/smackx/muc/MultiUserChat;->userHasLeft()V

    .line 2546
    :cond_0
    :goto_0
    return-void

    .line 2495
    :cond_1
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 2496
    .local v0, "params":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v0, p4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 2497
    invoke-virtual {p3}, Lorg/jivesoftware/smackx/packet/MUCUser;->getItem()Lorg/jivesoftware/smackx/packet/MUCUser$Item;

    move-result-object v1

    invoke-virtual {v1}, Lorg/jivesoftware/smackx/packet/MUCUser$Item;->getActor()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 2498
    invoke-virtual {p3}, Lorg/jivesoftware/smackx/packet/MUCUser;->getItem()Lorg/jivesoftware/smackx/packet/MUCUser$Item;

    move-result-object v1

    invoke-virtual {v1}, Lorg/jivesoftware/smackx/packet/MUCUser$Item;->getReason()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 2499
    const-string/jumbo v1, "kicked"

    invoke-direct {p0, v1, v0}, Lorg/jivesoftware/smackx/muc/MultiUserChat;->fireParticipantStatusListeners(Ljava/lang/String;Ljava/util/List;)V

    goto :goto_0

    .line 2503
    .end local v0    # "params":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_2
    const-string/jumbo v1, "301"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 2505
    if-eqz p2, :cond_3

    .line 2506
    iput-boolean v4, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->joined:Z

    .line 2508
    const-string/jumbo v1, "banned"

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {p3}, Lorg/jivesoftware/smackx/packet/MUCUser;->getItem()Lorg/jivesoftware/smackx/packet/MUCUser$Item;

    move-result-object v3

    invoke-virtual {v3}, Lorg/jivesoftware/smackx/packet/MUCUser$Item;->getActor()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v4

    invoke-virtual {p3}, Lorg/jivesoftware/smackx/packet/MUCUser;->getItem()Lorg/jivesoftware/smackx/packet/MUCUser$Item;

    move-result-object v3

    invoke-virtual {v3}, Lorg/jivesoftware/smackx/packet/MUCUser$Item;->getReason()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v6

    invoke-direct {p0, v1, v2}, Lorg/jivesoftware/smackx/muc/MultiUserChat;->fireUserStatusListeners(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 2513
    iget-object v1, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->occupantsMap:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->clear()V

    .line 2514
    iput-object v5, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->nickname:Ljava/lang/String;

    .line 2515
    invoke-direct {p0}, Lorg/jivesoftware/smackx/muc/MultiUserChat;->userHasLeft()V

    goto :goto_0

    .line 2518
    :cond_3
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 2519
    .restart local v0    # "params":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v0, p4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 2520
    invoke-virtual {p3}, Lorg/jivesoftware/smackx/packet/MUCUser;->getItem()Lorg/jivesoftware/smackx/packet/MUCUser$Item;

    move-result-object v1

    invoke-virtual {v1}, Lorg/jivesoftware/smackx/packet/MUCUser$Item;->getActor()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 2521
    invoke-virtual {p3}, Lorg/jivesoftware/smackx/packet/MUCUser;->getItem()Lorg/jivesoftware/smackx/packet/MUCUser$Item;

    move-result-object v1

    invoke-virtual {v1}, Lorg/jivesoftware/smackx/packet/MUCUser$Item;->getReason()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 2522
    const-string/jumbo v1, "banned"

    invoke-direct {p0, v1, v0}, Lorg/jivesoftware/smackx/muc/MultiUserChat;->fireParticipantStatusListeners(Ljava/lang/String;Ljava/util/List;)V

    goto :goto_0

    .line 2526
    .end local v0    # "params":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_4
    const-string/jumbo v1, "321"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 2528
    if-eqz p2, :cond_0

    .line 2529
    iput-boolean v4, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->joined:Z

    .line 2531
    const-string/jumbo v1, "membershipRevoked"

    new-array v2, v4, [Ljava/lang/Object;

    invoke-direct {p0, v1, v2}, Lorg/jivesoftware/smackx/muc/MultiUserChat;->fireUserStatusListeners(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 2534
    iget-object v1, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->occupantsMap:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->clear()V

    .line 2535
    iput-object v5, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->nickname:Ljava/lang/String;

    .line 2536
    invoke-direct {p0}, Lorg/jivesoftware/smackx/muc/MultiUserChat;->userHasLeft()V

    goto/16 :goto_0

    .line 2540
    :cond_5
    const-string/jumbo v1, "303"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 2541
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 2542
    .restart local v0    # "params":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v0, p4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 2543
    invoke-virtual {p3}, Lorg/jivesoftware/smackx/packet/MUCUser;->getItem()Lorg/jivesoftware/smackx/packet/MUCUser$Item;

    move-result-object v1

    invoke-virtual {v1}, Lorg/jivesoftware/smackx/packet/MUCUser$Item;->getNick()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 2544
    const-string/jumbo v1, "nicknameChanged"

    invoke-direct {p0, v1, v0}, Lorg/jivesoftware/smackx/muc/MultiUserChat;->fireParticipantStatusListeners(Ljava/lang/String;Ljava/util/List;)V

    goto/16 :goto_0
.end method

.method private checkRoleModifications(Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)V
    .locals 4
    .param p1, "oldRole"    # Ljava/lang/String;
    .param p2, "newRole"    # Ljava/lang/String;
    .param p3, "isUserModification"    # Z
    .param p4, "from"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 2281
    const-string/jumbo v1, "visitor"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string/jumbo v1, "none"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_6

    :cond_0
    const-string/jumbo v1, "participant"

    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_6

    .line 2283
    if-eqz p3, :cond_5

    .line 2284
    const-string/jumbo v1, "voiceGranted"

    new-array v2, v3, [Ljava/lang/Object;

    invoke-direct {p0, v1, v2}, Lorg/jivesoftware/smackx/muc/MultiUserChat;->fireUserStatusListeners(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 2306
    :cond_1
    :goto_0
    const-string/jumbo v1, "moderator"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_b

    const-string/jumbo v1, "moderator"

    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_b

    .line 2307
    const-string/jumbo v1, "visitor"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    const-string/jumbo v1, "none"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 2308
    :cond_2
    if-eqz p3, :cond_9

    .line 2309
    const-string/jumbo v1, "voiceGranted"

    new-array v2, v3, [Ljava/lang/Object;

    invoke-direct {p0, v1, v2}, Lorg/jivesoftware/smackx/muc/MultiUserChat;->fireUserStatusListeners(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 2317
    :cond_3
    :goto_1
    if-eqz p3, :cond_a

    .line 2318
    const-string/jumbo v1, "moderatorGranted"

    new-array v2, v3, [Ljava/lang/Object;

    invoke-direct {p0, v1, v2}, Lorg/jivesoftware/smackx/muc/MultiUserChat;->fireUserStatusListeners(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 2347
    :cond_4
    :goto_2
    return-void

    .line 2287
    :cond_5
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 2288
    .local v0, "params":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v0, p4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 2289
    const-string/jumbo v1, "voiceGranted"

    invoke-direct {p0, v1, v0}, Lorg/jivesoftware/smackx/muc/MultiUserChat;->fireParticipantStatusListeners(Ljava/lang/String;Ljava/util/List;)V

    goto :goto_0

    .line 2293
    .end local v0    # "params":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_6
    const-string/jumbo v1, "participant"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    const-string/jumbo v1, "visitor"

    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_7

    const-string/jumbo v1, "none"

    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 2296
    :cond_7
    if-eqz p3, :cond_8

    .line 2297
    const-string/jumbo v1, "voiceRevoked"

    new-array v2, v3, [Ljava/lang/Object;

    invoke-direct {p0, v1, v2}, Lorg/jivesoftware/smackx/muc/MultiUserChat;->fireUserStatusListeners(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_0

    .line 2300
    :cond_8
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 2301
    .restart local v0    # "params":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v0, p4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 2302
    const-string/jumbo v1, "voiceRevoked"

    invoke-direct {p0, v1, v0}, Lorg/jivesoftware/smackx/muc/MultiUserChat;->fireParticipantStatusListeners(Ljava/lang/String;Ljava/util/List;)V

    goto :goto_0

    .line 2312
    .end local v0    # "params":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_9
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 2313
    .restart local v0    # "params":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v0, p4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 2314
    const-string/jumbo v1, "voiceGranted"

    invoke-direct {p0, v1, v0}, Lorg/jivesoftware/smackx/muc/MultiUserChat;->fireParticipantStatusListeners(Ljava/lang/String;Ljava/util/List;)V

    goto :goto_1

    .line 2321
    .end local v0    # "params":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_a
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 2322
    .restart local v0    # "params":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v0, p4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 2323
    const-string/jumbo v1, "moderatorGranted"

    invoke-direct {p0, v1, v0}, Lorg/jivesoftware/smackx/muc/MultiUserChat;->fireParticipantStatusListeners(Ljava/lang/String;Ljava/util/List;)V

    goto :goto_2

    .line 2327
    .end local v0    # "params":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_b
    const-string/jumbo v1, "moderator"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    const-string/jumbo v1, "moderator"

    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4

    .line 2328
    const-string/jumbo v1, "visitor"

    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_c

    const-string/jumbo v1, "none"

    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_d

    .line 2329
    :cond_c
    if-eqz p3, :cond_e

    .line 2330
    const-string/jumbo v1, "voiceRevoked"

    new-array v2, v3, [Ljava/lang/Object;

    invoke-direct {p0, v1, v2}, Lorg/jivesoftware/smackx/muc/MultiUserChat;->fireUserStatusListeners(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 2338
    :cond_d
    :goto_3
    if-eqz p3, :cond_f

    .line 2339
    const-string/jumbo v1, "moderatorRevoked"

    new-array v2, v3, [Ljava/lang/Object;

    invoke-direct {p0, v1, v2}, Lorg/jivesoftware/smackx/muc/MultiUserChat;->fireUserStatusListeners(Ljava/lang/String;[Ljava/lang/Object;)V

    goto/16 :goto_2

    .line 2333
    :cond_e
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 2334
    .restart local v0    # "params":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v0, p4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 2335
    const-string/jumbo v1, "voiceRevoked"

    invoke-direct {p0, v1, v0}, Lorg/jivesoftware/smackx/muc/MultiUserChat;->fireParticipantStatusListeners(Ljava/lang/String;Ljava/util/List;)V

    goto :goto_3

    .line 2342
    .end local v0    # "params":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_f
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 2343
    .restart local v0    # "params":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v0, p4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 2344
    const-string/jumbo v1, "moderatorRevoked"

    invoke-direct {p0, v1, v0}, Lorg/jivesoftware/smackx/muc/MultiUserChat;->fireParticipantStatusListeners(Ljava/lang/String;Ljava/util/List;)V

    goto/16 :goto_2
.end method

.method private cleanup()V
    .locals 4

    .prologue
    .line 2550
    :try_start_0
    iget-object v2, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->connection:Lorg/jivesoftware/smack/Connection;

    if-eqz v2, :cond_0

    .line 2551
    iget-object v2, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->roomListenerMultiplexor:Lorg/jivesoftware/smackx/muc/RoomListenerMultiplexor;

    iget-object v3, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->room:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lorg/jivesoftware/smackx/muc/RoomListenerMultiplexor;->removeRoom(Ljava/lang/String;)V

    .line 2553
    iget-object v2, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->connectionListeners:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smack/PacketListener;

    .line 2554
    .local v0, "connectionListener":Lorg/jivesoftware/smack/PacketListener;
    iget-object v2, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v2, v0}, Lorg/jivesoftware/smack/Connection;->removePacketListener(Lorg/jivesoftware/smack/PacketListener;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 2557
    .end local v0    # "connectionListener":Lorg/jivesoftware/smack/PacketListener;
    .end local v1    # "i$":Ljava/util/Iterator;
    :catch_0
    move-exception v2

    .line 2560
    :cond_0
    return-void
.end method

.method public static decline(Lorg/jivesoftware/smack/Connection;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p0, "conn"    # Lorg/jivesoftware/smack/Connection;
    .param p1, "room"    # Ljava/lang/String;
    .param p2, "inviter"    # Ljava/lang/String;
    .param p3, "reason"    # Ljava/lang/String;

    .prologue
    .line 778
    new-instance v1, Lorg/jivesoftware/smack/packet/Message;

    invoke-direct {v1, p1}, Lorg/jivesoftware/smack/packet/Message;-><init>(Ljava/lang/String;)V

    .line 781
    .local v1, "message":Lorg/jivesoftware/smack/packet/Message;
    new-instance v2, Lorg/jivesoftware/smackx/packet/MUCUser;

    invoke-direct {v2}, Lorg/jivesoftware/smackx/packet/MUCUser;-><init>()V

    .line 782
    .local v2, "mucUser":Lorg/jivesoftware/smackx/packet/MUCUser;
    new-instance v0, Lorg/jivesoftware/smackx/packet/MUCUser$Decline;

    invoke-direct {v0}, Lorg/jivesoftware/smackx/packet/MUCUser$Decline;-><init>()V

    .line 783
    .local v0, "decline":Lorg/jivesoftware/smackx/packet/MUCUser$Decline;
    invoke-virtual {v0, p2}, Lorg/jivesoftware/smackx/packet/MUCUser$Decline;->setTo(Ljava/lang/String;)V

    .line 784
    invoke-virtual {v0, p3}, Lorg/jivesoftware/smackx/packet/MUCUser$Decline;->setReason(Ljava/lang/String;)V

    .line 785
    invoke-virtual {v2, v0}, Lorg/jivesoftware/smackx/packet/MUCUser;->setDecline(Lorg/jivesoftware/smackx/packet/MUCUser$Decline;)V

    .line 787
    invoke-virtual {v1, v2}, Lorg/jivesoftware/smack/packet/Message;->addExtension(Lorg/jivesoftware/smack/packet/PacketExtension;)V

    .line 789
    invoke-virtual {p0, v1}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 790
    return-void
.end method

.method private fireInvitationRejectionListeners(Ljava/lang/String;Ljava/lang/String;)V
    .locals 7
    .param p1, "invitee"    # Ljava/lang/String;
    .param p2, "reason"    # Ljava/lang/String;

    .prologue
    .line 848
    iget-object v6, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->invitationRejectionListeners:Ljava/util/List;

    monitor-enter v6

    .line 849
    :try_start_0
    iget-object v5, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->invitationRejectionListeners:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    new-array v4, v5, [Lorg/jivesoftware/smackx/muc/InvitationRejectionListener;

    .line 850
    .local v4, "listeners":[Lorg/jivesoftware/smackx/muc/InvitationRejectionListener;
    iget-object v5, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->invitationRejectionListeners:Ljava/util/List;

    invoke-interface {v5, v4}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 851
    monitor-exit v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 852
    move-object v0, v4

    .local v0, "arr$":[Lorg/jivesoftware/smackx/muc/InvitationRejectionListener;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_0
    if-ge v1, v2, :cond_0

    aget-object v3, v0, v1

    .line 853
    .local v3, "listener":Lorg/jivesoftware/smackx/muc/InvitationRejectionListener;
    invoke-interface {v3, p1, p2}, Lorg/jivesoftware/smackx/muc/InvitationRejectionListener;->invitationDeclined(Ljava/lang/String;Ljava/lang/String;)V

    .line 852
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 851
    .end local v0    # "arr$":[Lorg/jivesoftware/smackx/muc/InvitationRejectionListener;
    .end local v1    # "i$":I
    .end local v2    # "len$":I
    .end local v3    # "listener":Lorg/jivesoftware/smackx/muc/InvitationRejectionListener;
    .end local v4    # "listeners":[Lorg/jivesoftware/smackx/muc/InvitationRejectionListener;
    :catchall_0
    move-exception v5

    :try_start_1
    monitor-exit v6
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v5

    .line 855
    .restart local v0    # "arr$":[Lorg/jivesoftware/smackx/muc/InvitationRejectionListener;
    .restart local v1    # "i$":I
    .restart local v2    # "len$":I
    .restart local v4    # "listeners":[Lorg/jivesoftware/smackx/muc/InvitationRejectionListener;
    :cond_0
    return-void
.end method

.method private fireParticipantStatusListeners(Ljava/lang/String;Ljava/util/List;)V
    .locals 11
    .param p1, "methodName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 2100
    .local p2, "params":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    iget-object v10, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->participantStatusListeners:Ljava/util/List;

    monitor-enter v10

    .line 2101
    :try_start_0
    iget-object v9, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->participantStatusListeners:Ljava/util/List;

    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v9

    new-array v7, v9, [Lorg/jivesoftware/smackx/muc/ParticipantStatusListener;

    .line 2102
    .local v7, "listeners":[Lorg/jivesoftware/smackx/muc/ParticipantStatusListener;
    iget-object v9, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->participantStatusListeners:Ljava/util/List;

    invoke-interface {v9, v7}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 2103
    monitor-exit v10
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2106
    :try_start_1
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v9

    new-array v1, v9, [Ljava/lang/Class;

    .line 2107
    .local v1, "classes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v9

    if-ge v3, v9, :cond_0

    .line 2108
    const-class v9, Ljava/lang/String;

    aput-object v9, v1, v3
    :try_end_1
    .catch Ljava/lang/NoSuchMethodException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_1} :catch_2

    .line 2107
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 2103
    .end local v1    # "classes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    .end local v3    # "i":I
    .end local v7    # "listeners":[Lorg/jivesoftware/smackx/muc/ParticipantStatusListener;
    :catchall_0
    move-exception v9

    :try_start_2
    monitor-exit v10
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v9

    .line 2110
    .restart local v1    # "classes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    .restart local v3    # "i":I
    .restart local v7    # "listeners":[Lorg/jivesoftware/smackx/muc/ParticipantStatusListener;
    :cond_0
    :try_start_3
    const-class v9, Lorg/jivesoftware/smackx/muc/ParticipantStatusListener;

    invoke-virtual {v9, p1, v1}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v8

    .line 2111
    .local v8, "method":Ljava/lang/reflect/Method;
    move-object v0, v7

    .local v0, "arr$":[Lorg/jivesoftware/smackx/muc/ParticipantStatusListener;
    array-length v5, v0

    .local v5, "len$":I
    const/4 v4, 0x0

    .local v4, "i$":I
    :goto_1
    if-ge v4, v5, :cond_1

    aget-object v6, v0, v4

    .line 2112
    .local v6, "listener":Lorg/jivesoftware/smackx/muc/ParticipantStatusListener;
    invoke-interface {p2}, Ljava/util/List;->toArray()[Ljava/lang/Object;

    move-result-object v9

    invoke-virtual {v8, v6, v9}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_3
    .catch Ljava/lang/NoSuchMethodException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_3 .. :try_end_3} :catch_2

    .line 2111
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 2114
    .end local v0    # "arr$":[Lorg/jivesoftware/smackx/muc/ParticipantStatusListener;
    .end local v1    # "classes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    .end local v3    # "i":I
    .end local v4    # "i$":I
    .end local v5    # "len$":I
    .end local v6    # "listener":Lorg/jivesoftware/smackx/muc/ParticipantStatusListener;
    .end local v8    # "method":Ljava/lang/reflect/Method;
    :catch_0
    move-exception v2

    .line 2115
    .local v2, "e":Ljava/lang/NoSuchMethodException;
    invoke-virtual {v2}, Ljava/lang/NoSuchMethodException;->printStackTrace()V

    .line 2121
    .end local v2    # "e":Ljava/lang/NoSuchMethodException;
    :cond_1
    :goto_2
    return-void

    .line 2116
    :catch_1
    move-exception v2

    .line 2117
    .local v2, "e":Ljava/lang/reflect/InvocationTargetException;
    invoke-virtual {v2}, Ljava/lang/reflect/InvocationTargetException;->printStackTrace()V

    goto :goto_2

    .line 2118
    .end local v2    # "e":Ljava/lang/reflect/InvocationTargetException;
    :catch_2
    move-exception v2

    .line 2119
    .local v2, "e":Ljava/lang/IllegalAccessException;
    invoke-virtual {v2}, Ljava/lang/IllegalAccessException;->printStackTrace()V

    goto :goto_2
.end method

.method private fireSubjectUpdatedListeners(Ljava/lang/String;Ljava/lang/String;)V
    .locals 7
    .param p1, "subject"    # Ljava/lang/String;
    .param p2, "from"    # Ljava/lang/String;

    .prologue
    .line 888
    iget-object v6, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->subjectUpdatedListeners:Ljava/util/List;

    monitor-enter v6

    .line 889
    :try_start_0
    iget-object v5, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->subjectUpdatedListeners:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    new-array v4, v5, [Lorg/jivesoftware/smackx/muc/SubjectUpdatedListener;

    .line 890
    .local v4, "listeners":[Lorg/jivesoftware/smackx/muc/SubjectUpdatedListener;
    iget-object v5, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->subjectUpdatedListeners:Ljava/util/List;

    invoke-interface {v5, v4}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 891
    monitor-exit v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 892
    move-object v0, v4

    .local v0, "arr$":[Lorg/jivesoftware/smackx/muc/SubjectUpdatedListener;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_0
    if-ge v1, v2, :cond_0

    aget-object v3, v0, v1

    .line 893
    .local v3, "listener":Lorg/jivesoftware/smackx/muc/SubjectUpdatedListener;
    invoke-interface {v3, p1, p2}, Lorg/jivesoftware/smackx/muc/SubjectUpdatedListener;->subjectUpdated(Ljava/lang/String;Ljava/lang/String;)V

    .line 892
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 891
    .end local v0    # "arr$":[Lorg/jivesoftware/smackx/muc/SubjectUpdatedListener;
    .end local v1    # "i$":I
    .end local v2    # "len$":I
    .end local v3    # "listener":Lorg/jivesoftware/smackx/muc/SubjectUpdatedListener;
    .end local v4    # "listeners":[Lorg/jivesoftware/smackx/muc/SubjectUpdatedListener;
    :catchall_0
    move-exception v5

    :try_start_1
    monitor-exit v6
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v5

    .line 895
    .restart local v0    # "arr$":[Lorg/jivesoftware/smackx/muc/SubjectUpdatedListener;
    .restart local v1    # "i$":I
    .restart local v2    # "len$":I
    .restart local v4    # "listeners":[Lorg/jivesoftware/smackx/muc/SubjectUpdatedListener;
    :cond_0
    return-void
.end method

.method private fireUserStatusListeners(Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 11
    .param p1, "methodName"    # Ljava/lang/String;
    .param p2, "params"    # [Ljava/lang/Object;

    .prologue
    .line 2048
    iget-object v10, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->userStatusListeners:Ljava/util/List;

    monitor-enter v10

    .line 2049
    :try_start_0
    iget-object v9, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->userStatusListeners:Ljava/util/List;

    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v9

    new-array v6, v9, [Lorg/jivesoftware/smackx/muc/UserStatusListener;

    .line 2050
    .local v6, "listeners":[Lorg/jivesoftware/smackx/muc/UserStatusListener;
    iget-object v9, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->userStatusListeners:Ljava/util/List;

    invoke-interface {v9, v6}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 2051
    monitor-exit v10
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2053
    array-length v9, p2

    new-array v8, v9, [Ljava/lang/Class;

    .line 2054
    .local v8, "paramClasses":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v9, p2

    if-ge v2, v9, :cond_0

    .line 2055
    aget-object v9, p2, v2

    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v9

    aput-object v9, v8, v2

    .line 2054
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 2051
    .end local v2    # "i":I
    .end local v6    # "listeners":[Lorg/jivesoftware/smackx/muc/UserStatusListener;
    .end local v8    # "paramClasses":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    :catchall_0
    move-exception v9

    :try_start_1
    monitor-exit v10
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v9

    .line 2059
    .restart local v2    # "i":I
    .restart local v6    # "listeners":[Lorg/jivesoftware/smackx/muc/UserStatusListener;
    .restart local v8    # "paramClasses":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    :cond_0
    :try_start_2
    const-class v9, Lorg/jivesoftware/smackx/muc/UserStatusListener;

    invoke-virtual {v9, p1, v8}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v7

    .line 2060
    .local v7, "method":Ljava/lang/reflect/Method;
    move-object v0, v6

    .local v0, "arr$":[Lorg/jivesoftware/smackx/muc/UserStatusListener;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_1
    if-ge v3, v4, :cond_1

    aget-object v5, v0, v3

    .line 2061
    .local v5, "listener":Lorg/jivesoftware/smackx/muc/UserStatusListener;
    invoke-virtual {v7, v5, p2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2
    .catch Ljava/lang/NoSuchMethodException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_2 .. :try_end_2} :catch_2

    .line 2060
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 2063
    .end local v0    # "arr$":[Lorg/jivesoftware/smackx/muc/UserStatusListener;
    .end local v3    # "i$":I
    .end local v4    # "len$":I
    .end local v5    # "listener":Lorg/jivesoftware/smackx/muc/UserStatusListener;
    .end local v7    # "method":Ljava/lang/reflect/Method;
    :catch_0
    move-exception v1

    .line 2064
    .local v1, "e":Ljava/lang/NoSuchMethodException;
    invoke-virtual {v1}, Ljava/lang/NoSuchMethodException;->printStackTrace()V

    .line 2070
    .end local v1    # "e":Ljava/lang/NoSuchMethodException;
    :cond_1
    :goto_2
    return-void

    .line 2065
    :catch_1
    move-exception v1

    .line 2066
    .local v1, "e":Ljava/lang/reflect/InvocationTargetException;
    invoke-virtual {v1}, Ljava/lang/reflect/InvocationTargetException;->printStackTrace()V

    goto :goto_2

    .line 2067
    .end local v1    # "e":Ljava/lang/reflect/InvocationTargetException;
    :catch_2
    move-exception v1

    .line 2068
    .local v1, "e":Ljava/lang/IllegalAccessException;
    invoke-virtual {v1}, Ljava/lang/IllegalAccessException;->printStackTrace()V

    goto :goto_2
.end method

.method private getAffiliatesByAdmin(Ljava/lang/String;)Ljava/util/Collection;
    .locals 10
    .param p1, "affiliation"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Collection",
            "<",
            "Lorg/jivesoftware/smackx/muc/Affiliate;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 1736
    new-instance v2, Lorg/jivesoftware/smackx/packet/MUCAdmin;

    invoke-direct {v2}, Lorg/jivesoftware/smackx/packet/MUCAdmin;-><init>()V

    .line 1737
    .local v2, "iq":Lorg/jivesoftware/smackx/packet/MUCAdmin;
    iget-object v7, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->room:Ljava/lang/String;

    invoke-virtual {v2, v7}, Lorg/jivesoftware/smackx/packet/MUCAdmin;->setTo(Ljava/lang/String;)V

    .line 1738
    sget-object v7, Lorg/jivesoftware/smack/packet/IQ$Type;->GET:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {v2, v7}, Lorg/jivesoftware/smackx/packet/MUCAdmin;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 1740
    new-instance v4, Lorg/jivesoftware/smackx/packet/MUCAdmin$Item;

    const/4 v7, 0x0

    invoke-direct {v4, p1, v7}, Lorg/jivesoftware/smackx/packet/MUCAdmin$Item;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 1741
    .local v4, "item":Lorg/jivesoftware/smackx/packet/MUCAdmin$Item;
    invoke-virtual {v2, v4}, Lorg/jivesoftware/smackx/packet/MUCAdmin;->addItem(Lorg/jivesoftware/smackx/packet/MUCAdmin$Item;)V

    .line 1744
    new-instance v6, Lorg/jivesoftware/smack/filter/PacketIDFilter;

    invoke-virtual {v2}, Lorg/jivesoftware/smackx/packet/MUCAdmin;->getPacketID()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lorg/jivesoftware/smack/filter/PacketIDFilter;-><init>(Ljava/lang/String;)V

    .line 1745
    .local v6, "responseFilter":Lorg/jivesoftware/smack/filter/PacketFilter;
    iget-object v7, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v7, v6}, Lorg/jivesoftware/smack/Connection;->createPacketCollector(Lorg/jivesoftware/smack/filter/PacketFilter;)Lorg/jivesoftware/smack/PacketCollector;

    move-result-object v5

    .line 1747
    .local v5, "response":Lorg/jivesoftware/smack/PacketCollector;
    iget-object v7, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v7, v2}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 1749
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getPacketReplyTimeout()I

    move-result v7

    int-to-long v8, v7

    invoke-virtual {v5, v8, v9}, Lorg/jivesoftware/smack/PacketCollector;->nextResult(J)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v1

    check-cast v1, Lorg/jivesoftware/smackx/packet/MUCAdmin;

    .line 1751
    .local v1, "answer":Lorg/jivesoftware/smackx/packet/MUCAdmin;
    invoke-virtual {v5}, Lorg/jivesoftware/smack/PacketCollector;->cancel()V

    .line 1753
    if-nez v1, :cond_0

    .line 1754
    new-instance v7, Lorg/jivesoftware/smack/XMPPException;

    const-string/jumbo v8, "No response from server."

    invoke-direct {v7, v8}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 1756
    :cond_0
    invoke-virtual {v1}, Lorg/jivesoftware/smackx/packet/MUCAdmin;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v7

    if-eqz v7, :cond_1

    .line 1757
    new-instance v7, Lorg/jivesoftware/smack/XMPPException;

    invoke-virtual {v1}, Lorg/jivesoftware/smackx/packet/MUCAdmin;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v8

    invoke-direct {v7, v8}, Lorg/jivesoftware/smack/XMPPException;-><init>(Lorg/jivesoftware/smack/packet/XMPPError;)V

    throw v7

    .line 1760
    :cond_1
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 1761
    .local v0, "affiliates":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smackx/muc/Affiliate;>;"
    invoke-virtual {v1}, Lorg/jivesoftware/smackx/packet/MUCAdmin;->getItems()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/jivesoftware/smackx/packet/MUCAdmin$Item;>;"
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_2

    .line 1762
    new-instance v8, Lorg/jivesoftware/smackx/muc/Affiliate;

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lorg/jivesoftware/smackx/packet/MUCAdmin$Item;

    invoke-direct {v8, v7}, Lorg/jivesoftware/smackx/muc/Affiliate;-><init>(Lorg/jivesoftware/smackx/packet/MUCAdmin$Item;)V

    invoke-interface {v0, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 1764
    :cond_2
    return-object v0
.end method

.method private getAffiliatesByOwner(Ljava/lang/String;)Ljava/util/Collection;
    .locals 10
    .param p1, "affiliation"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Collection",
            "<",
            "Lorg/jivesoftware/smackx/muc/Affiliate;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 1695
    new-instance v2, Lorg/jivesoftware/smackx/packet/MUCOwner;

    invoke-direct {v2}, Lorg/jivesoftware/smackx/packet/MUCOwner;-><init>()V

    .line 1696
    .local v2, "iq":Lorg/jivesoftware/smackx/packet/MUCOwner;
    iget-object v7, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->room:Ljava/lang/String;

    invoke-virtual {v2, v7}, Lorg/jivesoftware/smackx/packet/MUCOwner;->setTo(Ljava/lang/String;)V

    .line 1697
    sget-object v7, Lorg/jivesoftware/smack/packet/IQ$Type;->GET:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {v2, v7}, Lorg/jivesoftware/smackx/packet/MUCOwner;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 1699
    new-instance v4, Lorg/jivesoftware/smackx/packet/MUCOwner$Item;

    invoke-direct {v4, p1}, Lorg/jivesoftware/smackx/packet/MUCOwner$Item;-><init>(Ljava/lang/String;)V

    .line 1700
    .local v4, "item":Lorg/jivesoftware/smackx/packet/MUCOwner$Item;
    invoke-virtual {v2, v4}, Lorg/jivesoftware/smackx/packet/MUCOwner;->addItem(Lorg/jivesoftware/smackx/packet/MUCOwner$Item;)V

    .line 1703
    new-instance v6, Lorg/jivesoftware/smack/filter/PacketIDFilter;

    invoke-virtual {v2}, Lorg/jivesoftware/smackx/packet/MUCOwner;->getPacketID()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lorg/jivesoftware/smack/filter/PacketIDFilter;-><init>(Ljava/lang/String;)V

    .line 1704
    .local v6, "responseFilter":Lorg/jivesoftware/smack/filter/PacketFilter;
    iget-object v7, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v7, v6}, Lorg/jivesoftware/smack/Connection;->createPacketCollector(Lorg/jivesoftware/smack/filter/PacketFilter;)Lorg/jivesoftware/smack/PacketCollector;

    move-result-object v5

    .line 1706
    .local v5, "response":Lorg/jivesoftware/smack/PacketCollector;
    iget-object v7, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v7, v2}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 1708
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getPacketReplyTimeout()I

    move-result v7

    int-to-long v8, v7

    invoke-virtual {v5, v8, v9}, Lorg/jivesoftware/smack/PacketCollector;->nextResult(J)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v1

    check-cast v1, Lorg/jivesoftware/smackx/packet/MUCOwner;

    .line 1710
    .local v1, "answer":Lorg/jivesoftware/smackx/packet/MUCOwner;
    invoke-virtual {v5}, Lorg/jivesoftware/smack/PacketCollector;->cancel()V

    .line 1712
    if-nez v1, :cond_0

    .line 1713
    new-instance v7, Lorg/jivesoftware/smack/XMPPException;

    const-string/jumbo v8, "No response from server."

    invoke-direct {v7, v8}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 1715
    :cond_0
    invoke-virtual {v1}, Lorg/jivesoftware/smackx/packet/MUCOwner;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v7

    if-eqz v7, :cond_1

    .line 1716
    new-instance v7, Lorg/jivesoftware/smack/XMPPException;

    invoke-virtual {v1}, Lorg/jivesoftware/smackx/packet/MUCOwner;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v8

    invoke-direct {v7, v8}, Lorg/jivesoftware/smack/XMPPException;-><init>(Lorg/jivesoftware/smack/packet/XMPPError;)V

    throw v7

    .line 1719
    :cond_1
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 1720
    .local v0, "affiliates":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smackx/muc/Affiliate;>;"
    invoke-virtual {v1}, Lorg/jivesoftware/smackx/packet/MUCOwner;->getItems()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/jivesoftware/smackx/packet/MUCOwner$Item;>;"
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_2

    .line 1721
    new-instance v8, Lorg/jivesoftware/smackx/muc/Affiliate;

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lorg/jivesoftware/smackx/packet/MUCOwner$Item;

    invoke-direct {v8, v7}, Lorg/jivesoftware/smackx/muc/Affiliate;-><init>(Lorg/jivesoftware/smackx/packet/MUCOwner$Item;)V

    invoke-interface {v0, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 1723
    :cond_2
    return-object v0
.end method

.method public static getHostedRooms(Lorg/jivesoftware/smack/Connection;Ljava/lang/String;)Ljava/util/Collection;
    .locals 6
    .param p0, "connection"    # Lorg/jivesoftware/smack/Connection;
    .param p1, "serviceName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jivesoftware/smack/Connection;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Collection",
            "<",
            "Lorg/jivesoftware/smackx/muc/HostedRoom;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 286
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 287
    .local v0, "answer":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smackx/muc/HostedRoom;>;"
    invoke-static {p0}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->getInstanceFor(Lorg/jivesoftware/smack/Connection;)Lorg/jivesoftware/smackx/ServiceDiscoveryManager;

    move-result-object v1

    .line 288
    .local v1, "discoManager":Lorg/jivesoftware/smackx/ServiceDiscoveryManager;
    invoke-virtual {v1, p1}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->discoverItems(Ljava/lang/String;)Lorg/jivesoftware/smackx/packet/DiscoverItems;

    move-result-object v3

    .line 289
    .local v3, "items":Lorg/jivesoftware/smackx/packet/DiscoverItems;
    invoke-virtual {v3}, Lorg/jivesoftware/smackx/packet/DiscoverItems;->getItems()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/jivesoftware/smackx/packet/DiscoverItems$Item;>;"
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 290
    new-instance v5, Lorg/jivesoftware/smackx/muc/HostedRoom;

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/jivesoftware/smackx/packet/DiscoverItems$Item;

    invoke-direct {v5, v4}, Lorg/jivesoftware/smackx/muc/HostedRoom;-><init>(Lorg/jivesoftware/smackx/packet/DiscoverItems$Item;)V

    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 292
    :cond_0
    return-object v0
.end method

.method private static getJoinedRooms(Lorg/jivesoftware/smack/Connection;)Ljava/util/Iterator;
    .locals 2
    .param p0, "connection"    # Lorg/jivesoftware/smack/Connection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jivesoftware/smack/Connection;",
            ")",
            "Ljava/util/Iterator",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 196
    sget-object v1, Lorg/jivesoftware/smackx/muc/MultiUserChat;->joinedRooms:Ljava/util/Map;

    invoke-interface {v1, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 197
    .local v0, "rooms":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-eqz v0, :cond_0

    .line 198
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 201
    :goto_0
    return-object v1

    :cond_0
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    goto :goto_0
.end method

.method public static getJoinedRooms(Lorg/jivesoftware/smack/Connection;Ljava/lang/String;)Ljava/util/Iterator;
    .locals 6
    .param p0, "connection"    # Lorg/jivesoftware/smack/Connection;
    .param p1, "user"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jivesoftware/smack/Connection;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Iterator",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 214
    :try_start_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 216
    .local v0, "answer":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-static {p0}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->getInstanceFor(Lorg/jivesoftware/smack/Connection;)Lorg/jivesoftware/smackx/ServiceDiscoveryManager;

    move-result-object v4

    const-string/jumbo v5, "http://jabber.org/protocol/muc#rooms"

    invoke-virtual {v4, p1, v5}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->discoverItems(Ljava/lang/String;Ljava/lang/String;)Lorg/jivesoftware/smackx/packet/DiscoverItems;

    move-result-object v3

    .line 219
    .local v3, "result":Lorg/jivesoftware/smackx/packet/DiscoverItems;
    invoke-virtual {v3}, Lorg/jivesoftware/smackx/packet/DiscoverItems;->getItems()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "items":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/jivesoftware/smackx/packet/DiscoverItems$Item;>;"
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 220
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/jivesoftware/smackx/packet/DiscoverItems$Item;

    invoke-virtual {v4}, Lorg/jivesoftware/smackx/packet/DiscoverItems$Item;->getEntityID()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Lorg/jivesoftware/smack/XMPPException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 224
    .end local v0    # "answer":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v2    # "items":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/jivesoftware/smackx/packet/DiscoverItems$Item;>;"
    .end local v3    # "result":Lorg/jivesoftware/smackx/packet/DiscoverItems;
    :catch_0
    move-exception v1

    .line 225
    .local v1, "e":Lorg/jivesoftware/smack/XMPPException;
    invoke-virtual {v1}, Lorg/jivesoftware/smack/XMPPException;->printStackTrace()V

    .line 227
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .end local v1    # "e":Lorg/jivesoftware/smack/XMPPException;
    :goto_1
    return-object v4

    .line 222
    .restart local v0    # "answer":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .restart local v2    # "items":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/jivesoftware/smackx/packet/DiscoverItems$Item;>;"
    .restart local v3    # "result":Lorg/jivesoftware/smackx/packet/DiscoverItems;
    :cond_0
    :try_start_1
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;
    :try_end_1
    .catch Lorg/jivesoftware/smack/XMPPException; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v4

    goto :goto_1
.end method

.method private getMUCUserExtension(Lorg/jivesoftware/smack/packet/Packet;)Lorg/jivesoftware/smackx/packet/MUCUser;
    .locals 2
    .param p1, "packet"    # Lorg/jivesoftware/smack/packet/Packet;

    .prologue
    .line 2013
    if-eqz p1, :cond_0

    .line 2015
    const-string/jumbo v0, "x"

    const-string/jumbo v1, "http://jabber.org/protocol/muc#user"

    invoke-virtual {p1, v0, v1}, Lorg/jivesoftware/smack/packet/Packet;->getExtension(Ljava/lang/String;Ljava/lang/String;)Lorg/jivesoftware/smack/packet/PacketExtension;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smackx/packet/MUCUser;

    .line 2017
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private getOccupants(Ljava/lang/String;)Ljava/util/Collection;
    .locals 10
    .param p1, "role"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Collection",
            "<",
            "Lorg/jivesoftware/smackx/muc/Occupant;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 1798
    new-instance v1, Lorg/jivesoftware/smackx/packet/MUCAdmin;

    invoke-direct {v1}, Lorg/jivesoftware/smackx/packet/MUCAdmin;-><init>()V

    .line 1799
    .local v1, "iq":Lorg/jivesoftware/smackx/packet/MUCAdmin;
    iget-object v7, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->room:Ljava/lang/String;

    invoke-virtual {v1, v7}, Lorg/jivesoftware/smackx/packet/MUCAdmin;->setTo(Ljava/lang/String;)V

    .line 1800
    sget-object v7, Lorg/jivesoftware/smack/packet/IQ$Type;->GET:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {v1, v7}, Lorg/jivesoftware/smackx/packet/MUCAdmin;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 1802
    new-instance v3, Lorg/jivesoftware/smackx/packet/MUCAdmin$Item;

    const/4 v7, 0x0

    invoke-direct {v3, v7, p1}, Lorg/jivesoftware/smackx/packet/MUCAdmin$Item;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 1803
    .local v3, "item":Lorg/jivesoftware/smackx/packet/MUCAdmin$Item;
    invoke-virtual {v1, v3}, Lorg/jivesoftware/smackx/packet/MUCAdmin;->addItem(Lorg/jivesoftware/smackx/packet/MUCAdmin$Item;)V

    .line 1806
    new-instance v6, Lorg/jivesoftware/smack/filter/PacketIDFilter;

    invoke-virtual {v1}, Lorg/jivesoftware/smackx/packet/MUCAdmin;->getPacketID()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lorg/jivesoftware/smack/filter/PacketIDFilter;-><init>(Ljava/lang/String;)V

    .line 1807
    .local v6, "responseFilter":Lorg/jivesoftware/smack/filter/PacketFilter;
    iget-object v7, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v7, v6}, Lorg/jivesoftware/smack/Connection;->createPacketCollector(Lorg/jivesoftware/smack/filter/PacketFilter;)Lorg/jivesoftware/smack/PacketCollector;

    move-result-object v5

    .line 1809
    .local v5, "response":Lorg/jivesoftware/smack/PacketCollector;
    iget-object v7, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v7, v1}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 1811
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getPacketReplyTimeout()I

    move-result v7

    int-to-long v8, v7

    invoke-virtual {v5, v8, v9}, Lorg/jivesoftware/smack/PacketCollector;->nextResult(J)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smackx/packet/MUCAdmin;

    .line 1813
    .local v0, "answer":Lorg/jivesoftware/smackx/packet/MUCAdmin;
    invoke-virtual {v5}, Lorg/jivesoftware/smack/PacketCollector;->cancel()V

    .line 1815
    if-nez v0, :cond_0

    .line 1816
    new-instance v7, Lorg/jivesoftware/smack/XMPPException;

    const-string/jumbo v8, "No response from server."

    invoke-direct {v7, v8}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 1818
    :cond_0
    invoke-virtual {v0}, Lorg/jivesoftware/smackx/packet/MUCAdmin;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v7

    if-eqz v7, :cond_1

    .line 1819
    new-instance v7, Lorg/jivesoftware/smack/XMPPException;

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/packet/MUCAdmin;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v8

    invoke-direct {v7, v8}, Lorg/jivesoftware/smack/XMPPException;-><init>(Lorg/jivesoftware/smack/packet/XMPPError;)V

    throw v7

    .line 1822
    :cond_1
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 1823
    .local v4, "participants":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smackx/muc/Occupant;>;"
    invoke-virtual {v0}, Lorg/jivesoftware/smackx/packet/MUCAdmin;->getItems()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/jivesoftware/smackx/packet/MUCAdmin$Item;>;"
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_2

    .line 1824
    new-instance v8, Lorg/jivesoftware/smackx/muc/Occupant;

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lorg/jivesoftware/smackx/packet/MUCAdmin$Item;

    invoke-direct {v8, v7}, Lorg/jivesoftware/smackx/muc/Occupant;-><init>(Lorg/jivesoftware/smackx/packet/MUCAdmin$Item;)V

    invoke-interface {v4, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 1826
    :cond_2
    return-object v4
.end method

.method public static getRoomInfo(Lorg/jivesoftware/smack/Connection;Ljava/lang/String;)Lorg/jivesoftware/smackx/muc/RoomInfo;
    .locals 2
    .param p0, "connection"    # Lorg/jivesoftware/smack/Connection;
    .param p1, "room"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 243
    invoke-static {p0}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->getInstanceFor(Lorg/jivesoftware/smack/Connection;)Lorg/jivesoftware/smackx/ServiceDiscoveryManager;

    move-result-object v1

    invoke-virtual {v1, p1}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->discoverInfo(Ljava/lang/String;)Lorg/jivesoftware/smackx/packet/DiscoverInfo;

    move-result-object v0

    .line 244
    .local v0, "info":Lorg/jivesoftware/smackx/packet/DiscoverInfo;
    new-instance v1, Lorg/jivesoftware/smackx/muc/RoomInfo;

    invoke-direct {v1, v0}, Lorg/jivesoftware/smackx/muc/RoomInfo;-><init>(Lorg/jivesoftware/smackx/packet/DiscoverInfo;)V

    return-object v1
.end method

.method public static getServiceNames(Lorg/jivesoftware/smack/Connection;)Ljava/util/Collection;
    .locals 7
    .param p0, "connection"    # Lorg/jivesoftware/smack/Connection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jivesoftware/smack/Connection;",
            ")",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 255
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 256
    .local v0, "answer":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-static {p0}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->getInstanceFor(Lorg/jivesoftware/smack/Connection;)Lorg/jivesoftware/smackx/ServiceDiscoveryManager;

    move-result-object v1

    .line 257
    .local v1, "discoManager":Lorg/jivesoftware/smackx/ServiceDiscoveryManager;
    invoke-virtual {p0}, Lorg/jivesoftware/smack/Connection;->getServiceName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1, v6}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->discoverItems(Ljava/lang/String;)Lorg/jivesoftware/smackx/packet/DiscoverItems;

    move-result-object v5

    .line 258
    .local v5, "items":Lorg/jivesoftware/smackx/packet/DiscoverItems;
    invoke-virtual {v5}, Lorg/jivesoftware/smackx/packet/DiscoverItems;->getItems()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/jivesoftware/smackx/packet/DiscoverItems$Item;>;"
    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 259
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/jivesoftware/smackx/packet/DiscoverItems$Item;

    .line 261
    .local v4, "item":Lorg/jivesoftware/smackx/packet/DiscoverItems$Item;
    :try_start_0
    invoke-virtual {v4}, Lorg/jivesoftware/smackx/packet/DiscoverItems$Item;->getEntityID()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1, v6}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->discoverInfo(Ljava/lang/String;)Lorg/jivesoftware/smackx/packet/DiscoverInfo;

    move-result-object v2

    .line 262
    .local v2, "info":Lorg/jivesoftware/smackx/packet/DiscoverInfo;
    const-string/jumbo v6, "http://jabber.org/protocol/muc"

    invoke-virtual {v2, v6}, Lorg/jivesoftware/smackx/packet/DiscoverInfo;->containsFeature(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 263
    invoke-virtual {v4}, Lorg/jivesoftware/smackx/packet/DiscoverItems$Item;->getEntityID()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v0, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Lorg/jivesoftware/smack/XMPPException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 266
    .end local v2    # "info":Lorg/jivesoftware/smackx/packet/DiscoverInfo;
    :catch_0
    move-exception v6

    goto :goto_0

    .line 271
    .end local v4    # "item":Lorg/jivesoftware/smackx/packet/DiscoverItems$Item;
    :cond_1
    return-object v0
.end method

.method private init()V
    .locals 11

    .prologue
    const/4 v10, 0x2

    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 2125
    new-instance v4, Lorg/jivesoftware/smack/filter/AndFilter;

    new-array v5, v10, [Lorg/jivesoftware/smack/filter/PacketFilter;

    new-instance v6, Lorg/jivesoftware/smack/filter/FromMatchesFilter;

    iget-object v7, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->room:Ljava/lang/String;

    invoke-direct {v6, v7}, Lorg/jivesoftware/smack/filter/FromMatchesFilter;-><init>(Ljava/lang/String;)V

    aput-object v6, v5, v8

    new-instance v6, Lorg/jivesoftware/smack/filter/MessageTypeFilter;

    sget-object v7, Lorg/jivesoftware/smack/packet/Message$Type;->groupchat:Lorg/jivesoftware/smack/packet/Message$Type;

    invoke-direct {v6, v7}, Lorg/jivesoftware/smack/filter/MessageTypeFilter;-><init>(Lorg/jivesoftware/smack/packet/Message$Type;)V

    aput-object v6, v5, v9

    invoke-direct {v4, v5}, Lorg/jivesoftware/smack/filter/AndFilter;-><init>([Lorg/jivesoftware/smack/filter/PacketFilter;)V

    iput-object v4, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->messageFilter:Lorg/jivesoftware/smack/filter/PacketFilter;

    .line 2129
    new-instance v4, Lorg/jivesoftware/smack/filter/AndFilter;

    new-array v5, v10, [Lorg/jivesoftware/smack/filter/PacketFilter;

    iget-object v6, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->messageFilter:Lorg/jivesoftware/smack/filter/PacketFilter;

    aput-object v6, v5, v8

    new-instance v6, Lorg/jivesoftware/smackx/muc/MultiUserChat$3;

    invoke-direct {v6, p0}, Lorg/jivesoftware/smackx/muc/MultiUserChat$3;-><init>(Lorg/jivesoftware/smackx/muc/MultiUserChat;)V

    aput-object v6, v5, v9

    invoke-direct {v4, v5}, Lorg/jivesoftware/smack/filter/AndFilter;-><init>([Lorg/jivesoftware/smack/filter/PacketFilter;)V

    iput-object v4, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->messageFilter:Lorg/jivesoftware/smack/filter/PacketFilter;

    .line 2135
    new-instance v4, Lorg/jivesoftware/smack/filter/AndFilter;

    new-array v5, v10, [Lorg/jivesoftware/smack/filter/PacketFilter;

    new-instance v6, Lorg/jivesoftware/smack/filter/FromMatchesFilter;

    iget-object v7, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->room:Ljava/lang/String;

    invoke-direct {v6, v7}, Lorg/jivesoftware/smack/filter/FromMatchesFilter;-><init>(Ljava/lang/String;)V

    aput-object v6, v5, v8

    new-instance v6, Lorg/jivesoftware/smack/filter/PacketTypeFilter;

    const-class v7, Lorg/jivesoftware/smack/packet/Presence;

    invoke-direct {v6, v7}, Lorg/jivesoftware/smack/filter/PacketTypeFilter;-><init>(Ljava/lang/Class;)V

    aput-object v6, v5, v9

    invoke-direct {v4, v5}, Lorg/jivesoftware/smack/filter/AndFilter;-><init>([Lorg/jivesoftware/smack/filter/PacketFilter;)V

    iput-object v4, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->presenceFilter:Lorg/jivesoftware/smack/filter/PacketFilter;

    .line 2139
    new-instance v4, Lorg/jivesoftware/smackx/muc/ConnectionDetachedPacketCollector;

    invoke-direct {v4}, Lorg/jivesoftware/smackx/muc/ConnectionDetachedPacketCollector;-><init>()V

    iput-object v4, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->messageCollector:Lorg/jivesoftware/smackx/muc/ConnectionDetachedPacketCollector;

    .line 2142
    new-instance v3, Lorg/jivesoftware/smackx/muc/MultiUserChat$4;

    invoke-direct {v3, p0}, Lorg/jivesoftware/smackx/muc/MultiUserChat$4;-><init>(Lorg/jivesoftware/smackx/muc/MultiUserChat;)V

    .line 2156
    .local v3, "subjectListener":Lorg/jivesoftware/smack/PacketListener;
    new-instance v2, Lorg/jivesoftware/smackx/muc/MultiUserChat$5;

    invoke-direct {v2, p0}, Lorg/jivesoftware/smackx/muc/MultiUserChat$5;-><init>(Lorg/jivesoftware/smackx/muc/MultiUserChat;)V

    .line 2215
    .local v2, "presenceListener":Lorg/jivesoftware/smack/PacketListener;
    new-instance v0, Lorg/jivesoftware/smackx/muc/MultiUserChat$6;

    invoke-direct {v0, p0}, Lorg/jivesoftware/smackx/muc/MultiUserChat$6;-><init>(Lorg/jivesoftware/smackx/muc/MultiUserChat;)V

    .line 2230
    .local v0, "declinesListener":Lorg/jivesoftware/smack/PacketListener;
    new-instance v1, Lorg/jivesoftware/smackx/muc/PacketMultiplexListener;

    iget-object v4, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->messageCollector:Lorg/jivesoftware/smackx/muc/ConnectionDetachedPacketCollector;

    invoke-direct {v1, v4, v2, v3, v0}, Lorg/jivesoftware/smackx/muc/PacketMultiplexListener;-><init>(Lorg/jivesoftware/smackx/muc/ConnectionDetachedPacketCollector;Lorg/jivesoftware/smack/PacketListener;Lorg/jivesoftware/smack/PacketListener;Lorg/jivesoftware/smack/PacketListener;)V

    .line 2234
    .local v1, "packetMultiplexor":Lorg/jivesoftware/smackx/muc/PacketMultiplexListener;
    iget-object v4, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-static {v4}, Lorg/jivesoftware/smackx/muc/RoomListenerMultiplexor;->getRoomMultiplexor(Lorg/jivesoftware/smack/Connection;)Lorg/jivesoftware/smackx/muc/RoomListenerMultiplexor;

    move-result-object v4

    iput-object v4, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->roomListenerMultiplexor:Lorg/jivesoftware/smackx/muc/RoomListenerMultiplexor;

    .line 2236
    iget-object v4, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->roomListenerMultiplexor:Lorg/jivesoftware/smackx/muc/RoomListenerMultiplexor;

    iget-object v5, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->room:Ljava/lang/String;

    invoke-virtual {v4, v5, v1}, Lorg/jivesoftware/smackx/muc/RoomListenerMultiplexor;->addRoom(Ljava/lang/String;Lorg/jivesoftware/smackx/muc/PacketMultiplexListener;)V

    .line 2237
    return-void
.end method

.method public static isServiceEnabled(Lorg/jivesoftware/smack/Connection;Ljava/lang/String;)Z
    .locals 3
    .param p0, "connection"    # Lorg/jivesoftware/smack/Connection;
    .param p1, "user"    # Ljava/lang/String;

    .prologue
    .line 177
    :try_start_0
    invoke-static {p0}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->getInstanceFor(Lorg/jivesoftware/smack/Connection;)Lorg/jivesoftware/smackx/ServiceDiscoveryManager;

    move-result-object v2

    invoke-virtual {v2, p1}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->discoverInfo(Ljava/lang/String;)Lorg/jivesoftware/smackx/packet/DiscoverInfo;

    move-result-object v1

    .line 179
    .local v1, "result":Lorg/jivesoftware/smackx/packet/DiscoverInfo;
    const-string/jumbo v2, "http://jabber.org/protocol/muc"

    invoke-virtual {v1, v2}, Lorg/jivesoftware/smackx/packet/DiscoverInfo;->containsFeature(Ljava/lang/String;)Z
    :try_end_0
    .catch Lorg/jivesoftware/smack/XMPPException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    .line 183
    .end local v1    # "result":Lorg/jivesoftware/smackx/packet/DiscoverInfo;
    :goto_0
    return v2

    .line 181
    :catch_0
    move-exception v0

    .line 182
    .local v0, "e":Lorg/jivesoftware/smack/XMPPException;
    invoke-virtual {v0}, Lorg/jivesoftware/smack/XMPPException;->printStackTrace()V

    .line 183
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public static removeInvitationListener(Lorg/jivesoftware/smack/Connection;Lorg/jivesoftware/smackx/muc/InvitationListener;)V
    .locals 1
    .param p0, "conn"    # Lorg/jivesoftware/smack/Connection;
    .param p1, "listener"    # Lorg/jivesoftware/smackx/muc/InvitationListener;

    .prologue
    .line 811
    invoke-static {p0}, Lorg/jivesoftware/smackx/muc/MultiUserChat$InvitationsMonitor;->getInvitationsMonitor(Lorg/jivesoftware/smack/Connection;)Lorg/jivesoftware/smackx/muc/MultiUserChat$InvitationsMonitor;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/jivesoftware/smackx/muc/MultiUserChat$InvitationsMonitor;->removeInvitationListener(Lorg/jivesoftware/smackx/muc/InvitationListener;)V

    .line 812
    return-void
.end method

.method private declared-synchronized userHasJoined()V
    .locals 3

    .prologue
    .line 1985
    monitor-enter p0

    :try_start_0
    sget-object v1, Lorg/jivesoftware/smackx/muc/MultiUserChat;->joinedRooms:Ljava/util/Map;

    iget-object v2, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 1986
    .local v0, "rooms":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-nez v0, :cond_0

    .line 1987
    new-instance v0, Ljava/util/ArrayList;

    .end local v0    # "rooms":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 1988
    .restart local v0    # "rooms":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    sget-object v1, Lorg/jivesoftware/smackx/muc/MultiUserChat;->joinedRooms:Ljava/util/Map;

    iget-object v2, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1990
    :cond_0
    iget-object v1, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->room:Ljava/lang/String;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1991
    monitor-exit p0

    return-void

    .line 1985
    .end local v0    # "rooms":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method private declared-synchronized userHasLeft()V
    .locals 3

    .prologue
    .line 1998
    monitor-enter p0

    :try_start_0
    sget-object v1, Lorg/jivesoftware/smackx/muc/MultiUserChat;->joinedRooms:Ljava/util/Map;

    iget-object v2, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1999
    .local v0, "rooms":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-nez v0, :cond_0

    .line 2004
    :goto_0
    monitor-exit p0

    return-void

    .line 2002
    :cond_0
    :try_start_1
    iget-object v1, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->room:Ljava/lang/String;

    invoke-interface {v0, v1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 2003
    invoke-direct {p0}, Lorg/jivesoftware/smackx/muc/MultiUserChat;->cleanup()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 1998
    .end local v0    # "rooms":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method


# virtual methods
.method public addInvitationRejectionListener(Lorg/jivesoftware/smackx/muc/InvitationRejectionListener;)V
    .locals 2
    .param p1, "listener"    # Lorg/jivesoftware/smackx/muc/InvitationRejectionListener;

    .prologue
    .line 821
    iget-object v1, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->invitationRejectionListeners:Ljava/util/List;

    monitor-enter v1

    .line 822
    :try_start_0
    iget-object v0, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->invitationRejectionListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 823
    iget-object v0, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->invitationRejectionListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 825
    :cond_0
    monitor-exit v1

    .line 826
    return-void

    .line 825
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public addMessageListener(Lorg/jivesoftware/smack/PacketListener;)V
    .locals 2
    .param p1, "listener"    # Lorg/jivesoftware/smack/PacketListener;

    .prologue
    .line 1924
    iget-object v0, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->connection:Lorg/jivesoftware/smack/Connection;

    iget-object v1, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->messageFilter:Lorg/jivesoftware/smack/filter/PacketFilter;

    invoke-virtual {v0, p1, v1}, Lorg/jivesoftware/smack/Connection;->addPacketListener(Lorg/jivesoftware/smack/PacketListener;Lorg/jivesoftware/smack/filter/PacketFilter;)V

    .line 1925
    iget-object v0, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->connectionListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1926
    return-void
.end method

.method public addParticipantListener(Lorg/jivesoftware/smack/PacketListener;)V
    .locals 2
    .param p1, "listener"    # Lorg/jivesoftware/smack/PacketListener;

    .prologue
    .line 1625
    iget-object v0, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->connection:Lorg/jivesoftware/smack/Connection;

    iget-object v1, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->presenceFilter:Lorg/jivesoftware/smack/filter/PacketFilter;

    invoke-virtual {v0, p1, v1}, Lorg/jivesoftware/smack/Connection;->addPacketListener(Lorg/jivesoftware/smack/PacketListener;Lorg/jivesoftware/smack/filter/PacketFilter;)V

    .line 1626
    iget-object v0, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->connectionListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1627
    return-void
.end method

.method public addParticipantStatusListener(Lorg/jivesoftware/smackx/muc/ParticipantStatusListener;)V
    .locals 2
    .param p1, "listener"    # Lorg/jivesoftware/smackx/muc/ParticipantStatusListener;

    .prologue
    .line 2079
    iget-object v1, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->participantStatusListeners:Ljava/util/List;

    monitor-enter v1

    .line 2080
    :try_start_0
    iget-object v0, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->participantStatusListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 2081
    iget-object v0, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->participantStatusListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 2083
    :cond_0
    monitor-exit v1

    .line 2084
    return-void

    .line 2083
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public addPresenceInterceptor(Lorg/jivesoftware/smack/PacketInterceptor;)V
    .locals 1
    .param p1, "presenceInterceptor"    # Lorg/jivesoftware/smack/PacketInterceptor;

    .prologue
    .line 905
    iget-object v0, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->presenceInterceptors:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 906
    return-void
.end method

.method public addSubjectUpdatedListener(Lorg/jivesoftware/smackx/muc/SubjectUpdatedListener;)V
    .locals 2
    .param p1, "listener"    # Lorg/jivesoftware/smackx/muc/SubjectUpdatedListener;

    .prologue
    .line 864
    iget-object v1, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->subjectUpdatedListeners:Ljava/util/List;

    monitor-enter v1

    .line 865
    :try_start_0
    iget-object v0, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->subjectUpdatedListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 866
    iget-object v0, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->subjectUpdatedListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 868
    :cond_0
    monitor-exit v1

    .line 869
    return-void

    .line 868
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public addUserStatusListener(Lorg/jivesoftware/smackx/muc/UserStatusListener;)V
    .locals 2
    .param p1, "listener"    # Lorg/jivesoftware/smackx/muc/UserStatusListener;

    .prologue
    .line 2027
    iget-object v1, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->userStatusListeners:Ljava/util/List;

    monitor-enter v1

    .line 2028
    :try_start_0
    iget-object v0, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->userStatusListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 2029
    iget-object v0, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->userStatusListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 2031
    :cond_0
    monitor-exit v1

    .line 2032
    return-void

    .line 2031
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public banUser(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "jid"    # Ljava/lang/String;
    .param p2, "reason"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 1172
    const-string/jumbo v0, "outcast"

    invoke-direct {p0, p1, v0, p2}, Lorg/jivesoftware/smackx/muc/MultiUserChat;->changeAffiliationByAdmin(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1173
    return-void
.end method

.method public banUsers(Ljava/util/Collection;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 1155
    .local p1, "jids":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    const-string/jumbo v0, "outcast"

    invoke-direct {p0, p1, v0}, Lorg/jivesoftware/smackx/muc/MultiUserChat;->changeAffiliationByAdmin(Ljava/util/Collection;Ljava/lang/String;)V

    .line 1156
    return-void
.end method

.method public changeAvailabilityStatus(Ljava/lang/String;Lorg/jivesoftware/smack/packet/Presence$Mode;)V
    .locals 5
    .param p1, "status"    # Ljava/lang/String;
    .param p2, "mode"    # Lorg/jivesoftware/smack/packet/Presence$Mode;

    .prologue
    .line 1036
    iget-object v3, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->nickname:Ljava/lang/String;

    if-eqz v3, :cond_0

    iget-object v3, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->nickname:Ljava/lang/String;

    const-string/jumbo v4, ""

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 1037
    :cond_0
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v4, "Nickname must not be null or blank."

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 1041
    :cond_1
    iget-boolean v3, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->joined:Z

    if-nez v3, :cond_2

    .line 1042
    new-instance v3, Ljava/lang/IllegalStateException;

    const-string/jumbo v4, "Must be logged into the room to change the availability status."

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 1047
    :cond_2
    new-instance v1, Lorg/jivesoftware/smack/packet/Presence;

    sget-object v3, Lorg/jivesoftware/smack/packet/Presence$Type;->available:Lorg/jivesoftware/smack/packet/Presence$Type;

    invoke-direct {v1, v3}, Lorg/jivesoftware/smack/packet/Presence;-><init>(Lorg/jivesoftware/smack/packet/Presence$Type;)V

    .line 1048
    .local v1, "joinPresence":Lorg/jivesoftware/smack/packet/Presence;
    invoke-virtual {v1, p1}, Lorg/jivesoftware/smack/packet/Presence;->setStatus(Ljava/lang/String;)V

    .line 1049
    invoke-virtual {v1, p2}, Lorg/jivesoftware/smack/packet/Presence;->setMode(Lorg/jivesoftware/smack/packet/Presence$Mode;)V

    .line 1050
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->room:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->nickname:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Lorg/jivesoftware/smack/packet/Presence;->setTo(Ljava/lang/String;)V

    .line 1052
    iget-object v3, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->presenceInterceptors:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/jivesoftware/smack/PacketInterceptor;

    .line 1053
    .local v2, "packetInterceptor":Lorg/jivesoftware/smack/PacketInterceptor;
    invoke-interface {v2, v1}, Lorg/jivesoftware/smack/PacketInterceptor;->interceptPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    goto :goto_0

    .line 1057
    .end local v2    # "packetInterceptor":Lorg/jivesoftware/smack/PacketInterceptor;
    :cond_3
    iget-object v3, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v3, v1}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 1058
    return-void
.end method

.method public changeNickname(Ljava/lang/String;)V
    .locals 11
    .param p1, "nickname"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 986
    if-eqz p1, :cond_0

    const-string/jumbo v6, ""

    invoke-virtual {p1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 987
    :cond_0
    new-instance v6, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v7, "Nickname must not be null or blank."

    invoke-direct {v6, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 991
    :cond_1
    iget-boolean v6, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->joined:Z

    if-nez v6, :cond_2

    .line 992
    new-instance v6, Ljava/lang/IllegalStateException;

    const-string/jumbo v7, "Must be logged into the room to change nickname."

    invoke-direct {v6, v7}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 997
    :cond_2
    new-instance v1, Lorg/jivesoftware/smack/packet/Presence;

    sget-object v6, Lorg/jivesoftware/smack/packet/Presence$Type;->available:Lorg/jivesoftware/smack/packet/Presence$Type;

    invoke-direct {v1, v6}, Lorg/jivesoftware/smack/packet/Presence;-><init>(Lorg/jivesoftware/smack/packet/Presence$Type;)V

    .line 998
    .local v1, "joinPresence":Lorg/jivesoftware/smack/packet/Presence;
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v7, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->room:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, "/"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1, v6}, Lorg/jivesoftware/smack/packet/Presence;->setTo(Ljava/lang/String;)V

    .line 1000
    iget-object v6, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->presenceInterceptors:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/jivesoftware/smack/PacketInterceptor;

    .line 1001
    .local v2, "packetInterceptor":Lorg/jivesoftware/smack/PacketInterceptor;
    invoke-interface {v2, v1}, Lorg/jivesoftware/smack/PacketInterceptor;->interceptPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    goto :goto_0

    .line 1005
    .end local v2    # "packetInterceptor":Lorg/jivesoftware/smack/PacketInterceptor;
    :cond_3
    new-instance v5, Lorg/jivesoftware/smack/filter/AndFilter;

    const/4 v6, 0x2

    new-array v6, v6, [Lorg/jivesoftware/smack/filter/PacketFilter;

    const/4 v7, 0x0

    new-instance v8, Lorg/jivesoftware/smack/filter/FromMatchesFilter;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v10, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->room:Ljava/lang/String;

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string/jumbo v10, "/"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Lorg/jivesoftware/smack/filter/FromMatchesFilter;-><init>(Ljava/lang/String;)V

    aput-object v8, v6, v7

    const/4 v7, 0x1

    new-instance v8, Lorg/jivesoftware/smack/filter/PacketTypeFilter;

    const-class v9, Lorg/jivesoftware/smack/packet/Presence;

    invoke-direct {v8, v9}, Lorg/jivesoftware/smack/filter/PacketTypeFilter;-><init>(Ljava/lang/Class;)V

    aput-object v8, v6, v7

    invoke-direct {v5, v6}, Lorg/jivesoftware/smack/filter/AndFilter;-><init>([Lorg/jivesoftware/smack/filter/PacketFilter;)V

    .line 1009
    .local v5, "responseFilter":Lorg/jivesoftware/smack/filter/PacketFilter;
    iget-object v6, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v6, v5}, Lorg/jivesoftware/smack/Connection;->createPacketCollector(Lorg/jivesoftware/smack/filter/PacketFilter;)Lorg/jivesoftware/smack/PacketCollector;

    move-result-object v4

    .line 1011
    .local v4, "response":Lorg/jivesoftware/smack/PacketCollector;
    iget-object v6, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v6, v1}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 1013
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getPacketReplyTimeout()I

    move-result v6

    int-to-long v6, v6

    invoke-virtual {v4, v6, v7}, Lorg/jivesoftware/smack/PacketCollector;->nextResult(J)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v3

    check-cast v3, Lorg/jivesoftware/smack/packet/Presence;

    .line 1016
    .local v3, "presence":Lorg/jivesoftware/smack/packet/Presence;
    invoke-virtual {v4}, Lorg/jivesoftware/smack/PacketCollector;->cancel()V

    .line 1018
    if-nez v3, :cond_4

    .line 1019
    new-instance v6, Lorg/jivesoftware/smack/XMPPException;

    const-string/jumbo v7, "No response from server."

    invoke-direct {v6, v7}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 1021
    :cond_4
    invoke-virtual {v3}, Lorg/jivesoftware/smack/packet/Presence;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v6

    if-eqz v6, :cond_5

    .line 1022
    new-instance v6, Lorg/jivesoftware/smack/XMPPException;

    invoke-virtual {v3}, Lorg/jivesoftware/smack/packet/Presence;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v7

    invoke-direct {v6, v7}, Lorg/jivesoftware/smack/XMPPException;-><init>(Lorg/jivesoftware/smack/packet/XMPPError;)V

    throw v6

    .line 1024
    :cond_5
    iput-object p1, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->nickname:Ljava/lang/String;

    .line 1025
    return-void
.end method

.method public changeSubject(Ljava/lang/String;)V
    .locals 11
    .param p1, "subject"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    const/4 v10, 0x2

    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 1950
    new-instance v1, Lorg/jivesoftware/smack/packet/Message;

    iget-object v5, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->room:Ljava/lang/String;

    sget-object v6, Lorg/jivesoftware/smack/packet/Message$Type;->groupchat:Lorg/jivesoftware/smack/packet/Message$Type;

    invoke-direct {v1, v5, v6}, Lorg/jivesoftware/smack/packet/Message;-><init>(Ljava/lang/String;Lorg/jivesoftware/smack/packet/Message$Type;)V

    .line 1951
    .local v1, "message":Lorg/jivesoftware/smack/packet/Message;
    invoke-virtual {v1, p1}, Lorg/jivesoftware/smack/packet/Message;->setSubject(Ljava/lang/String;)V

    .line 1953
    new-instance v3, Lorg/jivesoftware/smack/filter/AndFilter;

    new-array v5, v10, [Lorg/jivesoftware/smack/filter/PacketFilter;

    new-instance v6, Lorg/jivesoftware/smack/filter/FromMatchesFilter;

    iget-object v7, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->room:Ljava/lang/String;

    invoke-direct {v6, v7}, Lorg/jivesoftware/smack/filter/FromMatchesFilter;-><init>(Ljava/lang/String;)V

    aput-object v6, v5, v8

    new-instance v6, Lorg/jivesoftware/smack/filter/PacketTypeFilter;

    const-class v7, Lorg/jivesoftware/smack/packet/Message;

    invoke-direct {v6, v7}, Lorg/jivesoftware/smack/filter/PacketTypeFilter;-><init>(Ljava/lang/Class;)V

    aput-object v6, v5, v9

    invoke-direct {v3, v5}, Lorg/jivesoftware/smack/filter/AndFilter;-><init>([Lorg/jivesoftware/smack/filter/PacketFilter;)V

    .line 1957
    .local v3, "responseFilter":Lorg/jivesoftware/smack/filter/PacketFilter;
    new-instance v4, Lorg/jivesoftware/smack/filter/AndFilter;

    new-array v5, v10, [Lorg/jivesoftware/smack/filter/PacketFilter;

    aput-object v3, v5, v8

    new-instance v6, Lorg/jivesoftware/smackx/muc/MultiUserChat$2;

    invoke-direct {v6, p0, p1}, Lorg/jivesoftware/smackx/muc/MultiUserChat$2;-><init>(Lorg/jivesoftware/smackx/muc/MultiUserChat;Ljava/lang/String;)V

    aput-object v6, v5, v9

    invoke-direct {v4, v5}, Lorg/jivesoftware/smack/filter/AndFilter;-><init>([Lorg/jivesoftware/smack/filter/PacketFilter;)V

    .line 1963
    .end local v3    # "responseFilter":Lorg/jivesoftware/smack/filter/PacketFilter;
    .local v4, "responseFilter":Lorg/jivesoftware/smack/filter/PacketFilter;
    iget-object v5, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v5, v4}, Lorg/jivesoftware/smack/Connection;->createPacketCollector(Lorg/jivesoftware/smack/filter/PacketFilter;)Lorg/jivesoftware/smack/PacketCollector;

    move-result-object v2

    .line 1965
    .local v2, "response":Lorg/jivesoftware/smack/PacketCollector;
    iget-object v5, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v5, v1}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 1967
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getPacketReplyTimeout()I

    move-result v5

    int-to-long v6, v5

    invoke-virtual {v2, v6, v7}, Lorg/jivesoftware/smack/PacketCollector;->nextResult(J)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smack/packet/Message;

    .line 1970
    .local v0, "answer":Lorg/jivesoftware/smack/packet/Message;
    invoke-virtual {v2}, Lorg/jivesoftware/smack/PacketCollector;->cancel()V

    .line 1972
    if-nez v0, :cond_0

    .line 1973
    new-instance v5, Lorg/jivesoftware/smack/XMPPException;

    const-string/jumbo v6, "No response from server."

    invoke-direct {v5, v6}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 1975
    :cond_0
    invoke-virtual {v0}, Lorg/jivesoftware/smack/packet/Message;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v5

    if-eqz v5, :cond_1

    .line 1976
    new-instance v5, Lorg/jivesoftware/smack/XMPPException;

    invoke-virtual {v0}, Lorg/jivesoftware/smack/packet/Message;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v6

    invoke-direct {v5, v6}, Lorg/jivesoftware/smack/XMPPException;-><init>(Lorg/jivesoftware/smack/packet/XMPPError;)V

    throw v5

    .line 1978
    :cond_1
    return-void
.end method

.method public declared-synchronized create(Ljava/lang/String;)V
    .locals 12
    .param p1, "nickname"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 325
    monitor-enter p0

    if-eqz p1, :cond_0

    :try_start_0
    const-string/jumbo v7, ""

    invoke-virtual {p1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 326
    :cond_0
    new-instance v7, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v8, "Nickname must not be null or blank."

    invoke-direct {v7, v8}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v7
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 325
    :catchall_0
    move-exception v7

    monitor-exit p0

    throw v7

    .line 330
    :cond_1
    :try_start_1
    iget-boolean v7, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->joined:Z

    if-eqz v7, :cond_2

    .line 331
    new-instance v7, Ljava/lang/IllegalStateException;

    const-string/jumbo v8, "Creation failed - User already joined the room."

    invoke-direct {v7, v8}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 335
    :cond_2
    new-instance v1, Lorg/jivesoftware/smack/packet/Presence;

    sget-object v7, Lorg/jivesoftware/smack/packet/Presence$Type;->available:Lorg/jivesoftware/smack/packet/Presence$Type;

    invoke-direct {v1, v7}, Lorg/jivesoftware/smack/packet/Presence;-><init>(Lorg/jivesoftware/smack/packet/Presence$Type;)V

    .line 336
    .local v1, "joinPresence":Lorg/jivesoftware/smack/packet/Presence;
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v8, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->room:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v8, "/"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v1, v7}, Lorg/jivesoftware/smack/packet/Presence;->setTo(Ljava/lang/String;)V

    .line 338
    new-instance v7, Lorg/jivesoftware/smackx/packet/MUCInitialPresence;

    invoke-direct {v7}, Lorg/jivesoftware/smackx/packet/MUCInitialPresence;-><init>()V

    invoke-virtual {v1, v7}, Lorg/jivesoftware/smack/packet/Presence;->addExtension(Lorg/jivesoftware/smack/packet/PacketExtension;)V

    .line 340
    iget-object v7, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->presenceInterceptors:Ljava/util/List;

    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/jivesoftware/smack/PacketInterceptor;

    .line 341
    .local v3, "packetInterceptor":Lorg/jivesoftware/smack/PacketInterceptor;
    invoke-interface {v3, v1}, Lorg/jivesoftware/smack/PacketInterceptor;->interceptPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    goto :goto_0

    .line 345
    .end local v3    # "packetInterceptor":Lorg/jivesoftware/smack/PacketInterceptor;
    :cond_3
    new-instance v6, Lorg/jivesoftware/smack/filter/AndFilter;

    const/4 v7, 0x2

    new-array v7, v7, [Lorg/jivesoftware/smack/filter/PacketFilter;

    const/4 v8, 0x0

    new-instance v9, Lorg/jivesoftware/smack/filter/FromMatchesFilter;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v11, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->room:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string/jumbo v11, "/"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Lorg/jivesoftware/smack/filter/FromMatchesFilter;-><init>(Ljava/lang/String;)V

    aput-object v9, v7, v8

    const/4 v8, 0x1

    new-instance v9, Lorg/jivesoftware/smack/filter/PacketTypeFilter;

    const-class v10, Lorg/jivesoftware/smack/packet/Presence;

    invoke-direct {v9, v10}, Lorg/jivesoftware/smack/filter/PacketTypeFilter;-><init>(Ljava/lang/Class;)V

    aput-object v9, v7, v8

    invoke-direct {v6, v7}, Lorg/jivesoftware/smack/filter/AndFilter;-><init>([Lorg/jivesoftware/smack/filter/PacketFilter;)V

    .line 349
    .local v6, "responseFilter":Lorg/jivesoftware/smack/filter/PacketFilter;
    iget-object v7, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v7, v6}, Lorg/jivesoftware/smack/Connection;->createPacketCollector(Lorg/jivesoftware/smack/filter/PacketFilter;)Lorg/jivesoftware/smack/PacketCollector;

    move-result-object v5

    .line 351
    .local v5, "response":Lorg/jivesoftware/smack/PacketCollector;
    iget-object v7, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v7, v1}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 353
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getPacketReplyTimeout()I

    move-result v7

    int-to-long v8, v7

    invoke-virtual {v5, v8, v9}, Lorg/jivesoftware/smack/PacketCollector;->nextResult(J)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v4

    check-cast v4, Lorg/jivesoftware/smack/packet/Presence;

    .line 356
    .local v4, "presence":Lorg/jivesoftware/smack/packet/Presence;
    invoke-virtual {v5}, Lorg/jivesoftware/smack/PacketCollector;->cancel()V

    .line 358
    if-nez v4, :cond_4

    .line 359
    new-instance v7, Lorg/jivesoftware/smack/XMPPException;

    const-string/jumbo v8, "No response from server."

    invoke-direct {v7, v8}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 361
    :cond_4
    invoke-virtual {v4}, Lorg/jivesoftware/smack/packet/Presence;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v7

    if-eqz v7, :cond_5

    .line 362
    new-instance v7, Lorg/jivesoftware/smack/XMPPException;

    invoke-virtual {v4}, Lorg/jivesoftware/smack/packet/Presence;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v8

    invoke-direct {v7, v8}, Lorg/jivesoftware/smack/XMPPException;-><init>(Lorg/jivesoftware/smack/packet/XMPPError;)V

    throw v7

    .line 365
    :cond_5
    iput-object p1, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->nickname:Ljava/lang/String;

    .line 366
    const/4 v7, 0x1

    iput-boolean v7, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->joined:Z

    .line 367
    invoke-direct {p0}, Lorg/jivesoftware/smackx/muc/MultiUserChat;->userHasJoined()V

    .line 370
    invoke-direct {p0, v4}, Lorg/jivesoftware/smackx/muc/MultiUserChat;->getMUCUserExtension(Lorg/jivesoftware/smack/packet/Packet;)Lorg/jivesoftware/smackx/packet/MUCUser;

    move-result-object v2

    .line 371
    .local v2, "mucUser":Lorg/jivesoftware/smackx/packet/MUCUser;
    if-eqz v2, :cond_6

    invoke-virtual {v2}, Lorg/jivesoftware/smackx/packet/MUCUser;->getStatus()Lorg/jivesoftware/smackx/packet/MUCUser$Status;

    move-result-object v7

    if-eqz v7, :cond_6

    .line 372
    const-string/jumbo v7, "201"

    invoke-virtual {v2}, Lorg/jivesoftware/smackx/packet/MUCUser;->getStatus()Lorg/jivesoftware/smackx/packet/MUCUser$Status;

    move-result-object v8

    invoke-virtual {v8}, Lorg/jivesoftware/smackx/packet/MUCUser$Status;->getCode()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v7

    if-eqz v7, :cond_6

    .line 374
    monitor-exit p0

    return-void

    .line 378
    :cond_6
    :try_start_2
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/muc/MultiUserChat;->leave()V

    .line 379
    new-instance v7, Lorg/jivesoftware/smack/XMPPException;

    const-string/jumbo v8, "Creation failed - Missing acknowledge of room creation."

    invoke-direct {v7, v8}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v7
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
.end method

.method public createMessage()Lorg/jivesoftware/smack/packet/Message;
    .locals 3

    .prologue
    .line 1862
    new-instance v0, Lorg/jivesoftware/smack/packet/Message;

    iget-object v1, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->room:Ljava/lang/String;

    sget-object v2, Lorg/jivesoftware/smack/packet/Message$Type;->groupchat:Lorg/jivesoftware/smack/packet/Message$Type;

    invoke-direct {v0, v1, v2}, Lorg/jivesoftware/smack/packet/Message;-><init>(Ljava/lang/String;Lorg/jivesoftware/smack/packet/Message$Type;)V

    return-object v0
.end method

.method public createPrivateChat(Ljava/lang/String;Lorg/jivesoftware/smack/MessageListener;)Lorg/jivesoftware/smack/Chat;
    .locals 1
    .param p1, "occupant"    # Ljava/lang/String;
    .param p2, "listener"    # Lorg/jivesoftware/smack/MessageListener;

    .prologue
    .line 1853
    iget-object v0, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v0}, Lorg/jivesoftware/smack/Connection;->getChatManager()Lorg/jivesoftware/smack/ChatManager;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lorg/jivesoftware/smack/ChatManager;->createChat(Ljava/lang/String;Lorg/jivesoftware/smack/MessageListener;)Lorg/jivesoftware/smack/Chat;

    move-result-object v0

    return-object v0
.end method

.method public destroy(Ljava/lang/String;Ljava/lang/String;)V
    .locals 8
    .param p1, "reason"    # Ljava/lang/String;
    .param p2, "alternateJID"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 694
    new-instance v2, Lorg/jivesoftware/smackx/packet/MUCOwner;

    invoke-direct {v2}, Lorg/jivesoftware/smackx/packet/MUCOwner;-><init>()V

    .line 695
    .local v2, "iq":Lorg/jivesoftware/smackx/packet/MUCOwner;
    iget-object v5, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->room:Ljava/lang/String;

    invoke-virtual {v2, v5}, Lorg/jivesoftware/smackx/packet/MUCOwner;->setTo(Ljava/lang/String;)V

    .line 696
    sget-object v5, Lorg/jivesoftware/smack/packet/IQ$Type;->SET:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {v2, v5}, Lorg/jivesoftware/smackx/packet/MUCOwner;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 699
    new-instance v1, Lorg/jivesoftware/smackx/packet/MUCOwner$Destroy;

    invoke-direct {v1}, Lorg/jivesoftware/smackx/packet/MUCOwner$Destroy;-><init>()V

    .line 700
    .local v1, "destroy":Lorg/jivesoftware/smackx/packet/MUCOwner$Destroy;
    invoke-virtual {v1, p1}, Lorg/jivesoftware/smackx/packet/MUCOwner$Destroy;->setReason(Ljava/lang/String;)V

    .line 701
    invoke-virtual {v1, p2}, Lorg/jivesoftware/smackx/packet/MUCOwner$Destroy;->setJid(Ljava/lang/String;)V

    .line 702
    invoke-virtual {v2, v1}, Lorg/jivesoftware/smackx/packet/MUCOwner;->setDestroy(Lorg/jivesoftware/smackx/packet/MUCOwner$Destroy;)V

    .line 705
    new-instance v4, Lorg/jivesoftware/smack/filter/PacketIDFilter;

    invoke-virtual {v2}, Lorg/jivesoftware/smackx/packet/MUCOwner;->getPacketID()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/jivesoftware/smack/filter/PacketIDFilter;-><init>(Ljava/lang/String;)V

    .line 706
    .local v4, "responseFilter":Lorg/jivesoftware/smack/filter/PacketFilter;
    iget-object v5, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v5, v4}, Lorg/jivesoftware/smack/Connection;->createPacketCollector(Lorg/jivesoftware/smack/filter/PacketFilter;)Lorg/jivesoftware/smack/PacketCollector;

    move-result-object v3

    .line 708
    .local v3, "response":Lorg/jivesoftware/smack/PacketCollector;
    iget-object v5, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v5, v2}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 710
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getPacketReplyTimeout()I

    move-result v5

    int-to-long v6, v5

    invoke-virtual {v3, v6, v7}, Lorg/jivesoftware/smack/PacketCollector;->nextResult(J)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smack/packet/IQ;

    .line 712
    .local v0, "answer":Lorg/jivesoftware/smack/packet/IQ;
    invoke-virtual {v3}, Lorg/jivesoftware/smack/PacketCollector;->cancel()V

    .line 714
    if-nez v0, :cond_0

    .line 715
    new-instance v5, Lorg/jivesoftware/smack/XMPPException;

    const-string/jumbo v6, "No response from server."

    invoke-direct {v5, v6}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 717
    :cond_0
    invoke-virtual {v0}, Lorg/jivesoftware/smack/packet/IQ;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v5

    if-eqz v5, :cond_1

    .line 718
    new-instance v5, Lorg/jivesoftware/smack/XMPPException;

    invoke-virtual {v0}, Lorg/jivesoftware/smack/packet/IQ;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v6

    invoke-direct {v5, v6}, Lorg/jivesoftware/smack/XMPPException;-><init>(Lorg/jivesoftware/smack/packet/XMPPError;)V

    throw v5

    .line 721
    :cond_1
    iget-object v5, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->occupantsMap:Ljava/util/Map;

    invoke-interface {v5}, Ljava/util/Map;->clear()V

    .line 722
    const/4 v5, 0x0

    iput-object v5, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->nickname:Ljava/lang/String;

    .line 723
    const/4 v5, 0x0

    iput-boolean v5, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->joined:Z

    .line 724
    invoke-direct {p0}, Lorg/jivesoftware/smackx/muc/MultiUserChat;->userHasLeft()V

    .line 725
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
    .line 2563
    invoke-direct {p0}, Lorg/jivesoftware/smackx/muc/MultiUserChat;->cleanup()V

    .line 2564
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    .line 2565
    return-void
.end method

.method public getAdmins()Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Lorg/jivesoftware/smackx/muc/Affiliate;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 1660
    const-string/jumbo v0, "admin"

    invoke-direct {p0, v0}, Lorg/jivesoftware/smackx/muc/MultiUserChat;->getAffiliatesByOwner(Ljava/lang/String;)Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method

.method public getConfigurationForm()Lorg/jivesoftware/smackx/Form;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 558
    new-instance v1, Lorg/jivesoftware/smackx/packet/MUCOwner;

    invoke-direct {v1}, Lorg/jivesoftware/smackx/packet/MUCOwner;-><init>()V

    .line 559
    .local v1, "iq":Lorg/jivesoftware/smackx/packet/MUCOwner;
    iget-object v4, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->room:Ljava/lang/String;

    invoke-virtual {v1, v4}, Lorg/jivesoftware/smackx/packet/MUCOwner;->setTo(Ljava/lang/String;)V

    .line 560
    sget-object v4, Lorg/jivesoftware/smack/packet/IQ$Type;->GET:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {v1, v4}, Lorg/jivesoftware/smackx/packet/MUCOwner;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 563
    new-instance v3, Lorg/jivesoftware/smack/filter/PacketIDFilter;

    invoke-virtual {v1}, Lorg/jivesoftware/smackx/packet/MUCOwner;->getPacketID()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/jivesoftware/smack/filter/PacketIDFilter;-><init>(Ljava/lang/String;)V

    .line 564
    .local v3, "responseFilter":Lorg/jivesoftware/smack/filter/PacketFilter;
    iget-object v4, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v4, v3}, Lorg/jivesoftware/smack/Connection;->createPacketCollector(Lorg/jivesoftware/smack/filter/PacketFilter;)Lorg/jivesoftware/smack/PacketCollector;

    move-result-object v2

    .line 566
    .local v2, "response":Lorg/jivesoftware/smack/PacketCollector;
    iget-object v4, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v4, v1}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 568
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getPacketReplyTimeout()I

    move-result v4

    int-to-long v4, v4

    invoke-virtual {v2, v4, v5}, Lorg/jivesoftware/smack/PacketCollector;->nextResult(J)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smack/packet/IQ;

    .line 570
    .local v0, "answer":Lorg/jivesoftware/smack/packet/IQ;
    invoke-virtual {v2}, Lorg/jivesoftware/smack/PacketCollector;->cancel()V

    .line 572
    if-nez v0, :cond_0

    .line 573
    new-instance v4, Lorg/jivesoftware/smack/XMPPException;

    const-string/jumbo v5, "No response from server."

    invoke-direct {v4, v5}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 575
    :cond_0
    invoke-virtual {v0}, Lorg/jivesoftware/smack/packet/IQ;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v4

    if-eqz v4, :cond_1

    .line 576
    new-instance v4, Lorg/jivesoftware/smack/XMPPException;

    invoke-virtual {v0}, Lorg/jivesoftware/smack/packet/IQ;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/jivesoftware/smack/XMPPException;-><init>(Lorg/jivesoftware/smack/packet/XMPPError;)V

    throw v4

    .line 578
    :cond_1
    invoke-static {v0}, Lorg/jivesoftware/smackx/Form;->getFormFrom(Lorg/jivesoftware/smack/packet/Packet;)Lorg/jivesoftware/smackx/Form;

    move-result-object v4

    return-object v4
.end method

.method public getMembers()Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Lorg/jivesoftware/smackx/muc/Affiliate;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 1671
    const-string/jumbo v0, "member"

    invoke-direct {p0, v0}, Lorg/jivesoftware/smackx/muc/MultiUserChat;->getAffiliatesByAdmin(Ljava/lang/String;)Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method

.method public getModerators()Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Lorg/jivesoftware/smackx/muc/Occupant;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 1775
    const-string/jumbo v0, "moderator"

    invoke-direct {p0, v0}, Lorg/jivesoftware/smackx/muc/MultiUserChat;->getOccupants(Ljava/lang/String;)Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method

.method public getNickname()Ljava/lang/String;
    .locals 1

    .prologue
    .line 972
    iget-object v0, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->nickname:Ljava/lang/String;

    return-object v0
.end method

.method public getOccupant(Ljava/lang/String;)Lorg/jivesoftware/smackx/muc/Occupant;
    .locals 2
    .param p1, "user"    # Ljava/lang/String;

    .prologue
    .line 1609
    iget-object v1, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->occupantsMap:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smack/packet/Presence;

    .line 1610
    .local v0, "presence":Lorg/jivesoftware/smack/packet/Presence;
    if-eqz v0, :cond_0

    .line 1611
    new-instance v1, Lorg/jivesoftware/smackx/muc/Occupant;

    invoke-direct {v1, v0}, Lorg/jivesoftware/smackx/muc/Occupant;-><init>(Lorg/jivesoftware/smack/packet/Presence;)V

    .line 1613
    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public getOccupantPresence(Ljava/lang/String;)Lorg/jivesoftware/smack/packet/Presence;
    .locals 1
    .param p1, "user"    # Ljava/lang/String;

    .prologue
    .line 1596
    iget-object v0, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->occupantsMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smack/packet/Presence;

    return-object v0
.end method

.method public getOccupants()Ljava/util/Iterator;
    .locals 2
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
    .line 1582
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->occupantsMap:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method public getOccupantsCount()I
    .locals 1

    .prologue
    .line 1567
    iget-object v0, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->occupantsMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    return v0
.end method

.method public getOutcasts()Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Lorg/jivesoftware/smackx/muc/Affiliate;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 1682
    const-string/jumbo v0, "outcast"

    invoke-direct {p0, v0}, Lorg/jivesoftware/smackx/muc/MultiUserChat;->getAffiliatesByAdmin(Ljava/lang/String;)Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method

.method public getOwners()Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Lorg/jivesoftware/smackx/muc/Affiliate;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 1649
    const-string/jumbo v0, "owner"

    invoke-direct {p0, v0}, Lorg/jivesoftware/smackx/muc/MultiUserChat;->getAffiliatesByAdmin(Ljava/lang/String;)Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method

.method public getParticipants()Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Lorg/jivesoftware/smackx/muc/Occupant;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 1786
    const-string/jumbo v0, "participant"

    invoke-direct {p0, v0}, Lorg/jivesoftware/smackx/muc/MultiUserChat;->getOccupants(Ljava/lang/String;)Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method

.method public getRegistrationForm()Lorg/jivesoftware/smackx/Form;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 628
    new-instance v2, Lorg/jivesoftware/smack/packet/Registration;

    invoke-direct {v2}, Lorg/jivesoftware/smack/packet/Registration;-><init>()V

    .line 629
    .local v2, "reg":Lorg/jivesoftware/smack/packet/Registration;
    sget-object v4, Lorg/jivesoftware/smack/packet/IQ$Type;->GET:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {v2, v4}, Lorg/jivesoftware/smack/packet/Registration;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 630
    iget-object v4, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->room:Ljava/lang/String;

    invoke-virtual {v2, v4}, Lorg/jivesoftware/smack/packet/Registration;->setTo(Ljava/lang/String;)V

    .line 632
    new-instance v1, Lorg/jivesoftware/smack/filter/AndFilter;

    const/4 v4, 0x2

    new-array v4, v4, [Lorg/jivesoftware/smack/filter/PacketFilter;

    const/4 v5, 0x0

    new-instance v6, Lorg/jivesoftware/smack/filter/PacketIDFilter;

    invoke-virtual {v2}, Lorg/jivesoftware/smack/packet/Registration;->getPacketID()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lorg/jivesoftware/smack/filter/PacketIDFilter;-><init>(Ljava/lang/String;)V

    aput-object v6, v4, v5

    const/4 v5, 0x1

    new-instance v6, Lorg/jivesoftware/smack/filter/PacketTypeFilter;

    const-class v7, Lorg/jivesoftware/smack/packet/IQ;

    invoke-direct {v6, v7}, Lorg/jivesoftware/smack/filter/PacketTypeFilter;-><init>(Ljava/lang/Class;)V

    aput-object v6, v4, v5

    invoke-direct {v1, v4}, Lorg/jivesoftware/smack/filter/AndFilter;-><init>([Lorg/jivesoftware/smack/filter/PacketFilter;)V

    .line 634
    .local v1, "filter":Lorg/jivesoftware/smack/filter/PacketFilter;
    iget-object v4, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v4, v1}, Lorg/jivesoftware/smack/Connection;->createPacketCollector(Lorg/jivesoftware/smack/filter/PacketFilter;)Lorg/jivesoftware/smack/PacketCollector;

    move-result-object v0

    .line 635
    .local v0, "collector":Lorg/jivesoftware/smack/PacketCollector;
    iget-object v4, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v4, v2}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 636
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getPacketReplyTimeout()I

    move-result v4

    int-to-long v4, v4

    invoke-virtual {v0, v4, v5}, Lorg/jivesoftware/smack/PacketCollector;->nextResult(J)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v3

    check-cast v3, Lorg/jivesoftware/smack/packet/IQ;

    .line 637
    .local v3, "result":Lorg/jivesoftware/smack/packet/IQ;
    invoke-virtual {v0}, Lorg/jivesoftware/smack/PacketCollector;->cancel()V

    .line 638
    if-nez v3, :cond_0

    .line 639
    new-instance v4, Lorg/jivesoftware/smack/XMPPException;

    const-string/jumbo v5, "No response from server."

    invoke-direct {v4, v5}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 641
    :cond_0
    invoke-virtual {v3}, Lorg/jivesoftware/smack/packet/IQ;->getType()Lorg/jivesoftware/smack/packet/IQ$Type;

    move-result-object v4

    sget-object v5, Lorg/jivesoftware/smack/packet/IQ$Type;->ERROR:Lorg/jivesoftware/smack/packet/IQ$Type;

    if-ne v4, v5, :cond_1

    .line 642
    new-instance v4, Lorg/jivesoftware/smack/XMPPException;

    invoke-virtual {v3}, Lorg/jivesoftware/smack/packet/IQ;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/jivesoftware/smack/XMPPException;-><init>(Lorg/jivesoftware/smack/packet/XMPPError;)V

    throw v4

    .line 644
    :cond_1
    invoke-static {v3}, Lorg/jivesoftware/smackx/Form;->getFormFrom(Lorg/jivesoftware/smack/packet/Packet;)Lorg/jivesoftware/smackx/Form;

    move-result-object v4

    return-object v4
.end method

.method public getReservedNickname()Ljava/lang/String;
    .locals 8

    .prologue
    const/4 v4, 0x0

    .line 946
    :try_start_0
    iget-object v5, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-static {v5}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->getInstanceFor(Lorg/jivesoftware/smack/Connection;)Lorg/jivesoftware/smackx/ServiceDiscoveryManager;

    move-result-object v5

    iget-object v6, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->room:Ljava/lang/String;

    const-string/jumbo v7, "x-roomuser-item"

    invoke-virtual {v5, v6, v7}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->discoverInfo(Ljava/lang/String;Ljava/lang/String;)Lorg/jivesoftware/smackx/packet/DiscoverInfo;

    move-result-object v3

    .line 951
    .local v3, "result":Lorg/jivesoftware/smackx/packet/DiscoverInfo;
    invoke-virtual {v3}, Lorg/jivesoftware/smackx/packet/DiscoverInfo;->getIdentities()Ljava/util/Iterator;

    move-result-object v1

    .line 952
    .local v1, "identities":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;>;"
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 953
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;

    .line 954
    .local v2, "identity":Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;
    invoke-virtual {v2}, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;->getName()Ljava/lang/String;
    :try_end_0
    .catch Lorg/jivesoftware/smack/XMPPException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v4

    .line 961
    .end local v1    # "identities":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;>;"
    .end local v2    # "identity":Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;
    .end local v3    # "result":Lorg/jivesoftware/smackx/packet/DiscoverInfo;
    :cond_0
    :goto_0
    return-object v4

    .line 959
    :catch_0
    move-exception v0

    .line 960
    .local v0, "e":Lorg/jivesoftware/smack/XMPPException;
    invoke-virtual {v0}, Lorg/jivesoftware/smack/XMPPException;->printStackTrace()V

    goto :goto_0
.end method

.method public getRoom()Ljava/lang/String;
    .locals 1

    .prologue
    .line 301
    iget-object v0, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->room:Ljava/lang/String;

    return-object v0
.end method

.method public getSubject()Ljava/lang/String;
    .locals 1

    .prologue
    .line 933
    iget-object v0, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->subject:Ljava/lang/String;

    return-object v0
.end method

.method public grantAdmin(Ljava/lang/String;)V
    .locals 1
    .param p1, "jid"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 1347
    const-string/jumbo v0, "admin"

    invoke-direct {p0, p1, v0}, Lorg/jivesoftware/smackx/muc/MultiUserChat;->changeAffiliationByOwner(Ljava/lang/String;Ljava/lang/String;)V

    .line 1348
    return-void
.end method

.method public grantAdmin(Ljava/util/Collection;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 1334
    .local p1, "jids":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    const-string/jumbo v0, "admin"

    invoke-direct {p0, p1, v0}, Lorg/jivesoftware/smackx/muc/MultiUserChat;->changeAffiliationByOwner(Ljava/util/Collection;Ljava/lang/String;)V

    .line 1335
    return-void
.end method

.method public grantMembership(Ljava/lang/String;)V
    .locals 2
    .param p1, "jid"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 1196
    const-string/jumbo v0, "member"

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Lorg/jivesoftware/smackx/muc/MultiUserChat;->changeAffiliationByAdmin(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1197
    return-void
.end method

.method public grantMembership(Ljava/util/Collection;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 1184
    .local p1, "jids":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    const-string/jumbo v0, "member"

    invoke-direct {p0, p1, v0}, Lorg/jivesoftware/smackx/muc/MultiUserChat;->changeAffiliationByAdmin(Ljava/util/Collection;Ljava/lang/String;)V

    .line 1185
    return-void
.end method

.method public grantModerator(Ljava/lang/String;)V
    .locals 2
    .param p1, "nickname"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 1246
    const-string/jumbo v0, "moderator"

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Lorg/jivesoftware/smackx/muc/MultiUserChat;->changeRole(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1247
    return-void
.end method

.method public grantModerator(Ljava/util/Collection;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 1234
    .local p1, "nicknames":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    const-string/jumbo v0, "moderator"

    invoke-direct {p0, p1, v0}, Lorg/jivesoftware/smackx/muc/MultiUserChat;->changeRole(Ljava/util/Collection;Ljava/lang/String;)V

    .line 1235
    return-void
.end method

.method public grantOwnership(Ljava/lang/String;)V
    .locals 2
    .param p1, "jid"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 1298
    const-string/jumbo v0, "owner"

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Lorg/jivesoftware/smackx/muc/MultiUserChat;->changeAffiliationByAdmin(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1299
    return-void
.end method

.method public grantOwnership(Ljava/util/Collection;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 1285
    .local p1, "jids":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    const-string/jumbo v0, "owner"

    invoke-direct {p0, p1, v0}, Lorg/jivesoftware/smackx/muc/MultiUserChat;->changeAffiliationByAdmin(Ljava/util/Collection;Ljava/lang/String;)V

    .line 1286
    return-void
.end method

.method public grantVoice(Ljava/lang/String;)V
    .locals 2
    .param p1, "nickname"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 1109
    const-string/jumbo v0, "participant"

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Lorg/jivesoftware/smackx/muc/MultiUserChat;->changeRole(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1110
    return-void
.end method

.method public grantVoice(Ljava/util/Collection;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 1094
    .local p1, "nicknames":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    const-string/jumbo v0, "participant"

    invoke-direct {p0, p1, v0}, Lorg/jivesoftware/smackx/muc/MultiUserChat;->changeRole(Ljava/util/Collection;Ljava/lang/String;)V

    .line 1095
    return-void
.end method

.method public invite(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "user"    # Ljava/lang/String;
    .param p2, "reason"    # Ljava/lang/String;

    .prologue
    .line 738
    new-instance v0, Lorg/jivesoftware/smack/packet/Message;

    invoke-direct {v0}, Lorg/jivesoftware/smack/packet/Message;-><init>()V

    invoke-virtual {p0, v0, p1, p2}, Lorg/jivesoftware/smackx/muc/MultiUserChat;->invite(Lorg/jivesoftware/smack/packet/Message;Ljava/lang/String;Ljava/lang/String;)V

    .line 739
    return-void
.end method

.method public invite(Lorg/jivesoftware/smack/packet/Message;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "message"    # Lorg/jivesoftware/smack/packet/Message;
    .param p2, "user"    # Ljava/lang/String;
    .param p3, "reason"    # Ljava/lang/String;

    .prologue
    .line 754
    iget-object v2, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->room:Ljava/lang/String;

    invoke-virtual {p1, v2}, Lorg/jivesoftware/smack/packet/Message;->setTo(Ljava/lang/String;)V

    .line 757
    new-instance v1, Lorg/jivesoftware/smackx/packet/MUCUser;

    invoke-direct {v1}, Lorg/jivesoftware/smackx/packet/MUCUser;-><init>()V

    .line 758
    .local v1, "mucUser":Lorg/jivesoftware/smackx/packet/MUCUser;
    new-instance v0, Lorg/jivesoftware/smackx/packet/MUCUser$Invite;

    invoke-direct {v0}, Lorg/jivesoftware/smackx/packet/MUCUser$Invite;-><init>()V

    .line 759
    .local v0, "invite":Lorg/jivesoftware/smackx/packet/MUCUser$Invite;
    invoke-virtual {v0, p2}, Lorg/jivesoftware/smackx/packet/MUCUser$Invite;->setTo(Ljava/lang/String;)V

    .line 760
    invoke-virtual {v0, p3}, Lorg/jivesoftware/smackx/packet/MUCUser$Invite;->setReason(Ljava/lang/String;)V

    .line 761
    invoke-virtual {v1, v0}, Lorg/jivesoftware/smackx/packet/MUCUser;->setInvite(Lorg/jivesoftware/smackx/packet/MUCUser$Invite;)V

    .line 763
    invoke-virtual {p1, v1}, Lorg/jivesoftware/smack/packet/Message;->addExtension(Lorg/jivesoftware/smack/packet/PacketExtension;)V

    .line 765
    iget-object v2, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v2, p1}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 766
    return-void
.end method

.method public isJoined()Z
    .locals 1

    .prologue
    .line 521
    iget-boolean v0, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->joined:Z

    return v0
.end method

.method public join(Ljava/lang/String;)V
    .locals 6
    .param p1, "nickname"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 398
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getPacketReplyTimeout()I

    move-result v0

    int-to-long v4, v0

    move-object v0, p0

    move-object v1, p1

    move-object v3, v2

    invoke-virtual/range {v0 .. v5}, Lorg/jivesoftware/smackx/muc/MultiUserChat;->join(Ljava/lang/String;Ljava/lang/String;Lorg/jivesoftware/smackx/muc/DiscussionHistory;J)V

    .line 399
    return-void
.end method

.method public join(Ljava/lang/String;Ljava/lang/String;)V
    .locals 6
    .param p1, "nickname"    # Ljava/lang/String;
    .param p2, "password"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 421
    const/4 v3, 0x0

    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getPacketReplyTimeout()I

    move-result v0

    int-to-long v4, v0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    invoke-virtual/range {v0 .. v5}, Lorg/jivesoftware/smackx/muc/MultiUserChat;->join(Ljava/lang/String;Ljava/lang/String;Lorg/jivesoftware/smackx/muc/DiscussionHistory;J)V

    .line 422
    return-void
.end method

.method public declared-synchronized join(Ljava/lang/String;Ljava/lang/String;Lorg/jivesoftware/smackx/muc/DiscussionHistory;J)V
    .locals 14
    .param p1, "nickname"    # Ljava/lang/String;
    .param p2, "password"    # Ljava/lang/String;
    .param p3, "history"    # Lorg/jivesoftware/smackx/muc/DiscussionHistory;
    .param p4, "timeout"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 455
    monitor-enter p0

    if-eqz p1, :cond_0

    :try_start_0
    const-string/jumbo v9, ""

    invoke-virtual {p1, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_1

    .line 456
    :cond_0
    new-instance v9, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v10, "Nickname must not be null or blank."

    invoke-direct {v9, v10}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v9
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 455
    :catchall_0
    move-exception v9

    monitor-exit p0

    throw v9

    .line 460
    :cond_1
    :try_start_1
    iget-boolean v9, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->joined:Z

    if-eqz v9, :cond_2

    .line 461
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/muc/MultiUserChat;->leave()V

    .line 465
    :cond_2
    new-instance v3, Lorg/jivesoftware/smack/packet/Presence;

    sget-object v9, Lorg/jivesoftware/smack/packet/Presence$Type;->available:Lorg/jivesoftware/smack/packet/Presence$Type;

    invoke-direct {v3, v9}, Lorg/jivesoftware/smack/packet/Presence;-><init>(Lorg/jivesoftware/smack/packet/Presence$Type;)V

    .line 466
    .local v3, "joinPresence":Lorg/jivesoftware/smack/packet/Presence;
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v10, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->room:Ljava/lang/String;

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string/jumbo v10, "/"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v3, v9}, Lorg/jivesoftware/smack/packet/Presence;->setTo(Ljava/lang/String;)V

    .line 469
    new-instance v4, Lorg/jivesoftware/smackx/packet/MUCInitialPresence;

    invoke-direct {v4}, Lorg/jivesoftware/smackx/packet/MUCInitialPresence;-><init>()V

    .line 470
    .local v4, "mucInitialPresence":Lorg/jivesoftware/smackx/packet/MUCInitialPresence;
    if-eqz p2, :cond_3

    .line 471
    move-object/from16 v0, p2

    invoke-virtual {v4, v0}, Lorg/jivesoftware/smackx/packet/MUCInitialPresence;->setPassword(Ljava/lang/String;)V

    .line 473
    :cond_3
    if-eqz p3, :cond_4

    .line 474
    invoke-virtual/range {p3 .. p3}, Lorg/jivesoftware/smackx/muc/DiscussionHistory;->getMUCHistory()Lorg/jivesoftware/smackx/packet/MUCInitialPresence$History;

    move-result-object v9

    invoke-virtual {v4, v9}, Lorg/jivesoftware/smackx/packet/MUCInitialPresence;->setHistory(Lorg/jivesoftware/smackx/packet/MUCInitialPresence$History;)V

    .line 476
    :cond_4
    invoke-virtual {v3, v4}, Lorg/jivesoftware/smack/packet/Presence;->addExtension(Lorg/jivesoftware/smack/packet/PacketExtension;)V

    .line 478
    iget-object v9, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->presenceInterceptors:Ljava/util/List;

    invoke-interface {v9}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_5

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/jivesoftware/smack/PacketInterceptor;

    .line 479
    .local v5, "packetInterceptor":Lorg/jivesoftware/smack/PacketInterceptor;
    invoke-interface {v5, v3}, Lorg/jivesoftware/smack/PacketInterceptor;->interceptPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    goto :goto_0

    .line 483
    .end local v5    # "packetInterceptor":Lorg/jivesoftware/smack/PacketInterceptor;
    :cond_5
    new-instance v8, Lorg/jivesoftware/smack/filter/AndFilter;

    const/4 v9, 0x2

    new-array v9, v9, [Lorg/jivesoftware/smack/filter/PacketFilter;

    const/4 v10, 0x0

    new-instance v11, Lorg/jivesoftware/smack/filter/FromMatchesFilter;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v13, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->room:Ljava/lang/String;

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string/jumbo v13, "/"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Lorg/jivesoftware/smack/filter/FromMatchesFilter;-><init>(Ljava/lang/String;)V

    aput-object v11, v9, v10

    const/4 v10, 0x1

    new-instance v11, Lorg/jivesoftware/smack/filter/PacketTypeFilter;

    const-class v12, Lorg/jivesoftware/smack/packet/Presence;

    invoke-direct {v11, v12}, Lorg/jivesoftware/smack/filter/PacketTypeFilter;-><init>(Ljava/lang/Class;)V

    aput-object v11, v9, v10

    invoke-direct {v8, v9}, Lorg/jivesoftware/smack/filter/AndFilter;-><init>([Lorg/jivesoftware/smack/filter/PacketFilter;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 487
    .local v8, "responseFilter":Lorg/jivesoftware/smack/filter/PacketFilter;
    const/4 v7, 0x0

    .line 490
    .local v7, "response":Lorg/jivesoftware/smack/PacketCollector;
    :try_start_2
    iget-object v9, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v9, v8}, Lorg/jivesoftware/smack/Connection;->createPacketCollector(Lorg/jivesoftware/smack/filter/PacketFilter;)Lorg/jivesoftware/smack/PacketCollector;

    move-result-object v7

    .line 492
    iget-object v9, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v9, v3}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 494
    move-wide/from16 v0, p4

    invoke-virtual {v7, v0, v1}, Lorg/jivesoftware/smack/PacketCollector;->nextResult(J)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v6

    check-cast v6, Lorg/jivesoftware/smack/packet/Presence;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 498
    .local v6, "presence":Lorg/jivesoftware/smack/packet/Presence;
    if-eqz v7, :cond_6

    .line 499
    :try_start_3
    invoke-virtual {v7}, Lorg/jivesoftware/smack/PacketCollector;->cancel()V

    .line 503
    :cond_6
    if-nez v6, :cond_8

    .line 504
    new-instance v9, Lorg/jivesoftware/smack/XMPPException;

    const-string/jumbo v10, "No response from server."

    invoke-direct {v9, v10}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 498
    .end local v6    # "presence":Lorg/jivesoftware/smack/packet/Presence;
    :catchall_1
    move-exception v9

    if-eqz v7, :cond_7

    .line 499
    invoke-virtual {v7}, Lorg/jivesoftware/smack/PacketCollector;->cancel()V

    :cond_7
    throw v9

    .line 506
    .restart local v6    # "presence":Lorg/jivesoftware/smack/packet/Presence;
    :cond_8
    invoke-virtual {v6}, Lorg/jivesoftware/smack/packet/Presence;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v9

    if-eqz v9, :cond_9

    .line 507
    new-instance v9, Lorg/jivesoftware/smack/XMPPException;

    invoke-virtual {v6}, Lorg/jivesoftware/smack/packet/Presence;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v10

    invoke-direct {v9, v10}, Lorg/jivesoftware/smack/XMPPException;-><init>(Lorg/jivesoftware/smack/packet/XMPPError;)V

    throw v9

    .line 509
    :cond_9
    iput-object p1, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->nickname:Ljava/lang/String;

    .line 510
    const/4 v9, 0x1

    iput-boolean v9, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->joined:Z

    .line 511
    invoke-direct {p0}, Lorg/jivesoftware/smackx/muc/MultiUserChat;->userHasJoined()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 512
    monitor-exit p0

    return-void
.end method

.method public kickParticipant(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "nickname"    # Ljava/lang/String;
    .param p2, "reason"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 1079
    const-string/jumbo v0, "none"

    invoke-direct {p0, p1, v0, p2}, Lorg/jivesoftware/smackx/muc/MultiUserChat;->changeRole(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1080
    return-void
.end method

.method public declared-synchronized leave()V
    .locals 5

    .prologue
    .line 529
    monitor-enter p0

    :try_start_0
    iget-boolean v3, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->joined:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v3, :cond_0

    .line 546
    :goto_0
    monitor-exit p0

    return-void

    .line 534
    :cond_0
    :try_start_1
    new-instance v1, Lorg/jivesoftware/smack/packet/Presence;

    sget-object v3, Lorg/jivesoftware/smack/packet/Presence$Type;->unavailable:Lorg/jivesoftware/smack/packet/Presence$Type;

    invoke-direct {v1, v3}, Lorg/jivesoftware/smack/packet/Presence;-><init>(Lorg/jivesoftware/smack/packet/Presence$Type;)V

    .line 535
    .local v1, "leavePresence":Lorg/jivesoftware/smack/packet/Presence;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->room:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->nickname:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Lorg/jivesoftware/smack/packet/Presence;->setTo(Ljava/lang/String;)V

    .line 537
    iget-object v3, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->presenceInterceptors:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/jivesoftware/smack/PacketInterceptor;

    .line 538
    .local v2, "packetInterceptor":Lorg/jivesoftware/smack/PacketInterceptor;
    invoke-interface {v2, v1}, Lorg/jivesoftware/smack/PacketInterceptor;->interceptPacket(Lorg/jivesoftware/smack/packet/Packet;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    .line 529
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v1    # "leavePresence":Lorg/jivesoftware/smack/packet/Presence;
    .end local v2    # "packetInterceptor":Lorg/jivesoftware/smack/PacketInterceptor;
    :catchall_0
    move-exception v3

    monitor-exit p0

    throw v3

    .line 540
    .restart local v0    # "i$":Ljava/util/Iterator;
    .restart local v1    # "leavePresence":Lorg/jivesoftware/smack/packet/Presence;
    :cond_1
    :try_start_2
    iget-object v3, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v3, v1}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 542
    iget-object v3, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->occupantsMap:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->clear()V

    .line 543
    const/4 v3, 0x0

    iput-object v3, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->nickname:Ljava/lang/String;

    .line 544
    const/4 v3, 0x0

    iput-boolean v3, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->joined:Z

    .line 545
    invoke-direct {p0}, Lorg/jivesoftware/smackx/muc/MultiUserChat;->userHasLeft()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0
.end method

.method public nextMessage()Lorg/jivesoftware/smack/packet/Message;
    .locals 1

    .prologue
    .line 1897
    iget-object v0, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->messageCollector:Lorg/jivesoftware/smackx/muc/ConnectionDetachedPacketCollector;

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/muc/ConnectionDetachedPacketCollector;->nextResult()Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smack/packet/Message;

    return-object v0
.end method

.method public nextMessage(J)Lorg/jivesoftware/smack/packet/Message;
    .locals 1
    .param p1, "timeout"    # J

    .prologue
    .line 1910
    iget-object v0, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->messageCollector:Lorg/jivesoftware/smackx/muc/ConnectionDetachedPacketCollector;

    invoke-virtual {v0, p1, p2}, Lorg/jivesoftware/smackx/muc/ConnectionDetachedPacketCollector;->nextResult(J)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smack/packet/Message;

    return-object v0
.end method

.method public pollMessage()Lorg/jivesoftware/smack/packet/Message;
    .locals 1

    .prologue
    .line 1887
    iget-object v0, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->messageCollector:Lorg/jivesoftware/smackx/muc/ConnectionDetachedPacketCollector;

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/muc/ConnectionDetachedPacketCollector;->pollResult()Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smack/packet/Message;

    return-object v0
.end method

.method public removeInvitationRejectionListener(Lorg/jivesoftware/smackx/muc/InvitationRejectionListener;)V
    .locals 2
    .param p1, "listener"    # Lorg/jivesoftware/smackx/muc/InvitationRejectionListener;

    .prologue
    .line 835
    iget-object v1, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->invitationRejectionListeners:Ljava/util/List;

    monitor-enter v1

    .line 836
    :try_start_0
    iget-object v0, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->invitationRejectionListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 837
    monitor-exit v1

    .line 838
    return-void

    .line 837
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public removeMessageListener(Lorg/jivesoftware/smack/PacketListener;)V
    .locals 1
    .param p1, "listener"    # Lorg/jivesoftware/smack/PacketListener;

    .prologue
    .line 1936
    iget-object v0, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v0, p1}, Lorg/jivesoftware/smack/Connection;->removePacketListener(Lorg/jivesoftware/smack/PacketListener;)V

    .line 1937
    iget-object v0, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->connectionListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 1938
    return-void
.end method

.method public removeParticipantListener(Lorg/jivesoftware/smack/PacketListener;)V
    .locals 1
    .param p1, "listener"    # Lorg/jivesoftware/smack/PacketListener;

    .prologue
    .line 1637
    iget-object v0, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v0, p1}, Lorg/jivesoftware/smack/Connection;->removePacketListener(Lorg/jivesoftware/smack/PacketListener;)V

    .line 1638
    iget-object v0, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->connectionListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 1639
    return-void
.end method

.method public removeParticipantStatusListener(Lorg/jivesoftware/smackx/muc/ParticipantStatusListener;)V
    .locals 2
    .param p1, "listener"    # Lorg/jivesoftware/smackx/muc/ParticipantStatusListener;

    .prologue
    .line 2093
    iget-object v1, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->participantStatusListeners:Ljava/util/List;

    monitor-enter v1

    .line 2094
    :try_start_0
    iget-object v0, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->participantStatusListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 2095
    monitor-exit v1

    .line 2096
    return-void

    .line 2095
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public removePresenceInterceptor(Lorg/jivesoftware/smack/PacketInterceptor;)V
    .locals 1
    .param p1, "presenceInterceptor"    # Lorg/jivesoftware/smack/PacketInterceptor;

    .prologue
    .line 916
    iget-object v0, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->presenceInterceptors:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 917
    return-void
.end method

.method public removeSubjectUpdatedListener(Lorg/jivesoftware/smackx/muc/SubjectUpdatedListener;)V
    .locals 2
    .param p1, "listener"    # Lorg/jivesoftware/smackx/muc/SubjectUpdatedListener;

    .prologue
    .line 878
    iget-object v1, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->subjectUpdatedListeners:Ljava/util/List;

    monitor-enter v1

    .line 879
    :try_start_0
    iget-object v0, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->subjectUpdatedListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 880
    monitor-exit v1

    .line 881
    return-void

    .line 880
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public removeUserStatusListener(Lorg/jivesoftware/smackx/muc/UserStatusListener;)V
    .locals 2
    .param p1, "listener"    # Lorg/jivesoftware/smackx/muc/UserStatusListener;

    .prologue
    .line 2041
    iget-object v1, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->userStatusListeners:Ljava/util/List;

    monitor-enter v1

    .line 2042
    :try_start_0
    iget-object v0, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->userStatusListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 2043
    monitor-exit v1

    .line 2044
    return-void

    .line 2043
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public revokeAdmin(Ljava/lang/String;)V
    .locals 1
    .param p1, "jid"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 1372
    const-string/jumbo v0, "member"

    invoke-direct {p0, p1, v0}, Lorg/jivesoftware/smackx/muc/MultiUserChat;->changeAffiliationByOwner(Ljava/lang/String;Ljava/lang/String;)V

    .line 1373
    return-void
.end method

.method public revokeAdmin(Ljava/util/Collection;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 1359
    .local p1, "jids":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    const-string/jumbo v0, "member"

    invoke-direct {p0, p1, v0}, Lorg/jivesoftware/smackx/muc/MultiUserChat;->changeAffiliationByOwner(Ljava/util/Collection;Ljava/lang/String;)V

    .line 1360
    return-void
.end method

.method public revokeMembership(Ljava/lang/String;)V
    .locals 2
    .param p1, "jid"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 1222
    const-string/jumbo v0, "none"

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Lorg/jivesoftware/smackx/muc/MultiUserChat;->changeAffiliationByAdmin(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1223
    return-void
.end method

.method public revokeMembership(Ljava/util/Collection;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 1209
    .local p1, "jids":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    const-string/jumbo v0, "none"

    invoke-direct {p0, p1, v0}, Lorg/jivesoftware/smackx/muc/MultiUserChat;->changeAffiliationByAdmin(Ljava/util/Collection;Ljava/lang/String;)V

    .line 1210
    return-void
.end method

.method public revokeModerator(Ljava/lang/String;)V
    .locals 2
    .param p1, "nickname"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 1272
    const-string/jumbo v0, "participant"

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Lorg/jivesoftware/smackx/muc/MultiUserChat;->changeRole(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1273
    return-void
.end method

.method public revokeModerator(Ljava/util/Collection;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 1259
    .local p1, "nicknames":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    const-string/jumbo v0, "participant"

    invoke-direct {p0, p1, v0}, Lorg/jivesoftware/smackx/muc/MultiUserChat;->changeRole(Ljava/util/Collection;Ljava/lang/String;)V

    .line 1260
    return-void
.end method

.method public revokeOwnership(Ljava/lang/String;)V
    .locals 2
    .param p1, "jid"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 1322
    const-string/jumbo v0, "admin"

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Lorg/jivesoftware/smackx/muc/MultiUserChat;->changeAffiliationByAdmin(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1323
    return-void
.end method

.method public revokeOwnership(Ljava/util/Collection;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 1310
    .local p1, "jids":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    const-string/jumbo v0, "admin"

    invoke-direct {p0, p1, v0}, Lorg/jivesoftware/smackx/muc/MultiUserChat;->changeAffiliationByAdmin(Ljava/util/Collection;Ljava/lang/String;)V

    .line 1311
    return-void
.end method

.method public revokeVoice(Ljava/lang/String;)V
    .locals 2
    .param p1, "nickname"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 1139
    const-string/jumbo v0, "visitor"

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Lorg/jivesoftware/smackx/muc/MultiUserChat;->changeRole(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1140
    return-void
.end method

.method public revokeVoice(Ljava/util/Collection;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 1124
    .local p1, "nicknames":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    const-string/jumbo v0, "visitor"

    invoke-direct {p0, p1, v0}, Lorg/jivesoftware/smackx/muc/MultiUserChat;->changeRole(Ljava/util/Collection;Ljava/lang/String;)V

    .line 1125
    return-void
.end method

.method public sendConfigurationForm(Lorg/jivesoftware/smackx/Form;)V
    .locals 6
    .param p1, "form"    # Lorg/jivesoftware/smackx/Form;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 590
    new-instance v1, Lorg/jivesoftware/smackx/packet/MUCOwner;

    invoke-direct {v1}, Lorg/jivesoftware/smackx/packet/MUCOwner;-><init>()V

    .line 591
    .local v1, "iq":Lorg/jivesoftware/smackx/packet/MUCOwner;
    iget-object v4, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->room:Ljava/lang/String;

    invoke-virtual {v1, v4}, Lorg/jivesoftware/smackx/packet/MUCOwner;->setTo(Ljava/lang/String;)V

    .line 592
    sget-object v4, Lorg/jivesoftware/smack/packet/IQ$Type;->SET:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {v1, v4}, Lorg/jivesoftware/smackx/packet/MUCOwner;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 593
    invoke-virtual {p1}, Lorg/jivesoftware/smackx/Form;->getDataFormToSend()Lorg/jivesoftware/smackx/packet/DataForm;

    move-result-object v4

    invoke-virtual {v1, v4}, Lorg/jivesoftware/smackx/packet/MUCOwner;->addExtension(Lorg/jivesoftware/smack/packet/PacketExtension;)V

    .line 596
    new-instance v3, Lorg/jivesoftware/smack/filter/PacketIDFilter;

    invoke-virtual {v1}, Lorg/jivesoftware/smackx/packet/MUCOwner;->getPacketID()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/jivesoftware/smack/filter/PacketIDFilter;-><init>(Ljava/lang/String;)V

    .line 597
    .local v3, "responseFilter":Lorg/jivesoftware/smack/filter/PacketFilter;
    iget-object v4, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v4, v3}, Lorg/jivesoftware/smack/Connection;->createPacketCollector(Lorg/jivesoftware/smack/filter/PacketFilter;)Lorg/jivesoftware/smack/PacketCollector;

    move-result-object v2

    .line 599
    .local v2, "response":Lorg/jivesoftware/smack/PacketCollector;
    iget-object v4, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v4, v1}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 601
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getPacketReplyTimeout()I

    move-result v4

    int-to-long v4, v4

    invoke-virtual {v2, v4, v5}, Lorg/jivesoftware/smack/PacketCollector;->nextResult(J)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smack/packet/IQ;

    .line 603
    .local v0, "answer":Lorg/jivesoftware/smack/packet/IQ;
    invoke-virtual {v2}, Lorg/jivesoftware/smack/PacketCollector;->cancel()V

    .line 605
    if-nez v0, :cond_0

    .line 606
    new-instance v4, Lorg/jivesoftware/smack/XMPPException;

    const-string/jumbo v5, "No response from server."

    invoke-direct {v4, v5}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 608
    :cond_0
    invoke-virtual {v0}, Lorg/jivesoftware/smack/packet/IQ;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v4

    if-eqz v4, :cond_1

    .line 609
    new-instance v4, Lorg/jivesoftware/smack/XMPPException;

    invoke-virtual {v0}, Lorg/jivesoftware/smack/packet/IQ;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/jivesoftware/smack/XMPPException;-><init>(Lorg/jivesoftware/smack/packet/XMPPError;)V

    throw v4

    .line 611
    :cond_1
    return-void
.end method

.method public sendMessage(Ljava/lang/String;)V
    .locals 3
    .param p1, "text"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 1836
    new-instance v0, Lorg/jivesoftware/smack/packet/Message;

    iget-object v1, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->room:Ljava/lang/String;

    sget-object v2, Lorg/jivesoftware/smack/packet/Message$Type;->groupchat:Lorg/jivesoftware/smack/packet/Message$Type;

    invoke-direct {v0, v1, v2}, Lorg/jivesoftware/smack/packet/Message;-><init>(Ljava/lang/String;Lorg/jivesoftware/smack/packet/Message$Type;)V

    .line 1837
    .local v0, "message":Lorg/jivesoftware/smack/packet/Message;
    invoke-virtual {v0, p1}, Lorg/jivesoftware/smack/packet/Message;->setBody(Ljava/lang/String;)V

    .line 1838
    iget-object v1, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v1, v0}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 1839
    return-void
.end method

.method public sendMessage(Lorg/jivesoftware/smack/packet/Message;)V
    .locals 1
    .param p1, "message"    # Lorg/jivesoftware/smack/packet/Message;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 1872
    iget-object v0, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v0, p1}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 1873
    return-void
.end method

.method public sendRegistrationForm(Lorg/jivesoftware/smackx/Form;)V
    .locals 8
    .param p1, "form"    # Lorg/jivesoftware/smackx/Form;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 662
    new-instance v2, Lorg/jivesoftware/smack/packet/Registration;

    invoke-direct {v2}, Lorg/jivesoftware/smack/packet/Registration;-><init>()V

    .line 663
    .local v2, "reg":Lorg/jivesoftware/smack/packet/Registration;
    sget-object v4, Lorg/jivesoftware/smack/packet/IQ$Type;->SET:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {v2, v4}, Lorg/jivesoftware/smack/packet/Registration;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 664
    iget-object v4, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->room:Ljava/lang/String;

    invoke-virtual {v2, v4}, Lorg/jivesoftware/smack/packet/Registration;->setTo(Ljava/lang/String;)V

    .line 665
    invoke-virtual {p1}, Lorg/jivesoftware/smackx/Form;->getDataFormToSend()Lorg/jivesoftware/smackx/packet/DataForm;

    move-result-object v4

    invoke-virtual {v2, v4}, Lorg/jivesoftware/smack/packet/Registration;->addExtension(Lorg/jivesoftware/smack/packet/PacketExtension;)V

    .line 667
    new-instance v1, Lorg/jivesoftware/smack/filter/AndFilter;

    const/4 v4, 0x2

    new-array v4, v4, [Lorg/jivesoftware/smack/filter/PacketFilter;

    const/4 v5, 0x0

    new-instance v6, Lorg/jivesoftware/smack/filter/PacketIDFilter;

    invoke-virtual {v2}, Lorg/jivesoftware/smack/packet/Registration;->getPacketID()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lorg/jivesoftware/smack/filter/PacketIDFilter;-><init>(Ljava/lang/String;)V

    aput-object v6, v4, v5

    const/4 v5, 0x1

    new-instance v6, Lorg/jivesoftware/smack/filter/PacketTypeFilter;

    const-class v7, Lorg/jivesoftware/smack/packet/IQ;

    invoke-direct {v6, v7}, Lorg/jivesoftware/smack/filter/PacketTypeFilter;-><init>(Ljava/lang/Class;)V

    aput-object v6, v4, v5

    invoke-direct {v1, v4}, Lorg/jivesoftware/smack/filter/AndFilter;-><init>([Lorg/jivesoftware/smack/filter/PacketFilter;)V

    .line 669
    .local v1, "filter":Lorg/jivesoftware/smack/filter/PacketFilter;
    iget-object v4, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v4, v1}, Lorg/jivesoftware/smack/Connection;->createPacketCollector(Lorg/jivesoftware/smack/filter/PacketFilter;)Lorg/jivesoftware/smack/PacketCollector;

    move-result-object v0

    .line 670
    .local v0, "collector":Lorg/jivesoftware/smack/PacketCollector;
    iget-object v4, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v4, v2}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 671
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getPacketReplyTimeout()I

    move-result v4

    int-to-long v4, v4

    invoke-virtual {v0, v4, v5}, Lorg/jivesoftware/smack/PacketCollector;->nextResult(J)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v3

    check-cast v3, Lorg/jivesoftware/smack/packet/IQ;

    .line 672
    .local v3, "result":Lorg/jivesoftware/smack/packet/IQ;
    invoke-virtual {v0}, Lorg/jivesoftware/smack/PacketCollector;->cancel()V

    .line 673
    if-nez v3, :cond_0

    .line 674
    new-instance v4, Lorg/jivesoftware/smack/XMPPException;

    const-string/jumbo v5, "No response from server."

    invoke-direct {v4, v5}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 676
    :cond_0
    invoke-virtual {v3}, Lorg/jivesoftware/smack/packet/IQ;->getType()Lorg/jivesoftware/smack/packet/IQ$Type;

    move-result-object v4

    sget-object v5, Lorg/jivesoftware/smack/packet/IQ$Type;->ERROR:Lorg/jivesoftware/smack/packet/IQ$Type;

    if-ne v4, v5, :cond_1

    .line 677
    new-instance v4, Lorg/jivesoftware/smack/XMPPException;

    invoke-virtual {v3}, Lorg/jivesoftware/smack/packet/IQ;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/jivesoftware/smack/XMPPException;-><init>(Lorg/jivesoftware/smack/packet/XMPPError;)V

    throw v4

    .line 679
    :cond_1
    return-void
.end method
