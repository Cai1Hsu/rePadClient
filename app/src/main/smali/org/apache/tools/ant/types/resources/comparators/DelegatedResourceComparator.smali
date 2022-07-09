.class public Lorg/apache/tools/ant/types/resources/comparators/DelegatedResourceComparator;
.super Lorg/apache/tools/ant/types/resources/comparators/ResourceComparator;
.source "DelegatedResourceComparator.java"


# instance fields
.field private v:Ljava/util/Vector;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 34
    invoke-direct {p0}, Lorg/apache/tools/ant/types/resources/comparators/ResourceComparator;-><init>()V

    .line 36
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/types/resources/comparators/DelegatedResourceComparator;->v:Ljava/util/Vector;

    return-void
.end method


# virtual methods
.method public declared-synchronized add(Lorg/apache/tools/ant/types/resources/comparators/ResourceComparator;)V
    .locals 1
    .param p1, "c"    # Lorg/apache/tools/ant/types/resources/comparators/ResourceComparator;

    .prologue
    .line 43
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/comparators/DelegatedResourceComparator;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 44
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/comparators/DelegatedResourceComparator;->noChildrenAllowed()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 43
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 46
    :cond_0
    if-nez p1, :cond_1

    .line 52
    :goto_0
    monitor-exit p0

    return-void

    .line 49
    :cond_1
    :try_start_1
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/comparators/DelegatedResourceComparator;->v:Ljava/util/Vector;

    if-nez v0, :cond_2

    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    :goto_1
    iput-object v0, p0, Lorg/apache/tools/ant/types/resources/comparators/DelegatedResourceComparator;->v:Ljava/util/Vector;

    .line 50
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/comparators/DelegatedResourceComparator;->v:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 51
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/resources/comparators/DelegatedResourceComparator;->setChecked(Z)V

    goto :goto_0

    .line 49
    :cond_2
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/comparators/DelegatedResourceComparator;->v:Ljava/util/Vector;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1
.end method

.method protected dieOnCircularReference(Ljava/util/Stack;Lorg/apache/tools/ant/Project;)V
    .locals 3
    .param p1, "stk"    # Ljava/util/Stack;
    .param p2, "p"    # Lorg/apache/tools/ant/Project;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 107
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/comparators/DelegatedResourceComparator;->isChecked()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 124
    :goto_0
    return-void

    .line 110
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/comparators/DelegatedResourceComparator;->isReference()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 111
    invoke-super {p0, p1, p2}, Lorg/apache/tools/ant/types/resources/comparators/ResourceComparator;->dieOnCircularReference(Ljava/util/Stack;Lorg/apache/tools/ant/Project;)V

    goto :goto_0

    .line 113
    :cond_1
    iget-object v2, p0, Lorg/apache/tools/ant/types/resources/comparators/DelegatedResourceComparator;->v:Ljava/util/Vector;

    if-eqz v2, :cond_3

    iget-object v2, p0, Lorg/apache/tools/ant/types/resources/comparators/DelegatedResourceComparator;->v:Ljava/util/Vector;

    invoke-virtual {v2}, Ljava/util/Vector;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_3

    .line 114
    iget-object v2, p0, Lorg/apache/tools/ant/types/resources/comparators/DelegatedResourceComparator;->v:Ljava/util/Vector;

    invoke-virtual {v2}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i":Ljava/util/Iterator;
    :cond_2
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 115
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 116
    .local v1, "o":Ljava/lang/Object;
    instance-of v2, v1, Lorg/apache/tools/ant/types/DataType;

    if-eqz v2, :cond_2

    .line 117
    check-cast v1, Lorg/apache/tools/ant/types/DataType;

    .end local v1    # "o":Ljava/lang/Object;
    invoke-static {v1, p1, p2}, Lorg/apache/tools/ant/types/resources/comparators/DelegatedResourceComparator;->pushAndInvokeCircularReferenceCheck(Lorg/apache/tools/ant/types/DataType;Ljava/util/Stack;Lorg/apache/tools/ant/Project;)V

    goto :goto_1

    .line 122
    .end local v0    # "i":Ljava/util/Iterator;
    :cond_3
    const/4 v2, 0x1

    invoke-virtual {p0, v2}, Lorg/apache/tools/ant/types/resources/comparators/DelegatedResourceComparator;->setChecked(Z)V

    goto :goto_0
.end method

