.class public abstract Lorg/bson/util/SimplePool;
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


# instance fields
.field final _max:I

.field private _stored:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue",
            "<TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 34
    .local p0, "this":Lorg/bson/util/SimplePool;, "Lorg/bson/util/SimplePool<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 61
    new-instance v0, Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;-><init>()V

    iput-object v0, p0, Lorg/bson/util/SimplePool;->_stored:Ljava/util/Queue;

    .line 35
    const/16 v0, 0x3e8

    iput v0, p0, Lorg/bson/util/SimplePool;->_max:I

    .line 36
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .param p1, "max"    # I

    .prologue
    .line 30
    .local p0, "this":Lorg/bson/util/SimplePool;, "Lorg/bson/util/SimplePool<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 61
    new-instance v0, Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;-><init>()V

    iput-object v0, p0, Lorg/bson/util/SimplePool;->_stored:Ljava/util/Queue;

    .line 31
    iput p1, p0, Lorg/bson/util/SimplePool;->_max:I

    .line 32
    return-void
.end method


# virtual methods
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
    .line 52
    .local p0, "this":Lorg/bson/util/SimplePool;, "Lorg/bson/util/SimplePool<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    invoke-virtual {p0, p1}, Lorg/bson/util/SimplePool;->ok(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 58
    :cond_0
    :goto_0
    return-void

    .line 55
    :cond_1
    iget-object v0, p0, Lorg/bson/util/SimplePool;->_stored:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->size()I

    move-result v0

    iget v1, p0, Lorg/bson/util/SimplePool;->_max:I

    if-gt v0, v1, :cond_0

    .line 57
    iget-object v0, p0, Lorg/bson/util/SimplePool;->_stored:Ljava/util/Queue;

    invoke-interface {v0, p1}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method public get()Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .line 45
    .local p0, "this":Lorg/bson/util/SimplePool;, "Lorg/bson/util/SimplePool<TT;>;"
    iget-object v1, p0, Lorg/bson/util/SimplePool;->_stored:Ljava/util/Queue;

    invoke-interface {v1}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object v0

    .line 46
    .local v0, "t":Ljava/lang/Object;, "TT;"
    if-eqz v0, :cond_0

    .line 48
    .end local v0    # "t":Ljava/lang/Object;, "TT;"
    :goto_0
    return-object v0

    .restart local v0    # "t":Ljava/lang/Object;, "TT;"
    :cond_0
    invoke-virtual {p0}, Lorg/bson/util/SimplePool;->createNew()Ljava/lang/Object;

    move-result-object v0

    goto :goto_0
.end method

.method protected ok(Ljava/lang/Object;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    .prologue
    .line 41
    .local p0, "this":Lorg/bson/util/SimplePool;, "Lorg/bson/util/SimplePool<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    const/4 v0, 0x1

    return v0
.end method
