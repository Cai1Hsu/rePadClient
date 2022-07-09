.class public Lorg/jivesoftware/smackx/LastActivityManager;
.super Ljava/lang/Object;
.source "LastActivityManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jivesoftware/smackx/LastActivityManager$5;
    }
.end annotation


# instance fields
.field private connection:Lorg/jivesoftware/smack/Connection;

.field private lastMessageSent:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 90
    new-instance v0, Lorg/jivesoftware/smackx/LastActivityManager$1;

    invoke-direct {v0}, Lorg/jivesoftware/smackx/LastActivityManager$1;-><init>()V

    invoke-static {v0}, Lorg/jivesoftware/smack/Connection;->addConnectionCreationListener(Lorg/jivesoftware/smack/ConnectionCreationListener;)V

    .line 95
    return-void
.end method

.method private constructor <init>(Lorg/jivesoftware/smack/Connection;)V
    .locals 6
    .param p1, "connection"    # Lorg/jivesoftware/smack/Connection;

    .prologue
    .line 103
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 104
    iput-object p1, p0, Lorg/jivesoftware/smackx/LastActivityManager;->connection:Lorg/jivesoftware/smack/Connection;

    .line 107
    new-instance v0, Lorg/jivesoftware/smackx/LastActivityManager$2;

    invoke-direct {v0, p0}, Lorg/jivesoftware/smackx/LastActivityManager$2;-><init>(Lorg/jivesoftware/smackx/LastActivityManager;)V

    new-instance v1, Lorg/jivesoftware/smack/filter/PacketTypeFilter;

    const-class v2, Lorg/jivesoftware/smack/packet/Presence;

    invoke-direct {v1, v2}, Lorg/jivesoftware/smack/filter/PacketTypeFilter;-><init>(Ljava/lang/Class;)V

    invoke-virtual {p1, v0, v1}, Lorg/jivesoftware/smack/Connection;->addPacketSendingListener(Lorg/jivesoftware/smack/PacketListener;Lorg/jivesoftware/smack/filter/PacketFilter;)V

    .line 122
    new-instance v0, Lorg/jivesoftware/smackx/LastActivityManager$3;

    invoke-direct {v0, p0}, Lorg/jivesoftware/smackx/LastActivityManager$3;-><init>(Lorg/jivesoftware/smackx/LastActivityManager;)V

    new-instance v1, Lorg/jivesoftware/smack/filter/PacketTypeFilter;

    const-class v2, Lorg/jivesoftware/smack/packet/Message;

    invoke-direct {v1, v2}, Lorg/jivesoftware/smack/filter/PacketTypeFilter;-><init>(Ljava/lang/Class;)V

    invoke-virtual {p1, v0, v1}, Lorg/jivesoftware/smack/Connection;->addPacketListener(Lorg/jivesoftware/smack/PacketListener;Lorg/jivesoftware/smack/filter/PacketFilter;)V

    .line 133
    new-instance v0, Lorg/jivesoftware/smackx/LastActivityManager$4;

    invoke-direct {v0, p0}, Lorg/jivesoftware/smackx/LastActivityManager$4;-><init>(Lorg/jivesoftware/smackx/LastActivityManager;)V

    new-instance v1, Lorg/jivesoftware/smack/filter/AndFilter;

    const/4 v2, 0x2

    new-array v2, v2, [Lorg/jivesoftware/smack/filter/PacketFilter;

    const/4 v3, 0x0

    new-instance v4, Lorg/jivesoftware/smack/filter/IQTypeFilter;

    sget-object v5, Lorg/jivesoftware/smack/packet/IQ$Type;->GET:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-direct {v4, v5}, Lorg/jivesoftware/smack/filter/IQTypeFilter;-><init>(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    aput-object v4, v2, v3

    const/4 v3, 0x1

    new-instance v4, Lorg/jivesoftware/smack/filter/PacketTypeFilter;

    const-class v5, Lorg/jivesoftware/smackx/packet/LastActivity;

    invoke-direct {v4, v5}, Lorg/jivesoftware/smack/filter/PacketTypeFilter;-><init>(Ljava/lang/Class;)V

    aput-object v4, v2, v3

    invoke-direct {v1, v2}, Lorg/jivesoftware/smack/filter/AndFilter;-><init>([Lorg/jivesoftware/smack/filter/PacketFilter;)V

    invoke-virtual {p1, v0, v1}, Lorg/jivesoftware/smack/Connection;->addPacketListener(Lorg/jivesoftware/smack/PacketListener;Lorg/jivesoftware/smack/filter/PacketFilter;)V

    .line 147
    invoke-static {p1}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->getInstanceFor(Lorg/jivesoftware/smack/Connection;)Lorg/jivesoftware/smackx/ServiceDiscoveryManager;

    move-result-object v0

    const-string/jumbo v1, "jabber:iq:last"

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->addFeature(Ljava/lang/String;)V

    .line 148
    invoke-direct {p0}, Lorg/jivesoftware/smackx/LastActivityManager;->resetIdleTime()V

    .line 149
    return-void
.end method

.method synthetic constructor <init>(Lorg/jivesoftware/smack/Connection;Lorg/jivesoftware/smackx/LastActivityManager$1;)V
    .locals 0
    .param p1, "x0"    # Lorg/jivesoftware/smack/Connection;
    .param p2, "x1"    # Lorg/jivesoftware/smackx/LastActivityManager$1;

    .prologue
    .line 82
    invoke-direct {p0, p1}, Lorg/jivesoftware/smackx/LastActivityManager;-><init>(Lorg/jivesoftware/smack/Connection;)V

    return-void
.end method

.method static synthetic access$100(Lorg/jivesoftware/smackx/LastActivityManager;)V
    .locals 0
    .param p0, "x0"    # Lorg/jivesoftware/smackx/LastActivityManager;

    .prologue
    .line 82
    invoke-direct {p0}, Lorg/jivesoftware/smackx/LastActivityManager;->resetIdleTime()V

    return-void
.end method

.method static synthetic access$200(Lorg/jivesoftware/smackx/LastActivityManager;)J
    .locals 2
    .param p0, "x0"    # Lorg/jivesoftware/smackx/LastActivityManager;

    .prologue
    .line 82
    invoke-direct {p0}, Lorg/jivesoftware/smackx/LastActivityManager;->getIdleTime()J

    move-result-wide v0

    return-wide v0
.end method

.method static synthetic access$300(Lorg/jivesoftware/smackx/LastActivityManager;)Lorg/jivesoftware/smack/Connection;
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smackx/LastActivityManager;

    .prologue
    .line 82
    iget-object v0, p0, Lorg/jivesoftware/smackx/LastActivityManager;->connection:Lorg/jivesoftware/smack/Connection;

    return-object v0
.end method

.method private getIdleTime()J
    .locals 8

    .prologue
    .line 169
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    .line 170
    .local v2, "now":J
    monitor-enter p0

    .line 171
    :try_start_0
    iget-wide v0, p0, Lorg/jivesoftware/smackx/LastActivityManager;->lastMessageSent:J

    .line 172
    .local v0, "lms":J
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 173
    sub-long v4, v2, v0

    const-wide/16 v6, 0x3e8

    div-long/2addr v4, v6

    return-wide v4

    .line 172
    .end local v0    # "lms":J
    :catchall_0
    move-exception v4

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v4
.end method

.method public static getLastActivity(Lorg/jivesoftware/smack/Connection;Ljava/lang/String;)Lorg/jivesoftware/smackx/packet/LastActivity;
    .locals 6
    .param p0, "con"    # Lorg/jivesoftware/smack/Connection;
    .param p1, "jid"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 194
    new-instance v0, Lorg/jivesoftware/smackx/packet/LastActivity;

    invoke-direct {v0}, Lorg/jivesoftware/smackx/packet/LastActivity;-><init>()V

    .line 195
    .local v0, "activity":Lorg/jivesoftware/smackx/packet/LastActivity;
    invoke-virtual {v0, p1}, Lorg/jivesoftware/smackx/packet/LastActivity;->setTo(Ljava/lang/String;)V

    .line 197
    new-instance v3, Lorg/jivesoftware/smack/filter/PacketIDFilter;

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/packet/LastActivity;->getPacketID()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/jivesoftware/smack/filter/PacketIDFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v3}, Lorg/jivesoftware/smack/Connection;->createPacketCollector(Lorg/jivesoftware/smack/filter/PacketFilter;)Lorg/jivesoftware/smack/PacketCollector;

    move-result-object v1

    .line 198
    .local v1, "collector":Lorg/jivesoftware/smack/PacketCollector;
    invoke-virtual {p0, v0}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 200
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getPacketReplyTimeout()I

    move-result v3

    int-to-long v4, v3

    invoke-virtual {v1, v4, v5}, Lorg/jivesoftware/smack/PacketCollector;->nextResult(J)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v2

    check-cast v2, Lorg/jivesoftware/smackx/packet/LastActivity;

    .line 203
    .local v2, "response":Lorg/jivesoftware/smackx/packet/LastActivity;
    invoke-virtual {v1}, Lorg/jivesoftware/smack/PacketCollector;->cancel()V

    .line 204
    if-nez v2, :cond_0

    .line 205
    new-instance v3, Lorg/jivesoftware/smack/XMPPException;

    const-string/jumbo v4, "No response from server on status set."

    invoke-direct {v3, v4}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 207
    :cond_0
    invoke-virtual {v2}, Lorg/jivesoftware/smackx/packet/LastActivity;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 208
    new-instance v3, Lorg/jivesoftware/smack/XMPPException;

    invoke-virtual {v2}, Lorg/jivesoftware/smackx/packet/LastActivity;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/jivesoftware/smack/XMPPException;-><init>(Lorg/jivesoftware/smack/packet/XMPPError;)V

    throw v3

    .line 210
    :cond_1
    return-object v2
.end method

.method public static isLastActivitySupported(Lorg/jivesoftware/smack/Connection;Ljava/lang/String;)Z
    .locals 3
    .param p0, "connection"    # Lorg/jivesoftware/smack/Connection;
    .param p1, "jid"    # Ljava/lang/String;

    .prologue
    .line 222
    :try_start_0
    invoke-static {p0}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->getInstanceFor(Lorg/jivesoftware/smack/Connection;)Lorg/jivesoftware/smackx/ServiceDiscoveryManager;

    move-result-object v2

    invoke-virtual {v2, p1}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->discoverInfo(Ljava/lang/String;)Lorg/jivesoftware/smackx/packet/DiscoverInfo;

    move-result-object v1

    .line 224
    .local v1, "result":Lorg/jivesoftware/smackx/packet/DiscoverInfo;
    const-string/jumbo v2, "jabber:iq:last"

    invoke-virtual {v1, v2}, Lorg/jivesoftware/smackx/packet/DiscoverInfo;->containsFeature(Ljava/lang/String;)Z
    :try_end_0
    .catch Lorg/jivesoftware/smack/XMPPException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    .line 227
    .end local v1    # "result":Lorg/jivesoftware/smackx/packet/DiscoverInfo;
    :goto_0
    return v2

    .line 226
    :catch_0
    move-exception v0

    .line 227
    .local v0, "e":Lorg/jivesoftware/smack/XMPPException;
    const/4 v2, 0x0

    goto :goto_0
.end method

.method private resetIdleTime()V
    .locals 3

    .prologue
    .line 156
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 157
    .local v0, "now":J
    monitor-enter p0

    .line 158
    :try_start_0
    iput-wide v0, p0, Lorg/jivesoftware/smackx/LastActivityManager;->lastMessageSent:J

    .line 159
    monitor-exit p0

    .line 160
    return-void

    .line 159
    :catchall_0
    move-exception v2

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2
.end method
