.class public abstract Lorg/apache/tools/ant/types/ArchiveScanner;
.super Lorg/apache/tools/ant/DirectoryScanner;
.source "ArchiveScanner.java"


# static fields
.field static class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;


# instance fields
.field private dirEntries:Ljava/util/TreeMap;

.field private encoding:Ljava/lang/String;

.field private errorOnMissingArchive:Z

.field private fileEntries:Ljava/util/TreeMap;

.field private lastScannedResource:Lorg/apache/tools/ant/types/Resource;

.field private matchDirEntries:Ljava/util/TreeMap;

.field private matchFileEntries:Ljava/util/TreeMap;

.field private src:Lorg/apache/tools/ant/types/Resource;

.field protected srcFile:Ljava/io/File;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 42
    invoke-direct {p0}, Lorg/apache/tools/ant/DirectoryScanner;-><init>()V

    .line 65
    new-instance v0, Ljava/util/TreeMap;

    invoke-direct {v0}, Ljava/util/TreeMap;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/types/ArchiveScanner;->fileEntries:Ljava/util/TreeMap;

    .line 70
    new-instance v0, Ljava/util/TreeMap;

    invoke-direct {v0}, Ljava/util/TreeMap;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/types/ArchiveScanner;->dirEntries:Ljava/util/TreeMap;

    .line 75
    new-instance v0, Ljava/util/TreeMap;

    invoke-direct {v0}, Ljava/util/TreeMap;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/types/ArchiveScanner;->matchFileEntries:Ljava/util/TreeMap;

    .line 80
    new-instance v0, Ljava/util/TreeMap;

    invoke-direct {v0}, Ljava/util/TreeMap;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/types/ArchiveScanner;->matchDirEntries:Ljava/util/TreeMap;

    .line 92
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/types/ArchiveScanner;->errorOnMissingArchive:Z

    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 134
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

.method private scanme()V
    .locals 8

    .prologue
    .line 323
    iget-object v0, p0, Lorg/apache/tools/ant/types/ArchiveScanner;->src:Lorg/apache/tools/ant/types/Resource;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Resource;->isExists()Z

    move-result v0

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lorg/apache/tools/ant/types/ArchiveScanner;->errorOnMissingArchive:Z

    if-nez v0, :cond_1

    .line 349
    :cond_0
    :goto_0
    return-void

    .line 328
    :cond_1
    new-instance v7, Lorg/apache/tools/ant/types/Resource;

    iget-object v0, p0, Lorg/apache/tools/ant/types/ArchiveScanner;->src:Lorg/apache/tools/ant/types/Resource;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Resource;->getName()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/tools/ant/types/ArchiveScanner;->src:Lorg/apache/tools/ant/types/Resource;

    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Resource;->isExists()Z

    move-result v1

    iget-object v2, p0, Lorg/apache/tools/ant/types/ArchiveScanner;->src:Lorg/apache/tools/ant/types/Resource;

    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Resource;->getLastModified()J

    move-result-wide v2

    invoke-direct {v7, v0, v1, v2, v3}, Lorg/apache/tools/ant/types/Resource;-><init>(Ljava/lang/String;ZJ)V

    .line 332
    .local v7, "thisresource":Lorg/apache/tools/ant/types/Resource;
    iget-object v0, p0, Lorg/apache/tools/ant/types/ArchiveScanner;->lastScannedResource:Lorg/apache/tools/ant/types/Resource;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lorg/apache/tools/ant/types/ArchiveScanner;->lastScannedResource:Lorg/apache/tools/ant/types/Resource;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Resource;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v7}, Lorg/apache/tools/ant/types/Resource;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lorg/apache/tools/ant/types/ArchiveScanner;->lastScannedResource:Lorg/apache/tools/ant/types/Resource;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Resource;->getLastModified()J

    move-result-wide v0

    invoke-virtual {v7}, Lorg/apache/tools/ant/types/Resource;->getLastModified()J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    .line 338
    :cond_2
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/ArchiveScanner;->init()V

    .line 340
    iget-object v0, p0, Lorg/apache/tools/ant/types/ArchiveScanner;->fileEntries:Ljava/util/TreeMap;

    invoke-virtual {v0}, Ljava/util/TreeMap;->clear()V

    .line 341
    iget-object v0, p0, Lorg/apache/tools/ant/types/ArchiveScanner;->dirEntries:Ljava/util/TreeMap;

    invoke-virtual {v0}, Ljava/util/TreeMap;->clear()V

    .line 342
    iget-object v0, p0, Lorg/apache/tools/ant/types/ArchiveScanner;->matchFileEntries:Ljava/util/TreeMap;

    invoke-virtual {v0}, Ljava/util/TreeMap;->clear()V

    .line 343
    iget-object v0, p0, Lorg/apache/tools/ant/types/ArchiveScanner;->matchDirEntries:Ljava/util/TreeMap;

    invoke-virtual {v0}, Ljava/util/TreeMap;->clear()V

    .line 344
    iget-object v1, p0, Lorg/apache/tools/ant/types/ArchiveScanner;->src:Lorg/apache/tools/ant/types/Resource;

    iget-object v2, p0, Lorg/apache/tools/ant/types/ArchiveScanner;->encoding:Ljava/lang/String;

    iget-object v3, p0, Lorg/apache/tools/ant/types/ArchiveScanner;->fileEntries:Ljava/util/TreeMap;

    iget-object v4, p0, Lorg/apache/tools/ant/types/ArchiveScanner;->matchFileEntries:Ljava/util/TreeMap;

    iget-object v5, p0, Lorg/apache/tools/ant/types/ArchiveScanner;->dirEntries:Ljava/util/TreeMap;

    iget-object v6, p0, Lorg/apache/tools/ant/types/ArchiveScanner;->matchDirEntries:Ljava/util/TreeMap;

    move-object v0, p0

    invoke-virtual/range {v0 .. v6}, Lorg/apache/tools/ant/types/ArchiveScanner;->fillMapsFromArchive(Lorg/apache/tools/ant/types/Resource;Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;)V

    .line 348
    iput-object v7, p0, Lorg/apache/tools/ant/types/ArchiveScanner;->lastScannedResource:Lorg/apache/tools/ant/types/Resource;

    goto :goto_0
