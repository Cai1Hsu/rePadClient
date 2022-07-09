.class final Lorg/bson/util/ComputingMap;
.super Ljava/lang/Object;
.source "ComputingMap.java"

# interfaces
.implements Ljava/util/Map;
.implements Lorg/bson/util/Function;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/util/Map",
        "<TK;TV;>;",
        "Lorg/bson/util/Function",
        "<TK;TV;>;"
    }
.end annotation


# instance fields
.field private final function:Lorg/bson/util/Function;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/bson/util/Function",
            "<TK;TV;>;"
        }
    .end annotation
.end field

.field private final map:Ljava/util/concurrent/ConcurrentMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentMap",
            "<TK;TV;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Ljava/util/concurrent/ConcurrentMap;Lorg/bson/util/Function;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/ConcurrentMap",
            "<TK;TV;>;",
            "Lorg/bson/util/Function",
            "<TK;TV;>;)V"
        }
    .end annotation

    .prologue
    .line 35
    .local p0, "this":Lorg/bson/util/ComputingMap;, "Lorg/bson/util/ComputingMap<TK;TV;>;"
    .local p1, "map":Ljava/util/concurrent/ConcurrentMap;, "Ljava/util/concurrent/ConcurrentMap<TK;TV;>;"
    .local p2, "function":Lorg/bson/util/Function;, "Lorg/bson/util/Function<TK;TV;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    const-string/jumbo v0, "map"

    invoke-static {v0, p1}, Lorg/bson/util/Assertions;->notNull(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/concurrent/ConcurrentMap;

    iput-object v0, p0, Lorg/bson/util/ComputingMap;->map:Ljava/util/concurrent/ConcurrentMap;

    .line 37
    const-string/jumbo v0, "function"

    invoke-static {v0, p2}, Lorg/bson/util/Assertions;->notNull(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/bson/util/Function;

    iput-object v0, p0, Lorg/bson/util/ComputingMap;->function:Lorg/bson/util/Function;

    .line 38
    return-void
.end method

.method public static create(Lorg/bson/util/Function;)Ljava/util/Map;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Lorg/bson/util/Function",
            "<TK;TV;>;)",
            "Ljava/util/Map",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 29
    .local p0, "function":Lorg/bson/util/Function;, "Lorg/bson/util/Function<TK;TV;>;"
    new-instance v0, Lorg/bson/util/ComputingMap;

    invoke-static {}, Lorg/bson/util/CopyOnWriteMap;->newHashMap()Lorg/bson/util/CopyOnWriteMap;

    move-result-object v1

    invoke-direct {v0, v1, p0}, Lorg/bson/util/ComputingMap;-><init>(Ljava/util/concurrent/ConcurrentMap;Lorg/bson/util/Function;)V

    return-object v0
.end method


# virtual methods
.method public apply(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)TV;"
        }
    .end annotation

    .prologue
    .line 55
    .local p0, "this":Lorg/bson/util/ComputingMap;, "Lorg/bson/util/ComputingMap<TK;TV;>;"
    .local p1, "k":Ljava/lang/Object;, "TK;"
    invoke-virtual {p0, p1}, Lorg/bson/util/ComputingMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public clear()V
    .locals 1

    .prologue
    .line 103
    .local p0, "this":Lorg/bson/util/ComputingMap;, "Lorg/bson/util/ComputingMap<TK;TV;>;"
    iget-object v0, p0, Lorg/bson/util/ComputingMap;->map:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v0}, Ljava/util/concurrent/ConcurrentMap;->clear()V

    .line 104
    return-void
.end method

.method public containsKey(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "key"    # Ljava/lang/Object;

    .prologue
    .line 83
    .local p0, "this":Lorg/bson/util/ComputingMap;, "Lorg/bson/util/ComputingMap<TK;TV;>;"
    iget-object v0, p0, Lorg/bson/util/ComputingMap;->map:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v0, p1}, Ljava/util/concurrent/ConcurrentMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public containsValue(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "value"    # Ljava/lang/Object;

    .prologue
    .line 87
    .local p0, "this":Lorg/bson/util/ComputingMap;, "Lorg/bson/util/ComputingMap<TK;TV;>;"
    iget-object v0, p0, Lorg/bson/util/ComputingMap;->map:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v0, p1}, Ljava/util/concurrent/ConcurrentMap;->containsValue(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public entrySet()Ljava/util/Set;
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
    .line 115
    .local p0, "this":Lorg/bson/util/ComputingMap;, "Lorg/bson/util/ComputingMap<TK;TV;>;"
    iget-object v0, p0, Lorg/bson/util/ComputingMap;->map:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v0}, Ljava/util/concurrent/ConcurrentMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 119
    .local p0, "this":Lorg/bson/util/ComputingMap;, "Lorg/bson/util/ComputingMap<TK;TV;>;"
    iget-object v0, p0, Lorg/bson/util/ComputingMap;->map:Ljava/util/concurrent/ConcurrentMap;

    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public get(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4
    .param p1, "key"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")TV;"
        }
    .end annotation

    .prologue
    .line 42
    .local p0, "this":Lorg/bson/util/ComputingMap;, "Lorg/bson/util/ComputingMap<TK;TV;>;"
    :goto_0
    iget-object v3, p0, Lorg/bson/util/ComputingMap;->map:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v3, p1}, Ljava/util/concurrent/ConcurrentMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 43
    .local v1, "v":Ljava/lang/Object;, "TV;"
    if-eqz v1, :cond_0

    .line 49
    .end local v1    # "v":Ljava/lang/Object;, "TV;"
    :goto_1
    return-object v1

    .line 46
    .restart local v1    # "v":Ljava/lang/Object;, "TV;"
    :cond_0
    move-object v0, p1

    .line 47
    .local v0, "k":Ljava/lang/Object;, "TK;"
    iget-object v3, p0, Lorg/bson/util/ComputingMap;->function:Lorg/bson/util/Function;

    invoke-interface {v3, v0}, Lorg/bson/util/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 48
    .local v2, "value":Ljava/lang/Object;, "TV;"
    if-nez v2, :cond_1

    .line 49
    const/4 v1, 0x0

    goto :goto_1

    .line 50
    :cond_1
    iget-object v3, p0, Lorg/bson/util/ComputingMap;->map:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v3, v0, v2}, Ljava/util/concurrent/ConcurrentMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method

