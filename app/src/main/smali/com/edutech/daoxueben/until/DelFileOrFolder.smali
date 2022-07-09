.class public Lcom/edutech/daoxueben/until/DelFileOrFolder;
.super Ljava/lang/Object;
.source "DelFileOrFolder.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static DeleteFolder(Ljava/lang/String;)Z
    .locals 3
    .param p0, "sPath"    # Ljava/lang/String;

    .prologue
    .line 15
    sget-object v2, Lcom/edutech/daoxueben/sysconfig/AppEnvironment;->FOLDER_MAIN:Ljava/lang/String;

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 16
    const/4 v1, 0x1

    .line 28
    :cond_0
    :goto_0
    return v1

    .line 18
    :cond_1
    const/4 v1, 0x0

    .line 19
    .local v1, "flag":Z
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 21
    .local v0, "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 25
    invoke-virtual {v0}, Ljava/io/File;->isFile()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 26
    invoke-static {p0}, Lcom/edutech/daoxueben/until/DelFileOrFolder;->deleteFile(Ljava/lang/String;)Z

    move-result v1

    goto :goto_0

    .line 28
    :cond_2
    invoke-static {p0}, Lcom/edutech/daoxueben/until/DelFileOrFolder;->deleteDirectory(Ljava/lang/String;)Z

    move-result v1

    goto :goto_0
.end method

.method public static deleteDirectory(Ljava/lang/String;)Z
    .locals 7
    .param p0, "sPath"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    .line 55
    sget-object v5, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {p0, v5}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 56
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v6, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 58
    :cond_0
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 60
    .local v0, "dirFile":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v5

    if-nez v5, :cond_2

    .line 82
    :cond_1
    :goto_0
    return v4

    .line 63
    :cond_2
    const/4 v2, 0x1

    .line 65
    .local v2, "flag":Z
    invoke-virtual {v0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v1

    .line 66
    .local v1, "files":[Ljava/io/File;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1
    array-length v5, v1

    if-lt v3, v5, :cond_4

    .line 77
    :cond_3
    :goto_2
    if-eqz v2, :cond_1

    .line 79
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 80
    const/4 v4, 0x1

    goto :goto_0

    .line 68
    :cond_4
    aget-object v5, v1, v3

    invoke-virtual {v5}, Ljava/io/File;->isFile()Z

    move-result v5

    if-eqz v5, :cond_6

    .line 69
    aget-object v5, v1, v3

    invoke-virtual {v5}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/edutech/daoxueben/until/DelFileOrFolder;->deleteFile(Ljava/lang/String;)Z

    move-result v2

    .line 70
    if-eqz v2, :cond_3

    .line 66
    :cond_5
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 73
    :cond_6
    aget-object v5, v1, v3

    invoke-virtual {v5}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/edutech/daoxueben/until/DelFileOrFolder;->deleteDirectory(Ljava/lang/String;)Z

    move-result v2

    .line 74
    if-nez v2, :cond_5

    goto :goto_2
.end method

.method public static deleteFile(Ljava/lang/String;)Z
    .locals 3
    .param p0, "sPath"    # Ljava/lang/String;

    .prologue
    .line 39
    const/4 v1, 0x0

    .line 40
    .local v1, "flag":Z
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 42
    .local v0, "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->isFile()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 43
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    move-result v1

    .line 45
    :cond_0
    return v1
.end method
