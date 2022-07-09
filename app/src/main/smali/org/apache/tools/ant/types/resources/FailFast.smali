.class Lorg/apache/tools/ant/types/resources/FailFast;
.super Ljava/lang/Object;
.source "FailFast.java"

# interfaces
.implements Ljava/util/Iterator;


# static fields
.field private static final MAP:Ljava/util/WeakHashMap;


# instance fields
.field private parent:Ljava/lang/Object;

.field private wrapped:Ljava/util/Iterator;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 33
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Lorg/apache/tools/ant/types/resources/FailFast;->MAP:Ljava/util/WeakHashMap;

    return-void
.end method

.method constructor <init>(Ljava/lang/Object;Ljava/util/Iterator;)V
    .locals 2
    .param p1, "o"    # Ljava/lang/Object;
    .param p2, "i"    # Ljava/util/Iterator;

    .prologue
    .line 78
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 79
    if-nez p1, :cond_0

    .line 80
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "parent object is null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 82
    :cond_0
    if-nez p2, :cond_1

    .line 83
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "cannot wrap null iterator"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 85
    :cond_1
    iput-object p1, p0, Lorg/apache/tools/ant/types/resources/FailFast;->parent:Ljava/lang/Object;

    .line 86
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 87
    iput-object p2, p0, Lorg/apache/tools/ant/types/resources/FailFast;->wrapped:Ljava/util/Iterator;

    .line 88
    invoke-static {p0}, Lorg/apache/tools/ant/types/resources/FailFast;->add(Lorg/apache/tools/ant/types/resources/FailFast;)V

    .line 90
    :cond_2
    return-void
.end method

