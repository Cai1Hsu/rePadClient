.class public Lorg/jivesoftware/smackx/workgroup/agent/TranscriptSearchManager;
.super Ljava/lang/Object;
.source "TranscriptSearchManager.java"


# instance fields
.field private connection:Lorg/jivesoftware/smack/Connection;


# direct methods
.method public constructor <init>(Lorg/jivesoftware/smack/Connection;)V
    .locals 0
    .param p1, "connection"    # Lorg/jivesoftware/smack/Connection;

    .prologue
    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    iput-object p1, p0, Lorg/jivesoftware/smackx/workgroup/agent/TranscriptSearchManager;->connection:Lorg/jivesoftware/smack/Connection;

    .line 44
    return-void
.end method


# virtual methods
.method public getSearchForm(Ljava/lang/String;)Lorg/jivesoftware/smackx/Form;
    .locals 6
    .param p1, "serviceJID"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 56
    new-instance v2, Lorg/jivesoftware/smackx/workgroup/packet/TranscriptSearch;

    invoke-direct {v2}, Lorg/jivesoftware/smackx/workgroup/packet/TranscriptSearch;-><init>()V

    .line 57
    .local v2, "search":Lorg/jivesoftware/smackx/workgroup/packet/TranscriptSearch;
    sget-object v3, Lorg/jivesoftware/smack/packet/IQ$Type;->GET:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {v2, v3}, Lorg/jivesoftware/smackx/workgroup/packet/TranscriptSearch;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 58
    invoke-virtual {v2, p1}, Lorg/jivesoftware/smackx/workgroup/packet/TranscriptSearch;->setTo(Ljava/lang/String;)V

    .line 60
    iget-object v3, p0, Lorg/jivesoftware/smackx/workgroup/agent/TranscriptSearchManager;->connection:Lorg/jivesoftware/smack/Connection;

    new-instance v4, Lorg/jivesoftware/smack/filter/PacketIDFilter;

    invoke-virtual {v2}, Lorg/jivesoftware/smackx/workgroup/packet/TranscriptSearch;->getPacketID()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/jivesoftware/smack/filter/PacketIDFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v4}, Lorg/jivesoftware/smack/Connection;->createPacketCollector(Lorg/jivesoftware/smack/filter/PacketFilter;)Lorg/jivesoftware/smack/PacketCollector;

    move-result-object v0

    .line 62
    .local v0, "collector":Lorg/jivesoftware/smack/PacketCollector;
    iget-object v3, p0, Lorg/jivesoftware/smackx/workgroup/agent/TranscriptSearchManager;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v3, v2}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 64
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getPacketReplyTimeout()I

    move-result v3

    int-to-long v4, v3

    invoke-virtual {v0, v4, v5}, Lorg/jivesoftware/smack/PacketCollector;->nextResult(J)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v1

    check-cast v1, Lorg/jivesoftware/smackx/workgroup/packet/TranscriptSearch;

    .line 68
    .local v1, "response":Lorg/jivesoftware/smackx/workgroup/packet/TranscriptSearch;
    invoke-virtual {v0}, Lorg/jivesoftware/smack/PacketCollector;->cancel()V

    .line 69
    if-nez v1, :cond_0

    .line 70
    new-instance v3, Lorg/jivesoftware/smack/XMPPException;

    const-string/jumbo v4, "No response from server on status set."

    invoke-direct {v3, v4}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 72
    :cond_0
    invoke-virtual {v1}, Lorg/jivesoftware/smackx/workgroup/packet/TranscriptSearch;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 73
    new-instance v3, Lorg/jivesoftware/smack/XMPPException;

    invoke-virtual {v1}, Lorg/jivesoftware/smackx/workgroup/packet/TranscriptSearch;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/jivesoftware/smack/XMPPException;-><init>(Lorg/jivesoftware/smack/packet/XMPPError;)V

    throw v3

    .line 75
    :cond_1
    invoke-static {v1}, Lorg/jivesoftware/smackx/Form;->getFormFrom(Lorg/jivesoftware/smack/packet/Packet;)Lorg/jivesoftware/smackx/Form;

    move-result-object v3

    return-object v3
