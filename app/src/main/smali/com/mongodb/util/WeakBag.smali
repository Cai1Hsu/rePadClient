.class public Lcom/mongodb/util/WeakBag;
.super Ljava/lang/Object;
.source "WeakBag.java"

# interfaces
.implements Ljava/lang/Iterable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mongodb/util/WeakBag$MyRef;
    }
.end annotation

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
.field private final _refs:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/util/WeakBag",
            "<TT;>.MyRef;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 36
    .local p0, "this":Lcom/mongodb/util/WeakBag;, "Lcom/mongodb/util/WeakBag<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 127
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/mongodb/util/WeakBag;->_refs:Ljava/util/List;

    .line 37
    return-void
.end method


# virtual methods
.method public add(Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 43
    .local p0, "this":Lcom/mongodb/util/WeakBag;, "Lcom/mongodb/util/WeakBag<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget-object v0, p0, Lcom/mongodb/util/WeakBag;->_refs:Ljava/util/List;

    new-instance v1, Lcom/mongodb/util/WeakBag$MyRef;

    invoke-direct {v1, p0, p1}, Lcom/mongodb/util/WeakBag$MyRef;-><init>(Lcom/mongodb/util/WeakBag;Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 44
    return-void
.end method

.method public clean()V
    .locals 3

    .prologue
    .line 94
    .local p0, "this":Lcom/mongodb/util/WeakBag;, "Lcom/mongodb/util/WeakBag<TT;>;"
    iget-object v2, p0, Lcom/mongodb/util/WeakBag;->_refs:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/mongodb/util/WeakBag<TT;>.MyRef;>;"
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 95
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mongodb/util/WeakBag$MyRef;

    .line 96
    .local v1, "ref":Lcom/mongodb/util/WeakBag$MyRef;, "Lcom/mongodb/util/WeakBag<TT;>.MyRef;"
    invoke-virtual {v1}, Lcom/mongodb/util/WeakBag$MyRef;->get()Ljava/lang/Object;

    move-result-object v2

    if-nez v2, :cond_0

    .line 97
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    goto :goto_0

    .line 99
    .end local v1    # "ref":Lcom/mongodb/util/WeakBag$MyRef;, "Lcom/mongodb/util/WeakBag<TT;>.MyRef;"
    :cond_1
    return-void
.end method

.method public clear()V
    .locals 1

    .prologue
    .line 89
    .local p0, "this":Lcom/mongodb/util/WeakBag;, "Lcom/mongodb/util/WeakBag<TT;>;"
    iget-object v0, p0, Lcom/mongodb/util/WeakBag;->_refs:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 90
    return-void
.end method

.method public contains(Ljava/lang/Object;)Z
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    .prologue
    .line 70
    .local p0, "this":Lcom/mongodb/util/WeakBag;, "Lcom/mongodb/util/WeakBag<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget-object v3, p0, Lcom/mongodb/util/WeakBag;->_refs:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/mongodb/util/WeakBag<TT;>.MyRef;>;"
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 71
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/mongodb/util/WeakBag$MyRef;

    .line 72
    .local v2, "ref":Lcom/mongodb/util/WeakBag$MyRef;, "Lcom/mongodb/util/WeakBag<TT;>.MyRef;"
    invoke-virtual {v2}, Lcom/mongodb/util/WeakBag$MyRef;->get()Ljava/lang/Object;

    move-result-object v1

    .line 73
    .local v1, "me":Ljava/lang/Object;, "TT;"
    if-ne v1, p1, :cond_0

    .line 74
    const/4 v3, 0x1

    .line 76
    .end local v1    # "me":Ljava/lang/Object;, "TT;"
    .end local v2    # "ref":Lcom/mongodb/util/WeakBag$MyRef;, "Lcom/mongodb/util/WeakBag<TT;>.MyRef;"
    :goto_0
    return v3

    :cond_1
    const/4 v3, 0x0

    goto :goto_0
.end method

.method public getAll()Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 107
    .local p0, "this":Lcom/mongodb/util/WeakBag;, "Lcom/mongodb/util/WeakBag<TT;>;"
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 109
    .local v1, "l":Ljava/util/List;, "Ljava/util/List<TT;>;"
    iget-object v4, p0, Lcom/mongodb/util/WeakBag;->_refs:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/mongodb/util/WeakBag<TT;>.MyRef;>;"
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 110
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/mongodb/util/WeakBag$MyRef;

    .line 111
    .local v2, "ref":Lcom/mongodb/util/WeakBag$MyRef;, "Lcom/mongodb/util/WeakBag<TT;>.MyRef;"
    invoke-virtual {v2}, Lcom/mongodb/util/WeakBag$MyRef;->get()Ljava/lang/Object;

    move-result-object v3

    .line 112
    .local v3, "t":Ljava/lang/Object;, "TT;"
    if-nez v3, :cond_0

    .line 113
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    goto :goto_0

    .line 115
    :cond_0
    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 118
    .end local v2    # "ref":Lcom/mongodb/util/WeakBag$MyRef;, "Lcom/mongodb/util/WeakBag<TT;>.MyRef;"
    .end local v3    # "t":Ljava/lang/Object;, "TT;"
    :cond_1
    return-object v1
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
    .line 102
    .local p0, "this":Lcom/mongodb/util/WeakBag;, "Lcom/mongodb/util/WeakBag<TT;>;"
    invoke-virtual {p0}, Lcom/mongodb/util/WeakBag;->getAll()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method public remove(Ljava/lang/Object;)Z
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    .prologue
    .line 48
    .local p0, "this":Lcom/mongodb/util/WeakBag;, "Lcom/mongodb/util/WeakBag<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget-object v3, p0, Lcom/mongodb/util/WeakBag;->_refs:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/mongodb/util/WeakBag<TT;>.MyRef;>;"
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 49
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/mongodb/util/WeakBag$MyRef;

    .line 50
    .local v2, "ref":Lcom/mongodb/util/WeakBag$MyRef;, "Lcom/mongodb/util/WeakBag<TT;>.MyRef;"
    if-eqz v2, :cond_0

    .line 52
    invoke-virtual {v2}, Lcom/mongodb/util/WeakBag$MyRef;->get()Ljava/lang/Object;

    move-result-object v1

    .line 54
    .local v1, "me":Ljava/lang/Object;, "TT;"
    if-nez v1, :cond_1

    .line 56
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    goto :goto_0

    .line 60
    :cond_1
    if-ne v1, p1, :cond_0

    .line 61
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    .line 62
    const/4 v3, 0x1

    .line 65
    .end local v1    # "me":Ljava/lang/Object;, "TT;"
    .end local v2    # "ref":Lcom/mongodb/util/WeakBag$MyRef;, "Lcom/mongodb/util/WeakBag<TT;>.MyRef;"
    :goto_1
    return v3

    :cond_2
    const/4 v3, 0x0

    goto :goto_1
.end method

.method public size()I
    .locals 1

    .prologue
    .line 83
    .local p0, "this":Lcom/mongodb/util/WeakBag;, "Lcom/mongodb/util/WeakBag<TT;>;"
    invoke-virtual {p0}, Lcom/mongodb/util/WeakBag;->clean()V

    .line 84
    iget-object v0, p0, Lcom/mongodb/util/WeakBag;->_refs:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method
