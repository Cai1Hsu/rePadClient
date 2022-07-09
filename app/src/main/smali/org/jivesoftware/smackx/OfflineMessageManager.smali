.class public Lorg/jivesoftware/smackx/OfflineMessageManager;
.super Ljava/lang/Object;
.source "OfflineMessageManager.java"


# static fields
.field private static final namespace:Ljava/lang/String; = "http://jabber.org/protocol/offline"


# instance fields
.field private connection:Lorg/jivesoftware/smack/Connection;

.field private packetFilter:Lorg/jivesoftware/smack/filter/PacketFilter;


# direct methods
.method public constructor <init>(Lorg/jivesoftware/smack/Connection;)V
    .locals 6
    .param p1, "connection"    # Lorg/jivesoftware/smack/Connection;

    .prologue
    .line 64
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 65
    iput-object p1, p0, Lorg/jivesoftware/smackx/OfflineMessageManager;->connection:Lorg/jivesoftware/smack/Connection;

    .line 66
    new-instance v0, Lorg/jivesoftware/smack/filter/AndFilter;

    const/4 v1, 0x2

    new-array v1, v1, [Lorg/jivesoftware/smack/filter/PacketFilter;

    const/4 v2, 0x0

    new-instance v3, Lorg/jivesoftware/smack/filter/PacketExtensionFilter;

    const-string/jumbo v4, "offline"

    const-string/jumbo v5, "http://jabber.org/protocol/offline"

    invoke-direct {v3, v4, v5}, Lorg/jivesoftware/smack/filter/PacketExtensionFilter;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    aput-object v3, v1, v2

    const/4 v2, 0x1

    new-instance v3, Lorg/jivesoftware/smack/filter/PacketTypeFilter;

    const-class v4, Lorg/jivesoftware/smack/packet/Message;

    invoke-direct {v3, v4}, Lorg/jivesoftware/smack/filter/PacketTypeFilter;-><init>(Ljava/lang/Class;)V

    aput-object v3, v1, v2

    invoke-direct {v0, v1}, Lorg/jivesoftware/smack/filter/AndFilter;-><init>([Lorg/jivesoftware/smack/filter/PacketFilter;)V

    iput-object v0, p0, Lorg/jivesoftware/smackx/OfflineMessageManager;->packetFilter:Lorg/jivesoftware/smack/filter/PacketFilter;

    .line 69
    return-void
.end method


# virtual methods
.method public deleteMessages()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 266
    new-instance v1, Lorg/jivesoftware/smackx/packet/OfflineMessageRequest;

    invoke-direct {v1}, Lorg/jivesoftware/smackx/packet/OfflineMessageRequest;-><init>()V

    .line 267
    .local v1, "request":Lorg/jivesoftware/smackx/packet/OfflineMessageRequest;
    const/4 v4, 0x1

    invoke-virtual {v1, v4}, Lorg/jivesoftware/smackx/packet/OfflineMessageRequest;->setPurge(Z)V

    .line 269
    new-instance v3, Lorg/jivesoftware/smack/filter/PacketIDFilter;

    invoke-virtual {v1}, Lorg/jivesoftware/smackx/packet/OfflineMessageRequest;->getPacketID()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/jivesoftware/smack/filter/PacketIDFilter;-><init>(Ljava/lang/String;)V

    .line 270
    .local v3, "responseFilter":Lorg/jivesoftware/smack/filter/PacketFilter;
    iget-object v4, p0, Lorg/jivesoftware/smackx/OfflineMessageManager;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v4, v3}, Lorg/jivesoftware/smack/Connection;->createPacketCollector(Lorg/jivesoftware/smack/filter/PacketFilter;)Lorg/jivesoftware/smack/PacketCollector;

    move-result-object v2

    .line 272
    .local v2, "response":Lorg/jivesoftware/smack/PacketCollector;
    iget-object v4, p0, Lorg/jivesoftware/smackx/OfflineMessageManager;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v4, v1}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 274
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getPacketReplyTimeout()I

    move-result v4

    int-to-long v4, v4

    invoke-virtual {v2, v4, v5}, Lorg/jivesoftware/smack/PacketCollector;->nextResult(J)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smack/packet/IQ;

    .line 276
    .local v0, "answer":Lorg/jivesoftware/smack/packet/IQ;
    invoke-virtual {v2}, Lorg/jivesoftware/smack/PacketCollector;->cancel()V

    .line 278
    if-nez v0, :cond_0

    .line 279
    new-instance v4, Lorg/jivesoftware/smack/XMPPException;

    const-string/jumbo v5, "No response from server."

    invoke-direct {v4, v5}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 280
    :cond_0
    invoke-virtual {v0}, Lorg/jivesoftware/smack/packet/IQ;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v4

    if-eqz v4, :cond_1

    .line 281
    new-instance v4, Lorg/jivesoftware/smack/XMPPException;

    invoke-virtual {v0}, Lorg/jivesoftware/smack/packet/IQ;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/jivesoftware/smack/XMPPException;-><init>(Lorg/jivesoftware/smack/packet/XMPPError;)V

    throw v4

    .line 283
    :cond_1
    return-void