.end method

.method public submitSearch(Ljava/lang/String;Lorg/jivesoftware/smackx/Form;)Lorg/jivesoftware/smackx/ReportedData;
    .locals 6
    .param p1, "serviceJID"    # Ljava/lang/String;
    .param p2, "completedForm"    # Lorg/jivesoftware/smackx/Form;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 89
    new-instance v2, Lorg/jivesoftware/smackx/workgroup/packet/TranscriptSearch;

    invoke-direct {v2}, Lorg/jivesoftware/smackx/workgroup/packet/TranscriptSearch;-><init>()V

    .line 90
    .local v2, "search":Lorg/jivesoftware/smackx/workgroup/packet/TranscriptSearch;
    sget-object v3, Lorg/jivesoftware/smack/packet/IQ$Type;->GET:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {v2, v3}, Lorg/jivesoftware/smackx/workgroup/packet/TranscriptSearch;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 91
    invoke-virtual {v2, p1}, Lorg/jivesoftware/smackx/workgroup/packet/TranscriptSearch;->setTo(Ljava/lang/String;)V

    .line 92
    invoke-virtual {p2}, Lorg/jivesoftware/smackx/Form;->getDataFormToSend()Lorg/jivesoftware/smackx/packet/DataForm;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/jivesoftware/smackx/workgroup/packet/TranscriptSearch;->addExtension(Lorg/jivesoftware/smack/packet/PacketExtension;)V

    .line 94
    iget-object v3, p0, Lorg/jivesoftware/smackx/workgroup/agent/TranscriptSearchManager;->connection:Lorg/jivesoftware/smack/Connection;

    new-instance v4, Lorg/jivesoftware/smack/filter/PacketIDFilter;

    invoke-virtual {v2}, Lorg/jivesoftware/smackx/workgroup/packet/TranscriptSearch;->getPacketID()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/jivesoftware/smack/filter/PacketIDFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v4}, Lorg/jivesoftware/smack/Connection;->createPacketCollector(Lorg/jivesoftware/smack/filter/PacketFilter;)Lorg/jivesoftware/smack/PacketCollector;

    move-result-object v0

    .line 95
    .local v0, "collector":Lorg/jivesoftware/smack/PacketCollector;
    iget-object v3, p0, Lorg/jivesoftware/smackx/workgroup/agent/TranscriptSearchManager;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v3, v2}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 97
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getPacketReplyTimeout()I

    move-result v3

    int-to-long v4, v3

    invoke-virtual {v0, v4, v5}, Lorg/jivesoftware/smack/PacketCollector;->nextResult(J)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v1

    check-cast v1, Lorg/jivesoftware/smackx/workgroup/packet/TranscriptSearch;

    .line 100
    .local v1, "response":Lorg/jivesoftware/smackx/workgroup/packet/TranscriptSearch;
    invoke-virtual {v0}, Lorg/jivesoftware/smack/PacketCollector;->cancel()V

    .line 101
    if-nez v1, :cond_0

    .line 102
    new-instance v3, Lorg/jivesoftware/smack/XMPPException;

    const-string/jumbo v4, "No response from server on status set."

    invoke-direct {v3, v4}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 104
    :cond_0
    invoke-virtual {v1}, Lorg/jivesoftware/smackx/workgroup/packet/TranscriptSearch;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 105
    new-instance v3, Lorg/jivesoftware/smack/XMPPException;

    invoke-virtual {v1}, Lorg/jivesoftware/smackx/workgroup/packet/TranscriptSearch;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/jivesoftware/smack/XMPPException;-><init>(Lorg/jivesoftware/smack/packet/XMPPError;)V

    throw v3

    .line 107
    :cond_1
    invoke-static {v1}, Lorg/jivesoftware/smackx/ReportedData;->getReportedDataFrom(Lorg/jivesoftware/smack/packet/Packet;)Lorg/jivesoftware/smackx/ReportedData;

    move-result-object v3

    return-object v3
.end method
