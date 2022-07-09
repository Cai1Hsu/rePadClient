.class public Lcom/edutech/appmanage/utils/DownloadManagerPro;
.super Ljava/lang/Object;
.source "DownloadManagerPro.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/edutech/appmanage/utils/DownloadManagerPro$RequestPro;
    }
.end annotation


# static fields
.field public static final COLUMN_LOCAL_FILENAME:Ljava/lang/String; = "local_filename"

.field public static final COLUMN_LOCAL_URI:Ljava/lang/String; = "local_uri"

.field public static final CONTENT_URI:Landroid/net/Uri;

.field public static final METHOD_NAME_PAUSE_DOWNLOAD:Ljava/lang/String; = "pauseDownload"

.field public static final METHOD_NAME_RESUME_DOWNLOAD:Ljava/lang/String; = "resumeDownload"

.field private static isInitPauseDownload:Z

.field private static isInitResumeDownload:Z

.field private static pauseDownload:Ljava/lang/reflect/Method;

.field private static resumeDownload:Ljava/lang/reflect/Method;


# instance fields
.field private downloadManager:Landroid/app/DownloadManager;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 45
    const-string/jumbo v0, "content://downloads/my_downloads"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    .line 44
    sput-object v0, Lcom/edutech/appmanage/utils/DownloadManagerPro;->CONTENT_URI:Landroid/net/Uri;

    .line 54
    sput-boolean v1, Lcom/edutech/appmanage/utils/DownloadManagerPro;->isInitPauseDownload:Z

    .line 55
    sput-boolean v1, Lcom/edutech/appmanage/utils/DownloadManagerPro;->isInitResumeDownload:Z

    .line 57
    sput-object v2, Lcom/edutech/appmanage/utils/DownloadManagerPro;->pauseDownload:Ljava/lang/reflect/Method;

    .line 58
    sput-object v2, Lcom/edutech/appmanage/utils/DownloadManagerPro;->resumeDownload:Ljava/lang/reflect/Method;

    return-void
.end method

.method public constructor <init>(Landroid/app/DownloadManager;)V
    .locals 0
    .param p1, "downloadManager"    # Landroid/app/DownloadManager;

    .prologue
    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 63
    iput-object p1, p0, Lcom/edutech/appmanage/utils/DownloadManagerPro;->downloadManager:Landroid/app/DownloadManager;

    .line 64
    return-void
.end method

