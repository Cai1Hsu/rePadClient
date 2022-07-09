.class public Lorg/apache/tools/ant/types/resources/Sort;
.super Lorg/apache/tools/ant/types/resources/BaseResourceCollectionWrapper;
.source "Sort.java"


# instance fields
.field private comp:Lorg/apache/tools/ant/types/resources/comparators/DelegatedResourceComparator;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 42
    invoke-direct {p0}, Lorg/apache/tools/ant/types/resources/BaseResourceCollectionWrapper;-><init>()V

    .line 44
    new-instance v0, Lorg/apache/tools/ant/types/resources/comparators/DelegatedResourceComparator;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/resources/comparators/DelegatedResourceComparator;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/types/resources/Sort;->comp:Lorg/apache/tools/ant/types/resources/comparators/DelegatedResourceComparator;

    return-void
.end method


# virtual methods
.method public declared-synchronized add(Lorg/apache/tools/ant/types/resources/comparators/ResourceComparator;)V
    .locals 1
    .param p1, "c"    # Lorg/apache/tools/ant/types/resources/comparators/ResourceComparator;

    .prologue
    .line 67
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Sort;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 68
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Sort;->noChildrenAllowed()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 67
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 70
    :cond_0
    :try_start_1
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/Sort;->comp:Lorg/apache/tools/ant/types/resources/comparators/DelegatedResourceComparator;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/resources/comparators/DelegatedResourceComparator;->add(Lorg/apache/tools/ant/types/resources/comparators/ResourceComparator;)V

    .line 71
    invoke-static {p0}, Lorg/apache/tools/ant/types/resources/FailFast;->invalidate(Ljava/lang/Object;)V

    .line 72
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/resources/Sort;->setChecked(Z)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 73
    monitor-exit p0

    return-void
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
    .line 84
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Sort;->isChecked()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-eqz v0, :cond_1

    .line 95
    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    .line 89
    :cond_1
    :try_start_1
    invoke-super {p0, p1, p2}, Lorg/apache/tools/ant/types/resources/BaseResourceCollectionWrapper;->dieOnCircularReference(Ljava/util/Stack;Lorg/apache/tools/ant/Project;)V

    .line 91
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Sort;->isReference()Z

    move-result v0

    if-nez v0, :cond_0

    .line 92
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/Sort;->comp:Lorg/apache/tools/ant/types/resources/comparators/DelegatedResourceComparator;

    invoke-static {v0, p1, p2}, Lorg/apache/tools/ant/types/DataType;->pushAndInvokeCircularReferenceCheck(Lorg/apache/tools/ant/types/DataType;Ljava/util/Stack;Lorg/apache/tools/ant/Project;)V

    .line 93
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/resources/Sort;->setChecked(Z)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 84
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected declared-synchronized getCollection()Ljava/util/Collection;
    .locals 4

    .prologue
    .line 51
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Sort;->getResourceCollection()Lorg/apache/tools/ant/types/ResourceCollection;

    move-result-object v1

    .line 52
    .local v1, "rc":Lorg/apache/tools/ant/types/ResourceCollection;
    invoke-interface {v1}, Lorg/apache/tools/ant/types/ResourceCollection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 53
    .local v0, "iter":Ljava/util/Iterator;
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_0

    .line 54
    sget-object v2, Ljava/util/Collections;->EMPTY_SET:Ljava/util/Set;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 58
    :goto_0
    monitor-exit p0

    return-object v2

    .line 56
    :cond_0
    :try_start_1
    invoke-static {v0}, Lorg/apache/tools/ant/util/CollectionUtils;->asCollection(Ljava/util/Iterator;)Ljava/util/Collection;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    .line 57
    .local v2, "result":Ljava/util/List;
    iget-object v3, p0, Lorg/apache/tools/ant/types/resources/Sort;->comp:Lorg/apache/tools/ant/types/resources/comparators/DelegatedResourceComparator;

    invoke-static {v2, v3}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 51
    .end local v0    # "iter":Ljava/util/Iterator;
    .end local v1    # "rc":Lorg/apache/tools/ant/types/ResourceCollection;
    .end local v2    # "result":Ljava/util/List;
    :catchall_0
    move-exception v3

    monitor-exit p0

    throw v3
.end method
