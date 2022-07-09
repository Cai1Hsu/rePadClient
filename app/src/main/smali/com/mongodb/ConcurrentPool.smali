.class Lcom/mongodb/ConcurrentPool;
.super Ljava/lang/Object;
.source "ConcurrentPool.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mongodb/ConcurrentPool$ItemFactory;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private final available:Lcom/mongodb/Deque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/mongodb/Deque",
            "<TT;>;"
        }
    .end annotation
.end field

.field private volatile closed:Z

.field private final itemFactory:Lcom/mongodb/ConcurrentPool$ItemFactory;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/mongodb/ConcurrentPool$ItemFactory",
            "<TT;>;"
        }
    .end annotation
.end field

.field private final maxSize:I

.field private final permits:Ljava/util/concurrent/Semaphore;


# direct methods
.method public constructor <init>(ILcom/mongodb/ConcurrentPool$ItemFactory;)V
    .locals 2
    .param p1, "maxSize"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lcom/mongodb/ConcurrentPool$ItemFactory",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 51
    .local p0, "this":Lcom/mongodb/ConcurrentPool;, "Lcom/mongodb/ConcurrentPool<TT;>;"
    .local p2, "itemFactory":Lcom/mongodb/ConcurrentPool$ItemFactory;, "Lcom/mongodb/ConcurrentPool$ItemFactory<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    new-instance v0, Lcom/mongodb/ConcurrentLinkedDeque;

    invoke-direct {v0}, Lcom/mongodb/ConcurrentLinkedDeque;-><init>()V

    iput-object v0, p0, Lcom/mongodb/ConcurrentPool;->available:Lcom/mongodb/Deque;

    .line 52
    iput p1, p0, Lcom/mongodb/ConcurrentPool;->maxSize:I

    .line 53
    iput-object p2, p0, Lcom/mongodb/ConcurrentPool;->itemFactory:Lcom/mongodb/ConcurrentPool$ItemFactory;

    .line 54
    new-instance v0, Ljava/util/concurrent/Semaphore;

    const/4 v1, 0x1

    invoke-direct {v0, p1, v1}, Ljava/util/concurrent/Semaphore;-><init>(IZ)V

    iput-object v0, p0, Lcom/mongodb/ConcurrentPool;->permits:Ljava/util/concurrent/Semaphore;

    .line 55
    return-void
.end method

