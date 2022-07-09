.class public Lcom/edutech/appmanage/HttpHelper;
.super Ljava/lang/Object;
.source "HttpHelper.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "HttpHelper"

.field public static install_num:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation
.end field


# instance fields
.field string:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 215
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/edutech/appmanage/HttpHelper;->install_num:Ljava/util/ArrayList;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static Get_http_addheader(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/apache/http/HttpResponse;
    .locals 9
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
    .line 341
    new-instance v4, Lorg/apache/http/client/methods/HttpGet;

    invoke-direct {v4, p0}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/lang/String;)V

    .line 347
    .local v4, "request":Lorg/apache/http/client/methods/HttpGet;
    const-string/jumbo v6, "X-Edutech-Entity"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v8, "+"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    .line 348
    invoke-virtual {v7, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 347
    invoke-virtual {v4, v6, v7}, Lorg/apache/http/client/methods/HttpGet;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 350
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    .line 351
    .local v2, "imestamp":J
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/edutech/mobilestudyclient/util/My_md5;->Md5(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 352
    .local v5, "sign":Ljava/lang/String;
    const-string/jumbo v6, "HttpHelper"

    new-instance v7, Ljava/lang/StringBuilder;

    const-string/jumbo v8, "timestamp="

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v8, "   sign="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 354
    const-string/jumbo v6, "X-Edutech-Sign"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v8, "+"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v6, v7}, Lorg/apache/http/client/methods/HttpGet;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 355
    const-string/jumbo v6, "Accept-Encoding"

    const-string/jumbo v7, "gzip,deflate"

    invoke-virtual {v4, v6, v7}, Lorg/apache/http/client/methods/HttpGet;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 357
    new-instance v0, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v0}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    .line 358
    .local v0, "httpClient":Lorg/apache/http/impl/client/DefaultHttpClient;
    invoke-virtual {v0, v4}, Lorg/apache/http/impl/client/DefaultHttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v1

    .line 359
    .local v1, "httpResponse":Lorg/apache/http/HttpResponse;
    return-object v1
.end method

