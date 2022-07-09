.class public Lcom/edutech/idauthentication/FileUtils;
.super Ljava/lang/Object;
.source "FileUtils.java"


# static fields
.field private static final INDEX5:I = 0x5

.field private static final INDEX6:I = 0x6

.field private static final K:I = 0x400

.field public static final STR_SLASH_MNT:Ljava/lang/String; = "/mnt"

.field private static filepathMobileStudyClient:Ljava/lang/String;

.field private static filepathMobileStudyClient_NEW:Ljava/lang/String;

.field private static idfileMobileStudyClient:Ljava/io/File;

.field public static seed:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 30
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v1

    .line 31
    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v1, "/CloudClient/.System/idau.xml"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 30
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/edutech/idauthentication/FileUtils;->filepathMobileStudyClient:Ljava/lang/String;

    .line 32
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v1

    .line 33
    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v1, "/CloudClient/.System/idau_new.xml"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 32
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/edutech/idauthentication/FileUtils;->filepathMobileStudyClient_NEW:Ljava/lang/String;

    .line 34
    new-instance v0, Ljava/io/File;

    sget-object v1, Lcom/edutech/idauthentication/FileUtils;->filepathMobileStudyClient:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/edutech/idauthentication/FileUtils;->idfileMobileStudyClient:Ljava/io/File;

    .line 35
    const-string/jumbo v0, "Edutech@2013"

    sput-object v0, Lcom/edutech/idauthentication/FileUtils;->seed:Ljava/lang/String;

    .line 670
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static addToFile(Ljava/lang/String;Ljava/lang/String;[BI)Z
    .locals 2
    .param p0, "aPath"    # Ljava/lang/String;
    .param p1, "aFileName"    # Ljava/lang/String;
    .param p2, "aData"    # [B
    .param p3, "aLength"    # I

    .prologue
    .line 393
    const-string/jumbo v0, "/"

    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 394
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 396
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p2, p3}, Lcom/edutech/idauthentication/FileUtils;->addToFile(Ljava/lang/String;[BI)Z

    move-result v0

    return v0
.end method

.method public static addToFile(Ljava/lang/String;[BI)Z
    .locals 8
    .param p0, "aPath"    # Ljava/lang/String;
    .param p1, "aData"    # [B
    .param p2, "aLength"    # I

    .prologue
    const/4 v3, 0x0

    .line 402
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 403
    .local v2, "file":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 405
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v4

    .line 406
    invoke-virtual {v4}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v4

    .line 404
    invoke-virtual {p0, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v4

    .line 406
    const/4 v5, -0x1

    .line 404
    if-eq v4, v5, :cond_1

    .line 407
    invoke-static {}, Lcom/edutech/idauthentication/FileUtils;->readSDCardRemain()J

    move-result-wide v4

    int-to-long v6, p2

    cmp-long v4, v4, v6

    if-gez v4, :cond_2

    .line 433
    :cond_0
    :goto_0
    return v3

    .line 411
    :cond_1
    invoke-static {}, Lcom/edutech/idauthentication/FileUtils;->readSystemRemain()J

    move-result-wide v4

    int-to-long v6, p2

    cmp-long v4, v4, v6

    if-ltz v4, :cond_0

    .line 418
    :cond_2
    :try_start_0
    new-instance v0, Ljava/io/DataOutputStream;

    new-instance v4, Ljava/io/FileOutputStream;

    const/4 v5, 0x0

    invoke-direct {v4, p0, v5}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;Z)V

    invoke-direct {v0, v4}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 419
    .local v0, "dos":Ljava/io/DataOutputStream;
    if-nez p2, :cond_3

    .line 420
    invoke-virtual {v0, p1}, Ljava/io/DataOutputStream;->write([B)V

    .line 424
    :goto_1
    invoke-virtual {v0}, Ljava/io/DataOutputStream;->flush()V

    .line 425
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-virtual {v2, v4, v5}, Ljava/io/File;->setLastModified(J)Z

    .line 426
    invoke-virtual {v0}, Ljava/io/DataOutputStream;->close()V

    .line 427
    const/4 v3, 0x1

    goto :goto_0

    .line 422
    :cond_3
    const/4 v4, 0x0

    invoke-virtual {v0, p1, v4, p2}, Ljava/io/DataOutputStream;->write([BII)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 428
    .end local v0    # "dos":Ljava/io/DataOutputStream;
    :catch_0
    move-exception v1

    .line 430
    .local v1, "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0
.end method

.method public static copy(Ljava/io/File;Ljava/io/File;)V
    .locals 7
    .param p0, "aDesFile"    # Ljava/io/File;
    .param p1, "aSrcFile"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 480
    new-instance v2, Ljava/io/FileInputStream;

    invoke-direct {v2, p1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 481
    .local v2, "input":Ljava/io/FileInputStream;
    new-instance v1, Ljava/io/BufferedInputStream;

    invoke-direct {v1, v2}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .line 483
    .local v1, "inBuff":Ljava/io/BufferedInputStream;
    new-instance v5, Ljava/io/FileOutputStream;

    invoke-direct {v5, p0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 484
    .local v5, "output":Ljava/io/FileOutputStream;
    new-instance v4, Ljava/io/BufferedOutputStream;

    invoke-direct {v4, v5}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 486
    .local v4, "outBuff":Ljava/io/BufferedOutputStream;
    const/16 v6, 0x1400

    new-array v0, v6, [B

    .line 489
    .local v0, "b":[B
    :goto_0
    invoke-virtual {v1, v0}, Ljava/io/BufferedInputStream;->read([B)I

    move-result v3

    .local v3, "len":I
    const/4 v6, -0x1

    if-ne v3, v6, :cond_0

    .line 493
    invoke-virtual {v4}, Ljava/io/BufferedOutputStream;->flush()V

    .line 495
    invoke-virtual {v1}, Ljava/io/BufferedInputStream;->close()V

    .line 496
    invoke-virtual {v4}, Ljava/io/BufferedOutputStream;->close()V

    .line 497
    invoke-virtual {v5}, Ljava/io/FileOutputStream;->close()V

    .line 498
    invoke-virtual {v2}, Ljava/io/FileInputStream;->close()V

    .line 499
    return-void

    .line 490
    :cond_0
    const/4 v6, 0x0

    invoke-virtual {v4, v0, v6, v3}, Ljava/io/BufferedOutputStream;->write([BII)V

    goto :goto_0
.end method

.method public static createNewFile(Ljava/io/File;)Z
    .locals 4
    .param p0, "aFile"    # Ljava/io/File;

    .prologue
    .line 555
    const/4 v1, 0x0

    .line 556
    .local v1, "fileCreateSuccessful":Z
    if-nez p0, :cond_0

    .line 557
    const/4 v3, 0x0

    .line 572
    :goto_0
    return v3

    .line 559
    :cond_0
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v3

    if-nez v3, :cond_1

    .line 560
    invoke-virtual {p0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v2

    .line 561
    .local v2, "parentFile":Ljava/io/File;
    if-eqz v2, :cond_1

    .line 562
    invoke-virtual {v2}, Ljava/io/File;->mkdirs()Z

    .line 567
    .end local v2    # "parentFile":Ljava/io/File;
    :cond_1
    :try_start_0
    invoke-virtual {p0}, Ljava/io/File;->createNewFile()Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    :goto_1
    move v3, v1

    .line 572
    goto :goto_0

    .line 568
    :catch_0
    move-exception v0

    .line 569
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    .line 570
    const/4 v1, 0x0

    goto :goto_1
.end method

.method public static declared-synchronized createWithOverwriteExistFile(Ljava/lang/String;)Ljava/io/File;
    .locals 4
    .param p0, "aPath"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 537
    const-class v3, Lcom/edutech/idauthentication/FileUtils;

    monitor-enter v3

    :try_start_0
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 539
    .local v0, "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_1

    .line 540
    invoke-virtual {v0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v1

    .line 541
    .local v1, "parentFile":Ljava/io/File;
    if-eqz v1, :cond_0

    .line 542
    invoke-virtual {v1}, Ljava/io/File;->mkdirs()Z

    .line 549
    .end local v1    # "parentFile":Ljava/io/File;
    :cond_0
    :goto_0
    invoke-virtual {v0}, Ljava/io/File;->createNewFile()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 551
    monitor-exit v3

    return-object v0

    .line 546
    :cond_1
    :try_start_1
    invoke-virtual {v0}, Ljava/io/File;->delete()Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 537
    .end local v0    # "file":Ljava/io/File;
    :catchall_0
    move-exception v2

    monitor-exit v3

    throw v2
.end method

.method public static declared-synchronized createWithoutOverwriteExistFile(Ljava/lang/String;)Ljava/io/File;
    .locals 12
    .param p0, "aPath"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 504
    const-class v10, Lcom/edutech/idauthentication/FileUtils;

    monitor-enter v10

    .line 505
    :try_start_0
    sget-char v9, Ljava/io/File;->separatorChar:C

    invoke-virtual {p0, v9}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v9

    add-int/lit8 v9, v9, 0x1

    invoke-virtual {p0, v9}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    .line 507
    .local v3, "fileName":Ljava/lang/String;
    const/4 v9, 0x0

    .line 508
    sget-char v11, Ljava/io/File;->separatorChar:C

    invoke-virtual {p0, v11}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v11

    add-int/lit8 v11, v11, 0x1

    .line 506
    invoke-virtual {p0, v9, v11}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 509
    .local v0, "dir":Ljava/lang/String;
    const-string/jumbo v4, "_"

    .line 510
    .local v4, "fileNameSuffix":Ljava/lang/String;
    const-string/jumbo v9, "."

    invoke-virtual {v3, v9}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v9

    invoke-virtual {v3, v9}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v7

    .line 511
    .local v7, "suffix":Ljava/lang/String;
    const/4 v9, 0x0

    .line 512
    const-string/jumbo v11, "."

    invoke-virtual {v3, v11}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v11

    .line 511
    invoke-virtual {v3, v9, v11}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    .line 513
    .local v5, "fileNameWithoutSuffix":Ljava/lang/String;
    const/4 v1, 0x1

    .line 514
    .local v1, "duplicateCount":I
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 516
    .local v2, "file":Ljava/io/File;
    :goto_0
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v9

    if-nez v9, :cond_1

    .line 524
    invoke-virtual {v2}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v6

    .line 525
    .local v6, "parentFile":Ljava/io/File;
    if-eqz v6, :cond_0

    .line 526
    invoke-virtual {v6}, Ljava/io/File;->mkdirs()Z

    .line 528
    :cond_0
    invoke-virtual {v2}, Ljava/io/File;->createNewFile()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 529
    const/4 v6, 0x0

    .line 531
    monitor-exit v10

    return-object v2

    .line 518
    .end local v6    # "parentFile":Ljava/io/File;
    :cond_1
    :try_start_1
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-direct {v9, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 519
    .local v8, "tmpString":Ljava/lang/String;
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-direct {v9, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 520
    new-instance v2, Ljava/io/File;

    .end local v2    # "file":Ljava/io/File;
    invoke-direct {v2, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 521
    .restart local v2    # "file":Ljava/io/File;
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 504
    .end local v0    # "dir":Ljava/lang/String;
    .end local v1    # "duplicateCount":I
    .end local v2    # "file":Ljava/io/File;
    .end local v3    # "fileName":Ljava/lang/String;
    .end local v4    # "fileNameSuffix":Ljava/lang/String;
    .end local v5    # "fileNameWithoutSuffix":Ljava/lang/String;
    .end local v7    # "suffix":Ljava/lang/String;
    .end local v8    # "tmpString":Ljava/lang/String;
    :catchall_0
    move-exception v9

    monitor-exit v10

    throw v9
.end method

.method public static delete(Ljava/lang/String;)V
    .locals 6
    .param p0, "path"    # Ljava/lang/String;

    .prologue
    .line 195
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 196
    .local v0, "dir":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v4

    if-nez v4, :cond_1

    .line 213
    :cond_0
    return-void

    .line 200
    :cond_1
    invoke-virtual {v0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v1

    .line 201
    .local v1, "files":[Ljava/io/File;
    if-eqz v1, :cond_0

    .line 203
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v4, v1

    if-ge v2, v4, :cond_0

    .line 205
    aget-object v3, v1, v2

    .line 206
    .local v3, "tempFile":Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->isDirectory()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-virtual {v3}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v4

    const-string/jumbo v5, "HTML"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 203
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 210
    :cond_2
    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/edutech/idauthentication/FileUtils;->deleteFiles(Ljava/lang/String;)V

    goto :goto_1
.end method

.method public static deleteCameraFiles()V
    .locals 8

    .prologue
    .line 243
    const-string/jumbo v6, "delete"

    const-string/jumbo v7, "deleteCameraFiles"

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 246
    sget-object v6, Landroid/os/Environment;->DIRECTORY_DCIM:Ljava/lang/String;

    .line 245
    invoke-static {v6}, Landroid/os/Environment;->getExternalStoragePublicDirectory(Ljava/lang/String;)Ljava/io/File;

    move-result-object v6

    .line 246
    invoke-virtual {v6}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v0

    .line 247
    .local v0, "OPEN_DCIM":Ljava/lang/String;
    if-eqz v0, :cond_0

    const-string/jumbo v6, ""

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 277
    :cond_0
    return-void

    .line 251
    :cond_1
    new-instance v1, Ljava/io/File;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v7, "/Camera/"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v1, v6}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 252
    .local v1, "file":Ljava/io/File;
    new-instance v2, Ljava/io/File;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v7, "/Screenshots/"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v2, v6}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 253
    .local v2, "file2":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-virtual {v1}, Ljava/io/File;->isDirectory()Z

    move-result v6

    if-eqz v6, :cond_2

    .line 255
    invoke-virtual {v1}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v3

    .line 256
    .local v3, "files":[Ljava/io/File;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    array-length v6, v3

    if-lt v4, v6, :cond_4

    .line 265
    .end local v3    # "files":[Ljava/io/File;
    .end local v4    # "i":I
    :cond_2
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-virtual {v2}, Ljava/io/File;->isDirectory()Z

    move-result v6

    if-eqz v6, :cond_0

    .line 267
    invoke-virtual {v2}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v3

    .line 268
    .restart local v3    # "files":[Ljava/io/File;
    const/4 v4, 0x0

    .restart local v4    # "i":I
    :goto_1
    array-length v6, v3

    if-ge v4, v6, :cond_0

    .line 270
    aget-object v5, v3, v4

    .line 271
    .local v5, "tempFile":Ljava/io/File;
    invoke-virtual {v5}, Ljava/io/File;->exists()Z

    move-result v6

    if-eqz v6, :cond_3

    .line 273
    invoke-virtual {v5}, Ljava/io/File;->delete()Z

    .line 268
    :cond_3
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 258
    .end local v5    # "tempFile":Ljava/io/File;
    :cond_4
    aget-object v5, v3, v4

    .line 259
    .restart local v5    # "tempFile":Ljava/io/File;
    invoke-virtual {v5}, Ljava/io/File;->exists()Z

    move-result v6

    if-eqz v6, :cond_5

    .line 261
    invoke-virtual {v5}, Ljava/io/File;->delete()Z

    .line 256
    :cond_5
    add-int/lit8 v4, v4, 0x1

    goto :goto_0
.end method

.method public static declared-synchronized deleteDir(Ljava/io/File;)V
    .locals 5
    .param p0, "aDir"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 577
    const-class v4, Lcom/edutech/idauthentication/FileUtils;

    monitor-enter v4

    if-eqz p0, :cond_0

    :try_start_0
    invoke-virtual {p0}, Ljava/io/File;->isDirectory()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 578
    invoke-virtual {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v0

    .line 579
    .local v0, "entries":[Ljava/io/File;
    array-length v2, v0

    .line 581
    .local v2, "sz":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-lt v1, v2, :cond_1

    .line 590
    .end local v0    # "entries":[Ljava/io/File;
    .end local v1    # "i":I
    .end local v2    # "sz":I
    :cond_0
    invoke-virtual {p0}, Ljava/io/File;->delete()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 591
    monitor-exit v4

    return-void

    .line 582
    .restart local v0    # "entries":[Ljava/io/File;
    .restart local v1    # "i":I
    .restart local v2    # "sz":I
    :cond_1
    :try_start_1
    aget-object v3, v0, v1

    invoke-virtual {v3}, Ljava/io/File;->isDirectory()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 583
    aget-object v3, v0, v1

    invoke-static {v3}, Lcom/edutech/idauthentication/FileUtils;->deleteDir(Ljava/io/File;)V

    .line 581
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 585
    :cond_2
    aget-object v3, v0, v1

    invoke-virtual {v3}, Ljava/io/File;->delete()Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    .line 577
    .end local v0    # "entries":[Ljava/io/File;
    .end local v1    # "i":I
    .end local v2    # "sz":I
    :catchall_0
    move-exception v3

    monitor-exit v4

    throw v3
.end method

.method public static deleteFile(Ljava/lang/String;)I
    .locals 2
    .param p0, "aPath"    # Ljava/lang/String;

    .prologue
    .line 447
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 448
    .local v0, "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 449
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 450
    const/4 v1, 0x0

    .line 452
    :goto_0
    return v1

    :cond_0
    const/4 v1, -0x1

    goto :goto_0
.end method

.method public static deleteFile(Ljava/lang/String;Ljava/lang/String;)I
    .locals 2
    .param p0, "aPath"    # Ljava/lang/String;
    .param p1, "aFileName"    # Ljava/lang/String;

    .prologue
    .line 439
    const-string/jumbo v0, "/"

    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 440
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 442
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/edutech/idauthentication/FileUtils;->deleteFile(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public static deleteFiles(Ljava/lang/String;)V
    .locals 5
    .param p0, "path"    # Ljava/lang/String;

    .prologue
    .line 215
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 216
    .local v0, "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v4

    if-eqz v4, :cond_3

    .line 217
    invoke-virtual {v0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v1

    .line 218
    .local v1, "files":[Ljava/io/File;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v4, v1

    if-lt v2, v4, :cond_2

    .line 229
    .end local v1    # "files":[Ljava/io/File;
    .end local v2    # "i":I
    :cond_0
    :goto_1
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 230
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 232
    :cond_1
    return-void

    .line 219
    .restart local v1    # "files":[Ljava/io/File;
    .restart local v2    # "i":I
    :cond_2
    aget-object v4, v1, v2

    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    .line 220
    .local v3, "newPath":Ljava/lang/String;
    const-string/jumbo v4, "---------->dd"

    invoke-static {v4, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 221
    invoke-static {v3}, Lcom/edutech/idauthentication/FileUtils;->deleteFiles(Ljava/lang/String;)V

    .line 218
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 224
    .end local v1    # "files":[Ljava/io/File;
    .end local v2    # "i":I
    .end local v3    # "newPath":Ljava/lang/String;
    :cond_3
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 225
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 226
    const-string/jumbo v4, "-------->delete"

    invoke-static {v4, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method

.method public static fileIsExists(Ljava/lang/String;)Z
    .locals 3
    .param p0, "aPath"    # Ljava/lang/String;

    .prologue
    .line 379
    const/4 v0, 0x0

    .line 380
    .local v0, "file":Ljava/io/File;
    const-string/jumbo v1, "mounted"

    .line 381
    invoke-static {}, Landroid/os/Environment;->getExternalStorageState()Ljava/lang/String;

    move-result-object v2

    .line 380
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    .line 381
    if-eqz v1, :cond_0

    .line 382
    new-instance v0, Ljava/io/File;

    .end local v0    # "file":Ljava/io/File;
    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 383
    .restart local v0    # "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 384
    const/4 v1, 0x1

    .line 387
    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static fileIsExists(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 2
    .param p0, "aPath"    # Ljava/lang/String;
    .param p1, "aFileName"    # Ljava/lang/String;

    .prologue
    .line 371
    const-string/jumbo v0, "/"

    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 372
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 374
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/edutech/idauthentication/FileUtils;->fileIsExists(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static getSDAvailableSize()J
    .locals 12

    .prologue
    const-wide/high16 v10, 0x4090000000000000L    # 1024.0

    .line 235
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v4

    .line 236
    .local v4, "path":Ljava/io/File;
    new-instance v5, Landroid/os/StatFs;

    invoke-virtual {v4}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Landroid/os/StatFs;-><init>(Ljava/lang/String;)V

    .line 237
    .local v5, "stat":Landroid/os/StatFs;
    invoke-virtual {v5}, Landroid/os/StatFs;->getBlockSize()I

    move-result v6

    int-to-long v2, v6

    .line 238
    .local v2, "blockSize":J
    invoke-virtual {v5}, Landroid/os/StatFs;->getAvailableBlocks()I

    move-result v6

    int-to-long v0, v6

    .line 239
    .local v0, "availableBlocks":J
    mul-long v6, v2, v0

    long-to-double v6, v6

    const-wide/high16 v8, 0x3ff0000000000000L    # 1.0

    mul-double/2addr v6, v8

    div-double/2addr v6, v10

    div-double/2addr v6, v10

    double-to-long v6, v6

    return-wide v6
.end method

.method public static installApk(Landroid/content/Context;Ljava/lang/String;)V
    .locals 3
    .param p0, "aContext"    # Landroid/content/Context;
    .param p1, "aUri"    # Ljava/lang/String;

    .prologue
    .line 662
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v1, "android.intent.action.VIEW"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 663
    .local v0, "intent":Landroid/content/Intent;
    const/high16 v1, 0x10000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 665
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v1}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v1

    .line 666
    const-string/jumbo v2, "application/vnd.android.package-archive"

    .line 664
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    .line 667
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 668
    return-void
.end method

.method public static loadFdisk(Ljava/lang/String;)[B
    .locals 10
    .param p0, "aPath"    # Ljava/lang/String;

    .prologue
    .line 350
    const/4 v3, 0x0

    .line 351
    .local v3, "temp":[B
    const/4 v1, 0x0

    .line 353
    .local v1, "file":Ljava/io/File;
    new-instance v1, Ljava/io/File;

    .end local v1    # "file":Ljava/io/File;
    invoke-direct {v1, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 354
    .restart local v1    # "file":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v5

    if-nez v5, :cond_0

    invoke-virtual {v1}, Ljava/io/File;->length()J

    move-result-wide v6

    const-wide/16 v8, 0x0

    cmp-long v5, v6, v8

    if-gtz v5, :cond_0

    invoke-virtual {v1}, Ljava/io/File;->isDirectory()Z

    move-result v5

    if-eqz v5, :cond_0

    move-object v4, v3

    .line 366
    .end local v3    # "temp":[B
    .local v4, "temp":[B
    :goto_0
    return-object v4

    .line 357
    .end local v4    # "temp":[B
    .restart local v3    # "temp":[B
    :cond_0
    invoke-virtual {v1}, Ljava/io/File;->length()J

    move-result-wide v6

    long-to-int v5, v6

    new-array v3, v5, [B

    .line 360
    :try_start_0
    new-instance v2, Ljava/io/FileInputStream;

    invoke-direct {v2, v1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 361
    .local v2, "fis":Ljava/io/FileInputStream;
    invoke-virtual {v2, v3}, Ljava/io/FileInputStream;->read([B)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-object v4, v3

    .line 366
    .end local v3    # "temp":[B
    .restart local v4    # "temp":[B
    goto :goto_0

    .line 362
    .end local v2    # "fis":Ljava/io/FileInputStream;
    .end local v4    # "temp":[B
    .restart local v3    # "temp":[B
    :catch_0
    move-exception v0

    .local v0, "e":Ljava/lang/Exception;
    move-object v4, v3

    .line 364
    .end local v3    # "temp":[B
    .restart local v4    # "temp":[B
    goto :goto_0
.end method

.method public static loadFdisk(Ljava/lang/String;Ljava/lang/String;)[B
    .locals 2
    .param p0, "aPath"    # Ljava/lang/String;
    .param p1, "aFileName"    # Ljava/lang/String;

    .prologue
    .line 342
    const-string/jumbo v0, "/"

    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 343
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 345
    :cond_0
    invoke-static {p0}, Lcom/edutech/idauthentication/FileUtils;->loadFdisk(Ljava/lang/String;)[B

    move-result-object v0

    return-object v0
.end method

.method public static final readIDFile()Ljava/util/List;
    .locals 23
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
    .line 42
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 43
    .local v9, "idInfo":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v10, 0x0

    .local v10, "idString":Ljava/lang/String;
    const/4 v11, 0x0

    .local v11, "machineID":Ljava/lang/String;
    const/4 v15, 0x0

    .local v15, "resultString":Ljava/lang/String;
    const/16 v17, 0x0

    .local v17, "times":Ljava/lang/String;
    const/4 v2, 0x0

    .local v2, "date":Ljava/lang/String;
    const/16 v18, 0x0

    .line 44
    .local v18, "usedTimes":Ljava/lang/String;
    sget v16, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 45
    .local v16, "sdk_version":I
    const/16 v19, 0x0

    .line 46
    .local v19, "userNewAuth":Z
    new-instance v6, Ljava/io/File;

    sget-object v21, Lcom/edutech/idauthentication/FileUtils;->filepathMobileStudyClient_NEW:Ljava/lang/String;

    move-object/from16 v0, v21

    invoke-direct {v6, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 47
    .local v6, "file":Ljava/io/File;
    invoke-virtual {v6}, Ljava/io/File;->exists()Z

    move-result v21

    if-eqz v21, :cond_0

    .line 49
    const/16 v19, 0x1

    .line 51
    :cond_0
    const/4 v7, 0x0

    .line 52
    .local v7, "filein":Ljava/io/FileInputStream;
    const/4 v14, 0x0

    .line 54
    .local v14, "result":I
    if-eqz v19, :cond_2

    .line 56
    :try_start_0
    new-instance v8, Ljava/io/FileInputStream;

    invoke-direct {v8, v6}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .end local v7    # "filein":Ljava/io/FileInputStream;
    .local v8, "filein":Ljava/io/FileInputStream;
    move-object v7, v8

    .line 65
    .end local v8    # "filein":Ljava/io/FileInputStream;
    .restart local v7    # "filein":Ljava/io/FileInputStream;
    :goto_0
    if-nez v7, :cond_3

    .line 191
    :cond_1
    :goto_1
    return-object v9

    .line 59
    :cond_2
    new-instance v8, Ljava/io/FileInputStream;

    sget-object v21, Lcom/edutech/idauthentication/FileUtils;->idfileMobileStudyClient:Ljava/io/File;

    move-object/from16 v0, v21

    invoke-direct {v8, v0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .end local v7    # "filein":Ljava/io/FileInputStream;
    .restart local v8    # "filein":Ljava/io/FileInputStream;
    move-object v7, v8

    .line 61
    .end local v8    # "filein":Ljava/io/FileInputStream;
    .restart local v7    # "filein":Ljava/io/FileInputStream;
    goto :goto_0

    :catch_0
    move-exception v4

    .line 63
    .local v4, "e1":Ljava/io/FileNotFoundException;
    invoke-virtual {v4}, Ljava/io/FileNotFoundException;->printStackTrace()V

    goto :goto_0

    .line 70
    .end local v4    # "e1":Ljava/io/FileNotFoundException;
    :cond_3
    :try_start_1
    invoke-static {}, Lorg/xmlpull/v1/XmlPullParserFactory;->newInstance()Lorg/xmlpull/v1/XmlPullParserFactory;

    move-result-object v13

    .line 71
    .local v13, "pullParserFactory":Lorg/xmlpull/v1/XmlPullParserFactory;
    invoke-virtual {v13}, Lorg/xmlpull/v1/XmlPullParserFactory;->newPullParser()Lorg/xmlpull/v1/XmlPullParser;

    move-result-object v20

    .line 72
    .local v20, "xmlPullParser":Lorg/xmlpull/v1/XmlPullParser;
    const-string/jumbo v21, "UTF-8"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-interface {v0, v7, v1}, Lorg/xmlpull/v1/XmlPullParser;->setInput(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 73
    invoke-interface/range {v20 .. v20}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I
    :try_end_1
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_3

    move-result v5

    .line 74
    .local v5, "eventType":I
    :goto_2
    const/16 v21, 0x1

    move/from16 v0, v21

    if-ne v5, v0, :cond_9

    .line 121
    .end local v5    # "eventType":I
    .end local v13    # "pullParserFactory":Lorg/xmlpull/v1/XmlPullParserFactory;
    .end local v20    # "xmlPullParser":Lorg/xmlpull/v1/XmlPullParser;
    :goto_3
    :try_start_2
    invoke-virtual {v7}, Ljava/io/FileInputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_4

    .line 122
    const/4 v7, 0x0

    .line 128
    :goto_4
    const-string/jumbo v21, ""

    move-object/from16 v0, v21

    invoke-interface {v9, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 129
    const-string/jumbo v21, ""

    move-object/from16 v0, v21

    invoke-interface {v9, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 130
    const-string/jumbo v21, ""

    move-object/from16 v0, v21

    invoke-interface {v9, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 131
    const-string/jumbo v21, ""

    move-object/from16 v0, v21

    invoke-interface {v9, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 132
    const-string/jumbo v21, ""

    move-object/from16 v0, v21

    invoke-interface {v9, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 133
    const-string/jumbo v21, ""

    move-object/from16 v0, v21

    invoke-interface {v9, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 135
    if-eqz v10, :cond_4

    .line 136
    if-eqz v19, :cond_10

    .line 137
    const/16 v21, 0x0

    .line 138
    :try_start_3
    invoke-static {v10}, Lcom/edutech/idauthentication/BZip2Utils;->Base64DecodeToString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v22

    .line 137
    move/from16 v0, v21

    move-object/from16 v1, v22

    invoke-interface {v9, v0, v1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 143
    :cond_4
    :goto_5
    if-eqz v11, :cond_5

    .line 144
    if-eqz v19, :cond_11

    .line 145
    const/16 v21, 0x1

    .line 146
    invoke-static {v11}, Lcom/edutech/idauthentication/BZip2Utils;->Base64DecodeToString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v22

    .line 145
    move/from16 v0, v21

    move-object/from16 v1, v22

    invoke-interface {v9, v0, v1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 152
    :cond_5
    :goto_6
    if-eqz v15, :cond_6

    .line 153
    if-eqz v19, :cond_12

    .line 154
    const/16 v21, 0x2

    .line 155
    invoke-static {v15}, Lcom/edutech/idauthentication/BZip2Utils;->Base64DecodeToString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v22

    .line 154
    move/from16 v0, v21

    move-object/from16 v1, v22

    invoke-interface {v9, v0, v1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 160
    :cond_6
    :goto_7
    if-eqz v17, :cond_7

    .line 161
    if-eqz v19, :cond_13

    .line 162
    const/16 v21, 0x3

    .line 163
    invoke-static/range {v17 .. v17}, Lcom/edutech/idauthentication/BZip2Utils;->Base64DecodeToString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v22

    .line 162
    move/from16 v0, v21

    move-object/from16 v1, v22

    invoke-interface {v9, v0, v1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 169
    :cond_7
    :goto_8
    if-eqz v2, :cond_8

    .line 170
    if-eqz v19, :cond_14

    .line 172
    const/16 v21, 0x4

    .line 173
    invoke-static {v2}, Lcom/edutech/idauthentication/BZip2Utils;->Base64DecodeToString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v22

    .line 172
    move/from16 v0, v21

    move-object/from16 v1, v22

    invoke-interface {v9, v0, v1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 179
    :cond_8
    :goto_9
    if-eqz v18, :cond_1

    .line 180
    if-eqz v19, :cond_15

    .line 181
    const/16 v21, 0x5

    .line 182
    invoke-static/range {v18 .. v18}, Lcom/edutech/idauthentication/BZip2Utils;->Base64DecodeToString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v22

    .line 181
    move/from16 v0, v21

    move-object/from16 v1, v22

    invoke-interface {v9, v0, v1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    goto/16 :goto_1

    .line 187
    :catch_1
    move-exception v3

    .line 189
    .local v3, "e":Ljava/lang/Exception;
    invoke-virtual {v3}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_1

    .line 75
    .end local v3    # "e":Ljava/lang/Exception;
    .restart local v5    # "eventType":I
    .restart local v13    # "pullParserFactory":Lorg/xmlpull/v1/XmlPullParserFactory;
    .restart local v20    # "xmlPullParser":Lorg/xmlpull/v1/XmlPullParser;
    :cond_9
    :try_start_4
    invoke-interface/range {v20 .. v20}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v12

    .line 77
    .local v12, "nodeName":Ljava/lang/String;
    packed-switch v5, :pswitch_data_0

    .line 108
    :cond_a
    :goto_a
    :pswitch_0
    invoke-interface/range {v20 .. v20}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v5

    goto/16 :goto_2

    .line 82
    :pswitch_1
    const-string/jumbo v21, "a1"

    move-object/from16 v0, v21

    invoke-virtual {v0, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_b

    .line 83
    invoke-interface/range {v20 .. v20}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v10

    .line 85
    :cond_b
    const-string/jumbo v21, "b2"

    move-object/from16 v0, v21

    invoke-virtual {v0, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_c

    .line 86
    invoke-interface/range {v20 .. v20}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v11

    .line 88
    :cond_c
    const-string/jumbo v21, "c3"

    move-object/from16 v0, v21

    invoke-virtual {v0, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_d

    .line 89
    invoke-interface/range {v20 .. v20}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v15

    .line 91
    :cond_d
    const-string/jumbo v21, "d4"

    move-object/from16 v0, v21

    invoke-virtual {v0, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_e

    .line 92
    invoke-interface/range {v20 .. v20}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v17

    .line 94
    :cond_e
    const-string/jumbo v21, "e5"

    move-object/from16 v0, v21

    invoke-virtual {v0, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_f

    .line 95
    invoke-interface/range {v20 .. v20}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v2

    .line 97
    :cond_f
    const-string/jumbo v21, "f6"

    move-object/from16 v0, v21

    invoke-virtual {v0, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_a

    .line 98
    invoke-interface/range {v20 .. v20}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;
    :try_end_4
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_4 .. :try_end_4} :catch_2
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_3

    move-result-object v18

    .line 101
    goto :goto_a

    .line 110
    .end local v5    # "eventType":I
    .end local v12    # "nodeName":Ljava/lang/String;
    .end local v13    # "pullParserFactory":Lorg/xmlpull/v1/XmlPullParserFactory;
    .end local v20    # "xmlPullParser":Lorg/xmlpull/v1/XmlPullParser;
    :catch_2
    move-exception v3

    .line 113
    .local v3, "e":Lorg/xmlpull/v1/XmlPullParserException;
    invoke-virtual {v3}, Lorg/xmlpull/v1/XmlPullParserException;->printStackTrace()V

    goto/16 :goto_3

    .line 114
    .end local v3    # "e":Lorg/xmlpull/v1/XmlPullParserException;
    :catch_3
    move-exception v3

    .line 117
    .local v3, "e":Ljava/io/IOException;
    invoke-virtual {v3}, Ljava/io/IOException;->printStackTrace()V

    goto/16 :goto_3

    .line 123
    .end local v3    # "e":Ljava/io/IOException;
    :catch_4
    move-exception v4

    .line 125
    .local v4, "e1":Ljava/io/IOException;
    invoke-virtual {v4}, Ljava/io/IOException;->printStackTrace()V

    goto/16 :goto_4

    .line 140
    .end local v4    # "e1":Ljava/io/IOException;
    :cond_10
    const/16 v21, 0x0

    :try_start_5
    sget-object v22, Lcom/edutech/idauthentication/FileUtils;->seed:Ljava/lang/String;

    move-object/from16 v0, v22

    invoke-static {v0, v10}, Lcom/edutech/idauthentication/AESUtils2;->decrypt(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v22

    move/from16 v0, v21

    move-object/from16 v1, v22

    invoke-interface {v9, v0, v1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_5

    .line 149
    :cond_11
    const/16 v21, 0x1

    sget-object v22, Lcom/edutech/idauthentication/FileUtils;->seed:Ljava/lang/String;

    move-object/from16 v0, v22

    invoke-static {v0, v11}, Lcom/edutech/idauthentication/AESUtils2;->decrypt(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v22

    move/from16 v0, v21

    move-object/from16 v1, v22

    invoke-interface {v9, v0, v1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_6

    .line 157
    :cond_12
    const/16 v21, 0x2

    sget-object v22, Lcom/edutech/idauthentication/FileUtils;->seed:Ljava/lang/String;

    move-object/from16 v0, v22

    invoke-static {v0, v15}, Lcom/edutech/idauthentication/AESUtils2;->decrypt(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v22

    move/from16 v0, v21

    move-object/from16 v1, v22

    invoke-interface {v9, v0, v1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_7

    .line 166
    :cond_13
    const/16 v21, 0x3

    sget-object v22, Lcom/edutech/idauthentication/FileUtils;->seed:Ljava/lang/String;

    move-object/from16 v0, v22

    move-object/from16 v1, v17

    invoke-static {v0, v1}, Lcom/edutech/idauthentication/AESUtils2;->decrypt(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v22

    move/from16 v0, v21

    move-object/from16 v1, v22

    invoke-interface {v9, v0, v1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_8

    .line 176
    :cond_14
    const/16 v21, 0x4

    sget-object v22, Lcom/edutech/idauthentication/FileUtils;->seed:Ljava/lang/String;

    move-object/from16 v0, v22

    invoke-static {v0, v2}, Lcom/edutech/idauthentication/AESUtils2;->decrypt(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v22

    move/from16 v0, v21

    move-object/from16 v1, v22

    invoke-interface {v9, v0, v1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_9

    .line 184
    :cond_15
    const/16 v21, 0x5

    sget-object v22, Lcom/edutech/idauthentication/FileUtils;->seed:Ljava/lang/String;

    move-object/from16 v0, v22

    move-object/from16 v1, v18

    invoke-static {v0, v1}, Lcom/edutech/idauthentication/AESUtils2;->decrypt(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v22

    move/from16 v0, v21

    move-object/from16 v1, v22

    invoke-interface {v9, v0, v1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_1

    goto/16 :goto_1

    .line 77
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static readSDCardRemain()J
    .locals 8

    .prologue
    .line 458
    const-string/jumbo v6, "mounted"

    .line 459
    invoke-static {}, Landroid/os/Environment;->getExternalStorageState()Ljava/lang/String;

    move-result-object v7

    .line 458
    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    .line 459
    if-eqz v6, :cond_0

    .line 460
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v4

    .line 461
    .local v4, "sdcardDir":Ljava/io/File;
    new-instance v5, Landroid/os/StatFs;

    invoke-virtual {v4}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Landroid/os/StatFs;-><init>(Ljava/lang/String;)V

    .line 462
    .local v5, "sf":Landroid/os/StatFs;
    invoke-virtual {v5}, Landroid/os/StatFs;->getBlockSize()I

    move-result v6

    int-to-long v2, v6

    .line 463
    .local v2, "blockSize":J
    invoke-virtual {v5}, Landroid/os/StatFs;->getAvailableBlocks()I

    move-result v6

    int-to-long v0, v6

    .line 464
    .local v0, "availCount":J
    mul-long v6, v0, v2

    .line 466
    :goto_0
    return-wide v6

    .end local v0    # "availCount":J
    .end local v2    # "blockSize":J
    .end local v4    # "sdcardDir":Ljava/io/File;
    .end local v5    # "sf":Landroid/os/StatFs;
    :cond_0
    const-wide/16 v6, -0x1

    goto :goto_0
.end method

.method public static readSystemRemain()J
    .locals 8

    .prologue
    .line 471
    invoke-static {}, Landroid/os/Environment;->getRootDirectory()Ljava/io/File;

    move-result-object v4

    .line 472
    .local v4, "root":Ljava/io/File;
    new-instance v5, Landroid/os/StatFs;

    invoke-virtual {v4}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Landroid/os/StatFs;-><init>(Ljava/lang/String;)V

    .line 473
    .local v5, "sf":Landroid/os/StatFs;
    invoke-virtual {v5}, Landroid/os/StatFs;->getBlockSize()I

    move-result v6

    int-to-long v2, v6

    .line 474
    .local v2, "blockSize":J
    invoke-virtual {v5}, Landroid/os/StatFs;->getAvailableBlocks()I

    move-result v6

    int-to-long v0, v6

    .line 475
    .local v0, "availCount":J
    mul-long v6, v0, v2

    return-wide v6
.end method

.method public static renameFile(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 4
    .param p0, "aPath"    # Ljava/lang/String;
    .param p1, "aCurrentName"    # Ljava/lang/String;
    .param p2, "aReName"    # Ljava/lang/String;

    .prologue
    .line 323
    const/4 v0, 0x0

    .line 324
    .local v0, "currentFile":Ljava/io/File;
    const/4 v1, 0x0

    .line 325
    .local v1, "reFile":Ljava/io/File;
    const-string/jumbo v2, "mounted"

    .line 326
    invoke-static {}, Landroid/os/Environment;->getExternalStorageState()Ljava/lang/String;

    move-result-object v3

    .line 325
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    .line 326
    if-eqz v2, :cond_1

    .line 327
    const-string/jumbo v2, "/"

    invoke-virtual {p0, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 328
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 330
    :cond_0
    new-instance v0, Ljava/io/File;

    .end local v0    # "currentFile":Ljava/io/File;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 331
    .restart local v0    # "currentFile":Ljava/io/File;
    new-instance v1, Ljava/io/File;

    .end local v1    # "reFile":Ljava/io/File;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 332
    .restart local v1    # "reFile":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 333
    invoke-virtual {v0, v1}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    .line 337
    :cond_1
    const/4 v2, 0x0

    return v2
.end method

.method public static setupOrOpenFile(Ljava/lang/String;)Ljava/io/File;
    .locals 4
    .param p0, "aPath"    # Ljava/lang/String;

    .prologue
    .line 283
    const-string/jumbo v2, "/"

    invoke-virtual {p0, v2}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v2

    add-int/lit8 v2, v2, 0x1

    invoke-virtual {p0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 284
    .local v0, "name":Ljava/lang/String;
    const/4 v2, 0x0

    const-string/jumbo v3, "/"

    invoke-virtual {p0, v3}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v3

    add-int/lit8 v3, v3, 0x1

    invoke-virtual {p0, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 286
    .local v1, "path":Ljava/lang/String;
    invoke-static {v1, v0}, Lcom/edutech/idauthentication/FileUtils;->setupOrOpenFile(Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;

    move-result-object v2

    return-object v2
.end method

.method public static setupOrOpenFile(Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;
    .locals 5
    .param p0, "aPath"    # Ljava/lang/String;
    .param p1, "aFileName"    # Ljava/lang/String;

    .prologue
    .line 290
    const/4 v1, 0x0

    .line 291
    .local v1, "file":Ljava/io/File;
    const-string/jumbo v2, ""

    .line 293
    .local v2, "state":Ljava/lang/String;
    :try_start_0
    invoke-static {}, Landroid/os/Environment;->getExternalStorageState()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    move-result-object v2

    .line 299
    :goto_0
    const-string/jumbo v3, "mounted"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 300
    new-instance v1, Ljava/io/File;

    .end local v1    # "file":Ljava/io/File;
    invoke-direct {v1, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 301
    .restart local v1    # "file":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v3

    if-nez v3, :cond_0

    .line 302
    invoke-virtual {v1}, Ljava/io/File;->mkdirs()Z

    .line 304
    :cond_0
    const-string/jumbo v3, "/"

    invoke-virtual {p0, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 305
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v4, "/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 307
    :cond_1
    new-instance v1, Ljava/io/File;

    .end local v1    # "file":Ljava/io/File;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 308
    .restart local v1    # "file":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v3

    if-nez v3, :cond_2

    .line 310
    :try_start_1
    invoke-virtual {v1}, Ljava/io/File;->createNewFile()Z
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 317
    :cond_2
    :goto_1
    return-object v1

    .line 311
    :catch_0
    move-exception v0

    .line 313
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_1

    .line 294
    .end local v0    # "e":Ljava/io/IOException;
    :catch_1
    move-exception v3

    goto :goto_0

    .line 296
    :catch_2
    move-exception v3

    goto :goto_0
.end method

.method public static toCaseSensitivePath(Ljava/lang/String;)Ljava/lang/String;
    .locals 7
    .param p0, "aInsensitvePath"    # Ljava/lang/String;

    .prologue
    .line 672
    if-nez p0, :cond_1

    .line 673
    const/4 p0, 0x0

    .line 703
    .end local p0    # "aInsensitvePath":Ljava/lang/String;
    .local v0, "convertedPath":Ljava/lang/String;
    .local v1, "file":Ljava/io/File;
    :cond_0
    :goto_0
    return-object p0

    .line 675
    .end local v0    # "convertedPath":Ljava/lang/String;
    .end local v1    # "file":Ljava/io/File;
    .restart local p0    # "aInsensitvePath":Ljava/lang/String;
    :cond_1
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0}, Ljava/lang/String;-><init>()V

    .line 676
    .restart local v0    # "convertedPath":Ljava/lang/String;
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 677
    .restart local v1    # "file":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 681
    invoke-virtual {v1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v3

    .line 682
    .local v3, "parentFile":Ljava/io/File;
    if-eqz v3, :cond_0

    .line 683
    invoke-virtual {v3}, Ljava/io/File;->list()[Ljava/lang/String;

    move-result-object v4

    .line 685
    .local v4, "subPaths":[Ljava/lang/String;
    if-eqz v4, :cond_0

    .line 689
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    array-length v5, v4

    if-ge v2, v5, :cond_0

    .line 690
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v6, "/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    aget-object v6, v4, v2

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 691
    invoke-virtual {v0, p0}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result v5

    if-nez v5, :cond_2

    .line 693
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/edutech/idauthentication/FileUtils;->toCaseSensitivePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v6, "/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 694
    aget-object v6, v4, v2

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 693
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    .line 689
    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_1
.end method

.method public static declared-synchronized unZip(Ljava/io/InputStream;Ljava/lang/String;Z)V
    .locals 8
    .param p0, "aIs"    # Ljava/io/InputStream;
    .param p1, "aOutPutDir"    # Ljava/lang/String;
    .param p2, "aOverride"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 596
    const-class v6, Lcom/edutech/idauthentication/FileUtils;

    monitor-enter v6

    :try_start_0
    new-instance v4, Ljava/util/zip/ZipInputStream;

    invoke-direct {v4, p0}, Ljava/util/zip/ZipInputStream;-><init>(Ljava/io/InputStream;)V

    .line 600
    .local v4, "zipInputStream":Ljava/util/zip/ZipInputStream;
    invoke-virtual {v4}, Ljava/util/zip/ZipInputStream;->getNextEntry()Ljava/util/zip/ZipEntry;

    move-result-object v3

    .line 601
    .local v3, "zipEntry":Ljava/util/zip/ZipEntry;
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 603
    .local v0, "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 604
    :goto_0
    if-nez v3, :cond_0

    .line 632
    invoke-virtual {v4}, Ljava/util/zip/ZipInputStream;->close()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 633
    monitor-exit v6

    return-void

    .line 605
    :cond_0
    :try_start_1
    invoke-virtual {v3}, Ljava/util/zip/ZipEntry;->isDirectory()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 606
    invoke-virtual {v3}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v2

    .line 607
    .local v2, "name":Ljava/lang/String;
    const/4 v5, 0x0

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v7

    add-int/lit8 v7, v7, -0x1

    invoke-virtual {v2, v5, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 609
    if-eqz v2, :cond_1

    const-string/jumbo v5, ""

    if-eq v5, v2, :cond_1

    .line 610
    new-instance v0, Ljava/io/File;

    .end local v0    # "file":Ljava/io/File;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v5, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v7, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v0, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 611
    .restart local v0    # "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->mkdir()Z

    .line 630
    .end local v2    # "name":Ljava/lang/String;
    :cond_1
    :goto_1
    invoke-virtual {v4}, Ljava/util/zip/ZipInputStream;->getNextEntry()Ljava/util/zip/ZipEntry;

    move-result-object v3

    goto :goto_0

    .line 614
    :cond_2
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v5, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-char v7, Ljava/io/File;->separatorChar:C

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 615
    invoke-virtual {v3}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 614
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 617
    .local v1, "filePath":Ljava/lang/String;
    new-instance v0, Ljava/io/File;

    .end local v0    # "file":Ljava/io/File;
    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 618
    .restart local v0    # "file":Ljava/io/File;
    if-eqz p2, :cond_3

    .line 619
    invoke-static {v1}, Lcom/edutech/idauthentication/FileUtils;->createWithOverwriteExistFile(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    .line 621
    invoke-static {v4, v0}, Lcom/edutech/idauthentication/FileUtils;->writeFile(Ljava/io/InputStream;Ljava/io/File;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    .line 596
    .end local v0    # "file":Ljava/io/File;
    .end local v1    # "filePath":Ljava/lang/String;
    .end local v3    # "zipEntry":Ljava/util/zip/ZipEntry;
    .end local v4    # "zipInputStream":Ljava/util/zip/ZipInputStream;
    :catchall_0
    move-exception v5

    monitor-exit v6

    throw v5

    .line 623
    .restart local v0    # "file":Ljava/io/File;
    .restart local v1    # "filePath":Ljava/lang/String;
    .restart local v3    # "zipEntry":Ljava/util/zip/ZipEntry;
    .restart local v4    # "zipInputStream":Ljava/util/zip/ZipInputStream;
    :cond_3
    :try_start_2
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v5

    if-nez v5, :cond_1

    .line 624
    invoke-virtual {v0}, Ljava/io/File;->createNewFile()Z

    .line 626
    invoke-static {v4, v0}, Lcom/edutech/idauthentication/FileUtils;->writeFile(Ljava/io/InputStream;Ljava/io/File;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1
.end method

.method public static declared-synchronized unZip(Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 3
    .param p0, "aZipFilePath"    # Ljava/lang/String;
    .param p1, "aOutPutDir"    # Ljava/lang/String;
    .param p2, "aOverride"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 654
    const-class v2, Lcom/edutech/idauthentication/FileUtils;

    monitor-enter v2

    :try_start_0
    new-instance v0, Ljava/io/FileInputStream;

    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 656
    .local v0, "is":Ljava/io/InputStream;
    invoke-static {v0, p1, p2}, Lcom/edutech/idauthentication/FileUtils;->unZip(Ljava/io/InputStream;Ljava/lang/String;Z)V

    .line 658
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 659
    monitor-exit v2

    return-void

    .line 654
    .end local v0    # "is":Ljava/io/InputStream;
    :catchall_0
    move-exception v1

    monitor-exit v2

    throw v1
.end method

.method public static declared-synchronized writeFile(Ljava/io/InputStream;Ljava/io/File;)V
    .locals 5
    .param p0, "aIs"    # Ljava/io/InputStream;
    .param p1, "aDesFile"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 638
    const-class v4, Lcom/edutech/idauthentication/FileUtils;

    monitor-enter v4

    :try_start_0
    new-instance v2, Ljava/io/FileOutputStream;

    invoke-direct {v2, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 639
    .local v2, "out":Ljava/io/FileOutputStream;
    const/16 v3, 0x1800

    new-array v0, v3, [B

    .line 640
    .local v0, "b":[B
    invoke-virtual {p0, v0}, Ljava/io/InputStream;->read([B)I

    move-result v1

    .line 642
    .local v1, "len":I
    const/4 v3, 0x0

    invoke-virtual {v2, v0, v3, v1}, Ljava/io/FileOutputStream;->write([BII)V

    .line 643
    :goto_0
    invoke-virtual {p0, v0}, Ljava/io/InputStream;->read([B)I

    move-result v1

    if-gtz v1, :cond_0

    .line 647
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 648
    monitor-exit v4

    return-void

    .line 644
    :cond_0
    const/4 v3, 0x0

    :try_start_1
    invoke-virtual {v2, v0, v3, v1}, Ljava/io/FileOutputStream;->write([BII)V

    .line 645
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->flush()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 638
    .end local v0    # "b":[B
    .end local v1    # "len":I
    .end local v2    # "out":Ljava/io/FileOutputStream;
    :catchall_0
    move-exception v3

    monitor-exit v4

    throw v3
.end method
