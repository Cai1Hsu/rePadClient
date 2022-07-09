.class public Lorg/apache/tools/ant/types/resources/Archives;
.super Lorg/apache/tools/ant/types/DataType;
.source "Archives.java"

# interfaces
.implements Lorg/apache/tools/ant/types/ResourceCollection;
.implements Ljava/lang/Cloneable;


# instance fields
.field private tars:Lorg/apache/tools/ant/types/resources/Union;

.field private zips:Lorg/apache/tools/ant/types/resources/Union;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 41
    invoke-direct {p0}, Lorg/apache/tools/ant/types/DataType;-><init>()V

    .line 44
    new-instance v0, Lorg/apache/tools/ant/types/resources/Union;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/resources/Union;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/types/resources/Archives;->zips:Lorg/apache/tools/ant/types/resources/Union;

    .line 45
    new-instance v0, Lorg/apache/tools/ant/types/resources/Union;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/resources/Union;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/types/resources/Archives;->tars:Lorg/apache/tools/ant/types/resources/Union;

    return-void
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .locals 3

    .prologue
    .line 132
    :try_start_0
    invoke-super {p0}, Lorg/apache/tools/ant/types/DataType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/resources/Archives;

    .line 133
    .local v0, "a":Lorg/apache/tools/ant/types/resources/Archives;
    iget-object v2, p0, Lorg/apache/tools/ant/types/resources/Archives;->zips:Lorg/apache/tools/ant/types/resources/Union;

    invoke-virtual {v2}, Lorg/apache/tools/ant/types/resources/Union;->clone()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/tools/ant/types/resources/Union;

    iput-object v2, v0, Lorg/apache/tools/ant/types/resources/Archives;->zips:Lorg/apache/tools/ant/types/resources/Union;

    .line 134
    iget-object v2, p0, Lorg/apache/tools/ant/types/resources/Archives;->tars:Lorg/apache/tools/ant/types/resources/Union;

    invoke-virtual {v2}, Lorg/apache/tools/ant/types/resources/Union;->clone()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/tools/ant/types/resources/Union;

    iput-object v2, v0, Lorg/apache/tools/ant/types/resources/Archives;->tars:Lorg/apache/tools/ant/types/resources/Union;
    :try_end_0
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 135
    return-object v0

    .line 136
    .end local v0    # "a":Lorg/apache/tools/ant/types/resources/Archives;
    :catch_0
    move-exception v1

    .line 137
    .local v1, "e":Ljava/lang/CloneNotSupportedException;
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v2, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method protected configureArchive(Lorg/apache/tools/ant/types/ArchiveFileSet;Lorg/apache/tools/ant/types/Resource;)Lorg/apache/tools/ant/types/ArchiveFileSet;
    .locals 1
    .param p1, "afs"    # Lorg/apache/tools/ant/types/ArchiveFileSet;
    .param p2, "src"    # Lorg/apache/tools/ant/types/Resource;

    .prologue
    .line 166
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Archives;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    invoke-virtual {p1, v0}, Lorg/apache/tools/ant/types/ArchiveFileSet;->setProject(Lorg/apache/tools/ant/Project;)V

    .line 167
    invoke-virtual {p1, p2}, Lorg/apache/tools/ant/types/ArchiveFileSet;->setSrcResource(Lorg/apache/tools/ant/types/Resource;)V

    .line 168
    return-object p1
.end method

.method public createTars()Lorg/apache/tools/ant/types/resources/Union;
    .locals 1

    .prologue
    .line 64
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Archives;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 65
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Archives;->noChildrenAllowed()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 67
    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/resources/Archives;->setChecked(Z)V

    .line 68
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/Archives;->tars:Lorg/apache/tools/ant/types/resources/Union;

    return-object v0
.end method

.method public createZips()Lorg/apache/tools/ant/types/resources/Union;
    .locals 1

    .prologue
    .line 52
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Archives;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 53
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Archives;->noChildrenAllowed()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 55
    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/resources/Archives;->setChecked(Z)V

    .line 56
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/Archives;->zips:Lorg/apache/tools/ant/types/resources/Union;

    return-object v0
.end method