.method private close(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 221
    .local p0, "this":Lcom/mongodb/ConcurrentPool;, "Lcom/mongodb/ConcurrentPool<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    :try_start_0
    iget-object v0, p0, Lcom/mongodb/ConcurrentPool;->itemFactory:Lcom/mongodb/ConcurrentPool$ItemFactory;

    invoke-interface {v0, p1}, Lcom/mongodb/ConcurrentPool$ItemFactory;->close(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 225
    :goto_0
    return-void

    .line 222
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method private createNewAndReleasePermitIfFailure()Ljava/lang/Object;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .line 150
    .local p0, "this":Lcom/mongodb/ConcurrentPool;, "Lcom/mongodb/ConcurrentPool<TT;>;"
    :try_start_0
    iget-object v2, p0, Lcom/mongodb/ConcurrentPool;->itemFactory:Lcom/mongodb/ConcurrentPool$ItemFactory;

    invoke-interface {v2}, Lcom/mongodb/ConcurrentPool$ItemFactory;->create()Ljava/lang/Object;

    move-result-object v1

    .line 151
    .local v1, "newMember":Ljava/lang/Object;, "TT;"
    if-nez v1, :cond_0

    .line 152
    new-instance v2, Lcom/mongodb/MongoInternalException;

    const-string/jumbo v3, "The factory for the pool created a null item"

    invoke-direct {v2, v3}, Lcom/mongodb/MongoInternalException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 155
    .end local v1    # "newMember":Ljava/lang/Object;, "TT;"
    :catch_0
    move-exception v0

    .line 156
    .local v0, "e":Ljava/lang/RuntimeException;
    iget-object v2, p0, Lcom/mongodb/ConcurrentPool;->permits:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v2}, Ljava/util/concurrent/Semaphore;->release()V

    .line 157
    throw v0

    .line 154
    .end local v0    # "e":Ljava/lang/RuntimeException;
    .restart local v1    # "newMember":Ljava/lang/Object;, "TT;"
    :cond_0
    return-object v1
.end method


# virtual methods
.method protected acquirePermit(JLjava/util/concurrent/TimeUnit;)Z
    .locals 5
    .param p1, "timeout"    # J
    .param p3, "timeUnit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 163
    .local p0, "this":Lcom/mongodb/ConcurrentPool;, "Lcom/mongodb/ConcurrentPool<TT;>;"
    :try_start_0
    iget-boolean v1, p0, Lcom/mongodb/ConcurrentPool;->closed:Z

    if-eqz v1, :cond_0

    .line 164
    const/4 v1, 0x0

    .line 169
    :goto_0
    return v1

    .line 165
    :cond_0
    const-wide/16 v2, 0x0

    cmp-long v1, p1, v2

    if-ltz v1, :cond_1

    .line 166
    iget-object v1, p0, Lcom/mongodb/ConcurrentPool;->permits:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v1, p1, p2, p3}, Ljava/util/concurrent/Semaphore;->tryAcquire(JLjava/util/concurrent/TimeUnit;)Z

    move-result v1

    goto :goto_0

    .line 168
    :cond_1
    iget-object v1, p0, Lcom/mongodb/ConcurrentPool;->permits:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v1}, Ljava/util/concurrent/Semaphore;->acquire()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 169
    const/4 v1, 0x1

    goto :goto_0

    .line 171
    :catch_0
    move-exception v0

    .line 172
    .local v0, "e":Ljava/lang/InterruptedException;
    new-instance v1, Lcom/mongodb/MongoInterruptedException;

    const-string/jumbo v2, "Interrupted acquiring a permit to retrieve an item from the pool "

    invoke-direct {v1, v2, v0}, Lcom/mongodb/MongoInterruptedException;-><init>(Ljava/lang/String;Ljava/lang/InterruptedException;)V

    throw v1
.end method

.method public close()V
    .locals 3

    .prologue
    .line 184
    .local p0, "this":Lcom/mongodb/ConcurrentPool;, "Lcom/mongodb/ConcurrentPool<TT;>;"
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/mongodb/ConcurrentPool;->closed:Z

    .line 185
    iget-object v2, p0, Lcom/mongodb/ConcurrentPool;->available:Lcom/mongodb/Deque;

    invoke-interface {v2}, Lcom/mongodb/Deque;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 186
    .local v0, "iter":Ljava/util/Iterator;, "Ljava/util/Iterator<TT;>;"
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 187
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 188
    .local v1, "t":Ljava/lang/Object;, "TT;"
    invoke-direct {p0, v1}, Lcom/mongodb/ConcurrentPool;->close(Ljava/lang/Object;)V

    .line 189
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    goto :goto_0

    .line 191
    .end local v1    # "t":Ljava/lang/Object;, "TT;"
    :cond_0
    return-void
.end method

