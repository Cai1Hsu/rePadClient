.class public abstract Lorg/apache/tools/ant/types/resources/BaseResourceCollectionContainer;
.super Lorg/apache/tools/ant/types/DataType;
.source "BaseResourceCollectionContainer.java"

# interfaces
.implements Lorg/apache/tools/ant/types/ResourceCollection;
.implements Ljava/lang/Cloneable;


# static fields
.field static class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;


# instance fields
.field private cache:Z

.field private coll:Ljava/util/Collection;

.field private rc:Ljava/util/List;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 47
    invoke-direct {p0}, Lorg/apache/tools/ant/types/DataType;-><init>()V

    .line 40
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/types/resources/BaseResourceCollectionContainer;->rc:Ljava/util/List;

    .line 41
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/types/resources/BaseResourceCollectionContainer;->coll:Ljava/util/Collection;

    .line 42
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/types/resources/BaseResourceCollectionContainer;->cache:Z

    .line 49
    return-void
.end method

.method public constructor <init>(Lorg/apache/tools/ant/Project;)V
    .locals 1
    .param p1, "project"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 55
    invoke-direct {p0}, Lorg/apache/tools/ant/types/DataType;-><init>()V

    .line 40
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/types/resources/BaseResourceCollectionContainer;->rc:Ljava/util/List;

    .line 41
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/types/resources/BaseResourceCollectionContainer;->coll:Ljava/util/Collection;

    .line 42
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/types/resources/BaseResourceCollectionContainer;->cache:Z

    .line 56
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/resources/BaseResourceCollectionContainer;->setProject(Lorg/apache/tools/ant/Project;)V

    .line 57
    return-void
.end method

.method private declared-synchronized cacheCollection()Ljava/util/Collection;
    .locals 1

    .prologue
    .line 264
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/BaseResourceCollectionContainer;->coll:Ljava/util/Collection;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/BaseResourceCollectionContainer;->isCache()Z

    move-result v0

    if-nez v0, :cond_1

    .line 265
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/BaseResourceCollectionContainer;->getCollection()Ljava/util/Collection;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/types/resources/BaseResourceCollectionContainer;->coll:Ljava/util/Collection;

    .line 267
    :cond_1
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/BaseResourceCollectionContainer;->coll:Ljava/util/Collection;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    .line 264
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 178
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


# virtual methods
.method public declared-synchronized add(Lorg/apache/tools/ant/types/ResourceCollection;)V
    .locals 2
    .param p1, "c"    # Lorg/apache/tools/ant/types/ResourceCollection;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 95
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/BaseResourceCollectionContainer;->isReference()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 96
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/BaseResourceCollectionContainer;->noChildrenAllowed()Lorg/apache/tools/ant/BuildException;

    move-result-object v1

    throw v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 95
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1

    .line 98
    :cond_0
    if-nez p1, :cond_1

    .line 111
    :goto_0
    monitor-exit p0

    return-void

    .line 101
    :cond_1
    :try_start_1
    invoke-static {p1}, Lorg/apache/tools/ant/Project;->getProject(Ljava/lang/Object;)Lorg/apache/tools/ant/Project;

    move-result-object v1

    if-nez v1, :cond_2

    .line 102
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/BaseResourceCollectionContainer;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    .line 103
    .local v0, "p":Lorg/apache/tools/ant/Project;
    if-eqz v0, :cond_2

    .line 104
    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/Project;->setProjectReference(Ljava/lang/Object;)V

    .line 107
    .end local v0    # "p":Lorg/apache/tools/ant/Project;
    :cond_2
    iget-object v1, p0, Lorg/apache/tools/ant/types/resources/BaseResourceCollectionContainer;->rc:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 108
    invoke-static {p0}, Lorg/apache/tools/ant/types/resources/FailFast;->invalidate(Ljava/lang/Object;)V

    .line 109
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/apache/tools/ant/types/resources/BaseResourceCollectionContainer;->coll:Ljava/util/Collection;

    .line 110
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/types/resources/BaseResourceCollectionContainer;->setChecked(Z)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0
.end method