.method public declared-synchronized equals(Ljava/lang/Object;)Z
    .locals 4
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 61
    monitor-enter p0

    if-ne p1, p0, :cond_1

    .line 71
    .end local p1    # "o":Ljava/lang/Object;
    :cond_0
    :goto_0
    monitor-exit p0

    return v1

    .line 64
    .restart local p1    # "o":Ljava/lang/Object;
    :cond_1
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/comparators/DelegatedResourceComparator;->isReference()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 65
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/comparators/DelegatedResourceComparator;->getCheckedRef()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    goto :goto_0

    .line 67
    :cond_2
    instance-of v3, p1, Lorg/apache/tools/ant/types/resources/comparators/DelegatedResourceComparator;

    if-nez v3, :cond_3

    move v1, v2

    .line 68
    goto :goto_0

    .line 70
    :cond_3
    check-cast p1, Lorg/apache/tools/ant/types/resources/comparators/DelegatedResourceComparator;

    .end local p1    # "o":Ljava/lang/Object;
    iget-object v0, p1, Lorg/apache/tools/ant/types/resources/comparators/DelegatedResourceComparator;->v:Ljava/util/Vector;

    .line 71
    .local v0, "ov":Ljava/util/Vector;
    iget-object v3, p0, Lorg/apache/tools/ant/types/resources/comparators/DelegatedResourceComparator;->v:Ljava/util/Vector;

    if-nez v3, :cond_4

    if-eqz v0, :cond_0

    move v1, v2

    goto :goto_0

    :cond_4
    iget-object v1, p0, Lorg/apache/tools/ant/types/resources/comparators/DelegatedResourceComparator;->v:Ljava/util/Vector;

    invoke-virtual {v1, v0}, Ljava/util/Vector;->equals(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v1

    goto :goto_0

    .line 61
    .end local v0    # "ov":Ljava/util/Vector;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized hashCode()I
    .locals 1

    .prologue
    .line 79
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/comparators/DelegatedResourceComparator;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 80
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/comparators/DelegatedResourceComparator;->getCheckedRef()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    .line 82
    :goto_0
    monitor-exit p0

    return v0

    :cond_0
    :try_start_1
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/comparators/DelegatedResourceComparator;->v:Ljava/util/Vector;

    if-nez v0, :cond_1

    const/4 v0, 0x0

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/comparators/DelegatedResourceComparator;->v:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->hashCode()I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v0

    goto :goto_0

    .line 79
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected declared-synchronized resourceCompare(Lorg/apache/tools/ant/types/Resource;Lorg/apache/tools/ant/types/Resource;)I
    .locals 3
    .param p1, "foo"    # Lorg/apache/tools/ant/types/Resource;
    .param p2, "bar"    # Lorg/apache/tools/ant/types/Resource;

    .prologue
    .line 88
    monitor-enter p0

    :try_start_0
    iget-object v2, p0, Lorg/apache/tools/ant/types/resources/comparators/DelegatedResourceComparator;->v:Ljava/util/Vector;

    if-eqz v2, :cond_0

    iget-object v2, p0, Lorg/apache/tools/ant/types/resources/comparators/DelegatedResourceComparator;->v:Ljava/util/Vector;

    invoke-virtual {v2}, Ljava/util/Vector;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 89
    :cond_0
    invoke-virtual {p1, p2}, Lorg/apache/tools/ant/types/Resource;->compareTo(Ljava/lang/Object;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v1

    .line 95
    :cond_1
    monitor-exit p0

    return v1

    .line 91
    :cond_2
    const/4 v1, 0x0

    .line 92
    .local v1, "result":I
    :try_start_1
    iget-object v2, p0, Lorg/apache/tools/ant/types/resources/comparators/DelegatedResourceComparator;->v:Ljava/util/Vector;

    invoke-virtual {v2}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i":Ljava/util/Iterator;
    :goto_0
    if-nez v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 93
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/tools/ant/types/resources/comparators/ResourceComparator;

    invoke-virtual {v2, p1, p2}, Lorg/apache/tools/ant/types/resources/comparators/ResourceComparator;->resourceCompare(Lorg/apache/tools/ant/types/Resource;Lorg/apache/tools/ant/types/Resource;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v1

    goto :goto_0

    .line 88
    .end local v0    # "i":Ljava/util/Iterator;
    .end local v1    # "result":I
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2
.end method
