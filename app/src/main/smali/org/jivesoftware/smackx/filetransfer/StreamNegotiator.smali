.class public abstract Lorg/jivesoftware/smackx/filetransfer/StreamNegotiator;
.super Ljava/lang/Object;
.source "StreamNegotiator.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract cleanup()V
.end method

.method public createError(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/jivesoftware/smack/packet/XMPPError;)Lorg/jivesoftware/smack/packet/IQ;
    .locals 2
    .param p1, "from"    # Ljava/lang/String;
    .param p2, "to"    # Ljava/lang/String;
    .param p3, "packetID"    # Ljava/lang/String;
    .param p4, "xmppError"    # Lorg/jivesoftware/smack/packet/XMPPError;

    .prologue
    .line 79
    sget-object v1, Lorg/jivesoftware/smack/packet/IQ$Type;->ERROR:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-static {p3, p2, p1, v1}, Lorg/jivesoftware/smackx/filetransfer/FileTransferNegotiator;->createIQ(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/jivesoftware/smack/packet/IQ$Type;)Lorg/jivesoftware/smack/packet/IQ;

    move-result-object v0

    .line 80
    .local v0, "iq":Lorg/jivesoftware/smack/packet/IQ;
    invoke-virtual {v0, p4}, Lorg/jivesoftware/smack/packet/IQ;->setError(Lorg/jivesoftware/smack/packet/XMPPError;)V

    .line 81
    return-object v0
.end method

.method public abstract createIncomingStream(Lorg/jivesoftware/smackx/packet/StreamInitiation;)Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation
.end method

