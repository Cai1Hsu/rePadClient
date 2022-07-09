.class public Lcom/edutech/appmanage/MainActivity;
.super Landroid/app/Activity;
.source "MainActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/edutech/appmanage/MainActivity$AppInfo;,
        Lcom/edutech/appmanage/MainActivity$CompleteReceiver;,
        Lcom/edutech/appmanage/MainActivity$GetBroadcast;,
        Lcom/edutech/appmanage/MainActivity$MyAdapter;
    }
.end annotation


# static fields
.field public static final FOLDER_MAIN:Ljava/lang/String;

.field private static final TAG:Ljava/lang/String; = "AppmanageMainActivity"

.field public static final URLFILEPATH:Ljava/lang/String;

.field private static apk_install:I

.field private static apk_uninstall:I

.field private static count:I

.field public static delete_apkfile:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static downloadManager:Landroid/app/DownloadManager;

.field public static downloadManagerPro:Lcom/edutech/appmanage/utils/DownloadManagerPro;

.field public static market_applist:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<",
            "Lcom/edutech/appmanage/MainActivity$AppInfo;",
            ">;"
        }
    .end annotation
.end field

.field public static market_applist_local:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<",
            "Lcom/edutech/appmanage/MainActivity$AppInfo;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private adapter:Lcom/edutech/appmanage/MainActivity$MyAdapter;

.field changed_progress:Landroid/app/ProgressDialog;

.field private completeReceiver:Lcom/edutech/appmanage/MainActivity$CompleteReceiver;

.field completereceiver:Lcom/edutech/appmanage/MainActivity$CompleteReceiver;

.field private data_load:Z

.field public firststart:Z

.field getMarkertHandler:Landroid/os/Handler;

.field getbroadcast:Lcom/edutech/appmanage/MainActivity$GetBroadcast;

.field private gv:Landroid/widget/GridView;

.field handler:Landroid/os/Handler;

.field handler_toast:Landroid/os/Handler;

.field private hashmap:Ljava/util/HashMap;
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

.field private height:I

.field idauth:Lcom/edutech/idauthentication/MainActivity;

.field private img_appwarning:Landroid/widget/ImageView;

.field private ip:Ljava/lang/String;

.field private isrun:Z

.field private layout_appwarning:Landroid/widget/RelativeLayout;

.field login_res:I

.field private mHandlerApk:Landroid/os/Handler;

.field private mTimer:Ljava/util/Timer;

.field private mTimerTask:Ljava/util/TimerTask;

.field net_thread:Ljava/lang/Runnable;

.field private password:Ljava/lang/String;

.field private pic_height:I

.field private pic_load:Z

.field private pic_width:I

.field private privatekey:Ljava/lang/String;

.field progress_handler:Landroid/os/Handler;

.field private pwd:Ljava/lang/String;

.field runnableUi:Ljava/lang/Runnable;

.field runnable_GetConfig_Infor:Ljava/lang/Runnable;

.field silent_uninstall:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private toast_unlink:Z

.field unlink_handler:Landroid/os/Handler;

.field private usercode:Ljava/lang/String;

.field private username:Ljava/lang/String;

.field wrong_handler:Landroid/os/Handler;

.field wrong_net:Landroid/widget/TextView;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 119
    new-instance v0, Ljava/lang/StringBuilder;

    .line 120
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 121
    const-string/jumbo v1, "/MobileStudyClient/.System/setting.xml"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 119
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/edutech/appmanage/MainActivity;->URLFILEPATH:Ljava/lang/String;

    .line 132
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/edutech/appmanage/MainActivity;->delete_apkfile:Ljava/util/ArrayList;

    .line 142
    sput v2, Lcom/edutech/appmanage/MainActivity;->count:I

    .line 146
    sput v2, Lcom/edutech/appmanage/MainActivity;->apk_install:I

    .line 147
    const/4 v0, 0x1

    sput v0, Lcom/edutech/appmanage/MainActivity;->apk_uninstall:I

    .line 2130
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "MobileStudyClient"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 2131
    sget-char v1, Ljava/io/File;->separatorChar:C

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ".System"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-char v1, Ljava/io/File;->separatorChar:C

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 2132
    const-string/jumbo v1, "AppManager"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-char v1, Ljava/io/File;->separatorChar:C

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 2130
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/edutech/appmanage/MainActivity;->FOLDER_MAIN:Ljava/lang/String;

    .line 2132
    return-void
.end method

.method public constructor <init>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 89
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 100
    iput v1, p0, Lcom/edutech/appmanage/MainActivity;->height:I

    .line 101
    iput v1, p0, Lcom/edutech/appmanage/MainActivity;->pic_width:I

    .line 102
    iput v1, p0, Lcom/edutech/appmanage/MainActivity;->pic_height:I

    .line 113
    iput-boolean v3, p0, Lcom/edutech/appmanage/MainActivity;->firststart:Z

    .line 116
    new-instance v0, Lcom/edutech/idauthentication/MainActivity;

    .line 117
    invoke-direct {v0, p0}, Lcom/edutech/idauthentication/MainActivity;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/edutech/appmanage/MainActivity;->idauth:Lcom/edutech/idauthentication/MainActivity;

    .line 118
    iput-object v2, p0, Lcom/edutech/appmanage/MainActivity;->hashmap:Ljava/util/HashMap;

    .line 122
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/edutech/appmanage/MainActivity;->ip:Ljava/lang/String;

    .line 123
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/edutech/appmanage/MainActivity;->usercode:Ljava/lang/String;

    .line 124
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/edutech/appmanage/MainActivity;->password:Ljava/lang/String;

    .line 125
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/edutech/appmanage/MainActivity;->pwd:Ljava/lang/String;

    .line 126
    const-string/jumbo v0, "c"

    iput-object v0, p0, Lcom/edutech/appmanage/MainActivity;->privatekey:Ljava/lang/String;

    .line 127
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/edutech/appmanage/MainActivity;->username:Ljava/lang/String;

    .line 130
    iput-boolean v1, p0, Lcom/edutech/appmanage/MainActivity;->data_load:Z

    .line 131
    iput-boolean v1, p0, Lcom/edutech/appmanage/MainActivity;->pic_load:Z

    .line 135
    iput-boolean v3, p0, Lcom/edutech/appmanage/MainActivity;->isrun:Z

    .line 140
    iput-object v2, p0, Lcom/edutech/appmanage/MainActivity;->mTimer:Ljava/util/Timer;

    .line 141
    iput-object v2, p0, Lcom/edutech/appmanage/MainActivity;->mTimerTask:Ljava/util/TimerTask;

    .line 143
    iput-boolean v1, p0, Lcom/edutech/appmanage/MainActivity;->toast_unlink:Z

    .line 325
    new-instance v0, Lcom/edutech/appmanage/MainActivity$1;

    invoke-direct {v0, p0}, Lcom/edutech/appmanage/MainActivity$1;-><init>(Lcom/edutech/appmanage/MainActivity;)V

    iput-object v0, p0, Lcom/edutech/appmanage/MainActivity;->net_thread:Ljava/lang/Runnable;

    .line 453
    new-instance v0, Lcom/edutech/appmanage/MainActivity$2;

    invoke-direct {v0, p0}, Lcom/edutech/appmanage/MainActivity$2;-><init>(Lcom/edutech/appmanage/MainActivity;)V

    iput-object v0, p0, Lcom/edutech/appmanage/MainActivity;->unlink_handler:Landroid/os/Handler;

    .line 493
    new-instance v0, Lcom/edutech/appmanage/MainActivity$3;

    invoke-direct {v0, p0}, Lcom/edutech/appmanage/MainActivity$3;-><init>(Lcom/edutech/appmanage/MainActivity;)V

    iput-object v0, p0, Lcom/edutech/appmanage/MainActivity;->handler_toast:Landroid/os/Handler;

    .line 1326
    new-instance v0, Lcom/edutech/appmanage/MainActivity$4;

    invoke-direct {v0, p0}, Lcom/edutech/appmanage/MainActivity$4;-><init>(Lcom/edutech/appmanage/MainActivity;)V

    iput-object v0, p0, Lcom/edutech/appmanage/MainActivity;->wrong_handler:Landroid/os/Handler;

    .line 2018
    new-instance v0, Lcom/edutech/appmanage/MainActivity$5;

    invoke-direct {v0, p0}, Lcom/edutech/appmanage/MainActivity$5;-><init>(Lcom/edutech/appmanage/MainActivity;)V

    iput-object v0, p0, Lcom/edutech/appmanage/MainActivity;->progress_handler:Landroid/os/Handler;

    .line 2314
    new-instance v0, Lcom/edutech/appmanage/MainActivity$6;

    invoke-direct {v0, p0}, Lcom/edutech/appmanage/MainActivity$6;-><init>(Lcom/edutech/appmanage/MainActivity;)V

    iput-object v0, p0, Lcom/edutech/appmanage/MainActivity;->runnableUi:Ljava/lang/Runnable;

    .line 3171
    new-instance v0, Lcom/edutech/appmanage/MainActivity$7;

    invoke-direct {v0, p0}, Lcom/edutech/appmanage/MainActivity$7;-><init>(Lcom/edutech/appmanage/MainActivity;)V

    iput-object v0, p0, Lcom/edutech/appmanage/MainActivity;->mHandlerApk:Landroid/os/Handler;

    .line 3230
    new-instance v0, Lcom/edutech/appmanage/MainActivity$8;

    invoke-direct {v0, p0}, Lcom/edutech/appmanage/MainActivity$8;-><init>(Lcom/edutech/appmanage/MainActivity;)V

    iput-object v0, p0, Lcom/edutech/appmanage/MainActivity;->runnable_GetConfig_Infor:Ljava/lang/Runnable;

    .line 3250
    new-instance v0, Lcom/edutech/appmanage/MainActivity$9;

    invoke-direct {v0, p0}, Lcom/edutech/appmanage/MainActivity$9;-><init>(Lcom/edutech/appmanage/MainActivity;)V

    iput-object v0, p0, Lcom/edutech/appmanage/MainActivity;->getMarkertHandler:Landroid/os/Handler;

    .line 89
    return-void
.end method

