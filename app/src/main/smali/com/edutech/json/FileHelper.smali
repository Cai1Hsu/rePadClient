.class public Lcom/edutech/json/FileHelper;
.super Ljava/lang/Object;
.source "FileHelper.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static copyAllDirectoryFile(Ljava/lang/String;Ljava/lang/String;)V
    .locals 7
    .param p0, "srcPath"    # Ljava/lang/String;
    .param p1, "desPath"    # Ljava/lang/String;

    .prologue
    .line 50
    new-instance v4, Ljava/io/File;

    invoke-direct {v4, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 51
    .local v4, "srcFile":Ljava/io/File;
    invoke-virtual {v4}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v0

    .line 52
    .local v0, "files":[Ljava/io/File;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v5, v0

    if-lt v1, v5, :cond_0

    .line 58
    return-void

    .line 53
    :cond_0
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    aget-object v6, v0, v1

    invoke-virtual {v6}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 54
    .local v3, "path":Ljava/lang/String;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    aget-object v6, v0, v1

    invoke-virtual {v6}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 56
    .local v2, "newpathString":Ljava/lang/String;
    invoke-static {v3, v2}, Lcom/edutech/json/FileHelper;->copyFile(Ljava/lang/String;Ljava/lang/String;)V

    .line 52
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method public static copyFile(Ljava/lang/String;Ljava/lang/String;)V
    .locals 7
    .param p0, "oldPath"    # Ljava/lang/String;
    .param p1, "newPath"    # Ljava/lang/String;

    .prologue
    .line 68
    const/4 v1, 0x0

    .line 69
    .local v1, "byteread":I
    :try_start_0
    new-instance v5, Ljava/io/File;

    invoke-direct {v5, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 70
    .local v5, "oldfile":Ljava/io/File;
    invoke-virtual {v5}, Ljava/io/File;->exists()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 71
    new-instance v4, Ljava/io/FileInputStream;

    invoke-direct {v4, p0}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    .line 72
    .local v4, "inStream":Ljava/io/InputStream;
    new-instance v3, Ljava/io/FileOutputStream;

    invoke-direct {v3, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    .line 73
    .local v3, "fs":Ljava/io/FileOutputStream;
    const/16 v6, 0x5a4

    new-array v0, v6, [B

    .line 74
    .local v0, "buffer":[B
    :goto_0
    invoke-virtual {v4, v0}, Ljava/io/InputStream;->read([B)I

    move-result v1

    const/4 v6, -0x1

    if-ne v1, v6, :cond_2

    .line 77
    if-eqz v4, :cond_0

    .line 78
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V

    .line 80
    :cond_0
    if-eqz v3, :cond_1

    .line 81
    invoke-virtual {v3}, Ljava/io/FileOutputStream;->close()V

    .line 88
    .end local v0    # "buffer":[B
    .end local v3    # "fs":Ljava/io/FileOutputStream;
    .end local v4    # "inStream":Ljava/io/InputStream;
    .end local v5    # "oldfile":Ljava/io/File;
    :cond_1
    :goto_1
    return-void

    .line 75
    .restart local v0    # "buffer":[B
    .restart local v3    # "fs":Ljava/io/FileOutputStream;
    .restart local v4    # "inStream":Ljava/io/InputStream;
    .restart local v5    # "oldfile":Ljava/io/File;
    :cond_2
    const/4 v6, 0x0

    invoke-virtual {v3, v0, v6, v1}, Ljava/io/FileOutputStream;->write([BII)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 84
    .end local v0    # "buffer":[B
    .end local v3    # "fs":Ljava/io/FileOutputStream;
    .end local v4    # "inStream":Ljava/io/InputStream;
    .end local v5    # "oldfile":Ljava/io/File;
    :catch_0
    move-exception v2

    .line 86
    .local v2, "e":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1
.end method

.method public static deleteBook()V
    .locals 0

    .prologue
    .line 42
    return-void
.end method

.method public static deleteDir(Ljava/lang/String;)V
    .locals 3
    .param p0, "deleteDir"    # Ljava/lang/String;

    .prologue
    .line 18
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 19
    .local v0, "bookdirFile":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 21
    :try_start_0
    invoke-static {v0}, Lcom/edutech/idauthentication/FileInOutHelper;->deleteDir(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 28
    :cond_0
    :goto_0
    return-void

    .line 23
    :catch_0
    move-exception v1

    .line 25
    .local v1, "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0
.end method

.method public static deleteFile(Ljava/lang/String;)V
    .locals 2
    .param p0, "path"    # Ljava/lang/String;

    .prologue
    .line 31
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 32
    .local v0, "delFile":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 34
    invoke-static {p0}, Lcom/edutech/idauthentication/FileInOutHelper;->deleteFile(Ljava/lang/String;)I

    .line 37
    :cond_0
    return-void
.end method