.method public createInitiationAccept(Lorg/jivesoftware/smackx/packet/StreamInitiation;[Ljava/lang/String;)Lorg/jivesoftware/smackx/packet/StreamInitiation;
    .locals 8
    .param p1, "streamInitiationOffer"    # Lorg/jivesoftware/smackx/packet/StreamInitiation;
    .param p2, "namespaces"    # [Ljava/lang/String;

    .prologue
    .line 59
    new-instance v6, Lorg/jivesoftware/smackx/packet/StreamInitiation;

    invoke-direct {v6}, Lorg/jivesoftware/smackx/packet/StreamInitiation;-><init>()V

    .line 60
    .local v6, "response":Lorg/jivesoftware/smackx/packet/StreamInitiation;
    invoke-virtual {p1}, Lorg/jivesoftware/smackx/packet/StreamInitiation;->getFrom()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Lorg/jivesoftware/smackx/packet/StreamInitiation;->setTo(Ljava/lang/String;)V

    .line 61
    invoke-virtual {p1}, Lorg/jivesoftware/smackx/packet/StreamInitiation;->getTo()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Lorg/jivesoftware/smackx/packet/StreamInitiation;->setFrom(Ljava/lang/String;)V

    .line 62
    sget-object v7, Lorg/jivesoftware/smack/packet/IQ$Type;->RESULT:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {v6, v7}, Lorg/jivesoftware/smackx/packet/StreamInitiation;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 63
    invoke-virtual {p1}, Lorg/jivesoftware/smackx/packet/StreamInitiation;->getPacketID()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Lorg/jivesoftware/smackx/packet/StreamInitiation;->setPacketID(Ljava/lang/String;)V

    .line 65
    new-instance v2, Lorg/jivesoftware/smackx/packet/DataForm;

    const-string/jumbo v7, "submit"

    invoke-direct {v2, v7}, Lorg/jivesoftware/smackx/packet/DataForm;-><init>(Ljava/lang/String;)V

    .line 66
    .local v2, "form":Lorg/jivesoftware/smackx/packet/DataForm;
    new-instance v1, Lorg/jivesoftware/smackx/FormField;

    const-string/jumbo v7, "stream-method"

    invoke-direct {v1, v7}, Lorg/jivesoftware/smackx/FormField;-><init>(Ljava/lang/String;)V

    .line 68
    .local v1, "field":Lorg/jivesoftware/smackx/FormField;
    move-object v0, p2

    .local v0, "arr$":[Ljava/lang/String;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_0
    if-ge v3, v4, :cond_0

    aget-object v5, v0, v3

    .line 69
    .local v5, "namespace":Ljava/lang/String;
    invoke-virtual {v1, v5}, Lorg/jivesoftware/smackx/FormField;->addValue(Ljava/lang/String;)V

    .line 68
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 71
    .end local v5    # "namespace":Ljava/lang/String;
    :cond_0
    invoke-virtual {v2, v1}, Lorg/jivesoftware/smackx/packet/DataForm;->addField(Lorg/jivesoftware/smackx/FormField;)V

    .line 73
    invoke-virtual {v6, v2}, Lorg/jivesoftware/smackx/packet/StreamInitiation;->setFeatureNegotiationForm(Lorg/jivesoftware/smackx/packet/DataForm;)V

    .line 74
    return-object v6
.end method

.method public abstract createOutgoingStream(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation
.end method

.method public abstract getInitiationPacketFilter(Ljava/lang/String;Ljava/lang/String;)Lorg/jivesoftware/smack/filter/PacketFilter;
.end method

.method public abstract getNamespaces()[Ljava/lang/String;
.end method

.method initiateIncomingStream(Lorg/jivesoftware/smack/Connection;Lorg/jivesoftware/smackx/packet/StreamInitiation;)Lorg/jivesoftware/smack/packet/Packet;
    .locals 6
    .param p1, "connection"    # Lorg/jivesoftware/smack/Connection;
    .param p2, "initiation"    # Lorg/jivesoftware/smackx/packet/StreamInitiation;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 85
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/filetransfer/StreamNegotiator;->getNamespaces()[Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, p2, v3}, Lorg/jivesoftware/smackx/filetransfer/StreamNegotiator;->createInitiationAccept(Lorg/jivesoftware/smackx/packet/StreamInitiation;[Ljava/lang/String;)Lorg/jivesoftware/smackx/packet/StreamInitiation;

    move-result-object v1

    .line 89
    .local v1, "response":Lorg/jivesoftware/smackx/packet/StreamInitiation;
    invoke-virtual {p2}, Lorg/jivesoftware/smackx/packet/StreamInitiation;->getFrom()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p2}, Lorg/jivesoftware/smackx/packet/StreamInitiation;->getSessionID()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v3, v4}, Lorg/jivesoftware/smackx/filetransfer/StreamNegotiator;->getInitiationPacketFilter(Ljava/lang/String;Ljava/lang/String;)Lorg/jivesoftware/smack/filter/PacketFilter;

    move-result-object v3

    invoke-virtual {p1, v3}, Lorg/jivesoftware/smack/Connection;->createPacketCollector(Lorg/jivesoftware/smack/filter/PacketFilter;)Lorg/jivesoftware/smack/PacketCollector;

    move-result-object v0

    .line 91
    .local v0, "collector":Lorg/jivesoftware/smack/PacketCollector;
    invoke-virtual {p1, v1}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 93
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getPacketReplyTimeout()I

    move-result v3

    int-to-long v4, v3

    invoke-virtual {v0, v4, v5}, Lorg/jivesoftware/smack/PacketCollector;->nextResult(J)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v2

    .line 95
    .local v2, "streamMethodInitiation":Lorg/jivesoftware/smack/packet/Packet;
    invoke-virtual {v0}, Lorg/jivesoftware/smack/PacketCollector;->cancel()V

    .line 96
    if-nez v2, :cond_0

    .line 97
    new-instance v3, Lorg/jivesoftware/smack/XMPPException;

    const-string/jumbo v4, "No response from file transfer initiator"

    invoke-direct {v3, v4}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 100
    :cond_0
    return-object v2
.end method

.method abstract negotiateIncomingStream(Lorg/jivesoftware/smack/packet/Packet;)Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation
.end method
