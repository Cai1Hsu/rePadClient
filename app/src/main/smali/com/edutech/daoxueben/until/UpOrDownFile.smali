.class public Lcom/edutech/daoxueben/until/UpOrDownFile;
.super Ljava/lang/Object;
.source "UpOrDownFile.java"


# static fields
.field public static BookId:Ljava/lang/String;

.field public static DXisNeedUpdate:Ljava/lang/String;

.field public static DownloadPercent:I

.field public static OFFLINE:I

.field public static RefreshTimes:I

.field public static WebViewType:Ljava/lang/String;

.field public static allDsize:J

.field public static apihost:Ljava/lang/String;

.field public static currentCacheLength:J

.field public static currentCachePosition:J

.field public static currentCacheTime:I

.field public static currentDLsize:J

.field public static deleteJsonString:Ljava/lang/String;

.field public static downloadedDX:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static examType:Ljava/lang/String;

.field public static exams:Ljava/lang/String;

.field public static firstInitSql:Ljava/lang/String;

.field public static gdstate:Ljava/lang/String;

.field private static hashmap:Ljava/util/HashMap;
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

.field public static internetIsOk:I

.field public static ip:Ljava/lang/String;

.field public static isCacheFile:Z

.field public static isLoadingDxid:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field public static mediaState:Ljava/lang/String;

.field public static onlineContent:I

.field public static privatekey:Ljava/lang/String;

.field public static typeHistory:Ljava/lang/String;

.field public static userId:Ljava/lang/String;

.field public static username:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x1

    const-wide/16 v2, 0x0

    const/4 v1, 0x0

    .line 39
    const-string/jumbo v0, ""

    sput-object v0, Lcom/edutech/daoxueben/until/UpOrDownFile;->apihost:Ljava/lang/String;

    .line 40
    const-string/jumbo v0, ""

    sput-object v0, Lcom/edutech/daoxueben/until/UpOrDownFile;->ip:Ljava/lang/String;

    .line 41
    const-string/jumbo v0, ""

    sput-object v0, Lcom/edutech/daoxueben/until/UpOrDownFile;->privatekey:Ljava/lang/String;

    .line 42
    const-string/jumbo v0, "c"

    sput-object v0, Lcom/edutech/daoxueben/until/UpOrDownFile;->username:Ljava/lang/String;

    .line 43
    const-string/jumbo v0, ""

    sput-object v0, Lcom/edutech/daoxueben/until/UpOrDownFile;->userId:Ljava/lang/String;

    .line 44
    const-string/jumbo v0, ""

    sput-object v0, Lcom/edutech/daoxueben/until/UpOrDownFile;->deleteJsonString:Ljava/lang/String;

    .line 45
    sput v4, Lcom/edutech/daoxueben/until/UpOrDownFile;->internetIsOk:I

    .line 46
    sput v1, Lcom/edutech/daoxueben/until/UpOrDownFile;->onlineContent:I

    .line 47
    const-string/jumbo v0, ""

    sput-object v0, Lcom/edutech/daoxueben/until/UpOrDownFile;->examType:Ljava/lang/String;

    .line 48
    const-string/jumbo v0, "-1"

    sput-object v0, Lcom/edutech/daoxueben/until/UpOrDownFile;->BookId:Ljava/lang/String;

    .line 49
    const-string/jumbo v0, "0"

    sput-object v0, Lcom/edutech/daoxueben/until/UpOrDownFile;->DXisNeedUpdate:Ljava/lang/String;

    .line 50
    sput v1, Lcom/edutech/daoxueben/until/UpOrDownFile;->DownloadPercent:I

    .line 51
    sput-wide v2, Lcom/edutech/daoxueben/until/UpOrDownFile;->currentDLsize:J

    .line 52
    sput-wide v2, Lcom/edutech/daoxueben/until/UpOrDownFile;->allDsize:J

    .line 53
    const-string/jumbo v0, "0"

    sput-object v0, Lcom/edutech/daoxueben/until/UpOrDownFile;->typeHistory:Ljava/lang/String;

    .line 54
    const-string/jumbo v0, ""

    sput-object v0, Lcom/edutech/daoxueben/until/UpOrDownFile;->exams:Ljava/lang/String;

    .line 55
    const-string/jumbo v0, "0"

    sput-object v0, Lcom/edutech/daoxueben/until/UpOrDownFile;->mediaState:Ljava/lang/String;

    .line 56
    sput v1, Lcom/edutech/daoxueben/until/UpOrDownFile;->RefreshTimes:I

    .line 57
    sput-object v5, Lcom/edutech/daoxueben/until/UpOrDownFile;->isLoadingDxid:Ljava/util/HashMap;

    .line 58
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/edutech/daoxueben/until/UpOrDownFile;->downloadedDX:Ljava/util/List;

    .line 59
    sput v4, Lcom/edutech/daoxueben/until/UpOrDownFile;->OFFLINE:I

    .line 60
    const-string/jumbo v0, "-1"

    sput-object v0, Lcom/edutech/daoxueben/until/UpOrDownFile;->WebViewType:Ljava/lang/String;

    .line 61
    sput-boolean v4, Lcom/edutech/daoxueben/until/UpOrDownFile;->isCacheFile:Z

    .line 62
    const-string/jumbo v0, "0"

    sput-object v0, Lcom/edutech/daoxueben/until/UpOrDownFile;->firstInitSql:Ljava/lang/String;

    .line 63
    sput-wide v2, Lcom/edutech/daoxueben/until/UpOrDownFile;->currentCacheLength:J

    .line 64
    sput-wide v2, Lcom/edutech/daoxueben/until/UpOrDownFile;->currentCachePosition:J

    .line 65
    sput v1, Lcom/edutech/daoxueben/until/UpOrDownFile;->currentCacheTime:I

    .line 66
    const-string/jumbo v0, "1"

    sput-object v0, Lcom/edutech/daoxueben/until/UpOrDownFile;->gdstate:Ljava/lang/String;

    .line 71
    sput-object v5, Lcom/edutech/daoxueben/until/UpOrDownFile;->hashmap:Ljava/util/HashMap;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static Get_Config_infor()V
    .locals 3

    .prologue
    .line 81
    invoke-static {}, Lcom/edutech/mobilestudyclient/util/XmlLoadHelper;->loadXml()Ljava/util/HashMap;

    move-result-object v0

    sput-object v0, Lcom/edutech/daoxueben/until/UpOrDownFile;->hashmap:Ljava/util/HashMap;

    .line 82
    sget-object v0, Lcom/edutech/daoxueben/until/UpOrDownFile;->hashmap:Ljava/util/HashMap;

    const-string/jumbo v1, "username"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    sput-object v0, Lcom/edutech/daoxueben/until/UpOrDownFile;->username:Ljava/lang/String;

    .line 83
    sget-object v0, Lcom/edutech/daoxueben/until/UpOrDownFile;->hashmap:Ljava/util/HashMap;

    const-string/jumbo v1, "ip"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    sput-object v0, Lcom/edutech/daoxueben/until/UpOrDownFile;->ip:Ljava/lang/String;

    .line 84
    sget-object v0, Lcom/edutech/daoxueben/until/UpOrDownFile;->hashmap:Ljava/util/HashMap;

    const-string/jumbo v1, "privatekey"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 86
    sget-object v0, Lcom/edutech/daoxueben/until/UpOrDownFile;->hashmap:Ljava/util/HashMap;

    const-string/jumbo v1, "privatekey"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    sput-object v0, Lcom/edutech/daoxueben/until/UpOrDownFile;->privatekey:Ljava/lang/String;

    .line 88
    :cond_0
    sget-object v0, Lcom/edutech/daoxueben/until/UpOrDownFile;->hashmap:Ljava/util/HashMap;

    const-string/jumbo v1, "stuid"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 90
    sget-object v0, Lcom/edutech/daoxueben/until/UpOrDownFile;->hashmap:Ljava/util/HashMap;

    const-string/jumbo v1, "stuid"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    sput-object v0, Lcom/edutech/daoxueben/until/UpOrDownFile;->userId:Ljava/lang/String;

    .line 92
    :cond_1
    sget-object v0, Lcom/edutech/daoxueben/until/UpOrDownFile;->hashmap:Ljava/util/HashMap;

    const-string/jumbo v1, "apihost"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 94
    sget-object v0, Lcom/edutech/daoxueben/until/UpOrDownFile;->hashmap:Ljava/util/HashMap;

    const-string/jumbo v1, "apihost"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    sput-object v0, Lcom/edutech/daoxueben/until/UpOrDownFile;->apihost:Ljava/lang/String;

    .line 96
    :cond_2
    sget-object v0, Lcom/edutech/daoxueben/until/UpOrDownFile;->hashmap:Ljava/util/HashMap;

    const-string/jumbo v1, "gdstate"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 98
    sget-object v0, Lcom/edutech/daoxueben/until/UpOrDownFile;->hashmap:Ljava/util/HashMap;

    const-string/jumbo v1, "gdstate"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    sput-object v0, Lcom/edutech/daoxueben/until/UpOrDownFile;->gdstate:Ljava/lang/String;

    .line 100
    :cond_3
    const-string/jumbo v0, "CloudClientActivity"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string/jumbo v2, "ip:"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v2, Lcom/edutech/daoxueben/until/UpOrDownFile;->apihost:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 101
    const-string/jumbo v0, "CloudClientActivity"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string/jumbo v2, "username:"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v2, Lcom/edutech/daoxueben/until/UpOrDownFile;->username:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 102
    const-string/jumbo v0, "CloudClientActivity"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string/jumbo v2, "stuid:"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v2, Lcom/edutech/daoxueben/until/UpOrDownFile;->userId:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 103
    const-string/jumbo v0, "CloudClientActivity"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string/jumbo v2, "privatekey:"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v2, Lcom/edutech/daoxueben/until/UpOrDownFile;->privatekey:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 105
    return-void
