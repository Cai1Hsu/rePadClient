.class public final Lorg/jivesoftware/smack/util/SyncPacketSend;
.super Ljava/lang/Object;
.source "SyncPacketSend.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getReply(Lorg/jivesoftware/smack/Connection;Lorg/jivesoftware/smack/packet/Packet;)Lorg/jivesoftware/smack/packet/Packet;
    .locals 2
    .param p0, "connection"    # Lorg/jivesoftware/smack/Connection;
    .param p1, "packet"    # Lorg/jivesoftware/smack/packet/Packet;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 62
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getPacketReplyTimeout()I

    move-result v0

    int-to-long v0, v0

    invoke-static {p0, p1, v0, v1}, Lorg/jivesoftware/smack/util/SyncPacketSend;->getReply(Lorg/jivesoftware/smack/Connection;Lorg/jivesoftware/smack/packet/Packet;J)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v0

    return-object v0
.end method

.method public static getReply(Lorg/jivesoftware/smack/Connection;Lorg/jivesoftware/smack/packet/Packet;J)Lorg/jivesoftware/smack/packet/Packet;
    .locals 6
    .param p0, "connection"    # Lorg/jivesoftware/smack/Connection;
    .param p1, "packet"    # Lorg/jivesoftware/smack/packet/Packet;
    .param p2, "timeout"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 39
    new-instance v1, Lorg/jivesoftware/smack/filter/PacketIDFilter;

    invoke-virtual {p1}, Lorg/jivesoftware/smack/packet/Packet;->getPacketID()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v3}, Lorg/jivesoftware/smack/filter/PacketIDFilter;-><init>(Ljava/lang/String;)V

    .line 40
    .local v1, "responseFilter":Lorg/jivesoftware/smack/filter/PacketFilter;
    invoke-virtual {p0, v1}, Lorg/jivesoftware/smack/Connection;->createPacketCollector(Lorg/jivesoftware/smack/filter/PacketFilter;)Lorg/jivesoftware/smack/PacketCollector;

    move-result-object v0

    .line 42
    .local v0, "response":Lorg/jivesoftware/smack/PacketCollector;
    invoke-virtual {p0, p1}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 45
    invoke-virtual {v0, p2, p3}, Lorg/jivesoftware/smack/PacketCollector;->nextResult(J)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v2

    .line 48
    .local v2, "result":Lorg/jivesoftware/smack/packet/Packet;
    invoke-virtual {v0}, Lorg/jivesoftware/smack/PacketCollector;->cancel()V

    .line 50
    if-nez v2, :cond_0

    .line 51
    new-instance v3, Lorg/jivesoftware/smack/XMPPException;

    sget-object v4, Lorg/jivesoftware/smack/SmackError;->NO_RESPONSE_FROM_SERVER:Lorg/jivesoftware/smack/SmackError;

    invoke-direct {v3, v4}, Lorg/jivesoftware/smack/XMPPException;-><init>(Lorg/jivesoftware/smack/SmackError;)V

    throw v3

    .line 53
    :cond_0
    invoke-virtual {v2}, Lorg/jivesoftware/smack/packet/Packet;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 54
    new-instance v3, Lorg/jivesoftware/smack/XMPPException;

    invoke-virtual {v2}, Lorg/jivesoftware/smack/packet/Packet;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/jivesoftware/smack/XMPPException;-><init>(Lorg/jivesoftware/smack/packet/XMPPError;)V

    throw v3

    .line 56
    :cond_1
    return-object v2
.end method
