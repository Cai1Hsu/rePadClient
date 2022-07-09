.class public Lorg/jivesoftware/smackx/workgroup/agent/TranscriptManager;
.super Ljava/lang/Object;
.source "TranscriptManager.java"


# instance fields
.field private connection:Lorg/jivesoftware/smack/Connection;


# direct methods
.method public constructor <init>(Lorg/jivesoftware/smack/Connection;)V
    .locals 0
    .param p1, "connection"    # Lorg/jivesoftware/smack/Connection;

    .prologue
    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    iput-object p1, p0, Lorg/jivesoftware/smackx/workgroup/agent/TranscriptManager;->connection:Lorg/jivesoftware/smack/Connection;

    .line 42
    return-void
.end method


# virtual methods
.method public getTranscript(Ljava/lang/String;Ljava/lang/String;)Lorg/jivesoftware/smackx/workgroup/packet/Transcript;
    .locals 6
    .param p1, "workgroupJID"    # Ljava/lang/String;
    .param p2, "sessionID"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 53
    new-instance v1, Lorg/jivesoftware/smackx/workgroup/packet/Transcript;

    invoke-direct {v1, p2}, Lorg/jivesoftware/smackx/workgroup/packet/Transcript;-><init>(Ljava/lang/String;)V

    .line 54
    .local v1, "request":Lorg/jivesoftware/smackx/workgroup/packet/Transcript;
    invoke-virtual {v1, p1}, Lorg/jivesoftware/smackx/workgroup/packet/Transcript;->setTo(Ljava/lang/String;)V

    .line 55
    iget-object v3, p0, Lorg/jivesoftware/smackx/workgroup/agent/TranscriptManager;->connection:Lorg/jivesoftware/smack/Connection;

    new-instance v4, Lorg/jivesoftware/smack/filter/PacketIDFilter;

    invoke-virtual {v1}, Lorg/jivesoftware/smackx/workgroup/packet/Transcript;->getPacketID()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/jivesoftware/smack/filter/PacketIDFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v4}, Lorg/jivesoftware/smack/Connection;->createPacketCollector(Lorg/jivesoftware/smack/filter/PacketFilter;)Lorg/jivesoftware/smack/PacketCollector;

    move-result-object v0

    .line 57
    .local v0, "collector":Lorg/jivesoftware/smack/PacketCollector;
    iget-object v3, p0, Lorg/jivesoftware/smackx/workgroup/agent/TranscriptManager;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v3, v1}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 59
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getPacketReplyTimeout()I

    move-result v3

    int-to-long v4, v3

    invoke-virtual {v0, v4, v5}, Lorg/jivesoftware/smack/PacketCollector;->nextResult(J)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v2

    check-cast v2, Lorg/jivesoftware/smackx/workgroup/packet/Transcript;

    .line 62
    .local v2, "response":Lorg/jivesoftware/smackx/workgroup/packet/Transcript;
    invoke-virtual {v0}, Lorg/jivesoftware/smack/PacketCollector;->cancel()V

    .line 63
    if-nez v2, :cond_0

    .line 64
    new-instance v3, Lorg/jivesoftware/smack/XMPPException;

    const-string/jumbo v4, "No response from server on status set."

    invoke-direct {v3, v4}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 66
    :cond_0
    invoke-virtual {v2}, Lorg/jivesoftware/smackx/workgroup/packet/Transcript;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 67
    new-instance v3, Lorg/jivesoftware/smack/XMPPException;

    invoke-virtual {v2}, Lorg/jivesoftware/smackx/workgroup/packet/Transcript;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/jivesoftware/smack/XMPPException;-><init>(Lorg/jivesoftware/smack/packet/XMPPError;)V

    throw v3

    .line 69
    :cond_1
    return-object v2
.end method

.method public getTranscripts(Ljava/lang/String;Ljava/lang/String;)Lorg/jivesoftware/smackx/workgroup/packet/Transcripts;
    .locals 6
    .param p1, "workgroupJID"    # Ljava/lang/String;
    .param p2, "userID"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 82
    new-instance v1, Lorg/jivesoftware/smackx/workgroup/packet/Transcripts;

    invoke-direct {v1, p2}, Lorg/jivesoftware/smackx/workgroup/packet/Transcripts;-><init>(Ljava/lang/String;)V

    .line 83
    .local v1, "request":Lorg/jivesoftware/smackx/workgroup/packet/Transcripts;
    invoke-virtual {v1, p1}, Lorg/jivesoftware/smackx/workgroup/packet/Transcripts;->setTo(Ljava/lang/String;)V

    .line 84
    iget-object v3, p0, Lorg/jivesoftware/smackx/workgroup/agent/TranscriptManager;->connection:Lorg/jivesoftware/smack/Connection;

    new-instance v4, Lorg/jivesoftware/smack/filter/PacketIDFilter;

    invoke-virtual {v1}, Lorg/jivesoftware/smackx/workgroup/packet/Transcripts;->getPacketID()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/jivesoftware/smack/filter/PacketIDFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v4}, Lorg/jivesoftware/smack/Connection;->createPacketCollector(Lorg/jivesoftware/smack/filter/PacketFilter;)Lorg/jivesoftware/smack/PacketCollector;

    move-result-object v0

    .line 86
    .local v0, "collector":Lorg/jivesoftware/smack/PacketCollector;
    iget-object v3, p0, Lorg/jivesoftware/smackx/workgroup/agent/TranscriptManager;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v3, v1}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 88
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getPacketReplyTimeout()I

    move-result v3

    int-to-long v4, v3

    invoke-virtual {v0, v4, v5}, Lorg/jivesoftware/smack/PacketCollector;->nextResult(J)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v2

    check-cast v2, Lorg/jivesoftware/smackx/workgroup/packet/Transcripts;

    .line 91
    .local v2, "response":Lorg/jivesoftware/smackx/workgroup/packet/Transcripts;
    invoke-virtual {v0}, Lorg/jivesoftware/smack/PacketCollector;->cancel()V

    .line 92
    if-nez v2, :cond_0

    .line 93
    new-instance v3, Lorg/jivesoftware/smack/XMPPException;

    const-string/jumbo v4, "No response from server on status set."

    invoke-direct {v3, v4}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 95
    :cond_0
    invoke-virtual {v2}, Lorg/jivesoftware/smackx/workgroup/packet/Transcripts;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 96
    new-instance v3, Lorg/jivesoftware/smack/XMPPException;

    invoke-virtual {v2}, Lorg/jivesoftware/smackx/workgroup/packet/Transcripts;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/jivesoftware/smack/XMPPException;-><init>(Lorg/jivesoftware/smack/packet/XMPPError;)V

    throw v3

    .line 98
    :cond_1
    return-object v2
.end method