.method protected declared-synchronized dieOnCircularReference(Ljava/util/Stack;Lorg/apache/tools/ant/Project;)V
    .locals 1
    .param p1, "stk"    # Ljava/util/Stack;
    .param p2, "p"    # Lorg/apache/tools/ant/Project;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 180
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Archives;->isChecked()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-eqz v0, :cond_0

    .line 190
    :goto_0
    monitor-exit p0

    return-void

    .line 183
    :cond_0
    :try_start_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Archives;->isReference()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 184
    invoke-super {p0, p1, p2}, Lorg/apache/tools/ant/types/DataType;->dieOnCircularReference(Ljava/util/Stack;Lorg/apache/tools/ant/Project;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 180
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 186
    :cond_1
    :try_start_2
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/Archives;->zips:Lorg/apache/tools/ant/types/resources/Union;

    invoke-static {v0, p1, p2}, Lorg/apache/tools/ant/types/resources/Archives;->pushAndInvokeCircularReferenceCheck(Lorg/apache/tools/ant/types/DataType;Ljava/util/Stack;Lorg/apache/tools/ant/Project;)V

    .line 187
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/Archives;->tars:Lorg/apache/tools/ant/types/resources/Union;

    invoke-static {v0, p1, p2}, Lorg/apache/tools/ant/types/resources/Archives;->pushAndInvokeCircularReferenceCheck(Lorg/apache/tools/ant/types/DataType;Ljava/util/Stack;Lorg/apache/tools/ant/Project;)V

    .line 188
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/resources/Archives;->setChecked(Z)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0
.end method

.method protected grabArchives()Ljava/util/Iterator;
    .locals 4

    .prologue
    .line 148
    new-instance v1, Ljava/util/LinkedList;

    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    .line 149
    .local v1, "l":Ljava/util/List;
    iget-object v2, p0, Lorg/apache/tools/ant/types/resources/Archives;->zips:Lorg/apache/tools/ant/types/resources/Union;

    invoke-virtual {v2}, Lorg/apache/tools/ant/types/resources/Union;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "iter":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 150
    new-instance v3, Lorg/apache/tools/ant/types/ZipFileSet;

    invoke-direct {v3}, Lorg/apache/tools/ant/types/ZipFileSet;-><init>()V

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/tools/ant/types/Resource;

    invoke-virtual {p0, v3, v2}, Lorg/apache/tools/ant/types/resources/Archives;->configureArchive(Lorg/apache/tools/ant/types/ArchiveFileSet;Lorg/apache/tools/ant/types/Resource;)Lorg/apache/tools/ant/types/ArchiveFileSet;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 153
    :cond_0
    iget-object v2, p0, Lorg/apache/tools/ant/types/resources/Archives;->tars:Lorg/apache/tools/ant/types/resources/Union;

    invoke-virtual {v2}, Lorg/apache/tools/ant/types/resources/Union;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 154
    new-instance v3, Lorg/apache/tools/ant/types/TarFileSet;

    invoke-direct {v3}, Lorg/apache/tools/ant/types/TarFileSet;-><init>()V

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/tools/ant/types/Resource;

    invoke-virtual {p0, v3, v2}, Lorg/apache/tools/ant/types/resources/Archives;->configureArchive(Lorg/apache/tools/ant/types/ArchiveFileSet;Lorg/apache/tools/ant/types/Resource;)Lorg/apache/tools/ant/types/ArchiveFileSet;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 157
    :cond_1
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    return-object v2
.end method

.method public isFilesystemOnly()Z
    .locals 1

    .prologue
    .line 106
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Archives;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 107
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Archives;->getCheckedRef()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/resources/Archives;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/resources/Archives;->isFilesystemOnly()Z

    move-result v0

    .line 110
    :goto_0
    return v0

    .line 109
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Archives;->dieOnCircularReference()V

    .line 110
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 3

    .prologue
    .line 90
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Archives;->isReference()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 91
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Archives;->getCheckedRef()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/tools/ant/types/resources/Archives;

    invoke-virtual {v2}, Lorg/apache/tools/ant/types/resources/Archives;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 99
    :goto_0
    return-object v2

    .line 93
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Archives;->dieOnCircularReference()V

    .line 94
    new-instance v1, Ljava/util/LinkedList;

    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    .line 95
    .local v1, "l":Ljava/util/List;
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Archives;->grabArchives()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 96
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/tools/ant/types/ResourceCollection;

    invoke-interface {v2}, Lorg/apache/tools/ant/types/ResourceCollection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    invoke-static {v2}, Lorg/apache/tools/ant/util/CollectionUtils;->asCollection(Ljava/util/Iterator;)Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    goto :goto_1

    .line 99
    :cond_1
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    goto :goto_0
.end method

.method public setRefid(Lorg/apache/tools/ant/types/Reference;)V
    .locals 1
    .param p1, "r"    # Lorg/apache/tools/ant/types/Reference;

    .prologue
    .line 118
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/Archives;->zips:Lorg/apache/tools/ant/types/resources/Union;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/resources/Union;->getResourceCollections()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-gtz v0, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/Archives;->tars:Lorg/apache/tools/ant/types/resources/Union;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/resources/Union;->getResourceCollections()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_1

    .line 120
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Archives;->tooManyAttributes()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 122
    :cond_1
    invoke-super {p0, p1}, Lorg/apache/tools/ant/types/DataType;->setRefid(Lorg/apache/tools/ant/types/Reference;)V

    .line 123
    return-void
.end method

.method public size()I
    .locals 3

    .prologue
    .line 75
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Archives;->isReference()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 76
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Archives;->getCheckedRef()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/tools/ant/types/resources/Archives;

    invoke-virtual {v2}, Lorg/apache/tools/ant/types/resources/Archives;->size()I

    move-result v1

    .line 83
    :cond_0
    return v1

    .line 78
    :cond_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Archives;->dieOnCircularReference()V

    .line 79
    const/4 v1, 0x0

    .line 80
    .local v1, "total":I
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Archives;->grabArchives()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 81
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/tools/ant/types/ResourceCollection;

    invoke-interface {v2}, Lorg/apache/tools/ant/types/ResourceCollection;->size()I

    move-result v2

    add-int/2addr v1, v2

    goto :goto_0
.end method
