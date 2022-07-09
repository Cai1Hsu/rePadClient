.class public Lorg/jivesoftware/smackx/workgroup/agent/Agent;
.super Ljava/lang/Object;
.source "Agent.java"


# instance fields
.field private connection:Lorg/jivesoftware/smack/Connection;

.field private workgroupJID:Ljava/lang/String;


# direct methods
.method constructor <init>(Lorg/jivesoftware/smack/Connection;Ljava/lang/String;)V
    .locals 0
    .param p1, "connection"    # Lorg/jivesoftware/smack/Connection;
    .param p2, "workgroupJID"    # Ljava/lang/String;

    .prologue
    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 66
    iput-object p1, p0, Lorg/jivesoftware/smackx/workgroup/agent/Agent;->connection:Lorg/jivesoftware/smack/Connection;

    .line 67
    iput-object p2, p0, Lorg/jivesoftware/smackx/workgroup/agent/Agent;->workgroupJID:Ljava/lang/String;

    .line 68
    return-void
.end method

.method public static getWorkgroups(Ljava/lang/String;Ljava/lang/String;Lorg/jivesoftware/smack/Connection;)Ljava/util/Collection;
    .locals 6
    .param p0, "serviceJID"    # Ljava/lang/String;
    .param p1, "agentJID"    # Ljava/lang/String;
    .param p2, "connection"    # Lorg/jivesoftware/smack/Connection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
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
    .line 43
    new-instance v1, Lorg/jivesoftware/smackx/workgroup/packet/AgentWorkgroups;

    invoke-direct {v1, p1}, Lorg/jivesoftware/smackx/workgroup/packet/AgentWorkgroups;-><init>(Ljava/lang/String;)V

    .line 44
    .local v1, "request":Lorg/jivesoftware/smackx/workgroup/packet/AgentWorkgroups;
    invoke-virtual {v1, p0}, Lorg/jivesoftware/smackx/workgroup/packet/AgentWorkgroups;->setTo(Ljava/lang/String;)V

    .line 45
    new-instance v3, Lorg/jivesoftware/smack/filter/PacketIDFilter;

    invoke-virtual {v1}, Lorg/jivesoftware/smackx/workgroup/packet/AgentWorkgroups;->getPacketID()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/jivesoftware/smack/filter/PacketIDFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, v3}, Lorg/jivesoftware/smack/Connection;->createPacketCollector(Lorg/jivesoftware/smack/filter/PacketFilter;)Lorg/jivesoftware/smack/PacketCollector;

    move-result-object v0

    .line 47
    .local v0, "collector":Lorg/jivesoftware/smack/PacketCollector;
    invoke-virtual {p2, v1}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 49
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getPacketReplyTimeout()I

    move-result v3

    int-to-long v4, v3

    invoke-virtual {v0, v4, v5}, Lorg/jivesoftware/smack/PacketCollector;->nextResult(J)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v2

    check-cast v2, Lorg/jivesoftware/smackx/workgroup/packet/AgentWorkgroups;

    .line 52
    .local v2, "response":Lorg/jivesoftware/smackx/workgroup/packet/AgentWorkgroups;
    invoke-virtual {v0}, Lorg/jivesoftware/smack/PacketCollector;->cancel()V

    .line 53
    if-nez v2, :cond_0

    .line 54
    new-instance v3, Lorg/jivesoftware/smack/XMPPException;

    const-string/jumbo v4, "No response from server on status set."

    invoke-direct {v3, v4}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 56
    :cond_0
    invoke-virtual {v2}, Lorg/jivesoftware/smackx/workgroup/packet/AgentWorkgroups;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 57
    new-instance v3, Lorg/jivesoftware/smack/XMPPException;

    invoke-virtual {v2}, Lorg/jivesoftware/smackx/workgroup/packet/AgentWorkgroups;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/jivesoftware/smack/XMPPException;-><init>(Lorg/jivesoftware/smack/packet/XMPPError;)V

    throw v3

    .line 59
    :cond_1
    invoke-virtual {v2}, Lorg/jivesoftware/smackx/workgroup/packet/AgentWorkgroups;->getWorkgroups()Ljava/util/List;

    move-result-object v3

    return-object v3
.end method


