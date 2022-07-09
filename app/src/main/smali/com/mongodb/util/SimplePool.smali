.class public abstract Lcom/mongodb/util/SimplePool;
.super Ljava/lang/Object;
.source "SimplePool.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field protected final _avail:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<TT;>;"
        }
    .end annotation
.end field

.field private _closed:Z

.field protected final _name:Ljava/lang/String;

.field protected final _out:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<TT;>;"
        }
    .end annotation
.end field

.field private final _sem:Ljava/util/concurrent/Semaphore;

.field protected final _size:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 29
    const-class v0, Lcom/mongodb/util/SimplePool;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lcom/mongodb/util/SimplePool;->$assertionsDisabled:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public constructor <init>(Ljava/lang/String;I)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "size"    # I

    .prologue
    .line 36
    .local p0, "this":Lcom/mongodb/util/SimplePool;, "Lcom/mongodb/util/SimplePool<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 200
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/mongodb/util/SimplePool;->_avail:Ljava/util/List;

    .line 201
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/mongodb/util/SimplePool;->_out:Ljava/util/Set;

    .line 37
    iput-object p1, p0, Lcom/mongodb/util/SimplePool;->_name:Ljava/lang/String;

    .line 38
    iput p2, p0, Lcom/mongodb/util/SimplePool;->_size:I

    .line 39
    new-instance v0, Ljava/util/concurrent/Semaphore;

    invoke-direct {v0, p2}, Ljava/util/concurrent/Semaphore;-><init>(I)V

    iput-object v0, p0, Lcom/mongodb/util/SimplePool;->_sem:Ljava/util/concurrent/Semaphore;

    .line 40
    return-void
.end method

.method private assertConditions()V
    .locals 2

    .prologue
    .line 89
    .local p0, "this":Lcom/mongodb/util/SimplePool;, "Lcom/mongodb/util/SimplePool<TT;>;"
    sget-boolean v0, Lcom/mongodb/util/SimplePool;->$assertionsDisabled:Z

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/mongodb/util/SimplePool;->getTotal()I

    move-result v0

    invoke-virtual {p0}, Lcom/mongodb/util/SimplePool;->getMaxSize()I

    move-result v1

    if-le v0, v1, :cond_0

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 90
    :cond_0
    return-void
.end method

.method private createNewAndReleasePermitIfFailure()Ljava/lang/Object;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .line 133
    .local p0, "this":Lcom/mongodb/util/SimplePool;, "Lcom/mongodb/util/SimplePool<TT;>;"
    :try_start_0
    invoke-virtual {p0}, Lcom/mongodb/util/SimplePool;->createNew()Ljava/lang/Object;

    move-result-object v1

    .line 134
    .local v1, "newMember":Ljava/lang/Object;, "TT;"
    if-nez v1, :cond_0

    .line 135
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string/jumbo v3, "null pool members are not allowed"

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_1

    .line 138
    .end local v1    # "newMember":Ljava/lang/Object;, "TT;"
    :catch_0
    move-exception v0

    .line 139
    .local v0, "e":Ljava/lang/RuntimeException;
    iget-object v2, p0, Lcom/mongodb/util/SimplePool;->_sem:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v2}, Ljava/util/concurrent/Semaphore;->release()V

    .line 140
    throw v0

    .line 141
    .end local v0    # "e":Ljava/lang/RuntimeException;
    :catch_1
    move-exception v0

    .line 142
    .local v0, "e":Ljava/lang/Error;
    iget-object v2, p0, Lcom/mongodb/util/SimplePool;->_sem:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v2}, Ljava/util/concurrent/Semaphore;->release()V

    .line 143
    throw v0

    .line 137
    .end local v0    # "e":Ljava/lang/Error;
    .restart local v1    # "newMember":Ljava/lang/Object;, "TT;"
    :cond_0
    return-object v1
.end method

.method private permitAcquired(J)Z
    .locals 5
    .param p1, "waitTime"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/mongodb/util/SimplePool;, "Lcom/mongodb/util/SimplePool<TT;>;"
    const-wide/16 v2, 0x0

    .line 148
    cmp-long v0, p1, v2

    if-lez v0, :cond_0

    .line 149
    iget-object v0, p0, Lcom/mongodb/util/SimplePool;->_sem:Ljava/util/concurrent/Semaphore;

    sget-object v1, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, p1, p2, v1}, Ljava/util/concurrent/Semaphore;->tryAcquire(JLjava/util/concurrent/TimeUnit;)Z

    move-result v0

    .line 154
    :goto_0
    return v0

    .line 150
    :cond_0
    cmp-long v0, p1, v2

    if-gez v0, :cond_1

    .line 151
    iget-object v0, p0, Lcom/mongodb/util/SimplePool;->_sem:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v0}, Ljava/util/concurrent/Semaphore;->acquire()V

    .line 152
    const/4 v0, 0x1

    goto :goto_0

    .line 154
    :cond_1
    iget-object v0, p0, Lcom/mongodb/util/SimplePool;->_sem:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v0}, Ljava/util/concurrent/Semaphore;->tryAcquire()Z

    move-result v0

    goto :goto_0
