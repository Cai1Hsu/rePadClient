.class public Lorg/jivesoftware/smackx/workgroup/packet/OfferRequestProvider;
.super Ljava/lang/Object;
.source "OfferRequestProvider.java"

# interfaces
.implements Lorg/jivesoftware/smack/provider/IQProvider;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jivesoftware/smackx/workgroup/packet/OfferRequestProvider$OfferRequestPacket;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    return-void
.end method


# virtual methods
.method public parseIQ(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/IQ;
    .locals 16
    .param p1, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 48
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v10

    .line 49
    .local v10, "eventType":I
    const/4 v6, 0x0

    .line 50
    .local v6, "sessionID":Ljava/lang/String;
    const/4 v4, -0x1

    .line 51
    .local v4, "timeout":I
    const/4 v7, 0x0

    .line 52
    .local v7, "content":Lorg/jivesoftware/smackx/workgroup/agent/OfferContent;
    const/4 v8, 0x0

    .line 53
    .local v8, "done":Z
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    .line 55
    .local v5, "metaData":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    const/4 v13, 0x2

    if-eq v10, v13, :cond_0

    .line 59
    :cond_0
    const-string/jumbo v13, ""

    const-string/jumbo v14, "jid"

    move-object/from16 v0, p1

    invoke-interface {v0, v13, v14}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 61
    .local v2, "userJID":Ljava/lang/String;
    move-object v3, v2

    .line 63
    .local v3, "userID":Ljava/lang/String;
    :cond_1
    :goto_0
    if-nez v8, :cond_9

    .line 64
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v10

    .line 66
    const/4 v13, 0x2

    if-ne v10, v13, :cond_8

    .line 67
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v9

    .line 69
    .local v9, "elemName":Ljava/lang/String;
    const-string/jumbo v13, "timeout"

    invoke-virtual {v13, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_2

    .line 70
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    goto :goto_0

    .line 72
    :cond_2
    const-string/jumbo v13, "metadata"

    invoke-virtual {v13, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_3

    .line 73
    invoke-static/range {p1 .. p1}, Lorg/jivesoftware/smackx/workgroup/util/MetaDataUtils;->parseMetaData(Lorg/xmlpull/v1/XmlPullParser;)Ljava/util/Map;

    move-result-object v5

    goto :goto_0

    .line 75
    :cond_3
    const-string/jumbo v13, "session"

    invoke-virtual {v13, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_4

    .line 76
    const-string/jumbo v13, ""

    const-string/jumbo v14, "id"

    move-object/from16 v0, p1

    invoke-interface {v0, v13, v14}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    goto :goto_0

    .line 78
    :cond_4
    const-string/jumbo v13, "user"

    invoke-virtual {v13, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_5

    .line 79
    const-string/jumbo v13, ""

    const-string/jumbo v14, "id"

    move-object/from16 v0, p1

    invoke-interface {v0, v13, v14}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    goto :goto_0

    .line 81
    :cond_5
    const-string/jumbo v13, "user-request"

    invoke-virtual {v13, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_6

    .line 82
    invoke-static {}, Lorg/jivesoftware/smackx/workgroup/agent/UserRequest;->getInstance()Lorg/jivesoftware/smackx/workgroup/agent/OfferContent;

    move-result-object v7

    goto :goto_0

    .line 84
    :cond_6
    const-string/jumbo v13, "invite"

    invoke-virtual {v13, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_7

    .line 85
    const-string/jumbo v13, "invite"

    const-string/jumbo v14, "http://jabber.org/protocol/workgroup"

    move-object/from16 v0, p1

    invoke-static {v13, v14, v0}, Lorg/jivesoftware/smack/util/PacketParserUtils;->parsePacketExtension(Ljava/lang/String;Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/PacketExtension;

    move-result-object v11

    check-cast v11, Lorg/jivesoftware/smackx/workgroup/packet/RoomInvitation;

    .line 87
    .local v11, "invitation":Lorg/jivesoftware/smackx/workgroup/packet/RoomInvitation;
    new-instance v7, Lorg/jivesoftware/smackx/workgroup/agent/InvitationRequest;

    .end local v7    # "content":Lorg/jivesoftware/smackx/workgroup/agent/OfferContent;
    invoke-virtual {v11}, Lorg/jivesoftware/smackx/workgroup/packet/RoomInvitation;->getInviter()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v11}, Lorg/jivesoftware/smackx/workgroup/packet/RoomInvitation;->getRoom()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v11}, Lorg/jivesoftware/smackx/workgroup/packet/RoomInvitation;->getReason()Ljava/lang/String;

    move-result-object v15

    invoke-direct {v7, v13, v14, v15}, Lorg/jivesoftware/smackx/workgroup/agent/InvitationRequest;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 89
    .restart local v7    # "content":Lorg/jivesoftware/smackx/workgroup/agent/OfferContent;
    goto/16 :goto_0

    .line 90
    .end local v11    # "invitation":Lorg/jivesoftware/smackx/workgroup/packet/RoomInvitation;
    :cond_7
    const-string/jumbo v13, "transfer"

    invoke-virtual {v13, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_1

    .line 91
    const-string/jumbo v13, "transfer"

    const-string/jumbo v14, "http://jabber.org/protocol/workgroup"

    move-object/from16 v0, p1

    invoke-static {v13, v14, v0}, Lorg/jivesoftware/smack/util/PacketParserUtils;->parsePacketExtension(Ljava/lang/String;Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/PacketExtension;

    move-result-object v12

    check-cast v12, Lorg/jivesoftware/smackx/workgroup/packet/RoomTransfer;

    .line 93
    .local v12, "transfer":Lorg/jivesoftware/smackx/workgroup/packet/RoomTransfer;
    new-instance v7, Lorg/jivesoftware/smackx/workgroup/agent/TransferRequest;

    .end local v7    # "content":Lorg/jivesoftware/smackx/workgroup/agent/OfferContent;
    invoke-virtual {v12}, Lorg/jivesoftware/smackx/workgroup/packet/RoomTransfer;->getInviter()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12}, Lorg/jivesoftware/smackx/workgroup/packet/RoomTransfer;->getRoom()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v12}, Lorg/jivesoftware/smackx/workgroup/packet/RoomTransfer;->getReason()Ljava/lang/String;

    move-result-object v15

    invoke-direct {v7, v13, v14, v15}, Lorg/jivesoftware/smackx/workgroup/agent/TransferRequest;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .restart local v7    # "content":Lorg/jivesoftware/smackx/workgroup/agent/OfferContent;
    goto/16 :goto_0

    .line 96
    .end local v9    # "elemName":Ljava/lang/String;
    .end local v12    # "transfer":Lorg/jivesoftware/smackx/workgroup/packet/RoomTransfer;
    :cond_8
    const/4 v13, 0x3

    if-ne v10, v13, :cond_1

    .line 97
    const-string/jumbo v13, "offer"

    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_1

    .line 98
    const/4 v8, 0x1

    goto/16 :goto_0

    .line 103
    :cond_9
    new-instance v1, Lorg/jivesoftware/smackx/workgroup/packet/OfferRequestProvider$OfferRequestPacket;

    invoke-direct/range {v1 .. v7}, Lorg/jivesoftware/smackx/workgroup/packet/OfferRequestProvider$OfferRequestPacket;-><init>(Ljava/lang/String;Ljava/lang/String;ILjava/util/Map;Ljava/lang/String;Lorg/jivesoftware/smackx/workgroup/agent/OfferContent;)V

    .line 105
    .local v1, "offerRequest":Lorg/jivesoftware/smackx/workgroup/packet/OfferRequestProvider$OfferRequestPacket;
    sget-object v13, Lorg/jivesoftware/smack/packet/IQ$Type;->SET:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {v1, v13}, Lorg/jivesoftware/smackx/workgroup/packet/OfferRequestProvider$OfferRequestPacket;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 107
    return-object v1
.end method
