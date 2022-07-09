.class public Lorg/jivesoftware/smackx/MultipleRecipientManager;
.super Ljava/lang/Object;
.source "MultipleRecipientManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jivesoftware/smackx/MultipleRecipientManager$PacketCopy;
    }
.end annotation


# static fields
.field private static services:Lorg/jivesoftware/smack/util/Cache;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/jivesoftware/smack/util/Cache",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    .line 50
    new-instance v0, Lorg/jivesoftware/smack/util/Cache;

    const/16 v1, 0x64

    const-wide/32 v2, 0x5265c00

    invoke-direct {v0, v1, v2, v3}, Lorg/jivesoftware/smack/util/Cache;-><init>(IJ)V

    sput-object v0, Lorg/jivesoftware/smackx/MultipleRecipientManager;->services:Lorg/jivesoftware/smack/util/Cache;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 333
    return-void
.end method

.method private static getMultipleRecipienServiceAddress(Lorg/jivesoftware/smack/Connection;)Ljava/lang/String;
    .locals 12
    .param p0, "connection"    # Lorg/jivesoftware/smack/Connection;

    .prologue
    .line 284
    invoke-virtual {p0}, Lorg/jivesoftware/smack/Connection;->getServiceName()Ljava/lang/String;

    move-result-object v7

    .line 285
    .local v7, "serviceName":Ljava/lang/String;
    sget-object v8, Lorg/jivesoftware/smackx/MultipleRecipientManager;->services:Lorg/jivesoftware/smack/util/Cache;

    invoke-virtual {v8, v7}, Lorg/jivesoftware/smack/util/Cache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 286
    .local v6, "serviceAddress":Ljava/lang/String;
    if-nez v6, :cond_2

    .line 287
    sget-object v9, Lorg/jivesoftware/smackx/MultipleRecipientManager;->services:Lorg/jivesoftware/smack/util/Cache;

    monitor-enter v9

    .line 288
    :try_start_0
    sget-object v8, Lorg/jivesoftware/smackx/MultipleRecipientManager;->services:Lorg/jivesoftware/smack/util/Cache;

    invoke-virtual {v8, v7}, Lorg/jivesoftware/smack/util/Cache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    move-object v0, v8

    check-cast v0, Ljava/lang/String;

    move-object v6, v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 289
    if-nez v6, :cond_1

    .line 293
    :try_start_1
    invoke-static {p0}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->getInstanceFor(Lorg/jivesoftware/smack/Connection;)Lorg/jivesoftware/smackx/ServiceDiscoveryManager;

    move-result-object v8

    invoke-virtual {v8, v7}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->discoverInfo(Ljava/lang/String;)Lorg/jivesoftware/smackx/packet/DiscoverInfo;

    move-result-object v2

    .line 296
    .local v2, "info":Lorg/jivesoftware/smackx/packet/DiscoverInfo;
    const-string/jumbo v8, "http://jabber.org/protocol/address"

    invoke-virtual {v2, v8}, Lorg/jivesoftware/smackx/packet/DiscoverInfo;->containsFeature(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_4

    .line 297
    move-object v6, v7

    .line 315
    :cond_0
    :goto_0
    sget-object v10, Lorg/jivesoftware/smackx/MultipleRecipientManager;->services:Lorg/jivesoftware/smack/util/Cache;

    if-nez v6, :cond_6

    const-string/jumbo v8, ""

    :goto_1
    invoke-virtual {v10, v7, v8}, Lorg/jivesoftware/smack/util/Cache;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catch Lorg/jivesoftware/smack/XMPPException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 321
    .end local v2    # "info":Lorg/jivesoftware/smackx/packet/DiscoverInfo;
    :cond_1
    :goto_2
    :try_start_2
    monitor-exit v9
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 324
    :cond_2
    const-string/jumbo v8, ""

    invoke-virtual {v8, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_3

    const/4 v6, 0x0

    .end local v6    # "serviceAddress":Ljava/lang/String;
    :cond_3
    return-object v6

    .line 301
    .restart local v2    # "info":Lorg/jivesoftware/smackx/packet/DiscoverInfo;
    .restart local v6    # "serviceAddress":Ljava/lang/String;
    :cond_4
    :try_start_3
    invoke-static {p0}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->getInstanceFor(Lorg/jivesoftware/smack/Connection;)Lorg/jivesoftware/smackx/ServiceDiscoveryManager;

    move-result-object v8

    invoke-virtual {v8, v7}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->discoverItems(Ljava/lang/String;)Lorg/jivesoftware/smackx/packet/DiscoverItems;

    move-result-object v5

    .line 303
    .local v5, "items":Lorg/jivesoftware/smackx/packet/DiscoverItems;
    invoke-virtual {v5}, Lorg/jivesoftware/smackx/packet/DiscoverItems;->getItems()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/jivesoftware/smackx/packet/DiscoverItems$Item;>;"
    :cond_5
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_0

    .line 304
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/jivesoftware/smackx/packet/DiscoverItems$Item;

    .line 305
    .local v4, "item":Lorg/jivesoftware/smackx/packet/DiscoverItems$Item;
    invoke-static {p0}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->getInstanceFor(Lorg/jivesoftware/smack/Connection;)Lorg/jivesoftware/smackx/ServiceDiscoveryManager;

    move-result-object v8

    invoke-virtual {v4}, Lorg/jivesoftware/smackx/packet/DiscoverItems$Item;->getEntityID()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v4}, Lorg/jivesoftware/smackx/packet/DiscoverItems$Item;->getNode()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v8, v10, v11}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->discoverInfo(Ljava/lang/String;Ljava/lang/String;)Lorg/jivesoftware/smackx/packet/DiscoverInfo;

    move-result-object v2

    .line 307
    const-string/jumbo v8, "http://jabber.org/protocol/address"

    invoke-virtual {v2, v8}, Lorg/jivesoftware/smackx/packet/DiscoverInfo;->containsFeature(Ljava/lang/String;)Z
    :try_end_3
    .catch Lorg/jivesoftware/smack/XMPPException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    move-result v8

    if-eqz v8, :cond_5

    .line 308
    move-object v6, v7

    .line 309
    goto :goto_0

    .end local v3    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/jivesoftware/smackx/packet/DiscoverItems$Item;>;"
    .end local v4    # "item":Lorg/jivesoftware/smackx/packet/DiscoverItems$Item;
    .end local v5    # "items":Lorg/jivesoftware/smackx/packet/DiscoverItems;
    :cond_6
    move-object v8, v6

    .line 315
    goto :goto_1

    .line 317
    .end local v2    # "info":Lorg/jivesoftware/smackx/packet/DiscoverInfo;
    :catch_0
    move-exception v1

    .line 318
    .local v1, "e":Lorg/jivesoftware/smack/XMPPException;
    :try_start_4
    invoke-virtual {v1}, Lorg/jivesoftware/smack/XMPPException;->printStackTrace()V

    goto :goto_2

    .line 321
    .end local v1    # "e":Lorg/jivesoftware/smack/XMPPException;
    :catchall_0
    move-exception v8

    monitor-exit v9
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    throw v8
.end method

