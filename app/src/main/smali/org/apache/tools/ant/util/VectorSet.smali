.class public final Lorg/apache/tools/ant/util/VectorSet;
.super Ljava/util/Vector;
.source "VectorSet.java"


# instance fields
.field private final set:Ljava/util/HashSet;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 43
    invoke-direct {p0}, Ljava/util/Vector;-><init>()V

    .line 41
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/util/VectorSet;->set:Ljava/util/HashSet;

    .line 43
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .param p1, "initialCapacity"    # I

    .prologue
    .line 45
    invoke-direct {p0, p1}, Ljava/util/Vector;-><init>(I)V

    .line 41
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/util/VectorSet;->set:Ljava/util/HashSet;

    .line 45
    return-void
.end method

.method public constructor <init>(II)V
    .locals 1
    .param p1, "initialCapacity"    # I
    .param p2, "capacityIncrement"    # I

    .prologue
    .line 48
    invoke-direct {p0, p1, p2}, Ljava/util/Vector;-><init>(II)V

    .line 41
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/util/VectorSet;->set:Ljava/util/HashSet;

    .line 49
    return-void
.end method

.method public constructor <init>(Ljava/util/Collection;)V
    .locals 2
    .param p1, "c"    # Ljava/util/Collection;

    .prologue
    .line 51
    invoke-direct {p0}, Ljava/util/Vector;-><init>()V

    .line 41
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    iput-object v1, p0, Lorg/apache/tools/ant/util/VectorSet;->set:Ljava/util/HashSet;

    .line 52
    if-eqz p1, :cond_0

    .line 53
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 54
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/util/VectorSet;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 57
    .end local v0    # "i":Ljava/util/Iterator;
    :cond_0
    return-void
.end method

