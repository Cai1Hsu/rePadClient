.class public Lorg/apache/tools/ant/types/resources/MappedResourceCollection;
.super Lorg/apache/tools/ant/types/DataType;
.source "MappedResourceCollection.java"

# interfaces
.implements Lorg/apache/tools/ant/types/ResourceCollection;
.implements Ljava/lang/Cloneable;


# instance fields
.field private cache:Z

.field private cachedColl:Ljava/util/Collection;

.field private enableMultipleMappings:Z

.field private mapper:Lorg/apache/tools/ant/types/Mapper;

.field private nested:Lorg/apache/tools/ant/types/ResourceCollection;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x0

    .line 40
    invoke-direct {p0}, Lorg/apache/tools/ant/types/DataType;-><init>()V

    .line 43
    iput-object v0, p0, Lorg/apache/tools/ant/types/resources/MappedResourceCollection;->nested:Lorg/apache/tools/ant/types/ResourceCollection;

    .line 44
    iput-object v0, p0, Lorg/apache/tools/ant/types/resources/MappedResourceCollection;->mapper:Lorg/apache/tools/ant/types/Mapper;

    .line 45
    iput-boolean v1, p0, Lorg/apache/tools/ant/types/resources/MappedResourceCollection;->enableMultipleMappings:Z

    .line 46
    iput-boolean v1, p0, Lorg/apache/tools/ant/types/resources/MappedResourceCollection;->cache:Z

    .line 47
    iput-object v0, p0, Lorg/apache/tools/ant/types/resources/MappedResourceCollection;->cachedColl:Ljava/util/Collection;

    return-void
.end method

.method private declared-synchronized cacheCollection()Ljava/util/Collection;
    .locals 1

    .prologue
    .line 216
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/MappedResourceCollection;->cachedColl:Ljava/util/Collection;

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lorg/apache/tools/ant/types/resources/MappedResourceCollection;->cache:Z

    if-nez v0, :cond_1

    .line 217
    :cond_0
    invoke-direct {p0}, Lorg/apache/tools/ant/types/resources/MappedResourceCollection;->getCollection()Ljava/util/Collection;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/types/resources/MappedResourceCollection;->cachedColl:Ljava/util/Collection;

    .line 219
    :cond_1
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/MappedResourceCollection;->cachedColl:Ljava/util/Collection;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    .line 216
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private checkInitialized()V
    .locals 3

    .prologue
    .line 208
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/MappedResourceCollection;->nested:Lorg/apache/tools/ant/types/ResourceCollection;

    if-nez v0, :cond_0

    .line 209
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "A nested resource collection element is required"

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/MappedResourceCollection;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v0

    .line 212
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/MappedResourceCollection;->dieOnCircularReference()V

    .line 213
    return-void
.end method

