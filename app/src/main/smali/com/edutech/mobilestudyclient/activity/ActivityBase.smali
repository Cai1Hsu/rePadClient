.class public Lcom/edutech/mobilestudyclient/activity/ActivityBase;
.super Landroid/app/Activity;
.source "ActivityBase.java"


# static fields
.field protected static final SHOW_TIME:I = 0x1

.field private static filepathMobileStudyClient:Ljava/lang/String;

.field private static idfileMobileStudyClient:Ljava/io/File;

.field public static seed:Ljava/lang/String;


# instance fields
.field protected mProgressDialog:Landroid/app/ProgressDialog;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 68
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v1

    .line 69
    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v1, "/CloudClient/.System/idau.xml"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 68
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/edutech/mobilestudyclient/activity/ActivityBase;->filepathMobileStudyClient:Ljava/lang/String;

    .line 70
    new-instance v0, Ljava/io/File;

    sget-object v1, Lcom/edutech/mobilestudyclient/activity/ActivityBase;->filepathMobileStudyClient:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/edutech/mobilestudyclient/activity/ActivityBase;->idfileMobileStudyClient:Ljava/io/File;

    .line 71
    const-string/jumbo v0, "Edutech@2013"

    sput-object v0, Lcom/edutech/mobilestudyclient/activity/ActivityBase;->seed:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 62
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method public static loadIpXml()Ljava/util/HashMap;
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 598
    sget-object v10, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->URLFILEPATH:Ljava/lang/String;

    invoke-static {v10}, Lcom/edutech/idauthentication/FileInOutHelper;->setupOrOpenFile(Ljava/lang/String;)Ljava/io/File;

    move-result-object v8

    .line 599
    .local v8, "xmlFile":Ljava/io/File;
    const/4 v3, 0x0

    .line 600
    .local v3, "filein":Ljava/io/FileInputStream;
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    .line 602
    .local v5, "hashmap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    :try_start_0
    new-instance v4, Ljava/io/FileInputStream;

    invoke-direct {v4, v8}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .end local v3    # "filein":Ljava/io/FileInputStream;
    .local v4, "filein":Ljava/io/FileInputStream;
    move-object v3, v4

    .line 608
    .end local v4    # "filein":Ljava/io/FileInputStream;
    .restart local v3    # "filein":Ljava/io/FileInputStream;
    :goto_0
    :try_start_1
    invoke-static {}, Lorg/xmlpull/v1/XmlPullParserFactory;->newInstance()Lorg/xmlpull/v1/XmlPullParserFactory;

    move-result-object v7

    .line 609
    .local v7, "pullParserFactory":Lorg/xmlpull/v1/XmlPullParserFactory;
    invoke-virtual {v7}, Lorg/xmlpull/v1/XmlPullParserFactory;->newPullParser()Lorg/xmlpull/v1/XmlPullParser;

    move-result-object v9

    .line 610
    .local v9, "xmlPullParser":Lorg/xmlpull/v1/XmlPullParser;
    const-string/jumbo v10, "UTF-8"

    invoke-interface {v9, v3, v10}, Lorg/xmlpull/v1/XmlPullParser;->setInput(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 611
    invoke-interface {v9}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I
    :try_end_1
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_4

    move-result v2

    .line 612
    .local v2, "eventType":I
    :goto_1
    const/4 v10, 0x1

    if-ne v2, v10, :cond_0

    .line 655
    .end local v2    # "eventType":I
    .end local v7    # "pullParserFactory":Lorg/xmlpull/v1/XmlPullParserFactory;
    .end local v9    # "xmlPullParser":Lorg/xmlpull/v1/XmlPullParser;
    :goto_2
    return-object v5

    .line 603
    :catch_0
    move-exception v1

    .line 605
    .local v1, "e1":Ljava/io/FileNotFoundException;
    invoke-virtual {v1}, Ljava/io/FileNotFoundException;->printStackTrace()V

    goto :goto_0

    .line 613
    .end local v1    # "e1":Ljava/io/FileNotFoundException;
    .restart local v2    # "eventType":I
    .restart local v7    # "pullParserFactory":Lorg/xmlpull/v1/XmlPullParserFactory;
    .restart local v9    # "xmlPullParser":Lorg/xmlpull/v1/XmlPullParser;
    :cond_0
    :try_start_2
    invoke-interface {v9}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v6

    .line 615
    .local v6, "nodeName":Ljava/lang/String;
    packed-switch v2, :pswitch_data_0

    .line 646
    :cond_1
    :goto_3
    :pswitch_0
    invoke-interface {v9}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v2

    goto :goto_1

    .line 620
    :pswitch_1
    const-string/jumbo v10, "ip"

    invoke-virtual {v10, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_2

    .line 621
    const-string/jumbo v10, "ip"

    invoke-interface {v9}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v5, v10, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 623
    :cond_2
    const-string/jumbo v10, "username"

    invoke-virtual {v10, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_2
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_4

    move-result v10

    if-eqz v10, :cond_3

    .line 625
    :try_start_3
    const-string/jumbo v10, "username"

    invoke-interface {v9}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Lcom/edutech/utils/BZip2Utils;->Base64DecodeToString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v5, v10, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_3 .. :try_end_3} :catch_2
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_4

    .line 631
    :cond_3
    :goto_4
    :try_start_4
    const-string/jumbo v10, "password"

    invoke-virtual {v10, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_4
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_4 .. :try_end_4} :catch_2
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_4

    move-result v10

    if-eqz v10, :cond_1

    .line 633
    :try_start_5
    const-string/jumbo v10, "password"

    invoke-interface {v9}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Lcom/edutech/utils/BZip2Utils;->Base64DecodeToString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v5, v10, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_1
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_5 .. :try_end_5} :catch_2
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_4

    goto :goto_3

    .line 634
    :catch_1
    move-exception v0

    .line 636
    .local v0, "e":Ljava/lang/Exception;
    :try_start_6
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_6
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_6 .. :try_end_6} :catch_2
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_4

    goto :goto_3

    .line 648
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v2    # "eventType":I
    .end local v6    # "nodeName":Ljava/lang/String;
    .end local v7    # "pullParserFactory":Lorg/xmlpull/v1/XmlPullParserFactory;
    .end local v9    # "xmlPullParser":Lorg/xmlpull/v1/XmlPullParser;
    :catch_2
    move-exception v0

    .line 650
    .local v0, "e":Lorg/xmlpull/v1/XmlPullParserException;
    invoke-virtual {v0}, Lorg/xmlpull/v1/XmlPullParserException;->printStackTrace()V

    goto :goto_2

    .line 626
    .end local v0    # "e":Lorg/xmlpull/v1/XmlPullParserException;
    .restart local v2    # "eventType":I
    .restart local v6    # "nodeName":Ljava/lang/String;
    .restart local v7    # "pullParserFactory":Lorg/xmlpull/v1/XmlPullParserFactory;
    .restart local v9    # "xmlPullParser":Lorg/xmlpull/v1/XmlPullParser;
    :catch_3
    move-exception v0

    .line 628
    .local v0, "e":Ljava/lang/Exception;
    :try_start_7
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_7
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_7 .. :try_end_7} :catch_2
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_4

    goto :goto_4

    .line 651
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v2    # "eventType":I
    .end local v6    # "nodeName":Ljava/lang/String;
    .end local v7    # "pullParserFactory":Lorg/xmlpull/v1/XmlPullParserFactory;
    .end local v9    # "xmlPullParser":Lorg/xmlpull/v1/XmlPullParser;
    :catch_4
    move-exception v0

    .line 653
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_2

    .line 615
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static final readIDFile()Ljava/util/List;
    .locals 20
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 421
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 422
    .local v8, "idInfo":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v9, 0x0

    .local v9, "idString":Ljava/lang/String;
    const/4 v10, 0x0

    .local v10, "machineID":Ljava/lang/String;
    const/4 v14, 0x0

    .local v14, "resultString":Ljava/lang/String;
    const/4 v15, 0x0

    .local v15, "times":Ljava/lang/String;
    const/4 v2, 0x0

    .local v2, "date":Ljava/lang/String;
    const/16 v16, 0x0

    .line 423
    .local v16, "usedTimes":Ljava/lang/String;
    const/4 v6, 0x0

    .line 424
    .local v6, "filein":Ljava/io/FileInputStream;
    const/4 v13, 0x0

    .line 426
    .local v13, "result":I
    :try_start_0
    new-instance v7, Ljava/io/FileInputStream;

    sget-object v18, Lcom/edutech/mobilestudyclient/activity/ActivityBase;->idfileMobileStudyClient:Ljava/io/File;

    move-object/from16 v0, v18

    invoke-direct {v7, v0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .end local v6    # "filein":Ljava/io/FileInputStream;
    .local v7, "filein":Ljava/io/FileInputStream;
    move-object v6, v7

    .line 432
    .end local v7    # "filein":Ljava/io/FileInputStream;
    .restart local v6    # "filein":Ljava/io/FileInputStream;
    :goto_0
    :try_start_1
    invoke-static {}, Lorg/xmlpull/v1/XmlPullParserFactory;->newInstance()Lorg/xmlpull/v1/XmlPullParserFactory;

    move-result-object v12

    .line 433
    .local v12, "pullParserFactory":Lorg/xmlpull/v1/XmlPullParserFactory;
    invoke-virtual {v12}, Lorg/xmlpull/v1/XmlPullParserFactory;->newPullParser()Lorg/xmlpull/v1/XmlPullParser;

    move-result-object v17

    .line 434
    .local v17, "xmlPullParser":Lorg/xmlpull/v1/XmlPullParser;
    const-string/jumbo v18, "UTF-8"

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-interface {v0, v6, v1}, Lorg/xmlpull/v1/XmlPullParser;->setInput(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 435
    invoke-interface/range {v17 .. v17}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I
    :try_end_1
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2

    move-result v5

    .line 436
    .local v5, "eventType":I
    :goto_1
    const/16 v18, 0x1

    move/from16 v0, v18

    if-ne v5, v0, :cond_6

    .line 483
    .end local v5    # "eventType":I
    .end local v12    # "pullParserFactory":Lorg/xmlpull/v1/XmlPullParserFactory;
    .end local v17    # "xmlPullParser":Lorg/xmlpull/v1/XmlPullParser;
    :goto_2
    :try_start_2
    invoke-virtual {v6}, Ljava/io/FileInputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_3

    .line 484
    const/4 v6, 0x0

    .line 490
    :goto_3
    const-string/jumbo v18, ""

    move-object/from16 v0, v18

    invoke-interface {v8, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 491
    const-string/jumbo v18, ""

    move-object/from16 v0, v18

    invoke-interface {v8, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 492
    const-string/jumbo v18, ""

    move-object/from16 v0, v18

    invoke-interface {v8, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 493
    const-string/jumbo v18, ""

    move-object/from16 v0, v18

    invoke-interface {v8, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 494
    const-string/jumbo v18, ""

    move-object/from16 v0, v18

    invoke-interface {v8, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 495
    const-string/jumbo v18, ""

    move-object/from16 v0, v18

    invoke-interface {v8, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 498
    if-eqz v9, :cond_0

    .line 499
    const/16 v18, 0x0

    :try_start_3
    sget-object v19, Lcom/edutech/mobilestudyclient/activity/ActivityBase;->seed:Ljava/lang/String;

    move-object/from16 v0, v19

    invoke-static {v0, v9}, Lcom/edutech/idauthentication/AES;->decrypt(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    move/from16 v0, v18

    move-object/from16 v1, v19

    invoke-interface {v8, v0, v1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 501
    :cond_0
    if-eqz v10, :cond_1

    .line 502
    const/16 v18, 0x1

    sget-object v19, Lcom/edutech/mobilestudyclient/activity/ActivityBase;->seed:Ljava/lang/String;

    move-object/from16 v0, v19

    invoke-static {v0, v10}, Lcom/edutech/idauthentication/AES;->decrypt(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    move/from16 v0, v18

    move-object/from16 v1, v19

    invoke-interface {v8, v0, v1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 504
    :cond_1
    if-eqz v14, :cond_2

    .line 505
    const/16 v18, 0x2

    sget-object v19, Lcom/edutech/mobilestudyclient/activity/ActivityBase;->seed:Ljava/lang/String;

    move-object/from16 v0, v19

    invoke-static {v0, v14}, Lcom/edutech/idauthentication/AES;->decrypt(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    move/from16 v0, v18

    move-object/from16 v1, v19

    invoke-interface {v8, v0, v1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 507
    :cond_2
    if-eqz v15, :cond_3

    .line 508
    const/16 v18, 0x3

    sget-object v19, Lcom/edutech/mobilestudyclient/activity/ActivityBase;->seed:Ljava/lang/String;

    move-object/from16 v0, v19

    invoke-static {v0, v15}, Lcom/edutech/idauthentication/AES;->decrypt(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    move/from16 v0, v18

    move-object/from16 v1, v19

    invoke-interface {v8, v0, v1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 510
    :cond_3
    if-eqz v2, :cond_4

    .line 511
    const/16 v18, 0x4

    sget-object v19, Lcom/edutech/mobilestudyclient/activity/ActivityBase;->seed:Ljava/lang/String;

    move-object/from16 v0, v19

    invoke-static {v0, v2}, Lcom/edutech/idauthentication/AES;->decrypt(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    move/from16 v0, v18

    move-object/from16 v1, v19

    invoke-interface {v8, v0, v1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 513
    :cond_4
    if-eqz v16, :cond_5

    .line 514
    const/16 v18, 0x5

    sget-object v19, Lcom/edutech/mobilestudyclient/activity/ActivityBase;->seed:Ljava/lang/String;

    move-object/from16 v0, v19

    move-object/from16 v1, v16

    invoke-static {v0, v1}, Lcom/edutech/idauthentication/AES;->decrypt(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    move/from16 v0, v18

    move-object/from16 v1, v19

    invoke-interface {v8, v0, v1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_4

    .line 520
    :cond_5
    :goto_4
    return-object v8

    .line 427
    :catch_0
    move-exception v4

    .line 429
    .local v4, "e1":Ljava/io/FileNotFoundException;
    invoke-virtual {v4}, Ljava/io/FileNotFoundException;->printStackTrace()V

    goto/16 :goto_0

    .line 437
    .end local v4    # "e1":Ljava/io/FileNotFoundException;
    .restart local v5    # "eventType":I
    .restart local v12    # "pullParserFactory":Lorg/xmlpull/v1/XmlPullParserFactory;
    .restart local v17    # "xmlPullParser":Lorg/xmlpull/v1/XmlPullParser;
    :cond_6
    :try_start_4
    invoke-interface/range {v17 .. v17}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v11

    .line 439
    .local v11, "nodeName":Ljava/lang/String;
    packed-switch v5, :pswitch_data_0

    .line 470
    :cond_7
    :goto_5
    :pswitch_0
    invoke-interface/range {v17 .. v17}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v5

    goto/16 :goto_1

    .line 444
    :pswitch_1
    const-string/jumbo v18, "a1"

    move-object/from16 v0, v18

    invoke-virtual {v0, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_8

    .line 445
    invoke-interface/range {v17 .. v17}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v9

    .line 447
    :cond_8
    const-string/jumbo v18, "b2"

    move-object/from16 v0, v18

    invoke-virtual {v0, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_9

    .line 448
    invoke-interface/range {v17 .. v17}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v10

    .line 450
    :cond_9
    const-string/jumbo v18, "c3"

    move-object/from16 v0, v18

    invoke-virtual {v0, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_a

    .line 451
    invoke-interface/range {v17 .. v17}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v14

    .line 453
    :cond_a
    const-string/jumbo v18, "d4"

    move-object/from16 v0, v18

    invoke-virtual {v0, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_b

    .line 454
    invoke-interface/range {v17 .. v17}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v15

    .line 456
    :cond_b
    const-string/jumbo v18, "e5"

    move-object/from16 v0, v18

    invoke-virtual {v0, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_c

    .line 457
    invoke-interface/range {v17 .. v17}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v2

    .line 459
    :cond_c
    const-string/jumbo v18, "f6"

    move-object/from16 v0, v18

    invoke-virtual {v0, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_7

    .line 460
    invoke-interface/range {v17 .. v17}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;
    :try_end_4
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_4 .. :try_end_4} :catch_1
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2

    move-result-object v16

    .line 463
    goto :goto_5

    .line 472
    .end local v5    # "eventType":I
    .end local v11    # "nodeName":Ljava/lang/String;
    .end local v12    # "pullParserFactory":Lorg/xmlpull/v1/XmlPullParserFactory;
    .end local v17    # "xmlPullParser":Lorg/xmlpull/v1/XmlPullParser;
    :catch_1
    move-exception v3

    .line 475
    .local v3, "e":Lorg/xmlpull/v1/XmlPullParserException;
    invoke-virtual {v3}, Lorg/xmlpull/v1/XmlPullParserException;->printStackTrace()V

    goto/16 :goto_2

    .line 476
    .end local v3    # "e":Lorg/xmlpull/v1/XmlPullParserException;
    :catch_2
    move-exception v3

    .line 479
    .local v3, "e":Ljava/io/IOException;
    invoke-virtual {v3}, Ljava/io/IOException;->printStackTrace()V

    goto/16 :goto_2

    .line 485
    .end local v3    # "e":Ljava/io/IOException;
    :catch_3
    move-exception v4

    .line 487
    .local v4, "e1":Ljava/io/IOException;
    invoke-virtual {v4}, Ljava/io/IOException;->printStackTrace()V

    goto/16 :goto_3

    .line 516
    .end local v4    # "e1":Ljava/io/IOException;
    :catch_4
    move-exception v3

    .line 518
    .local v3, "e":Ljava/lang/Exception;
    invoke-virtual {v3}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_4

    .line 439
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static toHexString([BLjava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p0, "bytes"    # [B
    .param p1, "separator"    # Ljava/lang/String;

    .prologue
    .line 339
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 340
    .local v1, "hexString":Ljava/lang/StringBuilder;
    array-length v3, p0

    const/4 v2, 0x0

    :goto_0
    if-lt v2, v3, :cond_0

    .line 343
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 340
    :cond_0
    aget-byte v0, p0, v2

    .line 341
    .local v0, "b":B
    and-int/lit16 v4, v0, 0xff

    invoke-static {v4}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 340
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method public static toMd5([B)[B
    .locals 2
    .param p0, "bytes"    # [B

    .prologue
    .line 322
    :try_start_0
    const-string/jumbo v1, "MD5"

    invoke-static {v1}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v0

    .line 323
    .local v0, "algorithm":Ljava/security/MessageDigest;
    invoke-virtual {v0}, Ljava/security/MessageDigest;->reset()V

    .line 324
    invoke-virtual {v0, p0}, Ljava/security/MessageDigest;->update([B)V

    .line 325
    invoke-virtual {v0}, Ljava/security/MessageDigest;->digest()[B
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 329
    .end local v0    # "algorithm":Ljava/security/MessageDigest;
    :goto_0
    return-object v1

    .line 326
    :catch_0
    move-exception v1

    .line 329
    const/4 v1, 0x0

    goto :goto_0
.end method


# virtual methods
.method public final GetMachineID()Ljava/lang/String;
    .locals 8

    .prologue
    .line 268
    const-string/jumbo v5, "phone"

    invoke-virtual {p0, v5}, Lcom/edutech/mobilestudyclient/activity/ActivityBase;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/telephony/TelephonyManager;

    .line 269
    .local v3, "tm":Landroid/telephony/TelephonyManager;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 271
    .local v2, "sb":Ljava/lang/StringBuilder;
    new-instance v5, Ljava/lang/StringBuilder;

    const-string/jumbo v6, "\nModel = "

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v6, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 272
    new-instance v5, Ljava/lang/StringBuilder;

    const-string/jumbo v6, "\nSerialNumber = "

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v6, Landroid/os/Build;->SERIAL:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 273
    new-instance v5, Ljava/lang/StringBuilder;

    const-string/jumbo v6, "\nDeviceId(IMEI) = "

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Landroid/telephony/TelephonyManager;->getDeviceId()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 275
    invoke-virtual {p0}, Lcom/edutech/mobilestudyclient/activity/ActivityBase;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    const-string/jumbo v6, "android_id"

    invoke-static {v5, v6}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 276
    .local v0, "android_id":Ljava/lang/String;
    new-instance v5, Ljava/lang/StringBuilder;

    const-string/jumbo v6, "\nAndroidID = "

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 278
    const-string/jumbo v5, "wifi"

    invoke-virtual {p0, v5}, Lcom/edutech/mobilestudyclient/activity/ActivityBase;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/net/wifi/WifiManager;

    .line 279
    .local v4, "wm":Landroid/net/wifi/WifiManager;
    invoke-virtual {v4}, Landroid/net/wifi/WifiManager;->getConnectionInfo()Landroid/net/wifi/WifiInfo;

    move-result-object v5

    invoke-virtual {v5}, Landroid/net/wifi/WifiInfo;->getMacAddress()Ljava/lang/String;

    move-result-object v1

    .line 280
    .local v1, "m_szWLANMAC":Ljava/lang/String;
    if-eqz v1, :cond_0

    const-string/jumbo v5, "02:00:00:00:00:00"

    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 282
    invoke-virtual {p0}, Lcom/edutech/mobilestudyclient/activity/ActivityBase;->getMacAddr()Ljava/lang/String;

    move-result-object v1

    .line 284
    :cond_0
    new-instance v5, Ljava/lang/StringBuilder;

    const-string/jumbo v6, "\nMACAddress = "

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 286
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->getBytes()[B

    move-result-object v6

    invoke-static {v6}, Lcom/edutech/mobilestudyclient/activity/ActivityBase;->toMd5([B)[B

    move-result-object v6

    const-string/jumbo v7, ""

    invoke-static {v6, v7}, Lcom/edutech/mobilestudyclient/activity/ActivityBase;->toHexString([BLjava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v6, ":"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, ":"

    const-string/jumbo v7, ""

    invoke-virtual {v1, v6, v7}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    return-object v5
.end method

.method protected ShowMsg(I)V
    .locals 1
    .param p1, "p_ResID"    # I

    .prologue
    .line 95
    const/4 v0, 0x1

    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 96
    return-void
.end method

.method protected ShowMsg(Ljava/lang/String;)V
    .locals 3
    .param p1, "pMsg"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 81
    invoke-static {p0, p1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    .line 82
    .local v0, "toast":Landroid/widget/Toast;
    const/16 v1, 0x11

    invoke-virtual {v0, v1, v2, v2}, Landroid/widget/Toast;->setGravity(III)V

    .line 83
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 84
    return-void
.end method

.method public checkMobileStudyClientIDAuth()I
    .locals 20

    .prologue
    .line 349
    const/4 v1, 0x0

    .local v1, "idString":Ljava/lang/String;
    const/4 v10, 0x0

    .local v10, "machineID":Ljava/lang/String;
    const/4 v11, 0x0

    .local v11, "resultString":Ljava/lang/String;
    const/4 v3, 0x0

    .local v3, "times":Ljava/lang/String;
    const/4 v13, 0x0

    .local v13, "usedTimes":Ljava/lang/String;
    const/4 v4, 0x0

    .line 351
    .local v4, "date":Ljava/lang/String;
    const/4 v9, 0x0

    .line 353
    .local v9, "idInfo":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    sget-object v0, Lcom/edutech/mobilestudyclient/activity/ActivityBase;->idfileMobileStudyClient:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/edutech/mobilestudyclient/activity/ActivityBase;->idfileMobileStudyClient:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v16

    const-wide/16 v18, 0x0

    cmp-long v0, v16, v18

    if-gtz v0, :cond_1

    .line 354
    :cond_0
    const/4 v0, 0x1

    .line 413
    :goto_0
    return v0

    .line 357
    :cond_1
    invoke-static {}, Lcom/edutech/mobilestudyclient/activity/ActivityBase;->readIDFile()Ljava/util/List;

    move-result-object v9

    .line 359
    if-eqz v9, :cond_3

    .line 361
    const/4 v0, 0x0

    invoke-interface {v9, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    .end local v1    # "idString":Ljava/lang/String;
    check-cast v1, Ljava/lang/String;

    .line 362
    .restart local v1    # "idString":Ljava/lang/String;
    const/4 v0, 0x1

    invoke-interface {v9, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    .end local v10    # "machineID":Ljava/lang/String;
    check-cast v10, Ljava/lang/String;

    .line 363
    .restart local v10    # "machineID":Ljava/lang/String;
    const/4 v0, 0x2

    invoke-interface {v9, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    .end local v11    # "resultString":Ljava/lang/String;
    check-cast v11, Ljava/lang/String;

    .line 364
    .restart local v11    # "resultString":Ljava/lang/String;
    const/4 v0, 0x3

    invoke-interface {v9, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    .end local v3    # "times":Ljava/lang/String;
    check-cast v3, Ljava/lang/String;

    .line 365
    .restart local v3    # "times":Ljava/lang/String;
    const/4 v0, 0x4

    invoke-interface {v9, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    .end local v4    # "date":Ljava/lang/String;
    check-cast v4, Ljava/lang/String;

    .line 366
    .restart local v4    # "date":Ljava/lang/String;
    const/4 v0, 0x5

    invoke-interface {v9, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v13

    .end local v13    # "usedTimes":Ljava/lang/String;
    check-cast v13, Ljava/lang/String;

    .line 372
    .restart local v13    # "usedTimes":Ljava/lang/String;
    if-eqz v1, :cond_2

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v2, 0x10

    if-ge v0, v2, :cond_4

    .line 373
    :cond_2
    const/4 v0, 0x3

    goto :goto_0

    .line 369
    :cond_3
    const/4 v0, 0x2

    goto :goto_0

    .line 376
    :cond_4
    if-eqz v10, :cond_5

    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v2, 0x20

    if-lt v0, v2, :cond_5

    invoke-virtual/range {p0 .. p0}, Lcom/edutech/mobilestudyclient/activity/ActivityBase;->GetMachineID()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v10, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_6

    .line 377
    :cond_5
    const/4 v0, 0x4

    goto :goto_0

    .line 380
    :cond_6
    if-eqz v11, :cond_7

    invoke-virtual {v11}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_7

    const-string/jumbo v0, "4"

    invoke-virtual {v11, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_8

    const-string/jumbo v0, "5"

    invoke-virtual {v11, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_8

    .line 381
    :cond_7
    const/4 v0, 0x5

    goto :goto_0

    .line 384
    :cond_8
    new-instance v7, Ljava/util/Date;

    invoke-direct {v7}, Ljava/util/Date;-><init>()V

    .line 385
    .local v7, "curretDate":Ljava/util/Date;
    new-instance v12, Ljava/text/SimpleDateFormat;

    const-string/jumbo v0, "yyyy-MM-dd"

    invoke-direct {v12, v0}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 386
    .local v12, "sdf":Ljava/text/SimpleDateFormat;
    const/4 v6, 0x0

    .line 388
    .local v6, "authDate":Ljava/util/Date;
    if-eqz v4, :cond_a

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v2, 0xa

    if-lt v0, v2, :cond_a

    .line 391
    :try_start_0
    invoke-virtual {v12, v4}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v6

    .line 397
    :goto_1
    if-eqz v6, :cond_9

    invoke-virtual {v7, v6}, Ljava/util/Date;->after(Ljava/util/Date;)Z

    move-result v0

    if-eqz v0, :cond_a

    .line 398
    :cond_9
    const/4 v0, 0x6

    goto/16 :goto_0

    .line 392
    :catch_0
    move-exception v8

    .line 394
    .local v8, "e":Ljava/text/ParseException;
    invoke-virtual {v8}, Ljava/text/ParseException;->printStackTrace()V

    goto :goto_1

    .line 401
    .end local v8    # "e":Ljava/text/ParseException;
    :cond_a
    if-eqz v3, :cond_c

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_c

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    if-lez v0, :cond_c

    if-eqz v13, :cond_c

    invoke-virtual {v13}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_c

    .line 403
    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    invoke-static {v13}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    if-gt v0, v2, :cond_b

    .line 404
    const/4 v0, 0x7

    goto/16 :goto_0

    .line 406
    :cond_b
    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    if-lez v0, :cond_c

    .line 408
    invoke-static {v13}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    add-int/lit8 v14, v0, 0x1

    .line 409
    .local v14, "usedTimesInt":I
    invoke-static {v11}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    invoke-static {v14}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, p0

    invoke-virtual/range {v0 .. v5}, Lcom/edutech/mobilestudyclient/activity/ActivityBase;->writeidFile(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 413
    .end local v14    # "usedTimesInt":I
    :cond_c
    const/4 v0, 0x0

    goto/16 :goto_0
.end method

.method protected createMenu(Landroid/view/Menu;)V
    .locals 6
    .param p1, "p_Menu"    # Landroid/view/Menu;

    .prologue
    .line 162
    const/4 v0, 0x0

    .line 163
    .local v0, "_GroupID":I
    const/4 v1, 0x0

    .line 164
    .local v1, "_Order":I
    const/4 v4, 0x2

    new-array v3, v4, [I

    fill-array-data v3, :array_0

    .line 166
    .local v3, "p_ItemID":[I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v4, v3

    if-lt v2, v4, :cond_0

    .line 180
    return-void

    .line 168
    :cond_0
    aget v4, v3, v2

    packed-switch v4, :pswitch_data_0

    .line 166
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 171
    :pswitch_0
    aget v4, v3, v2

    const-string/jumbo v5, "\u7f16\u8f91"

    invoke-interface {p1, v0, v4, v1, v5}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    goto :goto_1

    .line 174
    :pswitch_1
    aget v4, v3, v2

    const-string/jumbo v5, "\u5220\u9664"

    invoke-interface {p1, v0, v4, v1, v5}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    goto :goto_1

    .line 164
    nop

    :array_0
    .array-data 4
        0x1
        0x2
    .end array-data

    .line 168
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method protected dismissProgressDialog()V
    .locals 1

    .prologue
    .line 149
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/ActivityBase;->mProgressDialog:Landroid/app/ProgressDialog;

    if-eqz v0, :cond_0

    .line 151
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/ActivityBase;->mProgressDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    .line 153
    :cond_0
    return-void
.end method

.method public getMacAddr()Ljava/lang/String;
    .locals 9

    .prologue
    .line 291
    :try_start_0
    invoke-static {}, Ljava/net/NetworkInterface;->getNetworkInterfaces()Ljava/util/Enumeration;

    move-result-object v5

    invoke-static {v5}, Ljava/util/Collections;->list(Ljava/util/Enumeration;)Ljava/util/ArrayList;

    move-result-object v0

    .line 292
    .local v0, "all":Ljava/util/List;, "Ljava/util/List<Ljava/net/NetworkInterface;>;"
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v6

    if-nez v6, :cond_1

    .line 313
    .end local v0    # "all":Ljava/util/List;, "Ljava/util/List<Ljava/net/NetworkInterface;>;"
    :goto_0
    const-string/jumbo v5, ""

    :goto_1
    return-object v5

    .line 292
    .restart local v0    # "all":Ljava/util/List;, "Ljava/util/List<Ljava/net/NetworkInterface;>;"
    :cond_1
    :try_start_1
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/net/NetworkInterface;

    .line 293
    .local v3, "nif":Ljava/net/NetworkInterface;
    invoke-virtual {v3}, Ljava/net/NetworkInterface;->getName()Ljava/lang/String;

    move-result-object v6

    const-string/jumbo v7, "wlan0"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 295
    invoke-virtual {v3}, Ljava/net/NetworkInterface;->getHardwareAddress()[B
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v2

    .line 296
    .local v2, "macBytes":[B
    if-nez v2, :cond_2

    .line 297
    const-string/jumbo v5, ""

    goto :goto_1

    .line 300
    :cond_2
    :try_start_2
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 301
    .local v4, "res1":Ljava/lang/StringBuilder;
    array-length v6, v2

    const/4 v5, 0x0

    :goto_2
    if-lt v5, v6, :cond_4

    .line 305
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v5

    if-lez v5, :cond_3

    .line 306
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->deleteCharAt(I)Ljava/lang/StringBuilder;

    .line 308
    :cond_3
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    goto :goto_1

    .line 301
    :cond_4
    aget-byte v1, v2, v5

    .line 302
    .local v1, "b":B
    new-instance v7, Ljava/lang/StringBuilder;

    and-int/lit16 v8, v1, 0xff

    invoke-static {v8}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v8, ":"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 301
    add-int/lit8 v5, v5, 0x1

    goto :goto_2

    .line 310
    .end local v0    # "all":Ljava/util/List;, "Ljava/util/List<Ljava/net/NetworkInterface;>;"
    .end local v1    # "b":B
    .end local v2    # "macBytes":[B
    .end local v3    # "nif":Ljava/net/NetworkInterface;
    .end local v4    # "res1":Ljava/lang/StringBuilder;
    :catch_0
    move-exception v5

    goto :goto_0
.end method

.method protected openActivity(Ljava/lang/Class;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 105
    .local p1, "pClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 106
    .local v0, "_Intent":Landroid/content/Intent;
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 107
    invoke-virtual {p0, v0}, Lcom/edutech/mobilestudyclient/activity/ActivityBase;->startActivity(Landroid/content/Intent;)V

    .line 108
    return-void
.end method

.method public setAlertDialogIsClose(Landroid/content/DialogInterface;Ljava/lang/Boolean;)V
    .locals 3
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "isClose"    # Ljava/lang/Boolean;

    .prologue
    .line 120
    :try_start_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v1

    const-string/jumbo v2, "mShowing"

    invoke-virtual {v1, v2}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    .line 121
    .local v0, "field":Ljava/lang/reflect/Field;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 122
    invoke-virtual {v0, p1, p2}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 126
    .end local v0    # "field":Ljava/lang/reflect/Field;
    :goto_0
    return-void

    .line 123
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method protected showAlertDialog(ILjava/lang/String;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog;
    .locals 2
    .param p1, "titleId"    # I
    .param p2, "message"    # Ljava/lang/String;
    .param p3, "OnClickListener"    # Landroid/content/DialogInterface$OnClickListener;

    .prologue
    .line 130
    invoke-virtual {p0, p1}, Lcom/edutech/mobilestudyclient/activity/ActivityBase;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 131
    .local v0, "title":Ljava/lang/String;
    invoke-virtual {p0, v0, p2, p3}, Lcom/edutech/mobilestudyclient/activity/ActivityBase;->showAlertDialog(Ljava/lang/String;Ljava/lang/String;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog;

    move-result-object v1

    return-object v1
.end method

.method protected showAlertDialog(Ljava/lang/String;Ljava/lang/String;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog;
    .locals 3
    .param p1, "title"    # Ljava/lang/String;
    .param p2, "message"    # Ljava/lang/String;
    .param p3, "OnClickListener"    # Landroid/content/DialogInterface$OnClickListener;

    .prologue
    .line 136
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0, p2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string/jumbo v1, "\u786e\u5b9a"

    invoke-virtual {v0, v1, p3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string/jumbo v1, "\u53d6\u6d88"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    move-result-object v0

    return-object v0
.end method

.method protected showProgressDialog(II)V
    .locals 2
    .param p1, "titleResID"    # I
    .param p2, "messageResID"    # I

    .prologue
    .line 141
    new-instance v0, Landroid/app/ProgressDialog;

    invoke-direct {v0, p0}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/ActivityBase;->mProgressDialog:Landroid/app/ProgressDialog;

    .line 142
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/ActivityBase;->mProgressDialog:Landroid/app/ProgressDialog;

    invoke-virtual {p0, p1}, Lcom/edutech/mobilestudyclient/activity/ActivityBase;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setTitle(Ljava/lang/CharSequence;)V

    .line 143
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/ActivityBase;->mProgressDialog:Landroid/app/ProgressDialog;

    invoke-virtual {p0, p2}, Lcom/edutech/mobilestudyclient/activity/ActivityBase;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 144
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/ActivityBase;->mProgressDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->show()V

    .line 145
    return-void
.end method

.method public sslClient(Lorg/apache/http/client/HttpClient;)Lorg/apache/http/client/HttpClient;
    .locals 10
    .param p1, "client"    # Lorg/apache/http/client/HttpClient;

    .prologue
    const/4 v7, 0x0

    .line 238
    :try_start_0
    new-instance v5, Lcom/edutech/mobilestudyclient/activity/ActivityBase$1;

    invoke-direct {v5, p0}, Lcom/edutech/mobilestudyclient/activity/ActivityBase$1;-><init>(Lcom/edutech/mobilestudyclient/activity/ActivityBase;)V

    .line 249
    .local v5, "tm":Ljavax/net/ssl/X509TrustManager;
    const-string/jumbo v6, "TLS"

    invoke-static {v6}, Ljavax/net/ssl/SSLContext;->getInstance(Ljava/lang/String;)Ljavax/net/ssl/SSLContext;

    move-result-object v1

    .line 250
    .local v1, "ctx":Ljavax/net/ssl/SSLContext;
    const/4 v6, 0x0

    const/4 v8, 0x1

    new-array v8, v8, [Ljavax/net/ssl/TrustManager;

    const/4 v9, 0x0

    aput-object v5, v8, v9

    const/4 v9, 0x0

    invoke-virtual {v1, v6, v8, v9}, Ljavax/net/ssl/SSLContext;->init([Ljavax/net/ssl/KeyManager;[Ljavax/net/ssl/TrustManager;Ljava/security/SecureRandom;)V

    .line 251
    new-instance v4, Lcom/edutech/idauthentication/MySSLSocketFactory;

    invoke-direct {v4, v1}, Lcom/edutech/idauthentication/MySSLSocketFactory;-><init>(Ljavax/net/ssl/SSLContext;)V

    .line 252
    .local v4, "ssf":Lorg/apache/http/conn/ssl/SSLSocketFactory;
    sget-object v6, Lorg/apache/http/conn/ssl/SSLSocketFactory;->ALLOW_ALL_HOSTNAME_VERIFIER:Lorg/apache/http/conn/ssl/X509HostnameVerifier;

    invoke-virtual {v4, v6}, Lorg/apache/http/conn/ssl/SSLSocketFactory;->setHostnameVerifier(Lorg/apache/http/conn/ssl/X509HostnameVerifier;)V

    .line 253
    invoke-interface {p1}, Lorg/apache/http/client/HttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v0

    .line 254
    .local v0, "ccm":Lorg/apache/http/conn/ClientConnectionManager;
    invoke-interface {v0}, Lorg/apache/http/conn/ClientConnectionManager;->getSchemeRegistry()Lorg/apache/http/conn/scheme/SchemeRegistry;

    move-result-object v3

    .line 255
    .local v3, "sr":Lorg/apache/http/conn/scheme/SchemeRegistry;
    new-instance v6, Lorg/apache/http/conn/scheme/Scheme;

    const-string/jumbo v8, "https"

    const/16 v9, 0x1bb

    invoke-direct {v6, v8, v4, v9}, Lorg/apache/http/conn/scheme/Scheme;-><init>(Ljava/lang/String;Lorg/apache/http/conn/scheme/SocketFactory;I)V

    invoke-virtual {v3, v6}, Lorg/apache/http/conn/scheme/SchemeRegistry;->register(Lorg/apache/http/conn/scheme/Scheme;)Lorg/apache/http/conn/scheme/Scheme;

    .line 256
    new-instance v6, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-interface {p1}, Lorg/apache/http/client/HttpClient;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v8

    invoke-direct {v6, v0, v8}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>(Lorg/apache/http/conn/ClientConnectionManager;Lorg/apache/http/params/HttpParams;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 258
    .end local v0    # "ccm":Lorg/apache/http/conn/ClientConnectionManager;
    .end local v1    # "ctx":Ljavax/net/ssl/SSLContext;
    .end local v3    # "sr":Lorg/apache/http/conn/scheme/SchemeRegistry;
    .end local v4    # "ssf":Lorg/apache/http/conn/ssl/SSLSocketFactory;
    .end local v5    # "tm":Ljavax/net/ssl/X509TrustManager;
    :goto_0
    return-object v6

    .line 257
    :catch_0
    move-exception v2

    .local v2, "ex":Ljava/lang/Exception;
    move-object v6, v7

    .line 258
    goto :goto_0
.end method

.method public writeidFile(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 7
    .param p1, "idString"    # Ljava/lang/String;
    .param p2, "result"    # I
    .param p3, "times"    # Ljava/lang/String;
    .param p4, "date"    # Ljava/lang/String;
    .param p5, "usedTimes"    # Ljava/lang/String;

    .prologue
    const/4 v6, 0x5

    .line 526
    const/4 v0, 0x0

    .line 527
    .local v0, "fileos":Ljava/io/FileOutputStream;
    move-object v2, p5

    .line 528
    .local v2, "hasUsedTimes":Ljava/lang/String;
    const/4 v3, 0x0

    .line 530
    .local v3, "idInfo":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    sget-object v5, Lcom/edutech/mobilestudyclient/activity/ActivityBase;->idfileMobileStudyClient:Ljava/io/File;

    invoke-virtual {v5}, Ljava/io/File;->exists()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 532
    const-string/jumbo v5, "0"

    invoke-virtual {p5, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 534
    invoke-static {}, Lcom/edutech/mobilestudyclient/activity/ActivityBase;->readIDFile()Ljava/util/List;

    move-result-object v3

    .line 535
    const/4 v5, 0x0

    invoke-interface {v3, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v5, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v3, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_0

    invoke-interface {v3, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    if-lez v5, :cond_0

    .line 537
    invoke-interface {v3, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    .end local v2    # "hasUsedTimes":Ljava/lang/String;
    check-cast v2, Ljava/lang/String;

    .line 540
    .restart local v2    # "hasUsedTimes":Ljava/lang/String;
    :cond_0
    sget-object v5, Lcom/edutech/mobilestudyclient/activity/ActivityBase;->idfileMobileStudyClient:Ljava/io/File;

    invoke-virtual {v5}, Ljava/io/File;->delete()Z

    .line 542
    :cond_1
    sget-object v5, Lcom/edutech/mobilestudyclient/activity/ActivityBase;->filepathMobileStudyClient:Ljava/lang/String;

    invoke-static {v5}, Lcom/edutech/idauthentication/FileInOutHelper;->setupOrOpenFile(Ljava/lang/String;)Ljava/io/File;

    move-result-object v5

    sput-object v5, Lcom/edutech/mobilestudyclient/activity/ActivityBase;->idfileMobileStudyClient:Ljava/io/File;

    .line 545
    :try_start_0
    new-instance v1, Ljava/io/FileOutputStream;

    sget-object v5, Lcom/edutech/mobilestudyclient/activity/ActivityBase;->idfileMobileStudyClient:Ljava/io/File;

    invoke-direct {v1, v5}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_1

    .end local v0    # "fileos":Ljava/io/FileOutputStream;
    .local v1, "fileos":Ljava/io/FileOutputStream;
    move-object v0, v1

    .line 550
    .end local v1    # "fileos":Ljava/io/FileOutputStream;
    .restart local v0    # "fileos":Ljava/io/FileOutputStream;
    :goto_0
    invoke-static {}, Landroid/util/Xml;->newSerializer()Lorg/xmlpull/v1/XmlSerializer;

    move-result-object v4

    .line 552
    .local v4, "serializer":Lorg/xmlpull/v1/XmlSerializer;
    :try_start_1
    const-string/jumbo v5, "UTF-8"

    invoke-interface {v4, v0, v5}, Lorg/xmlpull/v1/XmlSerializer;->setOutput(Ljava/io/OutputStream;Ljava/lang/String;)V

    .line 553
    const/4 v5, 0x0

    const/4 v6, 0x1

    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    invoke-interface {v4, v5, v6}, Lorg/xmlpull/v1/XmlSerializer;->startDocument(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 555
    const-string/jumbo v5, "http://xmlpull.org/v1/doc/features.html#indent-output"

    .line 556
    const/4 v6, 0x1

    .line 554
    invoke-interface {v4, v5, v6}, Lorg/xmlpull/v1/XmlSerializer;->setFeature(Ljava/lang/String;Z)V

    .line 558
    const/4 v5, 0x0

    const-string/jumbo v6, "id"

    invoke-interface {v4, v5, v6}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 560
    const/4 v5, 0x0

    const-string/jumbo v6, "a1"

    invoke-interface {v4, v5, v6}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 561
    sget-object v5, Lcom/edutech/mobilestudyclient/activity/ActivityBase;->seed:Ljava/lang/String;

    invoke-static {v5, p1}, Lcom/edutech/idauthentication/AES;->encrypt(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 562
    const/4 v5, 0x0

    const-string/jumbo v6, "a1"

    invoke-interface {v4, v5, v6}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 564
    const/4 v5, 0x0

    const-string/jumbo v6, "b2"

    invoke-interface {v4, v5, v6}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 565
    sget-object v5, Lcom/edutech/mobilestudyclient/activity/ActivityBase;->seed:Ljava/lang/String;

    invoke-virtual {p0}, Lcom/edutech/mobilestudyclient/activity/ActivityBase;->GetMachineID()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/edutech/idauthentication/AES;->encrypt(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 566
    const/4 v5, 0x0

    const-string/jumbo v6, "b2"

    invoke-interface {v4, v5, v6}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 568
    const/4 v5, 0x0

    const-string/jumbo v6, "c3"

    invoke-interface {v4, v5, v6}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 569
    sget-object v5, Lcom/edutech/mobilestudyclient/activity/ActivityBase;->seed:Ljava/lang/String;

    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/edutech/idauthentication/AES;->encrypt(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 570
    const/4 v5, 0x0

    const-string/jumbo v6, "c3"

    invoke-interface {v4, v5, v6}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 572
    const/4 v5, 0x0

    const-string/jumbo v6, "d4"

    invoke-interface {v4, v5, v6}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 573
    sget-object v5, Lcom/edutech/mobilestudyclient/activity/ActivityBase;->seed:Ljava/lang/String;

    invoke-static {v5, p3}, Lcom/edutech/idauthentication/AES;->encrypt(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 574
    const/4 v5, 0x0

    const-string/jumbo v6, "d4"

    invoke-interface {v4, v5, v6}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 576
    const/4 v5, 0x0

    const-string/jumbo v6, "e5"

    invoke-interface {v4, v5, v6}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 577
    sget-object v5, Lcom/edutech/mobilestudyclient/activity/ActivityBase;->seed:Ljava/lang/String;

    invoke-static {v5, p4}, Lcom/edutech/idauthentication/AES;->encrypt(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 578
    const/4 v5, 0x0

    const-string/jumbo v6, "e5"

    invoke-interface {v4, v5, v6}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 580
    const/4 v5, 0x0

    const-string/jumbo v6, "f6"

    invoke-interface {v4, v5, v6}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 581
    sget-object v5, Lcom/edutech/mobilestudyclient/activity/ActivityBase;->seed:Ljava/lang/String;

    invoke-static {v5, v2}, Lcom/edutech/idauthentication/AES;->encrypt(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 582
    const/4 v5, 0x0

    const-string/jumbo v6, "f6"

    invoke-interface {v4, v5, v6}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 584
    const/4 v5, 0x0

    const-string/jumbo v6, "id"

    invoke-interface {v4, v5, v6}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 586
    invoke-interface {v4}, Lorg/xmlpull/v1/XmlSerializer;->endDocument()V

    .line 587
    invoke-interface {v4}, Lorg/xmlpull/v1/XmlSerializer;->flush()V

    .line 588
    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 593
    :goto_1
    return-void

    .line 590
    :catch_0
    move-exception v5

    goto :goto_1

    .line 546
    .end local v4    # "serializer":Lorg/xmlpull/v1/XmlSerializer;
    :catch_1
    move-exception v5

    goto/16 :goto_0
.end method