.method public static getMultipleRecipientInfo(Lorg/jivesoftware/smack/packet/Packet;)Lorg/jivesoftware/smackx/MultipleRecipientInfo;
    .locals 3
    .param p0, "packet"    # Lorg/jivesoftware/smack/packet/Packet;

    .prologue
    .line 199
    const-string/jumbo v1, "addresses"

    const-string/jumbo v2, "http://jabber.org/protocol/address"

    invoke-virtual {p0, v1, v2}, Lorg/jivesoftware/smack/packet/Packet;->getExtension(Ljava/lang/String;Ljava/lang/String;)Lorg/jivesoftware/smack/packet/PacketExtension;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smackx/packet/MultipleAddresses;

    .line 201
    .local v0, "extension":Lorg/jivesoftware/smackx/packet/MultipleAddresses;
    if-nez v0, :cond_0

    const/4 v1, 0x0

    :goto_0
    return-object v1

    :cond_0
    new-instance v1, Lorg/jivesoftware/smackx/MultipleRecipientInfo;

    invoke-direct {v1, v0}, Lorg/jivesoftware/smackx/MultipleRecipientInfo;-><init>(Lorg/jivesoftware/smackx/packet/MultipleAddresses;)V

    goto :goto_0
.end method

.method public static reply(Lorg/jivesoftware/smack/Connection;Lorg/jivesoftware/smack/packet/Message;Lorg/jivesoftware/smack/packet/Message;)V
    .locals 17
    .param p0, "connection"    # Lorg/jivesoftware/smack/Connection;
    .param p1, "original"    # Lorg/jivesoftware/smack/packet/Message;
    .param p2, "reply"    # Lorg/jivesoftware/smack/packet/Message;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 132
    invoke-static/range {p1 .. p1}, Lorg/jivesoftware/smackx/MultipleRecipientManager;->getMultipleRecipientInfo(Lorg/jivesoftware/smack/packet/Packet;)Lorg/jivesoftware/smackx/MultipleRecipientInfo;

    move-result-object v13

    .line 133
    .local v13, "info":Lorg/jivesoftware/smackx/MultipleRecipientInfo;
    if-nez v13, :cond_0

    .line 134
    new-instance v2, Lorg/jivesoftware/smack/XMPPException;

    const-string/jumbo v3, "Original message does not contain multiple recipient info"

    invoke-direct {v2, v3}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 136
    :cond_0
    invoke-virtual {v13}, Lorg/jivesoftware/smackx/MultipleRecipientInfo;->shouldNotReply()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 137
    new-instance v2, Lorg/jivesoftware/smack/XMPPException;

    const-string/jumbo v3, "Original message should not be replied"

    invoke-direct {v2, v3}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 139
    :cond_1
    invoke-virtual {v13}, Lorg/jivesoftware/smackx/MultipleRecipientInfo;->getReplyRoom()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_2

    .line 140
    new-instance v2, Lorg/jivesoftware/smack/XMPPException;

    const-string/jumbo v3, "Reply should be sent through a room"

    invoke-direct {v2, v3}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 143
    :cond_2
    invoke-virtual/range {p1 .. p1}, Lorg/jivesoftware/smack/packet/Message;->getThread()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_3

    .line 144
    invoke-virtual/range {p1 .. p1}, Lorg/jivesoftware/smack/packet/Message;->getThread()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p2

    invoke-virtual {v0, v2}, Lorg/jivesoftware/smack/packet/Message;->setThread(Ljava/lang/String;)V

    .line 146
    :cond_3
    invoke-virtual {v13}, Lorg/jivesoftware/smackx/MultipleRecipientInfo;->getReplyAddress()Lorg/jivesoftware/smackx/packet/MultipleAddresses$Address;

    move-result-object v16

    .line 147
    .local v16, "replyAddress":Lorg/jivesoftware/smackx/packet/MultipleAddresses$Address;
    if-eqz v16, :cond_4

    invoke-virtual/range {v16 .. v16}, Lorg/jivesoftware/smackx/packet/MultipleAddresses$Address;->getJid()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_4

    .line 149
    invoke-virtual/range {v16 .. v16}, Lorg/jivesoftware/smackx/packet/MultipleAddresses$Address;->getJid()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p2

    invoke-virtual {v0, v2}, Lorg/jivesoftware/smack/packet/Message;->setTo(Ljava/lang/String;)V

    .line 150
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 187
    :goto_0
    return-void

    .line 154
    :cond_4
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 155
    .local v4, "to":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 156
    .local v5, "cc":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-virtual {v13}, Lorg/jivesoftware/smackx/MultipleRecipientInfo;->getTOAddresses()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v14

    .local v14, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/jivesoftware/smackx/packet/MultipleAddresses$Address;>;"
    :goto_1
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_5

    .line 157
    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/jivesoftware/smackx/packet/MultipleAddresses$Address;

    invoke-virtual {v2}, Lorg/jivesoftware/smackx/packet/MultipleAddresses$Address;->getJid()Ljava/lang/String;

    move-result-object v15

    .line 158
    .local v15, "jid":Ljava/lang/String;
    invoke-interface {v4, v15}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 160
    .end local v15    # "jid":Ljava/lang/String;
    :cond_5
    invoke-virtual {v13}, Lorg/jivesoftware/smackx/MultipleRecipientInfo;->getCCAddresses()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v14

    :goto_2
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_6

    .line 161
    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/jivesoftware/smackx/packet/MultipleAddresses$Address;

    invoke-virtual {v2}, Lorg/jivesoftware/smackx/packet/MultipleAddresses$Address;->getJid()Ljava/lang/String;

    move-result-object v15

    .line 162
    .restart local v15    # "jid":Ljava/lang/String;
    invoke-interface {v5, v15}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 165
    .end local v15    # "jid":Ljava/lang/String;
    :cond_6
    invoke-virtual/range {p1 .. p1}, Lorg/jivesoftware/smack/packet/Message;->getFrom()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v4, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_7

    invoke-virtual/range {p1 .. p1}, Lorg/jivesoftware/smack/packet/Message;->getFrom()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v5, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_7

    .line 166
    invoke-virtual/range {p1 .. p1}, Lorg/jivesoftware/smack/packet/Message;->getFrom()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v4, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 169
    :cond_7
    invoke-virtual/range {p0 .. p0}, Lorg/jivesoftware/smack/Connection;->getUser()Ljava/lang/String;

    move-result-object v12

    .line 170
    .local v12, "from":Ljava/lang/String;
    invoke-interface {v4, v12}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_8

    invoke-interface {v5, v12}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_8

    .line 171
    invoke-static {v12}, Lorg/jivesoftware/smack/util/StringUtils;->parseBareAddress(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 172
    .local v11, "bareJID":Ljava/lang/String;
    invoke-interface {v4, v11}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 173
    invoke-interface {v5, v11}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 176
    .end local v11    # "bareJID":Ljava/lang/String;
    :cond_8
    invoke-static/range {p0 .. p0}, Lorg/jivesoftware/smackx/MultipleRecipientManager;->getMultipleRecipienServiceAddress(Lorg/jivesoftware/smack/Connection;)Ljava/lang/String;

    move-result-object v10

    .line 177
    .local v10, "serviceAddress":Ljava/lang/String;
    if-eqz v10, :cond_9

    .line 179
    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    move-object/from16 v2, p0

    move-object/from16 v3, p2

    invoke-static/range {v2 .. v10}, Lorg/jivesoftware/smackx/MultipleRecipientManager;->sendThroughService(Lorg/jivesoftware/smack/Connection;Lorg/jivesoftware/smack/packet/Packet;Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)V

    goto/16 :goto_0

    .line 184
    :cond_9
    const/4 v2, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-static {v0, v1, v4, v5, v2}, Lorg/jivesoftware/smackx/MultipleRecipientManager;->sendToIndividualRecipients(Lorg/jivesoftware/smack/Connection;Lorg/jivesoftware/smack/packet/Packet;Ljava/util/List;Ljava/util/List;Ljava/util/List;)V

    goto/16 :goto_0
.end method

.method public static send(Lorg/jivesoftware/smack/Connection;Lorg/jivesoftware/smack/packet/Packet;Ljava/util/List;Ljava/util/List;Ljava/util/List;)V
    .locals 8
    .param p0, "connection"    # Lorg/jivesoftware/smack/Connection;
    .param p1, "packet"    # Lorg/jivesoftware/smack/packet/Packet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jivesoftware/smack/Connection;",
            "Lorg/jivesoftware/smack/packet/Packet;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
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
    .local p2, "to":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .local p3, "cc":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .local p4, "bcc":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v5, 0x0

    .line 72
    const/4 v7, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v6, v5

    invoke-static/range {v0 .. v7}, Lorg/jivesoftware/smackx/MultipleRecipientManager;->send(Lorg/jivesoftware/smack/Connection;Lorg/jivesoftware/smack/packet/Packet;Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 73
    return-void
.end method

.method public static send(Lorg/jivesoftware/smack/Connection;Lorg/jivesoftware/smack/packet/Packet;Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 9
    .param p0, "connection"    # Lorg/jivesoftware/smack/Connection;
    .param p1, "packet"    # Lorg/jivesoftware/smack/packet/Packet;
    .param p5, "replyTo"    # Ljava/lang/String;
    .param p6, "replyRoom"    # Ljava/lang/String;
    .param p7, "noReply"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jivesoftware/smack/Connection;",
            "Lorg/jivesoftware/smack/packet/Packet;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Z)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 100
    .local p2, "to":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .local p3, "cc":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .local p4, "bcc":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-static {p0}, Lorg/jivesoftware/smackx/MultipleRecipientManager;->getMultipleRecipienServiceAddress(Lorg/jivesoftware/smack/Connection;)Ljava/lang/String;

    move-result-object v8

    .line 101
    .local v8, "serviceAddress":Ljava/lang/String;
    if-eqz v8, :cond_0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    move-object v6, p6

    move/from16 v7, p7

    .line 103
    invoke-static/range {v0 .. v8}, Lorg/jivesoftware/smackx/MultipleRecipientManager;->sendThroughService(Lorg/jivesoftware/smack/Connection;Lorg/jivesoftware/smack/packet/Packet;Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)V

    .line 117
    :goto_0
    return-void

    .line 108
    :cond_0
    if-nez p7, :cond_2

    if-eqz p5, :cond_1

    invoke-virtual {p5}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-gtz v0, :cond_2

    :cond_1
    if-eqz p6, :cond_3

    invoke-virtual {p6}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_3

    .line 112
    :cond_2
    new-instance v0, Lorg/jivesoftware/smack/XMPPException;

    const-string/jumbo v1, "Extended Stanza Addressing not supported by server"

    invoke-direct {v0, v1}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 115
    :cond_3
    invoke-static {p0, p1, p2, p3, p4}, Lorg/jivesoftware/smackx/MultipleRecipientManager;->sendToIndividualRecipients(Lorg/jivesoftware/smack/Connection;Lorg/jivesoftware/smack/packet/Packet;Ljava/util/List;Ljava/util/List;Ljava/util/List;)V

    goto :goto_0
.end method

.method private static sendThroughService(Lorg/jivesoftware/smack/Connection;Lorg/jivesoftware/smack/packet/Packet;Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)V
    .locals 12
    .param p0, "connection"    # Lorg/jivesoftware/smack/Connection;
    .param p1, "packet"    # Lorg/jivesoftware/smack/packet/Packet;
    .param p5, "replyTo"    # Ljava/lang/String;
    .param p6, "replyRoom"    # Ljava/lang/String;
    .param p7, "noReply"    # Z
    .param p8, "serviceAddress"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jivesoftware/smack/Connection;",
            "Lorg/jivesoftware/smack/packet/Packet;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Z",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 233
    .local p2, "to":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .local p3, "cc":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .local p4, "bcc":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    new-instance v1, Lorg/jivesoftware/smackx/packet/MultipleAddresses;

    invoke-direct {v1}, Lorg/jivesoftware/smackx/packet/MultipleAddresses;-><init>()V

    .line 234
    .local v1, "multipleAddresses":Lorg/jivesoftware/smackx/packet/MultipleAddresses;
    if-eqz p2, :cond_0

    .line 235
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v11

    .local v11, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :goto_0
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 236
    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 237
    .local v3, "jid":Ljava/lang/String;
    const-string/jumbo v2, "to"

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual/range {v1 .. v7}, Lorg/jivesoftware/smackx/packet/MultipleAddresses;->addAddress(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)V

    goto :goto_0

    .line 240
    .end local v3    # "jid":Ljava/lang/String;
    .end local v11    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_0
    if-eqz p3, :cond_1

    .line 241
    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v11

    .restart local v11    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :goto_1
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 242
    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 243
    .restart local v3    # "jid":Ljava/lang/String;
    const-string/jumbo v2, "cc"

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual/range {v1 .. v7}, Lorg/jivesoftware/smackx/packet/MultipleAddresses;->addAddress(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)V

    goto :goto_1

    .line 246
    .end local v3    # "jid":Ljava/lang/String;
    .end local v11    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_1
    if-eqz p4, :cond_2

    .line 247
    invoke-interface/range {p4 .. p4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v11

    .restart local v11    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :goto_2
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 248
    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 249
    .restart local v3    # "jid":Ljava/lang/String;
    const-string/jumbo v2, "bcc"

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual/range {v1 .. v7}, Lorg/jivesoftware/smackx/packet/MultipleAddresses;->addAddress(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)V

    goto :goto_2

    .line 252
    .end local v3    # "jid":Ljava/lang/String;
    .end local v11    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_2
    if-eqz p7, :cond_4

    .line 253
    invoke-virtual {v1}, Lorg/jivesoftware/smackx/packet/MultipleAddresses;->setNoReply()V

    .line 266
    :cond_3
    :goto_3
    move-object/from16 v0, p8

    invoke-virtual {p1, v0}, Lorg/jivesoftware/smack/packet/Packet;->setTo(Ljava/lang/String;)V

    .line 268
    invoke-virtual {p1, v1}, Lorg/jivesoftware/smack/packet/Packet;->addExtension(Lorg/jivesoftware/smack/packet/PacketExtension;)V

    .line 270
    invoke-virtual {p0, p1}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 271
    return-void

    .line 256
    :cond_4
    if-eqz p5, :cond_5

    invoke-virtual/range {p5 .. p5}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_5

    .line 257
    const-string/jumbo v5, "replyto"

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    move-object v4, v1

    move-object/from16 v6, p5

    invoke-virtual/range {v4 .. v10}, Lorg/jivesoftware/smackx/packet/MultipleAddresses;->addAddress(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)V

    .line 260
    :cond_5
    if-eqz p6, :cond_3

    invoke-virtual/range {p6 .. p6}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_3

    .line 261
    const-string/jumbo v5, "replyroom"

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    move-object v4, v1

    move-object/from16 v6, p6

    invoke-virtual/range {v4 .. v10}, Lorg/jivesoftware/smackx/packet/MultipleAddresses;->addAddress(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)V

    goto :goto_3
.end method

.method private static sendToIndividualRecipients(Lorg/jivesoftware/smack/Connection;Lorg/jivesoftware/smack/packet/Packet;Ljava/util/List;Ljava/util/List;Ljava/util/List;)V
    .locals 4
    .param p0, "connection"    # Lorg/jivesoftware/smack/Connection;
    .param p1, "packet"    # Lorg/jivesoftware/smack/packet/Packet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jivesoftware/smack/Connection;",
            "Lorg/jivesoftware/smack/packet/Packet;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 206
    .local p2, "to":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .local p3, "cc":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .local p4, "bcc":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-eqz p2, :cond_0

    .line 207
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 208
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 209
    .local v1, "jid":Ljava/lang/String;
    invoke-virtual {p1, v1}, Lorg/jivesoftware/smack/packet/Packet;->setTo(Ljava/lang/String;)V

    .line 210
    new-instance v2, Lorg/jivesoftware/smackx/MultipleRecipientManager$PacketCopy;

    invoke-virtual {p1}, Lorg/jivesoftware/smack/packet/Packet;->toXML()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/jivesoftware/smackx/MultipleRecipientManager$PacketCopy;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v2}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    goto :goto_0

    .line 213
    .end local v0    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    .end local v1    # "jid":Ljava/lang/String;
    :cond_0
    if-eqz p3, :cond_1

    .line 214
    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .restart local v0    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 215
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 216
    .restart local v1    # "jid":Ljava/lang/String;
    invoke-virtual {p1, v1}, Lorg/jivesoftware/smack/packet/Packet;->setTo(Ljava/lang/String;)V

    .line 217
    new-instance v2, Lorg/jivesoftware/smackx/MultipleRecipientManager$PacketCopy;

    invoke-virtual {p1}, Lorg/jivesoftware/smack/packet/Packet;->toXML()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/jivesoftware/smackx/MultipleRecipientManager$PacketCopy;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v2}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    goto :goto_1

    .line 220
    .end local v0    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    .end local v1    # "jid":Ljava/lang/String;
    :cond_1
    if-eqz p4, :cond_2

    .line 221
    invoke-interface {p4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .restart local v0    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 222
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 223
    .restart local v1    # "jid":Ljava/lang/String;
    invoke-virtual {p1, v1}, Lorg/jivesoftware/smack/packet/Packet;->setTo(Ljava/lang/String;)V

    .line 224
    new-instance v2, Lorg/jivesoftware/smackx/MultipleRecipientManager$PacketCopy;

    invoke-virtual {p1}, Lorg/jivesoftware/smack/packet/Packet;->toXML()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/jivesoftware/smackx/MultipleRecipientManager$PacketCopy;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v2}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    goto :goto_2

    .line 227
    .end local v0    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    .end local v1    # "jid":Ljava/lang/String;
    :cond_2
    return-void
.end method
