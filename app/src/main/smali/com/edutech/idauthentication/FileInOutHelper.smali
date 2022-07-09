.class public final Lcom/edutech/idauthentication/FileInOutHelper;
.super Ljava/lang/Object;
.source "FileInOutHelper.java"


# static fields
.field private static final INDEX5:I = 0x5

.field private static final INDEX6:I = 0x6

.field private static final K:I = 0x400

.field public static final STR_SLASH_MNT:Ljava/lang/String; = "/mnt"


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    return-void
.end method

.method public static addToFile(Ljava/lang/String;Ljava/lang/String;[BI)Z
    .locals 2
    .param p0, "aPath"    # Ljava/lang/String;
    .param p1, "aFileName"    # Ljava/lang/String;
    .param p2, "aData"    # [B
    .param p3, "aLength"    # I

    .prologue
    .line 138
    const-string/jumbo v0, "/"

    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 139
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 141
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p2, p3}, Lcom/edutech/idauthentication/FileInOutHelper;->addToFile(Ljava/lang/String;[BI)Z

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

    .line 147
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 149
    .local v2, "file":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 151
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v4

    .line 152
    invoke-virtual {v4}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v4

    .line 150
    invoke-virtual {p0, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v4

    .line 152
    const/4 v5, -0x1

    .line 150
    if-eq v4, v5, :cond_1

    .line 153
    invoke-static {}, Lcom/edutech/idauthentication/FileInOutHelper;->readSDCardRemain()J

    move-result-wide v4

    int-to-long v6, p2

    cmp-long v4, v4, v6

    if-gez v4, :cond_2

    .line 182
    :cond_0
    :goto_0
    return v3

    .line 157
    :cond_1
    invoke-static {}, Lcom/edutech/idauthentication/FileInOutHelper;->readSystemRemain()J

    move-result-wide v4

    int-to-long v6, p2

    cmp-long v4, v4, v6

    if-ltz v4, :cond_0

    .line 167
    :cond_2
    :try_start_0
    new-instance v0, Ljava/io/DataOutputStream;

    new-instance v4, Ljava/io/FileOutputStream;

    const/4 v5, 0x0

    invoke-direct {v4, p0, v5}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;Z)V

    invoke-direct {v0, v4}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 168
    .local v0, "dos":Ljava/io/DataOutputStream;
    if-nez p2, :cond_3

    .line 169
    invoke-virtual {v0, p1}, Ljava/io/DataOutputStream;->write([B)V

    .line 173
    :goto_1
    invoke-virtual {v0}, Ljava/io/DataOutputStream;->flush()V

    .line 174
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-virtual {v2, v4, v5}, Ljava/io/File;->setLastModified(J)Z

    .line 175
    invoke-virtual {v0}, Ljava/io/DataOutputStream;->close()V

    .line 176
    const/4 v3, 0x1

    goto :goto_0

    .line 171
    :cond_3
    const/4 v4, 0x0

    invoke-virtual {v0, p1, v4, p2}, Ljava/io/DataOutputStream;->write([BII)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 177
    .end local v0    # "dos":Ljava/io/DataOutputStream;
    :catch_0
    move-exception v1

    .line 179
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
    .line 240
    new-instance v2, Ljava/io/FileInputStream;

    invoke-direct {v2, p1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 241
    .local v2, "input":Ljava/io/FileInputStream;
    new-instance v1, Ljava/io/BufferedInputStream;

    invoke-direct {v1, v2}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .line 243
    .local v1, "inBuff":Ljava/io/BufferedInputStream;
    new-instance v5, Ljava/io/FileOutputStream;

    invoke-direct {v5, p0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 244
    .local v5, "output":Ljava/io/FileOutputStream;
    new-instance v4, Ljava/io/BufferedOutputStream;

    invoke-direct {v4, v5}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 246
    .local v4, "outBuff":Ljava/io/BufferedOutputStream;
    const/16 v6, 0x1400

    new-array v0, v6, [B

    .line 249
    .local v0, "b":[B
    :goto_0
    invoke-virtual {v1, v0}, Ljava/io/BufferedInputStream;->read([B)I

    move-result v3

    .local v3, "len":I
    const/4 v6, -0x1

    if-ne v3, v6, :cond_0

    .line 253
    invoke-virtual {v4}, Ljava/io/BufferedOutputStream;->flush()V

    .line 255
    invoke-virtual {v1}, Ljava/io/BufferedInputStream;->close()V

    .line 256
    invoke-virtual {v4}, Ljava/io/BufferedOutputStream;->close()V

    .line 257
    invoke-virtual {v5}, Ljava/io/FileOutputStream;->close()V

    .line 258
    invoke-virtual {v2}, Ljava/io/FileInputStream;->close()V

    .line 259
    return-void

    .line 250
    :cond_0
    const/4 v6, 0x0

    invoke-virtual {v4, v0, v6, v3}, Ljava/io/BufferedOutputStream;->write([BII)V

    goto :goto_0
.end method

.method public static createNewFile(Ljava/io/File;)Z
    .locals 4
    .param p0, "aFile"    # Ljava/io/File;

    .prologue
    .line 321
    const/4 v1, 0x0

    .line 322
    .local v1, "fileCreateSuccessful":Z
    if-nez p0, :cond_0

    .line 323
    const/4 v3, 0x0

    .line 338
    :goto_0
    return v3

    .line 325
    :cond_0
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v3

    if-nez v3, :cond_1

    .line 326
    invoke-virtual {p0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v2

    .line 327
    .local v2, "parentFile":Ljava/io/File;
    if-eqz v2, :cond_1

    .line 328
    invoke-virtual {v2}, Ljava/io/File;->mkdirs()Z

    .line 333
    .end local v2    # "parentFile":Ljava/io/File;
    :cond_1
    :try_start_0
    invoke-virtual {p0}, Ljava/io/File;->createNewFile()Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    :goto_1
    move v3, v1

    .line 338
    goto :goto_0

    .line 334
    :catch_0
    move-exception v0

    .line 335
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    .line 336
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
    .line 297
    const-class v3, Lcom/edutech/idauthentication/FileInOutHelper;

    monitor-enter v3

    :try_start_0
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 299
    .local v0, "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_1

    .line 300
    invoke-virtual {v0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v1

    .line 301
    .local v1, "parentFile":Ljava/io/File;
    if-eqz v1, :cond_0

    .line 302
    invoke-virtual {v1}, Ljava/io/File;->mkdirs()Z

    .line 309
    .end local v1    # "parentFile":Ljava/io/File;
    :cond_0
    :goto_0
    invoke-virtual {v0}, Ljava/io/File;->createNewFile()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 311
    monitor-exit v3

    return-object v0

    .line 306
    :cond_1
    :try_start_1
    invoke-virtual {v0}, Ljava/io/File;->delete()Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 297
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
    .line 264
    const-class v10, Lcom/edutech/idauthentication/FileInOutHelper;

    monitor-enter v10

    .line 265
    :try_start_0
    sget-char v9, Ljava/io/File;->separatorChar:C

    invoke-virtual {p0, v9}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v9

    add-int/lit8 v9, v9, 0x1

    invoke-virtual {p0, v9}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    .line 267
    .local v3, "fileName":Ljava/lang/String;
    const/4 v9, 0x0

    .line 268
    sget-char v11, Ljava/io/File;->separatorChar:C

    invoke-virtual {p0, v11}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v11

    add-int/lit8 v11, v11, 0x1

    .line 266
    invoke-virtual {p0, v9, v11}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 269
    .local v0, "dir":Ljava/lang/String;
    const-string/jumbo v4, "_"

    .line 270
    .local v4, "fileNameSuffix":Ljava/lang/String;
    const-string/jumbo v9, "."

    invoke-virtual {v3, v9}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v9

    invoke-virtual {v3, v9}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v7

    .line 271
    .local v7, "suffix":Ljava/lang/String;
    const/4 v9, 0x0

    .line 272
    const-string/jumbo v11, "."

    invoke-virtual {v3, v11}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v11

    .line 271
    invoke-virtual {v3, v9, v11}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    .line 273
    .local v5, "fileNameWithoutSuffix":Ljava/lang/String;
    const/4 v1, 0x1

    .line 274
    .local v1, "duplicateCount":I
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 276
    .local v2, "file":Ljava/io/File;
    :goto_0
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v9

    if-nez v9, :cond_1

    .line 284
    invoke-virtual {v2}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v6

    .line 285
    .local v6, "parentFile":Ljava/io/File;
    if-eqz v6, :cond_0

    .line 286
    invoke-virtual {v6}, Ljava/io/File;->mkdirs()Z

    .line 288
    :cond_0
    invoke-virtual {v2}, Ljava/io/File;->createNewFile()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 289
    const/4 v6, 0x0

    .line 291
    monitor-exit v10

    return-object v2

    .line 278
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

    .line 279
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

    .line 280
    new-instance v2, Ljava/io/File;

    .end local v2    # "file":Ljava/io/File;
    invoke-direct {v2, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 281
    .restart local v2    # "file":Ljava/io/File;
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 264
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

.method public static declared-synchronized deleteDir(Ljava/io/File;)V
    .locals 5
    .param p0, "aDir"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 343
    const-class v4, Lcom/edutech/idauthentication/FileInOutHelper;

    monitor-enter v4

    if-eqz p0, :cond_0

    :try_start_0
    invoke-virtual {p0}, Ljava/io/File;->isDirectory()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 344
    invoke-virtual {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v0

    .line 345
    .local v0, "entries":[Ljava/io/File;
    array-length v2, v0

    .line 347
    .local v2, "sz":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-lt v1, v2, :cond_1

    .line 356
    .end local v0    # "entries":[Ljava/io/File;
    .end local v1    # "i":I
    .end local v2    # "sz":I
    :cond_0
    invoke-virtual {p0}, Ljava/io/File;->delete()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 357
    monitor-exit v4

    return-void

    .line 348
    .restart local v0    # "entries":[Ljava/io/File;
    .restart local v1    # "i":I
    .restart local v2    # "sz":I
    :cond_1
    :try_start_1
    aget-object v3, v0, v1

    invoke-virtual {v3}, Ljava/io/File;->isDirectory()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 349
    aget-object v3, v0, v1

    invoke-static {v3}, Lcom/edutech/idauthentication/FileInOutHelper;->deleteDir(Ljava/io/File;)V

    .line 347
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 351
    :cond_2
    aget-object v3, v0, v1

    invoke-virtual {v3}, Ljava/io/File;->delete()Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    .line 343
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
    .line 196
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 197
    .local v0, "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 199
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 200
    const/4 v1, 0x0

    .line 202
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
    .line 188
    const-string/jumbo v0, "/"

    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 189
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 191
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/edutech/idauthentication/FileInOutHelper;->deleteFile(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public static fileIsExists(Ljava/lang/String;)Z
    .locals 3
    .param p0, "aPath"    # Ljava/lang/String;

    .prologue
    .line 123
    const/4 v0, 0x0

    .line 124
    .local v0, "file":Ljava/io/File;
    const-string/jumbo v1, "mounted"

    .line 125
    invoke-static {}, Landroid/os/Environment;->getExternalStorageState()Ljava/lang/String;

    move-result-object v2

    .line 124
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    .line 125
    if-eqz v1, :cond_0

    .line 126
    new-instance v0, Ljava/io/File;

    .end local v0    # "file":Ljava/io/File;
    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 127
    .restart local v0    # "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 129
    const/4 v1, 0x1

    .line 132
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
    .line 115
    const-string/jumbo v0, "/"

    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 116
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 118
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/edutech/idauthentication/FileInOutHelper;->fileIsExists(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static installApk(Landroid/content/Context;Ljava/lang/String;)V
    .locals 3
    .param p0, "aContext"    # Landroid/content/Context;
    .param p1, "aUri"    # Ljava/lang/String;

    .prologue
    .line 445
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v1, "android.intent.action.VIEW"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 446
    .local v0, "intent":Landroid/content/Intent;
    const/high16 v1, 0x10000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 448
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v1}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v1

    .line 449
    const-string/jumbo v2, "application/vnd.android.package-archive"

    .line 447
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    .line 450
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 451
    return-void
.end method

.method public static loadFdisk(Ljava/lang/String;)[B
    .locals 10
    .param p0, "aPath"    # Ljava/lang/String;

    .prologue
    .line 94
    const/4 v3, 0x0

    .line 95
    .local v3, "temp":[B
    const/4 v1, 0x0

    .line 97
    .local v1, "file":Ljava/io/File;
    new-instance v1, Ljava/io/File;

    .end local v1    # "file":Ljava/io/File;
    invoke-direct {v1, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 98
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

    .line 110
    .end local v3    # "temp":[B
    .local v4, "temp":[B
    :goto_0
    return-object v4

    .line 101
    .end local v4    # "temp":[B
    .restart local v3    # "temp":[B
    :cond_0
    invoke-virtual {v1}, Ljava/io/File;->length()J

    move-result-wide v6

    long-to-int v5, v6

    new-array v3, v5, [B

    .line 104
    :try_start_0
    new-instance v2, Ljava/io/FileInputStream;

    invoke-direct {v2, v1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 105
    .local v2, "fis":Ljava/io/FileInputStream;
    invoke-virtual {v2, v3}, Ljava/io/FileInputStream;->read([B)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-object v4, v3

    .line 110
    .end local v3    # "temp":[B
    .restart local v4    # "temp":[B
    goto :goto_0

    .line 106
    .end local v2    # "fis":Ljava/io/FileInputStream;
    .end local v4    # "temp":[B
    .restart local v3    # "temp":[B
    :catch_0
    move-exception v0

    .local v0, "e":Ljava/lang/Exception;
    move-object v4, v3

    .line 108
    .end local v3    # "temp":[B
    .restart local v4    # "temp":[B
    goto :goto_0
.end method

.method public static loadFdisk(Ljava/lang/String;Ljava/lang/String;)[B
    .locals 2
    .param p0, "aPath"    # Ljava/lang/String;
    .param p1, "aFileName"    # Ljava/lang/String;

    .prologue
    .line 86
    const-string/jumbo v0, "/"

    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 87
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 89
    :cond_0
    invoke-static {p0}, Lcom/edutech/idauthentication/FileInOutHelper;->loadFdisk(Ljava/lang/String;)[B

    move-result-object v0

    return-object v0
.end method

.method public static readSDCardRemain()J
    .locals 8

    .prologue
    .line 208
    const-string/jumbo v6, "mounted"

    .line 209
    invoke-static {}, Landroid/os/Environment;->getExternalStorageState()Ljava/lang/String;

    move-result-object v7

    .line 208
    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    .line 209
    if-eqz v6, :cond_0

    .line 210
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v4

    .line 211
    .local v4, "sdcardDir":Ljava/io/File;
    new-instance v5, Landroid/os/StatFs;

    invoke-virtual {v4}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Landroid/os/StatFs;-><init>(Ljava/lang/String;)V

    .line 212
    .local v5, "sf":Landroid/os/StatFs;
    invoke-virtual {v5}, Landroid/os/StatFs;->getBlockSize()I

    move-result v6

    int-to-long v2, v6

    .line 214
    .local v2, "blockSize":J
    invoke-virtual {v5}, Landroid/os/StatFs;->getAvailableBlocks()I

    move-result v6

    int-to-long v0, v6

    .line 219
    .local v0, "availCount":J
    mul-long v6, v0, v2

    .line 221
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
    .line 226
    invoke-static {}, Landroid/os/Environment;->getRootDirectory()Ljava/io/File;

    move-result-object v4

    .line 227
    .local v4, "root":Ljava/io/File;
    new-instance v5, Landroid/os/StatFs;

    invoke-virtual {v4}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Landroid/os/StatFs;-><init>(Ljava/lang/String;)V

    .line 228
    .local v5, "sf":Landroid/os/StatFs;
    invoke-virtual {v5}, Landroid/os/StatFs;->getBlockSize()I

    move-result v6

    int-to-long v2, v6

    .line 230
    .local v2, "blockSize":J
    invoke-virtual {v5}, Landroid/os/StatFs;->getAvailableBlocks()I

    move-result v6

    int-to-long v0, v6

    .line 231
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
    .line 67
    const/4 v0, 0x0

    .line 68
    .local v0, "currentFile":Ljava/io/File;
    const/4 v1, 0x0

    .line 69
    .local v1, "reFile":Ljava/io/File;
    const-string/jumbo v2, "mounted"

    .line 70
    invoke-static {}, Landroid/os/Environment;->getExternalStorageState()Ljava/lang/String;

    move-result-object v3

    .line 69
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    .line 70
    if-eqz v2, :cond_1

    .line 71
    const-string/jumbo v2, "/"

    invoke-virtual {p0, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 72
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 74
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

    .line 75
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

    .line 76
    .restart local v1    # "reFile":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 77
    invoke-virtual {v0, v1}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    .line 81
    :cond_1
    const/4 v2, 0x0

    return v2
.end method

.method public static setupOrOpenFile(Ljava/lang/String;)Ljava/io/File;
    .locals 4
    .param p0, "aPath"    # Ljava/lang/String;

    .prologue
    .line 33
    const-string/jumbo v2, "/"

    invoke-virtual {p0, v2}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v2

    add-int/lit8 v2, v2, 0x1

    invoke-virtual {p0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 34
    .local v0, "name":Ljava/lang/String;
    const/4 v2, 0x0

    const-string/jumbo v3, "/"

    invoke-virtual {p0, v3}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v3

    add-int/lit8 v3, v3, 0x1

    invoke-virtual {p0, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 37
    .local v1, "path":Ljava/lang/String;
    invoke-static {v1, v0}, Lcom/edutech/idauthentication/FileInOutHelper;->setupOrOpenFile(Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;

    move-result-object v2

    return-object v2
.end method

.method public static setupOrOpenFile(Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;
    .locals 4
    .param p0, "aPath"    # Ljava/lang/String;
    .param p1, "aFileName"    # Ljava/lang/String;

    .prologue
    .line 41
    const/4 v1, 0x0

    .line 42
    .local v1, "file":Ljava/io/File;
    const-string/jumbo v2, "mounted"

    .line 43
    invoke-static {}, Landroid/os/Environment;->getExternalStorageState()Ljava/lang/String;

    move-result-object v3

    .line 42
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    .line 43
    if-eqz v2, :cond_2

    .line 44
    new-instance v1, Ljava/io/File;

    .end local v1    # "file":Ljava/io/File;
    invoke-direct {v1, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 45
    .restart local v1    # "file":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_0

    .line 46
    invoke-virtual {v1}, Ljava/io/File;->mkdirs()Z

    .line 48
    :cond_0
    const-string/jumbo v2, "/"

    invoke-virtual {p0, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 49
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 51
    :cond_1
    new-instance v1, Ljava/io/File;

    .end local v1    # "file":Ljava/io/File;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 52
    .restart local v1    # "file":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_2

    .line 54
    :try_start_0
    invoke-virtual {v1}, Ljava/io/File;->createNewFile()Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 61
    :cond_2
    :goto_0
    return-object v1

    .line 55
    :catch_0
    move-exception v0

    .line 57
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0
.end method

.method public static toCaseSensitivePath(Ljava/lang/String;)Ljava/lang/String;
    .locals 7
    .param p0, "aInsensitvePath"    # Ljava/lang/String;

    .prologue
    .line 487
    if-nez p0, :cond_1

    .line 488
    const/4 p0, 0x0

    .line 521
    .end local p0    # "aInsensitvePath":Ljava/lang/String;
    .local v0, "convertedPath":Ljava/lang/String;
    .local v1, "file":Ljava/io/File;
    :cond_0
    :goto_0
    return-object p0

    .line 490
    .end local v0    # "convertedPath":Ljava/lang/String;
    .end local v1    # "file":Ljava/io/File;
    .restart local p0    # "aInsensitvePath":Ljava/lang/String;
    :cond_1
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0}, Ljava/lang/String;-><init>()V

    .line 491
    .restart local v0    # "convertedPath":Ljava/lang/String;
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 492
    .restart local v1    # "file":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 499
    invoke-virtual {v1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v3

    .line 500
    .local v3, "parentFile":Ljava/io/File;
    if-eqz v3, :cond_0

    .line 501
    invoke-virtual {v3}, Ljava/io/File;->list()[Ljava/lang/String;

    move-result-object v4

    .line 503
    .local v4, "subPaths":[Ljava/lang/String;
    if-eqz v4, :cond_0

    .line 507
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    array-length v5, v4

    if-ge v2, v5, :cond_0

    .line 508
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

    .line 509
    invoke-virtual {v0, p0}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result v5

    if-nez v5, :cond_2

    .line 511
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/edutech/idauthentication/FileInOutHelper;->toCaseSensitivePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v6, "/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 512
    aget-object v6, v4, v2

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 511
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    .line 507
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
    .line 371
    const-class v6, Lcom/edutech/idauthentication/FileInOutHelper;

    monitor-enter v6

    :try_start_0
    new-instance v4, Ljava/util/zip/ZipInputStream;

    invoke-direct {v4, p0}, Ljava/util/zip/ZipInputStream;-><init>(Ljava/io/InputStream;)V

    .line 375
    .local v4, "zipInputStream":Ljava/util/zip/ZipInputStream;
    invoke-virtual {v4}, Ljava/util/zip/ZipInputStream;->getNextEntry()Ljava/util/zip/ZipEntry;

    move-result-object v3

    .line 376
    .local v3, "zipEntry":Ljava/util/zip/ZipEntry;
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 378
    .local v0, "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 379
    :goto_0
    if-nez v3, :cond_0

    .line 408
    invoke-virtual {v4}, Ljava/util/zip/ZipInputStream;->close()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 409
    monitor-exit v6

    return-void

    .line 380
    :cond_0
    :try_start_1
    invoke-virtual {v3}, Ljava/util/zip/ZipEntry;->isDirectory()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 381
    invoke-virtual {v3}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v2

    .line 382
    .local v2, "name":Ljava/lang/String;
    const/4 v5, 0x0

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v7

    add-int/lit8 v7, v7, -0x1

    invoke-virtual {v2, v5, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 384
    if-eqz v2, :cond_1

    const-string/jumbo v5, ""

    if-eq v5, v2, :cond_1

    .line 385
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

    .line 386
    .restart local v0    # "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->mkdir()Z

    .line 406
    .end local v2    # "name":Ljava/lang/String;
    :cond_1
    :goto_1
    invoke-virtual {v4}, Ljava/util/zip/ZipInputStream;->getNextEntry()Ljava/util/zip/ZipEntry;

    move-result-object v3

    goto :goto_0

    .line 389
    :cond_2
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v5, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-char v7, Ljava/io/File;->separatorChar:C

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 390
    invoke-virtual {v3}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 389
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 392
    .local v1, "filePath":Ljava/lang/String;
    new-instance v0, Ljava/io/File;

    .end local v0    # "file":Ljava/io/File;
    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 393
    .restart local v0    # "file":Ljava/io/File;
    if-eqz p2, :cond_3

    .line 394
    invoke-static {v1}, Lcom/edutech/idauthentication/FileInOutHelper;->createWithOverwriteExistFile(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    .line 396
    invoke-static {v4, v0}, Lcom/edutech/idauthentication/FileInOutHelper;->writeFile(Ljava/io/InputStream;Ljava/io/File;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    .line 371
    .end local v0    # "file":Ljava/io/File;
    .end local v1    # "filePath":Ljava/lang/String;
    .end local v3    # "zipEntry":Ljava/util/zip/ZipEntry;
    .end local v4    # "zipInputStream":Ljava/util/zip/ZipInputStream;
    :catchall_0
    move-exception v5

    monitor-exit v6

    throw v5

    .line 398
    .restart local v0    # "file":Ljava/io/File;
    .restart local v1    # "filePath":Ljava/lang/String;
    .restart local v3    # "zipEntry":Ljava/util/zip/ZipEntry;
    .restart local v4    # "zipInputStream":Ljava/util/zip/ZipInputStream;
    :cond_3
    :try_start_2
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v5

    if-nez v5, :cond_1

    .line 399
    invoke-virtual {v0}, Ljava/io/File;->createNewFile()Z

    .line 401
    invoke-static {v4, v0}, Lcom/edutech/idauthentication/FileInOutHelper;->writeFile(Ljava/io/InputStream;Ljava/io/File;)V
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
    .line 430
    const-class v2, Lcom/edutech/idauthentication/FileInOutHelper;

    monitor-enter v2

    :try_start_0
    new-instance v0, Ljava/io/FileInputStream;

    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 432
    .local v0, "is":Ljava/io/InputStream;
    invoke-static {v0, p1, p2}, Lcom/edutech/idauthentication/FileInOutHelper;->unZip(Ljava/io/InputStream;Ljava/lang/String;Z)V

    .line 434
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 435
    monitor-exit v2

    return-void

    .line 430
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
    .line 414
    const-class v4, Lcom/edutech/idauthentication/FileInOutHelper;

    monitor-enter v4

    :try_start_0
    new-instance v2, Ljava/io/FileOutputStream;

    invoke-direct {v2, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 415
    .local v2, "out":Ljava/io/FileOutputStream;
    const/16 v3, 0x1800

    new-array v0, v3, [B

    .line 416
    .local v0, "b":[B
    invoke-virtual {p0, v0}, Ljava/io/InputStream;->read([B)I

    move-result v1

    .line 418
    .local v1, "len":I
    const/4 v3, 0x0

    invoke-virtual {v2, v0, v3, v1}, Ljava/io/FileOutputStream;->write([BII)V

    .line 419
    :goto_0
    invoke-virtual {p0, v0}, Ljava/io/InputStream;->read([B)I

    move-result v1

    if-gtz v1, :cond_0

    .line 423
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 424
    monitor-exit v4

    return-void

    .line 420
    :cond_0
    const/4 v3, 0x0

    :try_start_1
    invoke-virtual {v2, v0, v3, v1}, Ljava/io/FileOutputStream;->write([BII)V

    .line 421
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->flush()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 414
    .end local v0    # "b":[B
    .end local v1    # "len":I
    .end local v2    # "out":Ljava/io/FileOutputStream;
    :catchall_0
    move-exception v3

    monitor-exit v4

    throw v3
.end method
