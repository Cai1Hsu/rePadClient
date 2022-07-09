.class public Lcom/mongodb/util/IdentitySet;
.super Ljava/lang/Object;
.source "IdentitySet.java"

# interfaces
.implements Ljava/lang/Iterable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/lang/Iterable",
        "<TT;>;"
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field final _map:Ljava/util/IdentityHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/IdentityHashMap",
            "<TT;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 31
    .local p0, "this":Lcom/mongodb/util/IdentitySet;, "Lcom/mongodb/util/IdentitySet<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 84
    new-instance v0, Ljava/util/IdentityHashMap;

    invoke-direct {v0}, Ljava/util/IdentityHashMap;-><init>()V

    iput-object v0, p0, Lcom/mongodb/util/IdentitySet;->_map:Ljava/util/IdentityHashMap;

    .line 32
    return-void
.end method

.method public constructor <init>(Ljava/lang/Iterable;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 34
    .local p0, "this":Lcom/mongodb/util/IdentitySet;, "Lcom/mongodb/util/IdentitySet<TT;>;"
    .local p1, "copy":Ljava/lang/Iterable;, "Ljava/lang/Iterable<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 84
    new-instance v2, Ljava/util/IdentityHashMap;

    invoke-direct {v2}, Ljava/util/IdentityHashMap;-><init>()V

    iput-object v2, p0, Lcom/mongodb/util/IdentitySet;->_map:Ljava/util/IdentityHashMap;

    .line 35
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 36
    .local v1, "t":Ljava/lang/Object;, "TT;"
    invoke-virtual {p0, v1}, Lcom/mongodb/util/IdentitySet;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 37
    .end local v1    # "t":Ljava/lang/Object;, "TT;"
    :cond_0
    return-void
.end method


# virtual methods
.method public add(Ljava/lang/Object;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    .prologue
    .line 40
    .local p0, "this":Lcom/mongodb/util/IdentitySet;, "Lcom/mongodb/util/IdentitySet<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget-object v0, p0, Lcom/mongodb/util/IdentitySet;->_map:Ljava/util/IdentityHashMap;

    const-string/jumbo v1, "a"

    invoke-virtual {v0, p1, v1}, Ljava/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public addAll(Lcom/mongodb/util/IdentitySet;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/mongodb/util/IdentitySet",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 75
    .local p0, "this":Lcom/mongodb/util/IdentitySet;, "Lcom/mongodb/util/IdentitySet<TT;>;"
    .local p1, "c":Lcom/mongodb/util/IdentitySet;, "Lcom/mongodb/util/IdentitySet<TT;>;"
    invoke-virtual {p1}, Lcom/mongodb/util/IdentitySet;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 76
    .local v1, "t":Ljava/lang/Object;, "TT;"
    invoke-virtual {p0, v1}, Lcom/mongodb/util/IdentitySet;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 77
    .end local v1    # "t":Ljava/lang/Object;, "TT;"
    :cond_0
    return-void
.end method

.method public addAll(Ljava/util/Collection;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 69
    .local p0, "this":Lcom/mongodb/util/IdentitySet;, "Lcom/mongodb/util/IdentitySet<TT;>;"
    .local p1, "c":Ljava/util/Collection;, "Ljava/util/Collection<TT;>;"
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 70
    .local v1, "t":Ljava/lang/Object;, "TT;"
    invoke-virtual {p0, v1}, Lcom/mongodb/util/IdentitySet;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 72
    .end local v1    # "t":Ljava/lang/Object;, "TT;"
    :cond_0
    return-void
.end method

.method public clear()V
    .locals 1

    .prologue
    .line 57
    .local p0, "this":Lcom/mongodb/util/IdentitySet;, "Lcom/mongodb/util/IdentitySet<TT;>;"
    iget-object v0, p0, Lcom/mongodb/util/IdentitySet;->_map:Ljava/util/IdentityHashMap;

    invoke-virtual {v0}, Ljava/util/IdentityHashMap;->clear()V

    .line 58
    return-void
.end method

.method public contains(Ljava/lang/Object;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    .prologue
    .line 44
    .local p0, "this":Lcom/mongodb/util/IdentitySet;, "Lcom/mongodb/util/IdentitySet<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget-object v0, p0, Lcom/mongodb/util/IdentitySet;->_map:Ljava/util/IdentityHashMap;

    invoke-virtual {v0, p1}, Ljava/util/IdentityHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 65
    .local p0, "this":Lcom/mongodb/util/IdentitySet;, "Lcom/mongodb/util/IdentitySet<TT;>;"
    iget-object v0, p0, Lcom/mongodb/util/IdentitySet;->_map:Ljava/util/IdentityHashMap;

    invoke-virtual {v0}, Ljava/util/IdentityHashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method public remove(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 48
    .local p0, "this":Lcom/mongodb/util/IdentitySet;, "Lcom/mongodb/util/IdentitySet<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget-object v0, p0, Lcom/mongodb/util/IdentitySet;->_map:Ljava/util/IdentityHashMap;

    invoke-virtual {v0, p1}, Ljava/util/IdentityHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 49
    return-void
.end method

.method public removeAll(Ljava/lang/Iterable;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 80
    .local p0, "this":Lcom/mongodb/util/IdentitySet;, "Lcom/mongodb/util/IdentitySet<TT;>;"
    .local p1, "prev":Ljava/lang/Iterable;, "Ljava/lang/Iterable<TT;>;"
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 81
    .local v1, "t":Ljava/lang/Object;, "TT;"
    invoke-virtual {p0, v1}, Lcom/mongodb/util/IdentitySet;->remove(Ljava/lang/Object;)V

    goto :goto_0

    .line 82
    .end local v1    # "t":Ljava/lang/Object;, "TT;"
    :cond_0
    return-void
.end method

.method public removeall(Ljava/lang/Iterable;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 52
    .local p0, "this":Lcom/mongodb/util/IdentitySet;, "Lcom/mongodb/util/IdentitySet<TT;>;"
    .local p1, "coll":Ljava/lang/Iterable;, "Ljava/lang/Iterable<TT;>;"
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 53
    .local v1, "t":Ljava/lang/Object;, "TT;"
    iget-object v2, p0, Lcom/mongodb/util/IdentitySet;->_map:Ljava/util/IdentityHashMap;

    invoke-virtual {v2, v1}, Ljava/util/IdentityHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 54
    .end local v1    # "t":Ljava/lang/Object;, "TT;"
    :cond_0
    return-void
.end method

.method public size()I
    .locals 1

    .prologue
    .line 61
    .local p0, "this":Lcom/mongodb/util/IdentitySet;, "Lcom/mongodb/util/IdentitySet<TT;>;"
    iget-object v0, p0, Lcom/mongodb/util/IdentitySet;->_map:Ljava/util/IdentityHashMap;

    invoke-virtual {v0}, Ljava/util/IdentityHashMap;->size()I

    move-result v0

    return v0
.end method