.end method

.method public deleteMessages(Ljava/util/List;)V
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
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
    .line 236
    .local p1, "nodes":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    new-instance v4, Lorg/jivesoftware/smackx/packet/OfflineMessageRequest;

    invoke-direct {v4}, Lorg/jivesoftware/smackx/packet/OfflineMessageRequest;-><init>()V

    .line 237
    .local v4, "request":Lorg/jivesoftware/smackx/packet/OfflineMessageRequest;
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 238
    .local v3, "node":Ljava/lang/String;
    new-instance v2, Lorg/jivesoftware/smackx/packet/OfflineMessageRequest$Item;

    invoke-direct {v2, v3}, Lorg/jivesoftware/smackx/packet/OfflineMessageRequest$Item;-><init>(Ljava/lang/String;)V

    .line 239
    .local v2, "item":Lorg/jivesoftware/smackx/packet/OfflineMessageRequest$Item;
    const-string/jumbo v7, "remove"

    invoke-virtual {v2, v7}, Lorg/jivesoftware/smackx/packet/OfflineMessageRequest$Item;->setAction(Ljava/lang/String;)V

    .line 240
    invoke-virtual {v4, v2}, Lorg/jivesoftware/smackx/packet/OfflineMessageRequest;->addItem(Lorg/jivesoftware/smackx/packet/OfflineMessageRequest$Item;)V

    goto :goto_0

    .line 243
    .end local v2    # "item":Lorg/jivesoftware/smackx/packet/OfflineMessageRequest$Item;
    .end local v3    # "node":Ljava/lang/String;
    :cond_0
    new-instance v6, Lorg/jivesoftware/smack/filter/PacketIDFilter;

    invoke-virtual {v4}, Lorg/jivesoftware/smackx/packet/OfflineMessageRequest;->getPacketID()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lorg/jivesoftware/smack/filter/PacketIDFilter;-><init>(Ljava/lang/String;)V

    .line 244
    .local v6, "responseFilter":Lorg/jivesoftware/smack/filter/PacketFilter;
    iget-object v7, p0, Lorg/jivesoftware/smackx/OfflineMessageManager;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v7, v6}, Lorg/jivesoftware/smack/Connection;->createPacketCollector(Lorg/jivesoftware/smack/filter/PacketFilter;)Lorg/jivesoftware/smack/PacketCollector;

    move-result-object v5

    .line 246
    .local v5, "response":Lorg/jivesoftware/smack/PacketCollector;
    iget-object v7, p0, Lorg/jivesoftware/smackx/OfflineMessageManager;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v7, v4}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 248
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getPacketReplyTimeout()I

    move-result v7

    int-to-long v8, v7

    invoke-virtual {v5, v8, v9}, Lorg/jivesoftware/smack/PacketCollector;->nextResult(J)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smack/packet/IQ;

    .line 250
    .local v0, "answer":Lorg/jivesoftware/smack/packet/IQ;
    invoke-virtual {v5}, Lorg/jivesoftware/smack/PacketCollector;->cancel()V

    .line 252
    if-nez v0, :cond_1

    .line 253
    new-instance v7, Lorg/jivesoftware/smack/XMPPException;

    const-string/jumbo v8, "No response from server."

    invoke-direct {v7, v8}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 254
    :cond_1
    invoke-virtual {v0}, Lorg/jivesoftware/smack/packet/IQ;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v7

    if-eqz v7, :cond_2

    .line 255
    new-instance v7, Lorg/jivesoftware/smack/XMPPException;

    invoke-virtual {v0}, Lorg/jivesoftware/smack/packet/IQ;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v8

    invoke-direct {v7, v8}, Lorg/jivesoftware/smack/XMPPException;-><init>(Lorg/jivesoftware/smack/packet/XMPPError;)V

    throw v7

    .line 257
    :cond_2
    return-void
