.class public Lcom/edutech/json/Tree;
.super Ljava/lang/Object;
.source "Tree.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# static fields
.field private static final indent:I = 0x2


# instance fields
.field private head:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field private leafs:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/edutech/json/Tree",
            "<TT;>;>;"
        }
    .end annotation
.end field

.field private locate:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<TT;",
            "Lcom/edutech/json/Tree",
            "<TT;>;>;"
        }
    .end annotation
.end field

.field private parent:Lcom/edutech/json/Tree;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/edutech/json/Tree",
            "<TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 41
    .local p0, "this":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<TT;>;"
    .local p1, "head":Ljava/lang/Object;, "TT;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/edutech/json/Tree;->leafs:Ljava/util/ArrayList;

    .line 37
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/edutech/json/Tree;->parent:Lcom/edutech/json/Tree;

    .line 39
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/edutech/json/Tree;->locate:Ljava/util/HashMap;

    .line 42
    iput-object p1, p0, Lcom/edutech/json/Tree;->head:Ljava/lang/Object;

    .line 43
    iget-object v0, p0, Lcom/edutech/json/Tree;->locate:Ljava/util/HashMap;

    invoke-virtual {v0, p1, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 44
    return-void
.end method

.method public static getSuccessors(Ljava/lang/Object;Ljava/util/Collection;)Ljava/util/Collection;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;",
            "Ljava/util/Collection",
            "<",
            "Lcom/edutech/json/Tree",
            "<TT;>;>;)",
            "Ljava/util/Collection",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 119
    .local p0, "of":Ljava/lang/Object;, "TT;"
    .local p1, "in":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/edutech/json/Tree<TT;>;>;"
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_1

    .line 124
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    :goto_0
    return-object v1

    .line 119
    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/edutech/json/Tree;

    .line 120
    .local v0, "tree":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<TT;>;"
    iget-object v2, v0, Lcom/edutech/json/Tree;->locate:Ljava/util/HashMap;

    invoke-virtual {v2, p0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 121
    invoke-virtual {v0, p0}, Lcom/edutech/json/Tree;->getSuccessors(Ljava/lang/Object;)Ljava/util/Collection;

    move-result-object v1

    goto :goto_0
.end method

.method private printTree(I)Ljava/lang/String;
    .locals 7
    .param p1, "increment"    # I

    .prologue
    .line 135
    .local p0, "this":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<TT;>;"
    const-string/jumbo v3, ""

    .line 136
    .local v3, "s":Ljava/lang/String;
    const-string/jumbo v2, ""

    .line 137
    .local v2, "inc":Ljava/lang/String;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-lt v1, p1, :cond_0

    .line 140
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v5, p0, Lcom/edutech/json/Tree;->head:Ljava/lang/Object;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 141
    iget-object v4, p0, Lcom/edutech/json/Tree;->leafs:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-nez v5, :cond_1

    .line 144
    return-object v3

    .line 138
    :cond_0
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v5, " "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 137
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 141
    :cond_1
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/edutech/json/Tree;

    .line 142
    .local v0, "child":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<TT;>;"
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v6, "\n"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    add-int/lit8 v6, p1, 0x2

    invoke-direct {v0, v6}, Lcom/edutech/json/Tree;->printTree(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_1
.end method


# virtual methods
.method public addLeaf(Ljava/lang/Object;)Lcom/edutech/json/Tree;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)",
            "Lcom/edutech/json/Tree",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 55
    .local p0, "this":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<TT;>;"
    .local p1, "leaf":Ljava/lang/Object;, "TT;"
    new-instance v0, Lcom/edutech/json/Tree;

    invoke-direct {v0, p1}, Lcom/edutech/json/Tree;-><init>(Ljava/lang/Object;)V

    .line 56
    .local v0, "t":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<TT;>;"
    iget-object v1, p0, Lcom/edutech/json/Tree;->leafs:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 57
    iput-object p0, v0, Lcom/edutech/json/Tree;->parent:Lcom/edutech/json/Tree;

    .line 58
    iget-object v1, p0, Lcom/edutech/json/Tree;->locate:Ljava/util/HashMap;

    iput-object v1, v0, Lcom/edutech/json/Tree;->locate:Ljava/util/HashMap;

    .line 59
    iget-object v1, p0, Lcom/edutech/json/Tree;->locate:Ljava/util/HashMap;

    invoke-virtual {v1, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 60
    return-object v0
.end method

.method public addLeaf(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TT;)V"
        }
    .end annotation

    .prologue
    .line 47
    .local p0, "this":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<TT;>;"
    .local p1, "root":Ljava/lang/Object;, "TT;"
    .local p2, "leaf":Ljava/lang/Object;, "TT;"
    iget-object v0, p0, Lcom/edutech/json/Tree;->locate:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 48
    iget-object v0, p0, Lcom/edutech/json/Tree;->locate:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/edutech/json/Tree;

    invoke-virtual {v0, p2}, Lcom/edutech/json/Tree;->addLeaf(Ljava/lang/Object;)Lcom/edutech/json/Tree;

    .line 52
    :goto_0
    return-void

    .line 50
    :cond_0
    invoke-virtual {p0, p1}, Lcom/edutech/json/Tree;->addLeaf(Ljava/lang/Object;)Lcom/edutech/json/Tree;

    move-result-object v0

    invoke-virtual {v0, p2}, Lcom/edutech/json/Tree;->addLeaf(Ljava/lang/Object;)Lcom/edutech/json/Tree;

    goto :goto_0
.end method

.method public getHead()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .line 74
    .local p0, "this":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<TT;>;"
    iget-object v0, p0, Lcom/edutech/json/Tree;->head:Ljava/lang/Object;

    return-object v0
.end method

.method public getParent()Lcom/edutech/json/Tree;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/edutech/json/Tree",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 100
    .local p0, "this":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<TT;>;"
    iget-object v0, p0, Lcom/edutech/json/Tree;->parent:Lcom/edutech/json/Tree;

    return-object v0
.end method

.method public getSubTrees()Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Lcom/edutech/json/Tree",
            "<TT;>;>;"
        }
    .end annotation

    .prologue
    .line 115
    .local p0, "this":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<TT;>;"
    iget-object v0, p0, Lcom/edutech/json/Tree;->leafs:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getSuccessors(Ljava/lang/Object;)Ljava/util/Collection;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)",
            "Ljava/util/Collection",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 104
    .local p0, "this":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<TT;>;"
    .local p1, "root":Ljava/lang/Object;, "TT;"
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 105
    .local v1, "successors":Ljava/util/Collection;, "Ljava/util/Collection<TT;>;"
    invoke-virtual {p0, p1}, Lcom/edutech/json/Tree;->getTree(Ljava/lang/Object;)Lcom/edutech/json/Tree;

    move-result-object v2

    .line 106
    .local v2, "tree":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<TT;>;"
    if-eqz v2, :cond_0

    .line 107
    iget-object v3, v2, Lcom/edutech/json/Tree;->leafs:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_1

    .line 111
    :cond_0
    return-object v1

    .line 107
    :cond_1
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/edutech/json/Tree;

    .line 108
    .local v0, "leaf":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<TT;>;"
    iget-object v4, v0, Lcom/edutech/json/Tree;->head:Ljava/lang/Object;

    invoke-interface {v1, v4}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method public getTree(Ljava/lang/Object;)Lcom/edutech/json/Tree;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)",
            "Lcom/edutech/json/Tree",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 78
    .local p0, "this":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<TT;>;"
    .local p1, "element":Ljava/lang/Object;, "TT;"
    iget-object v0, p0, Lcom/edutech/json/Tree;->locate:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/edutech/json/Tree;

    return-object v0