.method public static download(II)V
    .locals 10
    .param p0, "position"    # I
    .param p1, "type"    # I

    .prologue
    const/4 v9, 0x1

    .line 220
    sget-object v7, Lcom/edutech/appmanage/MainActivity;->FOLDER_MAIN:Ljava/lang/String;

    invoke-static {v7}, Landroid/os/Environment;->getExternalStoragePublicDirectory(Ljava/lang/String;)Ljava/io/File;

    move-result-object v1

    .line 221
    .local v1, "folder":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v7

    if-eqz v7, :cond_0

    invoke-virtual {v1}, Ljava/io/File;->isDirectory()Z

    move-result v7

    if-nez v7, :cond_1

    .line 222
    :cond_0
    invoke-virtual {v1}, Ljava/io/File;->mkdirs()Z

    .line 228
    :cond_1
    const/4 v6, 0x0

    .line 229
    .local v6, "request":Landroid/app/DownloadManager$Request;
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    .line 230
    .local v5, "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    if-ne v9, p1, :cond_3

    .line 238
    new-instance v6, Landroid/app/DownloadManager$Request;

    .line 239
    .end local v6    # "request":Landroid/app/DownloadManager$Request;
    sget-object v7, Lcom/edutech/appmanage/MainActivity;->market_applist:Ljava/util/LinkedList;

    invoke-virtual {v7, p0}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/edutech/appmanage/MainActivity$AppInfo;

    iget-object v7, v7, Lcom/edutech/appmanage/MainActivity$AppInfo;->webpath:Ljava/lang/String;

    .line 240
    invoke-virtual {v7}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v7

    .line 239
    invoke-static {v7}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v7

    .line 238
    invoke-direct {v6, v7}, Landroid/app/DownloadManager$Request;-><init>(Landroid/net/Uri;)V

    .line 241
    .restart local v6    # "request":Landroid/app/DownloadManager$Request;
    sget-object v8, Lcom/edutech/appmanage/MainActivity;->FOLDER_MAIN:Ljava/lang/String;

    .line 242
    sget-object v7, Lcom/edutech/appmanage/MainActivity;->market_applist:Ljava/util/LinkedList;

    invoke-virtual {v7, p0}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/edutech/appmanage/MainActivity$AppInfo;

    iget-object v7, v7, Lcom/edutech/appmanage/MainActivity$AppInfo;->apkname:Ljava/lang/String;

    .line 241
    invoke-virtual {v6, v8, v7}, Landroid/app/DownloadManager$Request;->setDestinationInExternalPublicDir(Ljava/lang/String;Ljava/lang/String;)Landroid/app/DownloadManager$Request;

    .line 243
    const-string/jumbo v8, "apkname"

    .line 244
    sget-object v7, Lcom/edutech/appmanage/MainActivity;->market_applist:Ljava/util/LinkedList;

    invoke-virtual {v7, p0}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/edutech/appmanage/MainActivity$AppInfo;

    iget-object v7, v7, Lcom/edutech/appmanage/MainActivity$AppInfo;->apkname:Ljava/lang/String;

    .line 243
    invoke-virtual {v5, v8, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 245
    const-string/jumbo v8, "packagename"

    .line 246
    sget-object v7, Lcom/edutech/appmanage/MainActivity;->market_applist:Ljava/util/LinkedList;

    invoke-virtual {v7, p0}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/edutech/appmanage/MainActivity$AppInfo;

    iget-object v7, v7, Lcom/edutech/appmanage/MainActivity$AppInfo;->packagename:Ljava/lang/String;

    .line 245
    invoke-virtual {v5, v8, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 272
    :cond_2
    :goto_0
    invoke-virtual {v6, v9}, Landroid/app/DownloadManager$Request;->setNotificationVisibility(I)Landroid/app/DownloadManager$Request;

    .line 281
    sget-object v7, Lcom/edutech/appmanage/MainActivity;->downloadManager:Landroid/app/DownloadManager;

    invoke-virtual {v7, v6}, Landroid/app/DownloadManager;->enqueue(Landroid/app/DownloadManager$Request;)J

    move-result-wide v2

    .line 283
    .local v2, "downloadId":J
    sget-object v7, Lcom/edutech/appmanage/MainActivity;->downloadManagerPro:Lcom/edutech/appmanage/utils/DownloadManagerPro;

    .line 284
    invoke-virtual {v7, v2, v3}, Lcom/edutech/appmanage/utils/DownloadManagerPro;->getBytesAndStatus(J)[I

    move-result-object v0

    .line 290
    .local v0, "bytesAndStatus":[I
    const-string/jumbo v7, "downid"

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    invoke-virtual {v5, v7, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 291
    const-string/jumbo v7, "type"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v5, v7, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 292
    const-string/jumbo v7, "position"

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v5, v7, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 293
    const-string/jumbo v7, "setuped"

    const/4 v8, 0x0

    invoke-static {v8}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v8

    invoke-virtual {v5, v7, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 294
    sget-object v7, Lcom/edutech/appmanage/HttpHelper;->install_num:Ljava/util/ArrayList;

    invoke-virtual {v7, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 297
    return-void

    .line 253
    .end local v0    # "bytesAndStatus":[I
    .end local v2    # "downloadId":J
    :cond_3
    if-nez p1, :cond_2

    .line 254
    sget-object v7, Lcom/edutech/appmanage/MainActivity;->market_applist:Ljava/util/LinkedList;

    invoke-virtual {v7, p0}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/edutech/appmanage/MainActivity$AppInfo;

    iget-object v7, v7, Lcom/edutech/appmanage/MainActivity$AppInfo;->webpath:Ljava/lang/String;

    if-eqz v7, :cond_2

    .line 255
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_1
    sget-object v7, Lcom/edutech/appmanage/MainActivity;->market_applist:Ljava/util/LinkedList;

    invoke-virtual {v7}, Ljava/util/LinkedList;->size()I

    move-result v7

    if-lt v4, v7, :cond_4

    .line 258
    new-instance v6, Landroid/app/DownloadManager$Request;

    .line 259
    .end local v6    # "request":Landroid/app/DownloadManager$Request;
    sget-object v7, Lcom/edutech/appmanage/MainActivity;->market_applist:Ljava/util/LinkedList;

    invoke-virtual {v7, p0}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/edutech/appmanage/MainActivity$AppInfo;

    iget-object v7, v7, Lcom/edutech/appmanage/MainActivity$AppInfo;->webpath:Ljava/lang/String;

    .line 260
    invoke-virtual {v7}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v7

    .line 259
    invoke-static {v7}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v7

    .line 258
    invoke-direct {v6, v7}, Landroid/app/DownloadManager$Request;-><init>(Landroid/net/Uri;)V

    .line 262
    .restart local v6    # "request":Landroid/app/DownloadManager$Request;
    sget-object v8, Lcom/edutech/appmanage/MainActivity;->FOLDER_MAIN:Ljava/lang/String;

    .line 263
    sget-object v7, Lcom/edutech/appmanage/MainActivity;->market_applist:Ljava/util/LinkedList;

    invoke-virtual {v7, p0}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/edutech/appmanage/MainActivity$AppInfo;

    iget-object v7, v7, Lcom/edutech/appmanage/MainActivity$AppInfo;->apkname:Ljava/lang/String;

    .line 261
    invoke-virtual {v6, v8, v7}, Landroid/app/DownloadManager$Request;->setDestinationInExternalPublicDir(Ljava/lang/String;Ljava/lang/String;)Landroid/app/DownloadManager$Request;

    .line 264
    const-string/jumbo v8, "apkname"

    .line 265
    sget-object v7, Lcom/edutech/appmanage/MainActivity;->market_applist:Ljava/util/LinkedList;

    invoke-virtual {v7, p0}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/edutech/appmanage/MainActivity$AppInfo;

    iget-object v7, v7, Lcom/edutech/appmanage/MainActivity$AppInfo;->apkname:Ljava/lang/String;

    .line 264
    invoke-virtual {v5, v8, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 266
    const-string/jumbo v8, "packagename"

    .line 267
    sget-object v7, Lcom/edutech/appmanage/MainActivity;->market_applist:Ljava/util/LinkedList;

    invoke-virtual {v7, p0}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/edutech/appmanage/MainActivity$AppInfo;

    iget-object v7, v7, Lcom/edutech/appmanage/MainActivity$AppInfo;->packagename:Ljava/lang/String;

    .line 266
    invoke-virtual {v5, v8, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_0

    .line 255
    :cond_4
    add-int/lit8 v4, v4, 0x1

    goto :goto_1
.end method

.method private getContactJson(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .param p1, "url_str"    # Ljava/lang/String;
    .param p2, "user_Name"    # Ljava/lang/String;
    .param p3, "Random_number_10"    # Ljava/lang/String;
    .param p4, "The_client"    # Ljava/lang/String;

    .prologue
    .line 301
    if-eqz p1, :cond_0

    const-string/jumbo v4, ""

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 302
    :cond_0
    const-string/jumbo v4, "HttpHelper"

    const-string/jumbo v5, "getContactJson \u5165\u53c2\u6709\u95ee\u9898\u3002\u3002\u3002"

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 303
    const/4 v2, 0x0

    .line 322
    :cond_1
    :goto_0
    return-object v2

    .line 305
    :cond_2
    move-object v3, p1

    .line 308
    .local v3, "url":Ljava/lang/String;
    :try_start_0
    invoke-static {v3, p2, p3}, Lcom/edutech/appmanage/HttpHelper;->Get_http_addheader(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/apache/http/HttpResponse;

    move-result-object v1

    .line 312
    .local v1, "httpResponse":Lorg/apache/http/HttpResponse;
    const-string/jumbo v4, "HttpHelper"

    const-string/jumbo v5, "JSON \u6570\u636e\u83b7\u53d6\u51c6\u5907\u3002\u3002\u3002"

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 313
    invoke-static {v1}, Lcom/edutech/appmanage/HttpHelper;->getJsonStringFromGZIP(Lorg/apache/http/HttpResponse;)Ljava/lang/String;

    move-result-object v2

    .line 315
    .local v2, "resultString":Ljava/lang/String;
    if-eqz v2, :cond_3

    const-string/jumbo v4, ""

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v4

    if-eqz v4, :cond_1

    .line 318
    :cond_3
    const-string/jumbo v2, ""

    goto :goto_0

    .line 320
    .end local v1    # "httpResponse":Lorg/apache/http/HttpResponse;
    .end local v2    # "resultString":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 321
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 322
    const-string/jumbo v2, ""

    goto :goto_0
.end method

.method private static getJsonStringFromGZIP(Lorg/apache/http/HttpResponse;)Ljava/lang/String;
    .locals 14
    .param p0, "response"    # Lorg/apache/http/HttpResponse;

    .prologue
    .line 371
    const/4 v6, 0x0

    .line 374
    .local v6, "jsonString":Ljava/lang/String;
    :try_start_0
    invoke-interface {p0}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v11

    invoke-interface {v11}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v11

    const/16 v12, 0xc8

    if-ne v11, v12, :cond_2

    .line 376
    invoke-interface {p0}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v11

    invoke-interface {v11}, Lorg/apache/http/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object v5

    .line 377
    .local v5, "is":Ljava/io/InputStream;
    new-instance v0, Ljava/io/BufferedInputStream;

    invoke-direct {v0, v5}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .line 378
    .local v0, "bis":Ljava/io/BufferedInputStream;
    const/4 v11, 0x2

    invoke-virtual {v0, v11}, Ljava/io/BufferedInputStream;->mark(I)V

    .line 380
    const/4 v11, 0x2

    new-array v3, v11, [B

    .line 381
    .local v3, "header":[B
    invoke-virtual {v0, v3}, Ljava/io/BufferedInputStream;->read([B)I

    move-result v9

    .line 383
    .local v9, "result":I
    invoke-virtual {v0}, Ljava/io/BufferedInputStream;->reset()V

    .line 385
    invoke-static {v3}, Lcom/edutech/appmanage/HttpHelper;->getShort([B)I

    move-result v4

    .line 387
    .local v4, "headerData":I
    const/4 v11, -0x1

    if-eq v9, v11, :cond_0

    const/16 v11, 0x1f8b

    if-ne v4, v11, :cond_0

    .line 388
    const-string/jumbo v11, "HttpHelper"

    const-string/jumbo v12, " use GZIPInputStream  "

    invoke-static {v11, v12}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 389
    new-instance v5, Ljava/util/zip/GZIPInputStream;

    .end local v5    # "is":Ljava/io/InputStream;
    invoke-direct {v5, v0}, Ljava/util/zip/GZIPInputStream;-><init>(Ljava/io/InputStream;)V

    .line 394
    .restart local v5    # "is":Ljava/io/InputStream;
    :goto_0
    new-instance v8, Ljava/io/InputStreamReader;

    const-string/jumbo v11, "utf-8"

    invoke-direct {v8, v5, v11}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 395
    .local v8, "reader":Ljava/io/InputStreamReader;
    const/16 v11, 0x64

    new-array v1, v11, [C

    .line 397
    .local v1, "data":[C
    new-instance v10, Ljava/lang/StringBuffer;

    invoke-direct {v10}, Ljava/lang/StringBuffer;-><init>()V

    .line 398
    .local v10, "sb":Ljava/lang/StringBuffer;
    :goto_1
    invoke-virtual {v8, v1}, Ljava/io/InputStreamReader;->read([C)I

    move-result v7

    .local v7, "readSize":I
    if-gtz v7, :cond_1

    .line 401
    invoke-virtual {v10}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    .line 402
    invoke-virtual {v0}, Ljava/io/BufferedInputStream;->close()V

    .line 403
    invoke-virtual {v8}, Ljava/io/InputStreamReader;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 415
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
    const-string/jumbo v11, "HttpHelper"

    new-instance v12, Ljava/lang/StringBuilder;

    const-string/jumbo v13, "getJsonStringFromGZIP net output : "

    invoke-direct {v12, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v12, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 416
    return-object v6

    .line 391
    .restart local v0    # "bis":Ljava/io/BufferedInputStream;
    .restart local v3    # "header":[B
    .restart local v4    # "headerData":I
    .restart local v5    # "is":Ljava/io/InputStream;
    .restart local v9    # "result":I
    :cond_0
    :try_start_1
    const-string/jumbo v11, "HttpHelper"

    const-string/jumbo v12, " not use GZIPInputStream"

    invoke-static {v11, v12}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 392
    move-object v5, v0

    goto :goto_0

    .line 399
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

    .line 410
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

    .line 411
    .local v2, "e":Ljava/lang/Exception;
    const-string/jumbo v11, "HttpHelper"

    invoke-virtual {v2}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 412
    const-string/jumbo v6, ""

    goto :goto_2

    .line 405
    .end local v2    # "e":Ljava/lang/Exception;
    :cond_2
    :try_start_2
    const-string/jumbo v11, "HttpHelper"

    const-string/jumbo v12, "\u4e0e\u670d\u52a1\u7aef\u8fde\u63a5\u5931\u8d25\u3002\u3002\u3002"

    invoke-static {v11, v12}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 406
    const-string/jumbo v11, "HttpHelper"

    new-instance v12, Ljava/lang/StringBuilder;

    const-string/jumbo v13, "ddddd="

    invoke-direct {v12, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {p0}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v13

    invoke-interface {v13}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 407
    const-string/jumbo v11, "HttpHelper"

    new-instance v12, Ljava/lang/StringBuilder;

    const-string/jumbo v13, "ddddd="

    invoke-direct {v12, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {p0}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 408
    const-string/jumbo v6, ""
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_2
.end method

.method private static getShort([B)I
    .locals 2
    .param p0, "data"    # [B

    .prologue
    .line 420
    const/4 v0, 0x0

    aget-byte v0, p0, v0

    shl-int/lit8 v0, v0, 0x8

    const/4 v1, 0x1

    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    or-int/2addr v0, v1

    return v0
.end method

.method public static getin(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 8
    .param p0, "httpUrl"    # Ljava/lang/String;
    .param p1, "user_Name"    # Ljava/lang/String;
    .param p2, "Random_number_10"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    .line 103
    const-string/jumbo v5, "HttpHelper"

    new-instance v6, Ljava/lang/StringBuilder;

    const-string/jumbo v7, "httpUrl==>"

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 104
    move-object v3, p0

    .line 107
    .local v3, "url":Ljava/lang/String;
    :try_start_0
    invoke-static {v3, p1, p2}, Lcom/edutech/appmanage/HttpHelper;->Get_http_addheader(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/apache/http/HttpResponse;

    move-result-object v1

    .line 110
    .local v1, "httpResponse":Lorg/apache/http/HttpResponse;
    const-string/jumbo v5, "HttpHelper"

    const-string/jumbo v6, "JSON \u6570\u636e\u83b7\u53d6\u51c6\u5907\u3002\u3002\u3002"

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 111
    invoke-static {v1}, Lcom/edutech/appmanage/HttpHelper;->getJsonStringFromGZIP(Lorg/apache/http/HttpResponse;)Ljava/lang/String;

    move-result-object v2

    .line 113
    .local v2, "resultString":Ljava/lang/String;
    if-eqz v2, :cond_0

    const-string/jumbo v5, ""

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lorg/apache/http/client/ClientProtocolException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2

    move-result v4

    if-nez v4, :cond_0

    .line 131
    .end local v1    # "httpResponse":Lorg/apache/http/HttpResponse;
    .end local v2    # "resultString":Ljava/lang/String;
    :goto_0
    return-object v2

    .line 116
    .restart local v1    # "httpResponse":Lorg/apache/http/HttpResponse;
    .restart local v2    # "resultString":Ljava/lang/String;
    :cond_0
    const-string/jumbo v2, ""

    goto :goto_0

    .line 118
    .end local v1    # "httpResponse":Lorg/apache/http/HttpResponse;
    .end local v2    # "resultString":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 120
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    const-string/jumbo v5, "HttpHelper"

    new-instance v6, Ljava/lang/StringBuilder;

    const-string/jumbo v7, "109-"

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/UnsupportedEncodingException;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move-object v2, v4

    .line 121
    goto :goto_0

    .line 123
    .end local v0    # "e":Ljava/io/UnsupportedEncodingException;
    :catch_1
    move-exception v0

    .line 125
    .local v0, "e":Lorg/apache/http/client/ClientProtocolException;
    const-string/jumbo v5, "HttpHelper"

    new-instance v6, Ljava/lang/StringBuilder;

    const-string/jumbo v7, "114-"

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Lorg/apache/http/client/ClientProtocolException;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move-object v2, v4

    .line 126
    goto :goto_0

    .line 128
    .end local v0    # "e":Lorg/apache/http/client/ClientProtocolException;
    :catch_2
    move-exception v0

    .line 130
    .local v0, "e":Ljava/io/IOException;
    const-string/jumbo v5, "HttpHelper"

    new-instance v6, Ljava/lang/StringBuilder;

    const-string/jumbo v7, "119-"

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move-object v2, v4

    .line 131
    goto :goto_0
.end method

.method public static httpDownload(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)Ljava/lang/String;
    .locals 13
    .param p0, "httpUrl"    # Ljava/lang/String;
    .param p1, "saveFile"    # Ljava/lang/String;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 58
    const/4 v2, 0x0

    .line 59
    .local v2, "bytesum":I
    const/4 v1, 0x0

    .line 60
    .local v1, "byteread":I
    new-instance v7, Ljava/io/File;

    invoke-direct {v7, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 61
    .local v7, "file":Ljava/io/File;
    invoke-virtual {v7}, Ljava/io/File;->exists()Z

    move-result v11

    if-nez v11, :cond_0

    .line 63
    :try_start_0
    invoke-virtual {v7}, Ljava/io/File;->createNewFile()Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 70
    :cond_0
    const/4 v10, 0x0

    .line 72
    .local v10, "url":Ljava/net/URL;
    :try_start_1
    new-instance v10, Ljava/net/URL;

    .end local v10    # "url":Ljava/net/URL;
    invoke-direct {v10, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/net/MalformedURLException; {:try_start_1 .. :try_end_1} :catch_1

    .line 80
    .restart local v10    # "url":Ljava/net/URL;
    :try_start_2
    invoke-virtual {v10}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v3

    .line 81
    .local v3, "conn":Ljava/net/URLConnection;
    invoke-virtual {v3}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v9

    .line 82
    .local v9, "inStream":Ljava/io/InputStream;
    new-instance v8, Ljava/io/FileOutputStream;

    invoke-direct {v8, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    .line 84
    .local v8, "fs":Ljava/io/FileOutputStream;
    const/16 v11, 0x4b4

    new-array v0, v11, [B

    .line 85
    .local v0, "buffer":[B
    :goto_0
    invoke-virtual {v9, v0}, Ljava/io/InputStream;->read([B)I

    move-result v1

    const/4 v11, -0x1

    if-ne v1, v11, :cond_1

    .line 90
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    const v12, 0x7f0801b6

    invoke-virtual {v11, v12}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;
    :try_end_2
    .catch Ljava/io/FileNotFoundException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_3

    move-result-object v11

    .line 96
    .end local v0    # "buffer":[B
    .end local v3    # "conn":Ljava/net/URLConnection;
    .end local v8    # "fs":Ljava/io/FileOutputStream;
    .end local v9    # "inStream":Ljava/io/InputStream;
    .end local v10    # "url":Ljava/net/URL;
    :goto_1
    return-object v11

    .line 64
    :catch_0
    move-exception v6

    .line 67
    .local v6, "e2":Ljava/io/IOException;
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    const v12, 0x7f0801b4

    invoke-virtual {v11, v12}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v11

    goto :goto_1

    .line 73
    .end local v6    # "e2":Ljava/io/IOException;
    :catch_1
    move-exception v5

    .line 76
    .local v5, "e1":Ljava/net/MalformedURLException;
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    const v12, 0x7f0801b5

    invoke-virtual {v11, v12}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v11

    goto :goto_1

    .line 86
    .end local v5    # "e1":Ljava/net/MalformedURLException;
    .restart local v0    # "buffer":[B
    .restart local v3    # "conn":Ljava/net/URLConnection;
    .restart local v8    # "fs":Ljava/io/FileOutputStream;
    .restart local v9    # "inStream":Ljava/io/InputStream;
    .restart local v10    # "url":Ljava/net/URL;
    :cond_1
    add-int/2addr v2, v1

    .line 87
    :try_start_3
    sget-object v11, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v11, v2}, Ljava/io/PrintStream;->println(I)V

    .line 88
    const/4 v11, 0x0

    invoke-virtual {v8, v0, v11, v1}, Ljava/io/FileOutputStream;->write([BII)V
    :try_end_3
    .catch Ljava/io/FileNotFoundException; {:try_start_3 .. :try_end_3} :catch_2
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_3

    goto :goto_0

    .line 91
    .end local v0    # "buffer":[B
    .end local v3    # "conn":Ljava/net/URLConnection;
    .end local v8    # "fs":Ljava/io/FileOutputStream;
    .end local v9    # "inStream":Ljava/io/InputStream;
    :catch_2
    move-exception v4

    .line 93
    .local v4, "e":Ljava/io/FileNotFoundException;
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    const v12, 0x7f0801b7

    invoke-virtual {v11, v12}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v11

    goto :goto_1

    .line 94
    .end local v4    # "e":Ljava/io/FileNotFoundException;
    :catch_3
    move-exception v4

    .line 96
    .local v4, "e":Ljava/io/IOException;
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    const v12, 0x7f0801b8

    invoke-virtual {v11, v12}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v11

    goto :goto_1
.end method
