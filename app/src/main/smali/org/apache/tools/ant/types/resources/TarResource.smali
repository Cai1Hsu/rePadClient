.class public Lorg/apache/tools/ant/types/resources/TarResource;
.super Lorg/apache/tools/ant/types/resources/ArchiveResource;
.source "TarResource.java"


# instance fields
.field private gid:I

.field private groupName:Ljava/lang/String;

.field private uid:I

.field private userName:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 46
    invoke-direct {p0}, Lorg/apache/tools/ant/types/resources/ArchiveResource;-><init>()V

    .line 38
    const-string/jumbo v0, ""

    iput-object v0, p0, Lorg/apache/tools/ant/types/resources/TarResource;->userName:Ljava/lang/String;

    .line 39
    const-string/jumbo v0, ""

    iput-object v0, p0, Lorg/apache/tools/ant/types/resources/TarResource;->groupName:Ljava/lang/String;

    .line 47
    return-void
.end method

.method public constructor <init>(Ljava/io/File;Lorg/apache/tools/tar/TarEntry;)V
    .locals 1
    .param p1, "a"    # Ljava/io/File;
    .param p2, "e"    # Lorg/apache/tools/tar/TarEntry;

    .prologue
    .line 56
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lorg/apache/tools/ant/types/resources/ArchiveResource;-><init>(Ljava/io/File;Z)V

    .line 38
    const-string/jumbo v0, ""

    iput-object v0, p0, Lorg/apache/tools/ant/types/resources/TarResource;->userName:Ljava/lang/String;

    .line 39
    const-string/jumbo v0, ""

    iput-object v0, p0, Lorg/apache/tools/ant/types/resources/TarResource;->groupName:Ljava/lang/String;

    .line 57
    invoke-direct {p0, p2}, Lorg/apache/tools/ant/types/resources/TarResource;->setEntry(Lorg/apache/tools/tar/TarEntry;)V

    .line 58
    return-void
.end method

.method public constructor <init>(Lorg/apache/tools/ant/types/Resource;Lorg/apache/tools/tar/TarEntry;)V
    .locals 1
    .param p1, "a"    # Lorg/apache/tools/ant/types/Resource;
    .param p2, "e"    # Lorg/apache/tools/tar/TarEntry;

    .prologue
    .line 67
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lorg/apache/tools/ant/types/resources/ArchiveResource;-><init>(Lorg/apache/tools/ant/types/Resource;Z)V

    .line 38
    const-string/jumbo v0, ""

    iput-object v0, p0, Lorg/apache/tools/ant/types/resources/TarResource;->userName:Ljava/lang/String;

    .line 39
    const-string/jumbo v0, ""

    iput-object v0, p0, Lorg/apache/tools/ant/types/resources/TarResource;->groupName:Ljava/lang/String;

    .line 68
    invoke-direct {p0, p2}, Lorg/apache/tools/ant/types/resources/TarResource;->setEntry(Lorg/apache/tools/tar/TarEntry;)V

    .line 69
    return-void
.end method

.method private setEntry(Lorg/apache/tools/tar/TarEntry;)V
    .locals 2
    .param p1, "e"    # Lorg/apache/tools/tar/TarEntry;

    .prologue
    .line 182
    if-nez p1, :cond_0

    .line 183
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/resources/TarResource;->setExists(Z)V

    .line 196
    :goto_0
    return-void

    .line 186
    :cond_0
    invoke-virtual {p1}, Lorg/apache/tools/tar/TarEntry;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/resources/TarResource;->setName(Ljava/lang/String;)V

    .line 187
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/resources/TarResource;->setExists(Z)V

    .line 188
    invoke-virtual {p1}, Lorg/apache/tools/tar/TarEntry;->getModTime()Ljava/util/Date;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lorg/apache/tools/ant/types/resources/TarResource;->setLastModified(J)V

    .line 189
    invoke-virtual {p1}, Lorg/apache/tools/tar/TarEntry;->isDirectory()Z

    move-result v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/resources/TarResource;->setDirectory(Z)V

    .line 190
    invoke-virtual {p1}, Lorg/apache/tools/tar/TarEntry;->getSize()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lorg/apache/tools/ant/types/resources/TarResource;->setSize(J)V

    .line 191
    invoke-virtual {p1}, Lorg/apache/tools/tar/TarEntry;->getMode()I

    move-result v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/resources/TarResource;->setMode(I)V

    .line 192
    invoke-virtual {p1}, Lorg/apache/tools/tar/TarEntry;->getUserName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/types/resources/TarResource;->userName:Ljava/lang/String;

    .line 193
    invoke-virtual {p1}, Lorg/apache/tools/tar/TarEntry;->getGroupName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/types/resources/TarResource;->groupName:Ljava/lang/String;

    .line 194
    invoke-virtual {p1}, Lorg/apache/tools/tar/TarEntry;->getUserId()I

    move-result v0

    iput v0, p0, Lorg/apache/tools/ant/types/resources/TarResource;->uid:I

    .line 195
    invoke-virtual {p1}, Lorg/apache/tools/tar/TarEntry;->getGroupId()I

    move-result v0

    iput v0, p0, Lorg/apache/tools/ant/types/resources/TarResource;->gid:I

    goto :goto_0
