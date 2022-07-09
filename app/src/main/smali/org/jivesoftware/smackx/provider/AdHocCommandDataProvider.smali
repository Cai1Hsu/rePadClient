.class public Lorg/jivesoftware/smackx/provider/AdHocCommandDataProvider;
.super Ljava/lang/Object;
.source "AdHocCommandDataProvider.java"

# interfaces
.implements Lorg/jivesoftware/smack/provider/IQProvider;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jivesoftware/smackx/provider/AdHocCommandDataProvider$SessionExpiredError;,
        Lorg/jivesoftware/smackx/provider/AdHocCommandDataProvider$BadSessionIDError;,
        Lorg/jivesoftware/smackx/provider/AdHocCommandDataProvider$BadPayloadError;,
        Lorg/jivesoftware/smackx/provider/AdHocCommandDataProvider$BadLocaleError;,
        Lorg/jivesoftware/smackx/provider/AdHocCommandDataProvider$MalformedActionError;,
        Lorg/jivesoftware/smackx/provider/AdHocCommandDataProvider$BadActionError;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 150
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
    .line 44
    const/4 v4, 0x0

    .line 45
    .local v4, "done":Z
    new-instance v2, Lorg/jivesoftware/smackx/packet/AdHocCommandData;

    invoke-direct {v2}, Lorg/jivesoftware/smackx/packet/AdHocCommandData;-><init>()V

    .line 46
    .local v2, "adHocCommandData":Lorg/jivesoftware/smackx/packet/AdHocCommandData;
    new-instance v3, Lorg/jivesoftware/smackx/provider/DataFormProvider;

    invoke-direct {v3}, Lorg/jivesoftware/smackx/provider/DataFormProvider;-><init>()V

    .line 51
    .local v3, "dataFormProvider":Lorg/jivesoftware/smackx/provider/DataFormProvider;
    const-string/jumbo v14, ""

    const-string/jumbo v15, "sessionid"

    move-object/from16 v0, p1

    invoke-interface {v0, v14, v15}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v2, v14}, Lorg/jivesoftware/smackx/packet/AdHocCommandData;->setSessionID(Ljava/lang/String;)V

    .line 52
    const-string/jumbo v14, ""

    const-string/jumbo v15, "node"

    move-object/from16 v0, p1

    invoke-interface {v0, v14, v15}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v2, v14}, Lorg/jivesoftware/smackx/packet/AdHocCommandData;->setNode(Ljava/lang/String;)V

    .line 55
    const-string/jumbo v14, ""

    const-string/jumbo v15, "status"

    move-object/from16 v0, p1

    invoke-interface {v0, v14, v15}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 56
    .local v11, "status":Ljava/lang/String;
    sget-object v14, Lorg/jivesoftware/smackx/commands/AdHocCommand$Status;->executing:Lorg/jivesoftware/smackx/commands/AdHocCommand$Status;

    invoke-virtual {v14}, Lorg/jivesoftware/smackx/commands/AdHocCommand$Status;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v14, v11}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_3

    .line 57
    sget-object v14, Lorg/jivesoftware/smackx/commands/AdHocCommand$Status;->executing:Lorg/jivesoftware/smackx/commands/AdHocCommand$Status;

    invoke-virtual {v2, v14}, Lorg/jivesoftware/smackx/packet/AdHocCommandData;->setStatus(Lorg/jivesoftware/smackx/commands/AdHocCommand$Status;)V

    .line 67
    :cond_0
    :goto_0
    const-string/jumbo v14, ""

    const-string/jumbo v15, "action"

    move-object/from16 v0, p1

    invoke-interface {v0, v14, v15}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 68
    .local v1, "action":Ljava/lang/String;
    if-eqz v1, :cond_2

    .line 69
    invoke-static {v1}, Lorg/jivesoftware/smackx/commands/AdHocCommand$Action;->valueOf(Ljava/lang/String;)Lorg/jivesoftware/smackx/commands/AdHocCommand$Action;

    move-result-object v10

    .line 70
    .local v10, "realAction":Lorg/jivesoftware/smackx/commands/AdHocCommand$Action;
    if-eqz v10, :cond_1

    sget-object v14, Lorg/jivesoftware/smackx/commands/AdHocCommand$Action;->unknown:Lorg/jivesoftware/smackx/commands/AdHocCommand$Action;

    invoke-virtual {v10, v14}, Lorg/jivesoftware/smackx/commands/AdHocCommand$Action;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_5

    .line 71
    :cond_1
    sget-object v14, Lorg/jivesoftware/smackx/commands/AdHocCommand$Action;->unknown:Lorg/jivesoftware/smackx/commands/AdHocCommand$Action;

    invoke-virtual {v2, v14}, Lorg/jivesoftware/smackx/packet/AdHocCommandData;->setAction(Lorg/jivesoftware/smackx/commands/AdHocCommand$Action;)V

    .line 77
    .end local v10    # "realAction":Lorg/jivesoftware/smackx/commands/AdHocCommand$Action;
    :cond_2
    :goto_1
    if-nez v4, :cond_d

    .line 78
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v7

    .line 79
    .local v7, "eventType":I
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v5

    .line 80
    .local v5, "elementName":Ljava/lang/String;
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->getNamespace()Ljava/lang/String;

    move-result-object v9

    .line 81
    .local v9, "namespace":Ljava/lang/String;
    const/4 v14, 0x2

    if-ne v7, v14, :cond_c

    .line 82
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v14

    const-string/jumbo v15, "actions"

    invoke-virtual {v14, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_6

    .line 83
    const-string/jumbo v14, ""

    const-string/jumbo v15, "execute"

    move-object/from16 v0, p1

    invoke-interface {v0, v14, v15}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 84
    .local v8, "execute":Ljava/lang/String;
    if-eqz v8, :cond_2

    .line 85
    invoke-static {v8}, Lorg/jivesoftware/smackx/commands/AdHocCommand$Action;->valueOf(Ljava/lang/String;)Lorg/jivesoftware/smackx/commands/AdHocCommand$Action;

    move-result-object v14

    invoke-virtual {v2, v14}, Lorg/jivesoftware/smackx/packet/AdHocCommandData;->setExecuteAction(Lorg/jivesoftware/smackx/commands/AdHocCommand$Action;)V

    goto :goto_1

    .line 59
    .end local v1    # "action":Ljava/lang/String;
    .end local v5    # "elementName":Ljava/lang/String;
    .end local v7    # "eventType":I
    .end local v8    # "execute":Ljava/lang/String;
    .end local v9    # "namespace":Ljava/lang/String;
    :cond_3
    sget-object v14, Lorg/jivesoftware/smackx/commands/AdHocCommand$Status;->completed:Lorg/jivesoftware/smackx/commands/AdHocCommand$Status;

    invoke-virtual {v14}, Lorg/jivesoftware/smackx/commands/AdHocCommand$Status;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v14, v11}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_4

    .line 60
    sget-object v14, Lorg/jivesoftware/smackx/commands/AdHocCommand$Status;->completed:Lorg/jivesoftware/smackx/commands/AdHocCommand$Status;

    invoke-virtual {v2, v14}, Lorg/jivesoftware/smackx/packet/AdHocCommandData;->setStatus(Lorg/jivesoftware/smackx/commands/AdHocCommand$Status;)V

    goto :goto_0

    .line 62
    :cond_4
    sget-object v14, Lorg/jivesoftware/smackx/commands/AdHocCommand$Status;->canceled:Lorg/jivesoftware/smackx/commands/AdHocCommand$Status;

    invoke-virtual {v14}, Lorg/jivesoftware/smackx/commands/AdHocCommand$Status;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v14, v11}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_0

    .line 63
    sget-object v14, Lorg/jivesoftware/smackx/commands/AdHocCommand$Status;->canceled:Lorg/jivesoftware/smackx/commands/AdHocCommand$Status;

    invoke-virtual {v2, v14}, Lorg/jivesoftware/smackx/packet/AdHocCommandData;->setStatus(Lorg/jivesoftware/smackx/commands/AdHocCommand$Status;)V

    goto :goto_0

    .line 74
    .restart local v1    # "action":Ljava/lang/String;
    .restart local v10    # "realAction":Lorg/jivesoftware/smackx/commands/AdHocCommand$Action;
    :cond_5
    invoke-virtual {v2, v10}, Lorg/jivesoftware/smackx/packet/AdHocCommandData;->setAction(Lorg/jivesoftware/smackx/commands/AdHocCommand$Action;)V

    goto :goto_1

    .line 88
    .end local v10    # "realAction":Lorg/jivesoftware/smackx/commands/AdHocCommand$Action;
    .restart local v5    # "elementName":Ljava/lang/String;
    .restart local v7    # "eventType":I
    .restart local v9    # "namespace":Ljava/lang/String;
    :cond_6
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v14

    const-string/jumbo v15, "next"

    invoke-virtual {v14, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_7

    .line 89
    sget-object v14, Lorg/jivesoftware/smackx/commands/AdHocCommand$Action;->next:Lorg/jivesoftware/smackx/commands/AdHocCommand$Action;

    invoke-virtual {v2, v14}, Lorg/jivesoftware/smackx/packet/AdHocCommandData;->addAction(Lorg/jivesoftware/smackx/commands/AdHocCommand$Action;)V

    goto :goto_1

    .line 91
    :cond_7
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v14

    const-string/jumbo v15, "complete"

    invoke-virtual {v14, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_8

    .line 92
    sget-object v14, Lorg/jivesoftware/smackx/commands/AdHocCommand$Action;->complete:Lorg/jivesoftware/smackx/commands/AdHocCommand$Action;

    invoke-virtual {v2, v14}, Lorg/jivesoftware/smackx/packet/AdHocCommandData;->addAction(Lorg/jivesoftware/smackx/commands/AdHocCommand$Action;)V

    goto/16 :goto_1

    .line 94
    :cond_8
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v14

    const-string/jumbo v15, "prev"

    invoke-virtual {v14, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_9

    .line 95
    sget-object v14, Lorg/jivesoftware/smackx/commands/AdHocCommand$Action;->prev:Lorg/jivesoftware/smackx/commands/AdHocCommand$Action;

    invoke-virtual {v2, v14}, Lorg/jivesoftware/smackx/packet/AdHocCommandData;->addAction(Lorg/jivesoftware/smackx/commands/AdHocCommand$Action;)V

    goto/16 :goto_1

    .line 97
    :cond_9
    const-string/jumbo v14, "x"

    invoke-virtual {v5, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_a

    const-string/jumbo v14, "jabber:x:data"

    invoke-virtual {v9, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_a

    .line 98
    move-object/from16 v0, p1

    invoke-virtual {v3, v0}, Lorg/jivesoftware/smackx/provider/DataFormProvider;->parseExtension(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/PacketExtension;

    move-result-object v14

    check-cast v14, Lorg/jivesoftware/smackx/packet/DataForm;

    invoke-virtual {v2, v14}, Lorg/jivesoftware/smackx/packet/AdHocCommandData;->setForm(Lorg/jivesoftware/smackx/packet/DataForm;)V

    goto/16 :goto_1

    .line 100
    :cond_a
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v14

    const-string/jumbo v15, "note"

    invoke-virtual {v14, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_b

    .line 101
    const-string/jumbo v14, ""

    const-string/jumbo v15, "type"

    move-object/from16 v0, p1

    invoke-interface {v0, v14, v15}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    invoke-static {v14}, Lorg/jivesoftware/smackx/commands/AdHocCommandNote$Type;->valueOf(Ljava/lang/String;)Lorg/jivesoftware/smackx/commands/AdHocCommandNote$Type;

    move-result-object v12

    .line 103
    .local v12, "type":Lorg/jivesoftware/smackx/commands/AdHocCommandNote$Type;
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v13

    .line 104
    .local v13, "value":Ljava/lang/String;
    new-instance v14, Lorg/jivesoftware/smackx/commands/AdHocCommandNote;

    invoke-direct {v14, v12, v13}, Lorg/jivesoftware/smackx/commands/AdHocCommandNote;-><init>(Lorg/jivesoftware/smackx/commands/AdHocCommandNote$Type;Ljava/lang/String;)V

    invoke-virtual {v2, v14}, Lorg/jivesoftware/smackx/packet/AdHocCommandData;->addNote(Lorg/jivesoftware/smackx/commands/AdHocCommandNote;)V

    goto/16 :goto_1

    .line 106
    .end local v12    # "type":Lorg/jivesoftware/smackx/commands/AdHocCommandNote$Type;
    .end local v13    # "value":Ljava/lang/String;
    :cond_b
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v14

    const-string/jumbo v15, "error"

    invoke-virtual {v14, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_2

    .line 107
    invoke-static/range {p1 .. p1}, Lorg/jivesoftware/smack/util/PacketParserUtils;->parseError(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v6

    .line 108
    .local v6, "error":Lorg/jivesoftware/smack/packet/XMPPError;
    invoke-virtual {v2, v6}, Lorg/jivesoftware/smackx/packet/AdHocCommandData;->setError(Lorg/jivesoftware/smack/packet/XMPPError;)V

    goto/16 :goto_1

    .line 111
    .end local v6    # "error":Lorg/jivesoftware/smack/packet/XMPPError;
    :cond_c
    const/4 v14, 0x3

    if-ne v7, v14, :cond_2

    .line 112
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v14

    const-string/jumbo v15, "command"

    invoke-virtual {v14, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_2

    .line 113
    const/4 v4, 0x1

    goto/16 :goto_1

    .line 117
    .end local v5    # "elementName":Ljava/lang/String;
    .end local v7    # "eventType":I
    .end local v9    # "namespace":Ljava/lang/String;
    :cond_d
    return-object v2
.end method