.end method

.method public getTrees(Ljava/lang/Object;)Ljava/util/ArrayList;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/edutech/json/Tree",
            "<TT;>;>;"
        }
    .end annotation

    .prologue
    .line 92
    .local p0, "this":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<TT;>;"
    .local p1, "parent":Ljava/lang/Object;, "TT;"
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 93
    .local v1, "treeList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/edutech/json/Tree<TT;>;>;"
    invoke-virtual {p0, p1}, Lcom/edutech/json/Tree;->getTree(Ljava/lang/Object;)Lcom/edutech/json/Tree;

    move-result-object v0

    .line 94
    .local v0, "tree":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<TT;>;"
    if-eqz v0, :cond_0

    .line 95
    iget-object v1, v0, Lcom/edutech/json/Tree;->leafs:Ljava/util/ArrayList;

    .line 97
    :cond_0
    return-object v1
.end method

.method public removeHead(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 89
    .local p0, "this":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<TT;>;"
    .local p1, "h":Ljava/lang/Object;, "TT;"
    iget-object v0, p0, Lcom/edutech/json/Tree;->locate:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 90
    return-void
.end method

.method public setAsParent(Ljava/lang/Object;)Lcom/edutech/json/Tree;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)",
            "Lcom/edutech/json/Tree",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 64
    .local p0, "this":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<TT;>;"
    .local p1, "parentRoot":Ljava/lang/Object;, "TT;"
    new-instance v0, Lcom/edutech/json/Tree;

    invoke-direct {v0, p1}, Lcom/edutech/json/Tree;-><init>(Ljava/lang/Object;)V

    .line 65
    .local v0, "t":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<TT;>;"
    iget-object v1, v0, Lcom/edutech/json/Tree;->leafs:Ljava/util/ArrayList;

    invoke-virtual {v1, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 66
    iput-object v0, p0, Lcom/edutech/json/Tree;->parent:Lcom/edutech/json/Tree;

    .line 67
    iget-object v1, p0, Lcom/edutech/json/Tree;->locate:Ljava/util/HashMap;

    iput-object v1, v0, Lcom/edutech/json/Tree;->locate:Ljava/util/HashMap;

    .line 68
    iget-object v1, v0, Lcom/edutech/json/Tree;->locate:Ljava/util/HashMap;

    iget-object v2, p0, Lcom/edutech/json/Tree;->head:Ljava/lang/Object;

    invoke-virtual {v1, v2, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 69
    iget-object v1, v0, Lcom/edutech/json/Tree;->locate:Ljava/util/HashMap;

    invoke-virtual {v1, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 70
    return-object v0
.end method

.method public setHead(Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 85
    .local p0, "this":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<TT;>;"
    .local p1, "h":Ljava/lang/Object;, "TT;"
    iput-object p1, p0, Lcom/edutech/json/Tree;->head:Ljava/lang/Object;

    .line 86
    iget-object v0, p0, Lcom/edutech/json/Tree;->locate:Ljava/util/HashMap;

    iget-object v1, p0, Lcom/edutech/json/Tree;->head:Ljava/lang/Object;

    invoke-virtual {v0, v1, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 87
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 129
    .local p0, "this":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<TT;>;"
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/edutech/json/Tree;->printTree(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public updateTree(Ljava/lang/Object;Lcom/edutech/json/Tree;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Lcom/edutech/json/Tree",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 81
    .local p0, "this":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<TT;>;"
    .local p1, "parent":Ljava/lang/Object;, "TT;"
    .local p2, "leafTree":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<TT;>;"
    iget-object v0, p0, Lcom/edutech/json/Tree;->locate:Ljava/util/HashMap;

    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 82
    return-void
.end method