.method private getInt(JLjava/lang/String;)I
    .locals 7
    .param p1, "downloadId"    # J
    .param p3, "columnName"    # Ljava/lang/String;

    .prologue
    .line 422
    new-instance v3, Landroid/app/DownloadManager$Query;

    invoke-direct {v3}, Landroid/app/DownloadManager$Query;-><init>()V

    const/4 v4, 0x1

    new-array v4, v4, [J

    const/4 v5, 0x0

    .line 423
    aput-wide p1, v4, v5

    invoke-virtual {v3, v4}, Landroid/app/DownloadManager$Query;->setFilterById([J)Landroid/app/DownloadManager$Query;

    move-result-object v1

    .line 424
    .local v1, "query":Landroid/app/DownloadManager$Query;
    const/4 v2, -0x1

    .line 425
    .local v2, "result":I
    const/4 v0, 0x0

    .line 427
    .local v0, "c":Landroid/database/Cursor;
    :try_start_0
    iget-object v3, p0, Lcom/edutech/appmanage/utils/DownloadManagerPro;->downloadManager:Landroid/app/DownloadManager;

    invoke-virtual {v3, v1}, Landroid/app/DownloadManager;->query(Landroid/app/DownloadManager$Query;)Landroid/database/Cursor;

    move-result-object v0

    .line 428
    if-eqz v0, :cond_0

    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 429
    invoke-interface {v0, p3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getInt(I)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v2

    .line 432
    :cond_0
    if-eqz v0, :cond_1

    .line 433
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 436
    :cond_1
    return v2

    .line 431
    :catchall_0
    move-exception v3

    .line 432
    if-eqz v0, :cond_2

    .line 433
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 435
    :cond_2
    throw v3
.end method

.method private getString(JLjava/lang/String;)Ljava/lang/String;
    .locals 7
    .param p1, "downloadId"    # J
    .param p3, "columnName"    # Ljava/lang/String;

    .prologue
    .line 397
    new-instance v3, Landroid/app/DownloadManager$Query;

    invoke-direct {v3}, Landroid/app/DownloadManager$Query;-><init>()V

    const/4 v4, 0x1

    new-array v4, v4, [J

    const/4 v5, 0x0

    .line 398
    aput-wide p1, v4, v5

    invoke-virtual {v3, v4}, Landroid/app/DownloadManager$Query;->setFilterById([J)Landroid/app/DownloadManager$Query;

    move-result-object v1

    .line 399
    .local v1, "query":Landroid/app/DownloadManager$Query;
    const/4 v2, 0x0

    .line 400
    .local v2, "result":Ljava/lang/String;
    const/4 v0, 0x0

    .line 402
    .local v0, "c":Landroid/database/Cursor;
    :try_start_0
    iget-object v3, p0, Lcom/edutech/appmanage/utils/DownloadManagerPro;->downloadManager:Landroid/app/DownloadManager;

    invoke-virtual {v3, v1}, Landroid/app/DownloadManager;->query(Landroid/app/DownloadManager$Query;)Landroid/database/Cursor;

    move-result-object v0

    .line 403
    if-eqz v0, :cond_0

    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 404
    invoke-interface {v0, p3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v2

    .line 407
    :cond_0
    if-eqz v0, :cond_1

    .line 408
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 411
    :cond_1
    return-object v2

    .line 406
    :catchall_0
    move-exception v3

    .line 407
    if-eqz v0, :cond_2

    .line 408
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 410
    :cond_2
    throw v3
.end method

.method private static initPauseMethod()V
    .locals 6

    .prologue
    const/4 v2, 0x1

    .line 199
    sget-boolean v1, Lcom/edutech/appmanage/utils/DownloadManagerPro;->isInitPauseDownload:Z

    if-eqz v1, :cond_0

    .line 211
    .local v0, "e":Ljava/lang/Exception;
    :goto_0
    return-void

    .line 203
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_0
    sput-boolean v2, Lcom/edutech/appmanage/utils/DownloadManagerPro;->isInitPauseDownload:Z

    .line 205
    :try_start_0
    const-class v1, Landroid/app/DownloadManager;

    .line 206
    const-string/jumbo v2, "pauseDownload"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Class;

    const/4 v4, 0x0

    const-class v5, [J

    aput-object v5, v3, v4

    .line 205
    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    sput-object v1, Lcom/edutech/appmanage/utils/DownloadManagerPro;->pauseDownload:Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 207
    :catch_0
    move-exception v0

    .line 209
    .restart local v0    # "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method private static initResumeMethod()V
    .locals 6

    .prologue
    const/4 v2, 0x1

    .line 214
    sget-boolean v1, Lcom/edutech/appmanage/utils/DownloadManagerPro;->isInitResumeDownload:Z

    if-eqz v1, :cond_0

    .line 226
    .local v0, "e":Ljava/lang/Exception;
    :goto_0
    return-void

    .line 218
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_0
    sput-boolean v2, Lcom/edutech/appmanage/utils/DownloadManagerPro;->isInitResumeDownload:Z

    .line 220
    :try_start_0
    const-class v1, Landroid/app/DownloadManager;

    .line 221
    const-string/jumbo v2, "resumeDownload"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Class;

    const/4 v4, 0x0

    const-class v5, [J

    aput-object v5, v3, v4

    .line 220
    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    sput-object v1, Lcom/edutech/appmanage/utils/DownloadManagerPro;->resumeDownload:Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 222
    :catch_0
    move-exception v0

    .line 224
    .restart local v0    # "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public static isExistPauseAndResumeMethod()Z
    .locals 1

    .prologue
    .line 193
    invoke-static {}, Lcom/edutech/appmanage/utils/DownloadManagerPro;->initPauseMethod()V

    .line 194
    invoke-static {}, Lcom/edutech/appmanage/utils/DownloadManagerPro;->initResumeMethod()V

    .line 195
    sget-object v0, Lcom/edutech/appmanage/utils/DownloadManagerPro;->pauseDownload:Ljava/lang/reflect/Method;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/edutech/appmanage/utils/DownloadManagerPro;->resumeDownload:Ljava/lang/reflect/Method;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public getBytesAndStatus(J)[I
    .locals 7
    .param p1, "downloadId"    # J

    .prologue
    const/4 v6, -0x1

    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 106
    const/4 v3, 0x3

    new-array v0, v3, [I

    aput v6, v0, v5

    aput v6, v0, v4

    .line 107
    .local v0, "bytesAndStatus":[I
    new-instance v3, Landroid/app/DownloadManager$Query;

    invoke-direct {v3}, Landroid/app/DownloadManager$Query;-><init>()V

    new-array v4, v4, [J

    .line 108
    aput-wide p1, v4, v5

    invoke-virtual {v3, v4}, Landroid/app/DownloadManager$Query;->setFilterById([J)Landroid/app/DownloadManager$Query;

    move-result-object v2

    .line 109
    .local v2, "query":Landroid/app/DownloadManager$Query;
    const/4 v1, 0x0

    .line 111
    .local v1, "c":Landroid/database/Cursor;
    :try_start_0
    iget-object v3, p0, Lcom/edutech/appmanage/utils/DownloadManagerPro;->downloadManager:Landroid/app/DownloadManager;

    invoke-virtual {v3, v2}, Landroid/app/DownloadManager;->query(Landroid/app/DownloadManager$Query;)Landroid/database/Cursor;

    move-result-object v1

    .line 112
    if-eqz v1, :cond_0

    invoke-interface {v1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 113
    const/4 v3, 0x0

    .line 115
    const-string/jumbo v4, "bytes_so_far"

    invoke-interface {v1, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v4

    .line 114
    invoke-interface {v1, v4}, Landroid/database/Cursor;->getInt(I)I

    move-result v4

    .line 113
    aput v4, v0, v3

    .line 116
    const/4 v3, 0x1

    .line 118
    const-string/jumbo v4, "total_size"

    invoke-interface {v1, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v4

    .line 117
    invoke-interface {v1, v4}, Landroid/database/Cursor;->getInt(I)I

    move-result v4

    .line 116
    aput v4, v0, v3

    .line 119
    const/4 v3, 0x2

    .line 120
    const-string/jumbo v4, "status"

    invoke-interface {v1, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v4

    .line 119
    invoke-interface {v1, v4}, Landroid/database/Cursor;->getInt(I)I

    move-result v4

    aput v4, v0, v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 123
    :cond_0
    if-eqz v1, :cond_1

    .line 124
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 127
    :cond_1
    return-object v0

    .line 122
    :catchall_0
    move-exception v3

    .line 123
    if-eqz v1, :cond_2

    .line 124
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 126
    :cond_2
    throw v3
.end method

.method public getDownloadBytes(J)[I
    .locals 5
    .param p1, "downloadId"    # J

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 88
    invoke-virtual {p0, p1, p2}, Lcom/edutech/appmanage/utils/DownloadManagerPro;->getBytesAndStatus(J)[I

    move-result-object v0

    .line 89
    .local v0, "bytesAndStatus":[I
    const/4 v1, 0x2

    new-array v1, v1, [I

    aget v2, v0, v3

    aput v2, v1, v3

    aget v2, v0, v4

    aput v2, v1, v4

    return-object v1
.end method

.method public getErrorCode(J)I
    .locals 1
    .param p1, "downloadId"    # J

    .prologue
    .line 296
    const-string/jumbo v0, "reason"

    invoke-direct {p0, p1, p2, v0}, Lcom/edutech/appmanage/utils/DownloadManagerPro;->getInt(JLjava/lang/String;)I

    move-result v0

    return v0
.end method

.method public getFileName(J)Ljava/lang/String;
    .locals 3
    .param p1, "downloadId"    # J

    .prologue
    .line 235
    .line 237
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xb

    if-ge v0, v1, :cond_0

    const-string/jumbo v0, "local_uri"

    .line 235
    :goto_0
    invoke-direct {p0, p1, p2, v0}, Lcom/edutech/appmanage/utils/DownloadManagerPro;->getString(JLjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 238
    :cond_0
    const-string/jumbo v0, "local_filename"

    goto :goto_0
.end method

.method public getPausedReason(J)I
    .locals 1
    .param p1, "downloadId"    # J

    .prologue
    .line 286
    const-string/jumbo v0, "reason"

    invoke-direct {p0, p1, p2, v0}, Lcom/edutech/appmanage/utils/DownloadManagerPro;->getInt(JLjava/lang/String;)I

    move-result v0

    return v0
.end method

.method public getReason(J)I
    .locals 1
    .param p1, "downloadId"    # J

    .prologue
    .line 268
    const-string/jumbo v0, "reason"

    invoke-direct {p0, p1, p2, v0}, Lcom/edutech/appmanage/utils/DownloadManagerPro;->getInt(JLjava/lang/String;)I

    move-result v0

    return v0
.end method

.method public getStatusById(J)I
    .locals 1
    .param p1, "downloadId"    # J

    .prologue
    .line 73
    const-string/jumbo v0, "status"

    invoke-direct {p0, p1, p2, v0}, Lcom/edutech/appmanage/utils/DownloadManagerPro;->getInt(JLjava/lang/String;)I

    move-result v0

    return v0
.end method

.method public getUri(J)Ljava/lang/String;
    .locals 1
    .param p1, "downloadId"    # J

    .prologue
    .line 248
    const-string/jumbo v0, "uri"

    invoke-direct {p0, p1, p2, v0}, Lcom/edutech/appmanage/utils/DownloadManagerPro;->getString(JLjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public varargs pauseDownload([J)I
    .locals 6
    .param p1, "ids"    # [J

    .prologue
    const/4 v2, -0x1

    .line 139
    invoke-static {}, Lcom/edutech/appmanage/utils/DownloadManagerPro;->initPauseMethod()V

    .line 140
    sget-object v1, Lcom/edutech/appmanage/utils/DownloadManagerPro;->pauseDownload:Ljava/lang/reflect/Method;

    if-nez v1, :cond_0

    move v1, v2

    .line 155
    :goto_0
    return v1

    .line 145
    :cond_0
    :try_start_0
    sget-object v1, Lcom/edutech/appmanage/utils/DownloadManagerPro;->pauseDownload:Ljava/lang/reflect/Method;

    iget-object v3, p0, Lcom/edutech/appmanage/utils/DownloadManagerPro;->downloadManager:Landroid/app/DownloadManager;

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object p1, v4, v5

    invoke-virtual {v1, v3, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    .line 146
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    goto :goto_0

    .line 147
    :catch_0
    move-exception v0

    .line 153
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    move v1, v2

    .line 155
    goto :goto_0
.end method

.method public varargs resumeDownload([J)I
    .locals 6
    .param p1, "ids"    # [J

    .prologue
    const/4 v2, -0x1

    .line 167
    invoke-static {}, Lcom/edutech/appmanage/utils/DownloadManagerPro;->initResumeMethod()V

    .line 168
    sget-object v1, Lcom/edutech/appmanage/utils/DownloadManagerPro;->resumeDownload:Ljava/lang/reflect/Method;

    if-nez v1, :cond_0

    move v1, v2

    .line 183
    :goto_0
    return v1

    .line 173
    :cond_0
    :try_start_0
    sget-object v1, Lcom/edutech/appmanage/utils/DownloadManagerPro;->resumeDownload:Ljava/lang/reflect/Method;

    iget-object v3, p0, Lcom/edutech/appmanage/utils/DownloadManagerPro;->downloadManager:Landroid/app/DownloadManager;

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object p1, v4, v5

    invoke-virtual {v1, v3, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    .line 174
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    goto :goto_0

    .line 175
    :catch_0
    move-exception v0

    .line 181
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    move v1, v2

    .line 183
    goto :goto_0
.end method
