.class public Lorg/jivesoftware/smackx/commands/RemoteCommand;
.super Lorg/jivesoftware/smackx/commands/AdHocCommand;
.source "RemoteCommand.java"


# instance fields
.field private connection:Lorg/jivesoftware/smack/Connection;

.field private jid:Ljava/lang/String;

.field private packetReplyTimeout:J

.field private sessionID:Ljava/lang/String;


# direct methods
.method protected constructor <init>(Lorg/jivesoftware/smack/Connection;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "connection"    # Lorg/jivesoftware/smack/Connection;
    .param p2, "node"    # Ljava/lang/String;
    .param p3, "jid"    # Ljava/lang/String;

    .prologue
    .line 81
    invoke-direct {p0}, Lorg/jivesoftware/smackx/commands/AdHocCommand;-><init>()V

    .line 82
    iput-object p1, p0, Lorg/jivesoftware/smackx/commands/RemoteCommand;->connection:Lorg/jivesoftware/smack/Connection;

    .line 83
    iput-object p3, p0, Lorg/jivesoftware/smackx/commands/RemoteCommand;->jid:Ljava/lang/String;

    .line 84
    invoke-virtual {p0, p2}, Lorg/jivesoftware/smackx/commands/RemoteCommand;->setNode(Ljava/lang/String;)V

    .line 85
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getPacketReplyTimeout()I

    move-result v0

    int-to-long v0, v0

    iput-wide v0, p0, Lorg/jivesoftware/smackx/commands/RemoteCommand;->packetReplyTimeout:J

    .line 86
    return-void
.end method

.method private executeAction(Lorg/jivesoftware/smackx/commands/AdHocCommand$Action;J)V
    .locals 2
    .param p1, "action"    # Lorg/jivesoftware/smackx/commands/AdHocCommand$Action;
    .param p2, "packetReplyTimeout"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 126
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, p2, p3}, Lorg/jivesoftware/smackx/commands/RemoteCommand;->executeAction(Lorg/jivesoftware/smackx/commands/AdHocCommand$Action;Lorg/jivesoftware/smackx/Form;J)V

    .line 127
    return-void
.end method