.end method

.method public getHeaders()Ljava/util/Iterator;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<",
            "Lorg/jivesoftware/smackx/OfflineMessageHeader;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 113
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 114
    .local v0, "answer":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smackx/OfflineMessageHeader;>;"
    iget-object v4, p0, Lorg/jivesoftware/smackx/OfflineMessageManager;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-static {v4}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->getInstanceFor(Lorg/jivesoftware/smack/Connection;)Lorg/jivesoftware/smackx/ServiceDiscoveryManager;

    move-result-object v4

    const/4 v5, 0x0

    const-string/jumbo v6, "http://jabber.org/protocol/offline"

    invoke-virtual {v4, v5, v6}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->discoverItems(Ljava/lang/String;Ljava/lang/String;)Lorg/jivesoftware/smackx/packet/DiscoverItems;

    move-result-object v3

    .line 116
    .local v3, "items":Lorg/jivesoftware/smackx/packet/DiscoverItems;
    invoke-virtual {v3}, Lorg/jivesoftware/smackx/packet/DiscoverItems;->getItems()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/jivesoftware/smackx/packet/DiscoverItems$Item;>;"
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 117
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/jivesoftware/smackx/packet/DiscoverItems$Item;

    .line 118
    .local v2, "item":Lorg/jivesoftware/smackx/packet/DiscoverItems$Item;
    new-instance v4, Lorg/jivesoftware/smackx/OfflineMessageHeader;

    invoke-direct {v4, v2}, Lorg/jivesoftware/smackx/OfflineMessageHeader;-><init>(Lorg/jivesoftware/smackx/packet/DiscoverItems$Item;)V

    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 120
    .end local v2    # "item":Lorg/jivesoftware/smackx/packet/DiscoverItems$Item;
    :cond_0
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    return-object v4
.end method

.method public getMessageCount()I
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 92
    iget-object v3, p0, Lorg/jivesoftware/smackx/OfflineMessageManager;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-static {v3}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->getInstanceFor(Lorg/jivesoftware/smack/Connection;)Lorg/jivesoftware/smackx/ServiceDiscoveryManager;

    move-result-object v3

    const/4 v4, 0x0

    const-string/jumbo v5, "http://jabber.org/protocol/offline"

    invoke-virtual {v3, v4, v5}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->discoverInfo(Ljava/lang/String;Ljava/lang/String;)Lorg/jivesoftware/smackx/packet/DiscoverInfo;

    move-result-object v1

    .line 94
    .local v1, "info":Lorg/jivesoftware/smackx/packet/DiscoverInfo;
    invoke-static {v1}, Lorg/jivesoftware/smackx/Form;->getFormFrom(Lorg/jivesoftware/smack/packet/Packet;)Lorg/jivesoftware/smackx/Form;

    move-result-object v0

    .line 95
    .local v0, "extendedInfo":Lorg/jivesoftware/smackx/Form;
    if-eqz v0, :cond_0

    .line 96
    const-string/jumbo v3, "number_of_messages"

    invoke-virtual {v0, v3}, Lorg/jivesoftware/smackx/Form;->getField(Ljava/lang/String;)Lorg/jivesoftware/smackx/FormField;

    move-result-object v3

    invoke-virtual {v3}, Lorg/jivesoftware/smackx/FormField;->getValues()Ljava/util/Iterator;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 97
    .local v2, "value":Ljava/lang/String;
    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    .line 99
    .end local v2    # "value":Ljava/lang/String;
    :goto_0
    return v3

    :cond_0
    const/4 v3, 0x0

    goto :goto_0
