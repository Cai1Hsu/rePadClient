.class public Lorg/jivesoftware/smackx/provider/StreamInitiationProvider;
.super Ljava/lang/Object;
.source "StreamInitiationProvider.java"

# interfaces
.implements Lorg/jivesoftware/smack/provider/IQProvider;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public parseIQ(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/IQ;
    .locals 26
    .param p1, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 42
    const/4 v7, 0x0

    .line 45
    .local v7, "done":Z
    const-string/jumbo v24, ""

    const-string/jumbo v25, "id"

    move-object/from16 v0, p1

    move-object/from16 v1, v24

    move-object/from16 v2, v25

    invoke-interface {v0, v1, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 46
    .local v17, "id":Ljava/lang/String;
    const-string/jumbo v24, ""

    const-string/jumbo v25, "mime-type"

    move-object/from16 v0, p1

    move-object/from16 v1, v24

    move-object/from16 v2, v25

    invoke-interface {v0, v1, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    .line 48
    .local v20, "mimeType":Ljava/lang/String;
    new-instance v18, Lorg/jivesoftware/smackx/packet/StreamInitiation;

    invoke-direct/range {v18 .. v18}, Lorg/jivesoftware/smackx/packet/StreamInitiation;-><init>()V

    .line 51
    .local v18, "initiation":Lorg/jivesoftware/smackx/packet/StreamInitiation;
    const/16 v21, 0x0

    .line 52
    .local v21, "name":Ljava/lang/String;
    const/16 v23, 0x0

    .line 53
    .local v23, "size":Ljava/lang/String;
    const/16 v16, 0x0

    .line 54
    .local v16, "hash":Ljava/lang/String;
    const/4 v5, 0x0

    .line 55
    .local v5, "date":Ljava/lang/String;
    const/4 v6, 0x0

    .line 56
    .local v6, "desc":Ljava/lang/String;
    const/16 v19, 0x0

    .line 59
    .local v19, "isRanged":Z
    const/4 v13, 0x0

    .line 60
    .local v13, "form":Lorg/jivesoftware/smackx/packet/DataForm;
    new-instance v4, Lorg/jivesoftware/smackx/provider/DataFormProvider;

    invoke-direct {v4}, Lorg/jivesoftware/smackx/provider/DataFormProvider;-><init>()V

    .line 65
    .local v4, "dataFormProvider":Lorg/jivesoftware/smackx/provider/DataFormProvider;
    :cond_0
    :goto_0
    if-nez v7, :cond_8

    .line 66
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v10

    .line 67
    .local v10, "eventType":I
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v9

    .line 68
    .local v9, "elementName":Ljava/lang/String;
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->getNamespace()Ljava/lang/String;

    move-result-object v22

    .line 69
    .local v22, "namespace":Ljava/lang/String;
    const/16 v24, 0x2

    move/from16 v0, v24

    if-ne v10, v0, :cond_4

    .line 70
    const-string/jumbo v24, "file"

    move-object/from16 v0, v24

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v24

    if-eqz v24, :cond_1

    .line 71
    const-string/jumbo v24, ""

    const-string/jumbo v25, "name"

    move-object/from16 v0, p1

    move-object/from16 v1, v24

    move-object/from16 v2, v25

    invoke-interface {v0, v1, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v21

    .line 72
    const-string/jumbo v24, ""

    const-string/jumbo v25, "size"

    move-object/from16 v0, p1

    move-object/from16 v1, v24

    move-object/from16 v2, v25

    invoke-interface {v0, v1, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v23

    .line 73
    const-string/jumbo v24, ""

    const-string/jumbo v25, "hash"

    move-object/from16 v0, p1

    move-object/from16 v1, v24

    move-object/from16 v2, v25

    invoke-interface {v0, v1, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    .line 74
    const-string/jumbo v24, ""

    const-string/jumbo v25, "date"

    move-object/from16 v0, p1

    move-object/from16 v1, v24

    move-object/from16 v2, v25

    invoke-interface {v0, v1, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    goto :goto_0

    .line 75
    :cond_1
    const-string/jumbo v24, "desc"

    move-object/from16 v0, v24

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v24

    if-eqz v24, :cond_2

    .line 76
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v6

    goto :goto_0

    .line 77
    :cond_2
    const-string/jumbo v24, "range"

    move-object/from16 v0, v24

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v24

    if-eqz v24, :cond_3

    .line 78
    const/16 v19, 0x1

    goto :goto_0

    .line 79
    :cond_3
    const-string/jumbo v24, "x"

    move-object/from16 v0, v24

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v24

    if-eqz v24, :cond_0

    const-string/jumbo v24, "jabber:x:data"

    move-object/from16 v0, v22

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v24

    if-eqz v24, :cond_0

    .line 81
    move-object/from16 v0, p1

    invoke-virtual {v4, v0}, Lorg/jivesoftware/smackx/provider/DataFormProvider;->parseExtension(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/PacketExtension;

    move-result-object v13

    .end local v13    # "form":Lorg/jivesoftware/smackx/packet/DataForm;
    check-cast v13, Lorg/jivesoftware/smackx/packet/DataForm;

    .restart local v13    # "form":Lorg/jivesoftware/smackx/packet/DataForm;
    goto/16 :goto_0

    .line 83
    :cond_4
    const/16 v24, 0x3

    move/from16 v0, v24

    if-ne v10, v0, :cond_0

    .line 84
    const-string/jumbo v24, "si"

    move-object/from16 v0, v24

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v24

    if-eqz v24, :cond_5

    .line 85
    const/4 v7, 0x1

    goto/16 :goto_0

    .line 86
    :cond_5
    const-string/jumbo v24, "file"

    move-object/from16 v0, v24

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v24

    if-eqz v24, :cond_0

    .line 87
    const-wide/16 v14, 0x0

    .line 88
    .local v14, "fileSize":J
    if-eqz v23, :cond_6

    invoke-virtual/range {v23 .. v23}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/String;->length()I

    move-result v24

    if-eqz v24, :cond_6

    .line 90
    :try_start_0
    invoke-static/range {v23 .. v23}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v14

    .line 97
    :cond_6
    :goto_1
    new-instance v12, Ljava/util/Date;

    invoke-direct {v12}, Ljava/util/Date;-><init>()V

    .line 98
    .local v12, "fileDate":Ljava/util/Date;
    if-eqz v5, :cond_7

    .line 100
    :try_start_1
    invoke-static {v5}, Lorg/jivesoftware/smack/util/StringUtils;->parseXEP0082Date(Ljava/lang/String;)Ljava/util/Date;
    :try_end_1
    .catch Ljava/text/ParseException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v12

    .line 106
    :cond_7
    :goto_2
    new-instance v11, Lorg/jivesoftware/smackx/packet/StreamInitiation$File;

    move-object/from16 v0, v21

    invoke-direct {v11, v0, v14, v15}, Lorg/jivesoftware/smackx/packet/StreamInitiation$File;-><init>(Ljava/lang/String;J)V

    .line 107
    .local v11, "file":Lorg/jivesoftware/smackx/packet/StreamInitiation$File;
    move-object/from16 v0, v16

    invoke-virtual {v11, v0}, Lorg/jivesoftware/smackx/packet/StreamInitiation$File;->setHash(Ljava/lang/String;)V

    .line 108
    invoke-virtual {v11, v12}, Lorg/jivesoftware/smackx/packet/StreamInitiation$File;->setDate(Ljava/util/Date;)V

    .line 109
    invoke-virtual {v11, v6}, Lorg/jivesoftware/smackx/packet/StreamInitiation$File;->setDesc(Ljava/lang/String;)V

    .line 110
    move/from16 v0, v19

    invoke-virtual {v11, v0}, Lorg/jivesoftware/smackx/packet/StreamInitiation$File;->setRanged(Z)V

    .line 111
    move-object/from16 v0, v18

    invoke-virtual {v0, v11}, Lorg/jivesoftware/smackx/packet/StreamInitiation;->setFile(Lorg/jivesoftware/smackx/packet/StreamInitiation$File;)V

    goto/16 :goto_0

    .line 92
    .end local v11    # "file":Lorg/jivesoftware/smackx/packet/StreamInitiation$File;
    .end local v12    # "fileDate":Ljava/util/Date;
    :catch_0
    move-exception v8

    .line 93
    .local v8, "e":Ljava/lang/NumberFormatException;
    invoke-virtual {v8}, Ljava/lang/NumberFormatException;->printStackTrace()V

    goto :goto_1

    .line 116
    .end local v8    # "e":Ljava/lang/NumberFormatException;
    .end local v9    # "elementName":Ljava/lang/String;
    .end local v10    # "eventType":I
    .end local v14    # "fileSize":J
    .end local v22    # "namespace":Ljava/lang/String;
    :cond_8
    move-object/from16 v0, v18

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smackx/packet/StreamInitiation;->setSesssionID(Ljava/lang/String;)V

    .line 117
    move-object/from16 v0, v18

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smackx/packet/StreamInitiation;->setMimeType(Ljava/lang/String;)V

    .line 119
    move-object/from16 v0, v18

    invoke-virtual {v0, v13}, Lorg/jivesoftware/smackx/packet/StreamInitiation;->setFeatureNegotiationForm(Lorg/jivesoftware/smackx/packet/DataForm;)V

    .line 121
    return-object v18

    .line 101
    .restart local v9    # "elementName":Ljava/lang/String;
    .restart local v10    # "eventType":I
    .restart local v12    # "fileDate":Ljava/util/Date;
    .restart local v14    # "fileSize":J
    .restart local v22    # "namespace":Ljava/lang/String;
    :catch_1
    move-exception v24

    goto :goto_2
.end method
