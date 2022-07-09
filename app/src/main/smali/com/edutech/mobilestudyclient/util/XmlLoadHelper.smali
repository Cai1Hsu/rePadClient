.class public Lcom/edutech/mobilestudyclient/util/XmlLoadHelper;
.super Ljava/lang/Object;
.source "XmlLoadHelper.java"


# static fields
.field public static final APP_PATH:Ljava/lang/String;

.field public static final CONFIG_FILET_PATH:Ljava/lang/String;

.field public static final CONFIG_FILE_PATH:Ljava/lang/String;

.field public static final LANUAGE_FILE_PATH:Ljava/lang/String;

.field private static final URLFILEPATH:Ljava/lang/String;

.field static hashmap2:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 25
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/edutech/mobilestudyclient/util/XmlLoadHelper;->hashmap2:Ljava/util/HashMap;

    .line 27
    new-instance v0, Ljava/lang/StringBuilder;

    .line 28
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v1, "/EBag/.System/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 27
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/edutech/mobilestudyclient/util/XmlLoadHelper;->APP_PATH:Ljava/lang/String;

    .line 29
    new-instance v0, Ljava/lang/StringBuilder;

    sget-object v1, Lcom/edutech/mobilestudyclient/util/XmlLoadHelper;->APP_PATH:Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v1, "userinfo.edu"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/edutech/mobilestudyclient/util/XmlLoadHelper;->CONFIG_FILE_PATH:Ljava/lang/String;

    .line 30
    new-instance v0, Ljava/lang/StringBuilder;

    sget-object v1, Lcom/edutech/mobilestudyclient/util/XmlLoadHelper;->APP_PATH:Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v1, "usertinfo.edu"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/edutech/mobilestudyclient/util/XmlLoadHelper;->CONFIG_FILET_PATH:Ljava/lang/String;

    .line 32
    new-instance v0, Ljava/lang/StringBuilder;

    sget-object v1, Lcom/edutech/mobilestudyclient/util/XmlLoadHelper;->APP_PATH:Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v1, "language.edu"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/edutech/mobilestudyclient/util/XmlLoadHelper;->LANUAGE_FILE_PATH:Ljava/lang/String;

    .line 33
    new-instance v0, Ljava/lang/StringBuilder;

    .line 34
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 35
    const-string/jumbo v1, "/MobileStudyClient/.System/setting.xml"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 33
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/edutech/mobilestudyclient/util/XmlLoadHelper;->URLFILEPATH:Ljava/lang/String;

    .line 35
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static createLanuage(Ljava/lang/String;)Z
    .locals 9
    .param p0, "language"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 397
    new-instance v4, Ljava/io/File;

    sget-object v7, Lcom/edutech/mobilestudyclient/util/XmlLoadHelper;->LANUAGE_FILE_PATH:Ljava/lang/String;

    invoke-direct {v4, v7}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 398
    .local v4, "xmlFile":Ljava/io/File;
    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v7

    if-nez v7, :cond_1

    .line 399
    new-instance v0, Ljava/io/File;

    sget-object v7, Lcom/edutech/mobilestudyclient/util/XmlLoadHelper;->APP_PATH:Ljava/lang/String;

    invoke-direct {v0, v7}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 400
    .local v0, "appFile":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v7

    if-nez v7, :cond_0

    .line 401
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 404
    :cond_0
    :try_start_0
    invoke-virtual {v4}, Ljava/io/File;->createNewFile()Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 412
    .end local v0    # "appFile":Ljava/io/File;
    :cond_1
    :goto_0
    :try_start_1
    new-instance v2, Ljava/io/FileOutputStream;

    invoke-direct {v2, v4}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 413
    .local v2, "fileOutputStream":Ljava/io/FileOutputStream;
    invoke-static {}, Landroid/util/Xml;->newSerializer()Lorg/xmlpull/v1/XmlSerializer;

    move-result-object v3

    .line 415
    .local v3, "serial":Lorg/xmlpull/v1/XmlSerializer;
    const-string/jumbo v7, "UTF-8"

    invoke-interface {v3, v2, v7}, Lorg/xmlpull/v1/XmlSerializer;->setOutput(Ljava/io/OutputStream;Ljava/lang/String;)V

    .line 417
    const-string/jumbo v7, "utf-8"

    const/4 v8, 0x1

    invoke-static {v8}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v8

    invoke-interface {v3, v7, v8}, Lorg/xmlpull/v1/XmlSerializer;->startDocument(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 418
    const-string/jumbo v7, ""

    const-string/jumbo v8, "Setting"

    invoke-interface {v3, v7, v8}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 420
    const-string/jumbo v7, ""

    const-string/jumbo v8, "language"

    invoke-interface {v3, v7, v8}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 421
    invoke-interface {v3, p0}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 422
    const-string/jumbo v7, ""

    const-string/jumbo v8, "language"

    invoke-interface {v3, v7, v8}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 424
    const-string/jumbo v7, ""

    const-string/jumbo v8, "Setting"

    invoke-interface {v3, v7, v8}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 425
    invoke-interface {v3}, Lorg/xmlpull/v1/XmlSerializer;->endDocument()V

    .line 427
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->flush()V

    .line 428
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/IllegalStateException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_4
    .catch Ljava/lang/NullPointerException; {:try_start_1 .. :try_end_1} :catch_6
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_5

    .line 442
    .end local v2    # "fileOutputStream":Ljava/io/FileOutputStream;
    .end local v3    # "serial":Lorg/xmlpull/v1/XmlSerializer;
    :goto_1
    return v5

    .line 405
    .restart local v0    # "appFile":Ljava/io/File;
    :catch_0
    move-exception v1

    .line 406
    .local v1, "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0

    .line 429
    .end local v0    # "appFile":Ljava/io/File;
    .end local v1    # "e":Ljava/io/IOException;
    :catch_1
    move-exception v1

    .local v1, "e":Ljava/io/FileNotFoundException;
    move v5, v6

    .line 430
    goto :goto_1

    .line 431
    .end local v1    # "e":Ljava/io/FileNotFoundException;
    :catch_2
    move-exception v1

    .local v1, "e":Ljava/lang/IllegalArgumentException;
    move v5, v6

    .line 432
    goto :goto_1

    .line 433
    .end local v1    # "e":Ljava/lang/IllegalArgumentException;
    :catch_3
    move-exception v1

    .local v1, "e":Ljava/lang/IllegalStateException;
    move v5, v6

    .line 434
    goto :goto_1

    .line 435
    .end local v1    # "e":Ljava/lang/IllegalStateException;
    :catch_4
    move-exception v1

    .local v1, "e":Ljava/io/IOException;
    move v5, v6

    .line 436
    goto :goto_1

    .line 439
    .end local v1    # "e":Ljava/io/IOException;
    :catch_5
    move-exception v6

    goto :goto_1

    .line 437
    :catch_6
    move-exception v6

    goto :goto_1
.end method

.method public static loadXml()Ljava/util/HashMap;
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
    .line 38
    const-string/jumbo v10, "XmlLoadHelper"

    const-string/jumbo v11, "loadXml"

    invoke-static {v10, v11}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 42
    sget-object v10, Lcom/edutech/daoxueben/sysconfig/AppEnvironment;->URLFILEPATH:Ljava/lang/String;

    invoke-static {v10}, Lcom/edutech/mobilestudyclient/util/FileInOutHelper;->setupOrOpenFile(Ljava/lang/String;)Ljava/io/File;

    move-result-object v8

    .line 43
    .local v8, "xmlFile":Ljava/io/File;
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    .line 45
    .local v5, "hashmap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const/4 v3, 0x0

    .line 46
    .local v3, "filein":Ljava/io/FileInputStream;
    if-eqz v8, :cond_0

    invoke-virtual {v8}, Ljava/io/File;->exists()Z

    move-result v10

    if-nez v10, :cond_1

    .line 48
    :cond_0
    const/4 v10, 0x0

    .line 301
    :goto_0
    return-object v10

    .line 51
    :cond_1
    :try_start_0
    new-instance v4, Ljava/io/FileInputStream;

    invoke-direct {v4, v8}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .end local v3    # "filein":Ljava/io/FileInputStream;
    .local v4, "filein":Ljava/io/FileInputStream;
    move-object v3, v4

    .line 58
    .end local v4    # "filein":Ljava/io/FileInputStream;
    .restart local v3    # "filein":Ljava/io/FileInputStream;
    :goto_1
    :try_start_1
    invoke-static {}, Lorg/xmlpull/v1/XmlPullParserFactory;->newInstance()Lorg/xmlpull/v1/XmlPullParserFactory;

    move-result-object v7

    .line 60
    .local v7, "pullParserFactory":Lorg/xmlpull/v1/XmlPullParserFactory;
    invoke-virtual {v7}, Lorg/xmlpull/v1/XmlPullParserFactory;->newPullParser()Lorg/xmlpull/v1/XmlPullParser;

    move-result-object v9

    .line 61
    .local v9, "xmlPullParser":Lorg/xmlpull/v1/XmlPullParser;
    const-string/jumbo v10, "UTF-8"

    invoke-interface {v9, v3, v10}, Lorg/xmlpull/v1/XmlPullParser;->setInput(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 62
    invoke-interface {v9}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v2

    .line 63
    .local v2, "eventType":I
    :goto_2
    const/4 v10, 0x1

    if-ne v2, v10, :cond_3

    .line 291
    sput-object v5, Lcom/edutech/mobilestudyclient/util/XmlLoadHelper;->hashmap2:Ljava/util/HashMap;

    .line 292
    if-eqz v3, :cond_2

    .line 294
    :try_start_2
    invoke-virtual {v3}, Ljava/io/FileInputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_18

    .line 301
    .end local v2    # "eventType":I
    .end local v7    # "pullParserFactory":Lorg/xmlpull/v1/XmlPullParserFactory;
    .end local v9    # "xmlPullParser":Lorg/xmlpull/v1/XmlPullParser;
    :cond_2
    :goto_3
    sget-object v10, Lcom/edutech/mobilestudyclient/util/XmlLoadHelper;->hashmap2:Ljava/util/HashMap;

    goto :goto_0

    .line 52
    :catch_0
    move-exception v1

    .line 54
    .local v1, "e1":Ljava/io/FileNotFoundException;
    invoke-virtual {v1}, Ljava/io/FileNotFoundException;->printStackTrace()V

    goto :goto_1

    .line 64
    .end local v1    # "e1":Ljava/io/FileNotFoundException;
    .restart local v2    # "eventType":I
    .restart local v7    # "pullParserFactory":Lorg/xmlpull/v1/XmlPullParserFactory;
    .restart local v9    # "xmlPullParser":Lorg/xmlpull/v1/XmlPullParser;
    :cond_3
    :try_start_3
    invoke-interface {v9}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v6

    .line 66
    .local v6, "nodeName":Ljava/lang/String;
    packed-switch v2, :pswitch_data_0

    .line 284
    :cond_4
    :goto_4
    :pswitch_0
    invoke-interface {v9}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v2

    goto :goto_2

    .line 70
    :pswitch_1
    const-string/jumbo v10, "ip"

    invoke-virtual {v10, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_5

    .line 71
    const-string/jumbo v10, "ip"

    invoke-interface {v9}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v5, v10, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 73
    :cond_5
    const-string/jumbo v10, "stuid"

    invoke-virtual {v10, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    move-result v10

    if-eqz v10, :cond_6

    .line 75
    :try_start_4
    const-string/jumbo v10, "stuid"

    .line 77
    invoke-interface {v9}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v11

    .line 76
    invoke-static {v11}, Lcom/edutech/mobilestudyclient/util/BZip2Utils;->Base64DecodeToString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 75
    invoke-virtual {v5, v10, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 78
    const-string/jumbo v10, "base64"

    .line 79
    const-string/jumbo v11, "QlpoOTFBWSZTWSUOoTAAAAEIABIAIAAwgEFGLuSKcKEgSh1CYA=="

    invoke-static {v11}, Lcom/edutech/mobilestudyclient/util/BZip2Utils;->Base64DecodeToString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 78
    invoke-static {v10, v11}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 85
    :cond_6
    :goto_5
    :try_start_5
    const-string/jumbo v10, "username"

    invoke-virtual {v10, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_2
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    move-result v10

    if-eqz v10, :cond_7

    .line 87
    :try_start_6
    const-string/jumbo v10, "username"

    .line 89
    invoke-interface {v9}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v11

    .line 88
    invoke-static {v11}, Lcom/edutech/mobilestudyclient/util/BZip2Utils;->Base64DecodeToString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 87
    invoke-virtual {v5, v10, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_5
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 95
    :cond_7
    :goto_6
    :try_start_7
    const-string/jumbo v10, "stuname"

    invoke-virtual {v10, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_2
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    move-result v10

    if-eqz v10, :cond_8

    .line 97
    :try_start_8
    const-string/jumbo v10, "stuname"

    .line 99
    invoke-interface {v9}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v11

    .line 98
    invoke-static {v11}, Lcom/edutech/mobilestudyclient/util/BZip2Utils;->Base64DecodeToString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 97
    invoke-virtual {v5, v10, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_6
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 105
    :cond_8
    :goto_7
    :try_start_9
    const-string/jumbo v10, "usercode"

    invoke-virtual {v10, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_2
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    move-result v10

    if-eqz v10, :cond_9

    .line 107
    :try_start_a
    const-string/jumbo v10, "usercode"

    .line 109
    invoke-interface {v9}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v11

    .line 108
    invoke-static {v11}, Lcom/edutech/mobilestudyclient/util/BZip2Utils;->Base64DecodeToString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 107
    invoke-virtual {v5, v10, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_7
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    .line 115
    :cond_9
    :goto_8
    :try_start_b
    const-string/jumbo v10, "password"

    invoke-virtual {v10, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_2
    .catchall {:try_start_b .. :try_end_b} :catchall_0

    move-result v10

    if-eqz v10, :cond_a

    .line 117
    :try_start_c
    const-string/jumbo v10, "password"

    .line 118
    invoke-interface {v9}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v11

    .line 117
    invoke-virtual {v5, v10, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_8
    .catchall {:try_start_c .. :try_end_c} :catchall_0

    .line 124
    :cond_a
    :goto_9
    :try_start_d
    const-string/jumbo v10, "pwd"

    invoke-virtual {v10, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_d} :catch_2
    .catchall {:try_start_d .. :try_end_d} :catchall_0

    move-result v10

    if-eqz v10, :cond_b

    .line 126
    :try_start_e
    const-string/jumbo v10, "pwd"

    .line 128
    invoke-interface {v9}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v11

    .line 127
    invoke-static {v11}, Lcom/edutech/mobilestudyclient/util/BZip2Utils;->Base64DecodeToString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 126
    invoke-virtual {v5, v10, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_e} :catch_9
    .catchall {:try_start_e .. :try_end_e} :catchall_0

    .line 134
    :cond_b
    :goto_a
    :try_start_f
    const-string/jumbo v10, "domain"

    invoke-virtual {v10, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_f
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_f} :catch_2
    .catchall {:try_start_f .. :try_end_f} :catchall_0

    move-result v10

    if-eqz v10, :cond_c

    .line 136
    :try_start_10
    const-string/jumbo v10, "domain"

    .line 138
    invoke-interface {v9}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v11

    .line 137
    invoke-static {v11}, Lcom/edutech/mobilestudyclient/util/BZip2Utils;->Base64DecodeToString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 136
    invoke-virtual {v5, v10, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_10
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_10} :catch_a
    .catchall {:try_start_10 .. :try_end_10} :catchall_0

    .line 144
    :cond_c
    :goto_b
    :try_start_11
    const-string/jumbo v10, "port"

    invoke-virtual {v10, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_11
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_11} :catch_2
    .catchall {:try_start_11 .. :try_end_11} :catchall_0

    move-result v10

    if-eqz v10, :cond_d

    .line 146
    :try_start_12
    const-string/jumbo v10, "port"

    .line 148
    invoke-interface {v9}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v11

    .line 147
    invoke-static {v11}, Lcom/edutech/mobilestudyclient/util/BZip2Utils;->Base64DecodeToString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 146
    invoke-virtual {v5, v10, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_12
    .catch Ljava/lang/Exception; {:try_start_12 .. :try_end_12} :catch_b
    .catchall {:try_start_12 .. :try_end_12} :catchall_0

    .line 154
    :cond_d
    :goto_c
    :try_start_13
    const-string/jumbo v10, "tigase_ip"

    invoke-virtual {v10, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_13
    .catch Ljava/lang/Exception; {:try_start_13 .. :try_end_13} :catch_2
    .catchall {:try_start_13 .. :try_end_13} :catchall_0

    move-result v10

    if-eqz v10, :cond_e

    .line 156
    :try_start_14
    const-string/jumbo v10, "tigase_ip"

    .line 158
    invoke-interface {v9}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v11

    .line 157
    invoke-static {v11}, Lcom/edutech/mobilestudyclient/util/BZip2Utils;->Base64DecodeToString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 156
    invoke-virtual {v5, v10, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_14
    .catch Ljava/lang/Exception; {:try_start_14 .. :try_end_14} :catch_c
    .catchall {:try_start_14 .. :try_end_14} :catchall_0

    .line 164
    :cond_e
    :goto_d
    :try_start_15
    const-string/jumbo v10, "apihost"

    invoke-virtual {v10, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_15
    .catch Ljava/lang/Exception; {:try_start_15 .. :try_end_15} :catch_2
    .catchall {:try_start_15 .. :try_end_15} :catchall_0

    move-result v10

    if-eqz v10, :cond_f

    .line 166
    :try_start_16
    const-string/jumbo v10, "apihost"

    .line 168
    invoke-interface {v9}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v11

    .line 167
    invoke-static {v11}, Lcom/edutech/mobilestudyclient/util/BZip2Utils;->Base64DecodeToString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 166
    invoke-virtual {v5, v10, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_16
    .catch Ljava/lang/Exception; {:try_start_16 .. :try_end_16} :catch_d
    .catchall {:try_start_16 .. :try_end_16} :catchall_0

    .line 174
    :cond_f
    :goto_e
    :try_start_17
    const-string/jumbo v10, "privatekey"

    invoke-virtual {v10, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_17
    .catch Ljava/lang/Exception; {:try_start_17 .. :try_end_17} :catch_2
    .catchall {:try_start_17 .. :try_end_17} :catchall_0

    move-result v10

    if-eqz v10, :cond_10

    .line 176
    :try_start_18
    const-string/jumbo v10, "privatekey"

    .line 178
    invoke-interface {v9}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v11

    .line 177
    invoke-static {v11}, Lcom/edutech/mobilestudyclient/util/BZip2Utils;->Base64DecodeToString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 176
    invoke-virtual {v5, v10, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_18
    .catch Ljava/lang/Exception; {:try_start_18 .. :try_end_18} :catch_e
    .catchall {:try_start_18 .. :try_end_18} :catchall_0

    .line 184
    :cond_10
    :goto_f
    :try_start_19
    const-string/jumbo v10, "mongo_domain"

    invoke-virtual {v10, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_19
    .catch Ljava/lang/Exception; {:try_start_19 .. :try_end_19} :catch_2
    .catchall {:try_start_19 .. :try_end_19} :catchall_0

    move-result v10

    if-eqz v10, :cond_11

    .line 186
    :try_start_1a
    const-string/jumbo v10, "mongo_domain"

    .line 188
    invoke-interface {v9}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v11

    .line 187
    invoke-static {v11}, Lcom/edutech/mobilestudyclient/util/BZip2Utils;->Base64DecodeToString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 186
    invoke-virtual {v5, v10, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1a
    .catch Ljava/lang/Exception; {:try_start_1a .. :try_end_1a} :catch_f
    .catchall {:try_start_1a .. :try_end_1a} :catchall_0

    .line 194
    :cond_11
    :goto_10
    :try_start_1b
    const-string/jumbo v10, "mongo_port"

    invoke-virtual {v10, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_1b
    .catch Ljava/lang/Exception; {:try_start_1b .. :try_end_1b} :catch_2
    .catchall {:try_start_1b .. :try_end_1b} :catchall_0

    move-result v10

    if-eqz v10, :cond_12

    .line 196
    :try_start_1c
    const-string/jumbo v10, "mongo_port"

    .line 198
    invoke-interface {v9}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v11

    .line 197
    invoke-static {v11}, Lcom/edutech/mobilestudyclient/util/BZip2Utils;->Base64DecodeToString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 196
    invoke-virtual {v5, v10, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1c
    .catch Ljava/lang/Exception; {:try_start_1c .. :try_end_1c} :catch_10
    .catchall {:try_start_1c .. :try_end_1c} :catchall_0

    .line 204
    :cond_12
    :goto_11
    :try_start_1d
    const-string/jumbo v10, "mongo_user"

    invoke-virtual {v10, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_1d
    .catch Ljava/lang/Exception; {:try_start_1d .. :try_end_1d} :catch_2
    .catchall {:try_start_1d .. :try_end_1d} :catchall_0

    move-result v10

    if-eqz v10, :cond_13

    .line 206
    :try_start_1e
    const-string/jumbo v10, "mongo_user"

    .line 208
    invoke-interface {v9}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v11

    .line 207
    invoke-static {v11}, Lcom/edutech/mobilestudyclient/util/BZip2Utils;->Base64DecodeToString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 206
    invoke-virtual {v5, v10, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1e
    .catch Ljava/lang/Exception; {:try_start_1e .. :try_end_1e} :catch_11
    .catchall {:try_start_1e .. :try_end_1e} :catchall_0

    .line 214
    :cond_13
    :goto_12
    :try_start_1f
    const-string/jumbo v10, "mongo_pwd"

    invoke-virtual {v10, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_1f
    .catch Ljava/lang/Exception; {:try_start_1f .. :try_end_1f} :catch_2
    .catchall {:try_start_1f .. :try_end_1f} :catchall_0

    move-result v10

    if-eqz v10, :cond_14

    .line 216
    :try_start_20
    const-string/jumbo v10, "mongo_pwd"

    .line 218
    invoke-interface {v9}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v11

    .line 217
    invoke-static {v11}, Lcom/edutech/mobilestudyclient/util/BZip2Utils;->Base64DecodeToString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 216
    invoke-virtual {v5, v10, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_20
    .catch Ljava/lang/Exception; {:try_start_20 .. :try_end_20} :catch_12
    .catchall {:try_start_20 .. :try_end_20} :catchall_0

    .line 225
    :cond_14
    :goto_13
    :try_start_21
    const-string/jumbo v10, "user_type"

    invoke-virtual {v10, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_21
    .catch Ljava/lang/Exception; {:try_start_21 .. :try_end_21} :catch_2
    .catchall {:try_start_21 .. :try_end_21} :catchall_0

    move-result v10

    if-eqz v10, :cond_15

    .line 227
    :try_start_22
    const-string/jumbo v10, "user_type"

    .line 229
    invoke-interface {v9}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v11

    .line 228
    invoke-static {v11}, Lcom/edutech/mobilestudyclient/util/BZip2Utils;->Base64DecodeToString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 227
    invoke-virtual {v5, v10, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_22
    .catch Ljava/lang/Exception; {:try_start_22 .. :try_end_22} :catch_13
    .catchall {:try_start_22 .. :try_end_22} :catchall_0

    .line 236
    :cond_15
    :goto_14
    :try_start_23
    const-string/jumbo v10, "schoolid"

    invoke-virtual {v10, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_23
    .catch Ljava/lang/Exception; {:try_start_23 .. :try_end_23} :catch_2
    .catchall {:try_start_23 .. :try_end_23} :catchall_0

    move-result v10

    if-eqz v10, :cond_16

    .line 238
    :try_start_24
    const-string/jumbo v10, "schoolid"

    .line 240
    invoke-interface {v9}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v11

    .line 239
    invoke-static {v11}, Lcom/edutech/mobilestudyclient/util/BZip2Utils;->Base64DecodeToString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 238
    invoke-virtual {v5, v10, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_24
    .catch Ljava/lang/Exception; {:try_start_24 .. :try_end_24} :catch_14
    .catchall {:try_start_24 .. :try_end_24} :catchall_0

    .line 247
    :cond_16
    :goto_15
    :try_start_25
    const-string/jumbo v10, "schoolname"

    invoke-virtual {v10, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_25
    .catch Ljava/lang/Exception; {:try_start_25 .. :try_end_25} :catch_2
    .catchall {:try_start_25 .. :try_end_25} :catchall_0

    move-result v10

    if-eqz v10, :cond_17

    .line 249
    :try_start_26
    const-string/jumbo v10, "schoolname"

    .line 251
    invoke-interface {v9}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v11

    .line 250
    invoke-static {v11}, Lcom/edutech/mobilestudyclient/util/BZip2Utils;->Base64DecodeToString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 249
    invoke-virtual {v5, v10, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_26
    .catch Ljava/lang/Exception; {:try_start_26 .. :try_end_26} :catch_15
    .catchall {:try_start_26 .. :try_end_26} :catchall_0

    .line 257
    :cond_17
    :goto_16
    :try_start_27
    const-string/jumbo v10, "owncloudip"

    invoke-virtual {v10, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_27
    .catch Ljava/lang/Exception; {:try_start_27 .. :try_end_27} :catch_2
    .catchall {:try_start_27 .. :try_end_27} :catchall_0

    move-result v10

    if-eqz v10, :cond_18

    .line 259
    :try_start_28
    const-string/jumbo v10, "owncloudip"

    .line 261
    invoke-interface {v9}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v11

    .line 260
    invoke-static {v11}, Lcom/edutech/mobilestudyclient/util/BZip2Utils;->Base64DecodeToString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 259
    invoke-virtual {v5, v10, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_28
    .catch Ljava/lang/Exception; {:try_start_28 .. :try_end_28} :catch_16
    .catchall {:try_start_28 .. :try_end_28} :catchall_0

    .line 267
    :cond_18
    :goto_17
    :try_start_29
    const-string/jumbo v10, "gdstate"

    invoke-virtual {v10, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_29
    .catch Ljava/lang/Exception; {:try_start_29 .. :try_end_29} :catch_2
    .catchall {:try_start_29 .. :try_end_29} :catchall_0

    move-result v10

    if-eqz v10, :cond_4

    .line 269
    :try_start_2a
    const-string/jumbo v10, "gdstate"

    .line 271
    invoke-interface {v9}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v11

    .line 270
    invoke-static {v11}, Lcom/edutech/mobilestudyclient/util/BZip2Utils;->Base64DecodeToString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 269
    invoke-virtual {v5, v10, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2a
    .catch Ljava/lang/Exception; {:try_start_2a .. :try_end_2a} :catch_1
    .catchall {:try_start_2a .. :try_end_2a} :catchall_0

    goto/16 :goto_4

    .line 272
    :catch_1
    move-exception v0

    .line 274
    .local v0, "e":Ljava/lang/Exception;
    :try_start_2b
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_2b
    .catch Ljava/lang/Exception; {:try_start_2b .. :try_end_2b} :catch_2
    .catchall {:try_start_2b .. :try_end_2b} :catchall_0

    goto/16 :goto_4

    .line 287
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v2    # "eventType":I
    .end local v6    # "nodeName":Ljava/lang/String;
    .end local v7    # "pullParserFactory":Lorg/xmlpull/v1/XmlPullParserFactory;
    .end local v9    # "xmlPullParser":Lorg/xmlpull/v1/XmlPullParser;
    :catch_2
    move-exception v0

    .line 289
    .restart local v0    # "e":Ljava/lang/Exception;
    :try_start_2c
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_2c
    .catchall {:try_start_2c .. :try_end_2c} :catchall_0

    .line 291
    sput-object v5, Lcom/edutech/mobilestudyclient/util/XmlLoadHelper;->hashmap2:Ljava/util/HashMap;

    .line 292
    if-eqz v3, :cond_2

    .line 294
    :try_start_2d
    invoke-virtual {v3}, Ljava/io/FileInputStream;->close()V
    :try_end_2d
    .catch Ljava/io/IOException; {:try_start_2d .. :try_end_2d} :catch_3

    goto/16 :goto_3

    .line 295
    :catch_3
    move-exception v0

    .line 297
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto/16 :goto_3

    .line 80
    .end local v0    # "e":Ljava/io/IOException;
    .restart local v2    # "eventType":I
    .restart local v6    # "nodeName":Ljava/lang/String;
    .restart local v7    # "pullParserFactory":Lorg/xmlpull/v1/XmlPullParserFactory;
    .restart local v9    # "xmlPullParser":Lorg/xmlpull/v1/XmlPullParser;
    :catch_4
    move-exception v0

    .line 82
    .local v0, "e":Ljava/lang/Exception;
    :try_start_2e
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_2e
    .catch Ljava/lang/Exception; {:try_start_2e .. :try_end_2e} :catch_2
    .catchall {:try_start_2e .. :try_end_2e} :catchall_0

    goto/16 :goto_5

    .line 290
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v2    # "eventType":I
    .end local v6    # "nodeName":Ljava/lang/String;
    .end local v7    # "pullParserFactory":Lorg/xmlpull/v1/XmlPullParserFactory;
    .end local v9    # "xmlPullParser":Lorg/xmlpull/v1/XmlPullParser;
    :catchall_0
    move-exception v10

    .line 291
    sput-object v5, Lcom/edutech/mobilestudyclient/util/XmlLoadHelper;->hashmap2:Ljava/util/HashMap;

    .line 292
    if-eqz v3, :cond_19

    .line 294
    :try_start_2f
    invoke-virtual {v3}, Ljava/io/FileInputStream;->close()V
    :try_end_2f
    .catch Ljava/io/IOException; {:try_start_2f .. :try_end_2f} :catch_17

    .line 299
    :cond_19
    :goto_18
    throw v10

    .line 90
    .restart local v2    # "eventType":I
    .restart local v6    # "nodeName":Ljava/lang/String;
    .restart local v7    # "pullParserFactory":Lorg/xmlpull/v1/XmlPullParserFactory;
    .restart local v9    # "xmlPullParser":Lorg/xmlpull/v1/XmlPullParser;
    :catch_5
    move-exception v0

    .line 92
    .restart local v0    # "e":Ljava/lang/Exception;
    :try_start_30
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_6

    .line 100
    .end local v0    # "e":Ljava/lang/Exception;
    :catch_6
    move-exception v0

    .line 102
    .restart local v0    # "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_7

    .line 110
    .end local v0    # "e":Ljava/lang/Exception;
    :catch_7
    move-exception v0

    .line 112
    .restart local v0    # "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_8

    .line 119
    .end local v0    # "e":Ljava/lang/Exception;
    :catch_8
    move-exception v0

    .line 121
    .restart local v0    # "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_9

    .line 129
    .end local v0    # "e":Ljava/lang/Exception;
    :catch_9
    move-exception v0

    .line 131
    .restart local v0    # "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_a

    .line 139
    .end local v0    # "e":Ljava/lang/Exception;
    :catch_a
    move-exception v0

    .line 141
    .restart local v0    # "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_b

    .line 149
    .end local v0    # "e":Ljava/lang/Exception;
    :catch_b
    move-exception v0

    .line 151
    .restart local v0    # "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_c

    .line 159
    .end local v0    # "e":Ljava/lang/Exception;
    :catch_c
    move-exception v0

    .line 161
    .restart local v0    # "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_d

    .line 169
    .end local v0    # "e":Ljava/lang/Exception;
    :catch_d
    move-exception v0

    .line 171
    .restart local v0    # "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_e

    .line 179
    .end local v0    # "e":Ljava/lang/Exception;
    :catch_e
    move-exception v0

    .line 181
    .restart local v0    # "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_f

    .line 189
    .end local v0    # "e":Ljava/lang/Exception;
    :catch_f
    move-exception v0

    .line 191
    .restart local v0    # "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_10

    .line 199
    .end local v0    # "e":Ljava/lang/Exception;
    :catch_10
    move-exception v0

    .line 201
    .restart local v0    # "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_11

    .line 209
    .end local v0    # "e":Ljava/lang/Exception;
    :catch_11
    move-exception v0

    .line 211
    .restart local v0    # "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_12

    .line 219
    .end local v0    # "e":Ljava/lang/Exception;
    :catch_12
    move-exception v0

    .line 221
    .restart local v0    # "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_13

    .line 230
    .end local v0    # "e":Ljava/lang/Exception;
    :catch_13
    move-exception v0

    .line 232
    .restart local v0    # "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_14

    .line 241
    .end local v0    # "e":Ljava/lang/Exception;
    :catch_14
    move-exception v0

    .line 243
    .restart local v0    # "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_15

    .line 252
    .end local v0    # "e":Ljava/lang/Exception;
    :catch_15
    move-exception v0

    .line 254
    .restart local v0    # "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_16

    .line 262
    .end local v0    # "e":Ljava/lang/Exception;
    :catch_16
    move-exception v0

    .line 264
    .restart local v0    # "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_30
    .catch Ljava/lang/Exception; {:try_start_30 .. :try_end_30} :catch_2
    .catchall {:try_start_30 .. :try_end_30} :catchall_0

    goto/16 :goto_17

    .line 295
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v2    # "eventType":I
    .end local v6    # "nodeName":Ljava/lang/String;
    .end local v7    # "pullParserFactory":Lorg/xmlpull/v1/XmlPullParserFactory;
    .end local v9    # "xmlPullParser":Lorg/xmlpull/v1/XmlPullParser;
    :catch_17
    move-exception v0

    .line 297
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_18

    .line 295
    .end local v0    # "e":Ljava/io/IOException;
    .restart local v2    # "eventType":I
    .restart local v7    # "pullParserFactory":Lorg/xmlpull/v1/XmlPullParserFactory;
    .restart local v9    # "xmlPullParser":Lorg/xmlpull/v1/XmlPullParser;
    :catch_18
    move-exception v0

    .line 297
    .restart local v0    # "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto/16 :goto_3

    .line 66
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static loadXml2()Ljava/util/ArrayList;
    .locals 19
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/edutech/mobilestudyclient/activity/AppBean;",
            ">;"
        }
    .end annotation

    .prologue
    .line 304
    const-string/jumbo v17, "XmlLoadHelper"

    const-string/jumbo v18, "loadXml"

    invoke-static/range {v17 .. v18}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 305
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 306
    .local v4, "apps":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/edutech/mobilestudyclient/activity/AppBean;>;"
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    .line 307
    .local v5, "config":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const/4 v2, 0x0

    .line 310
    .local v2, "app":Lcom/edutech/mobilestudyclient/activity/AppBean;
    sget-object v17, Lcom/edutech/mobilestudyclient/download/XmlUtils;->launcherDetail_path:Ljava/lang/String;

    invoke-static/range {v17 .. v17}, Lcom/edutech/mobilestudyclient/util/FileInOutHelper;->setupOrOpenFile(Ljava/lang/String;)Ljava/io/File;

    move-result-object v15

    .line 311
    .local v15, "xmlFile":Ljava/io/File;
    new-instance v12, Ljava/util/HashMap;

    invoke-direct {v12}, Ljava/util/HashMap;-><init>()V

    .line 313
    .local v12, "hashmap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const/4 v10, 0x0

    .line 314
    .local v10, "filein":Ljava/io/FileInputStream;
    invoke-virtual {v15}, Ljava/io/File;->exists()Z

    move-result v17

    if-nez v17, :cond_1

    .line 316
    const/4 v4, 0x0

    .line 394
    .end local v4    # "apps":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/edutech/mobilestudyclient/activity/AppBean;>;"
    :cond_0
    :goto_0
    return-object v4

    .line 319
    .restart local v4    # "apps":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/edutech/mobilestudyclient/activity/AppBean;>;"
    :cond_1
    :try_start_0
    new-instance v11, Ljava/io/FileInputStream;

    invoke-direct {v11, v15}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .end local v10    # "filein":Ljava/io/FileInputStream;
    .local v11, "filein":Ljava/io/FileInputStream;
    move-object v10, v11

    .line 326
    .end local v11    # "filein":Ljava/io/FileInputStream;
    .restart local v10    # "filein":Ljava/io/FileInputStream;
    :goto_1
    :try_start_1
    invoke-static {}, Lorg/xmlpull/v1/XmlPullParserFactory;->newInstance()Lorg/xmlpull/v1/XmlPullParserFactory;

    move-result-object v14

    .line 328
    .local v14, "pullParserFactory":Lorg/xmlpull/v1/XmlPullParserFactory;
    invoke-virtual {v14}, Lorg/xmlpull/v1/XmlPullParserFactory;->newPullParser()Lorg/xmlpull/v1/XmlPullParser;

    move-result-object v16

    .line 329
    .local v16, "xmlPullParser":Lorg/xmlpull/v1/XmlPullParser;
    const-string/jumbo v17, "UTF-8"

    move-object/from16 v0, v16

    move-object/from16 v1, v17

    invoke-interface {v0, v10, v1}, Lorg/xmlpull/v1/XmlPullParser;->setInput(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 330
    invoke-interface/range {v16 .. v16}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v9

    .local v9, "eventType":I
    move-object v3, v2

    .end local v2    # "app":Lcom/edutech/mobilestudyclient/activity/AppBean;
    .local v3, "app":Lcom/edutech/mobilestudyclient/activity/AppBean;
    move-object v6, v5

    .line 331
    .end local v5    # "config":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .local v6, "config":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    :goto_2
    const/16 v17, 0x1

    move/from16 v0, v17

    if-ne v9, v0, :cond_2

    .line 385
    if-eqz v10, :cond_d

    .line 387
    :try_start_2
    invoke-virtual {v10}, Ljava/io/FileInputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_4

    move-object v2, v3

    .end local v3    # "app":Lcom/edutech/mobilestudyclient/activity/AppBean;
    .restart local v2    # "app":Lcom/edutech/mobilestudyclient/activity/AppBean;
    move-object v5, v6

    .line 388
    .end local v6    # "config":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v5    # "config":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    goto :goto_0

    .line 320
    .end local v9    # "eventType":I
    .end local v14    # "pullParserFactory":Lorg/xmlpull/v1/XmlPullParserFactory;
    .end local v16    # "xmlPullParser":Lorg/xmlpull/v1/XmlPullParser;
    :catch_0
    move-exception v8

    .line 322
    .local v8, "e1":Ljava/io/FileNotFoundException;
    invoke-virtual {v8}, Ljava/io/FileNotFoundException;->printStackTrace()V

    goto :goto_1

    .line 332
    .end local v2    # "app":Lcom/edutech/mobilestudyclient/activity/AppBean;
    .end local v5    # "config":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v8    # "e1":Ljava/io/FileNotFoundException;
    .restart local v3    # "app":Lcom/edutech/mobilestudyclient/activity/AppBean;
    .restart local v6    # "config":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v9    # "eventType":I
    .restart local v14    # "pullParserFactory":Lorg/xmlpull/v1/XmlPullParserFactory;
    .restart local v16    # "xmlPullParser":Lorg/xmlpull/v1/XmlPullParser;
    :cond_2
    :try_start_3
    invoke-interface/range {v16 .. v16}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_5
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    move-result-object v13

    .line 334
    .local v13, "nodeName":Ljava/lang/String;
    packed-switch v9, :pswitch_data_0

    :cond_3
    :pswitch_0
    move-object v2, v3

    .end local v3    # "app":Lcom/edutech/mobilestudyclient/activity/AppBean;
    .restart local v2    # "app":Lcom/edutech/mobilestudyclient/activity/AppBean;
    move-object v5, v6

    .line 377
    .end local v6    # "config":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v5    # "config":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_4
    :goto_3
    :try_start_4
    invoke-interface/range {v16 .. v16}, Lorg/xmlpull/v1/XmlPullParser;->next()I
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    move-result v9

    move-object v3, v2

    .end local v2    # "app":Lcom/edutech/mobilestudyclient/activity/AppBean;
    .restart local v3    # "app":Lcom/edutech/mobilestudyclient/activity/AppBean;
    move-object v6, v5

    .end local v5    # "config":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v6    # "config":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    goto :goto_2

    :pswitch_1
    move-object v2, v3

    .end local v3    # "app":Lcom/edutech/mobilestudyclient/activity/AppBean;
    .restart local v2    # "app":Lcom/edutech/mobilestudyclient/activity/AppBean;
    move-object v5, v6

    .line 336
    .end local v6    # "config":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v5    # "config":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    goto :goto_3

    .line 338
    .end local v2    # "app":Lcom/edutech/mobilestudyclient/activity/AppBean;
    .end local v5    # "config":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v3    # "app":Lcom/edutech/mobilestudyclient/activity/AppBean;
    .restart local v6    # "config":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    :pswitch_2
    :try_start_5
    const-string/jumbo v17, "app"

    move-object/from16 v0, v17

    invoke-virtual {v0, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_e

    .line 339
    new-instance v2, Lcom/edutech/mobilestudyclient/activity/AppBean;

    invoke-direct {v2}, Lcom/edutech/mobilestudyclient/activity/AppBean;-><init>()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 340
    .end local v3    # "app":Lcom/edutech/mobilestudyclient/activity/AppBean;
    .restart local v2    # "app":Lcom/edutech/mobilestudyclient/activity/AppBean;
    :try_start_6
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 342
    .end local v6    # "config":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v5    # "config":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    :goto_4
    :try_start_7
    const-string/jumbo v17, "code"

    move-object/from16 v0, v17

    invoke-virtual {v0, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_5

    .line 343
    invoke-interface/range {v16 .. v16}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v2, v0}, Lcom/edutech/mobilestudyclient/activity/AppBean;->setCode(Ljava/lang/String;)V

    .line 345
    :cond_5
    const-string/jumbo v17, "name"

    move-object/from16 v0, v17

    invoke-virtual {v0, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_6

    .line 346
    invoke-interface/range {v16 .. v16}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v2, v0}, Lcom/edutech/mobilestudyclient/activity/AppBean;->setName(Ljava/lang/String;)V

    .line 348
    :cond_6
    const-string/jumbo v17, "color"

    move-object/from16 v0, v17

    invoke-virtual {v0, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_7

    .line 349
    invoke-interface/range {v16 .. v16}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v2, v0}, Lcom/edutech/mobilestudyclient/activity/AppBean;->setColor(Ljava/lang/String;)V

    .line 351
    :cond_7
    const-string/jumbo v17, "icon"

    move-object/from16 v0, v17

    invoke-virtual {v0, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_8

    .line 352
    invoke-interface/range {v16 .. v16}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v2, v0}, Lcom/edutech/mobilestudyclient/activity/AppBean;->setIcon(Ljava/lang/String;)V

    .line 354
    :cond_8
    const-string/jumbo v17, "iconLocal"

    move-object/from16 v0, v17

    invoke-virtual {v0, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_9

    .line 355
    invoke-interface/range {v16 .. v16}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v2, v0}, Lcom/edutech/mobilestudyclient/activity/AppBean;->setIconLocal(Ljava/lang/String;)V

    .line 357
    :cond_9
    const-string/jumbo v17, "comment"

    move-object/from16 v0, v17

    invoke-virtual {v0, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_a

    .line 358
    const-string/jumbo v17, "comment"

    invoke-interface/range {v16 .. v16}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v5, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 360
    :cond_a
    const-string/jumbo v17, "download"

    move-object/from16 v0, v17

    invoke-virtual {v0, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_b

    .line 361
    const-string/jumbo v17, "download"

    invoke-interface/range {v16 .. v16}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v5, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 363
    :cond_b
    const-string/jumbo v17, "enable"

    move-object/from16 v0, v17

    invoke-virtual {v0, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_4

    .line 364
    invoke-interface/range {v16 .. v16}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v17

    move/from16 v0, v17

    invoke-virtual {v2, v0}, Lcom/edutech/mobilestudyclient/activity/AppBean;->setEnable(I)V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_1
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    goto/16 :goto_3

    .line 380
    .end local v9    # "eventType":I
    .end local v13    # "nodeName":Ljava/lang/String;
    .end local v14    # "pullParserFactory":Lorg/xmlpull/v1/XmlPullParserFactory;
    .end local v16    # "xmlPullParser":Lorg/xmlpull/v1/XmlPullParser;
    :catch_1
    move-exception v7

    .line 382
    .local v7, "e":Ljava/lang/Exception;
    :goto_5
    :try_start_8
    invoke-virtual {v7}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 385
    if-eqz v10, :cond_0

    .line 387
    :try_start_9
    invoke-virtual {v10}, Ljava/io/FileInputStream;->close()V
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_2

    goto/16 :goto_0

    .line 388
    :catch_2
    move-exception v7

    .line 390
    .local v7, "e":Ljava/io/IOException;
    invoke-virtual {v7}, Ljava/io/IOException;->printStackTrace()V

    goto/16 :goto_0

    .line 368
    .end local v2    # "app":Lcom/edutech/mobilestudyclient/activity/AppBean;
    .end local v5    # "config":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v7    # "e":Ljava/io/IOException;
    .restart local v3    # "app":Lcom/edutech/mobilestudyclient/activity/AppBean;
    .restart local v6    # "config":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v9    # "eventType":I
    .restart local v13    # "nodeName":Ljava/lang/String;
    .restart local v14    # "pullParserFactory":Lorg/xmlpull/v1/XmlPullParserFactory;
    .restart local v16    # "xmlPullParser":Lorg/xmlpull/v1/XmlPullParser;
    :pswitch_3
    :try_start_a
    const-string/jumbo v17, "app"

    move-object/from16 v0, v17

    invoke-virtual {v0, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_3

    .line 369
    invoke-virtual {v3, v6}, Lcom/edutech/mobilestudyclient/activity/AppBean;->setConfig(Ljava/util/HashMap;)V

    .line 370
    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_5
    .catchall {:try_start_a .. :try_end_a} :catchall_1

    move-object v2, v3

    .end local v3    # "app":Lcom/edutech/mobilestudyclient/activity/AppBean;
    .restart local v2    # "app":Lcom/edutech/mobilestudyclient/activity/AppBean;
    move-object v5, v6

    .line 372
    .end local v6    # "config":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v5    # "config":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    goto/16 :goto_3

    .line 383
    .end local v9    # "eventType":I
    .end local v13    # "nodeName":Ljava/lang/String;
    .end local v14    # "pullParserFactory":Lorg/xmlpull/v1/XmlPullParserFactory;
    .end local v16    # "xmlPullParser":Lorg/xmlpull/v1/XmlPullParser;
    :catchall_0
    move-exception v17

    .line 385
    :goto_6
    if-eqz v10, :cond_c

    .line 387
    :try_start_b
    invoke-virtual {v10}, Ljava/io/FileInputStream;->close()V
    :try_end_b
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_b} :catch_3

    .line 392
    :cond_c
    :goto_7
    throw v17

    .line 388
    :catch_3
    move-exception v7

    .line 390
    .restart local v7    # "e":Ljava/io/IOException;
    invoke-virtual {v7}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_7

    .line 388
    .end local v2    # "app":Lcom/edutech/mobilestudyclient/activity/AppBean;
    .end local v5    # "config":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v7    # "e":Ljava/io/IOException;
    .restart local v3    # "app":Lcom/edutech/mobilestudyclient/activity/AppBean;
    .restart local v6    # "config":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v9    # "eventType":I
    .restart local v14    # "pullParserFactory":Lorg/xmlpull/v1/XmlPullParserFactory;
    .restart local v16    # "xmlPullParser":Lorg/xmlpull/v1/XmlPullParser;
    :catch_4
    move-exception v7

    .line 390
    .restart local v7    # "e":Ljava/io/IOException;
    invoke-virtual {v7}, Ljava/io/IOException;->printStackTrace()V

    .end local v7    # "e":Ljava/io/IOException;
    :cond_d
    move-object v2, v3

    .end local v3    # "app":Lcom/edutech/mobilestudyclient/activity/AppBean;
    .restart local v2    # "app":Lcom/edutech/mobilestudyclient/activity/AppBean;
    move-object v5, v6

    .end local v6    # "config":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v5    # "config":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    goto/16 :goto_0

    .line 383
    .end local v2    # "app":Lcom/edutech/mobilestudyclient/activity/AppBean;
    .end local v5    # "config":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v3    # "app":Lcom/edutech/mobilestudyclient/activity/AppBean;
    .restart local v6    # "config":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    :catchall_1
    move-exception v17

    move-object v2, v3

    .end local v3    # "app":Lcom/edutech/mobilestudyclient/activity/AppBean;
    .restart local v2    # "app":Lcom/edutech/mobilestudyclient/activity/AppBean;
    move-object v5, v6

    .end local v6    # "config":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v5    # "config":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    goto :goto_6

    .end local v5    # "config":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v6    # "config":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v13    # "nodeName":Ljava/lang/String;
    :catchall_2
    move-exception v17

    move-object v5, v6

    .end local v6    # "config":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v5    # "config":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    goto :goto_6

    .line 380
    .end local v2    # "app":Lcom/edutech/mobilestudyclient/activity/AppBean;
    .end local v5    # "config":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v13    # "nodeName":Ljava/lang/String;
    .restart local v3    # "app":Lcom/edutech/mobilestudyclient/activity/AppBean;
    .restart local v6    # "config":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    :catch_5
    move-exception v7

    move-object v2, v3

    .end local v3    # "app":Lcom/edutech/mobilestudyclient/activity/AppBean;
    .restart local v2    # "app":Lcom/edutech/mobilestudyclient/activity/AppBean;
    move-object v5, v6

    .end local v6    # "config":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v5    # "config":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    goto :goto_5

    .end local v5    # "config":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v6    # "config":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v13    # "nodeName":Ljava/lang/String;
    :catch_6
    move-exception v7

    move-object v5, v6

    .end local v6    # "config":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v5    # "config":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    goto :goto_5

    .end local v2    # "app":Lcom/edutech/mobilestudyclient/activity/AppBean;
    .end local v5    # "config":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v3    # "app":Lcom/edutech/mobilestudyclient/activity/AppBean;
    .restart local v6    # "config":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_e
    move-object v2, v3

    .end local v3    # "app":Lcom/edutech/mobilestudyclient/activity/AppBean;
    .restart local v2    # "app":Lcom/edutech/mobilestudyclient/activity/AppBean;
    move-object v5, v6

    .end local v6    # "config":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v5    # "config":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    goto/16 :goto_4

    .line 334
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method