.method private declared-synchronized doAdd(ILjava/lang/Object;)V
    .locals 5
    .param p1, "index"    # I
    .param p2, "o"    # Ljava/lang/Object;

    .prologue
    .line 78
    monitor-enter p0

    :try_start_0
    iget-object v1, p0, Lorg/apache/tools/ant/util/VectorSet;->set:Ljava/util/HashSet;

    invoke-virtual {v1, p2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 79
    invoke-virtual {p0}, Lorg/apache/tools/ant/util/VectorSet;->size()I

    move-result v0

    .line 80
    .local v0, "count":I
    add-int/lit8 v1, v0, 0x1

    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/util/VectorSet;->ensureCapacity(I)V

    .line 81
    if-eq p1, v0, :cond_0

    .line 82
    iget-object v1, p0, Lorg/apache/tools/ant/util/VectorSet;->elementData:[Ljava/lang/Object;

    iget-object v2, p0, Lorg/apache/tools/ant/util/VectorSet;->elementData:[Ljava/lang/Object;

    add-int/lit8 v3, p1, 0x1

    sub-int v4, v0, p1

    invoke-static {v1, p1, v2, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 85
    :cond_0
    iget-object v1, p0, Lorg/apache/tools/ant/util/VectorSet;->elementData:[Ljava/lang/Object;

    aput-object p2, v1, p1

    .line 86
    iget v1, p0, Lorg/apache/tools/ant/util/VectorSet;->elementCount:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lorg/apache/tools/ant/util/VectorSet;->elementCount:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 88
    .end local v0    # "count":I
    :cond_1
    monitor-exit p0

    return-void

    .line 78
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method private declared-synchronized doRemove(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 154
    monitor-enter p0

    :try_start_0
    iget-object v1, p0, Lorg/apache/tools/ant/util/VectorSet;->set:Ljava/util/HashSet;

    invoke-virtual {v1, p1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 155
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/util/VectorSet;->indexOf(Ljava/lang/Object;)I

    move-result v0

    .line 156
    .local v0, "index":I
    iget-object v1, p0, Lorg/apache/tools/ant/util/VectorSet;->elementData:[Ljava/lang/Object;

    array-length v1, v1

    add-int/lit8 v1, v1, -0x1

    if-ge v0, v1, :cond_0

    .line 157
    iget-object v1, p0, Lorg/apache/tools/ant/util/VectorSet;->elementData:[Ljava/lang/Object;

    add-int/lit8 v2, v0, 0x1

    iget-object v3, p0, Lorg/apache/tools/ant/util/VectorSet;->elementData:[Ljava/lang/Object;

    iget-object v4, p0, Lorg/apache/tools/ant/util/VectorSet;->elementData:[Ljava/lang/Object;

    array-length v4, v4

    sub-int/2addr v4, v0

    add-int/lit8 v4, v4, -0x1

    invoke-static {v1, v2, v3, v0, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 160
    :cond_0
    iget v1, p0, Lorg/apache/tools/ant/util/VectorSet;->elementCount:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lorg/apache/tools/ant/util/VectorSet;->elementCount:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 161
    const/4 v1, 0x1

    .line 163
    .end local v0    # "index":I
    :goto_0
    monitor-exit p0

    return v1

    :cond_1
    const/4 v1, 0x0

    goto :goto_0

    .line 154
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method


# virtual methods
.method public add(ILjava/lang/Object;)V
    .locals 0
    .param p1, "index"    # I
    .param p2, "o"    # Ljava/lang/Object;

    .prologue
    .line 72
    invoke-direct {p0, p1, p2}, Lorg/apache/tools/ant/util/VectorSet;->doAdd(ILjava/lang/Object;)V

    .line 73
    return-void
.end method

.method public declared-synchronized add(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 60
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lorg/apache/tools/ant/util/VectorSet;->set:Ljava/util/HashSet;

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 61
    invoke-virtual {p0}, Lorg/apache/tools/ant/util/VectorSet;->size()I

    move-result v0

    invoke-direct {p0, v0, p1}, Lorg/apache/tools/ant/util/VectorSet;->doAdd(ILjava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 62
    const/4 v0, 0x1

    .line 64
    :goto_0
    monitor-exit p0

    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    .line 60
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized addAll(ILjava/util/Collection;)Z
    .locals 5
    .param p1, "index"    # I
    .param p2, "c"    # Ljava/util/Collection;

    .prologue
    .line 107
    monitor-enter p0

    const/4 v0, 0x0

    .line 108
    .local v0, "changed":Z
    :try_start_0
    invoke-interface {p2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    .local v1, "i":Ljava/util/Iterator;
    move v2, p1

    .end local p1    # "index":I
    .local v2, "index":I
    :goto_0
    :try_start_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 109
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    .line 110
    .local v3, "o":Ljava/lang/Object;
    iget-object v4, p0, Lorg/apache/tools/ant/util/VectorSet;->set:Ljava/util/HashSet;

    invoke-virtual {v4, v3}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-result v4

    if-nez v4, :cond_1

    .line 111
    add-int/lit8 p1, v2, 0x1

    .end local v2    # "index":I
    .restart local p1    # "index":I
    :try_start_2
    invoke-direct {p0, v2, v3}, Lorg/apache/tools/ant/util/VectorSet;->doAdd(ILjava/lang/Object;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 112
    const/4 v0, 0x1

    :goto_1
    move v2, p1

    .end local p1    # "index":I
    .restart local v2    # "index":I
    goto :goto_0

    .line 115
    .end local v3    # "o":Ljava/lang/Object;
    :cond_0
    monitor-exit p0

    return v0

    .line 107
    .end local v1    # "i":Ljava/util/Iterator;
    .end local v2    # "index":I
    .restart local p1    # "index":I
    :catchall_0
    move-exception v4

    :goto_2
    monitor-exit p0

    throw v4

    .end local p1    # "index":I
    .restart local v1    # "i":Ljava/util/Iterator;
    .restart local v2    # "index":I
    :catchall_1
    move-exception v4

    move p1, v2

    .end local v2    # "index":I
    .restart local p1    # "index":I
    goto :goto_2

    .end local p1    # "index":I
    .restart local v2    # "index":I
    .restart local v3    # "o":Ljava/lang/Object;
    :cond_1
    move p1, v2

    .end local v2    # "index":I
    .restart local p1    # "index":I
    goto :goto_1
.end method

.method public declared-synchronized addAll(Ljava/util/Collection;)Z
    .locals 3
    .param p1, "c"    # Ljava/util/Collection;

    .prologue
    .line 95
    monitor-enter p0

    const/4 v0, 0x0

    .line 96
    .local v0, "changed":Z
    :try_start_0
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 97
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p0, v2}, Lorg/apache/tools/ant/util/VectorSet;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v2

    or-int/2addr v0, v2

    goto :goto_0

    .line 99
    :cond_0
    monitor-exit p0

    return v0

    .line 95
    .end local v1    # "i":Ljava/util/Iterator;
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method public declared-synchronized addElement(Ljava/lang/Object;)V
    .locals 1
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 91
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/util/VectorSet;->size()I

    move-result v0

    invoke-direct {p0, v0, p1}, Lorg/apache/tools/ant/util/VectorSet;->doAdd(ILjava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 92
    monitor-exit p0

    return-void

    .line 91
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized clear()V
    .locals 1

    .prologue
    .line 119
    monitor-enter p0

    :try_start_0
    invoke-super {p0}, Ljava/util/Vector;->clear()V

    .line 120
    iget-object v0, p0, Lorg/apache/tools/ant/util/VectorSet;->set:Ljava/util/HashSet;

    invoke-virtual {v0}, Ljava/util/HashSet;->clear()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 121
    monitor-exit p0

    return-void

    .line 119
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public clone()Ljava/lang/Object;
    .locals 3

    .prologue
    .line 124
    invoke-super {p0}, Ljava/util/Vector;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/util/VectorSet;

    .line 125
    .local v0, "vs":Lorg/apache/tools/ant/util/VectorSet;
    iget-object v1, v0, Lorg/apache/tools/ant/util/VectorSet;->set:Ljava/util/HashSet;

    iget-object v2, p0, Lorg/apache/tools/ant/util/VectorSet;->set:Ljava/util/HashSet;

    invoke-virtual {v1, v2}, Ljava/util/HashSet;->addAll(Ljava/util/Collection;)Z

    .line 126
    return-object v0
.end method

.method public declared-synchronized contains(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 130
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lorg/apache/tools/ant/util/VectorSet;->set:Ljava/util/HashSet;

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z
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

.method public declared-synchronized containsAll(Ljava/util/Collection;)Z
    .locals 1
    .param p1, "c"    # Ljava/util/Collection;

    .prologue
    .line 134
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lorg/apache/tools/ant/util/VectorSet;->set:Ljava/util/HashSet;

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->containsAll(Ljava/util/Collection;)Z
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

.method public insertElementAt(Ljava/lang/Object;I)V
    .locals 0
    .param p1, "o"    # Ljava/lang/Object;
    .param p2, "index"    # I

    .prologue
    .line 138
    invoke-direct {p0, p2, p1}, Lorg/apache/tools/ant/util/VectorSet;->doAdd(ILjava/lang/Object;)V

    .line 139
    return-void
.end method

.method public declared-synchronized remove(I)Ljava/lang/Object;
    .locals 2
    .param p1, "index"    # I

    .prologue
    .line 142
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/util/VectorSet;->get(I)Ljava/lang/Object;

    move-result-object v0

    .line 143
    .local v0, "o":Ljava/lang/Object;
    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/util/VectorSet;->remove(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 144
    monitor-exit p0

    return-object v0

    .line 142
    .end local v0    # "o":Ljava/lang/Object;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public remove(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 148
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/util/VectorSet;->doRemove(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public declared-synchronized removeAll(Ljava/util/Collection;)Z
    .locals 3
    .param p1, "c"    # Ljava/util/Collection;

    .prologue
    .line 167
    monitor-enter p0

    const/4 v0, 0x0

    .line 168
    .local v0, "changed":Z
    :try_start_0
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 169
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p0, v2}, Lorg/apache/tools/ant/util/VectorSet;->remove(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v2

    or-int/2addr v0, v2

    goto :goto_0

    .line 171
    :cond_0
    monitor-exit p0

    return v0

    .line 167
    .end local v1    # "i":Ljava/util/Iterator;
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method public declared-synchronized removeAllElements()V
    .locals 1

    .prologue
    .line 175
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lorg/apache/tools/ant/util/VectorSet;->set:Ljava/util/HashSet;

    invoke-virtual {v0}, Ljava/util/HashSet;->clear()V

    .line 176
    invoke-super {p0}, Ljava/util/Vector;->removeAllElements()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 177
    monitor-exit p0

    return-void

    .line 175
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public removeElement(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 180
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/util/VectorSet;->doRemove(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public declared-synchronized removeElementAt(I)V
    .locals 1
    .param p1, "index"    # I

    .prologue
    .line 184
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/util/VectorSet;->get(I)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/util/VectorSet;->remove(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 185
    monitor-exit p0

    return-void

    .line 184
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized removeRange(II)V
    .locals 1
    .param p1, "fromIndex"    # I
    .param p2, "toIndex"    # I

    .prologue
    .line 188
    monitor-enter p0

    :goto_0
    if-le p2, p1, :cond_0

    .line 189
    add-int/lit8 p2, p2, -0x1

    :try_start_0
    invoke-virtual {p0, p2}, Lorg/apache/tools/ant/util/VectorSet;->remove(I)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 188
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 191
    :cond_0
    monitor-exit p0

    return-void
.end method

.method public declared-synchronized retainAll(Ljava/util/Collection;)Z
    .locals 4
    .param p1, "c"    # Ljava/util/Collection;

    .prologue
    .line 194
    monitor-enter p0

    :try_start_0
    new-instance v1, Ljava/util/LinkedList;

    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    .line 195
    .local v1, "l":Ljava/util/LinkedList;
    invoke-virtual {p0}, Lorg/apache/tools/ant/util/VectorSet;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 196
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 197
    .local v2, "o":Ljava/lang/Object;
    invoke-interface {p1, v2}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 198
    invoke-virtual {v1, v2}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 194
    .end local v0    # "i":Ljava/util/Iterator;
    .end local v1    # "l":Ljava/util/LinkedList;
    .end local v2    # "o":Ljava/lang/Object;
    :catchall_0
    move-exception v3

    monitor-exit p0

    throw v3

    .line 201
    .restart local v0    # "i":Ljava/util/Iterator;
    .restart local v1    # "l":Ljava/util/LinkedList;
    :cond_1
    :try_start_1
    invoke-virtual {v1}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_2

    .line 202
    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/util/VectorSet;->removeAll(Ljava/util/Collection;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 203
    const/4 v3, 0x1

    .line 205
    :goto_1
    monitor-exit p0

    return v3

    :cond_2
    const/4 v3, 0x0

    goto :goto_1
.end method

.method public declared-synchronized set(ILjava/lang/Object;)Ljava/lang/Object;
    .locals 3
    .param p1, "index"    # I
    .param p2, "o"    # Ljava/lang/Object;

    .prologue
    .line 209
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/util/VectorSet;->get(I)Ljava/lang/Object;

    move-result-object v1

    .line 210
    .local v1, "orig":Ljava/lang/Object;
    iget-object v2, p0, Lorg/apache/tools/ant/util/VectorSet;->set:Ljava/util/HashSet;

    invoke-virtual {v2, p2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 211
    iget-object v2, p0, Lorg/apache/tools/ant/util/VectorSet;->elementData:[Ljava/lang/Object;

    aput-object p2, v2, p1

    .line 212
    iget-object v2, p0, Lorg/apache/tools/ant/util/VectorSet;->set:Ljava/util/HashSet;

    invoke-virtual {v2, v1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 219
    .end local p1    # "index":I
    :goto_0
    monitor-exit p0

    return-object v1

    .line 214
    .restart local p1    # "index":I
    :cond_0
    :try_start_1
    invoke-virtual {p0, p2}, Lorg/apache/tools/ant/util/VectorSet;->indexOf(Ljava/lang/Object;)I

    move-result v0

    .line 215
    .local v0, "oldIndexOfO":I
    invoke-virtual {p0, p2}, Lorg/apache/tools/ant/util/VectorSet;->remove(Ljava/lang/Object;)Z

    .line 216
    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/util/VectorSet;->remove(Ljava/lang/Object;)Z

    .line 217
    if-le v0, p1, :cond_1

    .end local p1    # "index":I
    :goto_1
    invoke-virtual {p0, p1, p2}, Lorg/apache/tools/ant/util/VectorSet;->add(ILjava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 209
    .end local v0    # "oldIndexOfO":I
    .end local v1    # "orig":Ljava/lang/Object;
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2

    .line 217
    .restart local v0    # "oldIndexOfO":I
    .restart local v1    # "orig":Ljava/lang/Object;
    .restart local p1    # "index":I
    :cond_1
    add-int/lit8 p1, p1, -0x1

    goto :goto_1
.end method

.method public setElementAt(Ljava/lang/Object;I)V
    .locals 0
    .param p1, "o"    # Ljava/lang/Object;
    .param p2, "index"    # I

    .prologue
    .line 223
    invoke-virtual {p0, p2, p1}, Lorg/apache/tools/ant/util/VectorSet;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 224
    return-void
.end method