.method private getCollection()Ljava/util/Collection;
    .locals 9

    .prologue
    .line 223
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 224
    .local v0, "collected":Ljava/util/Collection;
    iget-object v6, p0, Lorg/apache/tools/ant/types/resources/MappedResourceCollection;->mapper:Lorg/apache/tools/ant/types/Mapper;

    if-eqz v6, :cond_1

    iget-object v6, p0, Lorg/apache/tools/ant/types/resources/MappedResourceCollection;->mapper:Lorg/apache/tools/ant/types/Mapper;

    invoke-virtual {v6}, Lorg/apache/tools/ant/types/Mapper;->getImplementation()Lorg/apache/tools/ant/util/FileNameMapper;

    move-result-object v3

    .line 226
    .local v3, "m":Lorg/apache/tools/ant/util/FileNameMapper;
    :goto_0
    iget-object v6, p0, Lorg/apache/tools/ant/types/resources/MappedResourceCollection;->nested:Lorg/apache/tools/ant/types/ResourceCollection;

    invoke-interface {v6}, Lorg/apache/tools/ant/types/ResourceCollection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "iter":Ljava/util/Iterator;
    :cond_0
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_3

    .line 227
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/apache/tools/ant/types/Resource;

    .line 228
    .local v5, "r":Lorg/apache/tools/ant/types/Resource;
    iget-boolean v6, p0, Lorg/apache/tools/ant/types/resources/MappedResourceCollection;->enableMultipleMappings:Z

    if-eqz v6, :cond_2

    .line 229
    invoke-virtual {v5}, Lorg/apache/tools/ant/types/Resource;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v3, v6}, Lorg/apache/tools/ant/util/FileNameMapper;->mapFileName(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    .line 230
    .local v4, "n":[Ljava/lang/String;
    if-eqz v4, :cond_0

    .line 231
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_2
    array-length v6, v4

    if-ge v1, v6, :cond_0

    .line 232
    new-instance v6, Lorg/apache/tools/ant/types/resources/MappedResource;

    new-instance v7, Lorg/apache/tools/ant/util/MergingMapper;

    aget-object v8, v4, v1

    invoke-direct {v7, v8}, Lorg/apache/tools/ant/util/MergingMapper;-><init>(Ljava/lang/String;)V

    invoke-direct {v6, v5, v7}, Lorg/apache/tools/ant/types/resources/MappedResource;-><init>(Lorg/apache/tools/ant/types/Resource;Lorg/apache/tools/ant/util/FileNameMapper;)V

    invoke-interface {v0, v6}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 231
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 224
    .end local v1    # "i":I
    .end local v2    # "iter":Ljava/util/Iterator;
    .end local v3    # "m":Lorg/apache/tools/ant/util/FileNameMapper;
    .end local v4    # "n":[Ljava/lang/String;
    .end local v5    # "r":Lorg/apache/tools/ant/types/Resource;
    :cond_1
    new-instance v3, Lorg/apache/tools/ant/util/IdentityMapper;

    invoke-direct {v3}, Lorg/apache/tools/ant/util/IdentityMapper;-><init>()V

    goto :goto_0

    .line 238
    .restart local v2    # "iter":Ljava/util/Iterator;
    .restart local v3    # "m":Lorg/apache/tools/ant/util/FileNameMapper;
    .restart local v5    # "r":Lorg/apache/tools/ant/types/Resource;
    :cond_2
    new-instance v6, Lorg/apache/tools/ant/types/resources/MappedResource;

    invoke-direct {v6, v5, v3}, Lorg/apache/tools/ant/types/resources/MappedResource;-><init>(Lorg/apache/tools/ant/types/Resource;Lorg/apache/tools/ant/util/FileNameMapper;)V

    invoke-interface {v0, v6}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 241
    .end local v5    # "r":Lorg/apache/tools/ant/types/Resource;
    :cond_3
    return-object v0
.end method


# virtual methods
.method public declared-synchronized add(Lorg/apache/tools/ant/types/ResourceCollection;)V
    .locals 3
    .param p1, "c"    # Lorg/apache/tools/ant/types/ResourceCollection;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 55
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/MappedResourceCollection;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 56
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/MappedResourceCollection;->noChildrenAllowed()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 55
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 58
    :cond_0
    :try_start_1
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/MappedResourceCollection;->nested:Lorg/apache/tools/ant/types/ResourceCollection;

    if-eqz v0, :cond_1

    .line 59
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Only one resource collection can be nested into mappedresources"

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/MappedResourceCollection;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v0

    .line 63
    :cond_1
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/resources/MappedResourceCollection;->setChecked(Z)V

    .line 64
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/types/resources/MappedResourceCollection;->cachedColl:Ljava/util/Collection;

    .line 65
    iput-object p1, p0, Lorg/apache/tools/ant/types/resources/MappedResourceCollection;->nested:Lorg/apache/tools/ant/types/ResourceCollection;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 66
    monitor-exit p0

    return-void
.end method

.method public add(Lorg/apache/tools/ant/util/FileNameMapper;)V
    .locals 1
    .param p1, "fileNameMapper"    # Lorg/apache/tools/ant/util/FileNameMapper;

    .prologue
    .line 93
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/MappedResourceCollection;->createMapper()Lorg/apache/tools/ant/types/Mapper;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Mapper;->add(Lorg/apache/tools/ant/util/FileNameMapper;)V

    .line 94
    return-void
.end method

.method public clone()Ljava/lang/Object;
    .locals 3

    .prologue
    .line 170
    :try_start_0
    invoke-super {p0}, Lorg/apache/tools/ant/types/DataType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/resources/MappedResourceCollection;

    .line 172
    .local v0, "c":Lorg/apache/tools/ant/types/resources/MappedResourceCollection;
    iget-object v2, p0, Lorg/apache/tools/ant/types/resources/MappedResourceCollection;->nested:Lorg/apache/tools/ant/types/ResourceCollection;

    iput-object v2, v0, Lorg/apache/tools/ant/types/resources/MappedResourceCollection;->nested:Lorg/apache/tools/ant/types/ResourceCollection;

    .line 173
    iget-object v2, p0, Lorg/apache/tools/ant/types/resources/MappedResourceCollection;->mapper:Lorg/apache/tools/ant/types/Mapper;

    iput-object v2, v0, Lorg/apache/tools/ant/types/resources/MappedResourceCollection;->mapper:Lorg/apache/tools/ant/types/Mapper;

    .line 174
    const/4 v2, 0x0

    iput-object v2, v0, Lorg/apache/tools/ant/types/resources/MappedResourceCollection;->cachedColl:Ljava/util/Collection;
    :try_end_0
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 175
    return-object v0

    .line 176
    .end local v0    # "c":Lorg/apache/tools/ant/types/resources/MappedResourceCollection;
    :catch_0
    move-exception v1

    .line 177
    .local v1, "e":Ljava/lang/CloneNotSupportedException;
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v2, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method public createMapper()Lorg/apache/tools/ant/types/Mapper;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 74
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/MappedResourceCollection;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 75
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/MappedResourceCollection;->noChildrenAllowed()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 77
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/MappedResourceCollection;->mapper:Lorg/apache/tools/ant/types/Mapper;

    if-eqz v0, :cond_1

    .line 78
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Cannot define more than one mapper"

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/MappedResourceCollection;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v0

    .line 81
    :cond_1
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/resources/MappedResourceCollection;->setChecked(Z)V

    .line 82
    new-instance v0, Lorg/apache/tools/ant/types/Mapper;

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/MappedResourceCollection;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/types/Mapper;-><init>(Lorg/apache/tools/ant/Project;)V

    iput-object v0, p0, Lorg/apache/tools/ant/types/resources/MappedResourceCollection;->mapper:Lorg/apache/tools/ant/types/Mapper;

    .line 83
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/types/resources/MappedResourceCollection;->cachedColl:Ljava/util/Collection;

    .line 84
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/MappedResourceCollection;->mapper:Lorg/apache/tools/ant/types/Mapper;

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
    .line 190
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/MappedResourceCollection;->isChecked()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-eqz v0, :cond_0

    .line 205
    :goto_0
    monitor-exit p0

    return-void

    .line 193
    :cond_0
    :try_start_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/MappedResourceCollection;->isReference()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 194
    invoke-super {p0, p1, p2}, Lorg/apache/tools/ant/types/DataType;->dieOnCircularReference(Ljava/util/Stack;Lorg/apache/tools/ant/Project;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 190
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 196
    :cond_1
    :try_start_2
    invoke-direct {p0}, Lorg/apache/tools/ant/types/resources/MappedResourceCollection;->checkInitialized()V

    .line 197
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/MappedResourceCollection;->mapper:Lorg/apache/tools/ant/types/Mapper;

    if-eqz v0, :cond_2

    .line 198
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/MappedResourceCollection;->mapper:Lorg/apache/tools/ant/types/Mapper;

    invoke-static {v0, p1, p2}, Lorg/apache/tools/ant/types/resources/MappedResourceCollection;->pushAndInvokeCircularReferenceCheck(Lorg/apache/tools/ant/types/DataType;Ljava/util/Stack;Lorg/apache/tools/ant/Project;)V

    .line 200
    :cond_2
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/MappedResourceCollection;->nested:Lorg/apache/tools/ant/types/ResourceCollection;

    instance-of v0, v0, Lorg/apache/tools/ant/types/DataType;

    if-eqz v0, :cond_3

    .line 201
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/MappedResourceCollection;->nested:Lorg/apache/tools/ant/types/ResourceCollection;

    check-cast v0, Lorg/apache/tools/ant/types/DataType;

    invoke-static {v0, p1, p2}, Lorg/apache/tools/ant/types/resources/MappedResourceCollection;->pushAndInvokeCircularReferenceCheck(Lorg/apache/tools/ant/types/DataType;Ljava/util/Stack;Lorg/apache/tools/ant/Project;)V

    .line 203
    :cond_3
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/resources/MappedResourceCollection;->setChecked(Z)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0
.end method

.method public isFilesystemOnly()Z
    .locals 1

    .prologue
    .line 123
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/MappedResourceCollection;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 124
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/MappedResourceCollection;->getCheckedRef()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/resources/MappedResourceCollection;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/resources/MappedResourceCollection;->isFilesystemOnly()Z

    move-result v0

    .line 128
    :goto_0
    return v0

    .line 127
    :cond_0
    invoke-direct {p0}, Lorg/apache/tools/ant/types/resources/MappedResourceCollection;->checkInitialized()V

    .line 128
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 1

    .prologue
    .line 146
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/MappedResourceCollection;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 147
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/MappedResourceCollection;->getCheckedRef()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/resources/MappedResourceCollection;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/resources/MappedResourceCollection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 150
    :goto_0
    return-object v0

    .line 149
    :cond_0
    invoke-direct {p0}, Lorg/apache/tools/ant/types/resources/MappedResourceCollection;->checkInitialized()V

    .line 150
    invoke-direct {p0}, Lorg/apache/tools/ant/types/resources/MappedResourceCollection;->cacheCollection()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    goto :goto_0
.end method

.method public setCache(Z)V
    .locals 0
    .param p1, "cache"    # Z

    .prologue
    .line 116
    iput-boolean p1, p0, Lorg/apache/tools/ant/types/resources/MappedResourceCollection;->cache:Z

    .line 117
    return-void
.end method

.method public setEnableMultipleMappings(Z)V
    .locals 0
    .param p1, "enableMultipleMappings"    # Z

    .prologue
    .line 108
    iput-boolean p1, p0, Lorg/apache/tools/ant/types/resources/MappedResourceCollection;->enableMultipleMappings:Z

    .line 109
    return-void
.end method

.method public setRefid(Lorg/apache/tools/ant/types/Reference;)V
    .locals 1
    .param p1, "r"    # Lorg/apache/tools/ant/types/Reference;

    .prologue
    .line 158
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/MappedResourceCollection;->nested:Lorg/apache/tools/ant/types/ResourceCollection;

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/MappedResourceCollection;->mapper:Lorg/apache/tools/ant/types/Mapper;

    if-eqz v0, :cond_1

    .line 159
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/MappedResourceCollection;->tooManyAttributes()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 161
    :cond_1
    invoke-super {p0, p1}, Lorg/apache/tools/ant/types/DataType;->setRefid(Lorg/apache/tools/ant/types/Reference;)V

    .line 162
    return-void
.end method

.method public size()I
    .locals 1

    .prologue
    .line 135
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/MappedResourceCollection;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 136
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/MappedResourceCollection;->getCheckedRef()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/resources/MappedResourceCollection;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/resources/MappedResourceCollection;->size()I

    move-result v0

    .line 139
    :goto_0
    return v0

    .line 138
    :cond_0
    invoke-direct {p0}, Lorg/apache/tools/ant/types/resources/MappedResourceCollection;->checkInitialized()V

    .line 139
    invoke-direct {p0}, Lorg/apache/tools/ant/types/resources/MappedResourceCollection;->cacheCollection()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->size()I

    move-result v0

    goto :goto_0
.end method
