.class public Lorg/bson/util/ClassMap;
.super Ljava/lang/Object;
.source "ClassMap.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/bson/util/ClassMap$1;,
        Lorg/bson/util/ClassMap$ComputeFunction;
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
.field private final cache:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Class",
            "<*>;TT;>;"
        }
    .end annotation
.end field

.field private final map:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Class",
            "<*>;TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 40
    .local p0, "this":Lorg/bson/util/ClassMap;, "Lorg/bson/util/ClassMap<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 64
    invoke-static {}, Lorg/bson/util/CopyOnWriteMap;->newHashMap()Lorg/bson/util/CopyOnWriteMap;

    move-result-object v0

    iput-object v0, p0, Lorg/bson/util/ClassMap;->map:Ljava/util/Map;

    .line 65
    new-instance v0, Lorg/bson/util/ClassMap$ComputeFunction;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lorg/bson/util/ClassMap$ComputeFunction;-><init>(Lorg/bson/util/ClassMap;Lorg/bson/util/ClassMap$1;)V

    invoke-static {v0}, Lorg/bson/util/ComputingMap;->create(Lorg/bson/util/Function;)Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lorg/bson/util/ClassMap;->cache:Ljava/util/Map;

    return-void
.end method

.method static synthetic access$000(Lorg/bson/util/ClassMap;)Ljava/util/Map;
    .locals 1
    .param p0, "x0"    # Lorg/bson/util/ClassMap;

    .prologue
    .line 40
    iget-object v0, p0, Lorg/bson/util/ClassMap;->map:Ljava/util/Map;

    return-object v0
.end method

.method public static getAncestry(Ljava/lang/Class;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;)",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Class",
            "<*>;>;"
        }
    .end annotation

    .prologue
    .line 48
    .local p0, "c":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    invoke-static {p0}, Lorg/bson/util/ClassAncestry;->getAncestry(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public clear()V
    .locals 1

    .prologue
    .line 89
    .local p0, "this":Lorg/bson/util/ClassMap;, "Lorg/bson/util/ClassMap<TT;>;"
    iget-object v0, p0, Lorg/bson/util/ClassMap;->map:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 90
    iget-object v0, p0, Lorg/bson/util/ClassMap;->cache:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 91
    return-void
.end method

.method public get(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "key"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 69
    .local p0, "this":Lorg/bson/util/ClassMap;, "Lorg/bson/util/ClassMap<TT;>;"
    iget-object v0, p0, Lorg/bson/util/ClassMap;->cache:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public isEmpty()Z
    .locals 1

    .prologue
    .line 98
    .local p0, "this":Lorg/bson/util/ClassMap;, "Lorg/bson/util/ClassMap<TT;>;"
    iget-object v0, p0, Lorg/bson/util/ClassMap;->map:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public put(Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;TT;)TT;"
        }
    .end annotation

    .prologue
    .line 74
    .local p0, "this":Lorg/bson/util/ClassMap;, "Lorg/bson/util/ClassMap<TT;>;"
    .local p1, "key":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p2, "value":Ljava/lang/Object;, "TT;"
    :try_start_0
    iget-object v0, p0, Lorg/bson/util/ClassMap;->map:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    .line 76
    iget-object v1, p0, Lorg/bson/util/ClassMap;->cache:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->clear()V

    return-object v0

    :catchall_0
    move-exception v0

    iget-object v1, p0, Lorg/bson/util/ClassMap;->cache:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->clear()V

    throw v0
.end method

.method public remove(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .param p1, "key"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 82
    .local p0, "this":Lorg/bson/util/ClassMap;, "Lorg/bson/util/ClassMap<TT;>;"
    :try_start_0
    iget-object v0, p0, Lorg/bson/util/ClassMap;->map:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    .line 84
    iget-object v1, p0, Lorg/bson/util/ClassMap;->cache:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->clear()V

    return-object v0

    :catchall_0
    move-exception v0

    iget-object v1, p0, Lorg/bson/util/ClassMap;->cache:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->clear()V

    throw v0
.end method

.method public size()I
    .locals 1

    .prologue
    .line 94
    .local p0, "this":Lorg/bson/util/ClassMap;, "Lorg/bson/util/ClassMap<TT;>;"
    iget-object v0, p0, Lorg/bson/util/ClassMap;->map:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    return v0
.end method