.method public declared-synchronized addAll(Ljava/util/Collection;)V
    .locals 3
    .param p1, "c"    # Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 119
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/BaseResourceCollectionContainer;->isReference()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 120
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/BaseResourceCollectionContainer;->noChildrenAllowed()Lorg/apache/tools/ant/BuildException;

    move-result-object v2

    throw v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 119
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2

    .line 123
    :cond_0
    :try_start_1
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 124
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/tools/ant/types/ResourceCollection;

    invoke-virtual {p0, v2}, Lorg/apache/tools/ant/types/resources/BaseResourceCollectionContainer;->add(Lorg/apache/tools/ant/types/ResourceCollection;)V
    :try_end_1
    .catch Ljava/lang/ClassCastException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 126
    .end local v1    # "i":Ljava/util/Iterator;
    :catch_0
    move-exception v0

    .line 127
    .local v0, "e":Ljava/lang/ClassCastException;
    :try_start_2
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v2, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 129
    .end local v0    # "e":Ljava/lang/ClassCastException;
    .restart local v1    # "i":Ljava/util/Iterator;
    :cond_1
    monitor-exit p0

    return-void
.end method

.method public declared-synchronized clear()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 80
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/BaseResourceCollectionContainer;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 81
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/BaseResourceCollectionContainer;->noChildrenAllowed()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 80
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 83
    :cond_0
    :try_start_1
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/BaseResourceCollectionContainer;->rc:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 84
    invoke-static {p0}, Lorg/apache/tools/ant/types/resources/FailFast;->invalidate(Ljava/lang/Object;)V

    .line 85
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/types/resources/BaseResourceCollectionContainer;->coll:Ljava/util/Collection;

    .line 86
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/resources/BaseResourceCollectionContainer;->setChecked(Z)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 87
    monitor-exit p0

    return-void
.end method