.method public hashCode()I
    .locals 1

    .prologue
    .line 123
    .local p0, "this":Lorg/bson/util/ComputingMap;, "Lorg/bson/util/ComputingMap<TK;TV;>;"
    iget-object v0, p0, Lorg/bson/util/ComputingMap;->map:Ljava/util/concurrent/ConcurrentMap;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    return v0
.end method

.method public isEmpty()Z
    .locals 1

    .prologue
    .line 79
    .local p0, "this":Lorg/bson/util/ComputingMap;, "Lorg/bson/util/ComputingMap<TK;TV;>;"
    iget-object v0, p0, Lorg/bson/util/ComputingMap;->map:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v0}, Ljava/util/concurrent/ConcurrentMap;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public keySet()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<TK;>;"
        }
    .end annotation

    .prologue
    .line 107
    .local p0, "this":Lorg/bson/util/ComputingMap;, "Lorg/bson/util/ComputingMap<TK;TV;>;"
    iget-object v0, p0, Lorg/bson/util/ComputingMap;->map:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v0}, Ljava/util/concurrent/ConcurrentMap;->keySet()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;)TV;"
        }
    .end annotation

    .prologue
    .line 91
    .local p0, "this":Lorg/bson/util/ComputingMap;, "Lorg/bson/util/ComputingMap<TK;TV;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    .local p2, "value":Ljava/lang/Object;, "TV;"
    iget-object v0, p0, Lorg/bson/util/ComputingMap;->map:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v0, p1, p2}, Ljava/util/concurrent/ConcurrentMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public putAll(Ljava/util/Map;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<+TK;+TV;>;)V"
        }
    .end annotation

    .prologue
    .line 99
    .local p0, "this":Lorg/bson/util/ComputingMap;, "Lorg/bson/util/ComputingMap<TK;TV;>;"
    .local p1, "m":Ljava/util/Map;, "Ljava/util/Map<+TK;+TV;>;"
    iget-object v0, p0, Lorg/bson/util/ComputingMap;->map:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v0, p1}, Ljava/util/concurrent/ConcurrentMap;->putAll(Ljava/util/Map;)V

    .line 100
    return-void
.end method

.method public putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;)TV;"
        }
    .end annotation

    .prologue
    .line 59
    .local p0, "this":Lorg/bson/util/ComputingMap;, "Lorg/bson/util/ComputingMap<TK;TV;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    .local p2, "value":Ljava/lang/Object;, "TV;"
    iget-object v0, p0, Lorg/bson/util/ComputingMap;->map:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v0, p1, p2}, Ljava/util/concurrent/ConcurrentMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public remove(Ljava/lang/Object;)Ljava/lang/Object;
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
    .line 95
    .local p0, "this":Lorg/bson/util/ComputingMap;, "Lorg/bson/util/ComputingMap<TK;TV;>;"
    iget-object v0, p0, Lorg/bson/util/ComputingMap;->map:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v0, p1}, Ljava/util/concurrent/ConcurrentMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public remove(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 1
    .param p1, "key"    # Ljava/lang/Object;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 63
    .local p0, "this":Lorg/bson/util/ComputingMap;, "Lorg/bson/util/ComputingMap<TK;TV;>;"
    iget-object v0, p0, Lorg/bson/util/ComputingMap;->map:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v0, p1, p2}, Ljava/util/concurrent/ConcurrentMap;->remove(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public replace(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;)TV;"
        }
    .end annotation

    .prologue
    .line 71
    .local p0, "this":Lorg/bson/util/ComputingMap;, "Lorg/bson/util/ComputingMap<TK;TV;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    .local p2, "value":Ljava/lang/Object;, "TV;"
    iget-object v0, p0, Lorg/bson/util/ComputingMap;->map:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v0, p1, p2}, Ljava/util/concurrent/ConcurrentMap;->replace(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public replace(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;TV;)Z"
        }
    .end annotation

    .prologue
    .line 67
    .local p0, "this":Lorg/bson/util/ComputingMap;, "Lorg/bson/util/ComputingMap<TK;TV;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    .local p2, "oldValue":Ljava/lang/Object;, "TV;"
    .local p3, "newValue":Ljava/lang/Object;, "TV;"
    iget-object v0, p0, Lorg/bson/util/ComputingMap;->map:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v0, p1, p2, p3}, Ljava/util/concurrent/ConcurrentMap;->replace(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public size()I
    .locals 1

    .prologue
    .line 75
    .local p0, "this":Lorg/bson/util/ComputingMap;, "Lorg/bson/util/ComputingMap<TK;TV;>;"
    iget-object v0, p0, Lorg/bson/util/ComputingMap;->map:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v0}, Ljava/util/concurrent/ConcurrentMap;->size()I

    move-result v0

    return v0
.end method

.method public values()Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<TV;>;"
        }
    .end annotation

    .prologue
    .line 111
    .local p0, "this":Lorg/bson/util/ComputingMap;, "Lorg/bson/util/ComputingMap<TK;TV;>;"
    iget-object v0, p0, Lorg/bson/util/ComputingMap;->map:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v0}, Ljava/util/concurrent/ConcurrentMap;->values()Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method