.method private executeAction(Lorg/jivesoftware/smackx/commands/AdHocCommand$Action;Lorg/jivesoftware/smackx/Form;J)V
    .locals 7
    .param p1, "action"    # Lorg/jivesoftware/smackx/commands/AdHocCommand$Action;
    .param p2, "form"    # Lorg/jivesoftware/smackx/Form;
    .param p3, "timeout"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 143
    new-instance v1, Lorg/jivesoftware/smackx/packet/AdHocCommandData;

    invoke-direct {v1}, Lorg/jivesoftware/smackx/packet/AdHocCommandData;-><init>()V

    .line 144
    .local v1, "data":Lorg/jivesoftware/smackx/packet/AdHocCommandData;
    sget-object v4, Lorg/jivesoftware/smack/packet/IQ$Type;->SET:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {v1, v4}, Lorg/jivesoftware/smackx/packet/AdHocCommandData;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 145
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/commands/RemoteCommand;->getOwnerJID()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Lorg/jivesoftware/smackx/packet/AdHocCommandData;->setTo(Ljava/lang/String;)V

    .line 146
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/commands/RemoteCommand;->getNode()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Lorg/jivesoftware/smackx/packet/AdHocCommandData;->setNode(Ljava/lang/String;)V

    .line 147
    iget-object v4, p0, Lorg/jivesoftware/smackx/commands/RemoteCommand;->sessionID:Ljava/lang/String;

    invoke-virtual {v1, v4}, Lorg/jivesoftware/smackx/packet/AdHocCommandData;->setSessionID(Ljava/lang/String;)V

    .line 148
    invoke-virtual {v1, p1}, Lorg/jivesoftware/smackx/packet/AdHocCommandData;->setAction(Lorg/jivesoftware/smackx/commands/AdHocCommand$Action;)V

    .line 150
    if-eqz p2, :cond_0

    .line 151
    invoke-virtual {p2}, Lorg/jivesoftware/smackx/Form;->getDataFormToSend()Lorg/jivesoftware/smackx/packet/DataForm;

    move-result-object v4

    invoke-virtual {v1, v4}, Lorg/jivesoftware/smackx/packet/AdHocCommandData;->setForm(Lorg/jivesoftware/smackx/packet/DataForm;)V

    .line 154
    :cond_0
    iget-object v4, p0, Lorg/jivesoftware/smackx/commands/RemoteCommand;->connection:Lorg/jivesoftware/smack/Connection;

    new-instance v5, Lorg/jivesoftware/smack/filter/PacketIDFilter;

    invoke-virtual {v1}, Lorg/jivesoftware/smackx/packet/AdHocCommandData;->getPacketID()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Lorg/jivesoftware/smack/filter/PacketIDFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v5}, Lorg/jivesoftware/smack/Connection;->createPacketCollector(Lorg/jivesoftware/smack/filter/PacketFilter;)Lorg/jivesoftware/smack/PacketCollector;

    move-result-object v0

    .line 157
    .local v0, "collector":Lorg/jivesoftware/smack/PacketCollector;
    iget-object v4, p0, Lorg/jivesoftware/smackx/commands/RemoteCommand;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v4, v1}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 159
    invoke-virtual {v0, p3, p4}, Lorg/jivesoftware/smack/PacketCollector;->nextResult(J)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v2

    .line 162
    .local v2, "response":Lorg/jivesoftware/smack/packet/Packet;
    invoke-virtual {v0}, Lorg/jivesoftware/smack/PacketCollector;->cancel()V

    .line 163
    if-nez v2, :cond_1

    .line 164
    new-instance v4, Lorg/jivesoftware/smack/XMPPException;

    const-string/jumbo v5, "No response from server on status set."

    invoke-direct {v4, v5}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 166
    :cond_1
    invoke-virtual {v2}, Lorg/jivesoftware/smack/packet/Packet;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v4

    if-eqz v4, :cond_2

    .line 167
    new-instance v4, Lorg/jivesoftware/smack/XMPPException;

    invoke-virtual {v2}, Lorg/jivesoftware/smack/packet/Packet;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/jivesoftware/smack/XMPPException;-><init>(Lorg/jivesoftware/smack/packet/XMPPError;)V

    throw v4

    :cond_2
    move-object v3, v2

    .line 170
    check-cast v3, Lorg/jivesoftware/smackx/packet/AdHocCommandData;

    .line 171
    .local v3, "responseData":Lorg/jivesoftware/smackx/packet/AdHocCommandData;
    invoke-virtual {v3}, Lorg/jivesoftware/smackx/packet/AdHocCommandData;->getSessionID()Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lorg/jivesoftware/smackx/commands/RemoteCommand;->sessionID:Ljava/lang/String;

    .line 172
    invoke-super {p0, v3}, Lorg/jivesoftware/smackx/commands/AdHocCommand;->setData(Lorg/jivesoftware/smackx/packet/AdHocCommandData;)V

    .line 173
    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 90
    sget-object v0, Lorg/jivesoftware/smackx/commands/AdHocCommand$Action;->cancel:Lorg/jivesoftware/smackx/commands/AdHocCommand$Action;

    iget-wide v2, p0, Lorg/jivesoftware/smackx/commands/RemoteCommand;->packetReplyTimeout:J

    invoke-direct {p0, v0, v2, v3}, Lorg/jivesoftware/smackx/commands/RemoteCommand;->executeAction(Lorg/jivesoftware/smackx/commands/AdHocCommand$Action;J)V

    .line 91
    return-void
.end method

.method public complete(Lorg/jivesoftware/smackx/Form;)V
    .locals 4
    .param p1, "form"    # Lorg/jivesoftware/smackx/Form;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 95
    sget-object v0, Lorg/jivesoftware/smackx/commands/AdHocCommand$Action;->complete:Lorg/jivesoftware/smackx/commands/AdHocCommand$Action;

    iget-wide v2, p0, Lorg/jivesoftware/smackx/commands/RemoteCommand;->packetReplyTimeout:J

    invoke-direct {p0, v0, p1, v2, v3}, Lorg/jivesoftware/smackx/commands/RemoteCommand;->executeAction(Lorg/jivesoftware/smackx/commands/AdHocCommand$Action;Lorg/jivesoftware/smackx/Form;J)V

    .line 96
    return-void
