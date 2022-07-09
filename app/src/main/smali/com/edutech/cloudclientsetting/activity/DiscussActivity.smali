.class public Lcom/edutech/cloudclientsetting/activity/DiscussActivity;
.super Landroid/app/Activity;
.source "DiscussActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/edutech/cloudclientsetting/activity/DiscussActivity$DiscussAsync;,
        Lcom/edutech/cloudclientsetting/activity/DiscussActivity$DiscussDetailsAsync;,
        Lcom/edutech/cloudclientsetting/activity/DiscussActivity$DiscussReplyAsync;,
        Lcom/edutech/cloudclientsetting/activity/DiscussActivity$DiscussReplyAsync2;,
        Lcom/edutech/cloudclientsetting/activity/DiscussActivity$DiscussSubjectsAsync;
    }
.end annotation


# instance fields
.field private TAG:Ljava/lang/String;

.field private adapter:Landroid/widget/SimpleAdapter;

.field private contentList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field private discussList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/json/JSONObject;",
            ">;"
        }
    .end annotation
.end field

.field private ip:Ljava/lang/String;

.field private listView:Landroid/widget/ListView;

.field private messageId:Ljava/lang/String;

.field private privatekey:Ljava/lang/String;

.field private sqlite:Lcom/edutech/cloudclientsetting/activity/SqliteForDiscuss;

.field private username:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 50
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 52
    const-string/jumbo v0, "discuss"

    iput-object v0, p0, Lcom/edutech/cloudclientsetting/activity/DiscussActivity;->TAG:Ljava/lang/String;

    .line 53
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/edutech/cloudclientsetting/activity/DiscussActivity;->messageId:Ljava/lang/String;

    .line 58
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/edutech/cloudclientsetting/activity/DiscussActivity;->privatekey:Ljava/lang/String;

    .line 59
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/edutech/cloudclientsetting/activity/DiscussActivity;->ip:Ljava/lang/String;

    .line 60
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/edutech/cloudclientsetting/activity/DiscussActivity;->username:Ljava/lang/String;

    .line 50
    return-void
.end method

.method private HttpGet_Init(Ljava/lang/String;)Lorg/apache/http/client/methods/HttpGet;
    .locals 7
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 479
    new-instance v0, Lorg/apache/http/client/methods/HttpGet;

    invoke-direct {v0, p1}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/lang/String;)V

    .line 480
    .local v0, "get":Lorg/apache/http/client/methods/HttpGet;
    const-string/jumbo v4, "X-Edutech-Entity"

    iget-object v5, p0, Lcom/edutech/cloudclientsetting/activity/DiscussActivity;->username:Ljava/lang/String;

    invoke-virtual {v0, v4, v5}, Lorg/apache/http/client/methods/HttpGet;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 481
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    .line 482
    .local v2, "imestamp":J
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v5, p0, Lcom/edutech/cloudclientsetting/activity/DiscussActivity;->username:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/edutech/cloudclientsetting/activity/DiscussActivity;->privatekey:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/edutech/mobilestudyclient/util/My_md5;->Md5(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 483
    .local v1, "sign":Ljava/lang/String;
    const-string/jumbo v4, "X-Edutech-Sign"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v6, "+"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v4, v5}, Lorg/apache/http/client/methods/HttpGet;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 484
    return-object v0
.end method

.method private HttpPost_Init(Ljava/lang/String;)Lorg/apache/http/client/methods/HttpPost;
    .locals 7
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 489
    new-instance v2, Lorg/apache/http/client/methods/HttpPost;

    invoke-direct {v2, p1}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/lang/String;)V

    .line 490
    .local v2, "put":Lorg/apache/http/client/methods/HttpPost;
    const-string/jumbo v4, "X-Edutech-Entity"

    new-instance v5, Ljava/lang/StringBuilder;

    iget-object v6, p0, Lcom/edutech/cloudclientsetting/activity/DiscussActivity;->username:Ljava/lang/String;

    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v6, "+"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 491
    iget-object v6, p0, Lcom/edutech/cloudclientsetting/activity/DiscussActivity;->privatekey:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 490
    invoke-virtual {v2, v4, v5}, Lorg/apache/http/client/methods/HttpPost;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 492
    const-string/jumbo v4, "user"

    new-instance v5, Ljava/lang/StringBuilder;

    iget-object v6, p0, Lcom/edutech/cloudclientsetting/activity/DiscussActivity;->username:Ljava/lang/String;

    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v6, ","

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/edutech/cloudclientsetting/activity/DiscussActivity;->privatekey:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 493
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 494
    .local v0, "imestamp":J
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v5, p0, Lcom/edutech/cloudclientsetting/activity/DiscussActivity;->username:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/edutech/cloudclientsetting/activity/DiscussActivity;->privatekey:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/edutech/mobilestudyclient/util/My_md5;->Md5(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 495
    .local v3, "sign":Ljava/lang/String;
    const-string/jumbo v4, "X-Edutech-Sign"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v6, "+"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v4, v5}, Lorg/apache/http/client/methods/HttpPost;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 496
    return-object v2