.method public clone()Ljava/lang/Object;
    .locals 4

    .prologue
    .line 232
    :try_start_0
    invoke-super {p0}, Lorg/apache/tools/ant/types/DataType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/resources/BaseResourceCollectionContainer;

    .line 234
    .local v0, "c":Lorg/apache/tools/ant/types/resources/BaseResourceCollectionContainer;
    new-instance v2, Ljava/util/ArrayList;

    iget-object v3, p0, Lorg/apache/tools/ant/types/resources/BaseResourceCollectionContainer;->rc:Ljava/util/List;

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v2, v0, Lorg/apache/tools/ant/types/resources/BaseResourceCollectionContainer;->rc:Ljava/util/List;

    .line 235
    const/4 v2, 0x0

    iput-object v2, v0, Lorg/apache/tools/ant/types/resources/BaseResourceCollectionContainer;->coll:Ljava/util/Collection;
    :try_end_0
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 236
    return-object v0

    .line 237
    .end local v0    # "c":Lorg/apache/tools/ant/types/resources/BaseResourceCollectionContainer;
    :catch_0
    move-exception v1

    .line 238
    .local v1, "e":Ljava/lang/CloneNotSupportedException;
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v2, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method protected declared-synchronized dieOnCircularReference(Ljava/util/Stack;Lorg/apache/tools/ant/Project;)V
    .locals 3
    .param p1, "stk"    # Ljava/util/Stack;
    .param p2, "p"    # Lorg/apache/tools/ant/Project;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 194
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/BaseResourceCollectionContainer;->isChecked()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v2

    if-eqz v2, :cond_0

    .line 208
    :goto_0
    monitor-exit p0

    return-void

    .line 197
    :cond_0
    :try_start_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/BaseResourceCollectionContainer;->isReference()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 198
    invoke-super {p0, p1, p2}, Lorg/apache/tools/ant/types/DataType;->dieOnCircularReference(Ljava/util/Stack;Lorg/apache/tools/ant/Project;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 194
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2

    .line 200
    :cond_1
    :try_start_2
    iget-object v2, p0, Lorg/apache/tools/ant/types/resources/BaseResourceCollectionContainer;->rc:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i":Ljava/util/Iterator;
    :cond_2
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 201
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 202
    .local v1, "o":Ljava/lang/Object;
    instance-of v2, v1, Lorg/apache/tools/ant/types/DataType;

    if-eqz v2, :cond_2

    .line 203
    check-cast v1, Lorg/apache/tools/ant/types/DataType;

    .end local v1    # "o":Ljava/lang/Object;
    invoke-static {v1, p1, p2}, Lorg/apache/tools/ant/types/resources/BaseResourceCollectionContainer;->pushAndInvokeCircularReferenceCheck(Lorg/apache/tools/ant/types/DataType;Ljava/util/Stack;Lorg/apache/tools/ant/Project;)V

    goto :goto_1

    .line 206
    :cond_3
    const/4 v2, 0x1

    invoke-virtual {p0, v2}, Lorg/apache/tools/ant/types/resources/BaseResourceCollectionContainer;->setChecked(Z)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0
.end method

.method protected abstract getCollection()Ljava/util/Collection;
.end method

.method public final declared-synchronized getResourceCollections()Ljava/util/List;
    .locals 1

    .prologue
    .line 215
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/BaseResourceCollectionContainer;->dieOnCircularReference()V

    .line 216
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/BaseResourceCollectionContainer;->rc:Ljava/util/List;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    monitor-exit p0

    return-object v0

    .line 215
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized isCache()Z
    .locals 1

    .prologue
    .line 72
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lorg/apache/tools/ant/types/resources/BaseResourceCollectionContainer;->cache:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized isFilesystemOnly()Z
    .locals 5

    .prologue
    const/4 v4, 0x1

    .line 162
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/BaseResourceCollectionContainer;->isReference()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 163
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/BaseResourceCollectionContainer;->getCheckedRef()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/apache/tools/ant/types/resources/BaseResourceCollectionContainer;

    invoke-virtual {v3}, Lorg/apache/tools/ant/types/resources/BaseResourceCollectionContainer;->isFilesystemOnly()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v3

    .line 182
    :goto_0
    monitor-exit p0

    return v3

    .line 165
    :cond_0
    :try_start_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/BaseResourceCollectionContainer;->dieOnCircularReference()V

    .line 167
    const/4 v0, 0x1

    .line 168
    .local v0, "goEarly":Z
    iget-object v3, p0, Lorg/apache/tools/ant/types/resources/BaseResourceCollectionContainer;->rc:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i":Ljava/util/Iterator;
    :goto_1
    if-eqz v0, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 169
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/apache/tools/ant/types/ResourceCollection;

    invoke-interface {v3}, Lorg/apache/tools/ant/types/ResourceCollection;->isFilesystemOnly()Z

    move-result v0

    goto :goto_1

    .line 171
    :cond_1
    if-eqz v0, :cond_2

    move v3, v4

    .line 172
    goto :goto_0

    .line 176
    :cond_2
    invoke-direct {p0}, Lorg/apache/tools/ant/types/resources/BaseResourceCollectionContainer;->cacheCollection()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_3
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_5

    .line 177
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/tools/ant/types/Resource;

    .line 178
    .local v2, "r":Lorg/apache/tools/ant/types/Resource;
    sget-object v3, Lorg/apache/tools/ant/types/resources/BaseResourceCollectionContainer;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    if-nez v3, :cond_4

    const-string/jumbo v3, "org.apache.tools.ant.types.resources.FileProvider"

    invoke-static {v3}, Lorg/apache/tools/ant/types/resources/BaseResourceCollectionContainer;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    sput-object v3, Lorg/apache/tools/ant/types/resources/BaseResourceCollectionContainer;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    :goto_2
    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/types/Resource;->as(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v3

    if-nez v3, :cond_3

    .line 179
    const/4 v3, 0x0

    goto :goto_0

    .line 178
    :cond_4
    sget-object v3, Lorg/apache/tools/ant/types/resources/BaseResourceCollectionContainer;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_2

    .end local v2    # "r":Lorg/apache/tools/ant/types/Resource;
    :cond_5
    move v3, v4

    .line 182
    goto :goto_0

    .line 162
    .end local v0    # "goEarly":Z
    .end local v1    # "i":Ljava/util/Iterator;
    :catchall_0
    move-exception v3

    monitor-exit p0

    throw v3
.end method

.method public final declared-synchronized iterator()Ljava/util/Iterator;
    .locals 2

    .prologue
    .line 138
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/BaseResourceCollectionContainer;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 139
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/BaseResourceCollectionContainer;->getCheckedRef()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/resources/BaseResourceCollectionContainer;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/resources/BaseResourceCollectionContainer;->iterator()Ljava/util/Iterator;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    .line 142
    :goto_0
    monitor-exit p0

    return-object v0

    .line 141
    :cond_0
    :try_start_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/BaseResourceCollectionContainer;->dieOnCircularReference()V

    .line 142
    new-instance v0, Lorg/apache/tools/ant/types/resources/FailFast;

    invoke-direct {p0}, Lorg/apache/tools/ant/types/resources/BaseResourceCollectionContainer;->cacheCollection()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lorg/apache/tools/ant/types/resources/FailFast;-><init>(Ljava/lang/Object;Ljava/util/Iterator;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 138
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setCache(Z)V
    .locals 1
    .param p1, "b"    # Z

    .prologue
    .line 64
    monitor-enter p0

    :try_start_0
    iput-boolean p1, p0, Lorg/apache/tools/ant/types/resources/BaseResourceCollectionContainer;->cache:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 65
    monitor-exit p0

    return-void

    .line 64
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized size()I
    .locals 1

    .prologue
    .line 150
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/BaseResourceCollectionContainer;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 151
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/BaseResourceCollectionContainer;->getCheckedRef()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/resources/BaseResourceCollectionContainer;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/resources/BaseResourceCollectionContainer;->size()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    .line 154
    :goto_0
    monitor-exit p0

    return v0

    .line 153
    :cond_0
    :try_start_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/BaseResourceCollectionContainer;->dieOnCircularReference()V

    .line 154
    invoke-direct {p0}, Lorg/apache/tools/ant/types/resources/BaseResourceCollectionContainer;->cacheCollection()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->size()I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v0

    goto :goto_0

    .line 150
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 247
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/BaseResourceCollectionContainer;->isReference()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 248
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/BaseResourceCollectionContainer;->getCheckedRef()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v2

    .line 260
    :goto_0
    monitor-exit p0

    return-object v2

    .line 250
    :cond_0
    :try_start_1
    invoke-direct {p0}, Lorg/apache/tools/ant/types/resources/BaseResourceCollectionContainer;->cacheCollection()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->size()I

    move-result v2

    if-nez v2, :cond_1

    .line 251
    const-string/jumbo v2, ""

    goto :goto_0

    .line 253
    :cond_1
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    .line 254
    .local v1, "sb":Ljava/lang/StringBuffer;
    iget-object v2, p0, Lorg/apache/tools/ant/types/resources/BaseResourceCollectionContainer;->coll:Ljava/util/Collection;

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 255
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->length()I

    move-result v2

    if-lez v2, :cond_2

    .line 256
    sget-char v2, Ljava/io/File;->pathSeparatorChar:C

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 258
    :cond_2
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    .line 247
    .end local v0    # "i":Ljava/util/Iterator;
    .end local v1    # "sb":Ljava/lang/StringBuffer;
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2

    .line 260
    .restart local v0    # "i":Ljava/util/Iterator;
    .restart local v1    # "sb":Ljava/lang/StringBuffer;
    :cond_3
    :try_start_2
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result-object v2

    goto :goto_0
.end method