# virtual methods
.method public getName()Ljava/lang/String;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 85
    new-instance v0, Lorg/jivesoftware/smackx/workgroup/packet/AgentInfo;

    invoke-direct {v0}, Lorg/jivesoftware/smackx/workgroup/packet/AgentInfo;-><init>()V

    .line 86
    .local v0, "agentInfo":Lorg/jivesoftware/smackx/workgroup/packet/AgentInfo;
    sget-object v3, Lorg/jivesoftware/smack/packet/IQ$Type;->GET:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {v0, v3}, Lorg/jivesoftware/smackx/workgroup/packet/AgentInfo;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 87
    iget-object v3, p0, Lorg/jivesoftware/smackx/workgroup/agent/Agent;->workgroupJID:Ljava/lang/String;

    invoke-virtual {v0, v3}, Lorg/jivesoftware/smackx/workgroup/packet/AgentInfo;->setTo(Ljava/lang/String;)V

    .line 88
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/workgroup/agent/Agent;->getUser()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lorg/jivesoftware/smackx/workgroup/packet/AgentInfo;->setFrom(Ljava/lang/String;)V

    .line 89
    iget-object v3, p0, Lorg/jivesoftware/smackx/workgroup/agent/Agent;->connection:Lorg/jivesoftware/smack/Connection;

    new-instance v4, Lorg/jivesoftware/smack/filter/PacketIDFilter;

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/workgroup/packet/AgentInfo;->getPacketID()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/jivesoftware/smack/filter/PacketIDFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v4}, Lorg/jivesoftware/smack/Connection;->createPacketCollector(Lorg/jivesoftware/smack/filter/PacketFilter;)Lorg/jivesoftware/smack/PacketCollector;

    move-result-object v1

    .line 91
    .local v1, "collector":Lorg/jivesoftware/smack/PacketCollector;
    iget-object v3, p0, Lorg/jivesoftware/smackx/workgroup/agent/Agent;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v3, v0}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 93
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getPacketReplyTimeout()I

    move-result v3

    int-to-long v4, v3

    invoke-virtual {v1, v4, v5}, Lorg/jivesoftware/smack/PacketCollector;->nextResult(J)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v2

    check-cast v2, Lorg/jivesoftware/smackx/workgroup/packet/AgentInfo;

    .line 96
    .local v2, "response":Lorg/jivesoftware/smackx/workgroup/packet/AgentInfo;
    invoke-virtual {v1}, Lorg/jivesoftware/smack/PacketCollector;->cancel()V

    .line 97
    if-nez v2, :cond_0

    .line 98
    new-instance v3, Lorg/jivesoftware/smack/XMPPException;

    const-string/jumbo v4, "No response from server on status set."

    invoke-direct {v3, v4}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 100
    :cond_0
    invoke-virtual {v2}, Lorg/jivesoftware/smackx/workgroup/packet/AgentInfo;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 101
    new-instance v3, Lorg/jivesoftware/smack/XMPPException;

    invoke-virtual {v2}, Lorg/jivesoftware/smackx/workgroup/packet/AgentInfo;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/jivesoftware/smack/XMPPException;-><init>(Lorg/jivesoftware/smack/packet/XMPPError;)V

    throw v3

    .line 103
    :cond_1
    invoke-virtual {v2}, Lorg/jivesoftware/smackx/workgroup/packet/AgentInfo;->getName()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method public getUser()Ljava/lang/String;
    .locals 1

    .prologue
    .line 76
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/agent/Agent;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v0}, Lorg/jivesoftware/smack/Connection;->getUser()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public setName(Ljava/lang/String;)V
    .locals 6
    .param p1, "newName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 117
    new-instance v0, Lorg/jivesoftware/smackx/workgroup/packet/AgentInfo;

    invoke-direct {v0}, Lorg/jivesoftware/smackx/workgroup/packet/AgentInfo;-><init>()V

    .line 118
    .local v0, "agentInfo":Lorg/jivesoftware/smackx/workgroup/packet/AgentInfo;
    sget-object v3, Lorg/jivesoftware/smack/packet/IQ$Type;->SET:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {v0, v3}, Lorg/jivesoftware/smackx/workgroup/packet/AgentInfo;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 119
    iget-object v3, p0, Lorg/jivesoftware/smackx/workgroup/agent/Agent;->workgroupJID:Ljava/lang/String;

    invoke-virtual {v0, v3}, Lorg/jivesoftware/smackx/workgroup/packet/AgentInfo;->setTo(Ljava/lang/String;)V

    .line 120
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/workgroup/agent/Agent;->getUser()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lorg/jivesoftware/smackx/workgroup/packet/AgentInfo;->setFrom(Ljava/lang/String;)V

    .line 121
    invoke-virtual {v0, p1}, Lorg/jivesoftware/smackx/workgroup/packet/AgentInfo;->setName(Ljava/lang/String;)V

    .line 122
    iget-object v3, p0, Lorg/jivesoftware/smackx/workgroup/agent/Agent;->connection:Lorg/jivesoftware/smack/Connection;

    new-instance v4, Lorg/jivesoftware/smack/filter/PacketIDFilter;

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/workgroup/packet/AgentInfo;->getPacketID()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/jivesoftware/smack/filter/PacketIDFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v4}, Lorg/jivesoftware/smack/Connection;->createPacketCollector(Lorg/jivesoftware/smack/filter/PacketFilter;)Lorg/jivesoftware/smack/PacketCollector;

    move-result-object v1

    .line 124
    .local v1, "collector":Lorg/jivesoftware/smack/PacketCollector;
    iget-object v3, p0, Lorg/jivesoftware/smackx/workgroup/agent/Agent;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v3, v0}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 126
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getPacketReplyTimeout()I

    move-result v3

    int-to-long v4, v3

    invoke-virtual {v1, v4, v5}, Lorg/jivesoftware/smack/PacketCollector;->nextResult(J)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v2

    check-cast v2, Lorg/jivesoftware/smack/packet/IQ;

    .line 129
    .local v2, "response":Lorg/jivesoftware/smack/packet/IQ;
    invoke-virtual {v1}, Lorg/jivesoftware/smack/PacketCollector;->cancel()V

    .line 130
    if-nez v2, :cond_0

    .line 131
    new-instance v3, Lorg/jivesoftware/smack/XMPPException;

    const-string/jumbo v4, "No response from server on status set."

    invoke-direct {v3, v4}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 133
    :cond_0
    invoke-virtual {v2}, Lorg/jivesoftware/smack/packet/IQ;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 134
    new-instance v3, Lorg/jivesoftware/smack/XMPPException;

    invoke-virtual {v2}, Lorg/jivesoftware/smack/packet/IQ;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/jivesoftware/smack/XMPPException;-><init>(Lorg/jivesoftware/smack/packet/XMPPError;)V

    throw v3

    .line 136
    :cond_1
    return-void
.end method