.method public ensureMinSize(I)V
    .locals 3
    .param p1, "minSize"    # I

    .prologue
    .line 140
    .local p0, "this":Lcom/mongodb/ConcurrentPool;, "Lcom/mongodb/ConcurrentPool<TT;>;"
    :goto_0
    invoke-virtual {p0}, Lcom/mongodb/ConcurrentPool;->getCount()I

    move-result v0

    if-ge v0, p1, :cond_0

    .line 141
    const-wide/16 v0, 0xa

    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p0, v0, v1, v2}, Lcom/mongodb/ConcurrentPool;->acquirePermit(JLjava/util/concurrent/TimeUnit;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 146
    :cond_0
    return-void

    .line 144
    :cond_1
    invoke-direct {p0}, Lcom/mongodb/ConcurrentPool;->createNewAndReleasePermitIfFailure()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/mongodb/ConcurrentPool;->release(Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public get()Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .line 96
    .local p0, "this":Lcom/mongodb/ConcurrentPool;, "Lcom/mongodb/ConcurrentPool<TT;>;"
    const-wide/16 v0, -0x1

    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p0, v0, v1, v2}, Lcom/mongodb/ConcurrentPool;->get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;
    .locals 7
    .param p1, "timeout"    # J
    .param p3, "timeUnit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 108
    .local p0, "this":Lcom/mongodb/ConcurrentPool;, "Lcom/mongodb/ConcurrentPool<TT;>;"
    iget-boolean v1, p0, Lcom/mongodb/ConcurrentPool;->closed:Z

    if-eqz v1, :cond_0

    .line 109
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string/jumbo v2, "The pool is closed"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 112
    :cond_0
    invoke-virtual {p0, p1, p2, p3}, Lcom/mongodb/ConcurrentPool;->acquirePermit(JLjava/util/concurrent/TimeUnit;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 113
    new-instance v1, Lcom/mongodb/MongoTimeoutException;

    const-string/jumbo v2, "Timeout waiting for a pooled item after %d %s"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x1

    aput-object p3, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/mongodb/MongoTimeoutException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 116
    :cond_1
    iget-object v1, p0, Lcom/mongodb/ConcurrentPool;->available:Lcom/mongodb/Deque;

    invoke-interface {v1}, Lcom/mongodb/Deque;->pollLast()Ljava/lang/Object;

    move-result-object v0

    .line 117
    .local v0, "t":Ljava/lang/Object;, "TT;"
    if-nez v0, :cond_2

    .line 118
    invoke-direct {p0}, Lcom/mongodb/ConcurrentPool;->createNewAndReleasePermitIfFailure()Ljava/lang/Object;

    move-result-object v0

    .line 121
    :cond_2
    return-object v0
.end method

.method public getAvailableCount()I
    .locals 1

    .prologue
    .line 202
    .local p0, "this":Lcom/mongodb/ConcurrentPool;, "Lcom/mongodb/ConcurrentPool<TT;>;"
    iget-object v0, p0, Lcom/mongodb/ConcurrentPool;->available:Lcom/mongodb/Deque;

    invoke-interface {v0}, Lcom/mongodb/Deque;->size()I

    move-result v0

    return v0
.end method

.method public getCount()I
    .locals 2

    .prologue
    .line 206
    .local p0, "this":Lcom/mongodb/ConcurrentPool;, "Lcom/mongodb/ConcurrentPool<TT;>;"
    invoke-virtual {p0}, Lcom/mongodb/ConcurrentPool;->getInUseCount()I

    move-result v0

    invoke-virtual {p0}, Lcom/mongodb/ConcurrentPool;->getAvailableCount()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public getInUseCount()I
    .locals 2

    .prologue
    .line 198
    .local p0, "this":Lcom/mongodb/ConcurrentPool;, "Lcom/mongodb/ConcurrentPool<TT;>;"
    iget v0, p0, Lcom/mongodb/ConcurrentPool;->maxSize:I

    iget-object v1, p0, Lcom/mongodb/ConcurrentPool;->permits:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v1}, Ljava/util/concurrent/Semaphore;->availablePermits()I

    move-result v1

    sub-int/2addr v0, v1

    return v0
.end method

.method public getMaxSize()I
    .locals 1

    .prologue
    .line 194
    .local p0, "this":Lcom/mongodb/ConcurrentPool;, "Lcom/mongodb/ConcurrentPool<TT;>;"
    iget v0, p0, Lcom/mongodb/ConcurrentPool;->maxSize:I

    return v0
.end method

.method public prune()V
    .locals 6

    .prologue
    .line 125
    .local p0, "this":Lcom/mongodb/ConcurrentPool;, "Lcom/mongodb/ConcurrentPool<TT;>;"
    invoke-virtual {p0}, Lcom/mongodb/ConcurrentPool;->getAvailableCount()I

    move-result v1

    .line 126
    .local v1, "currentAvailableCount":I
    const/4 v2, 0x0

    .local v2, "numAttempts":I
    :goto_0
    if-ge v2, v1, :cond_0

    .line 127
    const-wide/16 v4, 0xa

    sget-object v3, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p0, v4, v5, v3}, Lcom/mongodb/ConcurrentPool;->acquirePermit(JLjava/util/concurrent/TimeUnit;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 137
    :cond_0
    :goto_1
    return-void

    .line 130
    :cond_1
    iget-object v3, p0, Lcom/mongodb/ConcurrentPool;->available:Lcom/mongodb/Deque;

    invoke-interface {v3}, Lcom/mongodb/Deque;->pollFirst()Ljava/lang/Object;

    move-result-object v0

    .line 131
    .local v0, "cur":Ljava/lang/Object;, "TT;"
    if-nez v0, :cond_2

    .line 132
    invoke-virtual {p0}, Lcom/mongodb/ConcurrentPool;->releasePermit()V

    goto :goto_1

    .line 135
    :cond_2
    iget-object v3, p0, Lcom/mongodb/ConcurrentPool;->itemFactory:Lcom/mongodb/ConcurrentPool$ItemFactory;

    invoke-interface {v3, v0}, Lcom/mongodb/ConcurrentPool$ItemFactory;->shouldPrune(Ljava/lang/Object;)Z

    move-result v3

    invoke-virtual {p0, v0, v3}, Lcom/mongodb/ConcurrentPool;->release(Ljava/lang/Object;Z)V

    .line 126
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method public release(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 63
    .local p0, "this":Lcom/mongodb/ConcurrentPool;, "Lcom/mongodb/ConcurrentPool<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/mongodb/ConcurrentPool;->release(Ljava/lang/Object;Z)V

    .line 64
    return-void
.end method

.method public release(Ljava/lang/Object;Z)V
    .locals 2
    .param p2, "prune"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;Z)V"
        }
    .end annotation

    .prologue
    .line 73
    .local p0, "this":Lcom/mongodb/ConcurrentPool;, "Lcom/mongodb/ConcurrentPool<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    if-nez p1, :cond_0

    .line 74
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Can not return a null item to the pool"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 76
    :cond_0
    iget-boolean v0, p0, Lcom/mongodb/ConcurrentPool;->closed:Z

    if-eqz v0, :cond_1

    .line 77
    invoke-direct {p0, p1}, Lcom/mongodb/ConcurrentPool;->close(Ljava/lang/Object;)V

    .line 88
    :goto_0
    return-void

    .line 81
    :cond_1
    if-eqz p2, :cond_2

    .line 82
    invoke-direct {p0, p1}, Lcom/mongodb/ConcurrentPool;->close(Ljava/lang/Object;)V

    .line 87
    :goto_1
    invoke-virtual {p0}, Lcom/mongodb/ConcurrentPool;->releasePermit()V

    goto :goto_0

    .line 84
    :cond_2
    iget-object v0, p0, Lcom/mongodb/ConcurrentPool;->available:Lcom/mongodb/Deque;

    invoke-interface {v0, p1}, Lcom/mongodb/Deque;->addLast(Ljava/lang/Object;)V

    goto :goto_1
.end method

.method protected releasePermit()V
    .locals 1

    .prologue
    .line 177
    .local p0, "this":Lcom/mongodb/ConcurrentPool;, "Lcom/mongodb/ConcurrentPool<TT;>;"
    iget-object v0, p0, Lcom/mongodb/ConcurrentPool;->permits:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v0}, Ljava/util/concurrent/Semaphore;->release()V

    .line 178
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 210
    .local p0, "this":Lcom/mongodb/ConcurrentPool;, "Lcom/mongodb/ConcurrentPool<TT;>;"
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 211
    .local v0, "buf":Ljava/lang/StringBuilder;
    const-string/jumbo v1, "pool: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " maxSize: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/mongodb/ConcurrentPool;->maxSize:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " availableCount "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/mongodb/ConcurrentPool;->getAvailableCount()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " inUseCount "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/mongodb/ConcurrentPool;->getInUseCount()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 215
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