.end method


# virtual methods
.method public cleanup(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 51
    .local p0, "this":Lcom/mongodb/util/SimplePool;, "Lcom/mongodb/util/SimplePool<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    return-void
.end method

.method protected declared-synchronized close()V
    .locals 3

    .prologue
    .line 160
    .local p0, "this":Lcom/mongodb/util/SimplePool;, "Lcom/mongodb/util/SimplePool<TT;>;"
    monitor-enter p0

    const/4 v2, 0x1

    :try_start_0
    iput-boolean v2, p0, Lcom/mongodb/util/SimplePool;->_closed:Z

    .line 161
    iget-object v2, p0, Lcom/mongodb/util/SimplePool;->_avail:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 162
    .local v1, "t":Ljava/lang/Object;, "TT;"
    invoke-virtual {p0, v1}, Lcom/mongodb/util/SimplePool;->cleanup(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 160
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v1    # "t":Ljava/lang/Object;, "TT;"
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2

    .line 163
    .restart local v0    # "i$":Ljava/util/Iterator;
    :cond_0
    :try_start_1
    iget-object v2, p0, Lcom/mongodb/util/SimplePool;->_avail:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->clear()V

    .line 164
    iget-object v2, p0, Lcom/mongodb/util/SimplePool;->_out:Ljava/util/Set;

    invoke-interface {v2}, Ljava/util/Set;->clear()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 165
    monitor-exit p0

    return-void
.end method

.method protected abstract createNew()Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation
.end method

.method public done(Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 70
    .local p0, "this":Lcom/mongodb/util/SimplePool;, "Lcom/mongodb/util/SimplePool<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    monitor-enter p0

    .line 71
    :try_start_0
    iget-boolean v0, p0, Lcom/mongodb/util/SimplePool;->_closed:Z

    if-eqz v0, :cond_0

    .line 72
    invoke-virtual {p0, p1}, Lcom/mongodb/util/SimplePool;->cleanup(Ljava/lang/Object;)V

    .line 73
    monitor-exit p0

    .line 86
    :goto_0
    return-void

    .line 76
    :cond_0
    invoke-direct {p0}, Lcom/mongodb/util/SimplePool;->assertConditions()V

    .line 78
    iget-object v0, p0, Lcom/mongodb/util/SimplePool;->_out:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 79
    new-instance v0, Ljava/lang/RuntimeException;

    const-string/jumbo v1, "trying to put something back in the pool wasn\'t checked out"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 84
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    .line 82
    :cond_1
    :try_start_1
    iget-object v0, p0, Lcom/mongodb/util/SimplePool;->_avail:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 84
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 85
    iget-object v0, p0, Lcom/mongodb/util/SimplePool;->_sem:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v0}, Ljava/util/concurrent/Semaphore;->release()V

    goto :goto_0
.end method

.method public get()Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 100
    .local p0, "this":Lcom/mongodb/util/SimplePool;, "Lcom/mongodb/util/SimplePool<TT;>;"
    const-wide/16 v0, -0x1

    invoke-virtual {p0, v0, v1}, Lcom/mongodb/util/SimplePool;->get(J)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public get(J)Ljava/lang/Object;
    .locals 5
    .param p1, "waitTime"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 111
    .local p0, "this":Lcom/mongodb/util/SimplePool;, "Lcom/mongodb/util/SimplePool<TT;>;"
    invoke-direct {p0, p1, p2}, Lcom/mongodb/util/SimplePool;->permitAcquired(J)Z

    move-result v2

    if-nez v2, :cond_0

    .line 112
    const/4 v0, 0x0

    .line 127
    :goto_0
    return-object v0

    .line 115
    :cond_0
    monitor-enter p0

    .line 116
    :try_start_0
    invoke-direct {p0}, Lcom/mongodb/util/SimplePool;->assertConditions()V

    .line 118
    iget-object v2, p0, Lcom/mongodb/util/SimplePool;->_avail:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    add-int/lit8 v3, v2, -0x1

    invoke-virtual {p0}, Lcom/mongodb/util/SimplePool;->getTotal()I

    move-result v2

    invoke-virtual {p0}, Lcom/mongodb/util/SimplePool;->getMaxSize()I

    move-result v4

    if-ge v2, v4, :cond_1

    const/4 v2, 0x1

    :goto_1
    invoke-virtual {p0, v3, v2}, Lcom/mongodb/util/SimplePool;->pick(IZ)I

    move-result v1

    .line 120
    .local v1, "toTake":I
    if-ltz v1, :cond_2

    .line 121
    iget-object v2, p0, Lcom/mongodb/util/SimplePool;->_avail:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object v0

    .line 125
    .local v0, "t":Ljava/lang/Object;, "TT;"
    :goto_2
    iget-object v2, p0, Lcom/mongodb/util/SimplePool;->_out:Ljava/util/Set;

    invoke-interface {v2, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 127
    monitor-exit p0

    goto :goto_0

    .line 128
    .end local v0    # "t":Ljava/lang/Object;, "TT;"
    .end local v1    # "toTake":I
    :catchall_0
    move-exception v2

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2

    .line 118
    :cond_1
    const/4 v2, 0x0

    goto :goto_1

    .line 123
    .restart local v1    # "toTake":I
    :cond_2
    :try_start_1
    invoke-direct {p0}, Lcom/mongodb/util/SimplePool;->createNewAndReleasePermitIfFailure()Ljava/lang/Object;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v0

    .restart local v0    # "t":Ljava/lang/Object;, "TT;"
    goto :goto_2
.end method

.method public declared-synchronized getAvailable()I
    .locals 1

    .prologue
    .line 180
    .local p0, "this":Lcom/mongodb/util/SimplePool;, "Lcom/mongodb/util/SimplePool<TT;>;"
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/mongodb/util/SimplePool;->_avail:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I
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

.method public declared-synchronized getInUse()I
    .locals 1

    .prologue
    .line 176
    .local p0, "this":Lcom/mongodb/util/SimplePool;, "Lcom/mongodb/util/SimplePool<TT;>;"
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/mongodb/util/SimplePool;->_out:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->size()I
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

.method public getMaxSize()I
    .locals 1

    .prologue
    .line 184
    .local p0, "this":Lcom/mongodb/util/SimplePool;, "Lcom/mongodb/util/SimplePool<TT;>;"
    iget v0, p0, Lcom/mongodb/util/SimplePool;->_size:I

    return v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 168
    .local p0, "this":Lcom/mongodb/util/SimplePool;, "Lcom/mongodb/util/SimplePool<TT;>;"
    iget-object v0, p0, Lcom/mongodb/util/SimplePool;->_name:Ljava/lang/String;

    return-object v0
.end method

.method public declared-synchronized getTotal()I
    .locals 2

    .prologue
    .line 172
    .local p0, "this":Lcom/mongodb/util/SimplePool;, "Lcom/mongodb/util/SimplePool<TT;>;"
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/mongodb/util/SimplePool;->_avail:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    iget-object v1, p0, Lcom/mongodb/util/SimplePool;->_out:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->size()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v1

    add-int/2addr v0, v1

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected pick(IZ)I
    .locals 0
    .param p1, "recommended"    # I
    .param p2, "couldCreate"    # Z

    .prologue
    .line 61
    .local p0, "this":Lcom/mongodb/util/SimplePool;, "Lcom/mongodb/util/SimplePool<TT;>;"
    return p1
.end method

.method public remove(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 93
    .local p0, "this":Lcom/mongodb/util/SimplePool;, "Lcom/mongodb/util/SimplePool<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    invoke-virtual {p0, p1}, Lcom/mongodb/util/SimplePool;->done(Ljava/lang/Object;)V

    .line 94
    return-void
.end method

.method public declared-synchronized toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 188
    .local p0, "this":Lcom/mongodb/util/SimplePool;, "Lcom/mongodb/util/SimplePool<TT;>;"
    monitor-enter p0

    :try_start_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 189
    .local v0, "buf":Ljava/lang/StringBuilder;
    const-string/jumbo v1, "pool: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/mongodb/util/SimplePool;->_name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " maxToKeep: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/mongodb/util/SimplePool;->_size:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " avail "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/mongodb/util/SimplePool;->_avail:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " out "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/mongodb/util/SimplePool;->_out:Ljava/util/Set;

    invoke-interface {v2}, Ljava/util/Set;->size()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 194
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    monitor-exit p0

    return-object v1

    .line 188
    .end local v0    # "buf":Ljava/lang/StringBuilder;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method
