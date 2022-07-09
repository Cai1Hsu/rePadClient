.class final Lcom/mongodb/ConcurrentLinkedDeque$Node;
.super Ljava/util/concurrent/atomic/AtomicReference;
.source "ConcurrentLinkedDeque.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mongodb/ConcurrentLinkedDeque;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Node"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/concurrent/atomic/AtomicReference",
        "<",
        "Lcom/mongodb/ConcurrentLinkedDeque$Node",
        "<TE;>;>;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0xc29535d4a608822L


# instance fields
.field final element:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TE;"
        }
    .end annotation
.end field

.field private volatile prev:Lcom/mongodb/ConcurrentLinkedDeque$Node;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/mongodb/ConcurrentLinkedDeque$Node",
            "<TE;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lcom/mongodb/ConcurrentLinkedDeque$Node;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/mongodb/ConcurrentLinkedDeque$Node",
            "<TE;>;)V"
        }
    .end annotation

    .prologue
    .line 152
    .local p0, "this":Lcom/mongodb/ConcurrentLinkedDeque$Node;, "Lcom/mongodb/ConcurrentLinkedDeque$Node<TE;>;"
    .local p1, "next":Lcom/mongodb/ConcurrentLinkedDeque$Node;, "Lcom/mongodb/ConcurrentLinkedDeque$Node<TE;>;"
    invoke-direct {p0, p1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    .line 153
    iput-object p0, p0, Lcom/mongodb/ConcurrentLinkedDeque$Node;->prev:Lcom/mongodb/ConcurrentLinkedDeque$Node;

    .line 154
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mongodb/ConcurrentLinkedDeque$Node;->element:Ljava/lang/Object;

    .line 155
    return-void
.end method

.method constructor <init>(Ljava/lang/Object;Lcom/mongodb/ConcurrentLinkedDeque$Node;Lcom/mongodb/ConcurrentLinkedDeque$Node;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;",
            "Lcom/mongodb/ConcurrentLinkedDeque$Node",
            "<TE;>;",
            "Lcom/mongodb/ConcurrentLinkedDeque$Node",
            "<TE;>;)V"
        }
    .end annotation

    .prologue
    .line 145
    .local p0, "this":Lcom/mongodb/ConcurrentLinkedDeque$Node;, "Lcom/mongodb/ConcurrentLinkedDeque$Node<TE;>;"
    .local p1, "element":Ljava/lang/Object;, "TE;"
    .local p2, "next":Lcom/mongodb/ConcurrentLinkedDeque$Node;, "Lcom/mongodb/ConcurrentLinkedDeque$Node<TE;>;"
    .local p3, "prev":Lcom/mongodb/ConcurrentLinkedDeque$Node;, "Lcom/mongodb/ConcurrentLinkedDeque$Node<TE;>;"
    invoke-direct {p0, p2}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    .line 146
    iput-object p3, p0, Lcom/mongodb/ConcurrentLinkedDeque$Node;->prev:Lcom/mongodb/ConcurrentLinkedDeque$Node;

    .line 147
    iput-object p1, p0, Lcom/mongodb/ConcurrentLinkedDeque$Node;->element:Ljava/lang/Object;

    .line 148
    return-void
.end method

.method private casNext(Lcom/mongodb/ConcurrentLinkedDeque$Node;Lcom/mongodb/ConcurrentLinkedDeque$Node;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/mongodb/ConcurrentLinkedDeque$Node",
            "<TE;>;",
            "Lcom/mongodb/ConcurrentLinkedDeque$Node",
            "<TE;>;)Z"
        }
    .end annotation

    .prologue
    .line 177
    .local p0, "this":Lcom/mongodb/ConcurrentLinkedDeque$Node;, "Lcom/mongodb/ConcurrentLinkedDeque$Node<TE;>;"
    .local p1, "cmp":Lcom/mongodb/ConcurrentLinkedDeque$Node;, "Lcom/mongodb/ConcurrentLinkedDeque$Node<TE;>;"
    .local p2, "val":Lcom/mongodb/ConcurrentLinkedDeque$Node;, "Lcom/mongodb/ConcurrentLinkedDeque$Node<TE;>;"
    invoke-virtual {p0, p1, p2}, Lcom/mongodb/ConcurrentLinkedDeque$Node;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method private findPredecessorOf(Lcom/mongodb/ConcurrentLinkedDeque$Node;)Lcom/mongodb/ConcurrentLinkedDeque$Node;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/mongodb/ConcurrentLinkedDeque$Node",
            "<TE;>;)",
            "Lcom/mongodb/ConcurrentLinkedDeque$Node",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 275
    .local p0, "this":Lcom/mongodb/ConcurrentLinkedDeque$Node;, "Lcom/mongodb/ConcurrentLinkedDeque$Node<TE;>;"
    .local p1, "target":Lcom/mongodb/ConcurrentLinkedDeque$Node;, "Lcom/mongodb/ConcurrentLinkedDeque$Node<TE;>;"
    move-object v1, p0

    .line 277
    .local v1, "n":Lcom/mongodb/ConcurrentLinkedDeque$Node;, "Lcom/mongodb/ConcurrentLinkedDeque$Node<TE;>;"
    :goto_0
    invoke-virtual {v1}, Lcom/mongodb/ConcurrentLinkedDeque$Node;->successor()Lcom/mongodb/ConcurrentLinkedDeque$Node;

    move-result-object v0

    .line 278
    .local v0, "f":Lcom/mongodb/ConcurrentLinkedDeque$Node;, "Lcom/mongodb/ConcurrentLinkedDeque$Node<TE;>;"
    if-ne v0, p1, :cond_0

    .line 281
    .end local v1    # "n":Lcom/mongodb/ConcurrentLinkedDeque$Node;, "Lcom/mongodb/ConcurrentLinkedDeque$Node<TE;>;"
    :goto_1
    return-object v1

    .line 280
    .restart local v1    # "n":Lcom/mongodb/ConcurrentLinkedDeque$Node;, "Lcom/mongodb/ConcurrentLinkedDeque$Node<TE;>;"
    :cond_0
    if-nez v0, :cond_1

    .line 281
    const/4 v1, 0x0

    goto :goto_1

    .line 282
    :cond_1
    move-object v1, v0

    .line 283
    goto :goto_0
.end method

.method private getNext()Lcom/mongodb/ConcurrentLinkedDeque$Node;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/mongodb/ConcurrentLinkedDeque$Node",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 162
    .local p0, "this":Lcom/mongodb/ConcurrentLinkedDeque$Node;, "Lcom/mongodb/ConcurrentLinkedDeque$Node<TE;>;"
    invoke-virtual {p0}, Lcom/mongodb/ConcurrentLinkedDeque$Node;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mongodb/ConcurrentLinkedDeque$Node;

    return-object v0
.end method

.method private getPrev()Lcom/mongodb/ConcurrentLinkedDeque$Node;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/mongodb/ConcurrentLinkedDeque$Node",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 184
    .local p0, "this":Lcom/mongodb/ConcurrentLinkedDeque$Node;, "Lcom/mongodb/ConcurrentLinkedDeque$Node<TE;>;"
    iget-object v0, p0, Lcom/mongodb/ConcurrentLinkedDeque$Node;->prev:Lcom/mongodb/ConcurrentLinkedDeque$Node;

    return-object v0
.end method

.method private nextNonmarker()Lcom/mongodb/ConcurrentLinkedDeque$Node;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/mongodb/ConcurrentLinkedDeque$Node",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 238
    .local p0, "this":Lcom/mongodb/ConcurrentLinkedDeque$Node;, "Lcom/mongodb/ConcurrentLinkedDeque$Node<TE;>;"
    invoke-direct {p0}, Lcom/mongodb/ConcurrentLinkedDeque$Node;->getNext()Lcom/mongodb/ConcurrentLinkedDeque$Node;

    move-result-object v0

    .line 239
    .local v0, "f":Lcom/mongodb/ConcurrentLinkedDeque$Node;, "Lcom/mongodb/ConcurrentLinkedDeque$Node<TE;>;"
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/mongodb/ConcurrentLinkedDeque$Node;->isMarker()Z

    move-result v1

    if-nez v1, :cond_1

    .end local v0    # "f":Lcom/mongodb/ConcurrentLinkedDeque$Node;, "Lcom/mongodb/ConcurrentLinkedDeque$Node<TE;>;"
    :cond_0
    :goto_0
    return-object v0

    .restart local v0    # "f":Lcom/mongodb/ConcurrentLinkedDeque$Node;, "Lcom/mongodb/ConcurrentLinkedDeque$Node<TE;>;"
    :cond_1
    invoke-direct {v0}, Lcom/mongodb/ConcurrentLinkedDeque$Node;->getNext()Lcom/mongodb/ConcurrentLinkedDeque$Node;

    move-result-object v0

    goto :goto_0
.end method


# virtual methods
.method append(Ljava/lang/Object;)Lcom/mongodb/ConcurrentLinkedDeque$Node;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)",
            "Lcom/mongodb/ConcurrentLinkedDeque$Node",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 345
    .local p0, "this":Lcom/mongodb/ConcurrentLinkedDeque$Node;, "Lcom/mongodb/ConcurrentLinkedDeque$Node<TE;>;"
    .local p1, "element":Ljava/lang/Object;, "TE;"
    :cond_0
    invoke-direct {p0}, Lcom/mongodb/ConcurrentLinkedDeque$Node;->getNext()Lcom/mongodb/ConcurrentLinkedDeque$Node;

    move-result-object v0

    .line 346
    .local v0, "f":Lcom/mongodb/ConcurrentLinkedDeque$Node;, "Lcom/mongodb/ConcurrentLinkedDeque$Node<TE;>;"
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/mongodb/ConcurrentLinkedDeque$Node;->isMarker()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 347
    :cond_1
    const/4 v1, 0x0

    .line 351
    :goto_0
    return-object v1

    .line 348
    :cond_2
    new-instance v1, Lcom/mongodb/ConcurrentLinkedDeque$Node;

    invoke-direct {v1, p1, v0, p0}, Lcom/mongodb/ConcurrentLinkedDeque$Node;-><init>(Ljava/lang/Object;Lcom/mongodb/ConcurrentLinkedDeque$Node;Lcom/mongodb/ConcurrentLinkedDeque$Node;)V

    .line 349
    .local v1, "x":Lcom/mongodb/ConcurrentLinkedDeque$Node;, "Lcom/mongodb/ConcurrentLinkedDeque$Node<TE;>;"
    invoke-direct {p0, v0, v1}, Lcom/mongodb/ConcurrentLinkedDeque$Node;->casNext(Lcom/mongodb/ConcurrentLinkedDeque$Node;Lcom/mongodb/ConcurrentLinkedDeque$Node;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 350
    invoke-virtual {v0, v1}, Lcom/mongodb/ConcurrentLinkedDeque$Node;->setPrev(Lcom/mongodb/ConcurrentLinkedDeque$Node;)V

    goto :goto_0
.end method

.method back()Lcom/mongodb/ConcurrentLinkedDeque$Node;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/mongodb/ConcurrentLinkedDeque$Node",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 332
    .local p0, "this":Lcom/mongodb/ConcurrentLinkedDeque$Node;, "Lcom/mongodb/ConcurrentLinkedDeque$Node<TE;>;"
    invoke-virtual {p0}, Lcom/mongodb/ConcurrentLinkedDeque$Node;->predecessor()Lcom/mongodb/ConcurrentLinkedDeque$Node;

    move-result-object v0

    .line 333
    .local v0, "f":Lcom/mongodb/ConcurrentLinkedDeque$Node;, "Lcom/mongodb/ConcurrentLinkedDeque$Node<TE;>;"
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/mongodb/ConcurrentLinkedDeque$Node;->isSpecial()Z

    move-result v1

    if-eqz v1, :cond_1

    :cond_0
    const/4 v0, 0x0

    .end local v0    # "f":Lcom/mongodb/ConcurrentLinkedDeque$Node;, "Lcom/mongodb/ConcurrentLinkedDeque$Node<TE;>;"
    :cond_1
    return-object v0
.end method

.method delete()Z
    .locals 3

    .prologue
    .line 383
    .local p0, "this":Lcom/mongodb/ConcurrentLinkedDeque$Node;, "Lcom/mongodb/ConcurrentLinkedDeque$Node<TE;>;"
    invoke-direct {p0}, Lcom/mongodb/ConcurrentLinkedDeque$Node;->getPrev()Lcom/mongodb/ConcurrentLinkedDeque$Node;

    move-result-object v0

    .line 384
    .local v0, "b":Lcom/mongodb/ConcurrentLinkedDeque$Node;, "Lcom/mongodb/ConcurrentLinkedDeque$Node<TE;>;"
    invoke-direct {p0}, Lcom/mongodb/ConcurrentLinkedDeque$Node;->getNext()Lcom/mongodb/ConcurrentLinkedDeque$Node;

    move-result-object v1

    .line 385
    .local v1, "f":Lcom/mongodb/ConcurrentLinkedDeque$Node;, "Lcom/mongodb/ConcurrentLinkedDeque$Node<TE;>;"
    if-eqz v0, :cond_1

    if-eqz v1, :cond_1

    invoke-virtual {v1}, Lcom/mongodb/ConcurrentLinkedDeque$Node;->isMarker()Z

    move-result v2

    if-nez v2, :cond_1

    new-instance v2, Lcom/mongodb/ConcurrentLinkedDeque$Node;

    invoke-direct {v2, v1}, Lcom/mongodb/ConcurrentLinkedDeque$Node;-><init>(Lcom/mongodb/ConcurrentLinkedDeque$Node;)V

    invoke-direct {p0, v1, v2}, Lcom/mongodb/ConcurrentLinkedDeque$Node;->casNext(Lcom/mongodb/ConcurrentLinkedDeque$Node;Lcom/mongodb/ConcurrentLinkedDeque$Node;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 387
    invoke-direct {v0, p0, v1}, Lcom/mongodb/ConcurrentLinkedDeque$Node;->casNext(Lcom/mongodb/ConcurrentLinkedDeque$Node;Lcom/mongodb/ConcurrentLinkedDeque$Node;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 388
    invoke-virtual {v1, v0}, Lcom/mongodb/ConcurrentLinkedDeque$Node;->setPrev(Lcom/mongodb/ConcurrentLinkedDeque$Node;)V

    .line 389
    :cond_0
    const/4 v2, 0x1

    .line 391
    :goto_0
    return v2

    :cond_1
    const/4 v2, 0x0

    goto :goto_0
.end method

.method forward()Lcom/mongodb/ConcurrentLinkedDeque$Node;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/mongodb/ConcurrentLinkedDeque$Node",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 319
    .local p0, "this":Lcom/mongodb/ConcurrentLinkedDeque$Node;, "Lcom/mongodb/ConcurrentLinkedDeque$Node<TE;>;"
    invoke-virtual {p0}, Lcom/mongodb/ConcurrentLinkedDeque$Node;->successor()Lcom/mongodb/ConcurrentLinkedDeque$Node;

    move-result-object v0

    .line 320
    .local v0, "f":Lcom/mongodb/ConcurrentLinkedDeque$Node;, "Lcom/mongodb/ConcurrentLinkedDeque$Node<TE;>;"
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/mongodb/ConcurrentLinkedDeque$Node;->isSpecial()Z

    move-result v1

    if-eqz v1, :cond_1

    :cond_0
    const/4 v0, 0x0

    .end local v0    # "f":Lcom/mongodb/ConcurrentLinkedDeque$Node;, "Lcom/mongodb/ConcurrentLinkedDeque$Node<TE;>;"
    :cond_1
    return-object v0
.end method

.method isDeleted()Z
    .locals 2

    .prologue
    .line 230
    .local p0, "this":Lcom/mongodb/ConcurrentLinkedDeque$Node;, "Lcom/mongodb/ConcurrentLinkedDeque$Node<TE;>;"
    invoke-direct {p0}, Lcom/mongodb/ConcurrentLinkedDeque$Node;->getNext()Lcom/mongodb/ConcurrentLinkedDeque$Node;

    move-result-object v0

    .line 231
    .local v0, "f":Lcom/mongodb/ConcurrentLinkedDeque$Node;, "Lcom/mongodb/ConcurrentLinkedDeque$Node<TE;>;"
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/mongodb/ConcurrentLinkedDeque$Node;->isMarker()Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method isHeader()Z
    .locals 1

    .prologue
    .line 213
    .local p0, "this":Lcom/mongodb/ConcurrentLinkedDeque$Node;, "Lcom/mongodb/ConcurrentLinkedDeque$Node<TE;>;"
    invoke-direct {p0}, Lcom/mongodb/ConcurrentLinkedDeque$Node;->getPrev()Lcom/mongodb/ConcurrentLinkedDeque$Node;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method isMarker()Z
    .locals 1

    .prologue
    .line 220
    .local p0, "this":Lcom/mongodb/ConcurrentLinkedDeque$Node;, "Lcom/mongodb/ConcurrentLinkedDeque$Node<TE;>;"
    invoke-direct {p0}, Lcom/mongodb/ConcurrentLinkedDeque$Node;->getPrev()Lcom/mongodb/ConcurrentLinkedDeque$Node;

    move-result-object v0

    if-ne v0, p0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method isSpecial()Z
    .locals 1

    .prologue
    .line 199
    .local p0, "this":Lcom/mongodb/ConcurrentLinkedDeque$Node;, "Lcom/mongodb/ConcurrentLinkedDeque$Node<TE;>;"
    iget-object v0, p0, Lcom/mongodb/ConcurrentLinkedDeque$Node;->element:Ljava/lang/Object;

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method isTrailer()Z
    .locals 1

    .prologue
    .line 206
    .local p0, "this":Lcom/mongodb/ConcurrentLinkedDeque$Node;, "Lcom/mongodb/ConcurrentLinkedDeque$Node<TE;>;"
    invoke-direct {p0}, Lcom/mongodb/ConcurrentLinkedDeque$Node;->getNext()Lcom/mongodb/ConcurrentLinkedDeque$Node;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method predecessor()Lcom/mongodb/ConcurrentLinkedDeque$Node;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/mongodb/ConcurrentLinkedDeque$Node",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 295
    .local p0, "this":Lcom/mongodb/ConcurrentLinkedDeque$Node;, "Lcom/mongodb/ConcurrentLinkedDeque$Node<TE;>;"
    move-object v1, p0

    .line 297
    .local v1, "n":Lcom/mongodb/ConcurrentLinkedDeque$Node;, "Lcom/mongodb/ConcurrentLinkedDeque$Node<TE;>;"
    :goto_0
    invoke-direct {v1}, Lcom/mongodb/ConcurrentLinkedDeque$Node;->getPrev()Lcom/mongodb/ConcurrentLinkedDeque$Node;

    move-result-object v0

    .line 298
    .local v0, "b":Lcom/mongodb/ConcurrentLinkedDeque$Node;, "Lcom/mongodb/ConcurrentLinkedDeque$Node<TE;>;"
    if-nez v0, :cond_1

    .line 299
    invoke-direct {v1, p0}, Lcom/mongodb/ConcurrentLinkedDeque$Node;->findPredecessorOf(Lcom/mongodb/ConcurrentLinkedDeque$Node;)Lcom/mongodb/ConcurrentLinkedDeque$Node;

    move-result-object v0

    .line 306
    .end local v0    # "b":Lcom/mongodb/ConcurrentLinkedDeque$Node;, "Lcom/mongodb/ConcurrentLinkedDeque$Node<TE;>;"
    :cond_0
    :goto_1
    return-object v0

    .line 300
    .restart local v0    # "b":Lcom/mongodb/ConcurrentLinkedDeque$Node;, "Lcom/mongodb/ConcurrentLinkedDeque$Node<TE;>;"
    :cond_1
    invoke-direct {v0}, Lcom/mongodb/ConcurrentLinkedDeque$Node;->getNext()Lcom/mongodb/ConcurrentLinkedDeque$Node;

    move-result-object v3

    .line 301
    .local v3, "s":Lcom/mongodb/ConcurrentLinkedDeque$Node;, "Lcom/mongodb/ConcurrentLinkedDeque$Node<TE;>;"
    if-eq v3, p0, :cond_0

    .line 303
    if-eqz v3, :cond_2

    invoke-virtual {v3}, Lcom/mongodb/ConcurrentLinkedDeque$Node;->isMarker()Z

    move-result v4

    if-nez v4, :cond_3

    .line 304
    :cond_2
    invoke-direct {v0, p0}, Lcom/mongodb/ConcurrentLinkedDeque$Node;->findPredecessorOf(Lcom/mongodb/ConcurrentLinkedDeque$Node;)Lcom/mongodb/ConcurrentLinkedDeque$Node;

    move-result-object v2

    .line 305
    .local v2, "p":Lcom/mongodb/ConcurrentLinkedDeque$Node;, "Lcom/mongodb/ConcurrentLinkedDeque$Node<TE;>;"
    if-eqz v2, :cond_3

    move-object v0, v2

    .line 306
    goto :goto_1

    .line 308
    .end local v2    # "p":Lcom/mongodb/ConcurrentLinkedDeque$Node;, "Lcom/mongodb/ConcurrentLinkedDeque$Node<TE;>;"
    :cond_3
    move-object v1, v0

    .line 309
    goto :goto_0
.end method

.method prepend(Ljava/lang/Object;)Lcom/mongodb/ConcurrentLinkedDeque$Node;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)",
            "Lcom/mongodb/ConcurrentLinkedDeque$Node",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 365
    .local p0, "this":Lcom/mongodb/ConcurrentLinkedDeque$Node;, "Lcom/mongodb/ConcurrentLinkedDeque$Node<TE;>;"
    .local p1, "element":Ljava/lang/Object;, "TE;"
    :cond_0
    invoke-virtual {p0}, Lcom/mongodb/ConcurrentLinkedDeque$Node;->predecessor()Lcom/mongodb/ConcurrentLinkedDeque$Node;

    move-result-object v0

    .line 366
    .local v0, "b":Lcom/mongodb/ConcurrentLinkedDeque$Node;, "Lcom/mongodb/ConcurrentLinkedDeque$Node<TE;>;"
    if-nez v0, :cond_1

    .line 367
    const/4 v1, 0x0

    .line 371
    :goto_0
    return-object v1

    .line 368
    :cond_1
    new-instance v1, Lcom/mongodb/ConcurrentLinkedDeque$Node;

    invoke-direct {v1, p1, p0, v0}, Lcom/mongodb/ConcurrentLinkedDeque$Node;-><init>(Ljava/lang/Object;Lcom/mongodb/ConcurrentLinkedDeque$Node;Lcom/mongodb/ConcurrentLinkedDeque$Node;)V

    .line 369
    .local v1, "x":Lcom/mongodb/ConcurrentLinkedDeque$Node;, "Lcom/mongodb/ConcurrentLinkedDeque$Node<TE;>;"
    invoke-direct {v0, p0, v1}, Lcom/mongodb/ConcurrentLinkedDeque$Node;->casNext(Lcom/mongodb/ConcurrentLinkedDeque$Node;Lcom/mongodb/ConcurrentLinkedDeque$Node;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 370
    invoke-virtual {p0, v1}, Lcom/mongodb/ConcurrentLinkedDeque$Node;->setPrev(Lcom/mongodb/ConcurrentLinkedDeque$Node;)V

    goto :goto_0
.end method

.method replace(Ljava/lang/Object;)Lcom/mongodb/ConcurrentLinkedDeque$Node;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)",
            "Lcom/mongodb/ConcurrentLinkedDeque$Node",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 409
    .local p0, "this":Lcom/mongodb/ConcurrentLinkedDeque$Node;, "Lcom/mongodb/ConcurrentLinkedDeque$Node<TE;>;"
    .local p1, "newElement":Ljava/lang/Object;, "TE;"
    :cond_0
    invoke-direct {p0}, Lcom/mongodb/ConcurrentLinkedDeque$Node;->getPrev()Lcom/mongodb/ConcurrentLinkedDeque$Node;

    move-result-object v0

    .line 410
    .local v0, "b":Lcom/mongodb/ConcurrentLinkedDeque$Node;, "Lcom/mongodb/ConcurrentLinkedDeque$Node<TE;>;"
    invoke-direct {p0}, Lcom/mongodb/ConcurrentLinkedDeque$Node;->getNext()Lcom/mongodb/ConcurrentLinkedDeque$Node;

    move-result-object v1

    .line 411
    .local v1, "f":Lcom/mongodb/ConcurrentLinkedDeque$Node;, "Lcom/mongodb/ConcurrentLinkedDeque$Node<TE;>;"
    if-eqz v0, :cond_1

    if-eqz v1, :cond_1

    invoke-virtual {v1}, Lcom/mongodb/ConcurrentLinkedDeque$Node;->isMarker()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 412
    :cond_1
    const/4 v2, 0x0

    .line 417
    :goto_0
    return-object v2

    .line 413
    :cond_2
    new-instance v2, Lcom/mongodb/ConcurrentLinkedDeque$Node;

    invoke-direct {v2, p1, v1, v0}, Lcom/mongodb/ConcurrentLinkedDeque$Node;-><init>(Ljava/lang/Object;Lcom/mongodb/ConcurrentLinkedDeque$Node;Lcom/mongodb/ConcurrentLinkedDeque$Node;)V

    .line 414
    .local v2, "x":Lcom/mongodb/ConcurrentLinkedDeque$Node;, "Lcom/mongodb/ConcurrentLinkedDeque$Node<TE;>;"
    new-instance v3, Lcom/mongodb/ConcurrentLinkedDeque$Node;

    invoke-direct {v3, v2}, Lcom/mongodb/ConcurrentLinkedDeque$Node;-><init>(Lcom/mongodb/ConcurrentLinkedDeque$Node;)V

    invoke-direct {p0, v1, v3}, Lcom/mongodb/ConcurrentLinkedDeque$Node;->casNext(Lcom/mongodb/ConcurrentLinkedDeque$Node;Lcom/mongodb/ConcurrentLinkedDeque$Node;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 415
    invoke-virtual {v0}, Lcom/mongodb/ConcurrentLinkedDeque$Node;->successor()Lcom/mongodb/ConcurrentLinkedDeque$Node;

    .line 416
    invoke-virtual {v2}, Lcom/mongodb/ConcurrentLinkedDeque$Node;->successor()Lcom/mongodb/ConcurrentLinkedDeque$Node;

    goto :goto_0
.end method

.method setNext(Lcom/mongodb/ConcurrentLinkedDeque$Node;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/mongodb/ConcurrentLinkedDeque$Node",
            "<TE;>;)V"
        }
    .end annotation

    .prologue
    .line 170
    .local p0, "this":Lcom/mongodb/ConcurrentLinkedDeque$Node;, "Lcom/mongodb/ConcurrentLinkedDeque$Node<TE;>;"
    .local p1, "n":Lcom/mongodb/ConcurrentLinkedDeque$Node;, "Lcom/mongodb/ConcurrentLinkedDeque$Node<TE;>;"
    invoke-virtual {p0, p1}, Lcom/mongodb/ConcurrentLinkedDeque$Node;->set(Ljava/lang/Object;)V

    .line 171
    return-void
.end method

.method setPrev(Lcom/mongodb/ConcurrentLinkedDeque$Node;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/mongodb/ConcurrentLinkedDeque$Node",
            "<TE;>;)V"
        }
    .end annotation

    .prologue
    .line 192
    .local p0, "this":Lcom/mongodb/ConcurrentLinkedDeque$Node;, "Lcom/mongodb/ConcurrentLinkedDeque$Node<TE;>;"
    .local p1, "b":Lcom/mongodb/ConcurrentLinkedDeque$Node;, "Lcom/mongodb/ConcurrentLinkedDeque$Node<TE;>;"
    iput-object p1, p0, Lcom/mongodb/ConcurrentLinkedDeque$Node;->prev:Lcom/mongodb/ConcurrentLinkedDeque$Node;

    .line 193
    return-void
.end method

.method successor()Lcom/mongodb/ConcurrentLinkedDeque$Node;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/mongodb/ConcurrentLinkedDeque$Node",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 251
    .local p0, "this":Lcom/mongodb/ConcurrentLinkedDeque$Node;, "Lcom/mongodb/ConcurrentLinkedDeque$Node<TE;>;"
    invoke-direct {p0}, Lcom/mongodb/ConcurrentLinkedDeque$Node;->nextNonmarker()Lcom/mongodb/ConcurrentLinkedDeque$Node;

    move-result-object v0

    .line 253
    .local v0, "f":Lcom/mongodb/ConcurrentLinkedDeque$Node;, "Lcom/mongodb/ConcurrentLinkedDeque$Node<TE;>;"
    :goto_0
    if-nez v0, :cond_1

    .line 254
    const/4 v0, 0x0

    .line 258
    .end local v0    # "f":Lcom/mongodb/ConcurrentLinkedDeque$Node;, "Lcom/mongodb/ConcurrentLinkedDeque$Node<TE;>;"
    :cond_0
    :goto_1
    return-object v0

    .line 255
    .restart local v0    # "f":Lcom/mongodb/ConcurrentLinkedDeque$Node;, "Lcom/mongodb/ConcurrentLinkedDeque$Node<TE;>;"
    :cond_1
    invoke-virtual {v0}, Lcom/mongodb/ConcurrentLinkedDeque$Node;->isDeleted()Z

    move-result v2

    if-nez v2, :cond_2

    .line 256
    invoke-direct {v0}, Lcom/mongodb/ConcurrentLinkedDeque$Node;->getPrev()Lcom/mongodb/ConcurrentLinkedDeque$Node;

    move-result-object v2

    if-eq v2, p0, :cond_0

    invoke-virtual {p0}, Lcom/mongodb/ConcurrentLinkedDeque$Node;->isDeleted()Z

    move-result v2

    if-nez v2, :cond_0

    .line 257
    invoke-virtual {v0, p0}, Lcom/mongodb/ConcurrentLinkedDeque$Node;->setPrev(Lcom/mongodb/ConcurrentLinkedDeque$Node;)V

    goto :goto_1

    .line 260
    :cond_2
    invoke-direct {v0}, Lcom/mongodb/ConcurrentLinkedDeque$Node;->nextNonmarker()Lcom/mongodb/ConcurrentLinkedDeque$Node;

    move-result-object v1

    .line 261
    .local v1, "s":Lcom/mongodb/ConcurrentLinkedDeque$Node;, "Lcom/mongodb/ConcurrentLinkedDeque$Node<TE;>;"
    invoke-direct {p0}, Lcom/mongodb/ConcurrentLinkedDeque$Node;->getNext()Lcom/mongodb/ConcurrentLinkedDeque$Node;

    move-result-object v2

    if-ne v0, v2, :cond_3

    .line 262
    invoke-direct {p0, v0, v1}, Lcom/mongodb/ConcurrentLinkedDeque$Node;->casNext(Lcom/mongodb/ConcurrentLinkedDeque$Node;Lcom/mongodb/ConcurrentLinkedDeque$Node;)Z

    .line 263
    :cond_3
    move-object v0, v1

    .line 264
    goto :goto_0
.end method
