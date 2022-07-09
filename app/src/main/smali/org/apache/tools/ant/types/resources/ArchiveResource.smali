.class public abstract Lorg/apache/tools/ant/types/resources/ArchiveResource;
.super Lorg/apache/tools/ant/types/Resource;
.source "ArchiveResource.java"


# static fields
.field private static final NULL_ARCHIVE:I


# instance fields
.field private archive:Lorg/apache/tools/ant/types/Resource;

.field private haveEntry:Z

.field private mode:I

.field private modeSet:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 34
    const-string/jumbo v0, "null archive"

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    invoke-static {v0}, Lorg/apache/tools/ant/types/Resource;->getMagicNumber([B)I

    move-result v0

    sput v0, Lorg/apache/tools/ant/types/resources/ArchiveResource;->NULL_ARCHIVE:I

    return-void
.end method

.method protected constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 45
    invoke-direct {p0}, Lorg/apache/tools/ant/types/Resource;-><init>()V

    .line 38
    iput-boolean v0, p0, Lorg/apache/tools/ant/types/resources/ArchiveResource;->haveEntry:Z

    .line 39
    iput-boolean v0, p0, Lorg/apache/tools/ant/types/resources/ArchiveResource;->modeSet:Z

    .line 40
    iput v0, p0, Lorg/apache/tools/ant/types/resources/ArchiveResource;->mode:I

    .line 46
    return-void
.end method

.method protected constructor <init>(Ljava/io/File;)V
    .locals 1
    .param p1, "a"    # Ljava/io/File;

    .prologue
    .line 54
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/apache/tools/ant/types/resources/ArchiveResource;-><init>(Ljava/io/File;Z)V

    .line 55
    return-void
.end method

.method protected constructor <init>(Ljava/io/File;Z)V
    .locals 1
    .param p1, "a"    # Ljava/io/File;
    .param p2, "withEntry"    # Z

    .prologue
    const/4 v0, 0x0

    .line 63
    invoke-direct {p0}, Lorg/apache/tools/ant/types/Resource;-><init>()V

    .line 38
    iput-boolean v0, p0, Lorg/apache/tools/ant/types/resources/ArchiveResource;->haveEntry:Z

    .line 39
    iput-boolean v0, p0, Lorg/apache/tools/ant/types/resources/ArchiveResource;->modeSet:Z

    .line 40
    iput v0, p0, Lorg/apache/tools/ant/types/resources/ArchiveResource;->mode:I

    .line 64
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/resources/ArchiveResource;->setArchive(Ljava/io/File;)V

    .line 65
    iput-boolean p2, p0, Lorg/apache/tools/ant/types/resources/ArchiveResource;->haveEntry:Z

    .line 66
    return-void
.end method

.method protected constructor <init>(Lorg/apache/tools/ant/types/Resource;Z)V
    .locals 1
    .param p1, "a"    # Lorg/apache/tools/ant/types/Resource;
    .param p2, "withEntry"    # Z

    .prologue
    const/4 v0, 0x0

    .line 74
    invoke-direct {p0}, Lorg/apache/tools/ant/types/Resource;-><init>()V

    .line 38
    iput-boolean v0, p0, Lorg/apache/tools/ant/types/resources/ArchiveResource;->haveEntry:Z

    .line 39
    iput-boolean v0, p0, Lorg/apache/tools/ant/types/resources/ArchiveResource;->modeSet:Z

    .line 40
    iput v0, p0, Lorg/apache/tools/ant/types/resources/ArchiveResource;->mode:I

    .line 75
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/resources/ArchiveResource;->addConfigured(Lorg/apache/tools/ant/types/ResourceCollection;)V

    .line 76
    iput-boolean p2, p0, Lorg/apache/tools/ant/types/resources/ArchiveResource;->haveEntry:Z

    .line 77
    return-void
.end method


# virtual methods
.method public addConfigured(Lorg/apache/tools/ant/types/ResourceCollection;)V
    .locals 2
    .param p1, "a"    # Lorg/apache/tools/ant/types/ResourceCollection;

    .prologue
    .line 104
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ArchiveResource;->checkChildrenAllowed()V

    .line 105
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/ArchiveResource;->archive:Lorg/apache/tools/ant/types/Resource;

    if-eqz v0, :cond_0

    .line 106
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "you must not specify more than one archive"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 109
    :cond_0
    invoke-interface {p1}, Lorg/apache/tools/ant/types/ResourceCollection;->size()I

    move-result v0

    const/4 v1, 0x1

    if-eq v0, v1, :cond_1

    .line 110
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "only single argument resource collections are supported as archives"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 113
    :cond_1
    invoke-interface {p1}, Lorg/apache/tools/ant/types/ResourceCollection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/Resource;

    iput-object v0, p0, Lorg/apache/tools/ant/types/resources/ArchiveResource;->archive:Lorg/apache/tools/ant/types/Resource;

    .line 114
    return-void
.end method

.method protected final declared-synchronized checkEntry()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 250
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ArchiveResource;->dieOnCircularReference()V

    .line 251
    iget-boolean v2, p0, Lorg/apache/tools/ant/types/resources/ArchiveResource;->haveEntry:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v2, :cond_0

    .line 270
    :goto_0
    monitor-exit p0

    return-void

    .line 254
    :cond_0
    :try_start_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ArchiveResource;->getName()Ljava/lang/String;

    move-result-object v0

    .line 255
    .local v0, "name":Ljava/lang/String;
    if-nez v0, :cond_1

    .line 256
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v3, "entry name not set"

    invoke-direct {v2, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 250
    .end local v0    # "name":Ljava/lang/String;
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2

    .line 258
    .restart local v0    # "name":Ljava/lang/String;
    :cond_1
    :try_start_2
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ArchiveResource;->getArchive()Lorg/apache/tools/ant/types/Resource;

    move-result-object v1

    .line 259
    .local v1, "r":Lorg/apache/tools/ant/types/Resource;
    if-nez v1, :cond_2

    .line 260
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v3, "archive attribute not set"

    invoke-direct {v2, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 262
    :cond_2
    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Resource;->isExists()Z

    move-result v2

    if-nez v2, :cond_3

    .line 263
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Resource;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, " does not exist."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 265
    :cond_3
    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Resource;->isDirectory()Z

    move-result v2

    if-eqz v2, :cond_4

    .line 266
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, " denotes a directory."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 268
    :cond_4
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ArchiveResource;->fetchEntry()V

    .line 269
    const/4 v2, 0x1

    iput-boolean v2, p0, Lorg/apache/tools/ant/types/resources/ArchiveResource;->haveEntry:Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0
.end method

.method public compareTo(Ljava/lang/Object;)I
    .locals 1
    .param p1, "another"    # Ljava/lang/Object;

    .prologue
    .line 203
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/resources/ArchiveResource;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    invoke-super {p0, p1}, Lorg/apache/tools/ant/types/Resource;->compareTo(Ljava/lang/Object;)I

    move-result v0

    goto :goto_0
.end method

.method protected declared-synchronized dieOnCircularReference(Ljava/util/Stack;Lorg/apache/tools/ant/Project;)V
    .locals 1
    .param p1, "stk"    # Ljava/util/Stack;
    .param p2, "p"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 281
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ArchiveResource;->isChecked()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-eqz v0, :cond_0

    .line 292
    :goto_0
    monitor-exit p0

    return-void

    .line 284
    :cond_0
    :try_start_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ArchiveResource;->isReference()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 285
    invoke-super {p0, p1, p2}, Lorg/apache/tools/ant/types/Resource;->dieOnCircularReference(Ljava/util/Stack;Lorg/apache/tools/ant/Project;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 281
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 287
    :cond_1
    :try_start_2
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/ArchiveResource;->archive:Lorg/apache/tools/ant/types/Resource;

    if-eqz v0, :cond_2

    .line 288
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/ArchiveResource;->archive:Lorg/apache/tools/ant/types/Resource;

    invoke-static {v0, p1, p2}, Lorg/apache/tools/ant/types/resources/ArchiveResource;->pushAndInvokeCircularReferenceCheck(Lorg/apache/tools/ant/types/DataType;Ljava/util/Stack;Lorg/apache/tools/ant/Project;)V

    .line 290
    :cond_2
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/resources/ArchiveResource;->setChecked(Z)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "another"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 213
    if-ne p0, p1, :cond_1

    .line 223
    :cond_0
    :goto_0
    return v1

    .line 216
    :cond_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ArchiveResource;->isReference()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 217
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ArchiveResource;->getCheckedRef()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    goto :goto_0

    .line 219
    :cond_2
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3

    move v1, v2

    .line 220
    goto :goto_0

    :cond_3
    move-object v0, p1

    .line 222
    check-cast v0, Lorg/apache/tools/ant/types/resources/ArchiveResource;

    .line 223
    .local v0, "r":Lorg/apache/tools/ant/types/resources/ArchiveResource;
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ArchiveResource;->getArchive()Lorg/apache/tools/ant/types/Resource;

    move-result-object v3

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/resources/ArchiveResource;->getArchive()Lorg/apache/tools/ant/types/Resource;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/apache/tools/ant/types/Resource;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ArchiveResource;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/resources/ArchiveResource;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    :cond_4
    move v1, v2

    goto :goto_0
.end method

.method protected abstract fetchEntry()V
.end method

.method public getArchive()Lorg/apache/tools/ant/types/Resource;
    .locals 1

    .prologue
    .line 121
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ArchiveResource;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ArchiveResource;->getCheckedRef()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/resources/ArchiveResource;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/resources/ArchiveResource;->getArchive()Lorg/apache/tools/ant/types/Resource;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/ArchiveResource;->archive:Lorg/apache/tools/ant/types/Resource;

    goto :goto_0
.end method

.method public getLastModified()J
    .locals 2

    .prologue
    .line 130
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ArchiveResource;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 131
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ArchiveResource;->getCheckedRef()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/Resource;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Resource;->getLastModified()J

    move-result-wide v0

    .line 134
    :goto_0
    return-wide v0

    .line 133
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ArchiveResource;->checkEntry()V

    .line 134
    invoke-super {p0}, Lorg/apache/tools/ant/types/Resource;->getLastModified()J

    move-result-wide v0

    goto :goto_0
.end method

.method public getMode()I
    .locals 1

    .prologue
    .line 178
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ArchiveResource;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 179
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ArchiveResource;->getCheckedRef()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/resources/ArchiveResource;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/resources/ArchiveResource;->getMode()I

    move-result v0

    .line 182
    :goto_0
    return v0

    .line 181
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ArchiveResource;->checkEntry()V

    .line 182
    iget v0, p0, Lorg/apache/tools/ant/types/resources/ArchiveResource;->mode:I

    goto :goto_0
.end method

.method public getSize()J
    .locals 2

    .prologue
    .line 142
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ArchiveResource;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 143
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ArchiveResource;->getCheckedRef()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/Resource;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Resource;->getSize()J

    move-result-wide v0

    .line 146
    :goto_0
    return-wide v0

    .line 145
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ArchiveResource;->checkEntry()V

    .line 146
    invoke-super {p0}, Lorg/apache/tools/ant/types/Resource;->getSize()J

    move-result-wide v0

    goto :goto_0
.end method

.method public hashCode()I
    .locals 2

    .prologue
    .line 232
    invoke-super {p0}, Lorg/apache/tools/ant/types/Resource;->hashCode()I

    move-result v1

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ArchiveResource;->getArchive()Lorg/apache/tools/ant/types/Resource;

    move-result-object v0

    if-nez v0, :cond_0

    sget v0, Lorg/apache/tools/ant/types/resources/ArchiveResource;->NULL_ARCHIVE:I

    :goto_0
    mul-int/2addr v0, v1

    return v0

    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ArchiveResource;->getArchive()Lorg/apache/tools/ant/types/Resource;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Resource;->hashCode()I

    move-result v0

    goto :goto_0
.end method

.method public isDirectory()Z
    .locals 1

    .prologue
    .line 154
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ArchiveResource;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 155
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ArchiveResource;->getCheckedRef()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/Resource;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Resource;->isDirectory()Z

    move-result v0

    .line 158
    :goto_0
    return v0

    .line 157
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ArchiveResource;->checkEntry()V

    .line 158
    invoke-super {p0}, Lorg/apache/tools/ant/types/Resource;->isDirectory()Z

    move-result v0

    goto :goto_0
.end method

.method public isExists()Z
    .locals 1

    .prologue
    .line 166
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ArchiveResource;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 167
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ArchiveResource;->getCheckedRef()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/Resource;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Resource;->isExists()Z

    move-result v0

    .line 170
    :goto_0
    return v0

    .line 169
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ArchiveResource;->checkEntry()V

    .line 170
    invoke-super {p0}, Lorg/apache/tools/ant/types/Resource;->isExists()Z

    move-result v0

    goto :goto_0
.end method

.method public setArchive(Ljava/io/File;)V
    .locals 1
    .param p1, "a"    # Ljava/io/File;

    .prologue
    .line 84
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ArchiveResource;->checkAttributesAllowed()V

    .line 85
    new-instance v0, Lorg/apache/tools/ant/types/resources/FileResource;

    invoke-direct {v0, p1}, Lorg/apache/tools/ant/types/resources/FileResource;-><init>(Ljava/io/File;)V

    iput-object v0, p0, Lorg/apache/tools/ant/types/resources/ArchiveResource;->archive:Lorg/apache/tools/ant/types/Resource;

    .line 86
    return-void
.end method

.method public setMode(I)V
    .locals 1
    .param p1, "mode"    # I

    .prologue
    .line 93
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ArchiveResource;->checkAttributesAllowed()V

    .line 94
    iput p1, p0, Lorg/apache/tools/ant/types/resources/ArchiveResource;->mode:I

    .line 95
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/types/resources/ArchiveResource;->modeSet:Z

    .line 96
    return-void
.end method

.method public setRefid(Lorg/apache/tools/ant/types/Reference;)V
    .locals 1
    .param p1, "r"    # Lorg/apache/tools/ant/types/Reference;

    .prologue
    .line 190
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/ArchiveResource;->archive:Lorg/apache/tools/ant/types/Resource;

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lorg/apache/tools/ant/types/resources/ArchiveResource;->modeSet:Z

    if-eqz v0, :cond_1

    .line 191
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ArchiveResource;->tooManyAttributes()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 193
    :cond_1
    invoke-super {p0, p1}, Lorg/apache/tools/ant/types/Resource;->setRefid(Lorg/apache/tools/ant/types/Reference;)V

    .line 194
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 241
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ArchiveResource;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ArchiveResource;->getCheckedRef()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ArchiveResource;->getArchive()Lorg/apache/tools/ant/types/Resource;

    move-result-object v1

    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Resource;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const/16 v1, 0x3a

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ArchiveResource;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method
