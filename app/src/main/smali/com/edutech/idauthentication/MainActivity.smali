.class public Lcom/edutech/idauthentication/MainActivity;
.super Ljava/lang/Object;
.source "MainActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/edutech/idauthentication/MainActivity$TouchListenerImpl;
    }
.end annotation


# static fields
.field public static apkTaskList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/edutech/idauthentication/Async;",
            ">;>;"
        }
    .end annotation
.end field

.field public static apkdownloadlist:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field public static apkfinList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static filepath:Ljava/lang/String;

.field private static idfile:Ljava/io/File;

.field public static isDown:Z

.field public static isUpdatePwd:Z

.field private static rightFile:Ljava/io/File;

.field private static rightFilePath:Ljava/lang/String;

.field public static seed:Ljava/lang/String;

.field public static selfpackageName:Ljava/lang/String;


# instance fields
.field apkUpdateRunnable:Ljava/lang/Runnable;

.field public apkUpdateThread:Ljava/lang/Thread;

.field private btnYes:Landroid/widget/Button;

.field private handler:Landroid/os/Handler;

.field keylistener:Landroid/content/DialogInterface$OnKeyListener;

.field public mContext:Landroid/content/Context;

.field private scrollView:Landroid/widget/ScrollView;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 117
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v1

    .line 118
    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v1, "/CloudClient/.System/idau.xml"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 117
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/edutech/idauthentication/MainActivity;->filepath:Ljava/lang/String;

    .line 119
    new-instance v0, Ljava/io/File;

    sget-object v1, Lcom/edutech/idauthentication/MainActivity;->filepath:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/edutech/idauthentication/MainActivity;->idfile:Ljava/io/File;

    .line 120
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v1

    .line 121
    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v1, "/CloudClient/.System/copyright.xml"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 120
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/edutech/idauthentication/MainActivity;->rightFilePath:Ljava/lang/String;

    .line 122
    new-instance v0, Ljava/io/File;

    sget-object v1, Lcom/edutech/idauthentication/MainActivity;->rightFilePath:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/edutech/idauthentication/MainActivity;->rightFile:Ljava/io/File;

    .line 124
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/edutech/idauthentication/MainActivity;->apkTaskList:Ljava/util/ArrayList;

    .line 125
    const/4 v0, 0x0

    sput-object v0, Lcom/edutech/idauthentication/MainActivity;->apkfinList:Ljava/util/ArrayList;

    .line 127
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/edutech/idauthentication/MainActivity;->apkdownloadlist:Ljava/util/ArrayList;

    .line 129
    const-string/jumbo v0, ""

    sput-object v0, Lcom/edutech/idauthentication/MainActivity;->selfpackageName:Ljava/lang/String;

    .line 130
    const-string/jumbo v0, "Edutech@2013"

    sput-object v0, Lcom/edutech/idauthentication/MainActivity;->seed:Ljava/lang/String;

    .line 131
    sput-boolean v2, Lcom/edutech/idauthentication/MainActivity;->isDown:Z

    .line 132
    sput-boolean v2, Lcom/edutech/idauthentication/MainActivity;->isUpdatePwd:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v0, 0x0

    .line 140
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 123
    iput-object v0, p0, Lcom/edutech/idauthentication/MainActivity;->mContext:Landroid/content/Context;

    .line 134
    iput-object v0, p0, Lcom/edutech/idauthentication/MainActivity;->apkUpdateThread:Ljava/lang/Thread;

    .line 912
    new-instance v0, Lcom/edutech/idauthentication/MainActivity$1;

    invoke-direct {v0, p0}, Lcom/edutech/idauthentication/MainActivity$1;-><init>(Lcom/edutech/idauthentication/MainActivity;)V

    iput-object v0, p0, Lcom/edutech/idauthentication/MainActivity;->handler:Landroid/os/Handler;

    .line 941
    new-instance v0, Lcom/edutech/idauthentication/MainActivity$2;

    invoke-direct {v0, p0}, Lcom/edutech/idauthentication/MainActivity$2;-><init>(Lcom/edutech/idauthentication/MainActivity;)V

    iput-object v0, p0, Lcom/edutech/idauthentication/MainActivity;->apkUpdateRunnable:Ljava/lang/Runnable;

    .line 1310
    new-instance v0, Lcom/edutech/idauthentication/MainActivity$3;

    invoke-direct {v0, p0}, Lcom/edutech/idauthentication/MainActivity$3;-><init>(Lcom/edutech/idauthentication/MainActivity;)V

    iput-object v0, p0, Lcom/edutech/idauthentication/MainActivity;->keylistener:Landroid/content/DialogInterface$OnKeyListener;

    .line 141
    iput-object p1, p0, Lcom/edutech/idauthentication/MainActivity;->mContext:Landroid/content/Context;

    .line 142
    return-void
.end method

.method static synthetic access$0(Lcom/edutech/idauthentication/MainActivity;)Landroid/os/Handler;
    .locals 1

    .prologue
    .line 912
    iget-object v0, p0, Lcom/edutech/idauthentication/MainActivity;->handler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$1(Lcom/edutech/idauthentication/MainActivity;)Landroid/widget/ScrollView;
    .locals 1

    .prologue
    .line 137
    iget-object v0, p0, Lcom/edutech/idauthentication/MainActivity;->scrollView:Landroid/widget/ScrollView;

    return-object v0
.end method

.method static synthetic access$2(Lcom/edutech/idauthentication/MainActivity;)Landroid/widget/Button;
    .locals 1

    .prologue
    .line 138
    iget-object v0, p0, Lcom/edutech/idauthentication/MainActivity;->btnYes:Landroid/widget/Button;

    return-object v0
.end method