.end method

.method protected static final trimSeparator(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    .line 357
    const-string/jumbo v0, "/"

    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    .end local p0    # "s":Ljava/lang/String;
    :cond_0
    return-object p0
.end method


# virtual methods
.method protected abstract fillMapsFromArchive(Lorg/apache/tools/ant/types/Resource;Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;)V
.end method

.method public getIncludedDirectories()[Ljava/lang/String;
    .locals 2

    .prologue
    .line 188
    iget-object v1, p0, Lorg/apache/tools/ant/types/ArchiveScanner;->src:Lorg/apache/tools/ant/types/Resource;

    if-nez v1, :cond_0

    .line 189
    invoke-super {p0}, Lorg/apache/tools/ant/DirectoryScanner;->getIncludedDirectories()[Ljava/lang/String;

    move-result-object v1

    .line 193
    :goto_0
    return-object v1

    .line 191
    :cond_0
    invoke-direct {p0}, Lorg/apache/tools/ant/types/ArchiveScanner;->scanme()V

    .line 192
    iget-object v1, p0, Lorg/apache/tools/ant/types/ArchiveScanner;->matchDirEntries:Ljava/util/TreeMap;

    invoke-virtual {v1}, Ljava/util/TreeMap;->keySet()Ljava/util/Set;

    move-result-object v0

    .line 193
    .local v0, "s":Ljava/util/Set;
    invoke-interface {v0}, Ljava/util/Set;->size()I

    move-result v1

    new-array v1, v1, [Ljava/lang/String;

    invoke-interface {v0, v1}, Ljava/util/Set;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/String;

    goto :goto_0
.end method

.method public getIncludedDirsCount()I
    .locals 1

    .prologue
    .line 202
    iget-object v0, p0, Lorg/apache/tools/ant/types/ArchiveScanner;->src:Lorg/apache/tools/ant/types/Resource;

    if-nez v0, :cond_0

    .line 203
    invoke-super {p0}, Lorg/apache/tools/ant/DirectoryScanner;->getIncludedDirsCount()I

    move-result v0

    .line 206
    :goto_0
    return v0

    .line 205
    :cond_0
    invoke-direct {p0}, Lorg/apache/tools/ant/types/ArchiveScanner;->scanme()V

    .line 206
    iget-object v0, p0, Lorg/apache/tools/ant/types/ArchiveScanner;->matchDirEntries:Ljava/util/TreeMap;

    invoke-virtual {v0}, Ljava/util/TreeMap;->size()I

    move-result v0

    goto :goto_0
.end method

.method public getIncludedFiles()[Ljava/lang/String;
    .locals 2

    .prologue
    .line 158
    iget-object v1, p0, Lorg/apache/tools/ant/types/ArchiveScanner;->src:Lorg/apache/tools/ant/types/Resource;

    if-nez v1, :cond_0

    .line 159
    invoke-super {p0}, Lorg/apache/tools/ant/DirectoryScanner;->getIncludedFiles()[Ljava/lang/String;

    move-result-object v1

    .line 163
    :goto_0
    return-object v1

    .line 161
    :cond_0
    invoke-direct {p0}, Lorg/apache/tools/ant/types/ArchiveScanner;->scanme()V

    .line 162
    iget-object v1, p0, Lorg/apache/tools/ant/types/ArchiveScanner;->matchFileEntries:Ljava/util/TreeMap;

    invoke-virtual {v1}, Ljava/util/TreeMap;->keySet()Ljava/util/Set;

    move-result-object v0

    .line 163
    .local v0, "s":Ljava/util/Set;
    invoke-interface {v0}, Ljava/util/Set;->size()I

    move-result v1

    new-array v1, v1, [Ljava/lang/String;

    invoke-interface {v0, v1}, Ljava/util/Set;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/String;

    goto :goto_0
.end method

.method public getIncludedFilesCount()I
    .locals 1

    .prologue
    .line 172
    iget-object v0, p0, Lorg/apache/tools/ant/types/ArchiveScanner;->src:Lorg/apache/tools/ant/types/Resource;

    if-nez v0, :cond_0

    .line 173
    invoke-super {p0}, Lorg/apache/tools/ant/DirectoryScanner;->getIncludedFilesCount()I

    move-result v0

    .line 176
    :goto_0
    return v0

    .line 175
    :cond_0
    invoke-direct {p0}, Lorg/apache/tools/ant/types/ArchiveScanner;->scanme()V

    .line 176
    iget-object v0, p0, Lorg/apache/tools/ant/types/ArchiveScanner;->matchFileEntries:Ljava/util/TreeMap;

    invoke-virtual {v0}, Ljava/util/TreeMap;->size()I

    move-result v0

    goto :goto_0
.end method

.method public getResource(Ljava/lang/String;)Lorg/apache/tools/ant/types/Resource;
    .locals 7
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x1

    .line 273
    iget-object v0, p0, Lorg/apache/tools/ant/types/ArchiveScanner;->src:Lorg/apache/tools/ant/types/Resource;

    if-nez v0, :cond_0

    .line 274
    invoke-super {p0, p1}, Lorg/apache/tools/ant/DirectoryScanner;->getResource(Ljava/lang/String;)Lorg/apache/tools/ant/types/Resource;

    move-result-object v0

    .line 290
    :goto_0
    return-object v0

    .line 276
    :cond_0
    const-string/jumbo v0, ""

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 278
    new-instance v1, Lorg/apache/tools/ant/types/Resource;

    const-string/jumbo v2, ""

    const-wide v4, 0x7fffffffffffffffL

    move v6, v3

    invoke-direct/range {v1 .. v6}, Lorg/apache/tools/ant/types/Resource;-><init>(Ljava/lang/String;ZJZ)V

    move-object v0, v1

    goto :goto_0

    .line 281
    :cond_1
    invoke-direct {p0}, Lorg/apache/tools/ant/types/ArchiveScanner;->scanme()V

    .line 282
    iget-object v0, p0, Lorg/apache/tools/ant/types/ArchiveScanner;->fileEntries:Ljava/util/TreeMap;

    invoke-virtual {v0, p1}, Ljava/util/TreeMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 283
    iget-object v0, p0, Lorg/apache/tools/ant/types/ArchiveScanner;->fileEntries:Ljava/util/TreeMap;

    invoke-virtual {v0, p1}, Ljava/util/TreeMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/Resource;

    goto :goto_0

    .line 285
    :cond_2
    invoke-static {p1}, Lorg/apache/tools/ant/types/ArchiveScanner;->trimSeparator(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 287
    iget-object v0, p0, Lorg/apache/tools/ant/types/ArchiveScanner;->dirEntries:Ljava/util/TreeMap;

    invoke-virtual {v0, p1}, Ljava/util/TreeMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 288
    iget-object v0, p0, Lorg/apache/tools/ant/types/ArchiveScanner;->dirEntries:Ljava/util/TreeMap;

    invoke-virtual {v0, p1}, Ljava/util/TreeMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/Resource;

    goto :goto_0

    .line 290
    :cond_3
    new-instance v0, Lorg/apache/tools/ant/types/Resource;

    invoke-direct {v0, p1}, Lorg/apache/tools/ant/types/Resource;-><init>(Ljava/lang/String;)V

    goto :goto_0
.end method

.method getResourceDirectories(Lorg/apache/tools/ant/Project;)Ljava/util/Iterator;
    .locals 3
    .param p1, "project"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 230
    iget-object v0, p0, Lorg/apache/tools/ant/types/ArchiveScanner;->src:Lorg/apache/tools/ant/types/Resource;

    if-nez v0, :cond_0

    .line 231
    new-instance v0, Lorg/apache/tools/ant/types/resources/FileResourceIterator;

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/ArchiveScanner;->getBasedir()Ljava/io/File;

    move-result-object v1

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/ArchiveScanner;->getIncludedDirectories()[Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, p1, v1, v2}, Lorg/apache/tools/ant/types/resources/FileResourceIterator;-><init>(Lorg/apache/tools/ant/Project;Ljava/io/File;[Ljava/lang/String;)V

    .line 234
    :goto_0
    return-object v0

    .line 233
    :cond_0
    invoke-direct {p0}, Lorg/apache/tools/ant/types/ArchiveScanner;->scanme()V

    .line 234
    iget-object v0, p0, Lorg/apache/tools/ant/types/ArchiveScanner;->matchDirEntries:Ljava/util/TreeMap;

    invoke-virtual {v0}, Ljava/util/TreeMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    goto :goto_0
.end method

.method getResourceFiles(Lorg/apache/tools/ant/Project;)Ljava/util/Iterator;
    .locals 3
    .param p1, "project"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 216
    iget-object v0, p0, Lorg/apache/tools/ant/types/ArchiveScanner;->src:Lorg/apache/tools/ant/types/Resource;

    if-nez v0, :cond_0

    .line 217
    new-instance v0, Lorg/apache/tools/ant/types/resources/FileResourceIterator;

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/ArchiveScanner;->getBasedir()Ljava/io/File;

    move-result-object v1

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/ArchiveScanner;->getIncludedFiles()[Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, p1, v1, v2}, Lorg/apache/tools/ant/types/resources/FileResourceIterator;-><init>(Lorg/apache/tools/ant/Project;Ljava/io/File;[Ljava/lang/String;)V

    .line 220
    :goto_0
    return-object v0

    .line 219
    :cond_0
    invoke-direct {p0}, Lorg/apache/tools/ant/types/ArchiveScanner;->scanme()V

    .line 220
    iget-object v0, p0, Lorg/apache/tools/ant/types/ArchiveScanner;->matchFileEntries:Ljava/util/TreeMap;

    invoke-virtual {v0}, Ljava/util/TreeMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    goto :goto_0
.end method

.method public init()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 241
    iget-object v0, p0, Lorg/apache/tools/ant/types/ArchiveScanner;->includes:[Ljava/lang/String;

    if-nez v0, :cond_0

    .line 243
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    iput-object v0, p0, Lorg/apache/tools/ant/types/ArchiveScanner;->includes:[Ljava/lang/String;

    .line 244
    iget-object v0, p0, Lorg/apache/tools/ant/types/ArchiveScanner;->includes:[Ljava/lang/String;

    const-string/jumbo v1, "**"

    aput-object v1, v0, v2

    .line 246
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/types/ArchiveScanner;->excludes:[Ljava/lang/String;

    if-nez v0, :cond_1

    .line 247
    new-array v0, v2, [Ljava/lang/String;

    iput-object v0, p0, Lorg/apache/tools/ant/types/ArchiveScanner;->excludes:[Ljava/lang/String;

    .line 249
    :cond_1
    return-void
.end method

.method public match(Ljava/lang/String;)Z
    .locals 4
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 261
    const/16 v1, 0x2f

    sget-char v2, Ljava/io/File;->separatorChar:C

    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x5c

    sget-char v3, Ljava/io/File;->separatorChar:C

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v0

    .line 263
    .local v0, "vpath":Ljava/lang/String;
    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/ArchiveScanner;->isIncluded(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/ArchiveScanner;->isExcluded(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public scan()V
    .locals 1

    .prologue
    .line 110
    iget-object v0, p0, Lorg/apache/tools/ant/types/ArchiveScanner;->src:Lorg/apache/tools/ant/types/Resource;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/types/ArchiveScanner;->src:Lorg/apache/tools/ant/types/Resource;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Resource;->isExists()Z

    move-result v0

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lorg/apache/tools/ant/types/ArchiveScanner;->errorOnMissingArchive:Z

    if-nez v0, :cond_1

    .line 114
    :cond_0
    :goto_0
    return-void

    .line 113
    :cond_1
    invoke-super {p0}, Lorg/apache/tools/ant/DirectoryScanner;->scan()V

    goto :goto_0
.end method

.method public setEncoding(Ljava/lang/String;)V
    .locals 0
    .param p1, "encoding"    # Ljava/lang/String;

    .prologue
    .line 146
    iput-object p1, p0, Lorg/apache/tools/ant/types/ArchiveScanner;->encoding:Ljava/lang/String;

    .line 147
    return-void
.end method

.method public setErrorOnMissingArchive(Z)V
    .locals 0
    .param p1, "errorOnMissingArchive"    # Z

    .prologue
    .line 102
    iput-boolean p1, p0, Lorg/apache/tools/ant/types/ArchiveScanner;->errorOnMissingArchive:Z

    .line 103
    return-void
.end method

.method public setSrc(Ljava/io/File;)V
    .locals 1
    .param p1, "srcFile"    # Ljava/io/File;

    .prologue
    .line 123
    new-instance v0, Lorg/apache/tools/ant/types/resources/FileResource;

    invoke-direct {v0, p1}, Lorg/apache/tools/ant/types/resources/FileResource;-><init>(Ljava/io/File;)V

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/ArchiveScanner;->setSrc(Lorg/apache/tools/ant/types/Resource;)V

    .line 124
    return-void
.end method

.method public setSrc(Lorg/apache/tools/ant/types/Resource;)V
    .locals 2
    .param p1, "src"    # Lorg/apache/tools/ant/types/Resource;

    .prologue
    .line 133
    iput-object p1, p0, Lorg/apache/tools/ant/types/ArchiveScanner;->src:Lorg/apache/tools/ant/types/Resource;

    .line 134
    sget-object v1, Lorg/apache/tools/ant/types/ArchiveScanner;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    if-nez v1, :cond_1

    const-string/jumbo v1, "org.apache.tools.ant.types.resources.FileProvider"

    invoke-static {v1}, Lorg/apache/tools/ant/types/ArchiveScanner;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lorg/apache/tools/ant/types/ArchiveScanner;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    :goto_0
    invoke-virtual {p1, v1}, Lorg/apache/tools/ant/types/Resource;->as(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/resources/FileProvider;

    .line 135
    .local v0, "fp":Lorg/apache/tools/ant/types/resources/FileProvider;
    if-eqz v0, :cond_0

    .line 136
    invoke-interface {v0}, Lorg/apache/tools/ant/types/resources/FileProvider;->getFile()Ljava/io/File;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/tools/ant/types/ArchiveScanner;->srcFile:Ljava/io/File;

    .line 138
    :cond_0
    return-void

    .line 134
    .end local v0    # "fp":Lorg/apache/tools/ant/types/resources/FileProvider;
    :cond_1
    sget-object v1, Lorg/apache/tools/ant/types/ArchiveScanner;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    goto :goto_0
.end method