.end method

.method public getMessages()Ljava/util/Iterator;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<",
            "Lorg/jivesoftware/smack/packet/Message;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 192
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 193
    .local v3, "messages":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smack/packet/Message;>;"
    new-instance v4, Lorg/jivesoftware/smackx/packet/OfflineMessageRequest;

    invoke-direct {v4}, Lorg/jivesoftware/smackx/packet/OfflineMessageRequest;-><init>()V

    .line 194
    .local v4, "request":Lorg/jivesoftware/smackx/packet/OfflineMessageRequest;
    const/4 v7, 0x1

    invoke-virtual {v4, v7}, Lorg/jivesoftware/smackx/packet/OfflineMessageRequest;->setFetch(Z)V

    .line 196
    new-instance v6, Lorg/jivesoftware/smack/filter/PacketIDFilter;

    invoke-virtual {v4}, Lorg/jivesoftware/smackx/packet/OfflineMessageRequest;->getPacketID()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lorg/jivesoftware/smack/filter/PacketIDFilter;-><init>(Ljava/lang/String;)V

    .line 197
    .local v6, "responseFilter":Lorg/jivesoftware/smack/filter/PacketFilter;
    iget-object v7, p0, Lorg/jivesoftware/smackx/OfflineMessageManager;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v7, v6}, Lorg/jivesoftware/smack/Connection;->createPacketCollector(Lorg/jivesoftware/smack/filter/PacketFilter;)Lorg/jivesoftware/smack/PacketCollector;

    move-result-object v5

    .line 199
    .local v5, "response":Lorg/jivesoftware/smack/PacketCollector;
    iget-object v7, p0, Lorg/jivesoftware/smackx/OfflineMessageManager;->connection:Lorg/jivesoftware/smack/Connection;

    iget-object v8, p0, Lorg/jivesoftware/smackx/OfflineMessageManager;->packetFilter:Lorg/jivesoftware/smack/filter/PacketFilter;

    invoke-virtual {v7, v8}, Lorg/jivesoftware/smack/Connection;->createPacketCollector(Lorg/jivesoftware/smack/filter/PacketFilter;)Lorg/jivesoftware/smack/PacketCollector;

    move-result-object v2

    .line 201
    .local v2, "messageCollector":Lorg/jivesoftware/smack/PacketCollector;
    iget-object v7, p0, Lorg/jivesoftware/smackx/OfflineMessageManager;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v7, v4}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 203
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getPacketReplyTimeout()I

    move-result v7

    int-to-long v8, v7

    invoke-virtual {v5, v8, v9}, Lorg/jivesoftware/smack/PacketCollector;->nextResult(J)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smack/packet/IQ;

    .line 205
    .local v0, "answer":Lorg/jivesoftware/smack/packet/IQ;
    invoke-virtual {v5}, Lorg/jivesoftware/smack/PacketCollector;->cancel()V

    .line 207
    if-nez v0, :cond_0

    .line 208
    new-instance v7, Lorg/jivesoftware/smack/XMPPException;

    const-string/jumbo v8, "No response from server."

    invoke-direct {v7, v8}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 209
    :cond_0
    invoke-virtual {v0}, Lorg/jivesoftware/smack/packet/IQ;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v7

    if-eqz v7, :cond_1

    .line 210
    new-instance v7, Lorg/jivesoftware/smack/XMPPException;

    invoke-virtual {v0}, Lorg/jivesoftware/smack/packet/IQ;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v8

    invoke-direct {v7, v8}, Lorg/jivesoftware/smack/XMPPException;-><init>(Lorg/jivesoftware/smack/packet/XMPPError;)V

    throw v7

    .line 214
    :cond_1
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getPacketReplyTimeout()I

    move-result v7

    int-to-long v8, v7

    invoke-virtual {v2, v8, v9}, Lorg/jivesoftware/smack/PacketCollector;->nextResult(J)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v1

    check-cast v1, Lorg/jivesoftware/smack/packet/Message;

    .line 216
    .local v1, "message":Lorg/jivesoftware/smack/packet/Message;
    :goto_0
    if-eqz v1, :cond_2

    .line 217
    invoke-interface {v3, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 218
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getPacketReplyTimeout()I

    move-result v7

    int-to-long v8, v7

    invoke-virtual {v2, v8, v9}, Lorg/jivesoftware/smack/PacketCollector;->nextResult(J)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v1

    .end local v1    # "message":Lorg/jivesoftware/smack/packet/Message;
    check-cast v1, Lorg/jivesoftware/smack/packet/Message;

    .restart local v1    # "message":Lorg/jivesoftware/smack/packet/Message;
    goto :goto_0

    .line 223
    :cond_2
    invoke-virtual {v2}, Lorg/jivesoftware/smack/PacketCollector;->cancel()V

    .line 224
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    return-object v7
.end method

.method public getMessages(Ljava/util/List;)Ljava/util/Iterator;
    .locals 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/Iterator",
            "<",
            "Lorg/jivesoftware/smack/packet/Message;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 136
    .local p1, "nodes":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 137
    .local v6, "messages":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smack/packet/Message;>;"
    new-instance v8, Lorg/jivesoftware/smackx/packet/OfflineMessageRequest;

    invoke-direct {v8}, Lorg/jivesoftware/smackx/packet/OfflineMessageRequest;-><init>()V

    .line 138
    .local v8, "request":Lorg/jivesoftware/smackx/packet/OfflineMessageRequest;
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    .line 139
    .local v7, "node":Ljava/lang/String;
    new-instance v2, Lorg/jivesoftware/smackx/packet/OfflineMessageRequest$Item;

    invoke-direct {v2, v7}, Lorg/jivesoftware/smackx/packet/OfflineMessageRequest$Item;-><init>(Ljava/lang/String;)V

    .line 140
    .local v2, "item":Lorg/jivesoftware/smackx/packet/OfflineMessageRequest$Item;
    const-string/jumbo v11, "view"

    invoke-virtual {v2, v11}, Lorg/jivesoftware/smackx/packet/OfflineMessageRequest$Item;->setAction(Ljava/lang/String;)V

    .line 141
    invoke-virtual {v8, v2}, Lorg/jivesoftware/smackx/packet/OfflineMessageRequest;->addItem(Lorg/jivesoftware/smackx/packet/OfflineMessageRequest$Item;)V

    goto :goto_0

    .line 144
    .end local v2    # "item":Lorg/jivesoftware/smackx/packet/OfflineMessageRequest$Item;
    .end local v7    # "node":Ljava/lang/String;
    :cond_0
    new-instance v10, Lorg/jivesoftware/smack/filter/PacketIDFilter;

    invoke-virtual {v8}, Lorg/jivesoftware/smackx/packet/OfflineMessageRequest;->getPacketID()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11}, Lorg/jivesoftware/smack/filter/PacketIDFilter;-><init>(Ljava/lang/String;)V

    .line 145
    .local v10, "responseFilter":Lorg/jivesoftware/smack/filter/PacketFilter;
    iget-object v11, p0, Lorg/jivesoftware/smackx/OfflineMessageManager;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v11, v10}, Lorg/jivesoftware/smack/Connection;->createPacketCollector(Lorg/jivesoftware/smack/filter/PacketFilter;)Lorg/jivesoftware/smack/PacketCollector;

    move-result-object v9

    .line 147
    .local v9, "response":Lorg/jivesoftware/smack/PacketCollector;
    new-instance v5, Lorg/jivesoftware/smack/filter/AndFilter;

    const/4 v11, 0x2

    new-array v11, v11, [Lorg/jivesoftware/smack/filter/PacketFilter;

    const/4 v12, 0x0

    iget-object v13, p0, Lorg/jivesoftware/smackx/OfflineMessageManager;->packetFilter:Lorg/jivesoftware/smack/filter/PacketFilter;

    aput-object v13, v11, v12

    const/4 v12, 0x1

    new-instance v13, Lorg/jivesoftware/smackx/OfflineMessageManager$1;

    invoke-direct {v13, p0, p1}, Lorg/jivesoftware/smackx/OfflineMessageManager$1;-><init>(Lorg/jivesoftware/smackx/OfflineMessageManager;Ljava/util/List;)V

    aput-object v13, v11, v12

    invoke-direct {v5, v11}, Lorg/jivesoftware/smack/filter/AndFilter;-><init>([Lorg/jivesoftware/smack/filter/PacketFilter;)V

    .line 154
    .local v5, "messageFilter":Lorg/jivesoftware/smack/filter/PacketFilter;
    iget-object v11, p0, Lorg/jivesoftware/smackx/OfflineMessageManager;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v11, v5}, Lorg/jivesoftware/smack/Connection;->createPacketCollector(Lorg/jivesoftware/smack/filter/PacketFilter;)Lorg/jivesoftware/smack/PacketCollector;

    move-result-object v4

    .line 156
    .local v4, "messageCollector":Lorg/jivesoftware/smack/PacketCollector;
    iget-object v11, p0, Lorg/jivesoftware/smackx/OfflineMessageManager;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v11, v8}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 158
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getPacketReplyTimeout()I

    move-result v11

    int-to-long v12, v11

    invoke-virtual {v9, v12, v13}, Lorg/jivesoftware/smack/PacketCollector;->nextResult(J)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smack/packet/IQ;

    .line 160
    .local v0, "answer":Lorg/jivesoftware/smack/packet/IQ;
    invoke-virtual {v9}, Lorg/jivesoftware/smack/PacketCollector;->cancel()V

    .line 162
    if-nez v0, :cond_1

    .line 163
    new-instance v11, Lorg/jivesoftware/smack/XMPPException;

    const-string/jumbo v12, "No response from server."

    invoke-direct {v11, v12}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v11

    .line 164
    :cond_1
    invoke-virtual {v0}, Lorg/jivesoftware/smack/packet/IQ;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v11

    if-eqz v11, :cond_2

    .line 165
    new-instance v11, Lorg/jivesoftware/smack/XMPPException;

    invoke-virtual {v0}, Lorg/jivesoftware/smack/packet/IQ;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v12

    invoke-direct {v11, v12}, Lorg/jivesoftware/smack/XMPPException;-><init>(Lorg/jivesoftware/smack/packet/XMPPError;)V

    throw v11

    .line 169
    :cond_2
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getPacketReplyTimeout()I

    move-result v11

    int-to-long v12, v11

    invoke-virtual {v4, v12, v13}, Lorg/jivesoftware/smack/PacketCollector;->nextResult(J)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v3

    check-cast v3, Lorg/jivesoftware/smack/packet/Message;

    .line 171
    .local v3, "message":Lorg/jivesoftware/smack/packet/Message;
    :goto_1
    if-eqz v3, :cond_3

    .line 172
    invoke-interface {v6, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 173
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getPacketReplyTimeout()I

    move-result v11

    int-to-long v12, v11

    invoke-virtual {v4, v12, v13}, Lorg/jivesoftware/smack/PacketCollector;->nextResult(J)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v3

    .end local v3    # "message":Lorg/jivesoftware/smack/packet/Message;
    check-cast v3, Lorg/jivesoftware/smack/packet/Message;

    .restart local v3    # "message":Lorg/jivesoftware/smack/packet/Message;
    goto :goto_1

    .line 178
    :cond_3
    invoke-virtual {v4}, Lorg/jivesoftware/smack/PacketCollector;->cancel()V

    .line 179
    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v11

    return-object v11
.end method

.method public supportsFlexibleRetrieval()Z
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 80
    iget-object v1, p0, Lorg/jivesoftware/smackx/OfflineMessageManager;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-static {v1}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->getInstanceFor(Lorg/jivesoftware/smack/Connection;)Lorg/jivesoftware/smackx/ServiceDiscoveryManager;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->discoverInfo(Ljava/lang/String;)Lorg/jivesoftware/smackx/packet/DiscoverInfo;

    move-result-object v0

    .line 81
    .local v0, "info":Lorg/jivesoftware/smackx/packet/DiscoverInfo;
    const-string/jumbo v1, "http://jabber.org/protocol/offline"

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smackx/packet/DiscoverInfo;->containsFeature(Ljava/lang/String;)Z

    move-result v1

    return v1
.end method
