.class public Lorg/jivesoftware/smack/util/Cache;
.super Ljava/lang/Object;
.source "Cache.java"

# interfaces
.implements Ljava/util/Map;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jivesoftware/smack/util/Cache$LinkedListNode;,
        Lorg/jivesoftware/smack/util/Cache$LinkedList;,
        Lorg/jivesoftware/smack/util/Cache$CacheObject;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/util/Map",
        "<TK;TV;>;"
    }
.end annotation


# instance fields
.field protected ageList:Lorg/jivesoftware/smack/util/Cache$LinkedList;

.field protected cacheHits:J

.field protected cacheMisses:J

.field protected lastAccessedList:Lorg/jivesoftware/smack/util/Cache$LinkedList;

.field protected map:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<TK;",
            "Lorg/jivesoftware/smack/util/Cache$CacheObject",
            "<TV;>;>;"
        }
    .end annotation
.end field

.field protected maxCacheSize:I

.field protected maxLifetime:J


# direct methods
.method public constructor <init>(IJ)V
    .locals 2
    .param p1, "maxSize"    # I
    .param p2, "maxLifetime"    # J

    .prologue
    .line 99
    .local p0, "this":Lorg/jivesoftware/smack/util/Cache;, "Lorg/jivesoftware/smack/util/Cache<TK;TV;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 88
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lorg/jivesoftware/smack/util/Cache;->cacheMisses:J

    .line 100
    if-nez p1, :cond_0

    .line 101
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Max cache size cannot be 0."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 103
    :cond_0
    iput p1, p0, Lorg/jivesoftware/smack/util/Cache;->maxCacheSize:I

    .line 104
    iput-wide p2, p0, Lorg/jivesoftware/smack/util/Cache;->maxLifetime:J

    .line 108
    new-instance v0, Ljava/util/HashMap;

    const/16 v1, 0x67

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    iput-object v0, p0, Lorg/jivesoftware/smack/util/Cache;->map:Ljava/util/Map;

    .line 110
    new-instance v0, Lorg/jivesoftware/smack/util/Cache$LinkedList;

    invoke-direct {v0}, Lorg/jivesoftware/smack/util/Cache$LinkedList;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smack/util/Cache;->lastAccessedList:Lorg/jivesoftware/smack/util/Cache$LinkedList;

    .line 111
    new-instance v0, Lorg/jivesoftware/smack/util/Cache$LinkedList;

    invoke-direct {v0}, Lorg/jivesoftware/smack/util/Cache$LinkedList;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smack/util/Cache;->ageList:Lorg/jivesoftware/smack/util/Cache$LinkedList;

    .line 112
    return-void
.end method