.end method

.method public execute()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 100
    sget-object v0, Lorg/jivesoftware/smackx/commands/AdHocCommand$Action;->execute:Lorg/jivesoftware/smackx/commands/AdHocCommand$Action;

    iget-wide v2, p0, Lorg/jivesoftware/smackx/commands/RemoteCommand;->packetReplyTimeout:J

    invoke-direct {p0, v0, v2, v3}, Lorg/jivesoftware/smackx/commands/RemoteCommand;->executeAction(Lorg/jivesoftware/smackx/commands/AdHocCommand$Action;J)V

    .line 101
    return-void
.end method

.method public execute(Lorg/jivesoftware/smackx/Form;)V
    .locals 4
    .param p1, "form"    # Lorg/jivesoftware/smackx/Form;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 112
    sget-object v0, Lorg/jivesoftware/smackx/commands/AdHocCommand$Action;->execute:Lorg/jivesoftware/smackx/commands/AdHocCommand$Action;

    iget-wide v2, p0, Lorg/jivesoftware/smackx/commands/RemoteCommand;->packetReplyTimeout:J

    invoke-direct {p0, v0, p1, v2, v3}, Lorg/jivesoftware/smackx/commands/RemoteCommand;->executeAction(Lorg/jivesoftware/smackx/commands/AdHocCommand$Action;Lorg/jivesoftware/smackx/Form;J)V

    .line 113
    return-void
.end method

.method public getOwnerJID()Ljava/lang/String;
    .locals 1

    .prologue
    .line 177
    iget-object v0, p0, Lorg/jivesoftware/smackx/commands/RemoteCommand;->jid:Ljava/lang/String;

    return-object v0
.end method

.method public getPacketReplyTimeout()J
    .locals 2

    .prologue
    .line 188
    iget-wide v0, p0, Lorg/jivesoftware/smackx/commands/RemoteCommand;->packetReplyTimeout:J

    return-wide v0
.end method

.method public next(Lorg/jivesoftware/smackx/Form;)V
    .locals 4
    .param p1, "form"    # Lorg/jivesoftware/smackx/Form;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 117
    sget-object v0, Lorg/jivesoftware/smackx/commands/AdHocCommand$Action;->next:Lorg/jivesoftware/smackx/commands/AdHocCommand$Action;

    iget-wide v2, p0, Lorg/jivesoftware/smackx/commands/RemoteCommand;->packetReplyTimeout:J

    invoke-direct {p0, v0, p1, v2, v3}, Lorg/jivesoftware/smackx/commands/RemoteCommand;->executeAction(Lorg/jivesoftware/smackx/commands/AdHocCommand$Action;Lorg/jivesoftware/smackx/Form;J)V

    .line 118
    return-void
.end method

.method public prev()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 122
    sget-object v0, Lorg/jivesoftware/smackx/commands/AdHocCommand$Action;->prev:Lorg/jivesoftware/smackx/commands/AdHocCommand$Action;

    iget-wide v2, p0, Lorg/jivesoftware/smackx/commands/RemoteCommand;->packetReplyTimeout:J

    invoke-direct {p0, v0, v2, v3}, Lorg/jivesoftware/smackx/commands/RemoteCommand;->executeAction(Lorg/jivesoftware/smackx/commands/AdHocCommand$Action;J)V

    .line 123
    return-void
.end method

.method public setPacketReplyTimeout(J)V
    .locals 1
    .param p1, "packetReplyTimeout"    # J

    .prologue
    .line 199
    iput-wide p1, p0, Lorg/jivesoftware/smackx/commands/RemoteCommand;->packetReplyTimeout:J

    .line 200
    return-void
.end method
