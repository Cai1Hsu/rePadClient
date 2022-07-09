.class public Lorg/apache/tools/ant/types/resources/Restrict;
.super Lorg/apache/tools/ant/types/resources/selectors/ResourceSelectorContainer;
.source "Restrict.java"

# interfaces
.implements Lorg/apache/tools/ant/types/ResourceCollection;


# instance fields
.field private w:Lorg/apache/tools/ant/types/resources/LazyResourceCollectionWrapper;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 35
    invoke-direct {p0}, Lorg/apache/tools/ant/types/resources/selectors/ResourceSelectorContainer;-><init>()V

    .line 38
    new-instance v0, Lorg/apache/tools/ant/types/resources/Restrict$1;

    invoke-direct {v0, p0}, Lorg/apache/tools/ant/types/resources/Restrict$1;-><init>(Lorg/apache/tools/ant/types/resources/Restrict;)V

    iput-object v0, p0, Lorg/apache/tools/ant/types/resources/Restrict;->w:Lorg/apache/tools/ant/types/resources/LazyResourceCollectionWrapper;

    return-void
.end method


# virtual methods
.method public declared-synchronized add(Lorg/apache/tools/ant/types/ResourceCollection;)V
    .locals 1
    .param p1, "c"    # Lorg/apache/tools/ant/types/ResourceCollection;

    .prologue
    .line 57
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Restrict;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 58
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Restrict;->noChildrenAllowed()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 57
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 60
    :cond_0
    if-nez p1, :cond_1

    .line 65
    :goto_0
    monitor-exit p0

    return-void

    .line 63
    :cond_1
    :try_start_1
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/Restrict;->w:Lorg/apache/tools/ant/types/resources/LazyResourceCollectionWrapper;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/resources/LazyResourceCollectionWrapper;->add(Lorg/apache/tools/ant/types/ResourceCollection;)V

    .line 64
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/resources/Restrict;->setChecked(Z)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0
.end method

.method public declared-synchronized add(Lorg/apache/tools/ant/types/resources/selectors/ResourceSelector;)V
    .locals 1
    .param p1, "s"    # Lorg/apache/tools/ant/types/resources/selectors/ResourceSelector;

    .prologue
    .line 88
    monitor-enter p0

    if-nez p1, :cond_0

    .line 93
    :goto_0
    monitor-exit p0

    return-void

    .line 91
    :cond_0
    :try_start_0
    invoke-super {p0, p1}, Lorg/apache/tools/ant/types/resources/selectors/ResourceSelectorContainer;->add(Lorg/apache/tools/ant/types/resources/selectors/ResourceSelector;)V

    .line 92
    invoke-static {p0}, Lorg/apache/tools/ant/types/resources/FailFast;->invalidate(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 88
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected declared-synchronized dieOnCircularReference(Ljava/util/Stack;Lorg/apache/tools/ant/Project;)V
    .locals 1
    .param p1, "stk"    # Ljava/util/Stack;
    .param p2, "p"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 144
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Restrict;->isChecked()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-eqz v0, :cond_1

    .line 155
    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    .line 149
    :cond_1
    :try_start_1
    invoke-super {p0, p1, p2}, Lorg/apache/tools/ant/types/resources/selectors/ResourceSelectorContainer;->dieOnCircularReference(Ljava/util/Stack;Lorg/apache/tools/ant/Project;)V

    .line 151
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Restrict;->isReference()Z

    move-result v0

    if-nez v0, :cond_0

    .line 152
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/Restrict;->w:Lorg/apache/tools/ant/types/resources/LazyResourceCollectionWrapper;

    invoke-static {v0, p1, p2}, Lorg/apache/tools/ant/types/resources/Restrict;->pushAndInvokeCircularReferenceCheck(Lorg/apache/tools/ant/types/DataType;Ljava/util/Stack;Lorg/apache/tools/ant/Project;)V

    .line 153
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/resources/Restrict;->setChecked(Z)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 144
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized isCache()Z
    .locals 1

    .prologue
    .line 80
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/Restrict;->w:Lorg/apache/tools/ant/types/resources/LazyResourceCollectionWrapper;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/resources/LazyResourceCollectionWrapper;->isCache()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized isFilesystemOnly()Z
    .locals 1

    .prologue
    .line 124
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Restrict;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 125
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Restrict;->getCheckedRef()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/resources/Restrict;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/resources/Restrict;->isFilesystemOnly()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    .line 128
    :goto_0
    monitor-exit p0

    return v0

    .line 127
    :cond_0
    :try_start_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Restrict;->dieOnCircularReference()V

    .line 128
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/Restrict;->w:Lorg/apache/tools/ant/types/resources/LazyResourceCollectionWrapper;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/resources/LazyResourceCollectionWrapper;->isFilesystemOnly()Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v0

    goto :goto_0

    .line 124
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final declared-synchronized iterator()Ljava/util/Iterator;
    .locals 1

    .prologue
    .line 100
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Restrict;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 101
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Restrict;->getCheckedRef()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/resources/Restrict;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/resources/Restrict;->iterator()Ljava/util/Iterator;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    .line 104
    :goto_0
    monitor-exit p0

    return-object v0

    .line 103
    :cond_0
    :try_start_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Restrict;->dieOnCircularReference()V

    .line 104
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/Restrict;->w:Lorg/apache/tools/ant/types/resources/LazyResourceCollectionWrapper;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/resources/LazyResourceCollectionWrapper;->iterator()Ljava/util/Iterator;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v0

    goto :goto_0

    .line 100
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setCache(Z)V
    .locals 1
    .param p1, "b"    # Z

    .prologue
    .line 72
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/Restrict;->w:Lorg/apache/tools/ant/types/resources/LazyResourceCollectionWrapper;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/resources/LazyResourceCollectionWrapper;->setCache(Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 73
    monitor-exit p0

    return-void

    .line 72
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized size()I
    .locals 1

    .prologue
    .line 112
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Restrict;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 113
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Restrict;->getCheckedRef()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/resources/Restrict;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/resources/Restrict;->size()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    .line 116
    :goto_0
    monitor-exit p0

    return v0

    .line 115
    :cond_0
    :try_start_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Restrict;->dieOnCircularReference()V

    .line 116
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/Restrict;->w:Lorg/apache/tools/ant/types/resources/LazyResourceCollectionWrapper;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/resources/LazyResourceCollectionWrapper;->size()I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v0

    goto :goto_0

    .line 112
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 136
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Restrict;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 137
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Restrict;->getCheckedRef()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    .line 140
    :goto_0
    monitor-exit p0

    return-object v0

    .line 139
    :cond_0
    :try_start_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Restrict;->dieOnCircularReference()V

    .line 140
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/Restrict;->w:Lorg/apache/tools/ant/types/resources/LazyResourceCollectionWrapper;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/resources/LazyResourceCollectionWrapper;->toString()Ljava/lang/String;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v0

    goto :goto_0

    .line 136
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