# virtual methods
.method public declared-synchronized clear()V
    .locals 8

    .prologue
    .line 188
    .local p0, "this":Lorg/jivesoftware/smack/util/Cache;, "Lorg/jivesoftware/smack/util/Cache<TK;TV;>;"
    monitor-enter p0

    :try_start_0
    iget-object v5, p0, Lorg/jivesoftware/smack/util/Cache;->map:Ljava/util/Map;

    invoke-interface {v5}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->toArray()[Ljava/lang/Object;

    move-result-object v3

    .line 189
    .local v3, "keys":[Ljava/lang/Object;
    move-object v0, v3

    .local v0, "arr$":[Ljava/lang/Object;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_0
    if-ge v1, v4, :cond_0

    aget-object v2, v0, v1

    .line 190
    .local v2, "key":Ljava/lang/Object;
    invoke-virtual {p0, v2}, Lorg/jivesoftware/smack/util/Cache;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 189
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 194
    .end local v2    # "key":Ljava/lang/Object;
    :cond_0
    iget-object v5, p0, Lorg/jivesoftware/smack/util/Cache;->map:Ljava/util/Map;

    invoke-interface {v5}, Ljava/util/Map;->clear()V

    .line 195
    iget-object v5, p0, Lorg/jivesoftware/smack/util/Cache;->lastAccessedList:Lorg/jivesoftware/smack/util/Cache$LinkedList;

    invoke-virtual {v5}, Lorg/jivesoftware/smack/util/Cache$LinkedList;->clear()V

    .line 196
    iget-object v5, p0, Lorg/jivesoftware/smack/util/Cache;->ageList:Lorg/jivesoftware/smack/util/Cache$LinkedList;

    invoke-virtual {v5}, Lorg/jivesoftware/smack/util/Cache$LinkedList;->clear()V

    .line 198
    const-wide/16 v6, 0x0

    iput-wide v6, p0, Lorg/jivesoftware/smack/util/Cache;->cacheHits:J

    .line 199
    const-wide/16 v6, 0x0

    iput-wide v6, p0, Lorg/jivesoftware/smack/util/Cache;->cacheMisses:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 200
    monitor-exit p0

    return-void

    .line 188
    .end local v0    # "arr$":[Ljava/lang/Object;
    .end local v1    # "i$":I
    .end local v3    # "keys":[Ljava/lang/Object;
    .end local v4    # "len$":I
    :catchall_0
    move-exception v5

    monitor-exit p0

    throw v5
.end method

.method public declared-synchronized containsKey(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "key"    # Ljava/lang/Object;

    .prologue
    .line 252
    .local p0, "this":Lorg/jivesoftware/smack/util/Cache;, "Lorg/jivesoftware/smack/util/Cache<TK;TV;>;"
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/jivesoftware/smack/util/Cache;->deleteExpiredEntries()V

    .line 254
    iget-object v0, p0, Lorg/jivesoftware/smack/util/Cache;->map:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    .line 252
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized containsValue(Ljava/lang/Object;)Z
    .locals 2
    .param p1, "value"    # Ljava/lang/Object;

    .prologue
    .line 274
    .local p0, "this":Lorg/jivesoftware/smack/util/Cache;, "Lorg/jivesoftware/smack/util/Cache<TK;TV;>;"
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/jivesoftware/smack/util/Cache;->deleteExpiredEntries()V

    .line 277
    new-instance v0, Lorg/jivesoftware/smack/util/Cache$CacheObject;

    invoke-direct {v0, p1}, Lorg/jivesoftware/smack/util/Cache$CacheObject;-><init>(Ljava/lang/Object;)V

    .line 279
    .local v0, "cacheObject":Lorg/jivesoftware/smack/util/Cache$CacheObject;, "Lorg/jivesoftware/smack/util/Cache$CacheObject<TV;>;"
    iget-object v1, p0, Lorg/jivesoftware/smack/util/Cache;->map:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->containsValue(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v1

    monitor-exit p0

    return v1

    .line 274
    .end local v0    # "cacheObject":Lorg/jivesoftware/smack/util/Cache$CacheObject;, "Lorg/jivesoftware/smack/util/Cache$CacheObject<TV;>;"
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method protected declared-synchronized cullCache()V
    .locals 6

    .prologue
    .line 406
    .local p0, "this":Lorg/jivesoftware/smack/util/Cache;, "Lorg/jivesoftware/smack/util/Cache<TK;TV;>;"
    monitor-enter p0

    :try_start_0
    iget v2, p0, Lorg/jivesoftware/smack/util/Cache;->maxCacheSize:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-gez v2, :cond_1

    .line 427
    :cond_0
    monitor-exit p0

    return-void

    .line 411
    :cond_1
    :try_start_1
    iget-object v2, p0, Lorg/jivesoftware/smack/util/Cache;->map:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->size()I

    move-result v2

    iget v3, p0, Lorg/jivesoftware/smack/util/Cache;->maxCacheSize:I

    if-le v2, v3, :cond_0

    .line 413
    invoke-virtual {p0}, Lorg/jivesoftware/smack/util/Cache;->deleteExpiredEntries()V

    .line 416
    iget v2, p0, Lorg/jivesoftware/smack/util/Cache;->maxCacheSize:I

    int-to-double v2, v2

    const-wide v4, 0x3feccccccccccccdL    # 0.9

    mul-double/2addr v2, v4

    double-to-int v0, v2

    .line 417
    .local v0, "desiredSize":I
    iget-object v2, p0, Lorg/jivesoftware/smack/util/Cache;->map:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->size()I

    move-result v1

    .local v1, "i":I
    :goto_0
    if-le v1, v0, :cond_0

    .line 419
    iget-object v2, p0, Lorg/jivesoftware/smack/util/Cache;->lastAccessedList:Lorg/jivesoftware/smack/util/Cache$LinkedList;

    invoke-virtual {v2}, Lorg/jivesoftware/smack/util/Cache$LinkedList;->getLast()Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    move-result-object v2

    iget-object v2, v2, Lorg/jivesoftware/smack/util/Cache$LinkedListNode;->object:Ljava/lang/Object;

    const/4 v3, 0x1

    invoke-virtual {p0, v2, v3}, Lorg/jivesoftware/smack/util/Cache;->remove(Ljava/lang/Object;Z)Ljava/lang/Object;

    move-result-object v2

    if-nez v2, :cond_2

    .line 420
    sget-object v2, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "Error attempting to cullCache with remove("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lorg/jivesoftware/smack/util/Cache;->lastAccessedList:Lorg/jivesoftware/smack/util/Cache$LinkedList;

    invoke-virtual {v4}, Lorg/jivesoftware/smack/util/Cache$LinkedList;->getLast()Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    move-result-object v4

    iget-object v4, v4, Lorg/jivesoftware/smack/util/Cache$LinkedListNode;->object:Ljava/lang/Object;

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, ") - "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "cacheObject not found in cache!"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 423
    iget-object v2, p0, Lorg/jivesoftware/smack/util/Cache;->lastAccessedList:Lorg/jivesoftware/smack/util/Cache$LinkedList;

    invoke-virtual {v2}, Lorg/jivesoftware/smack/util/Cache$LinkedList;->getLast()Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    move-result-object v2

    invoke-virtual {v2}, Lorg/jivesoftware/smack/util/Cache$LinkedListNode;->remove()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 417
    :cond_2
    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    .line 406
    .end local v0    # "desiredSize":I
    .end local v1    # "i":I
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method protected declared-synchronized deleteExpiredEntries()V
    .locals 8

    .prologue
    .line 364
    .local p0, "this":Lorg/jivesoftware/smack/util/Cache;, "Lorg/jivesoftware/smack/util/Cache<TK;TV;>;"
    monitor-enter p0

    :try_start_0
    iget-wide v4, p0, Lorg/jivesoftware/smack/util/Cache;->maxLifetime:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const-wide/16 v6, 0x0

    cmp-long v3, v4, v6

    if-gtz v3, :cond_1

    .line 398
    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    .line 372
    :cond_1
    :try_start_1
    iget-object v3, p0, Lorg/jivesoftware/smack/util/Cache;->ageList:Lorg/jivesoftware/smack/util/Cache$LinkedList;

    invoke-virtual {v3}, Lorg/jivesoftware/smack/util/Cache$LinkedList;->getLast()Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    move-result-object v2

    .line 374
    .local v2, "node":Lorg/jivesoftware/smack/util/Cache$LinkedListNode;
    if-eqz v2, :cond_0

    .line 381
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    iget-wide v6, p0, Lorg/jivesoftware/smack/util/Cache;->maxLifetime:J

    sub-long v0, v4, v6

    .line 383
    .local v0, "expireTime":J
    :cond_2
    iget-wide v4, v2, Lorg/jivesoftware/smack/util/Cache$LinkedListNode;->timestamp:J

    cmp-long v3, v0, v4

    if-lez v3, :cond_0

    .line 384
    iget-object v3, v2, Lorg/jivesoftware/smack/util/Cache$LinkedListNode;->object:Ljava/lang/Object;

    const/4 v4, 0x1

    invoke-virtual {p0, v3, v4}, Lorg/jivesoftware/smack/util/Cache;->remove(Ljava/lang/Object;Z)Ljava/lang/Object;

    move-result-object v3

    if-nez v3, :cond_3

    .line 385
    sget-object v3, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "Error attempting to remove("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, v2, Lorg/jivesoftware/smack/util/Cache$LinkedListNode;->object:Ljava/lang/Object;

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, ") - cacheObject not found in cache!"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 388
    invoke-virtual {v2}, Lorg/jivesoftware/smack/util/Cache$LinkedListNode;->remove()V

    .line 392
    :cond_3
    iget-object v3, p0, Lorg/jivesoftware/smack/util/Cache;->ageList:Lorg/jivesoftware/smack/util/Cache$LinkedList;

    invoke-virtual {v3}, Lorg/jivesoftware/smack/util/Cache$LinkedList;->getLast()Lorg/jivesoftware/smack/util/Cache$LinkedListNode;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v2

    .line 394
    if-nez v2, :cond_2

    goto :goto_0

    .line 364
    .end local v0    # "expireTime":J
    .end local v2    # "node":Lorg/jivesoftware/smack/util/Cache$LinkedListNode;
    :catchall_0
    move-exception v3

    monitor-exit p0

    throw v3
.end method

.method public declared-synchronized entrySet()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/util/Map$Entry",
            "<TK;TV;>;>;"
        }
    .end annotation

    .prologue
    .line 288
    .local p0, "this":Lorg/jivesoftware/smack/util/Cache;, "Lorg/jivesoftware/smack/util/Cache<TK;TV;>;"
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/jivesoftware/smack/util/Cache;->deleteExpiredEntries()V

    .line 290
    new-instance v0, Lorg/jivesoftware/smack/util/Cache$2;

    invoke-direct {v0, p0}, Lorg/jivesoftware/smack/util/Cache$2;-><init>(Lorg/jivesoftware/smack/util/Cache;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    .line 288
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized get(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 6
    .param p1, "key"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")TV;"
        }
    .end annotation

    .prologue
    .local p0, "this":Lorg/jivesoftware/smack/util/Cache;, "Lorg/jivesoftware/smack/util/Cache<TK;TV;>;"
    const-wide/16 v4, 0x1

    .line 141
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/jivesoftware/smack/util/Cache;->deleteExpiredEntries()V

    .line 143
    iget-object v1, p0, Lorg/jivesoftware/smack/util/Cache;->map:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smack/util/Cache$CacheObject;

    .line 144
    .local v0, "cacheObject":Lorg/jivesoftware/smack/util/Cache$CacheObject;, "Lorg/jivesoftware/smack/util/Cache$CacheObject<TV;>;"
    if-nez v0, :cond_0

    .line 146
    iget-wide v2, p0, Lorg/jivesoftware/smack/util/Cache;->cacheMisses:J

    add-long/2addr v2, v4

    iput-wide v2, p0, Lorg/jivesoftware/smack/util/Cache;->cacheMisses:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 147
    const/4 v1, 0x0

    .line 159
    :goto_0
    monitor-exit p0

    return-object v1

    .line 151
    :cond_0
    :try_start_1
    iget-object v1, v0, Lorg/jivesoftware/smack/util/Cache$CacheObject;->lastAccessedListNode:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    invoke-virtual {v1}, Lorg/jivesoftware/smack/util/Cache$LinkedListNode;->remove()V

    .line 152
    iget-object v1, p0, Lorg/jivesoftware/smack/util/Cache;->lastAccessedList:Lorg/jivesoftware/smack/util/Cache$LinkedList;

    iget-object v2, v0, Lorg/jivesoftware/smack/util/Cache$CacheObject;->lastAccessedListNode:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    invoke-virtual {v1, v2}, Lorg/jivesoftware/smack/util/Cache$LinkedList;->addFirst(Lorg/jivesoftware/smack/util/Cache$LinkedListNode;)Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    .line 156
    iget-wide v2, p0, Lorg/jivesoftware/smack/util/Cache;->cacheHits:J

    add-long/2addr v2, v4

    iput-wide v2, p0, Lorg/jivesoftware/smack/util/Cache;->cacheHits:J

    .line 157
    iget v1, v0, Lorg/jivesoftware/smack/util/Cache$CacheObject;->readCount:I

    add-int/lit8 v1, v1, 0x1

    iput v1, v0, Lorg/jivesoftware/smack/util/Cache$CacheObject;->readCount:I

    .line 159
    iget-object v1, v0, Lorg/jivesoftware/smack/util/Cache$CacheObject;->object:Ljava/lang/Object;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 141
    .end local v0    # "cacheObject":Lorg/jivesoftware/smack/util/Cache$CacheObject;, "Lorg/jivesoftware/smack/util/Cache$CacheObject<TV;>;"
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public getCacheHits()J
    .locals 2

    .prologue
    .line 332
    .local p0, "this":Lorg/jivesoftware/smack/util/Cache;, "Lorg/jivesoftware/smack/util/Cache<TK;TV;>;"
    iget-wide v0, p0, Lorg/jivesoftware/smack/util/Cache;->cacheHits:J

    return-wide v0
.end method

.method public getCacheMisses()J
    .locals 2

    .prologue
    .line 336
    .local p0, "this":Lorg/jivesoftware/smack/util/Cache;, "Lorg/jivesoftware/smack/util/Cache<TK;TV;>;"
    iget-wide v0, p0, Lorg/jivesoftware/smack/util/Cache;->cacheMisses:J

    return-wide v0
.end method

.method public getMaxCacheSize()I
    .locals 1

    .prologue
    .line 340
    .local p0, "this":Lorg/jivesoftware/smack/util/Cache;, "Lorg/jivesoftware/smack/util/Cache<TK;TV;>;"
    iget v0, p0, Lorg/jivesoftware/smack/util/Cache;->maxCacheSize:I

    return v0
.end method

.method public getMaxLifetime()J
    .locals 2

    .prologue
    .line 351
    .local p0, "this":Lorg/jivesoftware/smack/util/Cache;, "Lorg/jivesoftware/smack/util/Cache<TK;TV;>;"
    iget-wide v0, p0, Lorg/jivesoftware/smack/util/Cache;->maxLifetime:J

    return-wide v0
.end method

.method public declared-synchronized isEmpty()Z
    .locals 1

    .prologue
    .line 213
    .local p0, "this":Lorg/jivesoftware/smack/util/Cache;, "Lorg/jivesoftware/smack/util/Cache<TK;TV;>;"
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/jivesoftware/smack/util/Cache;->deleteExpiredEntries()V

    .line 215
    iget-object v0, p0, Lorg/jivesoftware/smack/util/Cache;->map:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    .line 213
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized keySet()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<TK;>;"
        }
    .end annotation

    .prologue
    .line 326
    .local p0, "this":Lorg/jivesoftware/smack/util/Cache;, "Lorg/jivesoftware/smack/util/Cache<TK;TV;>;"
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/jivesoftware/smack/util/Cache;->deleteExpiredEntries()V

    .line 328
    iget-object v0, p0, Lorg/jivesoftware/smack/util/Cache;->map:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    monitor-exit p0

    return-object v0

    .line 326
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;)TV;"
        }
    .end annotation

    .prologue
    .line 115
    .local p0, "this":Lorg/jivesoftware/smack/util/Cache;, "Lorg/jivesoftware/smack/util/Cache<TK;TV;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    .local p2, "value":Ljava/lang/Object;, "TV;"
    monitor-enter p0

    const/4 v2, 0x0

    .line 117
    .local v2, "oldValue":Ljava/lang/Object;, "TV;"
    :try_start_0
    iget-object v3, p0, Lorg/jivesoftware/smack/util/Cache;->map:Ljava/util/Map;

    invoke-interface {v3, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 118
    const/4 v3, 0x1

    invoke-virtual {p0, p1, v3}, Lorg/jivesoftware/smack/util/Cache;->remove(Ljava/lang/Object;Z)Ljava/lang/Object;

    move-result-object v2

    .line 121
    .end local v2    # "oldValue":Ljava/lang/Object;, "TV;"
    :cond_0
    new-instance v1, Lorg/jivesoftware/smack/util/Cache$CacheObject;

    invoke-direct {v1, p2}, Lorg/jivesoftware/smack/util/Cache$CacheObject;-><init>(Ljava/lang/Object;)V

    .line 122
    .local v1, "cacheObject":Lorg/jivesoftware/smack/util/Cache$CacheObject;, "Lorg/jivesoftware/smack/util/Cache$CacheObject<TV;>;"
    iget-object v3, p0, Lorg/jivesoftware/smack/util/Cache;->map:Ljava/util/Map;

    invoke-interface {v3, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 126
    iget-object v3, p0, Lorg/jivesoftware/smack/util/Cache;->lastAccessedList:Lorg/jivesoftware/smack/util/Cache$LinkedList;

    invoke-virtual {v3, p1}, Lorg/jivesoftware/smack/util/Cache$LinkedList;->addFirst(Ljava/lang/Object;)Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    move-result-object v3

    iput-object v3, v1, Lorg/jivesoftware/smack/util/Cache$CacheObject;->lastAccessedListNode:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    .line 128
    iget-object v3, p0, Lorg/jivesoftware/smack/util/Cache;->ageList:Lorg/jivesoftware/smack/util/Cache$LinkedList;

    invoke-virtual {v3, p1}, Lorg/jivesoftware/smack/util/Cache$LinkedList;->addFirst(Ljava/lang/Object;)Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    move-result-object v0

    .line 129
    .local v0, "ageNode":Lorg/jivesoftware/smack/util/Cache$LinkedListNode;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    iput-wide v4, v0, Lorg/jivesoftware/smack/util/Cache$LinkedListNode;->timestamp:J

    .line 130
    iput-object v0, v1, Lorg/jivesoftware/smack/util/Cache$CacheObject;->ageListNode:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    .line 133
    invoke-virtual {p0}, Lorg/jivesoftware/smack/util/Cache;->cullCache()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 135
    monitor-exit p0

    return-object v2

    .line 115
    .end local v0    # "ageNode":Lorg/jivesoftware/smack/util/Cache$LinkedListNode;
    .end local v1    # "cacheObject":Lorg/jivesoftware/smack/util/Cache$CacheObject;, "Lorg/jivesoftware/smack/util/Cache$CacheObject<TV;>;"
    :catchall_0
    move-exception v3

    monitor-exit p0

    throw v3
.end method

.method public putAll(Ljava/util/Map;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<+TK;+TV;>;)V"
        }
    .end annotation

    .prologue
    .line 258
    .local p0, "this":Lorg/jivesoftware/smack/util/Cache;, "Lorg/jivesoftware/smack/util/Cache<TK;TV;>;"
    .local p1, "map":Ljava/util/Map;, "Ljava/util/Map<+TK;+TV;>;"
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 259
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<+TK;+TV;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    .line 263
    .local v2, "value":Ljava/lang/Object;, "TV;"
    instance-of v3, v2, Lorg/jivesoftware/smack/util/Cache$CacheObject;

    if-eqz v3, :cond_0

    .line 265
    check-cast v2, Lorg/jivesoftware/smack/util/Cache$CacheObject;

    .end local v2    # "value":Ljava/lang/Object;, "TV;"
    iget-object v2, v2, Lorg/jivesoftware/smack/util/Cache$CacheObject;->object:Ljava/lang/Object;

    .line 267
    .restart local v2    # "value":Ljava/lang/Object;, "TV;"
    :cond_0
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {p0, v3, v2}, Lorg/jivesoftware/smack/util/Cache;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 269
    .end local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<+TK;+TV;>;"
    .end local v2    # "value":Ljava/lang/Object;, "TV;"
    :cond_1
    return-void
.end method

.method public declared-synchronized remove(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "key"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")TV;"
        }
    .end annotation

    .prologue
    .line 163
    .local p0, "this":Lorg/jivesoftware/smack/util/Cache;, "Lorg/jivesoftware/smack/util/Cache<TK;TV;>;"
    monitor-enter p0

    const/4 v0, 0x0

    :try_start_0
    invoke-virtual {p0, p1, v0}, Lorg/jivesoftware/smack/util/Cache;->remove(Ljava/lang/Object;Z)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized remove(Ljava/lang/Object;Z)Ljava/lang/Object;
    .locals 3
    .param p1, "key"    # Ljava/lang/Object;
    .param p2, "internal"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Z)TV;"
        }
    .end annotation

    .prologue
    .local p0, "this":Lorg/jivesoftware/smack/util/Cache;, "Lorg/jivesoftware/smack/util/Cache<TK;TV;>;"
    const/4 v1, 0x0

    .line 172
    monitor-enter p0

    :try_start_0
    iget-object v2, p0, Lorg/jivesoftware/smack/util/Cache;->map:Ljava/util/Map;

    invoke-interface {v2, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smack/util/Cache$CacheObject;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 174
    .local v0, "cacheObject":Lorg/jivesoftware/smack/util/Cache$CacheObject;, "Lorg/jivesoftware/smack/util/Cache$CacheObject<TV;>;"
    if-nez v0, :cond_0

    .line 184
    :goto_0
    monitor-exit p0

    return-object v1

    .line 178
    :cond_0
    :try_start_1
    iget-object v1, v0, Lorg/jivesoftware/smack/util/Cache$CacheObject;->lastAccessedListNode:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    invoke-virtual {v1}, Lorg/jivesoftware/smack/util/Cache$LinkedListNode;->remove()V

    .line 179
    iget-object v1, v0, Lorg/jivesoftware/smack/util/Cache$CacheObject;->ageListNode:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    invoke-virtual {v1}, Lorg/jivesoftware/smack/util/Cache$LinkedListNode;->remove()V

    .line 181
    const/4 v1, 0x0

    iput-object v1, v0, Lorg/jivesoftware/smack/util/Cache$CacheObject;->ageListNode:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    .line 182
    const/4 v1, 0x0

    iput-object v1, v0, Lorg/jivesoftware/smack/util/Cache$CacheObject;->lastAccessedListNode:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    .line 184
    iget-object v1, v0, Lorg/jivesoftware/smack/util/Cache$CacheObject;->object:Ljava/lang/Object;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 172
    .end local v0    # "cacheObject":Lorg/jivesoftware/smack/util/Cache$CacheObject;, "Lorg/jivesoftware/smack/util/Cache$CacheObject<TV;>;"
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized setMaxCacheSize(I)V
    .locals 1
    .param p1, "maxCacheSize"    # I

    .prologue
    .line 344
    .local p0, "this":Lorg/jivesoftware/smack/util/Cache;, "Lorg/jivesoftware/smack/util/Cache<TK;TV;>;"
    monitor-enter p0

    :try_start_0
    iput p1, p0, Lorg/jivesoftware/smack/util/Cache;->maxCacheSize:I

    .line 347
    invoke-virtual {p0}, Lorg/jivesoftware/smack/util/Cache;->cullCache()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 348
    monitor-exit p0

    return-void

    .line 344
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public setMaxLifetime(J)V
    .locals 1
    .param p1, "maxLifetime"    # J

    .prologue
    .line 355
    .local p0, "this":Lorg/jivesoftware/smack/util/Cache;, "Lorg/jivesoftware/smack/util/Cache<TK;TV;>;"
    iput-wide p1, p0, Lorg/jivesoftware/smack/util/Cache;->maxLifetime:J

    .line 356
    return-void
.end method

.method public declared-synchronized size()I
    .locals 1

    .prologue
    .line 205
    .local p0, "this":Lorg/jivesoftware/smack/util/Cache;, "Lorg/jivesoftware/smack/util/Cache<TK;TV;>;"
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/jivesoftware/smack/util/Cache;->deleteExpiredEntries()V

    .line 207
    iget-object v0, p0, Lorg/jivesoftware/smack/util/Cache;->map:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    .line 205
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized values()Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<TV;>;"
        }
    .end annotation

    .prologue
    .line 221
    .local p0, "this":Lorg/jivesoftware/smack/util/Cache;, "Lorg/jivesoftware/smack/util/Cache<TK;TV;>;"
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/jivesoftware/smack/util/Cache;->deleteExpiredEntries()V

    .line 223
    new-instance v0, Lorg/jivesoftware/smack/util/Cache$1;

    invoke-direct {v0, p0}, Lorg/jivesoftware/smack/util/Cache$1;-><init>(Lorg/jivesoftware/smack/util/Cache;)V

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableCollection(Ljava/util/Collection;)Ljava/util/Collection;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    monitor-exit p0

    return-object v0

    .line 221
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
