.class public Lorg/apache/tools/ant/types/resources/ZipResource;
.super Lorg/apache/tools/ant/types/resources/ArchiveResource;
.source "ZipResource.java"


# static fields
.field static class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;


# instance fields
.field private encoding:Ljava/lang/String;

.field private extras:[Lorg/apache/tools/zip/ZipExtraField;

.field private method:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 49
    invoke-direct {p0}, Lorg/apache/tools/ant/types/resources/ArchiveResource;-><init>()V

    .line 50
    return-void
.end method

.method public constructor <init>(Ljava/io/File;Ljava/lang/String;Lorg/apache/tools/zip/ZipEntry;)V
    .locals 1
    .param p1, "z"    # Ljava/io/File;
    .param p2, "enc"    # Ljava/lang/String;
    .param p3, "e"    # Lorg/apache/tools/zip/ZipEntry;

    .prologue
    .line 60
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lorg/apache/tools/ant/types/resources/ArchiveResource;-><init>(Ljava/io/File;Z)V

    .line 61
    invoke-virtual {p0, p2}, Lorg/apache/tools/ant/types/resources/ZipResource;->setEncoding(Ljava/lang/String;)V

    .line 62
    invoke-direct {p0, p3}, Lorg/apache/tools/ant/types/resources/ZipResource;->setEntry(Lorg/apache/tools/zip/ZipEntry;)V

    .line 63
    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 78
    :try_start_0
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    :catch_0
    move-exception v0

    .local v0, "x1":Ljava/lang/ClassNotFoundException;
    new-instance v1, Ljava/lang/NoClassDefFoundError;

    invoke-direct {v1}, Ljava/lang/NoClassDefFoundError;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/NoClassDefFoundError;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    move-result-object v1

    throw v1
.end method

.method private setEntry(Lorg/apache/tools/zip/ZipEntry;)V
    .locals 3
    .param p1, "e"    # Lorg/apache/tools/zip/ZipEntry;

    .prologue
    const/4 v2, 0x1

    .line 212
    if-nez p1, :cond_0

    .line 213
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/resources/ZipResource;->setExists(Z)V

    .line 224
    :goto_0
    return-void

    .line 216
    :cond_0
    invoke-virtual {p1}, Lorg/apache/tools/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/resources/ZipResource;->setName(Ljava/lang/String;)V

    .line 217
    invoke-virtual {p0, v2}, Lorg/apache/tools/ant/types/resources/ZipResource;->setExists(Z)V

    .line 218
    invoke-virtual {p1}, Lorg/apache/tools/zip/ZipEntry;->getTime()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lorg/apache/tools/ant/types/resources/ZipResource;->setLastModified(J)V

    .line 219
    invoke-virtual {p1}, Lorg/apache/tools/zip/ZipEntry;->isDirectory()Z

    move-result v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/resources/ZipResource;->setDirectory(Z)V

    .line 220
    invoke-virtual {p1}, Lorg/apache/tools/zip/ZipEntry;->getSize()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lorg/apache/tools/ant/types/resources/ZipResource;->setSize(J)V

    .line 221
    invoke-virtual {p1}, Lorg/apache/tools/zip/ZipEntry;->getUnixMode()I

    move-result v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/resources/ZipResource;->setMode(I)V

    .line 222
    invoke-virtual {p1, v2}, Lorg/apache/tools/zip/ZipEntry;->getExtraFields(Z)[Lorg/apache/tools/zip/ZipExtraField;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/types/resources/ZipResource;->extras:[Lorg/apache/tools/zip/ZipExtraField;

    .line 223
    invoke-virtual {p1}, Lorg/apache/tools/zip/ZipEntry;->getMethod()I

    move-result v0

    iput v0, p0, Lorg/apache/tools/ant/types/resources/ZipResource;->method:I

    goto :goto_0
.end method


# virtual methods
.method public addConfigured(Lorg/apache/tools/ant/types/ResourceCollection;)V
    .locals 2
    .param p1, "a"    # Lorg/apache/tools/ant/types/ResourceCollection;

    .prologue
    .line 88
    invoke-super {p0, p1}, Lorg/apache/tools/ant/types/resources/ArchiveResource;->addConfigured(Lorg/apache/tools/ant/types/ResourceCollection;)V

    .line 89
    invoke-interface {p1}, Lorg/apache/tools/ant/types/ResourceCollection;->isFilesystemOnly()Z

    move-result v0

    if-nez v0, :cond_0

    .line 90
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "only filesystem resources are supported"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 92
    :cond_0
    return-void
.end method

.method protected fetchEntry()V
    .locals 5

    .prologue
    .line 199
    const/4 v1, 0x0

    .line 201
    .local v1, "z":Lorg/apache/tools/zip/ZipFile;
    :try_start_0
    new-instance v2, Lorg/apache/tools/zip/ZipFile;

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ZipResource;->getZipfile()Ljava/io/File;

    move-result-object v3

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ZipResource;->getEncoding()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lorg/apache/tools/zip/ZipFile;-><init>(Ljava/io/File;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 202
    .end local v1    # "z":Lorg/apache/tools/zip/ZipFile;
    .local v2, "z":Lorg/apache/tools/zip/ZipFile;
    :try_start_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ZipResource;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/apache/tools/zip/ZipFile;->getEntry(Ljava/lang/String;)Lorg/apache/tools/zip/ZipEntry;

    move-result-object v3

    invoke-direct {p0, v3}, Lorg/apache/tools/ant/types/resources/ZipResource;->setEntry(Lorg/apache/tools/zip/ZipEntry;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 207
    invoke-static {v2}, Lorg/apache/tools/zip/ZipFile;->closeQuietly(Lorg/apache/tools/zip/ZipFile;)V

    .line 209
    return-void

    .line 203
    .end local v2    # "z":Lorg/apache/tools/zip/ZipFile;
    .restart local v1    # "z":Lorg/apache/tools/zip/ZipFile;
    :catch_0
    move-exception v0

    .line 204
    .local v0, "e":Ljava/io/IOException;
    :goto_0
    :try_start_2
    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x4

    invoke-virtual {p0, v3, v4}, Lorg/apache/tools/ant/types/resources/ZipResource;->log(Ljava/lang/String;I)V

    .line 205
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v3, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 207
    .end local v0    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v3

    :goto_1
    invoke-static {v1}, Lorg/apache/tools/zip/ZipFile;->closeQuietly(Lorg/apache/tools/zip/ZipFile;)V

    throw v3

    .end local v1    # "z":Lorg/apache/tools/zip/ZipFile;
    .restart local v2    # "z":Lorg/apache/tools/zip/ZipFile;
    :catchall_1
    move-exception v3

    move-object v1, v2

    .end local v2    # "z":Lorg/apache/tools/zip/ZipFile;
    .restart local v1    # "z":Lorg/apache/tools/zip/ZipFile;
    goto :goto_1

    .line 203
    .end local v1    # "z":Lorg/apache/tools/zip/ZipFile;
    .restart local v2    # "z":Lorg/apache/tools/zip/ZipFile;
    :catch_1
    move-exception v0

    move-object v1, v2

    .end local v2    # "z":Lorg/apache/tools/zip/ZipFile;
    .restart local v1    # "z":Lorg/apache/tools/zip/ZipFile;
    goto :goto_0
.end method

.method public getEncoding()Ljava/lang/String;
    .locals 1

    .prologue
    .line 108
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ZipResource;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ZipResource;->getCheckedRef()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/resources/ZipResource;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/resources/ZipResource;->getEncoding()Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/ZipResource;->encoding:Ljava/lang/String;

    goto :goto_0
.end method

.method public getExtraFields()[Lorg/apache/tools/zip/ZipExtraField;
    .locals 1

    .prologue
    .line 177
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ZipResource;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 178
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ZipResource;->getCheckedRef()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/resources/ZipResource;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/resources/ZipResource;->getExtraFields()[Lorg/apache/tools/zip/ZipExtraField;

    move-result-object v0

    .line 184
    :goto_0
    return-object v0

    .line 180
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ZipResource;->checkEntry()V

    .line 181
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/ZipResource;->extras:[Lorg/apache/tools/zip/ZipExtraField;

    if-nez v0, :cond_1

    .line 182
    const/4 v0, 0x0

    new-array v0, v0, [Lorg/apache/tools/zip/ZipExtraField;

    goto :goto_0

    .line 184
    :cond_1
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/ZipResource;->extras:[Lorg/apache/tools/zip/ZipExtraField;

    goto :goto_0
.end method

.method public getInputStream()Ljava/io/InputStream;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 130
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ZipResource;->isReference()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 131
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ZipResource;->getCheckedRef()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/tools/ant/types/Resource;

    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Resource;->getInputStream()Ljava/io/InputStream;

    move-result-object v2

    .line 140
    :goto_0
    return-object v2

    .line 133
    :cond_0
    new-instance v0, Lorg/apache/tools/zip/ZipFile;

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ZipResource;->getZipfile()Ljava/io/File;

    move-result-object v2

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ZipResource;->getEncoding()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v2, v3}, Lorg/apache/tools/zip/ZipFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 134
    .local v0, "z":Lorg/apache/tools/zip/ZipFile;
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ZipResource;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lorg/apache/tools/zip/ZipFile;->getEntry(Ljava/lang/String;)Lorg/apache/tools/zip/ZipEntry;

    move-result-object v1

    .line 135
    .local v1, "ze":Lorg/apache/tools/zip/ZipEntry;
    if-nez v1, :cond_1

    .line 136
    invoke-virtual {v0}, Lorg/apache/tools/zip/ZipFile;->close()V

    .line 137
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "no entry "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ZipResource;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, " in "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ZipResource;->getArchive()Lorg/apache/tools/ant/types/Resource;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 140
    :cond_1
    new-instance v2, Lorg/apache/tools/ant/types/resources/ZipResource$1;

    invoke-virtual {v0, v1}, Lorg/apache/tools/zip/ZipFile;->getInputStream(Lorg/apache/tools/zip/ZipEntry;)Ljava/io/InputStream;

    move-result-object v3

    invoke-direct {v2, p0, v3, v0}, Lorg/apache/tools/ant/types/resources/ZipResource$1;-><init>(Lorg/apache/tools/ant/types/resources/ZipResource;Ljava/io/InputStream;Lorg/apache/tools/zip/ZipFile;)V

    goto :goto_0
.end method

.method public getMethod()I
    .locals 1

    .prologue
    .line 192
    iget v0, p0, Lorg/apache/tools/ant/types/resources/ZipResource;->method:I

    return v0
.end method

.method public getOutputStream()Ljava/io/OutputStream;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 164
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ZipResource;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 165
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ZipResource;->getCheckedRef()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/Resource;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Resource;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v0

    return-object v0

    .line 167
    :cond_0
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string/jumbo v1, "Use the zip task for zip output."

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getZipfile()Ljava/io/File;
    .locals 3

    .prologue
    .line 78
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ZipResource;->getArchive()Lorg/apache/tools/ant/types/Resource;

    move-result-object v2

    sget-object v1, Lorg/apache/tools/ant/types/resources/ZipResource;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    if-nez v1, :cond_0

    const-string/jumbo v1, "org.apache.tools.ant.types.resources.FileProvider"

    invoke-static {v1}, Lorg/apache/tools/ant/types/resources/ZipResource;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lorg/apache/tools/ant/types/resources/ZipResource;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    :goto_0
    invoke-virtual {v2, v1}, Lorg/apache/tools/ant/types/Resource;->as(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/resources/FileProvider;

    .line 79
    .local v0, "fp":Lorg/apache/tools/ant/types/resources/FileProvider;
    invoke-interface {v0}, Lorg/apache/tools/ant/types/resources/FileProvider;->getFile()Ljava/io/File;

    move-result-object v1

    return-object v1

    .line 78
    .end local v0    # "fp":Lorg/apache/tools/ant/types/resources/FileProvider;
    :cond_0
    sget-object v1, Lorg/apache/tools/ant/types/resources/ZipResource;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    goto :goto_0
.end method

.method public setEncoding(Ljava/lang/String;)V
    .locals 0
    .param p1, "enc"    # Ljava/lang/String;

    .prologue
    .line 99
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ZipResource;->checkAttributesAllowed()V

    .line 100
    iput-object p1, p0, Lorg/apache/tools/ant/types/resources/ZipResource;->encoding:Ljava/lang/String;

    .line 101
    return-void
.end method

.method public setRefid(Lorg/apache/tools/ant/types/Reference;)V
    .locals 1
    .param p1, "r"    # Lorg/apache/tools/ant/types/Reference;

    .prologue
    .line 117
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/ZipResource;->encoding:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 118
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ZipResource;->tooManyAttributes()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 120
    :cond_0
    invoke-super {p0, p1}, Lorg/apache/tools/ant/types/resources/ArchiveResource;->setRefid(Lorg/apache/tools/ant/types/Reference;)V

    .line 121
    return-void
.end method

.method public setZipfile(Ljava/io/File;)V
    .locals 0
    .param p1, "z"    # Ljava/io/File;

    .prologue
    .line 70
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/resources/ZipResource;->setArchive(Ljava/io/File;)V

    .line 71
    return-void
.end method