.end method

.method public static Post_addheader(Ljava/lang/String;)Lorg/apache/http/client/methods/HttpPost;
    .locals 3
    .param p0, "url"    # Ljava/lang/String;

    .prologue
    .line 118
    sget-object v1, Lcom/edutech/daoxueben/until/UpOrDownFile;->hashmap:Ljava/util/HashMap;

    if-nez v1, :cond_0

    .line 119
    invoke-static {}, Lcom/edutech/daoxueben/until/UpOrDownFile;->Get_Config_infor()V

    .line 122
    :cond_0
    :try_start_0
    sget-object v1, Lcom/edutech/daoxueben/until/UpOrDownFile;->username:Ljava/lang/String;

    sget-object v2, Lcom/edutech/daoxueben/until/UpOrDownFile;->privatekey:Ljava/lang/String;

    invoke-static {p0, v1, v2}, Lcom/edutech/daoxueben/until/UpOrDownFile;->Post_http_addheader(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/apache/http/client/methods/HttpPost;
    :try_end_0
    .catch Lorg/apache/http/client/ClientProtocolException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v1

    .line 130
    :goto_0
    return-object v1

    .line 123
    :catch_0
    move-exception v0

    .line 125
    .local v0, "e":Lorg/apache/http/client/ClientProtocolException;
    invoke-virtual {v0}, Lorg/apache/http/client/ClientProtocolException;->printStackTrace()V

    .line 130
    .end local v0    # "e":Lorg/apache/http/client/ClientProtocolException;
    :goto_1
    const/4 v1, 0x0

    goto :goto_0

    .line 126
    :catch_1
    move-exception v0

    .line 128
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_1
.end method

.method private static Post_http_addheader(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/apache/http/client/methods/HttpPost;
    .locals 8
    .param p0, "url"    # Ljava/lang/String;
    .param p1, "user_Name"    # Ljava/lang/String;
    .param p2, "Random_number_10"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/apache/http/client/ClientProtocolException;
        }
    .end annotation

    .prologue
    .line 236
    new-instance v2, Lorg/apache/http/client/methods/HttpPost;

    invoke-direct {v2}, Lorg/apache/http/client/methods/HttpPost;-><init>()V

    .line 237
    .local v2, "post":Lorg/apache/http/client/methods/HttpPost;
    new-instance v3, Lorg/apache/http/client/methods/HttpPost;

    invoke-direct {v3, p0}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/lang/String;)V

    .line 243
    .local v3, "request":Lorg/apache/http/client/methods/HttpPost;
    const-string/jumbo v5, "X-Edutech-Entity"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v7, "+"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    .line 244
    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 243
    invoke-virtual {v3, v5, v6}, Lorg/apache/http/client/methods/HttpPost;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 246
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 247
    .local v0, "imestamp":J
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/edutech/mobilestudyclient/util/My_md5;->Md5(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 248
    .local v4, "sign":Ljava/lang/String;
    const-string/jumbo v5, "Test2"

    new-instance v6, Ljava/lang/StringBuilder;

    const-string/jumbo v7, "timestamp="

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, "   sign="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 250
    const-string/jumbo v5, "X-Edutech-Sign"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v7, "+"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v5, v6}, Lorg/apache/http/client/methods/HttpPost;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 252
    return-object v3
