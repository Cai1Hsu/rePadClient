.class public Lcom/edutech/appmanage/utils/DownloadManagerPro$RequestPro;
.super Landroid/app/DownloadManager$Request;
.source "DownloadManagerPro.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/edutech/appmanage/utils/DownloadManagerPro;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "RequestPro"
.end annotation


# static fields
.field public static final METHOD_NAME_SET_NOTI_CLASS:Ljava/lang/String; = "setNotiClass"

.field public static final METHOD_NAME_SET_NOTI_EXTRAS:Ljava/lang/String; = "setNotiExtras"

.field private static isInitNotiClass:Z

.field private static isInitNotiExtras:Z

.field private static setNotiClass:Ljava/lang/reflect/Method;

.field private static setNotiExtras:Ljava/lang/reflect/Method;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x0

    .line 304
    sput-boolean v0, Lcom/edutech/appmanage/utils/DownloadManagerPro$RequestPro;->isInitNotiClass:Z

    .line 305
    sput-boolean v0, Lcom/edutech/appmanage/utils/DownloadManagerPro$RequestPro;->isInitNotiExtras:Z

    .line 307
    sput-object v1, Lcom/edutech/appmanage/utils/DownloadManagerPro$RequestPro;->setNotiClass:Ljava/lang/reflect/Method;

    .line 308
    sput-object v1, Lcom/edutech/appmanage/utils/DownloadManagerPro$RequestPro;->setNotiExtras:Ljava/lang/reflect/Method;

    return-void
.end method

.method public constructor <init>(Landroid/net/Uri;)V
    .locals 0
    .param p1, "uri"    # Landroid/net/Uri;

    .prologue
    .line 315
    invoke-direct {p0, p1}, Landroid/app/DownloadManager$Request;-><init>(Landroid/net/Uri;)V

    .line 316
    return-void
.end method


# virtual methods
.method public setNotiClass(Ljava/lang/String;)V
    .locals 6
    .param p1, "className"    # Ljava/lang/String;

    .prologue
    .line 325
    monitor-enter p0

    .line 327
    :try_start_0
    sget-boolean v1, Lcom/edutech/appmanage/utils/DownloadManagerPro$RequestPro;->isInitNotiClass:Z

    if-nez v1, :cond_0

    .line 328
    const/4 v1, 0x1

    sput-boolean v1, Lcom/edutech/appmanage/utils/DownloadManagerPro$RequestPro;->isInitNotiClass:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 330
    :try_start_1
    const-class v1, Landroid/app/DownloadManager$Request;

    .line 331
    const-string/jumbo v2, "setNotiClass"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Class;

    const/4 v4, 0x0

    const-class v5, Ljava/lang/CharSequence;

    aput-object v5, v3, v4

    .line 330
    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    sput-object v1, Lcom/edutech/appmanage/utils/DownloadManagerPro$RequestPro;->setNotiClass:Ljava/lang/reflect/Method;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 325
    :cond_0
    :goto_0
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 339
    sget-object v1, Lcom/edutech/appmanage/utils/DownloadManagerPro$RequestPro;->setNotiClass:Ljava/lang/reflect/Method;

    if-eqz v1, :cond_1

    .line 341
    :try_start_3
    sget-object v1, Lcom/edutech/appmanage/utils/DownloadManagerPro$RequestPro;->setNotiClass:Ljava/lang/reflect/Method;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    invoke-virtual {v1, p0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    .line 351
    :cond_1
    :goto_1
    return-void

    .line 332
    :catch_0
    move-exception v0

    .line 334
    .local v0, "e":Ljava/lang/Exception;
    :try_start_4
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    .line 325
    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v1

    monitor-exit p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    throw v1

    .line 342
    :catch_1
    move-exception v0

    .line 348
    .restart local v0    # "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1
.end method

.method public setNotiExtras(Ljava/lang/String;)V
    .locals 6
    .param p1, "extras"    # Ljava/lang/String;

    .prologue
    .line 359
    monitor-enter p0

    .line 361
    :try_start_0
    sget-boolean v1, Lcom/edutech/appmanage/utils/DownloadManagerPro$RequestPro;->isInitNotiExtras:Z

    if-nez v1, :cond_0

    .line 362
    const/4 v1, 0x1

    sput-boolean v1, Lcom/edutech/appmanage/utils/DownloadManagerPro$RequestPro;->isInitNotiExtras:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 364
    :try_start_1
    const-class v1, Landroid/app/DownloadManager$Request;

    .line 365
    const-string/jumbo v2, "setNotiExtras"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Class;

    const/4 v4, 0x0

    .line 366
    const-class v5, Ljava/lang/CharSequence;

    aput-object v5, v3, v4

    .line 365
    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 364
    sput-object v1, Lcom/edutech/appmanage/utils/DownloadManagerPro$RequestPro;->setNotiExtras:Ljava/lang/reflect/Method;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 359
    :cond_0
    :goto_0
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 374
    sget-object v1, Lcom/edutech/appmanage/utils/DownloadManagerPro$RequestPro;->setNotiExtras:Ljava/lang/reflect/Method;

    if-eqz v1, :cond_1

    .line 376
    :try_start_3
    sget-object v1, Lcom/edutech/appmanage/utils/DownloadManagerPro$RequestPro;->setNotiExtras:Ljava/lang/reflect/Method;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    invoke-virtual {v1, p0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    .line 386
    :cond_1
    :goto_1
    return-void

    .line 367
    :catch_0
    move-exception v0

    .line 369
    .local v0, "e":Ljava/lang/Exception;
    :try_start_4
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    .line 359
    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v1

    monitor-exit p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    throw v1

    .line 377
    :catch_1
    move-exception v0

    .line 383
    .restart local v0    # "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1
.end method