.method private static declared-synchronized add(Lorg/apache/tools/ant/types/resources/FailFast;)V
    .locals 4
    .param p0, "f"    # Lorg/apache/tools/ant/types/resources/FailFast;

    .prologue
    .line 47
    const-class v2, Lorg/apache/tools/ant/types/resources/FailFast;

    monitor-enter v2

    :try_start_0
    sget-object v1, Lorg/apache/tools/ant/types/resources/FailFast;->MAP:Ljava/util/WeakHashMap;

    iget-object v3, p0, Lorg/apache/tools/ant/types/resources/FailFast;->parent:Ljava/lang/Object;

    invoke-virtual {v1, v3}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Set;

    .line 48
    .local v0, "s":Ljava/util/Set;
    if-nez v0, :cond_0

    .line 49
    new-instance v0, Ljava/util/HashSet;

    .end local v0    # "s":Ljava/util/Set;
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 50
    .restart local v0    # "s":Ljava/util/Set;
    sget-object v1, Lorg/apache/tools/ant/types/resources/FailFast;->MAP:Ljava/util/WeakHashMap;

    iget-object v3, p0, Lorg/apache/tools/ant/types/resources/FailFast;->parent:Ljava/lang/Object;

    invoke-virtual {v1, v3, v0}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 52
    :cond_0
    invoke-interface {v0, p0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 53
    monitor-exit v2

    return-void

    .line 47
    .end local v0    # "s":Ljava/util/Set;
    :catchall_0
    move-exception v1

    monitor-exit v2

    throw v1
.end method

.method private static declared-synchronized failFast(Lorg/apache/tools/ant/types/resources/FailFast;)V
    .locals 4
    .param p0, "f"    # Lorg/apache/tools/ant/types/resources/FailFast;

    .prologue
    .line 63
    const-class v2, Lorg/apache/tools/ant/types/resources/FailFast;

    monitor-enter v2

    :try_start_0
    sget-object v1, Lorg/apache/tools/ant/types/resources/FailFast;->MAP:Ljava/util/WeakHashMap;

    iget-object v3, p0, Lorg/apache/tools/ant/types/resources/FailFast;->parent:Ljava/lang/Object;

    invoke-virtual {v1, v3}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Set;

    .line 64
    .local v0, "s":Ljava/util/Set;
    invoke-interface {v0, p0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 65
    new-instance v1, Ljava/util/ConcurrentModificationException;

    invoke-direct {v1}, Ljava/util/ConcurrentModificationException;-><init>()V

    throw v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 63
    .end local v0    # "s":Ljava/util/Set;
    :catchall_0
    move-exception v1

    monitor-exit v2

    throw v1

    .line 67
    .restart local v0    # "s":Ljava/util/Set;
    :cond_0
    monitor-exit v2

    return-void
.end method

.method static declared-synchronized invalidate(Ljava/lang/Object;)V
    .locals 3
    .param p0, "o"    # Ljava/lang/Object;

    .prologue
    .line 40
    const-class v2, Lorg/apache/tools/ant/types/resources/FailFast;

    monitor-enter v2

    :try_start_0
    sget-object v1, Lorg/apache/tools/ant/types/resources/FailFast;->MAP:Ljava/util/WeakHashMap;

    invoke-virtual {v1, p0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Set;

    .line 41
    .local v0, "s":Ljava/util/Set;
    if-eqz v0, :cond_0

    .line 42
    invoke-interface {v0}, Ljava/util/Set;->clear()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 44
    :cond_0
    monitor-exit v2

    return-void

    .line 40
    .end local v0    # "s":Ljava/util/Set;
    :catchall_0
    move-exception v1

    monitor-exit v2

    throw v1
.end method

.method private static declared-synchronized remove(Lorg/apache/tools/ant/types/resources/FailFast;)V
    .locals 4
    .param p0, "f"    # Lorg/apache/tools/ant/types/resources/FailFast;

    .prologue
    .line 56
    const-class v2, Lorg/apache/tools/ant/types/resources/FailFast;

    monitor-enter v2

    :try_start_0
    sget-object v1, Lorg/apache/tools/ant/types/resources/FailFast;->MAP:Ljava/util/WeakHashMap;

    iget-object v3, p0, Lorg/apache/tools/ant/types/resources/FailFast;->parent:Ljava/lang/Object;

    invoke-virtual {v1, v3}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Set;

    .line 57
    .local v0, "s":Ljava/util/Set;
    if-eqz v0, :cond_0

    .line 58
    invoke-interface {v0, p0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 60
    :cond_0
    monitor-exit v2

    return-void

    .line 56
    .end local v0    # "s":Ljava/util/Set;
    :catchall_0
    move-exception v1

    monitor-exit v2

    throw v1
.end method


# virtual methods
.method public hasNext()Z
    .locals 1

    .prologue
    .line 97
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/FailFast;->wrapped:Ljava/util/Iterator;

    if-nez v0, :cond_0

    .line 98
    const/4 v0, 0x0

    .line 101
    :goto_0
    return v0

    .line 100
    :cond_0
    invoke-static {p0}, Lorg/apache/tools/ant/types/resources/FailFast;->failFast(Lorg/apache/tools/ant/types/resources/FailFast;)V

    .line 101
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/FailFast;->wrapped:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    goto :goto_0
.end method

.method public next()Ljava/lang/Object;
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 110
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/FailFast;->wrapped:Ljava/util/Iterator;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/FailFast;->wrapped:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_1

    .line 111
    :cond_0
    new-instance v0, Ljava/util/NoSuchElementException;

    invoke-direct {v0}, Ljava/util/NoSuchElementException;-><init>()V

    throw v0

    .line 113
    :cond_1
    invoke-static {p0}, Lorg/apache/tools/ant/types/resources/FailFast;->failFast(Lorg/apache/tools/ant/types/resources/FailFast;)V

    .line 115
    :try_start_0
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/FailFast;->wrapped:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    .line 117
    iget-object v1, p0, Lorg/apache/tools/ant/types/resources/FailFast;->wrapped:Ljava/util/Iterator;

    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_2

    .line 118
    iput-object v2, p0, Lorg/apache/tools/ant/types/resources/FailFast;->wrapped:Ljava/util/Iterator;

    .line 119
    invoke-static {p0}, Lorg/apache/tools/ant/types/resources/FailFast;->remove(Lorg/apache/tools/ant/types/resources/FailFast;)V

    .line 115
    :cond_2
    return-object v0

    .line 117
    :catchall_0
    move-exception v0

    iget-object v1, p0, Lorg/apache/tools/ant/types/resources/FailFast;->wrapped:Ljava/util/Iterator;

    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_3

    .line 118
    iput-object v2, p0, Lorg/apache/tools/ant/types/resources/FailFast;->wrapped:Ljava/util/Iterator;

    .line 119
    invoke-static {p0}, Lorg/apache/tools/ant/types/resources/FailFast;->remove(Lorg/apache/tools/ant/types/resources/FailFast;)V

    .line 117
    :cond_3
    throw v0
.end method

.method public remove()V
    .locals 1

    .prologue
    .line 129
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method