.end method

.method public static downFile(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 22
    .param p0, "url"    # Ljava/lang/String;
    .param p1, "path"    # Ljava/lang/String;
    .param p2, "fileName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 337
    const-string/jumbo v14, ""

    .line 338
    .local v14, "myfilename":Ljava/lang/String;
    if-eqz p2, :cond_0

    const-string/jumbo v17, ""

    move-object/from16 v0, p2

    move-object/from16 v1, v17

    if-ne v0, v1, :cond_1

    .line 339
    :cond_0
    const-string/jumbo v17, "/"

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v17

    add-int/lit8 v17, v17, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v14

    .line 343
    :goto_0
    new-instance v4, Ljava/net/URL;

    move-object/from16 v0, p0

    invoke-direct {v4, v0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 344
    .local v4, "Url":Ljava/net/URL;
    invoke-virtual {v4}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v6

    .line 345
    .local v6, "conn":Ljava/net/URLConnection;
    invoke-virtual {v6}, Ljava/net/URLConnection;->connect()V

    .line 346
    invoke-virtual {v6}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v11

    .line 347
    .local v11, "is":Ljava/io/InputStream;
    if-nez v11, :cond_2

    .line 349
    const/16 v17, 0x0

    .line 416
    :goto_1
    return v17

    .line 341
    .end local v4    # "Url":Ljava/net/URL;
    .end local v6    # "conn":Ljava/net/URLConnection;
    .end local v11    # "is":Ljava/io/InputStream;
    :cond_1
    move-object/from16 v14, p2

    goto :goto_0

    .line 352
    .restart local v4    # "Url":Ljava/net/URL;
    .restart local v6    # "conn":Ljava/net/URLConnection;
    .restart local v11    # "is":Ljava/io/InputStream;
    :cond_2
    const-string/jumbo v17, "Content-Disposition"

    move-object/from16 v0, v17

    invoke-virtual {v6, v0}, Ljava/net/URLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    .line 354
    .local v16, "str_httprsponse":Ljava/lang/String;
    if-eqz v16, :cond_4

    invoke-virtual/range {v16 .. v16}, Ljava/lang/String;->length()I

    move-result v17

    const/16 v18, 0x17

    move/from16 v0, v17

    move/from16 v1, v18

    if-le v0, v1, :cond_4

    .line 357
    const-string/jumbo v17, "attachment; filename="

    invoke-virtual/range {v16 .. v17}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v17

    add-int/lit8 v17, v17, 0x16

    .line 358
    invoke-virtual/range {v16 .. v16}, Ljava/lang/String;->length()I

    move-result v18

    add-int/lit8 v18, v18, -0x1

    .line 356
    invoke-virtual/range {v16 .. v18}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v17

    sput-object v17, Lcom/edutech/daoxueben/sysconfig/AppEnvironment;->DOWNFILENAME:Ljava/lang/String;

    .line 359
    new-instance v17, Ljava/lang/String;

    .line 360
    sget-object v18, Lcom/edutech/daoxueben/sysconfig/AppEnvironment;->DOWNFILENAME:Ljava/lang/String;

    const-string/jumbo v19, "8859_1"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v18

    const-string/jumbo v19, "utf-8"

    .line 359
    invoke-direct/range {v17 .. v19}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    sput-object v17, Lcom/edutech/daoxueben/sysconfig/AppEnvironment;->DOWNFILENAME:Ljava/lang/String;

    .line 376
    :goto_2
    invoke-virtual {v6}, Ljava/net/URLConnection;->getContentLength()I

    move-result v17

    move/from16 v0, v17

    int-to-long v12, v0

    .line 377
    .local v12, "length":J
    new-instance v9, Ljava/io/File;

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-static/range {p1 .. p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v18

    invoke-direct/range {v17 .. v18}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v18, Lcom/edutech/daoxueben/sysconfig/AppEnvironment;->DOWNFILENAME:Ljava/lang/String;

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-direct {v9, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 378
    .local v9, "file":Ljava/io/File;
    const-string/jumbo v17, "sdcard"

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-static {v12, v13}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v19

    invoke-direct/range {v18 .. v19}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v19, ","

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual {v9}, Ljava/io/File;->length()J

    move-result-wide v20

    move-object/from16 v0, v18

    move-wide/from16 v1, v20

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v17 .. v18}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 379
    invoke-virtual {v9}, Ljava/io/File;->exists()Z

    move-result v17

    if-eqz v17, :cond_5

    invoke-virtual {v9}, Ljava/io/File;->length()J

    move-result-wide v18

    cmp-long v17, v18, v12

    if-eqz v17, :cond_5

    .line 381
    invoke-virtual {v9}, Ljava/io/File;->delete()Z

    .line 386
    :cond_3
    new-instance v10, Ljava/io/FileOutputStream;

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-static/range {p1 .. p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v18

    invoke-direct/range {v17 .. v18}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 387
    sget-object v18, Lcom/edutech/daoxueben/sysconfig/AppEnvironment;->DOWNFILENAME:Ljava/lang/String;

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    .line 386
    move-object/from16 v0, v17

    invoke-direct {v10, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    .line 388
    .local v10, "fos":Ljava/io/FileOutputStream;
    const/16 v17, 0x400

    move/from16 v0, v17

    new-array v5, v0, [B

    .line 389
    .local v5, "buf":[B
    const/4 v7, 0x0

    .line 392
    .local v7, "downLoadFilePosition":I
    sput-wide v12, Lcom/edutech/daoxueben/until/UpOrDownFile;->currentCacheLength:J

    .line 393
    :goto_3
    invoke-virtual {v11, v5}, Ljava/io/InputStream;->read([B)I

    move-result v15

    .local v15, "numread":I
    const/16 v17, -0x1

    move/from16 v0, v17

    if-ne v15, v0, :cond_6

    .line 406
    :goto_4
    :try_start_0
    invoke-virtual {v11}, Ljava/io/InputStream;->close()V

    .line 407
    invoke-virtual {v10}, Ljava/io/FileOutputStream;->flush()V

    .line 408
    invoke-virtual {v10}, Ljava/io/FileOutputStream;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 412
    sget-boolean v17, Lcom/edutech/daoxueben/until/UpOrDownFile;->isCacheFile:Z

    if-nez v17, :cond_8

    .line 414
    const/16 v17, 0x0

    goto/16 :goto_1

    .line 372
    .end local v5    # "buf":[B
    .end local v7    # "downLoadFilePosition":I
    .end local v9    # "file":Ljava/io/File;
    .end local v10    # "fos":Ljava/io/FileOutputStream;
    .end local v12    # "length":J
    .end local v15    # "numread":I
    :cond_4
    sput-object v14, Lcom/edutech/daoxueben/sysconfig/AppEnvironment;->DOWNFILENAME:Ljava/lang/String;

    goto/16 :goto_2

    .line 382
    .restart local v9    # "file":Ljava/io/File;
    .restart local v12    # "length":J
    :cond_5
    invoke-virtual {v9}, Ljava/io/File;->exists()Z

    move-result v17

    if-eqz v17, :cond_3

    .line 384
    const/16 v17, 0x1

    goto/16 :goto_1

    .line 394
    .restart local v5    # "buf":[B
    .restart local v7    # "downLoadFilePosition":I
    .restart local v10    # "fos":Ljava/io/FileOutputStream;
    .restart local v15    # "numread":I
    :cond_6
    const/16 v17, 0x0

    move/from16 v0, v17

    invoke-virtual {v10, v5, v0, v15}, Ljava/io/FileOutputStream;->write([BII)V

    .line 395
    add-int/2addr v7, v15

    .line 396
    sget-boolean v17, Lcom/edutech/daoxueben/until/UpOrDownFile;->isCacheFile:Z

    if-nez v17, :cond_7

    .line 398
    const-string/jumbo v17, "iscache"

    new-instance v18, Ljava/lang/StringBuilder;

    sget-boolean v19, Lcom/edutech/daoxueben/until/UpOrDownFile;->isCacheFile:Z

    invoke-static/range {v19 .. v19}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v19

    invoke-direct/range {v18 .. v19}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v17 .. v18}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_4

    .line 401
    :cond_7
    int-to-long v0, v7

    move-wide/from16 v18, v0

    sput-wide v18, Lcom/edutech/daoxueben/until/UpOrDownFile;->currentCachePosition:J

    goto :goto_3

    .line 409
    :catch_0
    move-exception v8

    .line 410
    .local v8, "ex":Ljava/lang/Exception;
    const/16 v17, 0x0

    goto/16 :goto_1

    .line 416
    .end local v8    # "ex":Ljava/lang/Exception;
    :cond_8
    const/16 v17, 0x1

    goto/16 :goto_1
.end method

.method public static downFileNormal(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 16
    .param p0, "url"    # Ljava/lang/String;
    .param p1, "path"    # Ljava/lang/String;
    .param p2, "fileName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 431
    new-instance v2, Ljava/net/URL;

    move-object/from16 v0, p0

    invoke-direct {v2, v0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 432
    .local v2, "Url":Ljava/net/URL;
    invoke-virtual {v2}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v4

    .line 433
    .local v4, "conn":Ljava/net/URLConnection;
    invoke-virtual {v4}, Ljava/net/URLConnection;->connect()V

    .line 434
    invoke-virtual {v4}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v8

    .line 435
    .local v8, "is":Ljava/io/InputStream;
    if-nez v8, :cond_0

    .line 437
    const/4 v12, 0x0

    .line 463
    :goto_0
    return v12

    .line 439
    :cond_0
    invoke-virtual {v4}, Ljava/net/URLConnection;->getContentLength()I

    move-result v12

    int-to-long v10, v12

    .line 440
    .local v10, "length":J
    new-instance v6, Ljava/io/File;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-static/range {p1 .. p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    invoke-direct {v12, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p2

    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v6, v12}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 441
    .local v6, "file":Ljava/io/File;
    const-string/jumbo v12, "bookpicS"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-static {v10, v11}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v14

    invoke-direct {v13, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v14, ","

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v6}, Ljava/io/File;->length()J

    move-result-wide v14

    invoke-virtual {v13, v14, v15}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string/jumbo v14, ","

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    move-object/from16 v0, p2

    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 442
    invoke-virtual {v6}, Ljava/io/File;->exists()Z

    move-result v12

    if-eqz v12, :cond_2

    invoke-virtual {v6}, Ljava/io/File;->length()J

    move-result-wide v12

    cmp-long v12, v12, v10

    if-eqz v12, :cond_2

    .line 444
    invoke-virtual {v6}, Ljava/io/File;->delete()Z

    .line 449
    :cond_1
    new-instance v7, Ljava/io/FileOutputStream;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-static/range {p1 .. p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    invoke-direct {v12, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 450
    move-object/from16 v0, p2

    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    .line 449
    invoke-direct {v7, v12}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    .line 451
    .local v7, "fos":Ljava/io/FileOutputStream;
    const/16 v12, 0x400

    new-array v3, v12, [B

    .line 453
    .local v3, "buf":[B
    :goto_1
    invoke-virtual {v8, v3}, Ljava/io/InputStream;->read([B)I

    move-result v9

    .local v9, "numread":I
    const/4 v12, -0x1

    if-ne v9, v12, :cond_3

    .line 457
    :try_start_0
    invoke-virtual {v8}, Ljava/io/InputStream;->close()V

    .line 458
    invoke-virtual {v7}, Ljava/io/FileOutputStream;->flush()V

    .line 459
    invoke-virtual {v7}, Ljava/io/FileOutputStream;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 463
    const/4 v12, 0x1

    goto/16 :goto_0

    .line 445
    .end local v3    # "buf":[B
    .end local v7    # "fos":Ljava/io/FileOutputStream;
    .end local v9    # "numread":I
    :cond_2
    invoke-virtual {v6}, Ljava/io/File;->exists()Z

    move-result v12

    if-eqz v12, :cond_1

    .line 447
    const/4 v12, 0x1

    goto/16 :goto_0

    .line 454
    .restart local v3    # "buf":[B
    .restart local v7    # "fos":Ljava/io/FileOutputStream;
    .restart local v9    # "numread":I
    :cond_3
    const/4 v12, 0x0

    invoke-virtual {v7, v3, v12, v9}, Ljava/io/FileOutputStream;->write([BII)V

    goto :goto_1

    .line 460
    :catch_0
    move-exception v5

    .line 461
    .local v5, "ex":Ljava/lang/Exception;
    const/4 v12, 0x0

    goto/16 :goto_0
.end method

.method public static postAnswerFile(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
    .locals 26
    .param p0, "filename"    # Ljava/lang/String;
    .param p1, "load_zip"    # Ljava/lang/String;
    .param p2, "url_str"    # Ljava/lang/String;

    .prologue
    .line 134
    if-eqz p2, :cond_0

    const-string/jumbo v23, ""

    move-object/from16 v0, p2

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v23

    if-eqz v23, :cond_1

    .line 135
    :cond_0
    const-string/jumbo v23, "Test"

    const-string/jumbo v24, "put_correct \u5165\u53c2\u6709\u95ee\u9898\u3002\u3002\u3002"

    invoke-static/range {v23 .. v24}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 136
    const/16 v23, -0x1

    .line 221
    :goto_0
    return v23

    .line 138
    :cond_1
    move-object/from16 v21, p2

    .line 140
    .local v21, "url":Ljava/lang/String;
    if-eqz p1, :cond_2

    const-string/jumbo v23, ""

    move-object/from16 v0, p1

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v23

    if-eqz v23, :cond_3

    .line 141
    :cond_2
    const/16 v23, -0x1

    goto :goto_0

    .line 143
    :cond_3
    move-object/from16 v20, p1

    .line 146
    .local v20, "strZipName":Ljava/lang/String;
    :try_start_0
    sget-object v22, Lcom/edutech/daoxueben/until/UpOrDownFile;->username:Ljava/lang/String;

    .line 147
    .local v22, "user_Name":Ljava/lang/String;
    sget-object v2, Lcom/edutech/daoxueben/until/UpOrDownFile;->privatekey:Ljava/lang/String;

    .line 148
    .local v2, "Random_number_10":Ljava/lang/String;
    const-string/jumbo v3, "mobile"

    .line 150
    .local v3, "The_client":Ljava/lang/String;
    move-object/from16 v0, v21

    move-object/from16 v1, v22

    invoke-static {v0, v1, v2}, Lcom/edutech/daoxueben/until/UpOrDownFile;->Post_http_addheader(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/apache/http/client/methods/HttpPost;

    move-result-object v15

    .line 152
    .local v15, "request":Lorg/apache/http/client/methods/HttpPost;
    sget-object v23, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v24, Ljava/lang/StringBuilder;

    const-string/jumbo v25, "sendUrl:"

    invoke-direct/range {v24 .. v25}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v24

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    const-string/jumbo v25, ","

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    sget-object v25, Lcom/edutech/daoxueben/until/UpOrDownFile;->privatekey:Ljava/lang/String;

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-virtual/range {v23 .. v24}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 153
    new-instance v4, Lorg/apache/http/entity/mime/content/FileBody;

    new-instance v23, Ljava/io/File;

    move-object/from16 v0, v23

    move-object/from16 v1, v20

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v23

    invoke-direct {v4, v0}, Lorg/apache/http/entity/mime/content/FileBody;-><init>(Ljava/io/File;)V

    .line 154
    .local v4, "bin":Lorg/apache/http/entity/mime/content/FileBody;
    new-instance v7, Lorg/apache/http/entity/mime/content/StringBody;

    const-string/jumbo v23, "uploadedfile"

    move-object/from16 v0, v23

    invoke-direct {v7, v0}, Lorg/apache/http/entity/mime/content/StringBody;-><init>(Ljava/lang/String;)V

    .line 155
    .local v7, "comment":Lorg/apache/http/entity/mime/content/StringBody;
    new-instance v14, Lorg/apache/http/entity/mime/MultipartEntity;

    invoke-direct {v14}, Lorg/apache/http/entity/mime/MultipartEntity;-><init>()V

    .line 156
    .local v14, "reqEntity":Lorg/apache/http/entity/mime/MultipartEntity;
    const-string/jumbo v23, "uploadedfile"

    move-object/from16 v0, v23

    invoke-virtual {v14, v0, v4}, Lorg/apache/http/entity/mime/MultipartEntity;->addPart(Ljava/lang/String;Lorg/apache/http/entity/mime/content/ContentBody;)V

    .line 157
    const-string/jumbo v23, "comment"

    move-object/from16 v0, v23

    invoke-virtual {v14, v0, v7}, Lorg/apache/http/entity/mime/MultipartEntity;->addPart(Ljava/lang/String;Lorg/apache/http/entity/mime/content/ContentBody;)V

    .line 158
    const-string/jumbo v23, "id"

    new-instance v24, Lorg/apache/http/entity/mime/content/StringBody;

    sget-object v25, Lcom/edutech/daoxueben/sysconfig/AppEnvironment;->EXAM_ID:Ljava/lang/String;

    invoke-direct/range {v24 .. v25}, Lorg/apache/http/entity/mime/content/StringBody;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v23

    move-object/from16 v1, v24

    invoke-virtual {v14, v0, v1}, Lorg/apache/http/entity/mime/MultipartEntity;->addPart(Ljava/lang/String;Lorg/apache/http/entity/mime/content/ContentBody;)V

    .line 159
    const-string/jumbo v23, "studentid"

    new-instance v24, Lorg/apache/http/entity/mime/content/StringBody;

    sget-object v25, Lcom/edutech/daoxueben/sysconfig/AppEnvironment;->StudentId:Ljava/lang/String;

    invoke-direct/range {v24 .. v25}, Lorg/apache/http/entity/mime/content/StringBody;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v23

    move-object/from16 v1, v24

    invoke-virtual {v14, v0, v1}, Lorg/apache/http/entity/mime/MultipartEntity;->addPart(Ljava/lang/String;Lorg/apache/http/entity/mime/content/ContentBody;)V

    .line 160
    invoke-virtual {v15, v14}, Lorg/apache/http/client/methods/HttpPost;->setEntity(Lorg/apache/http/HttpEntity;)V

    .line 161
    const-string/jumbo v23, "Test2"

    new-instance v24, Ljava/lang/StringBuilder;

    const-string/jumbo v25, "\u4ee3\u4ea4\u4f5c\u4e1a\u63d0\u4ea4HWID\u3002\u3002\u3002"

    invoke-direct/range {v24 .. v25}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v25, Lcom/edutech/daoxueben/sysconfig/AppEnvironment;->EXAM_ID:Ljava/lang/String;

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-static/range {v23 .. v24}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 162
    const-string/jumbo v23, "Test2"

    new-instance v24, Ljava/lang/StringBuilder;

    const-string/jumbo v25, "\u4ee3\u4ea4\u4f5c\u4e1a\u63d0\u4ea4STID\u3002\u3002\u3002"

    invoke-direct/range {v24 .. v25}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v25, Lcom/edutech/daoxueben/sysconfig/AppEnvironment;->StudentId:Ljava/lang/String;

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-static/range {v23 .. v24}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 163
    const-string/jumbo v23, "Test2"

    new-instance v24, Ljava/lang/StringBuilder;

    const-string/jumbo v25, "\u4ee3\u4ea4\u4f5c\u4e1a\u63d0\u4ea4URL\u3002\u3002\u3002."

    invoke-direct/range {v24 .. v25}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v24

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-static/range {v23 .. v24}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 164
    const-string/jumbo v23, "Test2"

    new-instance v24, Ljava/lang/StringBuilder;

    const-string/jumbo v25, "\u4ee3\u4ea4\u4f5c\u4e1a\u63d0\u4ea4\u3002\u3002\u3002"

    invoke-direct/range {v24 .. v25}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v24

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-static/range {v23 .. v24}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 165
    new-instance v12, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v12}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    .line 166
    .local v12, "httpClient":Lorg/apache/http/impl/client/DefaultHttpClient;
    invoke-virtual {v12, v15}, Lorg/apache/http/impl/client/DefaultHttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v13

    .line 169
    .local v13, "httpResponse":Lorg/apache/http/HttpResponse;
    const-string/jumbo v23, "Test2"

    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {v13}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v25

    invoke-interface/range {v25 .. v25}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v25

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-static/range {v23 .. v24}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 171
    invoke-interface {v13}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v23

    invoke-interface/range {v23 .. v23}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v23

    const/16 v24, 0xc8

    move/from16 v0, v23

    move/from16 v1, v24

    if-ne v0, v1, :cond_7

    .line 173
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 174
    .local v6, "builder":Ljava/lang/StringBuilder;
    new-instance v5, Ljava/io/BufferedReader;

    .line 175
    new-instance v23, Ljava/io/InputStreamReader;

    invoke-interface {v13}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v24

    .line 176
    invoke-interface/range {v24 .. v24}, Lorg/apache/http/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object v24

    const-string/jumbo v25, "UTF-8"

    .line 175
    invoke-direct/range {v23 .. v25}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 174
    move-object/from16 v0, v23

    invoke-direct {v5, v0}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 177
    .local v5, "bufferedReader2":Ljava/io/BufferedReader;
    invoke-virtual {v5}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v18

    .local v18, "s":Ljava/lang/String;
    :goto_1
    if-nez v18, :cond_5

    .line 181
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    .line 183
    .local v16, "resultString":Ljava/lang/String;
    sget-object v23, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v24, Ljava/lang/StringBuilder;

    const-string/jumbo v25, "\u8fd4\u56de\u7684\u4fe1\u606f  \uff1a"

    invoke-direct/range {v24 .. v25}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v24

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-virtual/range {v23 .. v24}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 184
    const-string/jumbo v23, "Test2"

    const-string/jumbo v24, "\u6279\u9605\u4f5c\u4e1a\u63d0\u4ea4\u5b8c\u6210\u3002\u3002\u3002"

    invoke-static/range {v23 .. v24}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 185
    new-instance v17, Lorg/json/JSONObject;

    move-object/from16 v0, v17

    move-object/from16 v1, v16

    invoke-direct {v0, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 192
    .local v17, "result_json":Lorg/json/JSONObject;
    const-string/jumbo v23, "status"

    move-object/from16 v0, v17

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    .line 193
    .local v19, "status":Ljava/lang/String;
    const-string/jumbo v23, "errorNum"

    move-object/from16 v0, v17

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 194
    .local v10, "errorNum":Ljava/lang/String;
    const-string/jumbo v23, "errorInfo"

    move-object/from16 v0, v17

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 196
    .local v9, "errorInfo":Ljava/lang/String;
    const-string/jumbo v23, "Test2"

    new-instance v24, Ljava/lang/StringBuilder;

    const-string/jumbo v25, "status "

    invoke-direct/range {v24 .. v25}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v24

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-static/range {v23 .. v24}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 197
    const-string/jumbo v23, "Test2"

    new-instance v24, Ljava/lang/StringBuilder;

    const-string/jumbo v25, "errorNum "

    invoke-direct/range {v24 .. v25}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v24

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-static/range {v23 .. v24}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 198
    const-string/jumbo v23, "Test2"

    new-instance v24, Ljava/lang/StringBuilder;

    const-string/jumbo v25, "errorInfo "

    invoke-direct/range {v24 .. v25}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v24

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-static/range {v23 .. v24}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 199
    new-instance v11, Ljava/io/File;

    move-object/from16 v0, p1

    invoke-direct {v11, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 200
    .local v11, "file":Ljava/io/File;
    invoke-virtual {v11}, Ljava/io/File;->exists()Z

    move-result v23

    if-eqz v23, :cond_4

    .line 202
    invoke-virtual {v11}, Ljava/io/File;->delete()Z

    .line 204
    :cond_4
    if-eqz v10, :cond_6

    const-string/jumbo v23, "0"

    move-object/from16 v0, v23

    invoke-virtual {v10, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v23

    if-eqz v23, :cond_6

    .line 205
    const/16 v23, 0x1

    goto/16 :goto_0

    .line 179
    .end local v9    # "errorInfo":Ljava/lang/String;
    .end local v10    # "errorNum":Ljava/lang/String;
    .end local v11    # "file":Ljava/io/File;
    .end local v16    # "resultString":Ljava/lang/String;
    .end local v17    # "result_json":Lorg/json/JSONObject;
    .end local v19    # "status":Ljava/lang/String;
    :cond_5
    move-object/from16 v0, v18

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 178
    invoke-virtual {v5}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v18

    .line 177
    goto/16 :goto_1

    .line 207
    .restart local v9    # "errorInfo":Ljava/lang/String;
    .restart local v10    # "errorNum":Ljava/lang/String;
    .restart local v11    # "file":Ljava/io/File;
    .restart local v16    # "resultString":Ljava/lang/String;
    .restart local v17    # "result_json":Lorg/json/JSONObject;
    .restart local v19    # "status":Ljava/lang/String;
    :cond_6
    const/16 v23, 0x4

    goto/16 :goto_0

    .line 211
    .end local v5    # "bufferedReader2":Ljava/io/BufferedReader;
    .end local v6    # "builder":Ljava/lang/StringBuilder;
    .end local v9    # "errorInfo":Ljava/lang/String;
    .end local v10    # "errorNum":Ljava/lang/String;
    .end local v11    # "file":Ljava/io/File;
    .end local v16    # "resultString":Ljava/lang/String;
    .end local v17    # "result_json":Lorg/json/JSONObject;
    .end local v18    # "s":Ljava/lang/String;
    .end local v19    # "status":Ljava/lang/String;
    :cond_7
    const-string/jumbo v23, "Test2"

    const-string/jumbo v24, "\u4e0e\u670d\u52a1\u7aef\u8fde\u63a5\u5931\u8d25\u3002\u3002\u3002"

    invoke-static/range {v23 .. v24}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 212
    const-string/jumbo v23, "Test2"

    new-instance v24, Ljava/lang/StringBuilder;

    const-string/jumbo v25, "ddddd="

    invoke-direct/range {v24 .. v25}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 213
    invoke-interface {v13}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v25

    invoke-interface/range {v25 .. v25}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v25

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    .line 212
    invoke-static/range {v23 .. v24}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 215
    const-string/jumbo v23, "Test2"

    new-instance v24, Ljava/lang/StringBuilder;

    const-string/jumbo v25, "ddddd="

    invoke-direct/range {v24 .. v25}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {v13}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v25

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-static/range {v23 .. v24}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 221
    const/16 v23, 0x4

    goto/16 :goto_0

    .line 217
    .end local v2    # "Random_number_10":Ljava/lang/String;
    .end local v3    # "The_client":Ljava/lang/String;
    .end local v4    # "bin":Lorg/apache/http/entity/mime/content/FileBody;
    .end local v7    # "comment":Lorg/apache/http/entity/mime/content/StringBody;
    .end local v12    # "httpClient":Lorg/apache/http/impl/client/DefaultHttpClient;
    .end local v13    # "httpResponse":Lorg/apache/http/HttpResponse;
    .end local v14    # "reqEntity":Lorg/apache/http/entity/mime/MultipartEntity;
    .end local v15    # "request":Lorg/apache/http/client/methods/HttpPost;
    .end local v22    # "user_Name":Ljava/lang/String;
    :catch_0
    move-exception v8

    .line 218
    .local v8, "e":Ljava/lang/Exception;
    invoke-virtual {v8}, Ljava/lang/Exception;->printStackTrace()V

    .line 219
    const/16 v23, 0x4

    goto/16 :goto_0
.end method

.method public static uploadFile(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 18
    .param p0, "filename"    # Ljava/lang/String;
    .param p1, "localfile"    # Ljava/lang/String;
    .param p2, "actionUrl"    # Ljava/lang/String;

    .prologue
    .line 263
    const-string/jumbo v10, "\r\n"

    .line 264
    .local v10, "end":Ljava/lang/String;
    const-string/jumbo v1, "--"

    .line 265
    .local v1, "Hyphens":Ljava/lang/String;
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v15

    invoke-virtual {v15}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v3

    .line 268
    .local v3, "boundary":Ljava/lang/String;
    :try_start_0
    new-instance v14, Ljava/net/URL;

    move-object/from16 v0, p2

    invoke-direct {v14, v0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 269
    .local v14, "url":Ljava/net/URL;
    invoke-virtual {v14}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v7

    check-cast v7, Ljava/net/HttpURLConnection;

    .line 274
    .local v7, "con":Ljava/net/HttpURLConnection;
    const/4 v15, 0x1

    invoke-virtual {v7, v15}, Ljava/net/HttpURLConnection;->setDoInput(Z)V

    .line 275
    const/4 v15, 0x1

    invoke-virtual {v7, v15}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    .line 276
    const/4 v15, 0x0

    invoke-virtual {v7, v15}, Ljava/net/HttpURLConnection;->setUseCaches(Z)V

    .line 278
    const-string/jumbo v15, "POST"

    invoke-virtual {v7, v15}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 280
    const-string/jumbo v15, "Connection"

    const-string/jumbo v16, "Keep-Alive"

    move-object/from16 v0, v16

    invoke-virtual {v7, v15, v0}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 281
    const-string/jumbo v15, "Charset"

    const-string/jumbo v16, "UTF-8"

    move-object/from16 v0, v16

    invoke-virtual {v7, v15, v0}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 282
    const-string/jumbo v15, "Content-Type"

    .line 283
    new-instance v16, Ljava/lang/StringBuilder;

    const-string/jumbo v17, "multipart/form-data;boundary="

    invoke-direct/range {v16 .. v17}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v16

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    .line 282
    move-object/from16 v0, v16

    invoke-virtual {v7, v15, v0}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 285
    new-instance v8, Ljava/io/DataOutputStream;

    invoke-virtual {v7}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v15

    invoke-direct {v8, v15}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 286
    .local v8, "ds":Ljava/io/DataOutputStream;
    new-instance v15, Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v16

    invoke-direct/range {v15 .. v16}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v15, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v8, v15}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    .line 287
    new-instance v15, Ljava/lang/StringBuilder;

    const-string/jumbo v16, "Content-Disposition: form-data; name=\"uploadedfile\"; filename=\""

    invoke-direct/range {v15 .. v16}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 288
    move-object/from16 v0, p0

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string/jumbo v16, "\""

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    .line 287
    invoke-virtual {v8, v15}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    .line 289
    invoke-virtual {v8, v10}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    .line 291
    new-instance v11, Ljava/io/FileInputStream;

    move-object/from16 v0, p1

    invoke-direct {v11, v0}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    .line 293
    .local v11, "fStream":Ljava/io/FileInputStream;
    const/16 v5, 0x400

    .line 294
    .local v5, "bufferSize":I
    new-array v4, v5, [B

    .line 295
    .local v4, "buffer":[B
    const/4 v13, -0x1

    .line 297
    .local v13, "length":I
    :goto_0
    invoke-virtual {v11, v4}, Ljava/io/FileInputStream;->read([B)I

    move-result v13

    const/4 v15, -0x1

    if-ne v13, v15, :cond_0

    .line 302
    invoke-virtual {v11}, Ljava/io/FileInputStream;->close()V

    .line 304
    invoke-virtual {v8, v10}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    .line 305
    new-instance v15, Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v16

    invoke-direct/range {v15 .. v16}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v15, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v8, v15}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    .line 306
    invoke-virtual {v8}, Ljava/io/DataOutputStream;->flush()V

    .line 308
    invoke-virtual {v7}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v12

    .line 310
    .local v12, "is":Ljava/io/InputStream;
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    .line 311
    .local v2, "b":Ljava/lang/StringBuffer;
    :goto_1
    invoke-virtual {v12}, Ljava/io/InputStream;->read()I

    move-result v6

    .local v6, "ch":I
    const/4 v15, -0x1

    if-ne v6, v15, :cond_1

    .line 316
    invoke-virtual {v8}, Ljava/io/DataOutputStream;->close()V

    .line 317
    invoke-virtual {v12}, Ljava/io/InputStream;->close()V

    .line 318
    const/4 v15, 0x1

    .line 321
    .end local v2    # "b":Ljava/lang/StringBuffer;
    .end local v4    # "buffer":[B
    .end local v5    # "bufferSize":I
    .end local v6    # "ch":I
    .end local v7    # "con":Ljava/net/HttpURLConnection;
    .end local v8    # "ds":Ljava/io/DataOutputStream;
    .end local v11    # "fStream":Ljava/io/FileInputStream;
    .end local v12    # "is":Ljava/io/InputStream;
    .end local v13    # "length":I
    .end local v14    # "url":Ljava/net/URL;
    :goto_2
    return v15

    .line 300
    .restart local v4    # "buffer":[B
    .restart local v5    # "bufferSize":I
    .restart local v7    # "con":Ljava/net/HttpURLConnection;
    .restart local v8    # "ds":Ljava/io/DataOutputStream;
    .restart local v11    # "fStream":Ljava/io/FileInputStream;
    .restart local v13    # "length":I
    .restart local v14    # "url":Ljava/net/URL;
    :cond_0
    const/4 v15, 0x0

    invoke-virtual {v8, v4, v15, v13}, Ljava/io/DataOutputStream;->write([BII)V

    goto :goto_0

    .line 319
    .end local v4    # "buffer":[B
    .end local v5    # "bufferSize":I
    .end local v7    # "con":Ljava/net/HttpURLConnection;
    .end local v8    # "ds":Ljava/io/DataOutputStream;
    .end local v11    # "fStream":Ljava/io/FileInputStream;
    .end local v13    # "length":I
    .end local v14    # "url":Ljava/net/URL;
    :catch_0
    move-exception v9

    .line 321
    .local v9, "e":Ljava/lang/Exception;
    const/4 v15, 0x0

    goto :goto_2

    .line 312
    .end local v9    # "e":Ljava/lang/Exception;
    .restart local v2    # "b":Ljava/lang/StringBuffer;
    .restart local v4    # "buffer":[B
    .restart local v5    # "bufferSize":I
    .restart local v6    # "ch":I
    .restart local v7    # "con":Ljava/net/HttpURLConnection;
    .restart local v8    # "ds":Ljava/io/DataOutputStream;
    .restart local v11    # "fStream":Ljava/io/FileInputStream;
    .restart local v12    # "is":Ljava/io/InputStream;
    .restart local v13    # "length":I
    .restart local v14    # "url":Ljava/net/URL;
    :cond_1
    int-to-char v15, v6

    invoke-virtual {v2, v15}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1
.end method
