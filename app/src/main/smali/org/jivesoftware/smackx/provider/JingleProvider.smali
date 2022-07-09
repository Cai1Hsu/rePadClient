.class public Lorg/jivesoftware/smackx/provider/JingleProvider;
.super Ljava/lang/Object;
.source "JingleProvider.java"

# interfaces
.implements Lorg/jivesoftware/smack/provider/IQProvider;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    return-void
.end method


# virtual methods
.method public parseIQ(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/IQ;
    .locals 21
    .param p1, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 50
    new-instance v11, Lorg/jivesoftware/smackx/packet/Jingle;

    invoke-direct {v11}, Lorg/jivesoftware/smackx/packet/Jingle;-><init>()V

    .line 51
    .local v11, "jingle":Lorg/jivesoftware/smackx/packet/Jingle;
    const-string/jumbo v17, ""

    .line 53
    .local v17, "sid":Ljava/lang/String;
    const-string/jumbo v8, ""

    .line 54
    .local v8, "initiator":Ljava/lang/String;
    const-string/jumbo v16, ""

    .line 55
    .local v16, "responder":Ljava/lang/String;
    const/4 v5, 0x0

    .line 56
    .local v5, "done":Z
    const/4 v4, 0x0

    .line 59
    .local v4, "currentContent":Lorg/jivesoftware/smackx/packet/JingleContent;
    new-instance v9, Lorg/jivesoftware/smackx/provider/JingleContentProvider;

    invoke-direct {v9}, Lorg/jivesoftware/smackx/provider/JingleContentProvider;-><init>()V

    .line 60
    .local v9, "jcp":Lorg/jivesoftware/smackx/provider/JingleContentProvider;
    new-instance v10, Lorg/jivesoftware/smackx/provider/JingleDescriptionProvider$Audio;

    invoke-direct {v10}, Lorg/jivesoftware/smackx/provider/JingleDescriptionProvider$Audio;-><init>()V

    .line 61
    .local v10, "jdpAudio":Lorg/jivesoftware/smackx/provider/JingleDescriptionProvider;
    new-instance v14, Lorg/jivesoftware/smackx/provider/JingleTransportProvider$RawUdp;

    invoke-direct {v14}, Lorg/jivesoftware/smackx/provider/JingleTransportProvider$RawUdp;-><init>()V

    .line 62
    .local v14, "jtpRawUdp":Lorg/jivesoftware/smackx/provider/JingleTransportProvider;
    new-instance v13, Lorg/jivesoftware/smackx/provider/JingleTransportProvider$Ice;

    invoke-direct {v13}, Lorg/jivesoftware/smackx/provider/JingleTransportProvider$Ice;-><init>()V

    .line 63
    .local v13, "jtpIce":Lorg/jivesoftware/smackx/provider/JingleTransportProvider;
    new-instance v12, Lorg/jivesoftware/smackx/provider/JingleContentInfoProvider$Audio;

    invoke-direct {v12}, Lorg/jivesoftware/smackx/provider/JingleContentInfoProvider$Audio;-><init>()V

    .line 70
    .local v12, "jmipAudio":Lorg/jivesoftware/smackx/provider/JingleContentInfoProvider;
    const-string/jumbo v18, ""

    const-string/jumbo v19, "sid"

    move-object/from16 v0, p1

    move-object/from16 v1, v18

    move-object/from16 v2, v19

    invoke-interface {v0, v1, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 71
    const-string/jumbo v18, ""

    const-string/jumbo v19, "action"

    move-object/from16 v0, p1

    move-object/from16 v1, v18

    move-object/from16 v2, v19

    invoke-interface {v0, v1, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v18 .. v18}, Lorg/jivesoftware/smackx/jingle/JingleActionEnum;->getAction(Ljava/lang/String;)Lorg/jivesoftware/smackx/jingle/JingleActionEnum;

    move-result-object v3

    .line 72
    .local v3, "action":Lorg/jivesoftware/smackx/jingle/JingleActionEnum;
    const-string/jumbo v18, ""

    const-string/jumbo v19, "initiator"

    move-object/from16 v0, p1

    move-object/from16 v1, v18

    move-object/from16 v2, v19

    invoke-interface {v0, v1, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 73
    const-string/jumbo v18, ""

    const-string/jumbo v19, "responder"

    move-object/from16 v0, p1

    move-object/from16 v1, v18

    move-object/from16 v2, v19

    invoke-interface {v0, v1, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    .line 75
    move-object/from16 v0, v17

    invoke-virtual {v11, v0}, Lorg/jivesoftware/smackx/packet/Jingle;->setSid(Ljava/lang/String;)V

    .line 76
    invoke-virtual {v11, v3}, Lorg/jivesoftware/smackx/packet/Jingle;->setAction(Lorg/jivesoftware/smackx/jingle/JingleActionEnum;)V

    .line 77
    invoke-virtual {v11, v8}, Lorg/jivesoftware/smackx/packet/Jingle;->setInitiator(Ljava/lang/String;)V

    .line 78
    move-object/from16 v0, v16

    invoke-virtual {v11, v0}, Lorg/jivesoftware/smackx/packet/Jingle;->setResponder(Ljava/lang/String;)V

    .line 81
    :cond_0
    :goto_0
    if-nez v5, :cond_8

    .line 82
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v7

    .line 83
    .local v7, "eventType":I
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v6

    .line 84
    .local v6, "elementName":Ljava/lang/String;
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->getNamespace()Ljava/lang/String;

    move-result-object v15

    .line 86
    .local v15, "namespace":Ljava/lang/String;
    const/16 v18, 0x2

    move/from16 v0, v18

    if-ne v7, v0, :cond_7

    .line 91
    const-string/jumbo v18, "content"

    move-object/from16 v0, v18

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_1

    .line 93
    move-object/from16 v0, p1

    invoke-virtual {v9, v0}, Lorg/jivesoftware/smackx/provider/JingleContentProvider;->parseExtension(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/PacketExtension;

    move-result-object v4

    .end local v4    # "currentContent":Lorg/jivesoftware/smackx/packet/JingleContent;
    check-cast v4, Lorg/jivesoftware/smackx/packet/JingleContent;

    .line 94
    .restart local v4    # "currentContent":Lorg/jivesoftware/smackx/packet/JingleContent;
    invoke-virtual {v11, v4}, Lorg/jivesoftware/smackx/packet/Jingle;->addContent(Lorg/jivesoftware/smackx/packet/JingleContent;)V

    goto :goto_0

    .line 95
    :cond_1
    const-string/jumbo v18, "description"

    move-object/from16 v0, v18

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_2

    const-string/jumbo v18, "urn:xmpp:tmp:jingle:apps:rtp"

    move-object/from16 v0, v18

    invoke-virtual {v15, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_2

    .line 97
    move-object/from16 v0, p1

    invoke-virtual {v10, v0}, Lorg/jivesoftware/smackx/provider/JingleDescriptionProvider;->parseExtension(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/PacketExtension;

    move-result-object v18

    check-cast v18, Lorg/jivesoftware/smackx/packet/JingleDescription;

    move-object/from16 v0, v18

    invoke-virtual {v4, v0}, Lorg/jivesoftware/smackx/packet/JingleContent;->setDescription(Lorg/jivesoftware/smackx/packet/JingleDescription;)V

    goto :goto_0

    .line 98
    :cond_2
    const-string/jumbo v18, "transport"

    move-object/from16 v0, v18

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_5

    .line 102
    const-string/jumbo v18, "http://www.xmpp.org/extensions/xep-0177.html#ns"

    move-object/from16 v0, v18

    invoke-virtual {v15, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_3

    .line 103
    move-object/from16 v0, p1

    invoke-virtual {v14, v0}, Lorg/jivesoftware/smackx/provider/JingleTransportProvider;->parseExtension(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/PacketExtension;

    move-result-object v18

    check-cast v18, Lorg/jivesoftware/smackx/packet/JingleTransport;

    move-object/from16 v0, v18

    invoke-virtual {v4, v0}, Lorg/jivesoftware/smackx/packet/JingleContent;->addJingleTransport(Lorg/jivesoftware/smackx/packet/JingleTransport;)V

    goto :goto_0

    .line 104
    :cond_3
    const-string/jumbo v18, "urn:xmpp:tmp:jingle:transports:ice-udp"

    move-object/from16 v0, v18

    invoke-virtual {v15, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_4

    .line 105
    move-object/from16 v0, p1

    invoke-virtual {v13, v0}, Lorg/jivesoftware/smackx/provider/JingleTransportProvider;->parseExtension(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/PacketExtension;

    move-result-object v18

    check-cast v18, Lorg/jivesoftware/smackx/packet/JingleTransport;

    move-object/from16 v0, v18

    invoke-virtual {v4, v0}, Lorg/jivesoftware/smackx/packet/JingleContent;->addJingleTransport(Lorg/jivesoftware/smackx/packet/JingleTransport;)V

    goto/16 :goto_0

    .line 107
    :cond_4
    new-instance v18, Lorg/jivesoftware/smack/XMPPException;

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v20, "Unknown transport namespace \""

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string/jumbo v20, "\" in Jingle packet."

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-direct/range {v18 .. v19}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v18

    .line 109
    :cond_5
    const-string/jumbo v18, "urn:xmpp:tmp:jingle:apps:rtp"

    move-object/from16 v0, v18

    invoke-virtual {v15, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_6

    .line 110
    move-object/from16 v0, p1

    invoke-virtual {v12, v0}, Lorg/jivesoftware/smackx/provider/JingleContentInfoProvider;->parseExtension(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/PacketExtension;

    move-result-object v18

    check-cast v18, Lorg/jivesoftware/smackx/packet/JingleContentInfo;

    move-object/from16 v0, v18

    invoke-virtual {v11, v0}, Lorg/jivesoftware/smackx/packet/Jingle;->setContentInfo(Lorg/jivesoftware/smackx/packet/JingleContentInfo;)V

    goto/16 :goto_0

    .line 112
    :cond_6
    new-instance v18, Lorg/jivesoftware/smack/XMPPException;

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v20, "Unknown combination of namespace \""

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string/jumbo v20, "\" and element name \""

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string/jumbo v20, "\" in Jingle packet."

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-direct/range {v18 .. v19}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v18

    .line 116
    :cond_7
    const/16 v18, 0x3

    move/from16 v0, v18

    if-ne v7, v0, :cond_0

    .line 117
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v18

    invoke-static {}, Lorg/jivesoftware/smackx/packet/Jingle;->getElementName()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_0

    .line 118
    const/4 v5, 0x1

    goto/16 :goto_0

    .line 123
    .end local v6    # "elementName":Ljava/lang/String;
    .end local v7    # "eventType":I
    .end local v15    # "namespace":Ljava/lang/String;
    :cond_8
    return-object v11
.end method