.method static synthetic access$3()Ljava/lang/String;
    .locals 1

    .prologue
    .line 120
    sget-object v0, Lcom/edutech/idauthentication/MainActivity;->rightFilePath:Ljava/lang/String;

    return-object v0
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
    .line 295
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 296
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

    .line 297
    .local v16, "usedTimes":Ljava/lang/String;
    const/4 v6, 0x0

    .line 298
    .local v6, "filein":Ljava/io/FileInputStream;
    const/4 v13, 0x0

    .line 300
    .local v13, "result":I
    :try_start_0
    new-instance v7, Ljava/io/FileInputStream;

    sget-object v18, Lcom/edutech/idauthentication/MainActivity;->idfile:Ljava/io/File;

    move-object/from16 v0, v18

    invoke-direct {v7, v0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .end local v6    # "filein":Ljava/io/FileInputStream;
    .local v7, "filein":Ljava/io/FileInputStream;
    move-object v6, v7

    .line 307
    .end local v7    # "filein":Ljava/io/FileInputStream;
    .restart local v6    # "filein":Ljava/io/FileInputStream;
    :goto_0
    :try_start_1
    invoke-static {}, Lorg/xmlpull/v1/XmlPullParserFactory;->newInstance()Lorg/xmlpull/v1/XmlPullParserFactory;

    move-result-object v12

    .line 308
    .local v12, "pullParserFactory":Lorg/xmlpull/v1/XmlPullParserFactory;
    invoke-virtual {v12}, Lorg/xmlpull/v1/XmlPullParserFactory;->newPullParser()Lorg/xmlpull/v1/XmlPullParser;

    move-result-object v17

    .line 309
    .local v17, "xmlPullParser":Lorg/xmlpull/v1/XmlPullParser;
    const-string/jumbo v18, "UTF-8"

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-interface {v0, v6, v1}, Lorg/xmlpull/v1/XmlPullParser;->setInput(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 310
    invoke-interface/range {v17 .. v17}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I
    :try_end_1
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2

    move-result v5

    .line 311
    .local v5, "eventType":I
    :goto_1
    const/16 v18, 0x1

    move/from16 v0, v18

    if-ne v5, v0, :cond_6

    .line 358
    .end local v5    # "eventType":I
    .end local v12    # "pullParserFactory":Lorg/xmlpull/v1/XmlPullParserFactory;
    .end local v17    # "xmlPullParser":Lorg/xmlpull/v1/XmlPullParser;
    :goto_2
    :try_start_2
    invoke-virtual {v6}, Ljava/io/FileInputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_3

    .line 359
    const/4 v6, 0x0

    .line 365
    :goto_3
    const-string/jumbo v18, ""

    move-object/from16 v0, v18

    invoke-interface {v8, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 366
    const-string/jumbo v18, ""

    move-object/from16 v0, v18

    invoke-interface {v8, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 367
    const-string/jumbo v18, ""

    move-object/from16 v0, v18

    invoke-interface {v8, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 368
    const-string/jumbo v18, ""

    move-object/from16 v0, v18

    invoke-interface {v8, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 369
    const-string/jumbo v18, ""

    move-object/from16 v0, v18

    invoke-interface {v8, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 370
    const-string/jumbo v18, ""

    move-object/from16 v0, v18

    invoke-interface {v8, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 373
    if-eqz v9, :cond_0

    .line 374
    const/16 v18, 0x0

    :try_start_3
    sget-object v19, Lcom/edutech/idauthentication/MainActivity;->seed:Ljava/lang/String;

    move-object/from16 v0, v19

    invoke-static {v0, v9}, Lcom/edutech/idauthentication/AES;->decrypt(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    move/from16 v0, v18

    move-object/from16 v1, v19

    invoke-interface {v8, v0, v1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 376
    :cond_0
    if-eqz v10, :cond_1

    .line 377
    const/16 v18, 0x1

    sget-object v19, Lcom/edutech/idauthentication/MainActivity;->seed:Ljava/lang/String;

    move-object/from16 v0, v19

    invoke-static {v0, v10}, Lcom/edutech/idauthentication/AES;->decrypt(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    move/from16 v0, v18

    move-object/from16 v1, v19

    invoke-interface {v8, v0, v1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 379
    :cond_1
    if-eqz v14, :cond_2

    .line 380
    const/16 v18, 0x2

    sget-object v19, Lcom/edutech/idauthentication/MainActivity;->seed:Ljava/lang/String;

    move-object/from16 v0, v19

    invoke-static {v0, v14}, Lcom/edutech/idauthentication/AES;->decrypt(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    move/from16 v0, v18

    move-object/from16 v1, v19

    invoke-interface {v8, v0, v1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 382
    :cond_2
    if-eqz v15, :cond_3

    .line 383
    const/16 v18, 0x3

    sget-object v19, Lcom/edutech/idauthentication/MainActivity;->seed:Ljava/lang/String;

    move-object/from16 v0, v19

    invoke-static {v0, v15}, Lcom/edutech/idauthentication/AES;->decrypt(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    move/from16 v0, v18

    move-object/from16 v1, v19

    invoke-interface {v8, v0, v1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 385
    :cond_3
    if-eqz v2, :cond_4

    .line 386
    const/16 v18, 0x4

    sget-object v19, Lcom/edutech/idauthentication/MainActivity;->seed:Ljava/lang/String;

    move-object/from16 v0, v19

    invoke-static {v0, v2}, Lcom/edutech/idauthentication/AES;->decrypt(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    move/from16 v0, v18

    move-object/from16 v1, v19

    invoke-interface {v8, v0, v1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 388
    :cond_4
    if-eqz v16, :cond_5

    .line 389
    const/16 v18, 0x5

    sget-object v19, Lcom/edutech/idauthentication/MainActivity;->seed:Ljava/lang/String;

    move-object/from16 v0, v19

    move-object/from16 v1, v16

    invoke-static {v0, v1}, Lcom/edutech/idauthentication/AES;->decrypt(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    move/from16 v0, v18

    move-object/from16 v1, v19

    invoke-interface {v8, v0, v1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_4

    .line 395
    :cond_5
    :goto_4
    return-object v8

    .line 301
    :catch_0
    move-exception v4

    .line 304
    .local v4, "e1":Ljava/io/FileNotFoundException;
    invoke-virtual {v4}, Ljava/io/FileNotFoundException;->printStackTrace()V

    goto/16 :goto_0

    .line 312
    .end local v4    # "e1":Ljava/io/FileNotFoundException;
    .restart local v5    # "eventType":I
    .restart local v12    # "pullParserFactory":Lorg/xmlpull/v1/XmlPullParserFactory;
    .restart local v17    # "xmlPullParser":Lorg/xmlpull/v1/XmlPullParser;
    :cond_6
    :try_start_4
    invoke-interface/range {v17 .. v17}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v11

    .line 314
    .local v11, "nodeName":Ljava/lang/String;
    packed-switch v5, :pswitch_data_0

    .line 345
    :cond_7
    :goto_5
    :pswitch_0
    invoke-interface/range {v17 .. v17}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v5

    goto/16 :goto_1

    .line 319
    :pswitch_1
    const-string/jumbo v18, "a1"

    move-object/from16 v0, v18

    invoke-virtual {v0, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_8

    .line 320
    invoke-interface/range {v17 .. v17}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v9

    .line 322
    :cond_8
    const-string/jumbo v18, "b2"

    move-object/from16 v0, v18

    invoke-virtual {v0, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_9

    .line 323
    invoke-interface/range {v17 .. v17}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v10

    .line 325
    :cond_9
    const-string/jumbo v18, "c3"

    move-object/from16 v0, v18

    invoke-virtual {v0, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_a

    .line 326
    invoke-interface/range {v17 .. v17}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v14

    .line 328
    :cond_a
    const-string/jumbo v18, "d4"

    move-object/from16 v0, v18

    invoke-virtual {v0, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_b

    .line 329
    invoke-interface/range {v17 .. v17}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v15

    .line 331
    :cond_b
    const-string/jumbo v18, "e5"

    move-object/from16 v0, v18

    invoke-virtual {v0, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_c

    .line 332
    invoke-interface/range {v17 .. v17}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v2

    .line 334
    :cond_c
    const-string/jumbo v18, "f6"

    move-object/from16 v0, v18

    invoke-virtual {v0, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_7

    .line 335
    invoke-interface/range {v17 .. v17}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;
    :try_end_4
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_4 .. :try_end_4} :catch_1
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2

    move-result-object v16

    .line 338
    goto :goto_5

    .line 347
    .end local v5    # "eventType":I
    .end local v11    # "nodeName":Ljava/lang/String;
    .end local v12    # "pullParserFactory":Lorg/xmlpull/v1/XmlPullParserFactory;
    .end local v17    # "xmlPullParser":Lorg/xmlpull/v1/XmlPullParser;
    :catch_1
    move-exception v3

    .line 350
    .local v3, "e":Lorg/xmlpull/v1/XmlPullParserException;
    invoke-virtual {v3}, Lorg/xmlpull/v1/XmlPullParserException;->printStackTrace()V

    goto/16 :goto_2

    .line 351
    .end local v3    # "e":Lorg/xmlpull/v1/XmlPullParserException;
    :catch_2
    move-exception v3

    .line 354
    .local v3, "e":Ljava/io/IOException;
    invoke-virtual {v3}, Ljava/io/IOException;->printStackTrace()V

    goto/16 :goto_2

    .line 360
    .end local v3    # "e":Ljava/io/IOException;
    :catch_3
    move-exception v4

    .line 362
    .local v4, "e1":Ljava/io/IOException;
    invoke-virtual {v4}, Ljava/io/IOException;->printStackTrace()V

    goto/16 :goto_3

    .line 391
    .end local v4    # "e1":Ljava/io/IOException;
    :catch_4
    move-exception v3

    .line 393
    .local v3, "e":Ljava/lang/Exception;
    invoke-virtual {v3}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_4

    .line 314
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private sslClient(Lorg/apache/http/client/HttpClient;)Lorg/apache/http/client/HttpClient;
    .locals 10
    .param p1, "client"    # Lorg/apache/http/client/HttpClient;

    .prologue
    const/4 v7, 0x0

    .line 643
    :try_start_0
    new-instance v5, Lcom/edutech/idauthentication/MainActivity$4;

    invoke-direct {v5, p0}, Lcom/edutech/idauthentication/MainActivity$4;-><init>(Lcom/edutech/idauthentication/MainActivity;)V

    .line 654
    .local v5, "tm":Ljavax/net/ssl/X509TrustManager;
    const-string/jumbo v6, "TLS"

    invoke-static {v6}, Ljavax/net/ssl/SSLContext;->getInstance(Ljava/lang/String;)Ljavax/net/ssl/SSLContext;

    move-result-object v1

    .line 655
    .local v1, "ctx":Ljavax/net/ssl/SSLContext;
    const/4 v6, 0x0

    const/4 v8, 0x1

    new-array v8, v8, [Ljavax/net/ssl/TrustManager;

    const/4 v9, 0x0

    aput-object v5, v8, v9

    const/4 v9, 0x0

    invoke-virtual {v1, v6, v8, v9}, Ljavax/net/ssl/SSLContext;->init([Ljavax/net/ssl/KeyManager;[Ljavax/net/ssl/TrustManager;Ljava/security/SecureRandom;)V

    .line 656
    new-instance v4, Lcom/edutech/idauthentication/MySSLSocketFactory;

    invoke-direct {v4, v1}, Lcom/edutech/idauthentication/MySSLSocketFactory;-><init>(Ljavax/net/ssl/SSLContext;)V

    .line 657
    .local v4, "ssf":Lorg/apache/http/conn/ssl/SSLSocketFactory;
    sget-object v6, Lorg/apache/http/conn/ssl/SSLSocketFactory;->ALLOW_ALL_HOSTNAME_VERIFIER:Lorg/apache/http/conn/ssl/X509HostnameVerifier;

    invoke-virtual {v4, v6}, Lorg/apache/http/conn/ssl/SSLSocketFactory;->setHostnameVerifier(Lorg/apache/http/conn/ssl/X509HostnameVerifier;)V

    .line 658
    invoke-interface {p1}, Lorg/apache/http/client/HttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v0

    .line 659
    .local v0, "ccm":Lorg/apache/http/conn/ClientConnectionManager;
    invoke-interface {v0}, Lorg/apache/http/conn/ClientConnectionManager;->getSchemeRegistry()Lorg/apache/http/conn/scheme/SchemeRegistry;

    move-result-object v3

    .line 660
    .local v3, "sr":Lorg/apache/http/conn/scheme/SchemeRegistry;
    new-instance v6, Lorg/apache/http/conn/scheme/Scheme;

    const-string/jumbo v8, "https"

    const/16 v9, 0x1bb

    invoke-direct {v6, v8, v4, v9}, Lorg/apache/http/conn/scheme/Scheme;-><init>(Ljava/lang/String;Lorg/apache/http/conn/scheme/SocketFactory;I)V

    invoke-virtual {v3, v6}, Lorg/apache/http/conn/scheme/SchemeRegistry;->register(Lorg/apache/http/conn/scheme/Scheme;)Lorg/apache/http/conn/scheme/Scheme;

    .line 661
    new-instance v6, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-interface {p1}, Lorg/apache/http/client/HttpClient;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v8

    invoke-direct {v6, v0, v8}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>(Lorg/apache/http/conn/ClientConnectionManager;Lorg/apache/http/params/HttpParams;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 663
    .end local v0    # "ccm":Lorg/apache/http/conn/ClientConnectionManager;
    .end local v1    # "ctx":Ljavax/net/ssl/SSLContext;
    .end local v3    # "sr":Lorg/apache/http/conn/scheme/SchemeRegistry;
    .end local v4    # "ssf":Lorg/apache/http/conn/ssl/SSLSocketFactory;
    .end local v5    # "tm":Ljavax/net/ssl/X509TrustManager;
    :goto_0
    return-object v6

    .line 662
    :catch_0
    move-exception v2

    .local v2, "ex":Ljava/lang/Exception;
    move-object v6, v7

    .line 663
    goto :goto_0
.end method

.method public static toHexString([BLjava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p0, "bytes"    # [B
    .param p1, "separator"    # Ljava/lang/String;

    .prologue
    .line 558
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 559
    .local v1, "hexString":Ljava/lang/StringBuilder;
    array-length v3, p0

    const/4 v2, 0x0

    :goto_0
    if-lt v2, v3, :cond_0

    .line 562
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 559
    :cond_0
    aget-byte v0, p0, v2

    .line 560
    .local v0, "b":B
    and-int/lit16 v4, v0, 0xff

    invoke-static {v4}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 559
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method public static toMd5([B)[B
    .locals 2
    .param p0, "bytes"    # [B

    .prologue
    .line 547
    :try_start_0
    const-string/jumbo v1, "MD5"

    invoke-static {v1}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v0

    .line 548
    .local v0, "algorithm":Ljava/security/MessageDigest;
    invoke-virtual {v0}, Ljava/security/MessageDigest;->reset()V

    .line 549
    invoke-virtual {v0, p0}, Ljava/security/MessageDigest;->update([B)V

    .line 550
    invoke-virtual {v0}, Ljava/security/MessageDigest;->digest()[B
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 554
    .end local v0    # "algorithm":Ljava/security/MessageDigest;
    :goto_0
    return-object v1

    .line 551
    :catch_0
    move-exception v1

    .line 554
    const/4 v1, 0x0

    goto :goto_0
.end method


# virtual methods
.method public final GetMachineID()Ljava/lang/String;
    .locals 10

    .prologue
    .line 489
    iget-object v7, p0, Lcom/edutech/idauthentication/MainActivity;->mContext:Landroid/content/Context;

    const-string/jumbo v8, "phone"

    invoke-virtual {v7, v8}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/telephony/TelephonyManager;

    .line 490
    .local v5, "tm":Landroid/telephony/TelephonyManager;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 492
    .local v4, "sb":Ljava/lang/StringBuilder;
    new-instance v7, Ljava/lang/StringBuilder;

    const-string/jumbo v8, "\nModel = "

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v8, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 493
    new-instance v7, Ljava/lang/StringBuilder;

    const-string/jumbo v8, "\nSerialNumber = "

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v8, Landroid/os/Build;->SERIAL:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 494
    new-instance v7, Ljava/lang/StringBuilder;

    const-string/jumbo v8, "\nDeviceId(IMEI) = "

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5}, Landroid/telephony/TelephonyManager;->getDeviceId()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 496
    iget-object v7, p0, Lcom/edutech/idauthentication/MainActivity;->mContext:Landroid/content/Context;

    invoke-virtual {v7}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v7

    const-string/jumbo v8, "android_id"

    invoke-static {v7, v8}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 497
    .local v0, "android_id":Ljava/lang/String;
    new-instance v7, Ljava/lang/StringBuilder;

    const-string/jumbo v8, "\nAndroidID = "

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 499
    const-string/jumbo v3, ""

    .line 501
    .local v3, "m_szWLANMAC":Ljava/lang/String;
    :try_start_0
    iget-object v7, p0, Lcom/edutech/idauthentication/MainActivity;->mContext:Landroid/content/Context;

    const-string/jumbo v8, "wifi"

    invoke-virtual {v7, v8}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/net/wifi/WifiManager;

    .line 502
    .local v6, "wm":Landroid/net/wifi/WifiManager;
    invoke-virtual {v6}, Landroid/net/wifi/WifiManager;->getConnectionInfo()Landroid/net/wifi/WifiInfo;

    move-result-object v7

    invoke-virtual {v7}, Landroid/net/wifi/WifiInfo;->getMacAddress()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v3

    .line 509
    .end local v6    # "wm":Landroid/net/wifi/WifiManager;
    :goto_0
    if-eqz v3, :cond_0

    const-string/jumbo v7, ""

    invoke-virtual {v3, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 511
    :cond_0
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    const/4 v7, 0x5

    if-le v2, v7, :cond_3

    .line 535
    .end local v2    # "i":I
    :cond_1
    if-nez v3, :cond_2

    .line 537
    const-string/jumbo v3, ""

    .line 539
    :cond_2
    new-instance v7, Ljava/lang/StringBuilder;

    const-string/jumbo v8, "\nMACAddress = "

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 541
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/String;->getBytes()[B

    move-result-object v8

    invoke-static {v8}, Lcom/edutech/idauthentication/MainActivity;->toMd5([B)[B

    move-result-object v8

    const-string/jumbo v9, ""

    invoke-static {v8, v9}, Lcom/edutech/idauthentication/MainActivity;->toHexString([BLjava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v8, ":"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v8, ":"

    const-string/jumbo v9, ""

    invoke-virtual {v3, v8, v9}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    return-object v7

    .line 503
    :catch_0
    move-exception v1

    .line 505
    .local v1, "e":Ljava/lang/NullPointerException;
    const-string/jumbo v3, ""

    goto :goto_0

    .line 506
    .end local v1    # "e":Ljava/lang/NullPointerException;
    :catch_1
    move-exception v1

    .line 507
    .local v1, "e":Ljava/lang/Exception;
    const-string/jumbo v3, ""

    goto :goto_0

    .line 515
    .end local v1    # "e":Ljava/lang/Exception;
    .restart local v2    # "i":I
    :cond_3
    :try_start_1
    iget-object v7, p0, Lcom/edutech/idauthentication/MainActivity;->mContext:Landroid/content/Context;

    const-string/jumbo v8, "wifi"

    invoke-virtual {v7, v8}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/net/wifi/WifiManager;

    .line 516
    .restart local v6    # "wm":Landroid/net/wifi/WifiManager;
    invoke-virtual {v6}, Landroid/net/wifi/WifiManager;->getConnectionInfo()Landroid/net/wifi/WifiInfo;

    move-result-object v7

    invoke-virtual {v7}, Landroid/net/wifi/WifiInfo;->getMacAddress()Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/NullPointerException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_3

    move-result-object v3

    .line 523
    .end local v6    # "wm":Landroid/net/wifi/WifiManager;
    :goto_2
    if-eqz v3, :cond_4

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v7

    if-gtz v7, :cond_1

    .line 528
    :cond_4
    const-wide/16 v8, 0x7d0

    :try_start_2
    invoke-static {v8, v9}, Ljava/lang/Thread;->sleep(J)V
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_4

    .line 511
    :goto_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 517
    :catch_2
    move-exception v1

    .line 519
    .local v1, "e":Ljava/lang/NullPointerException;
    const-string/jumbo v3, ""

    goto :goto_2

    .line 520
    .end local v1    # "e":Ljava/lang/NullPointerException;
    :catch_3
    move-exception v1

    .line 521
    .local v1, "e":Ljava/lang/Exception;
    const-string/jumbo v3, ""

    goto :goto_2

    .line 529
    .end local v1    # "e":Ljava/lang/Exception;
    :catch_4
    move-exception v1

    .line 531
    .local v1, "e":Ljava/lang/InterruptedException;
    invoke-virtual {v1}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_3
.end method

.method public InstallApk()V
    .locals 2

    .prologue
    .line 909
    new-instance v0, Lcom/edutech/utils/InstallApkHelper;

    sget-object v1, Lcom/edutech/idauthentication/MainActivity;->selfpackageName:Ljava/lang/String;

    invoke-direct {v0, p0, v1}, Lcom/edutech/utils/InstallApkHelper;-><init>(Lcom/edutech/idauthentication/MainActivity;Ljava/lang/String;)V

    .line 910
    .local v0, "installapk":Lcom/edutech/utils/InstallApkHelper;
    invoke-virtual {v0}, Lcom/edutech/utils/InstallApkHelper;->InstallAll()V

    .line 911
    return-void
.end method

.method public addUsedTimes()V
    .locals 16

    .prologue
    .line 269
    const/4 v1, 0x0

    .local v1, "idString":Ljava/lang/String;
    const/4 v7, 0x0

    .local v7, "machineID":Ljava/lang/String;
    const/4 v8, 0x0

    .local v8, "resultString":Ljava/lang/String;
    const/4 v3, 0x0

    .local v3, "times":Ljava/lang/String;
    const/4 v9, 0x0

    .local v9, "usedTimes":Ljava/lang/String;
    const/4 v4, 0x0

    .line 271
    .local v4, "date":Ljava/lang/String;
    const/4 v6, 0x0

    .line 274
    .local v6, "idInfo":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    sget-object v0, Lcom/edutech/idauthentication/MainActivity;->idfile:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/edutech/idauthentication/MainActivity;->idfile:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v12

    const-wide/16 v14, 0x0

    cmp-long v0, v12, v14

    if-lez v0, :cond_0

    .line 276
    invoke-static {}, Lcom/edutech/idauthentication/MainActivity;->readIDFile()Ljava/util/List;

    move-result-object v6

    .line 278
    if-eqz v6, :cond_0

    .line 280
    const/4 v0, 0x0

    invoke-interface {v6, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    .end local v1    # "idString":Ljava/lang/String;
    check-cast v1, Ljava/lang/String;

    .line 281
    .restart local v1    # "idString":Ljava/lang/String;
    const/4 v0, 0x1

    invoke-interface {v6, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    .end local v7    # "machineID":Ljava/lang/String;
    check-cast v7, Ljava/lang/String;

    .line 282
    .restart local v7    # "machineID":Ljava/lang/String;
    const/4 v0, 0x2

    invoke-interface {v6, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    .end local v8    # "resultString":Ljava/lang/String;
    check-cast v8, Ljava/lang/String;

    .line 283
    .restart local v8    # "resultString":Ljava/lang/String;
    const/4 v0, 0x3

    invoke-interface {v6, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    .end local v3    # "times":Ljava/lang/String;
    check-cast v3, Ljava/lang/String;

    .line 284
    .restart local v3    # "times":Ljava/lang/String;
    const/4 v0, 0x4

    invoke-interface {v6, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    .end local v4    # "date":Ljava/lang/String;
    check-cast v4, Ljava/lang/String;

    .line 285
    .restart local v4    # "date":Ljava/lang/String;
    const/4 v0, 0x5

    invoke-interface {v6, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    .end local v9    # "usedTimes":Ljava/lang/String;
    check-cast v9, Ljava/lang/String;

    .line 287
    .restart local v9    # "usedTimes":Ljava/lang/String;
    invoke-static {v9}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    add-int/lit8 v10, v0, 0x1

    .line 289
    .local v10, "usedTimesInt":I
    invoke-static {v8}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    invoke-static {v10}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, p0

    invoke-virtual/range {v0 .. v5}, Lcom/edutech/idauthentication/MainActivity;->writeidFile(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 292
    .end local v10    # "usedTimesInt":I
    :cond_0
    return-void
.end method

.method public alogparserJson(Ljava/lang/String;Ljava/lang/String;Lcom/edutech/idauthentication/LogInfo;Ljava/lang/String;)Lcom/edutech/idauthentication/LogInfo;
    .locals 0
    .param p1, "studentId"    # Ljava/lang/String;
    .param p2, "machineId"    # Ljava/lang/String;
    .param p3, "loginfo"    # Lcom/edutech/idauthentication/LogInfo;
    .param p4, "json"    # Ljava/lang/String;

    .prologue
    .line 703
    invoke-static {p1, p2, p3, p4}, Lcom/edutech/idauthentication/JsonHelper;->alogparserJson(Ljava/lang/String;Ljava/lang/String;Lcom/edutech/idauthentication/LogInfo;Ljava/lang/String;)Lcom/edutech/idauthentication/LogInfo;

    move-result-object p3

    .line 704
    return-object p3
.end method

.method public apkUpdate(Ljava/lang/String;)V
    .locals 2
    .param p1, "packagename"    # Ljava/lang/String;

    .prologue
    .line 824
    sput-object p1, Lcom/edutech/idauthentication/MainActivity;->selfpackageName:Ljava/lang/String;

    .line 825
    sget-boolean v0, Lcom/edutech/idauthentication/MainActivity;->isDown:Z

    if-nez v0, :cond_1

    .line 826
    const/4 v0, 0x1

    sput-boolean v0, Lcom/edutech/idauthentication/MainActivity;->isDown:Z

    .line 827
    iget-object v0, p0, Lcom/edutech/idauthentication/MainActivity;->apkUpdateThread:Ljava/lang/Thread;

    if-nez v0, :cond_0

    .line 828
    new-instance v0, Ljava/lang/Thread;

    iget-object v1, p0, Lcom/edutech/idauthentication/MainActivity;->apkUpdateRunnable:Ljava/lang/Runnable;

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    iput-object v0, p0, Lcom/edutech/idauthentication/MainActivity;->apkUpdateThread:Ljava/lang/Thread;

    .line 830
    :cond_0
    iget-object v0, p0, Lcom/edutech/idauthentication/MainActivity;->apkUpdateThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->isAlive()Z

    move-result v0

    if-nez v0, :cond_1

    .line 835
    iget-object v0, p0, Lcom/edutech/idauthentication/MainActivity;->apkUpdateThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 838
    :cond_1
    return-void
.end method

.method public checkIDAuth()I
    .locals 20

    .prologue
    .line 160
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

    .line 162
    .local v4, "date":Ljava/lang/String;
    const/4 v9, 0x0

    .line 165
    .local v9, "idInfo":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    sget-object v0, Lcom/edutech/idauthentication/MainActivity;->idfile:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/edutech/idauthentication/MainActivity;->idfile:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v16

    const-wide/16 v18, 0x0

    cmp-long v0, v16, v18

    if-gtz v0, :cond_1

    .line 166
    :cond_0
    const/4 v0, 0x1

    .line 264
    :goto_0
    return v0

    .line 169
    :cond_1
    invoke-static {}, Lcom/edutech/idauthentication/MainActivity;->readIDFile()Ljava/util/List;

    move-result-object v9

    .line 171
    if-eqz v9, :cond_3

    .line 173
    const/4 v0, 0x0

    invoke-interface {v9, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    .end local v1    # "idString":Ljava/lang/String;
    check-cast v1, Ljava/lang/String;

    .line 174
    .restart local v1    # "idString":Ljava/lang/String;
    const/4 v0, 0x1

    invoke-interface {v9, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    .end local v10    # "machineID":Ljava/lang/String;
    check-cast v10, Ljava/lang/String;

    .line 175
    .restart local v10    # "machineID":Ljava/lang/String;
    const/4 v0, 0x2

    invoke-interface {v9, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    .end local v11    # "resultString":Ljava/lang/String;
    check-cast v11, Ljava/lang/String;

    .line 176
    .restart local v11    # "resultString":Ljava/lang/String;
    const/4 v0, 0x3

    invoke-interface {v9, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    .end local v3    # "times":Ljava/lang/String;
    check-cast v3, Ljava/lang/String;

    .line 177
    .restart local v3    # "times":Ljava/lang/String;
    const/4 v0, 0x4

    invoke-interface {v9, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    .end local v4    # "date":Ljava/lang/String;
    check-cast v4, Ljava/lang/String;

    .line 178
    .restart local v4    # "date":Ljava/lang/String;
    const/4 v0, 0x5

    invoke-interface {v9, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v13

    .end local v13    # "usedTimes":Ljava/lang/String;
    check-cast v13, Ljava/lang/String;

    .line 192
    .restart local v13    # "usedTimes":Ljava/lang/String;
    if-eqz v1, :cond_2

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v2, 0x10

    if-ge v0, v2, :cond_4

    .line 193
    :cond_2
    const/4 v0, 0x3

    goto :goto_0

    .line 189
    :cond_3
    const/4 v0, 0x2

    goto :goto_0

    .line 196
    :cond_4
    if-eqz v10, :cond_5

    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v2, 0x20

    if-lt v0, v2, :cond_5

    invoke-virtual/range {p0 .. p0}, Lcom/edutech/idauthentication/MainActivity;->GetMachineID()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v10, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_6

    .line 197
    :cond_5
    const/4 v0, 0x4

    goto :goto_0

    .line 200
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

    .line 201
    :cond_7
    const/4 v0, 0x5

    goto :goto_0

    .line 204
    :cond_8
    new-instance v7, Ljava/util/Date;

    invoke-direct {v7}, Ljava/util/Date;-><init>()V

    .line 205
    .local v7, "curretDate":Ljava/util/Date;
    new-instance v12, Ljava/text/SimpleDateFormat;

    const-string/jumbo v0, "yyyy-MM-dd"

    invoke-direct {v12, v0}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 206
    .local v12, "sdf":Ljava/text/SimpleDateFormat;
    const/4 v6, 0x0

    .line 208
    .local v6, "authDate":Ljava/util/Date;
    if-eqz v4, :cond_a

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v2, 0xa

    if-lt v0, v2, :cond_a

    .line 212
    :try_start_0
    invoke-virtual {v12, v4}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v6

    .line 218
    :goto_1
    if-eqz v6, :cond_9

    invoke-virtual {v7, v6}, Ljava/util/Date;->after(Ljava/util/Date;)Z

    move-result v0

    if-eqz v0, :cond_a

    .line 219
    :cond_9
    const/4 v0, 0x6

    goto/16 :goto_0

    .line 213
    :catch_0
    move-exception v8

    .line 215
    .local v8, "e":Ljava/text/ParseException;
    invoke-virtual {v8}, Ljava/text/ParseException;->printStackTrace()V

    goto :goto_1

    .line 222
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

    .line 224
    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    invoke-static {v13}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    if-gt v0, v2, :cond_b

    .line 225
    const/4 v0, 0x7

    goto/16 :goto_0

    .line 227
    :cond_b
    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    if-lez v0, :cond_c

    .line 230
    invoke-static {v13}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    add-int/lit8 v14, v0, 0x1

    .line 231
    .local v14, "usedTimesInt":I
    invoke-static {v11}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    invoke-static {v14}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, p0

    invoke-virtual/range {v0 .. v5}, Lcom/edutech/idauthentication/MainActivity;->writeidFile(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 264
    .end local v14    # "usedTimesInt":I
    :cond_c
    const/4 v0, 0x0

    goto/16 :goto_0
.end method

.method public checkNotFoundUrl(Ljava/lang/String;)Z
    .locals 5
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 1182
    const/4 v3, -0x1

    .line 1184
    .local v3, "status":I
    :try_start_0
    const-string/jumbo v4, "http://"

    invoke-virtual {p1, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 1186
    new-instance v1, Lorg/apache/http/client/methods/HttpHead;

    invoke-direct {v1, p1}, Lorg/apache/http/client/methods/HttpHead;-><init>(Ljava/lang/String;)V

    .line 1187
    .local v1, "head":Lorg/apache/http/client/methods/HttpHead;
    new-instance v0, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v0}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    .line 1188
    .local v0, "client":Lorg/apache/http/client/HttpClient;
    invoke-interface {v0, v1}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v2

    .line 1189
    .local v2, "resp":Lorg/apache/http/HttpResponse;
    invoke-interface {v2}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v4

    invoke-interface {v4}, Lorg/apache/http/StatusLine;->getStatusCode()I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v3

    .line 1193
    .end local v0    # "client":Lorg/apache/http/client/HttpClient;
    .end local v1    # "head":Lorg/apache/http/client/methods/HttpHead;
    .end local v2    # "resp":Lorg/apache/http/HttpResponse;
    :cond_0
    :goto_0
    const/16 v4, 0x194

    if-eq v3, v4, :cond_1

    const/16 v4, 0x1f4

    if-ne v3, v4, :cond_2

    .line 1195
    :cond_1
    const/4 v4, 0x1

    .line 1198
    :goto_1
    return v4

    :cond_2
    const/4 v4, 0x0

    goto :goto_1

    .line 1191
    :catch_0
    move-exception v4

    goto :goto_0
.end method

.method public clearTimer(Ljava/util/Timer;Ljava/util/TimerTask;)V
    .locals 1
    .param p1, "mTimer"    # Ljava/util/Timer;
    .param p2, "mTimerTask"    # Ljava/util/TimerTask;

    .prologue
    .line 1203
    if-eqz p1, :cond_1

    .line 1204
    if-eqz p2, :cond_0

    .line 1205
    invoke-virtual {p2}, Ljava/util/TimerTask;->cancel()Z

    .line 1210
    :cond_0
    :goto_0
    return-void

    .line 1208
    :cond_1
    new-instance p1, Ljava/util/Timer;

    .end local p1    # "mTimer":Ljava/util/Timer;
    const/4 v0, 0x1

    invoke-direct {p1, v0}, Ljava/util/Timer;-><init>(Z)V

    .restart local p1    # "mTimer":Ljava/util/Timer;
    goto :goto_0
.end method

.method public getAppInfo()V
    .locals 2

    .prologue
    .line 900
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 901
    .local v0, "appInfoList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;>;"
    iget-object v1, p0, Lcom/edutech/idauthentication/MainActivity;->mContext:Landroid/content/Context;

    invoke-static {v0, v1}, Lcom/edutech/utils/SystemInfoHelper;->getSystemInfo(Ljava/util/ArrayList;Landroid/content/Context;)Ljava/util/ArrayList;

    move-result-object v0

    .line 906
    return-void
.end method

.method public getDataFromAssets(Ljava/lang/String;)Ljava/lang/String;
    .locals 7
    .param p1, "filePath"    # Ljava/lang/String;

    .prologue
    .line 1327
    const/4 v0, 0x0

    .line 1328
    .local v0, "br":Ljava/io/BufferedReader;
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    .line 1330
    .local v4, "sb":Ljava/lang/StringBuffer;
    :try_start_0
    new-instance v1, Ljava/io/BufferedReader;

    new-instance v5, Ljava/io/InputStreamReader;

    iget-object v6, p0, Lcom/edutech/idauthentication/MainActivity;->mContext:Landroid/content/Context;

    invoke-virtual {v6}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v6

    invoke-virtual {v6, p1}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v1, v5}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_4
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1332
    .end local v0    # "br":Ljava/io/BufferedReader;
    .local v1, "br":Ljava/io/BufferedReader;
    :goto_0
    :try_start_1
    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-result-object v3

    .local v3, "line":Ljava/lang/String;
    if-nez v3, :cond_0

    .line 1339
    :try_start_2
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_3

    move-object v0, v1

    .line 1344
    .end local v1    # "br":Ljava/io/BufferedReader;
    .end local v3    # "line":Ljava/lang/String;
    .restart local v0    # "br":Ljava/io/BufferedReader;
    :goto_1
    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    return-object v5

    .line 1333
    .end local v0    # "br":Ljava/io/BufferedReader;
    .restart local v1    # "br":Ljava/io/BufferedReader;
    .restart local v3    # "line":Ljava/lang/String;
    :cond_0
    :try_start_3
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v6, "\n"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_0

    .line 1335
    .end local v3    # "line":Ljava/lang/String;
    :catch_0
    move-exception v2

    move-object v0, v1

    .line 1336
    .end local v1    # "br":Ljava/io/BufferedReader;
    .restart local v0    # "br":Ljava/io/BufferedReader;
    .local v2, "e":Ljava/io/IOException;
    :goto_2
    :try_start_4
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 1339
    :try_start_5
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_1

    goto :goto_1

    .line 1340
    :catch_1
    move-exception v2

    .line 1341
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_1

    .line 1337
    .end local v2    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v5

    .line 1339
    :goto_3
    :try_start_6
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_2

    .line 1343
    :goto_4
    throw v5

    .line 1340
    :catch_2
    move-exception v2

    .line 1341
    .restart local v2    # "e":Ljava/io/IOException;
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_4

    .line 1340
    .end local v0    # "br":Ljava/io/BufferedReader;
    .end local v2    # "e":Ljava/io/IOException;
    .restart local v1    # "br":Ljava/io/BufferedReader;
    .restart local v3    # "line":Ljava/lang/String;
    :catch_3
    move-exception v2

    .line 1341
    .restart local v2    # "e":Ljava/io/IOException;
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V

    move-object v0, v1

    .end local v1    # "br":Ljava/io/BufferedReader;
    .restart local v0    # "br":Ljava/io/BufferedReader;
    goto :goto_1

    .line 1337
    .end local v0    # "br":Ljava/io/BufferedReader;
    .end local v2    # "e":Ljava/io/IOException;
    .end local v3    # "line":Ljava/lang/String;
    .restart local v1    # "br":Ljava/io/BufferedReader;
    :catchall_1
    move-exception v5

    move-object v0, v1

    .end local v1    # "br":Ljava/io/BufferedReader;
    .restart local v0    # "br":Ljava/io/BufferedReader;
    goto :goto_3

    .line 1335
    :catch_4
    move-exception v2

    goto :goto_2
.end method

.method public getExamLog(Lcom/edutech/idauthentication/LogInfo;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/edutech/idauthentication/LogInfo;
    .locals 0
    .param p1, "loginfo"    # Lcom/edutech/idauthentication/LogInfo;
    .param p2, "MachineID"    # Ljava/lang/String;
    .param p3, "Type"    # Ljava/lang/String;
    .param p4, "UserID"    # Ljava/lang/String;
    .param p5, "SubjectID"    # Ljava/lang/String;
    .param p6, "BookID"    # Ljava/lang/String;
    .param p7, "BookName"    # Ljava/lang/String;
    .param p8, "AssetsID"    # Ljava/lang/String;
    .param p9, "AssetsName"    # Ljava/lang/String;

    .prologue
    .line 731
    invoke-static/range {p1 .. p9}, Lcom/edutech/idauthentication/JsonHelper;->getExamLog(Lcom/edutech/idauthentication/LogInfo;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/edutech/idauthentication/LogInfo;

    move-result-object p1

    .line 732
    return-object p1
.end method

.method public final getIDAuth()Ljava/lang/String;
    .locals 1

    .prologue
    .line 484
    const/4 v0, 0x0

    return-object v0
.end method

.method public getSettingPwd()Ljava/lang/String;
    .locals 9

    .prologue
    .line 781
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 782
    .local v6, "settinginfo":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;>;"
    invoke-static {v6}, Lcom/edutech/utils/XmlLoadHelper;->loadXml(Ljava/util/ArrayList;)Ljava/util/ArrayList;

    move-result-object v6

    .line 783
    const-string/jumbo v4, ""

    .line 784
    .local v4, "password":Ljava/lang/String;
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v7

    const/4 v8, 0x1

    if-ne v7, v8, :cond_0

    .line 786
    const/4 v7, 0x0

    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/HashMap;

    const-string/jumbo v8, "password"

    invoke-virtual {v7, v8}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    .end local v4    # "password":Ljava/lang/String;
    check-cast v4, Ljava/lang/String;

    .restart local v4    # "password":Ljava/lang/String;
    move-object v5, v4

    .line 804
    .end local v4    # "password":Ljava/lang/String;
    .local v5, "password":Ljava/lang/String;
    :goto_0
    if-eqz v5, :cond_4

    const-string/jumbo v7, ""

    invoke-virtual {v7, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_4

    .line 806
    new-instance v0, Lcom/edutech/idauthentication/AESSet;

    invoke-direct {v0}, Lcom/edutech/idauthentication/AESSet;-><init>()V

    .line 808
    .local v0, "aesSetting":Lcom/edutech/idauthentication/AESSet;
    :try_start_0
    new-instance v4, Ljava/lang/String;

    invoke-virtual {v0, v5}, Lcom/edutech/idauthentication/AESSet;->decrypt(Ljava/lang/String;)[B

    move-result-object v7

    const-string/jumbo v8, "UTF-8"

    invoke-direct {v4, v7, v8}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 820
    .end local v0    # "aesSetting":Lcom/edutech/idauthentication/AESSet;
    .end local v5    # "password":Ljava/lang/String;
    .restart local v4    # "password":Ljava/lang/String;
    :goto_1
    return-object v4

    .line 787
    :cond_0
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v7

    const/4 v8, 0x2

    if-lt v7, v8, :cond_1

    .line 788
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_2
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v7

    if-lt v2, v7, :cond_2

    .end local v2    # "i":I
    :cond_1
    move-object v5, v4

    .end local v4    # "password":Ljava/lang/String;
    .restart local v5    # "password":Ljava/lang/String;
    goto :goto_0

    .line 789
    .end local v5    # "password":Ljava/lang/String;
    .restart local v2    # "i":I
    .restart local v4    # "password":Ljava/lang/String;
    :cond_2
    invoke-virtual {v6, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/HashMap;

    const-string/jumbo v8, "isnew"

    invoke-virtual {v7, v8}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 790
    .local v3, "isNew":Ljava/lang/String;
    if-eqz v3, :cond_3

    const-string/jumbo v7, "1"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 792
    invoke-virtual {v6, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/HashMap;

    const-string/jumbo v8, "password"

    invoke-virtual {v7, v8}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    .end local v4    # "password":Ljava/lang/String;
    check-cast v4, Ljava/lang/String;

    .line 788
    .restart local v4    # "password":Ljava/lang/String;
    :cond_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 809
    .end local v2    # "i":I
    .end local v3    # "isNew":Ljava/lang/String;
    .end local v4    # "password":Ljava/lang/String;
    .restart local v0    # "aesSetting":Lcom/edutech/idauthentication/AESSet;
    .restart local v5    # "password":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 811
    .local v1, "e":Ljava/io/UnsupportedEncodingException;
    invoke-virtual {v1}, Ljava/io/UnsupportedEncodingException;->printStackTrace()V

    .line 812
    const-string/jumbo v4, ""

    .end local v5    # "password":Ljava/lang/String;
    .restart local v4    # "password":Ljava/lang/String;
    goto :goto_1

    .line 813
    .end local v1    # "e":Ljava/io/UnsupportedEncodingException;
    .end local v4    # "password":Ljava/lang/String;
    .restart local v5    # "password":Ljava/lang/String;
    :catch_1
    move-exception v1

    .line 815
    .local v1, "e":Ljava/lang/Exception;
    const-string/jumbo v4, ""

    .line 816
    .end local v5    # "password":Ljava/lang/String;
    .restart local v4    # "password":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1

    .end local v0    # "aesSetting":Lcom/edutech/idauthentication/AESSet;
    .end local v1    # "e":Ljava/lang/Exception;
    .end local v4    # "password":Ljava/lang/String;
    .restart local v5    # "password":Ljava/lang/String;
    :cond_4
    move-object v4, v5

    .end local v5    # "password":Ljava/lang/String;
    .restart local v4    # "password":Ljava/lang/String;
    goto :goto_1
.end method

.method public getStuId(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "userName"    # Ljava/lang/String;

    .prologue
    .line 681
    invoke-static {p1}, Lcom/edutech/idauthentication/JsonHelper;->idXmlParse(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getUpdateJson(Ljava/lang/String;)Ljava/lang/String;
    .locals 7
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    const/4 v6, 0x6

    .line 862
    const/4 v3, 0x0

    .line 863
    .local v3, "netCount":I
    :goto_0
    if-ge v3, v6, :cond_0

    iget-object v4, p0, Lcom/edutech/idauthentication/MainActivity;->mContext:Landroid/content/Context;

    invoke-static {v4}, Lcom/edutech/utils/NetWorkHelper;->isNetworkConnected(Landroid/content/Context;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 874
    :cond_0
    const-string/jumbo v4, "url"

    invoke-static {v4, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 875
    invoke-static {p1}, Lcom/edutech/idauthentication/PostThreadHelper;->postHttp(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 876
    .local v2, "json":Ljava/lang/String;
    const/4 v1, 0x0

    .line 877
    .local v1, "i":I
    :goto_1
    if-ge v1, v6, :cond_1

    if-eqz v2, :cond_3

    const-string/jumbo v4, ""

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_3

    .line 896
    :cond_1
    return-object v2

    .line 867
    .end local v1    # "i":I
    .end local v2    # "json":Ljava/lang/String;
    :cond_2
    add-int/lit8 v3, v3, 0x1

    .line 868
    const-wide/16 v4, 0x1388

    :try_start_0
    invoke-static {v4, v5}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 869
    :catch_0
    move-exception v0

    .line 871
    .local v0, "e1":Ljava/lang/InterruptedException;
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_0

    .line 881
    .end local v0    # "e1":Ljava/lang/InterruptedException;
    .restart local v1    # "i":I
    .restart local v2    # "json":Ljava/lang/String;
    :cond_3
    const-wide/16 v4, 0x1388

    :try_start_1
    invoke-static {v4, v5}, Ljava/lang/Thread;->sleep(J)V

    .line 882
    add-int/lit8 v1, v1, 0x1

    .line 883
    invoke-static {p1}, Lcom/edutech/idauthentication/PostThreadHelper;->postHttp(Ljava/lang/String;)Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v2

    goto :goto_1

    .line 884
    :catch_1
    move-exception v0

    .line 886
    .restart local v0    # "e1":Ljava/lang/InterruptedException;
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_1
.end method

.method public goBackError(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1
    .param p1, "errorMessage"    # Ljava/lang/String;
    .param p2, "jsName"    # Ljava/lang/String;

    .prologue
    .line 741
    invoke-static {p1, p2}, Lcom/edutech/idauthentication/OnConsoleHelper;->goBackError(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public logPostHttp(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "ip"    # Ljava/lang/String;
    .param p2, "logPath"    # Ljava/lang/String;

    .prologue
    .line 723
    invoke-static {p1, p2}, Lcom/edutech/idauthentication/PostThreadHelper;->logPostHttp(Ljava/lang/String;Ljava/lang/String;)V

    .line 725
    return-void
.end method

.method public logscreateJson(Lcom/edutech/idauthentication/LogInfo;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "loginfo"    # Lcom/edutech/idauthentication/LogInfo;
    .param p2, "logPath"    # Ljava/lang/String;

    .prologue
    .line 713
    invoke-static {p1, p2}, Lcom/edutech/idauthentication/JsonHelper;->logscreateJson(Lcom/edutech/idauthentication/LogInfo;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 714
    .local v0, "Logjson":Ljava/lang/String;
    return-object v0
.end method

.method public saveStuId(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "userName"    # Ljava/lang/String;
    .param p2, "stuId"    # Ljava/lang/String;

    .prologue
    .line 692
    invoke-static {p1, p2}, Lcom/edutech/idauthentication/JsonHelper;->idXmlCreate(Ljava/lang/String;Ljava/lang/String;)V

    .line 693
    return-void
.end method

.method public setStartLoadingTime()J
    .locals 2

    .prologue
    .line 1213
    const-wide/16 v0, 0xbb8

    .line 1214
    .local v0, "time":J
    return-wide v0
.end method

.method public setStartLogSendTime(Z)J
    .locals 2
    .param p1, "isUnUpLog"    # Z

    .prologue
    .line 1218
    const-wide/32 v0, 0x2932e00

    .line 1219
    .local v0, "time":J
    if-eqz p1, :cond_0

    .line 1220
    const-wide/32 v0, 0x36ee80

    .line 1222
    :cond_0
    return-wide v0
.end method

.method public settingPwdUpdate(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "type"    # Ljava/lang/String;
    .param p2, "password"    # Ljava/lang/String;

    .prologue
    .line 777
    invoke-static {p1, p2}, Lcom/edutech/idauthentication/PostThreadHelper;->savdSettingPwd(Ljava/lang/String;Ljava/lang/String;)V

    .line 778
    return-void
.end method

.method public settingPwdUpdateHttp()V
    .locals 1

    .prologue
    .line 749
    sget-boolean v0, Lcom/edutech/idauthentication/MainActivity;->isUpdatePwd:Z

    if-nez v0, :cond_0

    .line 750
    const/4 v0, 0x1

    sput-boolean v0, Lcom/edutech/idauthentication/MainActivity;->isUpdatePwd:Z

    .line 751
    new-instance v0, Lcom/edutech/idauthentication/MainActivity$5;

    invoke-direct {v0, p0}, Lcom/edutech/idauthentication/MainActivity$5;-><init>(Lcom/edutech/idauthentication/MainActivity;)V

    .line 772
    invoke-virtual {v0}, Lcom/edutech/idauthentication/MainActivity$5;->start()V

    .line 774
    :cond_0
    return-void
.end method

.method public userLicenseAgreementDialog()V
    .locals 7

    .prologue
    const/4 v6, 0x0

    .line 1229
    iget-object v4, p0, Lcom/edutech/idauthentication/MainActivity;->mContext:Landroid/content/Context;

    sget v5, Lcom/edutech/idauthentication/R$layout;->layout_userlicense:I

    invoke-static {v4, v5, v6}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v3

    .line 1230
    .local v3, "view":Landroid/view/View;
    sget v4, Lcom/edutech/idauthentication/R$id;->btnYes:I

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/Button;

    iput-object v4, p0, Lcom/edutech/idauthentication/MainActivity;->btnYes:Landroid/widget/Button;

    .line 1231
    sget v4, Lcom/edutech/idauthentication/R$id;->btnCancle:I

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    .line 1232
    .local v0, "btnCancle":Landroid/widget/Button;
    sget v4, Lcom/edutech/idauthentication/R$id;->tvUserLiceseContent:I

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    .line 1233
    .local v2, "tvUserLiceseContent":Landroid/widget/TextView;
    sget v4, Lcom/edutech/idauthentication/R$id;->ScrollView:I

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/ScrollView;

    iput-object v4, p0, Lcom/edutech/idauthentication/MainActivity;->scrollView:Landroid/widget/ScrollView;

    .line 1234
    const-string/jumbo v4, "UserLicenseAgreement.txt"

    invoke-virtual {p0, v4}, Lcom/edutech/idauthentication/MainActivity;->getDataFromAssets(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1238
    sget-object v4, Lcom/edutech/idauthentication/MainActivity;->rightFile:Ljava/io/File;

    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 1268
    :goto_0
    return-void

    .line 1241
    :cond_0
    new-instance v4, Landroid/app/AlertDialog$Builder;

    iget-object v5, p0, Lcom/edutech/idauthentication/MainActivity;->mContext:Landroid/content/Context;

    invoke-direct {v4, v5}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 1242
    const-string/jumbo v5, "\u7528\u6237\u6700\u7ec8\u8bb8\u53ef\u534f\u8bae"

    invoke-virtual {v4, v5}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    .line 1243
    invoke-virtual {v4, v3}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    .line 1244
    iget-object v5, p0, Lcom/edutech/idauthentication/MainActivity;->keylistener:Landroid/content/DialogInterface$OnKeyListener;

    invoke-virtual {v4, v5}, Landroid/app/AlertDialog$Builder;->setOnKeyListener(Landroid/content/DialogInterface$OnKeyListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    .line 1245
    invoke-virtual {v4}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    move-result-object v1

    .line 1246
    .local v1, "dialog":Landroid/app/AlertDialog;
    iget-object v4, p0, Lcom/edutech/idauthentication/MainActivity;->scrollView:Landroid/widget/ScrollView;

    new-instance v5, Lcom/edutech/idauthentication/MainActivity$TouchListenerImpl;

    invoke-direct {v5, p0, v6}, Lcom/edutech/idauthentication/MainActivity$TouchListenerImpl;-><init>(Lcom/edutech/idauthentication/MainActivity;Lcom/edutech/idauthentication/MainActivity$TouchListenerImpl;)V

    invoke-virtual {v4, v5}, Landroid/widget/ScrollView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 1247
    iget-object v4, p0, Lcom/edutech/idauthentication/MainActivity;->btnYes:Landroid/widget/Button;

    new-instance v5, Lcom/edutech/idauthentication/MainActivity$6;

    invoke-direct {v5, p0, v1}, Lcom/edutech/idauthentication/MainActivity$6;-><init>(Lcom/edutech/idauthentication/MainActivity;Landroid/app/AlertDialog;)V

    invoke-virtual {v4, v5}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1258
    new-instance v4, Lcom/edutech/idauthentication/MainActivity$7;

    invoke-direct {v4, p0}, Lcom/edutech/idauthentication/MainActivity$7;-><init>(Lcom/edutech/idauthentication/MainActivity;)V

    invoke-virtual {v0, v4}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_0
.end method

.method public writeidFile(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 8
    .param p1, "idString"    # Ljava/lang/String;
    .param p2, "result"    # I
    .param p3, "times"    # Ljava/lang/String;
    .param p4, "date"    # Ljava/lang/String;
    .param p5, "usedTimes"    # Ljava/lang/String;

    .prologue
    const/4 v7, 0x5

    .line 401
    const/4 v1, 0x0

    .line 402
    .local v1, "fileos":Ljava/io/FileOutputStream;
    move-object v3, p5

    .line 403
    .local v3, "hasUsedTimes":Ljava/lang/String;
    const/4 v4, 0x0

    .line 405
    .local v4, "idInfo":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    sget-object v6, Lcom/edutech/idauthentication/MainActivity;->idfile:Ljava/io/File;

    invoke-virtual {v6}, Ljava/io/File;->exists()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 407
    const-string/jumbo v6, "0"

    invoke-virtual {p5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 409
    invoke-static {}, Lcom/edutech/idauthentication/MainActivity;->readIDFile()Ljava/util/List;

    move-result-object v4

    .line 410
    const/4 v6, 0x0

    invoke-interface {v4, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-virtual {v6, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-interface {v4, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    if-eqz v6, :cond_0

    invoke-interface {v4, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    if-lez v6, :cond_0

    .line 412
    invoke-interface {v4, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    .end local v3    # "hasUsedTimes":Ljava/lang/String;
    check-cast v3, Ljava/lang/String;

    .line 416
    .restart local v3    # "hasUsedTimes":Ljava/lang/String;
    :cond_0
    sget-object v6, Lcom/edutech/idauthentication/MainActivity;->idfile:Ljava/io/File;

    invoke-virtual {v6}, Ljava/io/File;->delete()Z

    .line 418
    :cond_1
    sget-object v6, Lcom/edutech/idauthentication/MainActivity;->filepath:Ljava/lang/String;

    invoke-static {v6}, Lcom/edutech/idauthentication/FileInOutHelper;->setupOrOpenFile(Ljava/lang/String;)Ljava/io/File;

    move-result-object v6

    sput-object v6, Lcom/edutech/idauthentication/MainActivity;->idfile:Ljava/io/File;

    .line 421
    :try_start_0
    new-instance v2, Ljava/io/FileOutputStream;

    sget-object v6, Lcom/edutech/idauthentication/MainActivity;->idfile:Ljava/io/File;

    invoke-direct {v2, v6}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_1

    .end local v1    # "fileos":Ljava/io/FileOutputStream;
    .local v2, "fileos":Ljava/io/FileOutputStream;
    move-object v1, v2

    .line 426
    .end local v2    # "fileos":Ljava/io/FileOutputStream;
    .restart local v1    # "fileos":Ljava/io/FileOutputStream;
    :goto_0
    invoke-static {}, Landroid/util/Xml;->newSerializer()Lorg/xmlpull/v1/XmlSerializer;

    move-result-object v5

    .line 428
    .local v5, "serializer":Lorg/xmlpull/v1/XmlSerializer;
    :try_start_1
    const-string/jumbo v6, "UTF-8"

    invoke-interface {v5, v1, v6}, Lorg/xmlpull/v1/XmlSerializer;->setOutput(Ljava/io/OutputStream;Ljava/lang/String;)V

    .line 429
    const/4 v6, 0x0

    const/4 v7, 0x1

    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    invoke-interface {v5, v6, v7}, Lorg/xmlpull/v1/XmlSerializer;->startDocument(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 431
    const-string/jumbo v6, "http://xmlpull.org/v1/doc/features.html#indent-output"

    .line 432
    const/4 v7, 0x1

    .line 430
    invoke-interface {v5, v6, v7}, Lorg/xmlpull/v1/XmlSerializer;->setFeature(Ljava/lang/String;Z)V

    .line 435
    const/4 v6, 0x0

    const-string/jumbo v7, "id"

    invoke-interface {v5, v6, v7}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 437
    const/4 v6, 0x0

    const-string/jumbo v7, "a1"

    invoke-interface {v5, v6, v7}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 438
    sget-object v6, Lcom/edutech/idauthentication/MainActivity;->seed:Ljava/lang/String;

    invoke-static {v6, p1}, Lcom/edutech/idauthentication/AES;->encrypt(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 439
    const/4 v6, 0x0

    const-string/jumbo v7, "a1"

    invoke-interface {v5, v6, v7}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 442
    const/4 v6, 0x0

    const-string/jumbo v7, "b2"

    invoke-interface {v5, v6, v7}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 443
    sget-object v6, Lcom/edutech/idauthentication/MainActivity;->seed:Ljava/lang/String;

    invoke-virtual {p0}, Lcom/edutech/idauthentication/MainActivity;->GetMachineID()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/edutech/idauthentication/AES;->encrypt(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 444
    const/4 v6, 0x0

    const-string/jumbo v7, "b2"

    invoke-interface {v5, v6, v7}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 447
    const/4 v6, 0x0

    const-string/jumbo v7, "c3"

    invoke-interface {v5, v6, v7}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 448
    sget-object v6, Lcom/edutech/idauthentication/MainActivity;->seed:Ljava/lang/String;

    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/edutech/idauthentication/AES;->encrypt(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 449
    const/4 v6, 0x0

    const-string/jumbo v7, "c3"

    invoke-interface {v5, v6, v7}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 453
    const/4 v6, 0x0

    const-string/jumbo v7, "d4"

    invoke-interface {v5, v6, v7}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 454
    sget-object v6, Lcom/edutech/idauthentication/MainActivity;->seed:Ljava/lang/String;

    invoke-static {v6, p3}, Lcom/edutech/idauthentication/AES;->encrypt(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 455
    const/4 v6, 0x0

    const-string/jumbo v7, "d4"

    invoke-interface {v5, v6, v7}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 458
    const/4 v6, 0x0

    const-string/jumbo v7, "e5"

    invoke-interface {v5, v6, v7}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 459
    sget-object v6, Lcom/edutech/idauthentication/MainActivity;->seed:Ljava/lang/String;

    invoke-static {v6, p4}, Lcom/edutech/idauthentication/AES;->encrypt(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 460
    const/4 v6, 0x0

    const-string/jumbo v7, "e5"

    invoke-interface {v5, v6, v7}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 463
    const/4 v6, 0x0

    const-string/jumbo v7, "f6"

    invoke-interface {v5, v6, v7}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 464
    sget-object v6, Lcom/edutech/idauthentication/MainActivity;->seed:Ljava/lang/String;

    invoke-static {v6, v3}, Lcom/edutech/idauthentication/AES;->encrypt(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 465
    const/4 v6, 0x0

    const-string/jumbo v7, "f6"

    invoke-interface {v5, v6, v7}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 469
    const/4 v6, 0x0

    const-string/jumbo v7, "id"

    invoke-interface {v5, v6, v7}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 471
    invoke-interface {v5}, Lorg/xmlpull/v1/XmlSerializer;->endDocument()V

    .line 472
    invoke-interface {v5}, Lorg/xmlpull/v1/XmlSerializer;->flush()V

    .line 473
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 479
    :goto_1
    return-void

    .line 475
    :catch_0
    move-exception v0

    .line 476
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1

    .line 422
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v5    # "serializer":Lorg/xmlpull/v1/XmlSerializer;
    :catch_1
    move-exception v6

    goto/16 :goto_0
.end method