.end method

.method static synthetic access$0(Lcom/edutech/cloudclientsetting/activity/DiscussActivity;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 59
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/DiscussActivity;->ip:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$1(Lcom/edutech/cloudclientsetting/activity/DiscussActivity;Ljava/lang/String;)Lorg/apache/http/client/methods/HttpGet;
    .locals 1

    .prologue
    .line 477
    invoke-direct {p0, p1}, Lcom/edutech/cloudclientsetting/activity/DiscussActivity;->HttpGet_Init(Ljava/lang/String;)Lorg/apache/http/client/methods/HttpGet;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$2(Lcom/edutech/cloudclientsetting/activity/DiscussActivity;Lorg/apache/http/HttpResponse;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 426
    invoke-direct {p0, p1}, Lcom/edutech/cloudclientsetting/activity/DiscussActivity;->getJsonStringFromGZIP(Lorg/apache/http/HttpResponse;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$3(Lcom/edutech/cloudclientsetting/activity/DiscussActivity;Lorg/json/JSONArray;)V
    .locals 0

    .prologue
    .line 225
    invoke-direct {p0, p1}, Lcom/edutech/cloudclientsetting/activity/DiscussActivity;->initDiscuss(Lorg/json/JSONArray;)V

    return-void
.end method

.method static synthetic access$4(Lcom/edutech/cloudclientsetting/activity/DiscussActivity;)Landroid/widget/SimpleAdapter;
    .locals 1

    .prologue
    .line 57
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/DiscussActivity;->adapter:Landroid/widget/SimpleAdapter;

    return-object v0
.end method

.method static synthetic access$5(Lcom/edutech/cloudclientsetting/activity/DiscussActivity;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 53
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/DiscussActivity;->messageId:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$6(Lcom/edutech/cloudclientsetting/activity/DiscussActivity;Ljava/lang/String;)Lorg/apache/http/client/methods/HttpPost;
    .locals 1

    .prologue
    .line 487
    invoke-direct {p0, p1}, Lcom/edutech/cloudclientsetting/activity/DiscussActivity;->HttpPost_Init(Ljava/lang/String;)Lorg/apache/http/client/methods/HttpPost;

    move-result-object v0

    return-object v0
.end method

.method private getJsonStringFromGZIP(Lorg/apache/http/HttpResponse;)Ljava/lang/String;
    .locals 14
    .param p1, "response"    # Lorg/apache/http/HttpResponse;

    .prologue
    .line 427
    const/4 v6, 0x0

    .line 430
    .local v6, "jsonString":Ljava/lang/String;
    :try_start_0
    invoke-interface {p1}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v11

    invoke-interface {v11}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v11

    const/16 v12, 0xc8

    if-ne v11, v12, :cond_2

    .line 432
    invoke-interface {p1}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v11

    invoke-interface {v11}, Lorg/apache/http/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object v5

    .line 433
    .local v5, "is":Ljava/io/InputStream;
    new-instance v0, Ljava/io/BufferedInputStream;

    invoke-direct {v0, v5}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .line 434
    .local v0, "bis":Ljava/io/BufferedInputStream;
    const/4 v11, 0x2

    invoke-virtual {v0, v11}, Ljava/io/BufferedInputStream;->mark(I)V

    .line 436
    const/4 v11, 0x2

    new-array v3, v11, [B

    .line 437
    .local v3, "header":[B
    invoke-virtual {v0, v3}, Ljava/io/BufferedInputStream;->read([B)I

    move-result v9

    .line 439
    .local v9, "result":I
    invoke-virtual {v0}, Ljava/io/BufferedInputStream;->reset()V

    .line 441
    invoke-direct {p0, v3}, Lcom/edutech/cloudclientsetting/activity/DiscussActivity;->getShort([B)I

    move-result v4

    .line 443
    .local v4, "headerData":I
    const/4 v11, -0x1

    if-eq v9, v11, :cond_0

    const/16 v11, 0x1f8b

    if-ne v4, v11, :cond_0

    .line 444
    iget-object v11, p0, Lcom/edutech/cloudclientsetting/activity/DiscussActivity;->TAG:Ljava/lang/String;

    const-string/jumbo v12, " use GZIPInputStream  "

    invoke-static {v11, v12}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 445
    new-instance v5, Ljava/util/zip/GZIPInputStream;

    .end local v5    # "is":Ljava/io/InputStream;
    invoke-direct {v5, v0}, Ljava/util/zip/GZIPInputStream;-><init>(Ljava/io/InputStream;)V

    .line 450
    .restart local v5    # "is":Ljava/io/InputStream;
    :goto_0
    new-instance v8, Ljava/io/InputStreamReader;

    const-string/jumbo v11, "utf-8"

    invoke-direct {v8, v5, v11}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 451
    .local v8, "reader":Ljava/io/InputStreamReader;
    const/16 v11, 0x64

    new-array v1, v11, [C

    .line 453
    .local v1, "data":[C
    new-instance v10, Ljava/lang/StringBuffer;

    invoke-direct {v10}, Ljava/lang/StringBuffer;-><init>()V

    .line 454
    .local v10, "sb":Ljava/lang/StringBuffer;
    :goto_1
    invoke-virtual {v8, v1}, Ljava/io/InputStreamReader;->read([C)I

    move-result v7

    .local v7, "readSize":I
    if-gtz v7, :cond_1

    .line 457
    invoke-virtual {v10}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    .line 458
    invoke-virtual {v0}, Ljava/io/BufferedInputStream;->close()V

    .line 459
    invoke-virtual {v8}, Ljava/io/InputStreamReader;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 471
    .end local v0    # "bis":Ljava/io/BufferedInputStream;
    .end local v1    # "data":[C
    .end local v3    # "header":[B
    .end local v4    # "headerData":I
    .end local v5    # "is":Ljava/io/InputStream;
    .end local v7    # "readSize":I
    .end local v8    # "reader":Ljava/io/InputStreamReader;
    .end local v9    # "result":I
    .end local v10    # "sb":Ljava/lang/StringBuffer;
    :goto_2
    iget-object v11, p0, Lcom/edutech/cloudclientsetting/activity/DiscussActivity;->TAG:Ljava/lang/String;

    new-instance v12, Ljava/lang/StringBuilder;

    const-string/jumbo v13, "getJsonStringFromGZIP net output : "

    invoke-direct {v12, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v12, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 472
    return-object v6

    .line 447
    .restart local v0    # "bis":Ljava/io/BufferedInputStream;
    .restart local v3    # "header":[B
    .restart local v4    # "headerData":I
    .restart local v5    # "is":Ljava/io/InputStream;
    .restart local v9    # "result":I
    :cond_0
    :try_start_1
    iget-object v11, p0, Lcom/edutech/cloudclientsetting/activity/DiscussActivity;->TAG:Ljava/lang/String;

    const-string/jumbo v12, " not use GZIPInputStream"

    invoke-static {v11, v12}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 448
    move-object v5, v0

    goto :goto_0

    .line 455
    .restart local v1    # "data":[C
    .restart local v7    # "readSize":I
    .restart local v8    # "reader":Ljava/io/InputStreamReader;
    .restart local v10    # "sb":Ljava/lang/StringBuffer;
    :cond_1
    const/4 v11, 0x0

    invoke-virtual {v10, v1, v11, v7}, Ljava/lang/StringBuffer;->append([CII)Ljava/lang/StringBuffer;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 466
    .end local v0    # "bis":Ljava/io/BufferedInputStream;
    .end local v1    # "data":[C
    .end local v3    # "header":[B
    .end local v4    # "headerData":I
    .end local v5    # "is":Ljava/io/InputStream;
    .end local v7    # "readSize":I
    .end local v8    # "reader":Ljava/io/InputStreamReader;
    .end local v9    # "result":I
    .end local v10    # "sb":Ljava/lang/StringBuffer;
    :catch_0
    move-exception v2

    .line 467
    .local v2, "e":Ljava/lang/Exception;
    iget-object v11, p0, Lcom/edutech/cloudclientsetting/activity/DiscussActivity;->TAG:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 468
    const-string/jumbo v6, ""

    goto :goto_2

    .line 461
    .end local v2    # "e":Ljava/lang/Exception;
    :cond_2
    :try_start_2
    iget-object v11, p0, Lcom/edutech/cloudclientsetting/activity/DiscussActivity;->TAG:Ljava/lang/String;

    const-string/jumbo v12, "\u4e0e\u670d\u52a1\u7aef\u8fde\u63a5\u5931\u8d25\u3002\u3002\u3002"

    invoke-static {v11, v12}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 462
    iget-object v11, p0, Lcom/edutech/cloudclientsetting/activity/DiscussActivity;->TAG:Ljava/lang/String;

    new-instance v12, Ljava/lang/StringBuilder;

    const-string/jumbo v13, "ddddd="

    invoke-direct {v12, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {p1}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v13

    invoke-interface {v13}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 463
    iget-object v11, p0, Lcom/edutech/cloudclientsetting/activity/DiscussActivity;->TAG:Ljava/lang/String;

    new-instance v12, Ljava/lang/StringBuilder;

    const-string/jumbo v13, "ddddd="

    invoke-direct {v12, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {p1}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 464
    const-string/jumbo v6, ""
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_2
.end method

.method private getShort([B)I
    .locals 2
    .param p1, "data"    # [B

    .prologue
    .line 475
    const/4 v0, 0x0

    aget-byte v0, p1, v0

    shl-int/lit8 v0, v0, 0x8

    const/4 v1, 0x1

    aget-byte v1, p1, v1

    and-int/lit16 v1, v1, 0xff

    or-int/2addr v0, v1

    return v0
.end method

.method private initDiscuss()V
    .locals 3

    .prologue
    .line 80
    const-string/jumbo v1, "privatekey"

    .line 81
    const/4 v2, 0x0

    .line 80
    invoke-virtual {p0, v1, v2}, Lcom/edutech/cloudclientsetting/activity/DiscussActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 82
    .local v0, "sharePre":Landroid/content/SharedPreferences;
    const-string/jumbo v1, "key"

    const-string/jumbo v2, ""

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/edutech/cloudclientsetting/activity/DiscussActivity;->privatekey:Ljava/lang/String;

    .line 83
    const-string/jumbo v1, "apihost"

    const-string/jumbo v2, ""

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/edutech/cloudclientsetting/activity/DiscussActivity;->ip:Ljava/lang/String;

    .line 84
    const-string/jumbo v1, "name"

    const-string/jumbo v2, ""

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/edutech/cloudclientsetting/activity/DiscussActivity;->username:Ljava/lang/String;

    .line 85
    new-instance v1, Lcom/edutech/cloudclientsetting/activity/SqliteForDiscuss;

    invoke-direct {v1, p0}, Lcom/edutech/cloudclientsetting/activity/SqliteForDiscuss;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/edutech/cloudclientsetting/activity/DiscussActivity;->sqlite:Lcom/edutech/cloudclientsetting/activity/SqliteForDiscuss;

    .line 86
    return-void
.end method

.method private initDiscuss(Lorg/json/JSONArray;)V
    .locals 19
    .param p1, "jarray"    # Lorg/json/JSONArray;

    .prologue
    .line 227
    if-eqz p1, :cond_0

    invoke-virtual/range {p1 .. p1}, Lorg/json/JSONArray;->length()I

    move-result v13

    if-gtz v13, :cond_1

    .line 275
    :cond_0
    :goto_0
    return-void

    .line 231
    :cond_1
    new-instance v13, Ljava/util/ArrayList;

    invoke-direct {v13}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v0, p0

    iput-object v13, v0, Lcom/edutech/cloudclientsetting/activity/DiscussActivity;->discussList:Ljava/util/List;

    .line 233
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    .line 234
    .local v11, "values":Ljava/util/List;, "Ljava/util/List<Landroid/content/ContentValues;>;"
    const/4 v9, 0x0

    .line 235
    .local v9, "value":Landroid/content/ContentValues;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_1
    invoke-virtual/range {p1 .. p1}, Lorg/json/JSONArray;->length()I

    move-result v13

    if-lt v4, v13, :cond_2

    .line 273
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/edutech/cloudclientsetting/activity/DiscussActivity;->sqlite:Lcom/edutech/cloudclientsetting/activity/SqliteForDiscuss;

    sget-object v14, Lcom/edutech/cloudclientsetting/activity/SqliteForDiscuss;->DISCUSS_TABLE:Ljava/lang/String;

    invoke-virtual {v13, v14, v11}, Lcom/edutech/cloudclientsetting/activity/SqliteForDiscuss;->insertDiscuss(Ljava/lang/String;Ljava/util/List;)J

    move-result-wide v6

    .line 274
    .local v6, "index":J
    const-string/jumbo v13, "index"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-static {v6, v7}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v15

    invoke-direct {v14, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 238
    .end local v6    # "index":J
    :cond_2
    :try_start_0
    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v5

    .line 239
    .local v5, "jobj":Lorg/json/JSONObject;
    if-eqz v5, :cond_3

    .line 241
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/edutech/cloudclientsetting/activity/DiscussActivity;->discussList:Ljava/util/List;

    invoke-interface {v13, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 242
    new-instance v10, Landroid/content/ContentValues;

    invoke-direct {v10}, Landroid/content/ContentValues;-><init>()V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 243
    .end local v9    # "value":Landroid/content/ContentValues;
    .local v10, "value":Landroid/content/ContentValues;
    :try_start_1
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/edutech/cloudclientsetting/activity/DiscussActivity;->TAG:Ljava/lang/String;

    invoke-virtual {v5}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 244
    const-string/jumbo v13, "content"

    invoke-virtual {v5, v13}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 245
    .local v12, "webContent":Ljava/lang/String;
    new-instance v8, Ljava/util/HashMap;

    invoke-direct {v8}, Ljava/util/HashMap;-><init>()V

    .line 246
    .local v8, "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string/jumbo v13, "content"

    invoke-virtual {v8, v13, v12}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 247
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/edutech/cloudclientsetting/activity/DiscussActivity;->contentList:Ljava/util/List;

    invoke-interface {v13, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 248
    const-string/jumbo v13, "messageid"

    invoke-virtual {v5, v13}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    move-object/from16 v0, p0

    iput-object v13, v0, Lcom/edutech/cloudclientsetting/activity/DiscussActivity;->messageId:Ljava/lang/String;

    .line 249
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/edutech/cloudclientsetting/activity/DiscussActivity;->sqlite:Lcom/edutech/cloudclientsetting/activity/SqliteForDiscuss;

    sget-object v14, Lcom/edutech/cloudclientsetting/activity/SqliteForDiscuss;->DISCUSS_TABLE:Ljava/lang/String;

    new-instance v15, Ljava/lang/StringBuilder;

    sget-object v16, Lcom/edutech/cloudclientsetting/activity/SqliteForDiscuss;->DISCUSS_MSGID:Ljava/lang/String;

    invoke-static/range {v16 .. v16}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v16

    invoke-direct/range {v15 .. v16}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v16, "=? "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    const/16 v16, 0x1

    move/from16 v0, v16

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v16, v0

    const/16 v17, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/cloudclientsetting/activity/DiscussActivity;->messageId:Ljava/lang/String;

    move-object/from16 v18, v0

    aput-object v18, v16, v17

    invoke-virtual/range {v13 .. v16}, Lcom/edutech/cloudclientsetting/activity/SqliteForDiscuss;->containColums(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v2

    .line 250
    .local v2, "boo":Z
    if-nez v2, :cond_4

    .line 252
    sget-object v13, Lcom/edutech/cloudclientsetting/activity/SqliteForDiscuss;->DISCUSS_AUTHOR:Ljava/lang/String;

    const-string/jumbo v14, "createby"

    invoke-virtual {v5, v14}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v10, v13, v14}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 253
    sget-object v13, Lcom/edutech/cloudclientsetting/activity/SqliteForDiscuss;->DISCUSS_CONTENT:Ljava/lang/String;

    const-string/jumbo v14, "content"

    invoke-virtual {v5, v14}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v10, v13, v14}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 254
    sget-object v13, Lcom/edutech/cloudclientsetting/activity/SqliteForDiscuss;->DISCUSS_CTIME:Ljava/lang/String;

    const-string/jumbo v14, "createtime"

    invoke-virtual {v5, v14}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v10, v13, v14}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 255
    sget-object v13, Lcom/edutech/cloudclientsetting/activity/SqliteForDiscuss;->DISCUSS_GOOD:Ljava/lang/String;

    const-string/jumbo v14, "good"

    invoke-virtual {v5, v14}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v14

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    invoke-virtual {v10, v13, v14}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 256
    sget-object v13, Lcom/edutech/cloudclientsetting/activity/SqliteForDiscuss;->DISCUSS_ISGOOD:Ljava/lang/String;

    const-string/jumbo v14, "isgood"

    invoke-virtual {v5, v14}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v10, v13, v14}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 257
    sget-object v13, Lcom/edutech/cloudclientsetting/activity/SqliteForDiscuss;->DISCUSS_MSGID:Ljava/lang/String;

    const-string/jumbo v14, "messageid"

    invoke-virtual {v5, v14}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v10, v13, v14}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 258
    sget-object v13, Lcom/edutech/cloudclientsetting/activity/SqliteForDiscuss;->DISCUSS_READ:Ljava/lang/String;

    const-string/jumbo v14, "isread"

    invoke-virtual {v5, v14}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v14

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    invoke-virtual {v10, v13, v14}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 259
    sget-object v13, Lcom/edutech/cloudclientsetting/activity/SqliteForDiscuss;->DISCUSS_REPLY:Ljava/lang/String;

    const-string/jumbo v14, "reply"

    invoke-virtual {v5, v14}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v14

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    invoke-virtual {v10, v13, v14}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 260
    sget-object v13, Lcom/edutech/cloudclientsetting/activity/SqliteForDiscuss;->DISCUSS_SUBJECT:Ljava/lang/String;

    const-string/jumbo v14, "subject"

    invoke-virtual {v5, v14}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v10, v13, v14}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 261
    sget-object v13, Lcom/edutech/cloudclientsetting/activity/SqliteForDiscuss;->DISCUSS_SUBJID:Ljava/lang/String;

    const-string/jumbo v14, "subjectid"

    invoke-virtual {v5, v14}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v10, v13, v14}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 262
    sget-object v13, Lcom/edutech/cloudclientsetting/activity/SqliteForDiscuss;->DISCUSS_SUBNAME:Ljava/lang/String;

    const-string/jumbo v14, "subjectname"

    invoke-virtual {v5, v14}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v10, v13, v14}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 263
    invoke-interface {v11, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 264
    const-string/jumbo v13, "add"

    new-instance v14, Ljava/lang/StringBuilder;

    const-string/jumbo v15, "add:"

    invoke-direct {v14, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/edutech/cloudclientsetting/activity/DiscussActivity;->messageId:Ljava/lang/String;

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    move-object v9, v10

    .line 235
    .end local v2    # "boo":Z
    .end local v5    # "jobj":Lorg/json/JSONObject;
    .end local v8    # "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v10    # "value":Landroid/content/ContentValues;
    .end local v12    # "webContent":Ljava/lang/String;
    .restart local v9    # "value":Landroid/content/ContentValues;
    :cond_3
    :goto_2
    add-int/lit8 v4, v4, 0x1

    goto/16 :goto_1

    .line 268
    :catch_0
    move-exception v3

    .line 270
    .local v3, "e":Lorg/json/JSONException;
    :goto_3
    invoke-virtual {v3}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_2

    .line 268
    .end local v3    # "e":Lorg/json/JSONException;
    .end local v9    # "value":Landroid/content/ContentValues;
    .restart local v5    # "jobj":Lorg/json/JSONObject;
    .restart local v10    # "value":Landroid/content/ContentValues;
    :catch_1
    move-exception v3

    move-object v9, v10

    .end local v10    # "value":Landroid/content/ContentValues;
    .restart local v9    # "value":Landroid/content/ContentValues;
    goto :goto_3

    .end local v9    # "value":Landroid/content/ContentValues;
    .restart local v2    # "boo":Z
    .restart local v8    # "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v10    # "value":Landroid/content/ContentValues;
    .restart local v12    # "webContent":Ljava/lang/String;
    :cond_4
    move-object v9, v10

    .end local v10    # "value":Landroid/content/ContentValues;
    .restart local v9    # "value":Landroid/content/ContentValues;
    goto :goto_2
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 9
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 65
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 66
    const v0, 0x7f030012

    invoke-virtual {p0, v0}, Lcom/edutech/cloudclientsetting/activity/DiscussActivity;->setContentView(I)V

    .line 67
    invoke-direct {p0}, Lcom/edutech/cloudclientsetting/activity/DiscussActivity;->initDiscuss()V

    .line 68
    new-instance v0, Lcom/edutech/cloudclientsetting/activity/DiscussActivity$DiscussSubjectsAsync;

    invoke-direct {v0, p0}, Lcom/edutech/cloudclientsetting/activity/DiscussActivity$DiscussSubjectsAsync;-><init>(Lcom/edutech/cloudclientsetting/activity/DiscussActivity;)V

    new-array v1, v8, [Ljava/lang/String;

    const-string/jumbo v2, ""

    aput-object v2, v1, v7

    invoke-virtual {v0, v1}, Lcom/edutech/cloudclientsetting/activity/DiscussActivity$DiscussSubjectsAsync;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 69
    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    .line 70
    .local v6, "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/edutech/cloudclientsetting/activity/DiscussActivity;->contentList:Ljava/util/List;

    .line 71
    const v0, 0x7f0a003c

    invoke-virtual {p0, v0}, Lcom/edutech/cloudclientsetting/activity/DiscussActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ListView;

    iput-object v0, p0, Lcom/edutech/cloudclientsetting/activity/DiscussActivity;->listView:Landroid/widget/ListView;

    .line 72
    new-instance v0, Landroid/widget/SimpleAdapter;

    iget-object v2, p0, Lcom/edutech/cloudclientsetting/activity/DiscussActivity;->contentList:Ljava/util/List;

    const v3, 0x7f030013

    new-array v4, v8, [Ljava/lang/String;

    const-string/jumbo v1, "content"

    aput-object v1, v4, v7

    new-array v5, v8, [I

    const v1, 0x7f0a003d

    aput v1, v5, v7

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Landroid/widget/SimpleAdapter;-><init>(Landroid/content/Context;Ljava/util/List;I[Ljava/lang/String;[I)V

    iput-object v0, p0, Lcom/edutech/cloudclientsetting/activity/DiscussActivity;->adapter:Landroid/widget/SimpleAdapter;

    .line 73
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/DiscussActivity;->listView:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/DiscussActivity;->adapter:Landroid/widget/SimpleAdapter;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 74
    new-instance v0, Lcom/edutech/cloudclientsetting/activity/DiscussActivity$DiscussAsync;

    invoke-direct {v0, p0, v6}, Lcom/edutech/cloudclientsetting/activity/DiscussActivity$DiscussAsync;-><init>(Lcom/edutech/cloudclientsetting/activity/DiscussActivity;Ljava/util/HashMap;)V

    new-array v1, v8, [Ljava/lang/String;

    const-string/jumbo v2, ""

    aput-object v2, v1, v7

    invoke-virtual {v0, v1}, Lcom/edutech/cloudclientsetting/activity/DiscussActivity$DiscussAsync;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 76
    return-void
.end method

.method protected onDestroy()V
    .locals 2

    .prologue
    .line 512
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 513
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/DiscussActivity;->sqlite:Lcom/edutech/cloudclientsetting/activity/SqliteForDiscuss;

    if-eqz v0, :cond_0

    .line 515
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/DiscussActivity;->sqlite:Lcom/edutech/cloudclientsetting/activity/SqliteForDiscuss;

    invoke-virtual {v0}, Lcom/edutech/cloudclientsetting/activity/SqliteForDiscuss;->close()V

    .line 516
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/edutech/cloudclientsetting/activity/DiscussActivity;->sqlite:Lcom/edutech/cloudclientsetting/activity/SqliteForDiscuss;

    .line 517
    const-string/jumbo v0, "sqlite"

    const-string/jumbo v1, "sqlite closed"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 519
    :cond_0
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 1
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 502
    const/4 v0, 0x4

    if-ne p1, v0, :cond_0

    .line 504
    invoke-virtual {p0}, Lcom/edutech/cloudclientsetting/activity/DiscussActivity;->finish()V

    .line 506
    :cond_0
    invoke-super {p0, p1, p2}, Landroid/app/Activity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    return v0
.end method