.end method


# virtual methods
.method protected fetchEntry()V
    .locals 7

    .prologue
    .line 159
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/TarResource;->getArchive()Lorg/apache/tools/ant/types/Resource;

    move-result-object v0

    .line 160
    .local v0, "archive":Lorg/apache/tools/ant/types/Resource;
    const/4 v2, 0x0

    .line 162
    .local v2, "i":Lorg/apache/tools/tar/TarInputStream;
    :try_start_0
    new-instance v3, Lorg/apache/tools/tar/TarInputStream;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Resource;->getInputStream()Ljava/io/InputStream;

    move-result-object v5

    invoke-direct {v3, v5}, Lorg/apache/tools/tar/TarInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 163
    .end local v2    # "i":Lorg/apache/tools/tar/TarInputStream;
    .local v3, "i":Lorg/apache/tools/tar/TarInputStream;
    const/4 v4, 0x0

    .line 164
    .local v4, "te":Lorg/apache/tools/tar/TarEntry;
    :cond_0
    :try_start_1
    invoke-virtual {v3}, Lorg/apache/tools/tar/TarInputStream;->getNextEntry()Lorg/apache/tools/tar/TarEntry;

    move-result-object v4

    if-eqz v4, :cond_2

    .line 165
    invoke-virtual {v4}, Lorg/apache/tools/tar/TarEntry;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/TarResource;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 166
    invoke-direct {p0, v4}, Lorg/apache/tools/ant/types/resources/TarResource;->setEntry(Lorg/apache/tools/tar/TarEntry;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 174
    if-eqz v3, :cond_1

    .line 175
    invoke-static {v3}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    .line 179
    :cond_1
    :goto_0
    return-void

    .line 174
    :cond_2
    if-eqz v3, :cond_3

    .line 175
    invoke-static {v3}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    .line 178
    :cond_3
    const/4 v5, 0x0

    invoke-direct {p0, v5}, Lorg/apache/tools/ant/types/resources/TarResource;->setEntry(Lorg/apache/tools/tar/TarEntry;)V

    goto :goto_0

    .line 170
    .end local v3    # "i":Lorg/apache/tools/tar/TarInputStream;
    .end local v4    # "te":Lorg/apache/tools/tar/TarEntry;
    .restart local v2    # "i":Lorg/apache/tools/tar/TarInputStream;
    :catch_0
    move-exception v1

    .line 171
    .local v1, "e":Ljava/io/IOException;
    :goto_1
    :try_start_2
    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x4

    invoke-virtual {p0, v5, v6}, Lorg/apache/tools/ant/types/resources/TarResource;->log(Ljava/lang/String;I)V

    .line 172
    new-instance v5, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v5, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v5
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 174
    .end local v1    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v5

    :goto_2
    if-eqz v2, :cond_4

    .line 175
    invoke-static {v2}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    :cond_4
    throw v5

    .line 174
    .end local v2    # "i":Lorg/apache/tools/tar/TarInputStream;
    .restart local v3    # "i":Lorg/apache/tools/tar/TarInputStream;
    .restart local v4    # "te":Lorg/apache/tools/tar/TarEntry;
    :catchall_1
    move-exception v5

    move-object v2, v3

    .end local v3    # "i":Lorg/apache/tools/tar/TarInputStream;
    .restart local v2    # "i":Lorg/apache/tools/tar/TarInputStream;
    goto :goto_2

    .line 170
    .end local v2    # "i":Lorg/apache/tools/tar/TarInputStream;
    .restart local v3    # "i":Lorg/apache/tools/tar/TarInputStream;
    :catch_1
    move-exception v1

    move-object v2, v3

    .end local v3    # "i":Lorg/apache/tools/tar/TarInputStream;
    .restart local v2    # "i":Lorg/apache/tools/tar/TarInputStream;
    goto :goto_1
.end method

.method public getGid()I
    .locals 1

    .prologue
    .line 148
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/TarResource;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 149
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/TarResource;->getCheckedRef()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/resources/TarResource;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/resources/TarResource;->getGid()I

    move-result v0

    .line 152
    :goto_0
    return v0

    .line 151
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/TarResource;->checkEntry()V

    .line 152
    iget v0, p0, Lorg/apache/tools/ant/types/resources/TarResource;->gid:I

    goto :goto_0
.end method

.method public getGroup()Ljava/lang/String;
    .locals 1

    .prologue
    .line 126
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/TarResource;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 127
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/TarResource;->getCheckedRef()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/resources/TarResource;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/resources/TarResource;->getGroup()Ljava/lang/String;

    move-result-object v0

    .line 130
    :goto_0
    return-object v0

    .line 129
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/TarResource;->checkEntry()V

    .line 130
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/TarResource;->groupName:Ljava/lang/String;

    goto :goto_0
.end method

.method public getInputStream()Ljava/io/InputStream;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 78
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/TarResource;->isReference()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 79
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/TarResource;->getCheckedRef()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/apache/tools/ant/types/Resource;

    invoke-virtual {v3}, Lorg/apache/tools/ant/types/Resource;->getInputStream()Ljava/io/InputStream;

    move-result-object v1

    .line 86
    :goto_0
    return-object v1

    .line 81
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/TarResource;->getArchive()Lorg/apache/tools/ant/types/Resource;

    move-result-object v0

    .line 82
    .local v0, "archive":Lorg/apache/tools/ant/types/Resource;
    new-instance v1, Lorg/apache/tools/tar/TarInputStream;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Resource;->getInputStream()Ljava/io/InputStream;

    move-result-object v3

    invoke-direct {v1, v3}, Lorg/apache/tools/tar/TarInputStream;-><init>(Ljava/io/InputStream;)V

    .line 83
    .local v1, "i":Lorg/apache/tools/tar/TarInputStream;
    const/4 v2, 0x0

    .line 84
    .local v2, "te":Lorg/apache/tools/tar/TarEntry;
    :cond_1
    invoke-virtual {v1}, Lorg/apache/tools/tar/TarInputStream;->getNextEntry()Lorg/apache/tools/tar/TarEntry;

    move-result-object v2

    if-eqz v2, :cond_2

    .line 85
    invoke-virtual {v2}, Lorg/apache/tools/tar/TarEntry;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/TarResource;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    goto :goto_0

    .line 90
    :cond_2
    invoke-static {v1}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    .line 91
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "no entry "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/TarResource;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, " in "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/TarResource;->getArchive()Lorg/apache/tools/ant/types/Resource;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v3
.end method

.method public getOutputStream()Ljava/io/OutputStream;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 104
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/TarResource;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 105
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/TarResource;->getCheckedRef()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/Resource;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Resource;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v0

    return-object v0

    .line 107
    :cond_0
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string/jumbo v1, "Use the tar task for tar output."

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getUid()I
    .locals 1

    .prologue
    .line 137
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/TarResource;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 138
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/TarResource;->getCheckedRef()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/resources/TarResource;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/resources/TarResource;->getUid()I

    move-result v0

    .line 141
    :goto_0
    return v0

    .line 140
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/TarResource;->checkEntry()V

    .line 141
    iget v0, p0, Lorg/apache/tools/ant/types/resources/TarResource;->uid:I

    goto :goto_0
.end method

.method public getUserName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 115
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/TarResource;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 116
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/TarResource;->getCheckedRef()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/resources/TarResource;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/resources/TarResource;->getUserName()Ljava/lang/String;

    move-result-object v0

    .line 119
    :goto_0
    return-object v0

    .line 118
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/TarResource;->checkEntry()V

    .line 119
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/TarResource;->userName:Ljava/lang/String;

    goto :goto_0
.end method