.method private Get_Config_Json(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 10
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "username"    # Ljava/lang/String;

    .prologue
    const/4 v6, 0x0

    .line 3282
    if-eqz p1, :cond_0

    const-string/jumbo v7, ""

    invoke-virtual {p1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_0

    if-eqz p2, :cond_0

    .line 3283
    const-string/jumbo v7, ""

    invoke-virtual {p2, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 3284
    :cond_0
    const-string/jumbo v7, "AppmanageMainActivity"

    const-string/jumbo v8, "Get_Config_Json \u5165\u53c2\u6709\u95ee\u9898\u3002\u3002\u3002"

    invoke-static {v7, v8}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move-object v4, v6

    .line 3324
    :goto_0
    return-object v4

    .line 3288
    :cond_1
    :try_start_0
    invoke-direct {p0, p1, p2}, Lcom/edutech/appmanage/MainActivity;->Get_http_addheader(Ljava/lang/String;Ljava/lang/String;)Lorg/apache/http/HttpResponse;

    move-result-object v3

    .line 3290
    .local v3, "httpResponse":Lorg/apache/http/HttpResponse;
    const-string/jumbo v7, "AppmanageMainActivity"

    const-string/jumbo v8, "\u89e3\u6790\u8fd4\u56de\u7684\u5185\u5bb9..."

    invoke-static {v7, v8}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 3291
    if-nez v3, :cond_2

    move-object v4, v6

    .line 3292
    goto :goto_0

    .line 3294
    :cond_2
    invoke-interface {v3}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v7

    invoke-interface {v7}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v7

    const/16 v8, 0xc8

    if-ne v7, v8, :cond_4

    .line 3296
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 3297
    .local v1, "builder":Ljava/lang/StringBuilder;
    new-instance v0, Ljava/io/BufferedReader;

    .line 3298
    new-instance v7, Ljava/io/InputStreamReader;

    invoke-interface {v3}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v8

    .line 3299
    invoke-interface {v8}, Lorg/apache/http/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object v8

    const-string/jumbo v9, "UTF-8"

    .line 3298
    invoke-direct {v7, v8, v9}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 3297
    invoke-direct {v0, v7}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 3300
    .local v0, "bufferedReader2":Ljava/io/BufferedReader;
    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v5

    .local v5, "s":Ljava/lang/String;
    :goto_1
    if-nez v5, :cond_3

    .line 3304
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 3306
    .local v4, "resultString":Ljava/lang/String;
    sget-object v7, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v7, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 3307
    const-string/jumbo v7, "AppmanageMainActivity"

    const-string/jumbo v8, "\u5b66\u6821\u548c\u7528\u6237\u4e2a\u4eba\u4fe1\u606f\u83b7\u53d6\u5b8c\u6210\u3002\u3002\u3002"

    invoke-static {v7, v8}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Lorg/apache/http/client/ClientProtocolException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_0

    .line 3317
    .end local v0    # "bufferedReader2":Ljava/io/BufferedReader;
    .end local v1    # "builder":Ljava/lang/StringBuilder;
    .end local v3    # "httpResponse":Lorg/apache/http/HttpResponse;
    .end local v4    # "resultString":Ljava/lang/String;
    .end local v5    # "s":Ljava/lang/String;
    :catch_0
    move-exception v2

    .line 3319
    .local v2, "e":Lorg/apache/http/client/ClientProtocolException;
    invoke-virtual {v2}, Lorg/apache/http/client/ClientProtocolException;->printStackTrace()V

    .end local v2    # "e":Lorg/apache/http/client/ClientProtocolException;
    :goto_2
    move-object v4, v6

    .line 3324
    goto :goto_0

    .line 3302
    .restart local v0    # "bufferedReader2":Ljava/io/BufferedReader;
    .restart local v1    # "builder":Ljava/lang/StringBuilder;
    .restart local v3    # "httpResponse":Lorg/apache/http/HttpResponse;
    .restart local v5    # "s":Ljava/lang/String;
    :cond_3
    :try_start_1
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3301
    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v5

    .line 3300
    goto :goto_1

    .line 3310
    .end local v0    # "bufferedReader2":Ljava/io/BufferedReader;
    .end local v1    # "builder":Ljava/lang/StringBuilder;
    .end local v5    # "s":Ljava/lang/String;
    :cond_4
    const-string/jumbo v7, "AppmanageMainActivity"

    const-string/jumbo v8, "\u4e0e\u670d\u52a1\u7aef\u8fde\u63a5\u5931\u8d25\u3002\u3002\u3002"

    invoke-static {v7, v8}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 3311
    const-string/jumbo v7, "AppmanageMainActivity"

    new-instance v8, Ljava/lang/StringBuilder;

    const-string/jumbo v9, "\u8fde\u63a5\u72b6\u6001\u7801Status="

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 3312
    invoke-interface {v3}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v9

    invoke-interface {v9}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 3311
    invoke-static {v7, v8}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 3314
    const-string/jumbo v7, "AppmanageMainActivity"

    new-instance v8, Ljava/lang/StringBuilder;

    const-string/jumbo v9, "ddddd="

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {v3}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Lorg/apache/http/client/ClientProtocolException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    move-object v4, v6

    .line 3315
    goto/16 :goto_0

    .line 3320
    .end local v3    # "httpResponse":Lorg/apache/http/HttpResponse;
    :catch_1
    move-exception v2

    .line 3322
    .local v2, "e":Ljava/io/IOException;
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_2
.end method

.method private Get_http_addheader(Ljava/lang/String;Ljava/lang/String;)Lorg/apache/http/HttpResponse;
    .locals 9
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "user_Name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/apache/http/client/ClientProtocolException;
        }
    .end annotation

    .prologue
    .line 3338
    new-instance v4, Lorg/apache/http/client/methods/HttpGet;

    invoke-direct {v4, p1}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/lang/String;)V

    .line 3339
    .local v4, "request":Lorg/apache/http/client/methods/HttpGet;
    const-string/jumbo v6, "X-Edutech-Entity"

    invoke-virtual {v4, v6, p2}, Lorg/apache/http/client/methods/HttpGet;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 3341
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    .line 3342
    .local v2, "imestamp":J
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/edutech/mobilestudyclient/util/My_md5;->Md5(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 3343
    .local v5, "sign":Ljava/lang/String;
    const-string/jumbo v6, "AppmanageMainActivity"

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

    .line 3345
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

    .line 3347
    new-instance v0, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v0}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    .line 3348
    .local v0, "httpClient":Lorg/apache/http/impl/client/DefaultHttpClient;
    invoke-virtual {v0, v4}, Lorg/apache/http/impl/client/DefaultHttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v1

    .line 3349
    .local v1, "httpResponse":Lorg/apache/http/HttpResponse;
    return-object v1
.end method

.method public static LOGINURL(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "ip"    # Ljava/lang/String;
    .param p1, "usercode"    # Ljava/lang/String;
    .param p2, "pwd"    # Ljava/lang/String;

    .prologue
    .line 2538
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "http://"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "/default/index/pad-login/code/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 2539
    const-string/jumbo v1, "/pwd/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 2538
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$0(Lcom/edutech/appmanage/MainActivity;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 122
    iget-object v0, p0, Lcom/edutech/appmanage/MainActivity;->ip:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$1(Lcom/edutech/appmanage/MainActivity;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 123
    iget-object v0, p0, Lcom/edutech/appmanage/MainActivity;->usercode:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$10(Lcom/edutech/appmanage/MainActivity;)V
    .locals 0

    .prologue
    .line 2079
    invoke-direct {p0}, Lcom/edutech/appmanage/MainActivity;->startTimer()V

    return-void
.end method

.method static synthetic access$11(Lcom/edutech/appmanage/MainActivity;)V
    .locals 0

    .prologue
    .line 2103
    invoke-direct {p0}, Lcom/edutech/appmanage/MainActivity;->stopTimer()V

    return-void
.end method

.method static synthetic access$12(Lcom/edutech/appmanage/MainActivity;)Lcom/edutech/appmanage/MainActivity$MyAdapter;
    .locals 1

    .prologue
    .line 92
    iget-object v0, p0, Lcom/edutech/appmanage/MainActivity;->adapter:Lcom/edutech/appmanage/MainActivity$MyAdapter;

    return-object v0
.end method

.method static synthetic access$13()I
    .locals 1

    .prologue
    .line 146
    sget v0, Lcom/edutech/appmanage/MainActivity;->apk_install:I

    return v0
.end method

.method static synthetic access$14()I
    .locals 1

    .prologue
    .line 147
    sget v0, Lcom/edutech/appmanage/MainActivity;->apk_uninstall:I

    return v0
.end method

.method static synthetic access$15(Lcom/edutech/appmanage/MainActivity;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 127
    iget-object v0, p0, Lcom/edutech/appmanage/MainActivity;->username:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$16(Lcom/edutech/appmanage/MainActivity;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 3281
    invoke-direct {p0, p1, p2}, Lcom/edutech/appmanage/MainActivity;->Get_Config_Json(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$17(Lcom/edutech/appmanage/MainActivity;Ljava/lang/String;)Z
    .locals 1

    .prologue
    .line 3357
    invoke-direct {p0, p1}, Lcom/edutech/appmanage/MainActivity;->jsonToConfig(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$18(Lcom/edutech/appmanage/MainActivity;)I
    .locals 1

    .prologue
    .line 100
    iget v0, p0, Lcom/edutech/appmanage/MainActivity;->height:I

    return v0
.end method

.method static synthetic access$19(Lcom/edutech/appmanage/MainActivity;)I
    .locals 1

    .prologue
    .line 102
    iget v0, p0, Lcom/edutech/appmanage/MainActivity;->pic_height:I

    return v0
.end method

.method static synthetic access$2(Lcom/edutech/appmanage/MainActivity;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 125
    iget-object v0, p0, Lcom/edutech/appmanage/MainActivity;->pwd:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$20(Lcom/edutech/appmanage/MainActivity;)I
    .locals 1

    .prologue
    .line 101
    iget v0, p0, Lcom/edutech/appmanage/MainActivity;->pic_width:I

    return v0
.end method

.method static synthetic access$21(Lcom/edutech/appmanage/MainActivity;)Landroid/os/Handler;
    .locals 1

    .prologue
    .line 3171
    iget-object v0, p0, Lcom/edutech/appmanage/MainActivity;->mHandlerApk:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$22(Lcom/edutech/appmanage/MainActivity;)Z
    .locals 1

    .prologue
    .line 130
    iget-boolean v0, p0, Lcom/edutech/appmanage/MainActivity;->data_load:Z

    return v0
.end method

.method static synthetic access$23(Lcom/edutech/appmanage/MainActivity;)Z
    .locals 1

    .prologue
    .line 131
    iget-boolean v0, p0, Lcom/edutech/appmanage/MainActivity;->pic_load:Z

    return v0
.end method

.method static synthetic access$24(Lcom/edutech/appmanage/MainActivity;Z)V
    .locals 0

    .prologue
    .line 143
    iput-boolean p1, p0, Lcom/edutech/appmanage/MainActivity;->toast_unlink:Z

    return-void
.end method

.method static synthetic access$25(Lcom/edutech/appmanage/MainActivity;)V
    .locals 0

    .prologue
    .line 1294
    invoke-direct {p0}, Lcom/edutech/appmanage/MainActivity;->getMarketInfor()V

    return-void
.end method

.method static synthetic access$26()I
    .locals 1

    .prologue
    .line 142
    sget v0, Lcom/edutech/appmanage/MainActivity;->count:I

    return v0
.end method

.method static synthetic access$27(I)V
    .locals 0

    .prologue
    .line 142
    sput p0, Lcom/edutech/appmanage/MainActivity;->count:I

    return-void
.end method

.method static synthetic access$3(Lcom/edutech/appmanage/MainActivity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
    .locals 1

    .prologue
    .line 2495
    invoke-direct {p0, p1, p2, p3}, Lcom/edutech/appmanage/MainActivity;->userLogin(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method static synthetic access$4(Lcom/edutech/appmanage/MainActivity;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 126
    iget-object v0, p0, Lcom/edutech/appmanage/MainActivity;->privatekey:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$5(Lcom/edutech/appmanage/MainActivity;)Landroid/widget/ImageView;
    .locals 1

    .prologue
    .line 149
    iget-object v0, p0, Lcom/edutech/appmanage/MainActivity;->img_appwarning:Landroid/widget/ImageView;

    return-object v0
.end method

.method static synthetic access$6(Lcom/edutech/appmanage/MainActivity;)Landroid/widget/RelativeLayout;
    .locals 1

    .prologue
    .line 148
    iget-object v0, p0, Lcom/edutech/appmanage/MainActivity;->layout_appwarning:Landroid/widget/RelativeLayout;

    return-object v0
.end method

.method static synthetic access$7(Lcom/edutech/appmanage/MainActivity;)Landroid/widget/GridView;
    .locals 1

    .prologue
    .line 93
    iget-object v0, p0, Lcom/edutech/appmanage/MainActivity;->gv:Landroid/widget/GridView;

    return-object v0
.end method

.method static synthetic access$8(Lcom/edutech/appmanage/MainActivity;Z)V
    .locals 0

    .prologue
    .line 130
    iput-boolean p1, p0, Lcom/edutech/appmanage/MainActivity;->data_load:Z

    return-void
.end method

.method static synthetic access$9(Lcom/edutech/appmanage/MainActivity;Z)V
    .locals 0

    .prologue
    .line 131
    iput-boolean p1, p0, Lcom/edutech/appmanage/MainActivity;->pic_load:Z

    return-void
.end method

.method private findview()V
    .locals 2

    .prologue
    .line 271
    const v0, 0x7f0a01d6

    invoke-virtual {p0, v0}, Lcom/edutech/appmanage/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 272
    new-instance v1, Lcom/edutech/appmanage/MainActivity$10;

    invoke-direct {v1, p0}, Lcom/edutech/appmanage/MainActivity$10;-><init>(Lcom/edutech/appmanage/MainActivity;)V

    .line 271
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 312
    const v0, 0x7f0a01d4

    invoke-virtual {p0, v0}, Lcom/edutech/appmanage/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v1, Lcom/edutech/appmanage/MainActivity$11;

    invoke-direct {v1, p0}, Lcom/edutech/appmanage/MainActivity$11;-><init>(Lcom/edutech/appmanage/MainActivity;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 320
    return-void
.end method

.method private getMarketInfor()V
    .locals 4

    .prologue
    .line 1299
    const-string/jumbo v2, "connectivity"

    invoke-virtual {p0, v2}, Lcom/edutech/appmanage/MainActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    .line 1300
    .local v0, "manager":Landroid/net/ConnectivityManager;
    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Landroid/net/ConnectivityManager;->getNetworkInfo(I)Landroid/net/NetworkInfo;

    move-result-object v2

    .line 1301
    invoke-virtual {v2}, Landroid/net/NetworkInfo;->getState()Landroid/net/NetworkInfo$State;

    move-result-object v1

    .line 1302
    .local v1, "wifi":Landroid/net/NetworkInfo$State;
    sget-object v2, Landroid/net/NetworkInfo$State;->CONNECTED:Landroid/net/NetworkInfo$State;

    if-ne v1, v2, :cond_0

    .line 1303
    new-instance v2, Ljava/lang/Thread;

    iget-object v3, p0, Lcom/edutech/appmanage/MainActivity;->net_thread:Ljava/lang/Runnable;

    invoke-direct {v2, v3}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    .line 1324
    :goto_0
    return-void

    .line 1305
    :cond_0
    invoke-static {}, Lcom/edutech/appmanage/utils/SharedPreferencesHelper;->load_info()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/edutech/appmanage/MainActivity;->unlink_parse(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private jsonToConfig(Ljava/lang/String;)Z
    .locals 23
    .param p1, "json_str"    # Ljava/lang/String;

    .prologue
    .line 3360
    if-eqz p1, :cond_0

    const-string/jumbo v20, ""

    move-object/from16 v0, p1

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v20

    if-eqz v20, :cond_1

    .line 3361
    :cond_0
    const/16 v20, 0x0

    .line 3478
    :goto_0
    return v20

    .line 3364
    :cond_1
    const/16 v17, 0x0

    .line 3365
    .local v17, "status":Ljava/lang/String;
    const/4 v8, 0x0

    .line 3366
    .local v8, "errorNum":Ljava/lang/String;
    const/4 v7, 0x0

    .line 3367
    .local v7, "errorInfo":Ljava/lang/String;
    const/4 v3, 0x0

    .line 3369
    .local v3, "data":Lorg/json/JSONObject;
    :try_start_0
    new-instance v9, Lorg/json/JSONObject;

    move-object/from16 v0, p1

    invoke-direct {v9, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 3371
    .local v9, "info":Lorg/json/JSONObject;
    const-string/jumbo v20, "AppmanageMainActivity"

    new-instance v21, Ljava/lang/StringBuilder;

    const-string/jumbo v22, "info :"

    invoke-direct/range {v21 .. v22}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v21

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-static/range {v20 .. v21}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 3372
    const-string/jumbo v20, "status"

    move-object/from16 v0, v20

    invoke-virtual {v9, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 3373
    const-string/jumbo v20, "errorNum"

    move-object/from16 v0, v20

    invoke-virtual {v9, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 3374
    const-string/jumbo v20, "errorInfo"

    move-object/from16 v0, v20

    invoke-virtual {v9, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 3375
    const-string/jumbo v20, "0"

    move-object/from16 v0, v20

    invoke-virtual {v8, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v20

    if-eqz v20, :cond_2

    .line 3377
    const-string/jumbo v20, "data"

    move-object/from16 v0, v20

    invoke-virtual {v9, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    .line 3378
    const-string/jumbo v20, "AppmanageMainActivity"

    new-instance v21, Ljava/lang/StringBuilder;

    const-string/jumbo v22, "status :"

    invoke-direct/range {v21 .. v22}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v21

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-static/range {v20 .. v21}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 3379
    const-string/jumbo v20, "AppmanageMainActivity"

    new-instance v21, Ljava/lang/StringBuilder;

    const-string/jumbo v22, "errorNum :"

    invoke-direct/range {v21 .. v22}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v21

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-static/range {v20 .. v21}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 3380
    const-string/jumbo v20, "AppmanageMainActivity"

    new-instance v21, Ljava/lang/StringBuilder;

    const-string/jumbo v22, "errorInfo :"

    invoke-direct/range {v21 .. v22}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v21

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-static/range {v20 .. v21}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 3381
    const-string/jumbo v20, "AppmanageMainActivity"

    new-instance v21, Ljava/lang/StringBuilder;

    const-string/jumbo v22, "data :"

    invoke-direct/range {v21 .. v22}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v21

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-static/range {v20 .. v21}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 3383
    const/16 v16, 0x0

    .line 3384
    .local v16, "privatekey":Ljava/lang/String;
    const/4 v6, 0x0

    .line 3385
    .local v6, "encrypt":Ljava/lang/String;
    const/4 v2, 0x0

    .line 3386
    .local v2, "apihost":Ljava/lang/String;
    const-string/jumbo v20, "privatekey"

    move-object/from16 v0, v20

    invoke-virtual {v3, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    .line 3387
    const-string/jumbo v20, "user"

    move-object/from16 v0, v20

    invoke-virtual {v3, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v19

    .line 3389
    .local v19, "userArray":Lorg/json/JSONObject;
    :try_start_1
    const-string/jumbo v20, "usercode"

    invoke-virtual/range {v19 .. v20}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/edutech/appmanage/MainActivity;->usercode:Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    .line 3394
    :goto_1
    :try_start_2
    const-string/jumbo v20, "AppmanageMainActivity"

    new-instance v21, Ljava/lang/StringBuilder;

    const-string/jumbo v22, "privatekey :"

    invoke-direct/range {v21 .. v22}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v21

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-static/range {v20 .. v21}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 3395
    const-string/jumbo v20, "AppmanageMainActivity"

    new-instance v21, Ljava/lang/StringBuilder;

    const-string/jumbo v22, "encrypt :"

    invoke-direct/range {v21 .. v22}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v21

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-static/range {v20 .. v21}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 3396
    const-string/jumbo v20, "AppmanageMainActivity"

    new-instance v21, Ljava/lang/StringBuilder;

    const-string/jumbo v22, "apihost :"

    invoke-direct/range {v21 .. v22}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v21

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-static/range {v20 .. v21}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_1

    .line 3398
    const/4 v4, 0x0

    .line 3399
    .local v4, "domain":Ljava/lang/String;
    const/4 v15, 0x0

    .line 3401
    .local v15, "port":Ljava/lang/String;
    :try_start_3
    const-string/jumbo v20, "tigase"

    move-object/from16 v0, v20

    invoke-virtual {v3, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_1

    move-result-object v18

    .line 3403
    .local v18, "tigase":Lorg/json/JSONObject;
    const/4 v4, 0x0

    .line 3404
    const/4 v15, 0x0

    .line 3406
    :try_start_4
    const-string/jumbo v20, "domain"

    move-object/from16 v0, v18

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2
    .catch Lorg/json/JSONException; {:try_start_4 .. :try_end_4} :catch_1

    move-result-object v4

    .line 3412
    :goto_2
    :try_start_5
    const-string/jumbo v20, "port"

    move-object/from16 v0, v18

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_4
    .catch Lorg/json/JSONException; {:try_start_5 .. :try_end_5} :catch_1

    move-result-object v15

    .line 3417
    :goto_3
    :try_start_6
    const-string/jumbo v20, "AppmanageMainActivity"

    new-instance v21, Ljava/lang/StringBuilder;

    const-string/jumbo v22, "domain :"

    invoke-direct/range {v21 .. v22}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v21

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-static/range {v20 .. v21}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 3418
    const-string/jumbo v20, "AppmanageMainActivity"

    new-instance v21, Ljava/lang/StringBuilder;

    const-string/jumbo v22, "port :"

    invoke-direct/range {v21 .. v22}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v21

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-static/range {v20 .. v21}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_3
    .catch Lorg/json/JSONException; {:try_start_6 .. :try_end_6} :catch_1

    .line 3424
    .end local v18    # "tigase":Lorg/json/JSONObject;
    :goto_4
    const/4 v11, 0x0

    .line 3425
    .local v11, "mongo_domain":Ljava/lang/String;
    const/4 v12, 0x0

    .line 3426
    .local v12, "mongo_port":Ljava/lang/String;
    const/4 v14, 0x0

    .line 3427
    .local v14, "mongo_user":Ljava/lang/String;
    const/4 v13, 0x0

    .line 3429
    .local v13, "mongo_pwd":Ljava/lang/String;
    :try_start_7
    const-string/jumbo v20, "mongo"

    move-object/from16 v0, v20

    invoke-virtual {v3, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_6
    .catch Lorg/json/JSONException; {:try_start_7 .. :try_end_7} :catch_1

    move-result-object v10

    .line 3431
    .local v10, "mongo":Lorg/json/JSONObject;
    const/4 v11, 0x0

    .line 3432
    const/4 v12, 0x0

    .line 3433
    const/4 v14, 0x0

    .line 3434
    const/4 v13, 0x0

    .line 3436
    :try_start_8
    const-string/jumbo v20, "domain"

    move-object/from16 v0, v20

    invoke-virtual {v10, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_5
    .catch Lorg/json/JSONException; {:try_start_8 .. :try_end_8} :catch_1

    move-result-object v11

    .line 3442
    :goto_5
    :try_start_9
    const-string/jumbo v20, "port"

    move-object/from16 v0, v20

    invoke-virtual {v10, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_7
    .catch Lorg/json/JSONException; {:try_start_9 .. :try_end_9} :catch_1

    move-result-object v12

    .line 3448
    :goto_6
    :try_start_a
    const-string/jumbo v20, "user"

    move-object/from16 v0, v20

    invoke-virtual {v10, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_8
    .catch Lorg/json/JSONException; {:try_start_a .. :try_end_a} :catch_1

    move-result-object v14

    .line 3454
    :goto_7
    :try_start_b
    const-string/jumbo v20, "pwd"

    move-object/from16 v0, v20

    invoke-virtual {v10, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_9
    .catch Lorg/json/JSONException; {:try_start_b .. :try_end_b} :catch_1

    move-result-object v13

    .line 3459
    :goto_8
    :try_start_c
    const-string/jumbo v20, "AppmanageMainActivity"

    new-instance v21, Ljava/lang/StringBuilder;

    const-string/jumbo v22, "mongo_domain :"

    invoke-direct/range {v21 .. v22}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v21

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-static/range {v20 .. v21}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 3460
    const-string/jumbo v20, "AppmanageMainActivity"

    new-instance v21, Ljava/lang/StringBuilder;

    const-string/jumbo v22, "mongo_port :"

    invoke-direct/range {v21 .. v22}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v21

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-static/range {v20 .. v21}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 3461
    const-string/jumbo v20, "AppmanageMainActivity"

    new-instance v21, Ljava/lang/StringBuilder;

    const-string/jumbo v22, "mongo_user :"

    invoke-direct/range {v21 .. v22}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v21

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-static/range {v20 .. v21}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 3462
    const-string/jumbo v20, "AppmanageMainActivity"

    new-instance v21, Ljava/lang/StringBuilder;

    const-string/jumbo v22, "mongo_pwd :"

    invoke-direct/range {v21 .. v22}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v21

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-static/range {v20 .. v21}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_6
    .catch Lorg/json/JSONException; {:try_start_c .. :try_end_c} :catch_1

    .line 3468
    .end local v10    # "mongo":Lorg/json/JSONObject;
    :goto_9
    const/16 v20, 0x1

    goto/16 :goto_0

    .line 3390
    .end local v4    # "domain":Ljava/lang/String;
    .end local v11    # "mongo_domain":Ljava/lang/String;
    .end local v12    # "mongo_port":Ljava/lang/String;
    .end local v13    # "mongo_pwd":Ljava/lang/String;
    .end local v14    # "mongo_user":Ljava/lang/String;
    .end local v15    # "port":Ljava/lang/String;
    :catch_0
    move-exception v5

    .line 3392
    .local v5, "e":Ljava/lang/Exception;
    :try_start_d
    invoke-virtual {v5}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_d
    .catch Lorg/json/JSONException; {:try_start_d .. :try_end_d} :catch_1

    goto/16 :goto_1

    .line 3475
    .end local v2    # "apihost":Ljava/lang/String;
    .end local v5    # "e":Ljava/lang/Exception;
    .end local v6    # "encrypt":Ljava/lang/String;
    .end local v9    # "info":Lorg/json/JSONObject;
    .end local v16    # "privatekey":Ljava/lang/String;
    .end local v19    # "userArray":Lorg/json/JSONObject;
    :catch_1
    move-exception v5

    .line 3477
    .local v5, "e":Lorg/json/JSONException;
    invoke-virtual {v5}, Lorg/json/JSONException;->printStackTrace()V

    .line 3478
    const/16 v20, 0x0

    goto/16 :goto_0

    .line 3407
    .end local v5    # "e":Lorg/json/JSONException;
    .restart local v2    # "apihost":Ljava/lang/String;
    .restart local v4    # "domain":Ljava/lang/String;
    .restart local v6    # "encrypt":Ljava/lang/String;
    .restart local v9    # "info":Lorg/json/JSONObject;
    .restart local v15    # "port":Ljava/lang/String;
    .restart local v16    # "privatekey":Ljava/lang/String;
    .restart local v18    # "tigase":Lorg/json/JSONObject;
    .restart local v19    # "userArray":Lorg/json/JSONObject;
    :catch_2
    move-exception v5

    .line 3409
    .local v5, "e":Ljava/lang/Exception;
    :try_start_e
    invoke-virtual {v5}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_e} :catch_3
    .catch Lorg/json/JSONException; {:try_start_e .. :try_end_e} :catch_1

    goto/16 :goto_2

    .line 3419
    .end local v5    # "e":Ljava/lang/Exception;
    .end local v18    # "tigase":Lorg/json/JSONObject;
    :catch_3
    move-exception v5

    .line 3421
    .restart local v5    # "e":Ljava/lang/Exception;
    :try_start_f
    invoke-virtual {v5}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_f
    .catch Lorg/json/JSONException; {:try_start_f .. :try_end_f} :catch_1

    goto/16 :goto_4

    .line 3413
    .end local v5    # "e":Ljava/lang/Exception;
    .restart local v18    # "tigase":Lorg/json/JSONObject;
    :catch_4
    move-exception v5

    .line 3415
    .restart local v5    # "e":Ljava/lang/Exception;
    :try_start_10
    invoke-virtual {v5}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_10
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_10} :catch_3
    .catch Lorg/json/JSONException; {:try_start_10 .. :try_end_10} :catch_1

    goto/16 :goto_3

    .line 3437
    .end local v5    # "e":Ljava/lang/Exception;
    .end local v18    # "tigase":Lorg/json/JSONObject;
    .restart local v10    # "mongo":Lorg/json/JSONObject;
    .restart local v11    # "mongo_domain":Ljava/lang/String;
    .restart local v12    # "mongo_port":Ljava/lang/String;
    .restart local v13    # "mongo_pwd":Ljava/lang/String;
    .restart local v14    # "mongo_user":Ljava/lang/String;
    :catch_5
    move-exception v5

    .line 3439
    .restart local v5    # "e":Ljava/lang/Exception;
    :try_start_11
    invoke-virtual {v5}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_11
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_11} :catch_6
    .catch Lorg/json/JSONException; {:try_start_11 .. :try_end_11} :catch_1

    goto/16 :goto_5

    .line 3464
    .end local v5    # "e":Ljava/lang/Exception;
    .end local v10    # "mongo":Lorg/json/JSONObject;
    :catch_6
    move-exception v5

    .line 3466
    .restart local v5    # "e":Ljava/lang/Exception;
    :try_start_12
    invoke-virtual {v5}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_12
    .catch Lorg/json/JSONException; {:try_start_12 .. :try_end_12} :catch_1

    goto :goto_9

    .line 3443
    .end local v5    # "e":Ljava/lang/Exception;
    .restart local v10    # "mongo":Lorg/json/JSONObject;
    :catch_7
    move-exception v5

    .line 3445
    .restart local v5    # "e":Ljava/lang/Exception;
    :try_start_13
    invoke-virtual {v5}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_6

    .line 3449
    .end local v5    # "e":Ljava/lang/Exception;
    :catch_8
    move-exception v5

    .line 3451
    .restart local v5    # "e":Ljava/lang/Exception;
    invoke-virtual {v5}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_7

    .line 3455
    .end local v5    # "e":Ljava/lang/Exception;
    :catch_9
    move-exception v5

    .line 3457
    .restart local v5    # "e":Ljava/lang/Exception;
    invoke-virtual {v5}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_13
    .catch Ljava/lang/Exception; {:try_start_13 .. :try_end_13} :catch_6
    .catch Lorg/json/JSONException; {:try_start_13 .. :try_end_13} :catch_1

    goto/16 :goto_8

    .line 3471
    .end local v2    # "apihost":Ljava/lang/String;
    .end local v4    # "domain":Ljava/lang/String;
    .end local v5    # "e":Ljava/lang/Exception;
    .end local v6    # "encrypt":Ljava/lang/String;
    .end local v10    # "mongo":Lorg/json/JSONObject;
    .end local v11    # "mongo_domain":Ljava/lang/String;
    .end local v12    # "mongo_port":Ljava/lang/String;
    .end local v13    # "mongo_pwd":Ljava/lang/String;
    .end local v14    # "mongo_user":Ljava/lang/String;
    .end local v15    # "port":Ljava/lang/String;
    .end local v16    # "privatekey":Ljava/lang/String;
    .end local v19    # "userArray":Lorg/json/JSONObject;
    :cond_2
    :try_start_14
    const-string/jumbo v20, "AppmanageMainActivity"

    const-string/jumbo v21, "\u914d\u7f6e\u4fe1\u606f json\u6570\u636e  \u8fd4\u56de\u9519\u8bef\u6570\u636e\u3002\u3002\u3002"

    invoke-static/range {v20 .. v21}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_14
    .catch Lorg/json/JSONException; {:try_start_14 .. :try_end_14} :catch_1

    .line 3472
    const/16 v20, 0x0

    goto/16 :goto_0
.end method

.method private startTimer()V
    .locals 6

    .prologue
    .line 2080
    iget-object v0, p0, Lcom/edutech/appmanage/MainActivity;->mTimer:Ljava/util/Timer;

    if-nez v0, :cond_0

    .line 2081
    new-instance v0, Ljava/util/Timer;

    invoke-direct {v0}, Ljava/util/Timer;-><init>()V

    iput-object v0, p0, Lcom/edutech/appmanage/MainActivity;->mTimer:Ljava/util/Timer;

    .line 2084
    :cond_0
    iget-object v0, p0, Lcom/edutech/appmanage/MainActivity;->mTimerTask:Ljava/util/TimerTask;

    if-nez v0, :cond_1

    .line 2085
    new-instance v0, Lcom/edutech/appmanage/MainActivity$17;

    invoke-direct {v0, p0}, Lcom/edutech/appmanage/MainActivity$17;-><init>(Lcom/edutech/appmanage/MainActivity;)V

    iput-object v0, p0, Lcom/edutech/appmanage/MainActivity;->mTimerTask:Ljava/util/TimerTask;

    .line 2098
    :cond_1
    iget-object v0, p0, Lcom/edutech/appmanage/MainActivity;->mTimer:Ljava/util/Timer;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/edutech/appmanage/MainActivity;->mTimerTask:Ljava/util/TimerTask;

    if-eqz v0, :cond_2

    .line 2099
    iget-object v0, p0, Lcom/edutech/appmanage/MainActivity;->mTimer:Ljava/util/Timer;

    iget-object v1, p0, Lcom/edutech/appmanage/MainActivity;->mTimerTask:Ljava/util/TimerTask;

    const-wide/16 v2, 0x0

    const-wide/16 v4, 0x3e8

    invoke-virtual/range {v0 .. v5}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;JJ)V

    .line 2101
    :cond_2
    return-void
.end method

.method private stopTimer()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 2105
    iget-object v0, p0, Lcom/edutech/appmanage/MainActivity;->mTimer:Ljava/util/Timer;

    if-eqz v0, :cond_0

    .line 2106
    iget-object v0, p0, Lcom/edutech/appmanage/MainActivity;->mTimer:Ljava/util/Timer;

    invoke-virtual {v0}, Ljava/util/Timer;->cancel()V

    .line 2107
    iput-object v1, p0, Lcom/edutech/appmanage/MainActivity;->mTimer:Ljava/util/Timer;

    .line 2110
    :cond_0
    iget-object v0, p0, Lcom/edutech/appmanage/MainActivity;->mTimerTask:Ljava/util/TimerTask;

    if-eqz v0, :cond_1

    .line 2111
    iget-object v0, p0, Lcom/edutech/appmanage/MainActivity;->mTimerTask:Ljava/util/TimerTask;

    invoke-virtual {v0}, Ljava/util/TimerTask;->cancel()Z

    .line 2112
    iput-object v1, p0, Lcom/edutech/appmanage/MainActivity;->mTimerTask:Ljava/util/TimerTask;

    .line 2115
    :cond_1
    const/4 v0, 0x0

    sput v0, Lcom/edutech/appmanage/MainActivity;->count:I

    .line 2117
    return-void
.end method

.method private userLogin(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
    .locals 11
    .param p1, "mServerIp"    # Ljava/lang/String;
    .param p2, "musercode"    # Ljava/lang/String;
    .param p3, "mPassWord"    # Ljava/lang/String;

    .prologue
    .line 2496
    const/4 v4, -0x1

    .line 2498
    .local v4, "result":I
    invoke-static {p1, p2, p3}, Lcom/edutech/appmanage/MainActivity;->LOGINURL(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 2500
    .local v7, "url":Ljava/lang/String;
    new-instance v1, Lorg/apache/http/client/methods/HttpPost;

    invoke-direct {v1, v7}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/lang/String;)V

    .line 2503
    .local v1, "httpRequest":Lorg/apache/http/client/methods/HttpPost;
    :try_start_0
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 2506
    .local v3, "params":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    new-instance v8, Lorg/apache/http/client/entity/UrlEncodedFormEntity;

    const-string/jumbo v9, "UTF-8"

    invoke-direct {v8, v3, v9}, Lorg/apache/http/client/entity/UrlEncodedFormEntity;-><init>(Ljava/util/List;Ljava/lang/String;)V

    invoke-virtual {v1, v8}, Lorg/apache/http/client/methods/HttpPost;->setEntity(Lorg/apache/http/HttpEntity;)V

    .line 2509
    new-instance v8, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v8}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    .line 2510
    invoke-virtual {v8, v1}, Lorg/apache/http/impl/client/DefaultHttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v2

    .line 2514
    .local v2, "httpResponse":Lorg/apache/http/HttpResponse;
    invoke-interface {v2}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v8

    invoke-interface {v8}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v8

    const/16 v9, 0xc8

    if-ne v8, v9, :cond_0

    .line 2516
    invoke-interface {v2}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v8

    .line 2515
    invoke-static {v8}, Lorg/apache/http/util/EntityUtils;->toString(Lorg/apache/http/HttpEntity;)Ljava/lang/String;

    move-result-object v6

    .line 2519
    .local v6, "strResult":Ljava/lang/String;
    invoke-static {v6}, Lcom/edutech/idauthentication/JsonHelper;->parseHttpPostReturnJson(Ljava/lang/String;)I

    move-result v4

    .line 2521
    const-string/jumbo v8, "AppmanageMainActivity"

    new-instance v9, Ljava/lang/StringBuilder;

    const-string/jumbo v10, "RES:"

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Lorg/apache/http/client/ClientProtocolException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    move v5, v4

    .line 2534
    .end local v2    # "httpResponse":Lorg/apache/http/HttpResponse;
    .end local v3    # "params":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    .end local v4    # "result":I
    .end local v6    # "strResult":Ljava/lang/String;
    .local v5, "result":I
    :goto_0
    return v5

    .line 2524
    .end local v5    # "result":I
    .restart local v4    # "result":I
    :catch_0
    move-exception v0

    .line 2525
    .local v0, "e":Lorg/apache/http/client/ClientProtocolException;
    const-string/jumbo v8, "AppmanageMainActivity"

    const-string/jumbo v9, "1"

    invoke-static {v8, v9}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 2526
    invoke-virtual {v0}, Lorg/apache/http/client/ClientProtocolException;->printStackTrace()V

    .end local v0    # "e":Lorg/apache/http/client/ClientProtocolException;
    :cond_0
    :goto_1
    move v5, v4

    .line 2534
    .end local v4    # "result":I
    .restart local v5    # "result":I
    goto :goto_0

    .line 2527
    .end local v5    # "result":I
    .restart local v4    # "result":I
    :catch_1
    move-exception v0

    .line 2528
    .local v0, "e":Ljava/io/IOException;
    const-string/jumbo v8, "AppmanageMainActivity"

    const-string/jumbo v9, "2"

    invoke-static {v8, v9}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 2529
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_1

    .line 2530
    .end local v0    # "e":Ljava/io/IOException;
    :catch_2
    move-exception v0

    .line 2531
    .local v0, "e":Ljava/lang/Exception;
    const-string/jumbo v8, "AppmanageMainActivity"

    const-string/jumbo v9, "3"

    invoke-static {v8, v9}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 2532
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1
.end method


# virtual methods
.method public compare()V
    .locals 15

    .prologue
    const/16 v14, 0xa

    const/4 v13, 0x1

    const/4 v12, 0x0

    .line 867
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 869
    .local v5, "uninstall_list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    iget-object v6, p0, Lcom/edutech/appmanage/MainActivity;->silent_uninstall:Ljava/util/ArrayList;

    if-nez v6, :cond_0

    .line 870
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    iput-object v6, p0, Lcom/edutech/appmanage/MainActivity;->silent_uninstall:Ljava/util/ArrayList;

    .line 871
    :cond_0
    const/4 v2, 0x0

    .local v2, "j":I
    :goto_0
    sget-object v6, Lcom/edutech/appmanage/MainActivity;->market_applist:Ljava/util/LinkedList;

    invoke-virtual {v6}, Ljava/util/LinkedList;->size()I

    move-result v6

    if-lt v2, v6, :cond_3

    .line 904
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    iget-object v6, p0, Lcom/edutech/appmanage/MainActivity;->silent_uninstall:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-lt v1, v6, :cond_7

    .line 908
    const/4 v1, 0x0

    :goto_2
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-lt v1, v6, :cond_8

    .line 918
    sget-object v6, Lcom/edutech/appmanage/HttpHelper;->install_num:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-eqz v6, :cond_1

    .line 919
    const/4 v1, 0x0

    :goto_3
    iget-object v6, p0, Lcom/edutech/appmanage/MainActivity;->silent_uninstall:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-lt v1, v6, :cond_b

    .line 959
    :cond_1
    const/4 v1, 0x0

    :goto_4
    sget-object v6, Lcom/edutech/appmanage/MainActivity;->market_applist:Ljava/util/LinkedList;

    invoke-virtual {v6}, Ljava/util/LinkedList;->size()I

    move-result v6

    if-lt v1, v6, :cond_e

    .line 982
    sget-object v6, Lcom/edutech/appmanage/MainActivity;->market_applist:Ljava/util/LinkedList;

    new-instance v7, Lcom/edutech/appmanage/MainActivity$14;

    invoke-direct {v7, p0}, Lcom/edutech/appmanage/MainActivity$14;-><init>(Lcom/edutech/appmanage/MainActivity;)V

    invoke-static {v6, v7}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 1042
    iget-object v6, p0, Lcom/edutech/appmanage/MainActivity;->silent_uninstall:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-eqz v6, :cond_2

    .line 1044
    new-instance v4, Landroid/content/Intent;

    .line 1045
    const-class v6, Lcom/edutech/appmanage/SilentUninstall_Service;

    .line 1044
    invoke-direct {v4, p0, v6}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 1046
    .local v4, "uninstall_intent":Landroid/content/Intent;
    const-string/jumbo v6, "uninstall_list"

    .line 1047
    iget-object v7, p0, Lcom/edutech/appmanage/MainActivity;->silent_uninstall:Ljava/util/ArrayList;

    .line 1046
    invoke-virtual {v4, v6, v7}, Landroid/content/Intent;->putStringArrayListExtra(Ljava/lang/String;Ljava/util/ArrayList;)Landroid/content/Intent;

    .line 1048
    invoke-virtual {p0, v4}, Lcom/edutech/appmanage/MainActivity;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 1073
    .end local v4    # "uninstall_intent":Landroid/content/Intent;
    :cond_2
    iput-boolean v13, p0, Lcom/edutech/appmanage/MainActivity;->data_load:Z

    .line 1075
    new-instance v6, Lcom/edutech/appmanage/MainActivity$15;

    invoke-direct {v6, p0}, Lcom/edutech/appmanage/MainActivity$15;-><init>(Lcom/edutech/appmanage/MainActivity;)V

    .line 1106
    invoke-virtual {v6}, Lcom/edutech/appmanage/MainActivity$15;->start()V

    .line 1111
    return-void

    .line 873
    .end local v1    # "i":I
    :cond_3
    const/4 v7, 0x2

    sget-object v6, Lcom/edutech/appmanage/MainActivity;->market_applist_local:Ljava/util/LinkedList;

    invoke-virtual {v6, v2}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/edutech/appmanage/MainActivity$AppInfo;

    iget v6, v6, Lcom/edutech/appmanage/MainActivity$AppInfo;->apptype:I

    if-ne v7, v6, :cond_5

    .line 877
    :try_start_0
    invoke-virtual {p0}, Lcom/edutech/appmanage/MainActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v7

    .line 878
    sget-object v6, Lcom/edutech/appmanage/MainActivity;->market_applist_local:Ljava/util/LinkedList;

    invoke-virtual {v6, v2}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/edutech/appmanage/MainActivity$AppInfo;

    iget-object v6, v6, Lcom/edutech/appmanage/MainActivity$AppInfo;->packagename:Ljava/lang/String;

    const/4 v8, 0x0

    .line 877
    invoke-virtual {v7, v6, v8}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 883
    .local v3, "packageInfo":Landroid/content/pm/PackageInfo;
    :goto_5
    if-eqz v3, :cond_6

    .line 884
    iget-object v7, p0, Lcom/edutech/appmanage/MainActivity;->silent_uninstall:Ljava/util/ArrayList;

    .line 885
    sget-object v6, Lcom/edutech/appmanage/MainActivity;->market_applist_local:Ljava/util/LinkedList;

    invoke-virtual {v6, v2}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/edutech/appmanage/MainActivity$AppInfo;

    iget-object v6, v6, Lcom/edutech/appmanage/MainActivity$AppInfo;->packagename:Ljava/lang/String;

    invoke-virtual {v7, v6}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_4

    .line 886
    iget-object v7, p0, Lcom/edutech/appmanage/MainActivity;->silent_uninstall:Ljava/util/ArrayList;

    .line 887
    sget-object v6, Lcom/edutech/appmanage/MainActivity;->market_applist_local:Ljava/util/LinkedList;

    invoke-virtual {v6, v2}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/edutech/appmanage/MainActivity$AppInfo;

    iget-object v6, v6, Lcom/edutech/appmanage/MainActivity$AppInfo;->packagename:Ljava/lang/String;

    invoke-virtual {v7, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 895
    :cond_4
    :goto_6
    sget-object v6, Lcom/edutech/appmanage/MainActivity;->market_applist_local:Ljava/util/LinkedList;

    invoke-virtual {v6, v2}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/edutech/appmanage/MainActivity$AppInfo;

    iget-object v6, v6, Lcom/edutech/appmanage/MainActivity$AppInfo;->packagename:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 871
    .end local v3    # "packageInfo":Landroid/content/pm/PackageInfo;
    :cond_5
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_0

    .line 879
    :catch_0
    move-exception v0

    .line 880
    .local v0, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    const/4 v3, 0x0

    .line 881
    .restart local v3    # "packageInfo":Landroid/content/pm/PackageInfo;
    invoke-virtual {v0}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V

    goto :goto_5

    .line 889
    .end local v0    # "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    :cond_6
    iget-object v7, p0, Lcom/edutech/appmanage/MainActivity;->silent_uninstall:Ljava/util/ArrayList;

    .line 890
    sget-object v6, Lcom/edutech/appmanage/MainActivity;->market_applist_local:Ljava/util/LinkedList;

    invoke-virtual {v6, v2}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/edutech/appmanage/MainActivity$AppInfo;

    iget-object v6, v6, Lcom/edutech/appmanage/MainActivity$AppInfo;->packagename:Ljava/lang/String;

    invoke-virtual {v7, v6}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_4

    .line 891
    iget-object v7, p0, Lcom/edutech/appmanage/MainActivity;->silent_uninstall:Ljava/util/ArrayList;

    .line 892
    sget-object v6, Lcom/edutech/appmanage/MainActivity;->market_applist_local:Ljava/util/LinkedList;

    invoke-virtual {v6, v2}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/edutech/appmanage/MainActivity$AppInfo;

    iget-object v6, v6, Lcom/edutech/appmanage/MainActivity$AppInfo;->packagename:Ljava/lang/String;

    invoke-virtual {v7, v6}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    goto :goto_6

    .line 904
    .end local v3    # "packageInfo":Landroid/content/pm/PackageInfo;
    .restart local v1    # "i":I
    :cond_7
    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_1

    .line 909
    :cond_8
    const/4 v2, 0x0

    :goto_7
    sget-object v6, Lcom/edutech/appmanage/MainActivity;->market_applist:Ljava/util/LinkedList;

    invoke-virtual {v6}, Ljava/util/LinkedList;->size()I

    move-result v6

    if-lt v2, v6, :cond_9

    .line 908
    :goto_8
    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_2

    .line 910
    :cond_9
    invoke-virtual {v5, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 911
    sget-object v7, Lcom/edutech/appmanage/MainActivity;->market_applist:Ljava/util/LinkedList;

    invoke-virtual {v7, v2}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/edutech/appmanage/MainActivity$AppInfo;

    iget-object v7, v7, Lcom/edutech/appmanage/MainActivity$AppInfo;->packagename:Ljava/lang/String;

    .line 910
    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    .line 911
    if-eqz v6, :cond_a

    .line 912
    sget-object v6, Lcom/edutech/appmanage/MainActivity;->market_applist:Ljava/util/LinkedList;

    invoke-virtual {v6, v2}, Ljava/util/LinkedList;->remove(I)Ljava/lang/Object;

    goto :goto_8

    .line 909
    :cond_a
    add-int/lit8 v2, v2, 0x1

    goto :goto_7

    .line 920
    :cond_b
    const/4 v2, 0x0

    :goto_9
    sget-object v6, Lcom/edutech/appmanage/HttpHelper;->install_num:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-lt v2, v6, :cond_c

    .line 919
    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_3

    .line 921
    :cond_c
    iget-object v6, p0, Lcom/edutech/appmanage/MainActivity;->silent_uninstall:Ljava/util/ArrayList;

    invoke-virtual {v6, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 922
    sget-object v7, Lcom/edutech/appmanage/HttpHelper;->install_num:Ljava/util/ArrayList;

    invoke-virtual {v7, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/Map;

    .line 923
    const-string/jumbo v8, "packagename"

    .line 922
    invoke-interface {v7, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    .line 921
    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    .line 923
    if-eqz v6, :cond_d

    .line 924
    sget-object v7, Lcom/edutech/appmanage/MainActivity;->downloadManager:Landroid/app/DownloadManager;

    new-array v8, v13, [J

    sget-object v6, Lcom/edutech/appmanage/HttpHelper;->install_num:Ljava/util/ArrayList;

    .line 925
    invoke-virtual {v6, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/Map;

    const-string/jumbo v9, "downid"

    invoke-interface {v6, v9}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Long;

    invoke-virtual {v6}, Ljava/lang/Long;->longValue()J

    move-result-wide v10

    aput-wide v10, v8, v12

    .line 924
    invoke-virtual {v7, v8}, Landroid/app/DownloadManager;->remove([J)I

    .line 926
    sget-object v6, Lcom/edutech/appmanage/HttpHelper;->install_num:Ljava/util/ArrayList;

    invoke-virtual {v6, v2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 920
    :cond_d
    add-int/lit8 v2, v2, 0x1

    goto :goto_9

    .line 961
    :cond_e
    :try_start_1
    invoke-virtual {p0}, Lcom/edutech/appmanage/MainActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v7

    .line 962
    sget-object v6, Lcom/edutech/appmanage/MainActivity;->market_applist:Ljava/util/LinkedList;

    invoke-virtual {v6, v1}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/edutech/appmanage/MainActivity$AppInfo;

    iget-object v6, v6, Lcom/edutech/appmanage/MainActivity$AppInfo;->packagename:Ljava/lang/String;

    const/4 v8, 0x0

    .line 961
    invoke-virtual {v7, v6, v8}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;
    :try_end_1
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v3

    .line 967
    .restart local v3    # "packageInfo":Landroid/content/pm/PackageInfo;
    :goto_a
    if-eqz v3, :cond_11

    .line 968
    sget-object v6, Lcom/edutech/appmanage/MainActivity;->market_applist:Ljava/util/LinkedList;

    invoke-virtual {v6, v1}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/edutech/appmanage/MainActivity$AppInfo;

    iput-boolean v13, v6, Lcom/edutech/appmanage/MainActivity$AppInfo;->islocal:Z

    .line 969
    iget v7, v3, Landroid/content/pm/PackageInfo;->versionCode:I

    sget-object v6, Lcom/edutech/appmanage/MainActivity;->market_applist:Ljava/util/LinkedList;

    invoke-virtual {v6, v1}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/edutech/appmanage/MainActivity$AppInfo;

    iget v6, v6, Lcom/edutech/appmanage/MainActivity$AppInfo;->versionCode:I

    if-eq v7, v6, :cond_f

    .line 970
    iget-object v6, v3, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    if-le v6, v14, :cond_10

    .line 971
    sget-object v6, Lcom/edutech/appmanage/MainActivity;->market_applist:Ljava/util/LinkedList;

    invoke-virtual {v6, v1}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/edutech/appmanage/MainActivity$AppInfo;

    new-instance v7, Ljava/lang/StringBuilder;

    iget-object v8, v3, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    .line 972
    invoke-virtual {v8, v12, v14}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v8, "..."

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 971
    iput-object v7, v6, Lcom/edutech/appmanage/MainActivity$AppInfo;->local_versionName:Ljava/lang/String;

    .line 975
    :goto_b
    sget-object v6, Lcom/edutech/appmanage/MainActivity;->market_applist:Ljava/util/LinkedList;

    invoke-virtual {v6, v1}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/edutech/appmanage/MainActivity$AppInfo;

    iput-boolean v13, v6, Lcom/edutech/appmanage/MainActivity$AppInfo;->update:Z

    .line 959
    :cond_f
    :goto_c
    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_4

    .line 963
    .end local v3    # "packageInfo":Landroid/content/pm/PackageInfo;
    :catch_1
    move-exception v0

    .line 964
    .restart local v0    # "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    const/4 v3, 0x0

    .line 965
    .restart local v3    # "packageInfo":Landroid/content/pm/PackageInfo;
    invoke-virtual {v0}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V

    goto :goto_a

    .line 974
    .end local v0    # "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    :cond_10
    sget-object v6, Lcom/edutech/appmanage/MainActivity;->market_applist:Ljava/util/LinkedList;

    invoke-virtual {v6, v1}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/edutech/appmanage/MainActivity$AppInfo;

    iget-object v7, v3, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    iput-object v7, v6, Lcom/edutech/appmanage/MainActivity$AppInfo;->local_versionName:Ljava/lang/String;

    goto :goto_b

    .line 978
    :cond_11
    sget-object v6, Lcom/edutech/appmanage/MainActivity;->market_applist:Ljava/util/LinkedList;

    invoke-virtual {v6, v1}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/edutech/appmanage/MainActivity$AppInfo;

    iput-boolean v12, v6, Lcom/edutech/appmanage/MainActivity$AppInfo;->islocal:Z

    goto :goto_c
.end method

.method public complete()V
    .locals 1

    .prologue
    .line 2586
    new-instance v0, Lcom/edutech/appmanage/MainActivity$18;

    invoke-direct {v0, p0}, Lcom/edutech/appmanage/MainActivity$18;-><init>(Lcom/edutech/appmanage/MainActivity;)V

    .line 2600
    invoke-virtual {v0}, Lcom/edutech/appmanage/MainActivity$18;->start()V

    .line 2601
    return-void
.end method

.method public deleteFile(Ljava/lang/String;)Z
    .locals 3
    .param p1, "sPath"    # Ljava/lang/String;

    .prologue
    .line 2611
    const/4 v1, 0x0

    .line 2612
    .local v1, "flag":Z
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 2614
    .local v0, "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->isFile()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 2615
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    move-result v1

    .line 2617
    :cond_0
    return v1
.end method

.method public getImageDrawable(Ljava/lang/String;)Landroid/graphics/drawable/BitmapDrawable;
    .locals 10
    .param p1, "path"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x0

    .line 1123
    new-instance v4, Ljava/io/File;

    invoke-direct {v4, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 1124
    .local v4, "file":Ljava/io/File;
    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v8

    if-nez v8, :cond_0

    .line 1125
    const/4 v0, 0x0

    .line 1146
    :goto_0
    return-object v0

    .line 1128
    :cond_0
    new-instance v6, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v6}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 1129
    .local v6, "outStream":Ljava/io/ByteArrayOutputStream;
    const/16 v8, 0x400

    new-array v2, v8, [B

    .line 1132
    .local v2, "bt":[B
    new-instance v5, Ljava/io/FileInputStream;

    invoke-direct {v5, v4}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 1135
    .local v5, "in":Ljava/io/InputStream;
    invoke-virtual {v5, v2}, Ljava/io/InputStream;->read([B)I

    move-result v7

    .line 1136
    .local v7, "readLength":I
    :goto_1
    const/4 v8, -0x1

    if-ne v7, v8, :cond_1

    .line 1142
    invoke-virtual {v6}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v3

    .line 1143
    .local v3, "data":[B
    array-length v8, v3

    invoke-static {v3, v9, v8}, Landroid/graphics/BitmapFactory;->decodeByteArray([BII)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 1144
    .local v1, "bitmap":Landroid/graphics/Bitmap;
    new-instance v0, Landroid/graphics/drawable/BitmapDrawable;

    invoke-direct {v0, v1}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/graphics/Bitmap;)V

    .line 1146
    .local v0, "bd":Landroid/graphics/drawable/BitmapDrawable;
    goto :goto_0

    .line 1137
    .end local v0    # "bd":Landroid/graphics/drawable/BitmapDrawable;
    .end local v1    # "bitmap":Landroid/graphics/Bitmap;
    .end local v3    # "data":[B
    :cond_1
    invoke-virtual {v6, v2, v9, v7}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    .line 1138
    invoke-virtual {v5, v2}, Ljava/io/InputStream;->read([B)I

    move-result v7

    goto :goto_1
.end method

.method public onClick(Landroid/view/View;)V
    .locals 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const/4 v3, 0x0

    .line 2543
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 2582
    :goto_0
    return-void

    .line 2545
    :pswitch_0
    iget-boolean v0, p0, Lcom/edutech/appmanage/MainActivity;->data_load:Z

    if-nez v0, :cond_0

    .line 2547
    invoke-virtual {p0}, Lcom/edutech/appmanage/MainActivity;->getApplication()Landroid/app/Application;

    move-result-object v0

    .line 2548
    invoke-virtual {p0}, Lcom/edutech/appmanage/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f080197

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 2546
    invoke-static {v0, v1, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    .line 2549
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 2552
    :cond_0
    iget-boolean v0, p0, Lcom/edutech/appmanage/MainActivity;->pic_load:Z

    if-nez v0, :cond_1

    .line 2554
    invoke-virtual {p0}, Lcom/edutech/appmanage/MainActivity;->getApplication()Landroid/app/Application;

    move-result-object v0

    .line 2555
    invoke-virtual {p0}, Lcom/edutech/appmanage/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 2556
    const v2, 0x7f080198

    .line 2555
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 2553
    invoke-static {v0, v1, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    .line 2557
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 2560
    :cond_1
    iput-boolean v3, p0, Lcom/edutech/appmanage/MainActivity;->data_load:Z

    .line 2561
    iput-boolean v3, p0, Lcom/edutech/appmanage/MainActivity;->pic_load:Z

    .line 2562
    iput-boolean v3, p0, Lcom/edutech/appmanage/MainActivity;->toast_unlink:Z

    .line 2563
    invoke-virtual {p0}, Lcom/edutech/appmanage/MainActivity;->getApplication()Landroid/app/Application;

    move-result-object v0

    .line 2564
    invoke-virtual {p0}, Lcom/edutech/appmanage/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f08003d

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 2563
    invoke-static {v0, v1, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    .line 2565
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 2573
    invoke-direct {p0}, Lcom/edutech/appmanage/MainActivity;->getMarketInfor()V

    goto :goto_0

    .line 2543
    nop

    :pswitch_data_0
    .packed-switch 0x7f0a01d6
        :pswitch_0
    .end packed-switch
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 9
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/16 v7, 0x400

    const/4 v8, 0x0

    .line 190
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 192
    invoke-virtual {p0}, Lcom/edutech/appmanage/MainActivity;->getWindow()Landroid/view/Window;

    move-result-object v6

    invoke-virtual {v6, v7, v7}, Landroid/view/Window;->setFlags(II)V

    .line 194
    const v6, 0x7f030078

    invoke-virtual {p0, v6}, Lcom/edutech/appmanage/MainActivity;->setContentView(I)V

    .line 195
    invoke-direct {p0}, Lcom/edutech/appmanage/MainActivity;->findview()V

    .line 196
    const v6, 0x7f0a01d8

    invoke-virtual {p0, v6}, Lcom/edutech/appmanage/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    iput-object v6, p0, Lcom/edutech/appmanage/MainActivity;->wrong_net:Landroid/widget/TextView;

    .line 197
    const v6, 0x7f0a01d7

    invoke-virtual {p0, v6}, Lcom/edutech/appmanage/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/RelativeLayout;

    iput-object v6, p0, Lcom/edutech/appmanage/MainActivity;->layout_appwarning:Landroid/widget/RelativeLayout;

    .line 198
    const v6, 0x7f0a01d9

    invoke-virtual {p0, v6}, Lcom/edutech/appmanage/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/ImageView;

    iput-object v6, p0, Lcom/edutech/appmanage/MainActivity;->img_appwarning:Landroid/widget/ImageView;

    .line 199
    invoke-virtual {p0}, Lcom/edutech/appmanage/MainActivity;->getApplication()Landroid/app/Application;

    move-result-object v6

    .line 200
    const-string/jumbo v7, "window"

    invoke-virtual {v6, v7}, Landroid/app/Application;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    .line 199
    check-cast v4, Landroid/view/WindowManager;

    .line 201
    .local v4, "manager":Landroid/view/WindowManager;
    const-string/jumbo v6, "download"

    invoke-virtual {p0, v6}, Lcom/edutech/appmanage/MainActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/app/DownloadManager;

    sput-object v6, Lcom/edutech/appmanage/MainActivity;->downloadManager:Landroid/app/DownloadManager;

    .line 202
    new-instance v6, Lcom/edutech/appmanage/utils/DownloadManagerPro;

    sget-object v7, Lcom/edutech/appmanage/MainActivity;->downloadManager:Landroid/app/DownloadManager;

    invoke-direct {v6, v7}, Lcom/edutech/appmanage/utils/DownloadManagerPro;-><init>(Landroid/app/DownloadManager;)V

    sput-object v6, Lcom/edutech/appmanage/MainActivity;->downloadManagerPro:Lcom/edutech/appmanage/utils/DownloadManagerPro;

    .line 203
    const-string/jumbo v6, "configure"

    invoke-virtual {p0, v6, v8}, Lcom/edutech/appmanage/MainActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v6

    sput-object v6, Lcom/edutech/appmanage/utils/SharedPreferencesHelper;->preferences:Landroid/content/SharedPreferences;

    .line 205
    new-instance v0, Landroid/util/DisplayMetrics;

    invoke-direct {v0}, Landroid/util/DisplayMetrics;-><init>()V

    .line 206
    .local v0, "dm":Landroid/util/DisplayMetrics;
    invoke-interface {v4}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v6

    invoke-virtual {v6, v0}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    .line 207
    iget v5, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 208
    .local v5, "width2":I
    iget v3, v0, Landroid/util/DisplayMetrics;->heightPixels:I

    .line 209
    .local v3, "height2":I
    add-int/lit8 v6, v5, -0x3c

    mul-int/2addr v6, v3

    mul-int/lit8 v7, v5, 0x4

    div-int/2addr v6, v7

    iput v6, p0, Lcom/edutech/appmanage/MainActivity;->height:I

    .line 210
    iget v6, p0, Lcom/edutech/appmanage/MainActivity;->height:I

    mul-int/lit8 v6, v6, 0x5

    div-int/lit8 v6, v6, 0xa

    iput v6, p0, Lcom/edutech/appmanage/MainActivity;->pic_height:I

    .line 211
    iget v6, p0, Lcom/edutech/appmanage/MainActivity;->pic_height:I

    iput v6, p0, Lcom/edutech/appmanage/MainActivity;->pic_width:I

    .line 213
    const v6, 0x7f0a01da

    invoke-virtual {p0, v6}, Lcom/edutech/appmanage/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/GridView;

    iput-object v6, p0, Lcom/edutech/appmanage/MainActivity;->gv:Landroid/widget/GridView;

    .line 214
    new-instance v6, Landroid/app/ProgressDialog;

    invoke-direct {v6, p0}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    iput-object v6, p0, Lcom/edutech/appmanage/MainActivity;->changed_progress:Landroid/app/ProgressDialog;

    .line 215
    iget-object v6, p0, Lcom/edutech/appmanage/MainActivity;->changed_progress:Landroid/app/ProgressDialog;

    invoke-virtual {v6, v8}, Landroid/app/ProgressDialog;->setCancelable(Z)V

    .line 216
    const/4 v6, 0x1

    iput-boolean v6, p0, Lcom/edutech/appmanage/MainActivity;->firststart:Z

    .line 217
    new-instance v6, Landroid/os/Handler;

    invoke-direct {v6}, Landroid/os/Handler;-><init>()V

    iput-object v6, p0, Lcom/edutech/appmanage/MainActivity;->handler:Landroid/os/Handler;

    .line 218
    new-instance v6, Ljava/util/LinkedList;

    invoke-direct {v6}, Ljava/util/LinkedList;-><init>()V

    sput-object v6, Lcom/edutech/appmanage/MainActivity;->market_applist:Ljava/util/LinkedList;

    .line 219
    new-instance v6, Ljava/util/LinkedList;

    invoke-direct {v6}, Ljava/util/LinkedList;-><init>()V

    sput-object v6, Lcom/edutech/appmanage/MainActivity;->market_applist_local:Ljava/util/LinkedList;

    .line 222
    invoke-static {}, Lcom/edutech/mobilestudyclient/util/XmlLoadHelper;->loadXml()Ljava/util/HashMap;

    move-result-object v6

    iput-object v6, p0, Lcom/edutech/appmanage/MainActivity;->hashmap:Ljava/util/HashMap;

    .line 223
    iget-object v6, p0, Lcom/edutech/appmanage/MainActivity;->hashmap:Ljava/util/HashMap;

    const-string/jumbo v7, "ip"

    invoke-virtual {v6, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    iput-object v6, p0, Lcom/edutech/appmanage/MainActivity;->ip:Ljava/lang/String;

    .line 224
    iget-object v6, p0, Lcom/edutech/appmanage/MainActivity;->hashmap:Ljava/util/HashMap;

    const-string/jumbo v7, "usercode"

    invoke-virtual {v6, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    iput-object v6, p0, Lcom/edutech/appmanage/MainActivity;->usercode:Ljava/lang/String;

    .line 225
    iget-object v6, p0, Lcom/edutech/appmanage/MainActivity;->hashmap:Ljava/util/HashMap;

    const-string/jumbo v7, "username"

    invoke-virtual {v6, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    iput-object v6, p0, Lcom/edutech/appmanage/MainActivity;->username:Ljava/lang/String;

    .line 226
    const-string/jumbo v6, "AppmanageMainActivity"

    new-instance v7, Ljava/lang/StringBuilder;

    const-string/jumbo v8, "usercode=222=="

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v8, p0, Lcom/edutech/appmanage/MainActivity;->usercode:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v8, ","

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/edutech/appmanage/MainActivity;->ip:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v8, ","

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/edutech/appmanage/MainActivity;->username:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 227
    iget-object v6, p0, Lcom/edutech/appmanage/MainActivity;->hashmap:Ljava/util/HashMap;

    const-string/jumbo v7, "password"

    invoke-virtual {v6, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    iput-object v6, p0, Lcom/edutech/appmanage/MainActivity;->password:Ljava/lang/String;

    .line 228
    iget-object v6, p0, Lcom/edutech/appmanage/MainActivity;->hashmap:Ljava/util/HashMap;

    const-string/jumbo v7, "pwd"

    invoke-virtual {v6, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    iput-object v6, p0, Lcom/edutech/appmanage/MainActivity;->pwd:Ljava/lang/String;

    .line 229
    iget-object v6, p0, Lcom/edutech/appmanage/MainActivity;->hashmap:Ljava/util/HashMap;

    const-string/jumbo v7, "privatekey"

    invoke-virtual {v6, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    iput-object v6, p0, Lcom/edutech/appmanage/MainActivity;->privatekey:Ljava/lang/String;

    .line 232
    iget-object v6, p0, Lcom/edutech/appmanage/MainActivity;->gv:Landroid/widget/GridView;

    const/4 v7, 0x3

    invoke-virtual {v6, v7}, Landroid/widget/GridView;->setNumColumns(I)V

    .line 233
    new-instance v6, Lcom/edutech/appmanage/MainActivity$MyAdapter;

    invoke-direct {v6, p0, p0}, Lcom/edutech/appmanage/MainActivity$MyAdapter;-><init>(Lcom/edutech/appmanage/MainActivity;Landroid/content/Context;)V

    iput-object v6, p0, Lcom/edutech/appmanage/MainActivity;->adapter:Lcom/edutech/appmanage/MainActivity$MyAdapter;

    .line 234
    iget-object v6, p0, Lcom/edutech/appmanage/MainActivity;->gv:Landroid/widget/GridView;

    iget-object v7, p0, Lcom/edutech/appmanage/MainActivity;->adapter:Lcom/edutech/appmanage/MainActivity$MyAdapter;

    invoke-virtual {v6, v7}, Landroid/widget/GridView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 235
    iget-object v6, p0, Lcom/edutech/appmanage/MainActivity;->ip:Ljava/lang/String;

    if-eqz v6, :cond_0

    iget-object v6, p0, Lcom/edutech/appmanage/MainActivity;->ip:Ljava/lang/String;

    const-string/jumbo v7, ""

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_0

    iget-object v6, p0, Lcom/edutech/appmanage/MainActivity;->username:Ljava/lang/String;

    if-eqz v6, :cond_0

    iget-object v6, p0, Lcom/edutech/appmanage/MainActivity;->username:Ljava/lang/String;

    const-string/jumbo v7, ""

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_0

    .line 237
    new-instance v6, Ljava/lang/Thread;

    iget-object v7, p0, Lcom/edutech/appmanage/MainActivity;->runnable_GetConfig_Infor:Ljava/lang/Runnable;

    invoke-direct {v6, v7}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v6}, Ljava/lang/Thread;->start()V

    .line 239
    :cond_0
    new-instance v6, Lcom/edutech/appmanage/MainActivity$CompleteReceiver;

    invoke-direct {v6, p0}, Lcom/edutech/appmanage/MainActivity$CompleteReceiver;-><init>(Lcom/edutech/appmanage/MainActivity;)V

    iput-object v6, p0, Lcom/edutech/appmanage/MainActivity;->completeReceiver:Lcom/edutech/appmanage/MainActivity$CompleteReceiver;

    .line 240
    new-instance v6, Lcom/edutech/appmanage/MainActivity$GetBroadcast;

    invoke-direct {v6, p0}, Lcom/edutech/appmanage/MainActivity$GetBroadcast;-><init>(Lcom/edutech/appmanage/MainActivity;)V

    iput-object v6, p0, Lcom/edutech/appmanage/MainActivity;->getbroadcast:Lcom/edutech/appmanage/MainActivity$GetBroadcast;

    .line 241
    new-instance v1, Landroid/content/IntentFilter;

    invoke-direct {v1}, Landroid/content/IntentFilter;-><init>()V

    .line 243
    .local v1, "filter":Landroid/content/IntentFilter;
    const-string/jumbo v6, "android.intent.action.PACKAGE_ADDED"

    invoke-virtual {v1, v6}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 244
    const-string/jumbo v6, "android.intent.action.PACKAGE_REMOVED"

    invoke-virtual {v1, v6}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 245
    const-string/jumbo v6, "android.intent.action.PACKAGE_REPLACED"

    invoke-virtual {v1, v6}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 246
    const-string/jumbo v6, "package"

    invoke-virtual {v1, v6}, Landroid/content/IntentFilter;->addDataScheme(Ljava/lang/String;)V

    .line 247
    iget-object v6, p0, Lcom/edutech/appmanage/MainActivity;->getbroadcast:Lcom/edutech/appmanage/MainActivity$GetBroadcast;

    invoke-virtual {p0, v6, v1}, Lcom/edutech/appmanage/MainActivity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 248
    new-instance v6, Lcom/edutech/appmanage/MainActivity$CompleteReceiver;

    invoke-direct {v6, p0}, Lcom/edutech/appmanage/MainActivity$CompleteReceiver;-><init>(Lcom/edutech/appmanage/MainActivity;)V

    iput-object v6, p0, Lcom/edutech/appmanage/MainActivity;->completereceiver:Lcom/edutech/appmanage/MainActivity$CompleteReceiver;

    .line 249
    new-instance v2, Landroid/content/IntentFilter;

    invoke-direct {v2}, Landroid/content/IntentFilter;-><init>()V

    .line 251
    .local v2, "filters":Landroid/content/IntentFilter;
    const-string/jumbo v6, "android.intent.action.DOWNLOAD_COMPLETE"

    invoke-virtual {v2, v6}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 252
    iget-object v6, p0, Lcom/edutech/appmanage/MainActivity;->completereceiver:Lcom/edutech/appmanage/MainActivity$CompleteReceiver;

    invoke-virtual {p0, v6, v2}, Lcom/edutech/appmanage/MainActivity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 264
    return-void
.end method

.method protected onDestroy()V
    .locals 6

    .prologue
    .line 1152
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 1154
    iget-object v3, p0, Lcom/edutech/appmanage/MainActivity;->getbroadcast:Lcom/edutech/appmanage/MainActivity$GetBroadcast;

    invoke-virtual {p0, v3}, Lcom/edutech/appmanage/MainActivity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 1155
    iget-object v3, p0, Lcom/edutech/appmanage/MainActivity;->completereceiver:Lcom/edutech/appmanage/MainActivity$CompleteReceiver;

    invoke-virtual {p0, v3}, Lcom/edutech/appmanage/MainActivity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 1156
    const/4 v3, 0x0

    iput-boolean v3, p0, Lcom/edutech/appmanage/MainActivity;->isrun:Z

    .line 1157
    iget-object v3, p0, Lcom/edutech/appmanage/MainActivity;->changed_progress:Landroid/app/ProgressDialog;

    invoke-virtual {v3}, Landroid/app/ProgressDialog;->dismiss()V

    .line 1158
    new-instance v2, Landroid/content/Intent;

    const-class v3, Lcom/edutech/appmanage/utils/Delete_APKfile;

    invoke-direct {v2, p0, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 1159
    .local v2, "intent":Landroid/content/Intent;
    sget-object v3, Lcom/edutech/appmanage/MainActivity;->delete_apkfile:Ljava/util/ArrayList;

    if-eqz v3, :cond_0

    .line 1160
    const-string/jumbo v3, "deletefile"

    sget-object v4, Lcom/edutech/appmanage/MainActivity;->delete_apkfile:Ljava/util/ArrayList;

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->putStringArrayListExtra(Ljava/lang/String;Ljava/util/ArrayList;)Landroid/content/Intent;

    .line 1173
    :cond_0
    const-string/jumbo v3, "deleteicon"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v5

    .line 1174
    invoke-virtual {v5}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1175
    sget-char v5, Ljava/io/File;->separatorChar:C

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 1176
    sget-object v5, Lcom/edutech/appmanage/MainActivity;->FOLDER_MAIN:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 1177
    sget-char v5, Ljava/io/File;->separatorChar:C

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "icon"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 1173
    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1179
    sget-object v3, Lcom/edutech/appmanage/HttpHelper;->install_num:Ljava/util/ArrayList;

    if-eqz v3, :cond_1

    .line 1180
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 1181
    .local v0, "apk_list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    sget-object v3, Lcom/edutech/appmanage/HttpHelper;->install_num:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-lt v1, v3, :cond_2

    .line 1185
    const-string/jumbo v3, "install"

    invoke-virtual {v2, v3, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 1187
    .end local v0    # "apk_list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v1    # "i":I
    :cond_1
    const-string/jumbo v3, "deleteapks"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v5

    .line 1188
    invoke-virtual {v5}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-char v5, Ljava/io/File;->separatorChar:C

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    sget-object v5, Lcom/edutech/appmanage/MainActivity;->FOLDER_MAIN:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 1187
    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1190
    invoke-virtual {p0, v2}, Lcom/edutech/appmanage/MainActivity;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 1191
    return-void

    .line 1182
    .restart local v0    # "apk_list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .restart local v1    # "i":I
    :cond_2
    sget-object v3, Lcom/edutech/appmanage/HttpHelper;->install_num:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map;

    .line 1183
    const-string/jumbo v4, "apkname"

    .line 1182
    invoke-interface {v3, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1181
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 1
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 2372
    const/4 v0, 0x1

    return v0
.end method

.method protected onResume()V
    .locals 8

    .prologue
    const/16 v7, 0x8

    const/4 v6, 0x2

    const/4 v5, 0x0

    .line 1196
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 1198
    iget-boolean v2, p0, Lcom/edutech/appmanage/MainActivity;->firststart:Z

    if-eqz v2, :cond_1

    .line 1199
    iput-boolean v5, p0, Lcom/edutech/appmanage/MainActivity;->firststart:Z

    .line 1289
    :cond_0
    :goto_0
    return-void

    .line 1201
    :cond_1
    iput-boolean v5, p0, Lcom/edutech/appmanage/MainActivity;->toast_unlink:Z

    .line 1202
    invoke-static {}, Lcom/edutech/mobilestudyclient/util/XmlLoadHelper;->loadXml()Ljava/util/HashMap;

    move-result-object v2

    iput-object v2, p0, Lcom/edutech/appmanage/MainActivity;->hashmap:Ljava/util/HashMap;

    .line 1207
    iget-object v2, p0, Lcom/edutech/appmanage/MainActivity;->hashmap:Ljava/util/HashMap;

    if-eqz v2, :cond_3

    iget-object v2, p0, Lcom/edutech/appmanage/MainActivity;->ip:Ljava/lang/String;

    if-eqz v2, :cond_3

    iget-object v2, p0, Lcom/edutech/appmanage/MainActivity;->usercode:Ljava/lang/String;

    if-eqz v2, :cond_3

    iget-object v2, p0, Lcom/edutech/appmanage/MainActivity;->password:Ljava/lang/String;

    if-eqz v2, :cond_3

    iget-object v2, p0, Lcom/edutech/appmanage/MainActivity;->hashmap:Ljava/util/HashMap;

    const-string/jumbo v3, "ip"

    invoke-virtual {v2, v3}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    iget-object v2, p0, Lcom/edutech/appmanage/MainActivity;->hashmap:Ljava/util/HashMap;

    const-string/jumbo v3, "usercode"

    invoke-virtual {v2, v3}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    iget-object v2, p0, Lcom/edutech/appmanage/MainActivity;->hashmap:Ljava/util/HashMap;

    const-string/jumbo v3, "password"

    invoke-virtual {v2, v3}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 1208
    iget-object v2, p0, Lcom/edutech/appmanage/MainActivity;->hashmap:Ljava/util/HashMap;

    const-string/jumbo v3, "pwd"

    invoke-virtual {v2, v3}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    iget-object v2, p0, Lcom/edutech/appmanage/MainActivity;->ip:Ljava/lang/String;

    iget-object v3, p0, Lcom/edutech/appmanage/MainActivity;->hashmap:Ljava/util/HashMap;

    const-string/jumbo v4, "ip"

    invoke-virtual {v3, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 1209
    iget-object v2, p0, Lcom/edutech/appmanage/MainActivity;->usercode:Ljava/lang/String;

    iget-object v3, p0, Lcom/edutech/appmanage/MainActivity;->hashmap:Ljava/util/HashMap;

    const-string/jumbo v4, "usercode"

    invoke-virtual {v3, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 1210
    iget-object v2, p0, Lcom/edutech/appmanage/MainActivity;->password:Ljava/lang/String;

    iget-object v3, p0, Lcom/edutech/appmanage/MainActivity;->hashmap:Ljava/util/HashMap;

    const-string/jumbo v4, "password"

    invoke-virtual {v3, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    iget-object v2, p0, Lcom/edutech/appmanage/MainActivity;->pwd:Ljava/lang/String;

    .line 1211
    iget-object v3, p0, Lcom/edutech/appmanage/MainActivity;->hashmap:Ljava/util/HashMap;

    const-string/jumbo v4, "pwd"

    invoke-virtual {v3, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3

    .line 1212
    :cond_2
    iput-boolean v5, p0, Lcom/edutech/appmanage/MainActivity;->data_load:Z

    .line 1213
    iput-boolean v5, p0, Lcom/edutech/appmanage/MainActivity;->pic_load:Z

    .line 1215
    iget-object v2, p0, Lcom/edutech/appmanage/MainActivity;->hashmap:Ljava/util/HashMap;

    const-string/jumbo v3, "ip"

    invoke-virtual {v2, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    iput-object v2, p0, Lcom/edutech/appmanage/MainActivity;->ip:Ljava/lang/String;

    .line 1216
    iget-object v2, p0, Lcom/edutech/appmanage/MainActivity;->hashmap:Ljava/util/HashMap;

    const-string/jumbo v3, "usercode"

    invoke-virtual {v2, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    iput-object v2, p0, Lcom/edutech/appmanage/MainActivity;->usercode:Ljava/lang/String;

    .line 1217
    const-string/jumbo v2, "AppmanageMainActivity"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string/jumbo v4, "usercode=1205=="

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v4, p0, Lcom/edutech/appmanage/MainActivity;->usercode:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1218
    iget-object v2, p0, Lcom/edutech/appmanage/MainActivity;->hashmap:Ljava/util/HashMap;

    const-string/jumbo v3, "password"

    invoke-virtual {v2, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    iput-object v2, p0, Lcom/edutech/appmanage/MainActivity;->password:Ljava/lang/String;

    .line 1219
    iget-object v2, p0, Lcom/edutech/appmanage/MainActivity;->hashmap:Ljava/util/HashMap;

    const-string/jumbo v3, "pwd"

    invoke-virtual {v2, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    iput-object v2, p0, Lcom/edutech/appmanage/MainActivity;->pwd:Ljava/lang/String;

    .line 1220
    iget-object v2, p0, Lcom/edutech/appmanage/MainActivity;->hashmap:Ljava/util/HashMap;

    const-string/jumbo v3, "privatekey"

    invoke-virtual {v2, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    iput-object v2, p0, Lcom/edutech/appmanage/MainActivity;->privatekey:Ljava/lang/String;

    .line 1221
    iget-object v2, p0, Lcom/edutech/appmanage/MainActivity;->ip:Ljava/lang/String;

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/edutech/appmanage/MainActivity;->ip:Ljava/lang/String;

    const-string/jumbo v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    iget-object v2, p0, Lcom/edutech/appmanage/MainActivity;->username:Ljava/lang/String;

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/edutech/appmanage/MainActivity;->username:Ljava/lang/String;

    const-string/jumbo v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 1223
    new-instance v2, Ljava/lang/Thread;

    iget-object v3, p0, Lcom/edutech/appmanage/MainActivity;->runnable_GetConfig_Infor:Ljava/lang/Runnable;

    invoke-direct {v2, v3}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    goto/16 :goto_0

    .line 1229
    :cond_3
    const-string/jumbo v2, "connectivity"

    invoke-virtual {p0, v2}, Lcom/edutech/appmanage/MainActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    .line 1231
    .local v0, "manager":Landroid/net/ConnectivityManager;
    const/4 v2, 0x1

    .line 1230
    invoke-virtual {v0, v2}, Landroid/net/ConnectivityManager;->getNetworkInfo(I)Landroid/net/NetworkInfo;

    move-result-object v2

    .line 1231
    invoke-virtual {v2}, Landroid/net/NetworkInfo;->getState()Landroid/net/NetworkInfo$State;

    move-result-object v1

    .line 1232
    .local v1, "wifi":Landroid/net/NetworkInfo$State;
    sget-object v2, Landroid/net/NetworkInfo$State;->CONNECTED:Landroid/net/NetworkInfo$State;

    if-ne v1, v2, :cond_8

    .line 1234
    iget v2, p0, Lcom/edutech/appmanage/MainActivity;->login_res:I

    if-eqz v2, :cond_7

    .line 1235
    const/4 v2, -0x1

    iget v3, p0, Lcom/edutech/appmanage/MainActivity;->login_res:I

    if-ne v2, v3, :cond_5

    .line 1238
    iget-object v2, p0, Lcom/edutech/appmanage/MainActivity;->wrong_handler:Landroid/os/Handler;

    invoke-virtual {v2, v6}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 1248
    :cond_4
    :goto_1
    invoke-static {}, Lcom/edutech/appmanage/utils/SharedPreferencesHelper;->load_info()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/edutech/appmanage/MainActivity;->unlink_parse(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 1239
    :cond_5
    iget v2, p0, Lcom/edutech/appmanage/MainActivity;->login_res:I

    if-ne v6, v2, :cond_6

    .line 1242
    iget-object v2, p0, Lcom/edutech/appmanage/MainActivity;->wrong_handler:Landroid/os/Handler;

    invoke-virtual {v2, v6}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto :goto_1

    .line 1243
    :cond_6
    iget v2, p0, Lcom/edutech/appmanage/MainActivity;->login_res:I

    if-eqz v2, :cond_4

    .line 1246
    iget-object v2, p0, Lcom/edutech/appmanage/MainActivity;->wrong_handler:Landroid/os/Handler;

    invoke-virtual {v2, v6}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto :goto_1

    .line 1251
    :cond_7
    iget-object v2, p0, Lcom/edutech/appmanage/MainActivity;->gv:Landroid/widget/GridView;

    invoke-virtual {v2, v5}, Landroid/widget/GridView;->setVisibility(I)V

    .line 1252
    iget-object v2, p0, Lcom/edutech/appmanage/MainActivity;->wrong_net:Landroid/widget/TextView;

    invoke-virtual {v2, v7}, Landroid/widget/TextView;->setVisibility(I)V

    .line 1253
    iget-object v2, p0, Lcom/edutech/appmanage/MainActivity;->layout_appwarning:Landroid/widget/RelativeLayout;

    invoke-virtual {v2, v7}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 1255
    new-instance v2, Lcom/edutech/appmanage/MainActivity$16;

    invoke-direct {v2, p0}, Lcom/edutech/appmanage/MainActivity$16;-><init>(Lcom/edutech/appmanage/MainActivity;)V

    .line 1277
    invoke-virtual {v2}, Lcom/edutech/appmanage/MainActivity$16;->start()V

    goto/16 :goto_0

    .line 1283
    :cond_8
    invoke-virtual {p0}, Lcom/edutech/appmanage/MainActivity;->parse_json()V

    goto/16 :goto_0
.end method

.method public parse(Ljava/lang/String;)V
    .locals 14
    .param p1, "string"    # Ljava/lang/String;

    .prologue
    .line 737
    new-instance v6, Lorg/json/JSONTokener;

    invoke-direct {v6, p1}, Lorg/json/JSONTokener;-><init>(Ljava/lang/String;)V

    .line 739
    .local v6, "jsonparse":Lorg/json/JSONTokener;
    :try_start_0
    invoke-virtual {v6}, Lorg/json/JSONTokener;->nextValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/json/JSONObject;

    .line 740
    .local v0, "all_infor":Lorg/json/JSONObject;
    const-string/jumbo v10, "data"

    invoke-virtual {v0, v10}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v5

    .line 741
    .local v5, "jo":Lorg/json/JSONObject;
    const-string/jumbo v10, "app"

    invoke-virtual {v5, v10}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v2

    .line 743
    .local v2, "data":Lorg/json/JSONArray;
    new-instance v10, Ljava/util/LinkedList;

    invoke-direct {v10}, Ljava/util/LinkedList;-><init>()V

    sput-object v10, Lcom/edutech/appmanage/MainActivity;->market_applist:Ljava/util/LinkedList;

    .line 744
    new-instance v10, Ljava/util/LinkedList;

    invoke-direct {v10}, Ljava/util/LinkedList;-><init>()V

    sput-object v10, Lcom/edutech/appmanage/MainActivity;->market_applist_local:Ljava/util/LinkedList;

    .line 745
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v10

    if-lt v4, v10, :cond_0

    .line 780
    .end local v0    # "all_infor":Lorg/json/JSONObject;
    .end local v2    # "data":Lorg/json/JSONArray;
    .end local v4    # "i":I
    .end local v5    # "jo":Lorg/json/JSONObject;
    :goto_1
    sget-object v10, Lcom/edutech/appmanage/MainActivity;->market_applist:Ljava/util/LinkedList;

    invoke-virtual {v10}, Ljava/util/LinkedList;->size()I

    move-result v10

    if-nez v10, :cond_3

    .line 781
    iget-object v10, p0, Lcom/edutech/appmanage/MainActivity;->wrong_handler:Landroid/os/Handler;

    const/4 v11, 0x3

    invoke-virtual {v10, v11}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 782
    iget-object v10, p0, Lcom/edutech/appmanage/MainActivity;->progress_handler:Landroid/os/Handler;

    const/4 v11, 0x2

    invoke-virtual {v10, v11}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 783
    iget-object v10, p0, Lcom/edutech/appmanage/MainActivity;->handler:Landroid/os/Handler;

    iget-object v11, p0, Lcom/edutech/appmanage/MainActivity;->runnableUi:Ljava/lang/Runnable;

    invoke-virtual {v10, v11}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 861
    :goto_2
    return-void

    .line 746
    .restart local v0    # "all_infor":Lorg/json/JSONObject;
    .restart local v2    # "data":Lorg/json/JSONArray;
    .restart local v4    # "i":I
    .restart local v5    # "jo":Lorg/json/JSONObject;
    :cond_0
    :try_start_1
    new-instance v8, Lcom/edutech/appmanage/MainActivity$AppInfo;

    invoke-direct {v8, p0}, Lcom/edutech/appmanage/MainActivity$AppInfo;-><init>(Lcom/edutech/appmanage/MainActivity;)V

    .line 747
    .local v8, "tmpInfo":Lcom/edutech/appmanage/MainActivity$AppInfo;
    invoke-virtual {v2, v4}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lorg/json/JSONObject;

    .line 748
    .local v7, "tmp":Lorg/json/JSONObject;
    const-string/jumbo v10, "apptype"

    invoke-virtual {v7, v10}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 750
    .local v9, "type":Ljava/lang/String;
    invoke-static {v9}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v10

    iput v10, v8, Lcom/edutech/appmanage/MainActivity$AppInfo;->apptype:I

    .line 753
    const-string/jumbo v10, "apkname"

    invoke-virtual {v7, v10}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    iput-object v10, v8, Lcom/edutech/appmanage/MainActivity$AppInfo;->apkname:Ljava/lang/String;

    .line 754
    const-string/jumbo v10, "appname"

    invoke-virtual {v7, v10}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    iput-object v10, v8, Lcom/edutech/appmanage/MainActivity$AppInfo;->appname:Ljava/lang/String;

    .line 755
    const-string/jumbo v10, "packagename"

    invoke-virtual {v7, v10}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    iput-object v10, v8, Lcom/edutech/appmanage/MainActivity$AppInfo;->packagename:Ljava/lang/String;

    .line 756
    const-string/jumbo v10, ""

    iget-object v11, v8, Lcom/edutech/appmanage/MainActivity$AppInfo;->packagename:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_1

    .line 745
    :goto_3
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 759
    :cond_1
    const-string/jumbo v10, "appsize"

    invoke-virtual {v7, v10}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    iput-object v10, v8, Lcom/edutech/appmanage/MainActivity$AppInfo;->appsize:Ljava/lang/String;

    .line 760
    const-string/jumbo v10, "versioncode"

    invoke-virtual {v7, v10}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 761
    .local v1, "code":Ljava/lang/String;
    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v10

    iput v10, v8, Lcom/edutech/appmanage/MainActivity$AppInfo;->versionCode:I

    .line 762
    const-string/jumbo v10, "versionname"

    invoke-virtual {v7, v10}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v10

    const/16 v11, 0xa

    if-le v10, v11, :cond_2

    .line 763
    new-instance v10, Ljava/lang/StringBuilder;

    const-string/jumbo v11, "versionname"

    invoke-virtual {v7, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 764
    const/4 v12, 0x0

    const/16 v13, 0xa

    invoke-virtual {v11, v12, v13}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v11, "..."

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    .line 763
    iput-object v10, v8, Lcom/edutech/appmanage/MainActivity$AppInfo;->versionName:Ljava/lang/String;

    .line 767
    :goto_4
    const-string/jumbo v10, "webpath"

    invoke-virtual {v7, v10}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    iput-object v10, v8, Lcom/edutech/appmanage/MainActivity$AppInfo;->webpath:Ljava/lang/String;

    .line 768
    const-string/jumbo v10, "iconurl"

    invoke-virtual {v7, v10}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    iput-object v10, v8, Lcom/edutech/appmanage/MainActivity$AppInfo;->iconurl:Ljava/lang/String;

    .line 769
    sget-object v10, Lcom/edutech/appmanage/MainActivity;->market_applist:Ljava/util/LinkedList;

    invoke-virtual {v10, v8}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 771
    sget-object v10, Lcom/edutech/appmanage/MainActivity;->market_applist_local:Ljava/util/LinkedList;

    invoke-virtual {v10, v8}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_3

    .line 776
    .end local v0    # "all_infor":Lorg/json/JSONObject;
    .end local v1    # "code":Ljava/lang/String;
    .end local v2    # "data":Lorg/json/JSONArray;
    .end local v4    # "i":I
    .end local v5    # "jo":Lorg/json/JSONObject;
    .end local v7    # "tmp":Lorg/json/JSONObject;
    .end local v8    # "tmpInfo":Lcom/edutech/appmanage/MainActivity$AppInfo;
    .end local v9    # "type":Ljava/lang/String;
    :catch_0
    move-exception v3

    .line 778
    .local v3, "e":Lorg/json/JSONException;
    invoke-virtual {v3}, Lorg/json/JSONException;->printStackTrace()V

    goto/16 :goto_1

    .line 766
    .end local v3    # "e":Lorg/json/JSONException;
    .restart local v0    # "all_infor":Lorg/json/JSONObject;
    .restart local v1    # "code":Ljava/lang/String;
    .restart local v2    # "data":Lorg/json/JSONArray;
    .restart local v4    # "i":I
    .restart local v5    # "jo":Lorg/json/JSONObject;
    .restart local v7    # "tmp":Lorg/json/JSONObject;
    .restart local v8    # "tmpInfo":Lcom/edutech/appmanage/MainActivity$AppInfo;
    .restart local v9    # "type":Ljava/lang/String;
    :cond_2
    :try_start_2
    const-string/jumbo v10, "versionname"

    invoke-virtual {v7, v10}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    iput-object v10, v8, Lcom/edutech/appmanage/MainActivity$AppInfo;->versionName:Ljava/lang/String;
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_4

    .line 785
    .end local v0    # "all_infor":Lorg/json/JSONObject;
    .end local v1    # "code":Ljava/lang/String;
    .end local v2    # "data":Lorg/json/JSONArray;
    .end local v4    # "i":I
    .end local v5    # "jo":Lorg/json/JSONObject;
    .end local v7    # "tmp":Lorg/json/JSONObject;
    .end local v8    # "tmpInfo":Lcom/edutech/appmanage/MainActivity$AppInfo;
    .end local v9    # "type":Ljava/lang/String;
    :cond_3
    iget-object v10, p0, Lcom/edutech/appmanage/MainActivity;->wrong_net:Landroid/widget/TextView;

    const/16 v11, 0x8

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setVisibility(I)V

    .line 786
    iget-object v10, p0, Lcom/edutech/appmanage/MainActivity;->layout_appwarning:Landroid/widget/RelativeLayout;

    const/16 v11, 0x8

    invoke-virtual {v10, v11}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 787
    iget-object v10, p0, Lcom/edutech/appmanage/MainActivity;->gv:Landroid/widget/GridView;

    const/4 v11, 0x0

    invoke-virtual {v10, v11}, Landroid/widget/GridView;->setVisibility(I)V

    .line 788
    new-instance v10, Lcom/edutech/appmanage/MainActivity$13;

    invoke-direct {v10, p0}, Lcom/edutech/appmanage/MainActivity$13;-><init>(Lcom/edutech/appmanage/MainActivity;)V

    .line 851
    invoke-virtual {v10}, Lcom/edutech/appmanage/MainActivity$13;->start()V

    .line 856
    invoke-virtual {p0}, Lcom/edutech/appmanage/MainActivity;->compare()V

    .line 858
    iget-object v10, p0, Lcom/edutech/appmanage/MainActivity;->progress_handler:Landroid/os/Handler;

    const/4 v11, 0x2

    invoke-virtual {v10, v11}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 859
    iget-object v10, p0, Lcom/edutech/appmanage/MainActivity;->handler:Landroid/os/Handler;

    iget-object v11, p0, Lcom/edutech/appmanage/MainActivity;->runnableUi:Ljava/lang/Runnable;

    invoke-virtual {v10, v11}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto/16 :goto_2
.end method

.method public declared-synchronized parse_json()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    .line 623
    monitor-enter p0

    :try_start_0
    const-string/jumbo v2, "connectivity"

    invoke-virtual {p0, v2}, Lcom/edutech/appmanage/MainActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    .line 624
    .local v0, "manager":Landroid/net/ConnectivityManager;
    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Landroid/net/ConnectivityManager;->getNetworkInfo(I)Landroid/net/NetworkInfo;

    move-result-object v2

    .line 625
    invoke-virtual {v2}, Landroid/net/NetworkInfo;->getState()Landroid/net/NetworkInfo$State;

    move-result-object v1

    .line 626
    .local v1, "wifi":Landroid/net/NetworkInfo$State;
    sget-object v2, Landroid/net/NetworkInfo$State;->CONNECTED:Landroid/net/NetworkInfo$State;

    if-ne v1, v2, :cond_4

    .line 627
    iget v2, p0, Lcom/edutech/appmanage/MainActivity;->login_res:I

    if-eqz v2, :cond_3

    .line 628
    const/4 v2, -0x1

    iget v3, p0, Lcom/edutech/appmanage/MainActivity;->login_res:I

    if-ne v2, v3, :cond_1

    .line 629
    iget-object v2, p0, Lcom/edutech/appmanage/MainActivity;->wrong_handler:Landroid/os/Handler;

    const/4 v3, 0x2

    invoke-virtual {v2, v3}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 635
    :cond_0
    :goto_0
    invoke-static {}, Lcom/edutech/appmanage/utils/SharedPreferencesHelper;->load_info()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/edutech/appmanage/MainActivity;->unlink_parse(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 645
    .end local v0    # "manager":Landroid/net/ConnectivityManager;
    .end local v1    # "wifi":Landroid/net/NetworkInfo$State;
    :goto_1
    monitor-exit p0

    return-void

    .line 630
    .restart local v0    # "manager":Landroid/net/ConnectivityManager;
    .restart local v1    # "wifi":Landroid/net/NetworkInfo$State;
    :cond_1
    :try_start_1
    iget v2, p0, Lcom/edutech/appmanage/MainActivity;->login_res:I

    if-ne v4, v2, :cond_2

    .line 631
    iget-object v2, p0, Lcom/edutech/appmanage/MainActivity;->wrong_handler:Landroid/os/Handler;

    const/4 v3, 0x2

    invoke-virtual {v2, v3}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto :goto_0

    .line 642
    .end local v0    # "manager":Landroid/net/ConnectivityManager;
    .end local v1    # "wifi":Landroid/net/NetworkInfo$State;
    :catch_0
    move-exception v2

    goto :goto_1

    .line 632
    .restart local v0    # "manager":Landroid/net/ConnectivityManager;
    .restart local v1    # "wifi":Landroid/net/NetworkInfo$State;
    :cond_2
    iget v2, p0, Lcom/edutech/appmanage/MainActivity;->login_res:I

    if-eqz v2, :cond_0

    .line 633
    iget-object v2, p0, Lcom/edutech/appmanage/MainActivity;->wrong_handler:Landroid/os/Handler;

    const/4 v3, 0x2

    invoke-virtual {v2, v3}, Landroid/os/Handler;->sendEmptyMessage(I)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 623
    .end local v0    # "manager":Landroid/net/ConnectivityManager;
    .end local v1    # "wifi":Landroid/net/NetworkInfo$State;
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2

    .line 638
    .restart local v0    # "manager":Landroid/net/ConnectivityManager;
    .restart local v1    # "wifi":Landroid/net/NetworkInfo$State;
    :cond_3
    :try_start_2
    invoke-static {}, Lcom/edutech/appmanage/utils/SharedPreferencesHelper;->load_info()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/edutech/appmanage/MainActivity;->parse(Ljava/lang/String;)V

    goto :goto_1

    .line 640
    :cond_4
    invoke-static {}, Lcom/edutech/appmanage/utils/SharedPreferencesHelper;->load_info()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/edutech/appmanage/MainActivity;->unlink_parse(Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1
.end method

.method public parse_studentid(Ljava/lang/String;)Ljava/lang/String;
    .locals 7
    .param p1, "res"    # Ljava/lang/String;

    .prologue
    .line 554
    const/4 v5, 0x0

    .line 555
    .local v5, "type":Ljava/lang/String;
    new-instance v4, Lorg/json/JSONTokener;

    invoke-direct {v4, p1}, Lorg/json/JSONTokener;-><init>(Ljava/lang/String;)V

    .line 557
    .local v4, "jsonparse":Lorg/json/JSONTokener;
    :try_start_0
    invoke-virtual {v4}, Lorg/json/JSONTokener;->nextValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/json/JSONObject;

    .line 558
    .local v0, "all_infor":Lorg/json/JSONObject;
    const-string/jumbo v6, "errorNum"

    invoke-virtual {v0, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 559
    .local v2, "err":Ljava/lang/String;
    const-string/jumbo v6, "0"

    invoke-virtual {v6, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_0

    .line 560
    const/4 v6, 0x0

    .line 567
    .end local v0    # "all_infor":Lorg/json/JSONObject;
    .end local v2    # "err":Ljava/lang/String;
    :goto_0
    return-object v6

    .line 561
    .restart local v0    # "all_infor":Lorg/json/JSONObject;
    .restart local v2    # "err":Ljava/lang/String;
    :cond_0
    const-string/jumbo v6, "data"

    invoke-virtual {v0, v6}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    .line 562
    .local v3, "jo":Lorg/json/JSONObject;
    const-string/jumbo v6, "studentid"

    invoke-virtual {v3, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v5

    .end local v0    # "all_infor":Lorg/json/JSONObject;
    .end local v2    # "err":Ljava/lang/String;
    .end local v3    # "jo":Lorg/json/JSONObject;
    :goto_1
    move-object v6, v5

    .line 567
    goto :goto_0

    .line 563
    :catch_0
    move-exception v1

    .line 565
    .local v1, "e":Lorg/json/JSONException;
    invoke-virtual {v1}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_1
.end method

.method public shared_getinfo(Ljava/lang/String;)V
    .locals 6
    .param p1, "dir"    # Ljava/lang/String;

    .prologue
    .line 572
    const/4 v1, 0x0

    .line 573
    .local v1, "data":Ljava/lang/String;
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    .line 576
    .local v4, "sb":Ljava/lang/StringBuffer;
    :try_start_0
    new-instance v0, Ljava/io/BufferedReader;

    new-instance v5, Ljava/io/FileReader;

    invoke-direct {v5, p1}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v5}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 577
    .local v0, "br":Ljava/io/BufferedReader;
    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v1

    .line 578
    :goto_0
    if-nez v1, :cond_0

    .line 589
    .end local v0    # "br":Ljava/io/BufferedReader;
    :goto_1
    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    .line 590
    .local v3, "res":Ljava/lang/String;
    invoke-static {v3}, Lcom/edutech/appmanage/utils/SharedPreferencesHelper;->save_info(Ljava/lang/String;)V

    .line 591
    return-void

    .line 579
    .end local v3    # "res":Ljava/lang/String;
    .restart local v0    # "br":Ljava/io/BufferedReader;
    :cond_0
    :try_start_1
    invoke-virtual {v4, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 580
    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v1

    goto :goto_0

    .line 582
    .end local v0    # "br":Ljava/io/BufferedReader;
    :catch_0
    move-exception v2

    .line 584
    .local v2, "e":Ljava/io/FileNotFoundException;
    invoke-virtual {v2}, Ljava/io/FileNotFoundException;->printStackTrace()V

    goto :goto_1

    .line 585
    .end local v2    # "e":Ljava/io/FileNotFoundException;
    :catch_1
    move-exception v2

    .line 587
    .local v2, "e":Ljava/io/IOException;
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_1
.end method

.method public toast(Ljava/lang/String;)V
    .locals 1
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 3221
    new-instance v0, Lcom/edutech/appmanage/MainActivity$19;

    invoke-direct {v0, p0, p1}, Lcom/edutech/appmanage/MainActivity$19;-><init>(Lcom/edutech/appmanage/MainActivity;Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/edutech/appmanage/MainActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 3229
    return-void
.end method

.method public unlink_parse(Ljava/lang/String;)V
    .locals 16
    .param p1, "string"    # Ljava/lang/String;

    .prologue
    .line 649
    new-instance v7, Lorg/json/JSONTokener;

    move-object/from16 v0, p1

    invoke-direct {v7, v0}, Lorg/json/JSONTokener;-><init>(Ljava/lang/String;)V

    .line 653
    .local v7, "jsonparse":Lorg/json/JSONTokener;
    :try_start_0
    invoke-virtual {v7}, Lorg/json/JSONTokener;->nextValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/json/JSONObject;

    .line 654
    .local v1, "all_infor":Lorg/json/JSONObject;
    const-string/jumbo v12, "data"

    invoke-virtual {v1, v12}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v6

    .line 655
    .local v6, "jo":Lorg/json/JSONObject;
    const-string/jumbo v12, "app"

    invoke-virtual {v6, v12}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v3

    .line 657
    .local v3, "data":Lorg/json/JSONArray;
    new-instance v12, Ljava/util/LinkedList;

    invoke-direct {v12}, Ljava/util/LinkedList;-><init>()V

    sput-object v12, Lcom/edutech/appmanage/MainActivity;->market_applist:Ljava/util/LinkedList;

    .line 658
    new-instance v12, Ljava/util/LinkedList;

    invoke-direct {v12}, Ljava/util/LinkedList;-><init>()V

    sput-object v12, Lcom/edutech/appmanage/MainActivity;->market_applist_local:Ljava/util/LinkedList;

    .line 659
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_0
    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v12

    if-lt v5, v12, :cond_2

    .line 701
    .end local v1    # "all_infor":Lorg/json/JSONObject;
    .end local v3    # "data":Lorg/json/JSONArray;
    .end local v5    # "i":I
    .end local v6    # "jo":Lorg/json/JSONObject;
    :goto_1
    sget-object v12, Lcom/edutech/appmanage/MainActivity;->market_applist:Ljava/util/LinkedList;

    new-instance v13, Lcom/edutech/appmanage/MainActivity$12;

    move-object/from16 v0, p0

    invoke-direct {v13, v0}, Lcom/edutech/appmanage/MainActivity$12;-><init>(Lcom/edutech/appmanage/MainActivity;)V

    invoke-static {v12, v13}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 718
    const/4 v12, 0x1

    move-object/from16 v0, p0

    iput-boolean v12, v0, Lcom/edutech/appmanage/MainActivity;->data_load:Z

    .line 719
    const/4 v12, 0x1

    move-object/from16 v0, p0

    iput-boolean v12, v0, Lcom/edutech/appmanage/MainActivity;->pic_load:Z

    .line 720
    move-object/from16 v0, p0

    iget-boolean v12, v0, Lcom/edutech/appmanage/MainActivity;->toast_unlink:Z

    if-nez v12, :cond_1

    .line 721
    sget-object v12, Lcom/edutech/appmanage/MainActivity;->market_applist:Ljava/util/LinkedList;

    invoke-virtual {v12}, Ljava/util/LinkedList;->size()I

    move-result v12

    if-eqz v12, :cond_0

    .line 722
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/edutech/appmanage/MainActivity;->unlink_handler:Landroid/os/Handler;

    const/4 v13, 0x2

    invoke-virtual {v12, v13}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 724
    :cond_0
    const/4 v12, 0x1

    move-object/from16 v0, p0

    iput-boolean v12, v0, Lcom/edutech/appmanage/MainActivity;->toast_unlink:Z

    .line 726
    :cond_1
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/edutech/appmanage/MainActivity;->unlink_handler:Landroid/os/Handler;

    const/4 v13, 0x1

    invoke-virtual {v12, v13}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 727
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/edutech/appmanage/MainActivity;->progress_handler:Landroid/os/Handler;

    const/4 v13, 0x2

    invoke-virtual {v12, v13}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 728
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/edutech/appmanage/MainActivity;->handler:Landroid/os/Handler;

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/edutech/appmanage/MainActivity;->runnableUi:Ljava/lang/Runnable;

    invoke-virtual {v12, v13}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 729
    return-void

    .line 660
    .restart local v1    # "all_infor":Lorg/json/JSONObject;
    .restart local v3    # "data":Lorg/json/JSONArray;
    .restart local v5    # "i":I
    .restart local v6    # "jo":Lorg/json/JSONObject;
    :cond_2
    :try_start_1
    new-instance v10, Lcom/edutech/appmanage/MainActivity$AppInfo;

    move-object/from16 v0, p0

    invoke-direct {v10, v0}, Lcom/edutech/appmanage/MainActivity$AppInfo;-><init>(Lcom/edutech/appmanage/MainActivity;)V

    .line 661
    .local v10, "tmpInfo":Lcom/edutech/appmanage/MainActivity$AppInfo;
    invoke-virtual {v3, v5}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lorg/json/JSONObject;

    .line 662
    .local v9, "tmp":Lorg/json/JSONObject;
    const-string/jumbo v12, "apptype"

    invoke-virtual {v9, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 663
    .local v11, "type":Ljava/lang/String;
    invoke-static {v11}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v12

    iput v12, v10, Lcom/edutech/appmanage/MainActivity$AppInfo;->apptype:I

    .line 664
    const-string/jumbo v12, "apkname"

    invoke-virtual {v9, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    iput-object v12, v10, Lcom/edutech/appmanage/MainActivity$AppInfo;->apkname:Ljava/lang/String;

    .line 665
    const-string/jumbo v12, "appname"

    invoke-virtual {v9, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    iput-object v12, v10, Lcom/edutech/appmanage/MainActivity$AppInfo;->appname:Ljava/lang/String;

    .line 666
    const-string/jumbo v12, "packagename"

    invoke-virtual {v9, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    iput-object v12, v10, Lcom/edutech/appmanage/MainActivity$AppInfo;->packagename:Ljava/lang/String;

    .line 667
    const-string/jumbo v12, ""

    iget-object v13, v10, Lcom/edutech/appmanage/MainActivity$AppInfo;->packagename:Ljava/lang/String;

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    move-result v12

    if-eqz v12, :cond_4

    .line 659
    :cond_3
    :goto_2
    add-int/lit8 v5, v5, 0x1

    goto/16 :goto_0

    .line 671
    :cond_4
    :try_start_2
    invoke-virtual/range {p0 .. p0}, Lcom/edutech/appmanage/MainActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v12

    .line 672
    iget-object v13, v10, Lcom/edutech/appmanage/MainActivity$AppInfo;->packagename:Ljava/lang/String;

    const/4 v14, 0x0

    .line 671
    invoke-virtual {v12, v13, v14}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;
    :try_end_2
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_0

    move-result-object v8

    .line 677
    .local v8, "packageInfo":Landroid/content/pm/PackageInfo;
    :goto_3
    if-eqz v8, :cond_3

    .line 678
    const/4 v12, 0x1

    :try_start_3
    iput-boolean v12, v10, Lcom/edutech/appmanage/MainActivity$AppInfo;->islocal:Z

    .line 682
    const-string/jumbo v12, "appsize"

    invoke-virtual {v9, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    iput-object v12, v10, Lcom/edutech/appmanage/MainActivity$AppInfo;->appsize:Ljava/lang/String;

    .line 683
    const-string/jumbo v12, "versioncode"

    invoke-virtual {v9, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 684
    .local v2, "code":Ljava/lang/String;
    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v12

    iput v12, v10, Lcom/edutech/appmanage/MainActivity$AppInfo;->versionCode:I

    .line 685
    const-string/jumbo v12, "versionname"

    invoke-virtual {v9, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/String;->length()I

    move-result v12

    const/16 v13, 0xa

    if-le v12, v13, :cond_5

    .line 686
    new-instance v12, Ljava/lang/StringBuilder;

    const-string/jumbo v13, "versionname"

    invoke-virtual {v9, v13}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 687
    const/4 v14, 0x0

    const/16 v15, 0xa

    invoke-virtual {v13, v14, v15}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    invoke-direct {v12, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v13, "..."

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    .line 686
    iput-object v12, v10, Lcom/edutech/appmanage/MainActivity$AppInfo;->versionName:Ljava/lang/String;

    .line 690
    :goto_4
    const-string/jumbo v12, "webpath"

    invoke-virtual {v9, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    iput-object v12, v10, Lcom/edutech/appmanage/MainActivity$AppInfo;->webpath:Ljava/lang/String;

    .line 691
    const-string/jumbo v12, "iconurl"

    invoke-virtual {v9, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    iput-object v12, v10, Lcom/edutech/appmanage/MainActivity$AppInfo;->iconurl:Ljava/lang/String;

    .line 692
    sget-object v12, Lcom/edutech/appmanage/MainActivity;->market_applist:Ljava/util/LinkedList;

    invoke-virtual {v12, v10}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 693
    sget-object v12, Lcom/edutech/appmanage/MainActivity;->market_applist_local:Ljava/util/LinkedList;

    invoke-virtual {v12, v10}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z
    :try_end_3
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_0

    goto :goto_2

    .line 695
    .end local v1    # "all_infor":Lorg/json/JSONObject;
    .end local v2    # "code":Ljava/lang/String;
    .end local v3    # "data":Lorg/json/JSONArray;
    .end local v5    # "i":I
    .end local v6    # "jo":Lorg/json/JSONObject;
    .end local v8    # "packageInfo":Landroid/content/pm/PackageInfo;
    .end local v9    # "tmp":Lorg/json/JSONObject;
    .end local v10    # "tmpInfo":Lcom/edutech/appmanage/MainActivity$AppInfo;
    .end local v11    # "type":Ljava/lang/String;
    :catch_0
    move-exception v4

    .line 697
    .local v4, "e":Lorg/json/JSONException;
    invoke-virtual {v4}, Lorg/json/JSONException;->printStackTrace()V

    goto/16 :goto_1

    .line 673
    .end local v4    # "e":Lorg/json/JSONException;
    .restart local v1    # "all_infor":Lorg/json/JSONObject;
    .restart local v3    # "data":Lorg/json/JSONArray;
    .restart local v5    # "i":I
    .restart local v6    # "jo":Lorg/json/JSONObject;
    .restart local v9    # "tmp":Lorg/json/JSONObject;
    .restart local v10    # "tmpInfo":Lcom/edutech/appmanage/MainActivity$AppInfo;
    .restart local v11    # "type":Ljava/lang/String;
    :catch_1
    move-exception v4

    .line 674
    .local v4, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    const/4 v8, 0x0

    .line 675
    .restart local v8    # "packageInfo":Landroid/content/pm/PackageInfo;
    :try_start_4
    invoke-virtual {v4}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V

    goto :goto_3

    .line 689
    .end local v4    # "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    .restart local v2    # "code":Ljava/lang/String;
    :cond_5
    const-string/jumbo v12, "versionname"

    invoke-virtual {v9, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    iput-object v12, v10, Lcom/edutech/appmanage/MainActivity$AppInfo;->versionName:Ljava/lang/String;
    :try_end_4
    .catch Lorg/json/JSONException; {:try_start_4 .. :try_end_4} :catch_0

    goto :goto_4
.end method
