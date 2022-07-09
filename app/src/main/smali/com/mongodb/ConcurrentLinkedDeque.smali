.class Lcom/mongodb/ConcurrentLinkedDeque;
.super Ljava/util/AbstractCollection;
.source "ConcurrentLinkedDeque.java"

# interfaces
.implements Lcom/mongodb/Deque;
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mongodb/ConcurrentLinkedDeque$CLDIterator;,
        Lcom/mongodb/ConcurrentLinkedDeque$Node;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/AbstractCollection",
        "<TE;>;",
        "Lcom/mongodb/Deque",
        "<TE;>;",
        "Ljava/io/Serializable;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0xc29535d4a608822L


# instance fields
.field private final header:Lcom/mongodb/ConcurrentLinkedDeque$Node;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/mongodb/ConcurrentLinkedDeque$Node",
            "<TE;>;"
        }
    .end annotation
.end field

.field private final trailer:Lcom/mongodb/ConcurrentLinkedDeque$Node;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/mongodb/ConcurrentLinkedDeque$Node",
            "<TE;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    .local p0, "this":Lcom/mongodb/ConcurrentLinkedDeque;, "Lcom/mongodb/ConcurrentLinkedDeque<TE;>;"
    const/4 v2, 0x0

    .line 489
    invoke-direct {p0}, Ljava/util/AbstractCollection;-><init>()V

    .line 490
    new-instance v0, Lcom/mongodb/ConcurrentLinkedDeque$Node;

    invoke-direct {v0, v2, v2, v2}, Lcom/mongodb/ConcurrentLinkedDeque$Node;-><init>(Ljava/lang/Object;Lcom/mongodb/ConcurrentLinkedDeque$Node;Lcom/mongodb/ConcurrentLinkedDeque$Node;)V

    .line 491
    .local v0, "h":Lcom/mongodb/ConcurrentLinkedDeque$Node;, "Lcom/mongodb/ConcurrentLinkedDeque$Node<TE;>;"
    new-instance v1, Lcom/mongodb/ConcurrentLinkedDeque$Node;

    invoke-direct {v1, v2, v2, v0}, Lcom/mongodb/ConcurrentLinkedDeque$Node;-><init>(Ljava/lang/Object;Lcom/mongodb/ConcurrentLinkedDeque$Node;Lcom/mongodb/ConcurrentLinkedDeque$Node;)V

    .line 492
    .local v1, "t":Lcom/mongodb/ConcurrentLinkedDeque$Node;, "Lcom/mongodb/ConcurrentLinkedDeque$Node<TE;>;"
    invoke-virtual {v0, v1}, Lcom/mongodb/ConcurrentLinkedDeque$Node;->setNext(Lcom/mongodb/ConcurrentLinkedDeque$Node;)V

    .line 493
    iput-object v0, p0, Lcom/mongodb/ConcurrentLinkedDeque;->header:Lcom/mongodb/ConcurrentLinkedDeque$Node;

    .line 494
    iput-object v1, p0, Lcom/mongodb/ConcurrentLinkedDeque;->trailer:Lcom/mongodb/ConcurrentLinkedDeque$Node;

    .line 495
    return-void
.end method

.method public constructor <init>(Ljava/util/Collection;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<+TE;>;)V"
        }
    .end annotation

    .prologue
    .line 507
    .local p0, "this":Lcom/mongodb/ConcurrentLinkedDeque;, "Lcom/mongodb/ConcurrentLinkedDeque<TE;>;"
    .local p1, "c":Ljava/util/Collection;, "Ljava/util/Collection<+TE;>;"
    invoke-direct {p0}, Lcom/mongodb/ConcurrentLinkedDeque;-><init>()V

    .line 508
    invoke-virtual {p0, p1}, Lcom/mongodb/ConcurrentLinkedDeque;->addAll(Ljava/util/Collection;)Z

    .line 509
    return-void
.end method

.method static synthetic access$000(Lcom/mongodb/ConcurrentLinkedDeque;)Lcom/mongodb/ConcurrentLinkedDeque$Node;
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/ConcurrentLinkedDeque;

    .prologue
    .line 67
    iget-object v0, p0, Lcom/mongodb/ConcurrentLinkedDeque;->header:Lcom/mongodb/ConcurrentLinkedDeque$Node;

    return-object v0
.end method

.method private static checkNotNull(Ljava/lang/Object;)V
    .locals 1
    .param p0, "v"    # Ljava/lang/Object;

    .prologue
    .line 442
    if-nez p0, :cond_0

    .line 443
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    .line 444
    :cond_0
    return-void
.end method

.method private screenNullResult(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)TE;"
        }
    .end annotation

    .prologue
    .line 454
    .local p0, "this":Lcom/mongodb/ConcurrentLinkedDeque;, "Lcom/mongodb/ConcurrentLinkedDeque<TE;>;"
    .local p1, "v":Ljava/lang/Object;, "TE;"
    if-nez p1, :cond_0

    .line 455
    new-instance v0, Ljava/util/NoSuchElementException;

    invoke-direct {v0}, Ljava/util/NoSuchElementException;-><init>()V

    throw v0

    .line 456
    :cond_0
    return-object p1
.end method

.method private toArrayList()Ljava/util/ArrayList;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 466
    .local p0, "this":Lcom/mongodb/ConcurrentLinkedDeque;, "Lcom/mongodb/ConcurrentLinkedDeque<TE;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 467
    .local v0, "c":Ljava/util/ArrayList;, "Ljava/util/ArrayList<TE;>;"
    iget-object v2, p0, Lcom/mongodb/ConcurrentLinkedDeque;->header:Lcom/mongodb/ConcurrentLinkedDeque$Node;

    invoke-virtual {v2}, Lcom/mongodb/ConcurrentLinkedDeque$Node;->forward()Lcom/mongodb/ConcurrentLinkedDeque$Node;

    move-result-object v1

    .local v1, "n":Lcom/mongodb/ConcurrentLinkedDeque$Node;, "Lcom/mongodb/ConcurrentLinkedDeque$Node<TE;>;"
    :goto_0
    if-eqz v1, :cond_0

    .line 468
    iget-object v2, v1, Lcom/mongodb/ConcurrentLinkedDeque$Node;->element:Ljava/lang/Object;

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 467
    invoke-virtual {v1}, Lcom/mongodb/ConcurrentLinkedDeque$Node;->forward()Lcom/mongodb/ConcurrentLinkedDeque$Node;

    move-result-object v1

    goto :goto_0

    .line 469
    :cond_0
    return-object v0
.end method

.method private static usable(Lcom/mongodb/ConcurrentLinkedDeque$Node;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/mongodb/ConcurrentLinkedDeque$Node",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .line 433
    .local p0, "n":Lcom/mongodb/ConcurrentLinkedDeque$Node;, "Lcom/mongodb/ConcurrentLinkedDeque$Node<*>;"
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Lcom/mongodb/ConcurrentLinkedDeque$Node;->isSpecial()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public add(Ljava/lang/Object;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)Z"
        }
    .end annotation

    .prologue
    .line 636
    .local p0, "this":Lcom/mongodb/ConcurrentLinkedDeque;, "Lcom/mongodb/ConcurrentLinkedDeque<TE;>;"
    .local p1, "e":Ljava/lang/Object;, "TE;"
    invoke-virtual {p0, p1}, Lcom/mongodb/ConcurrentLinkedDeque;->offerLast(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public addAll(Ljava/util/Collection;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<+TE;>;)Z"
        }
    .end annotation

    .prologue
    .line 777
    .local p0, "this":Lcom/mongodb/ConcurrentLinkedDeque;, "Lcom/mongodb/ConcurrentLinkedDeque<TE;>;"
    .local p1, "c":Ljava/util/Collection;, "Ljava/util/Collection<+TE;>;"
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 778
    .local v0, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<+TE;>;"
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_0

    .line 779
    const/4 v1, 0x0

    .line 783
    :goto_0
    return v1

    .line 781
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/mongodb/ConcurrentLinkedDeque;->addLast(Ljava/lang/Object;)V

    .line 782
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_0

    .line 783
    const/4 v1, 0x1

    goto :goto_0
.end method

.method public addFirst(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)V"
        }
    .end annotation

    .prologue
    .line 517
    .local p0, "this":Lcom/mongodb/ConcurrentLinkedDeque;, "Lcom/mongodb/ConcurrentLinkedDeque<TE;>;"
    .local p1, "e":Ljava/lang/Object;, "TE;"
    invoke-static {p1}, Lcom/mongodb/ConcurrentLinkedDeque;->checkNotNull(Ljava/lang/Object;)V

    .line 518
    :cond_0
    iget-object v0, p0, Lcom/mongodb/ConcurrentLinkedDeque;->header:Lcom/mongodb/ConcurrentLinkedDeque$Node;

    invoke-virtual {v0, p1}, Lcom/mongodb/ConcurrentLinkedDeque$Node;->append(Ljava/lang/Object;)Lcom/mongodb/ConcurrentLinkedDeque$Node;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 520
    return-void
.end method

.method public addLast(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)V"
        }
    .end annotation

    .prologue
    .line 529
    .local p0, "this":Lcom/mongodb/ConcurrentLinkedDeque;, "Lcom/mongodb/ConcurrentLinkedDeque<TE;>;"
    .local p1, "e":Ljava/lang/Object;, "TE;"
    invoke-static {p1}, Lcom/mongodb/ConcurrentLinkedDeque;->checkNotNull(Ljava/lang/Object;)V

    .line 530
    :cond_0
    iget-object v0, p0, Lcom/mongodb/ConcurrentLinkedDeque;->trailer:Lcom/mongodb/ConcurrentLinkedDeque$Node;

    invoke-virtual {v0, p1}, Lcom/mongodb/ConcurrentLinkedDeque$Node;->prepend(Ljava/lang/Object;)Lcom/mongodb/ConcurrentLinkedDeque$Node;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 532
    return-void
.end method

.method public clear()V
    .locals 1

    .prologue
    .line 790
    .local p0, "this":Lcom/mongodb/ConcurrentLinkedDeque;, "Lcom/mongodb/ConcurrentLinkedDeque<TE;>;"
    :cond_0
    invoke-virtual {p0}, Lcom/mongodb/ConcurrentLinkedDeque;->pollFirst()Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_0

    .line 792
    return-void
.end method

.method public contains(Ljava/lang/Object;)Z
    .locals 3
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .local p0, "this":Lcom/mongodb/ConcurrentLinkedDeque;, "Lcom/mongodb/ConcurrentLinkedDeque<TE;>;"
    const/4 v1, 0x0

    .line 711
    if-nez p1, :cond_1

    .line 715
    :cond_0
    :goto_0
    return v1

    .line 712
    :cond_1
    iget-object v2, p0, Lcom/mongodb/ConcurrentLinkedDeque;->header:Lcom/mongodb/ConcurrentLinkedDeque$Node;

    invoke-virtual {v2}, Lcom/mongodb/ConcurrentLinkedDeque$Node;->forward()Lcom/mongodb/ConcurrentLinkedDeque$Node;

    move-result-object v0

    .local v0, "n":Lcom/mongodb/ConcurrentLinkedDeque$Node;, "Lcom/mongodb/ConcurrentLinkedDeque$Node<TE;>;"
    :goto_1
    if-eqz v0, :cond_0

    .line 713
    iget-object v2, v0, Lcom/mongodb/ConcurrentLinkedDeque$Node;->element:Ljava/lang/Object;

    invoke-virtual {p1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 714
    const/4 v1, 0x1

    goto :goto_0

    .line 712
    :cond_2
    invoke-virtual {v0}, Lcom/mongodb/ConcurrentLinkedDeque$Node;->forward()Lcom/mongodb/ConcurrentLinkedDeque$Node;

    move-result-object v0

    goto :goto_1
.end method

.method public descendingIterator()Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 897
    .local p0, "this":Lcom/mongodb/ConcurrentLinkedDeque;, "Lcom/mongodb/ConcurrentLinkedDeque<TE;>;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public element()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TE;"
        }
    .end annotation

    .prologue
    .line 642
    .local p0, "this":Lcom/mongodb/ConcurrentLinkedDeque;, "Lcom/mongodb/ConcurrentLinkedDeque<TE;>;"
    invoke-virtual {p0}, Lcom/mongodb/ConcurrentLinkedDeque;->getFirst()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getFirst()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TE;"
        }
    .end annotation

    .prologue
    .line 572
    .local p0, "this":Lcom/mongodb/ConcurrentLinkedDeque;, "Lcom/mongodb/ConcurrentLinkedDeque<TE;>;"
    invoke-virtual {p0}, Lcom/mongodb/ConcurrentLinkedDeque;->peekFirst()Ljava/lang/Object;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/mongodb/ConcurrentLinkedDeque;->screenNullResult(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getLast()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TE;"
        }
    .end annotation

    .prologue
    .line 579
    .local p0, "this":Lcom/mongodb/ConcurrentLinkedDeque;, "Lcom/mongodb/ConcurrentLinkedDeque<TE;>;"
    invoke-virtual {p0}, Lcom/mongodb/ConcurrentLinkedDeque;->peekLast()Ljava/lang/Object;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/mongodb/ConcurrentLinkedDeque;->screenNullResult(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public isEmpty()Z
    .locals 1

    .prologue
    .line 724
    .local p0, "this":Lcom/mongodb/ConcurrentLinkedDeque;, "Lcom/mongodb/ConcurrentLinkedDeque<TE;>;"
    iget-object v0, p0, Lcom/mongodb/ConcurrentLinkedDeque;->header:Lcom/mongodb/ConcurrentLinkedDeque$Node;

    invoke-virtual {v0}, Lcom/mongodb/ConcurrentLinkedDeque$Node;->successor()Lcom/mongodb/ConcurrentLinkedDeque$Node;

    move-result-object v0

    invoke-static {v0}, Lcom/mongodb/ConcurrentLinkedDeque;->usable(Lcom/mongodb/ConcurrentLinkedDeque$Node;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 865
    .local p0, "this":Lcom/mongodb/ConcurrentLinkedDeque;, "Lcom/mongodb/ConcurrentLinkedDeque<TE;>;"
    new-instance v0, Lcom/mongodb/ConcurrentLinkedDeque$CLDIterator;

    invoke-direct {v0, p0}, Lcom/mongodb/ConcurrentLinkedDeque$CLDIterator;-><init>(Lcom/mongodb/ConcurrentLinkedDeque;)V

    return-object v0
.end method

.method public offer(Ljava/lang/Object;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)Z"
        }
    .end annotation

    .prologue
    .line 626
    .local p0, "this":Lcom/mongodb/ConcurrentLinkedDeque;, "Lcom/mongodb/ConcurrentLinkedDeque<TE;>;"
    .local p1, "e":Ljava/lang/Object;, "TE;"
    invoke-virtual {p0, p1}, Lcom/mongodb/ConcurrentLinkedDeque;->offerLast(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public offerFirst(Ljava/lang/Object;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)Z"
        }
    .end annotation

    .prologue
    .line 541
    .local p0, "this":Lcom/mongodb/ConcurrentLinkedDeque;, "Lcom/mongodb/ConcurrentLinkedDeque<TE;>;"
    .local p1, "e":Ljava/lang/Object;, "TE;"
    invoke-virtual {p0, p1}, Lcom/mongodb/ConcurrentLinkedDeque;->addFirst(Ljava/lang/Object;)V

    .line 542
    const/4 v0, 0x1

    return v0
.end method

.method public offerLast(Ljava/lang/Object;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)Z"
        }
    .end annotation

    .prologue
    .line 554
    .local p0, "this":Lcom/mongodb/ConcurrentLinkedDeque;, "Lcom/mongodb/ConcurrentLinkedDeque<TE;>;"
    .local p1, "e":Ljava/lang/Object;, "TE;"
    invoke-virtual {p0, p1}, Lcom/mongodb/ConcurrentLinkedDeque;->addLast(Ljava/lang/Object;)V

    .line 555
    const/4 v0, 0x1

    return v0
.end method

.method public peek()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TE;"
        }
    .end annotation

    .prologue
    .line 641
    .local p0, "this":Lcom/mongodb/ConcurrentLinkedDeque;, "Lcom/mongodb/ConcurrentLinkedDeque<TE;>;"
    invoke-virtual {p0}, Lcom/mongodb/ConcurrentLinkedDeque;->peekFirst()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public peekFirst()Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TE;"
        }
    .end annotation

    .prologue
    .line 559
    .local p0, "this":Lcom/mongodb/ConcurrentLinkedDeque;, "Lcom/mongodb/ConcurrentLinkedDeque<TE;>;"
    iget-object v1, p0, Lcom/mongodb/ConcurrentLinkedDeque;->header:Lcom/mongodb/ConcurrentLinkedDeque$Node;

    invoke-virtual {v1}, Lcom/mongodb/ConcurrentLinkedDeque$Node;->successor()Lcom/mongodb/ConcurrentLinkedDeque$Node;

    move-result-object v0

    .line 560
    .local v0, "n":Lcom/mongodb/ConcurrentLinkedDeque$Node;, "Lcom/mongodb/ConcurrentLinkedDeque$Node<TE;>;"
    if-nez v0, :cond_0

    const/4 v1, 0x0

    :goto_0
    return-object v1

    :cond_0
    iget-object v1, v0, Lcom/mongodb/ConcurrentLinkedDeque$Node;->element:Ljava/lang/Object;

    goto :goto_0
.end method

.method public peekLast()Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TE;"
        }
    .end annotation

    .prologue
    .line 564
    .local p0, "this":Lcom/mongodb/ConcurrentLinkedDeque;, "Lcom/mongodb/ConcurrentLinkedDeque<TE;>;"
    iget-object v1, p0, Lcom/mongodb/ConcurrentLinkedDeque;->trailer:Lcom/mongodb/ConcurrentLinkedDeque$Node;

    invoke-virtual {v1}, Lcom/mongodb/ConcurrentLinkedDeque$Node;->predecessor()Lcom/mongodb/ConcurrentLinkedDeque$Node;

    move-result-object v0

    .line 565
    .local v0, "n":Lcom/mongodb/ConcurrentLinkedDeque$Node;, "Lcom/mongodb/ConcurrentLinkedDeque$Node<TE;>;"
    if-nez v0, :cond_0

    const/4 v1, 0x0

    :goto_0
    return-object v1

    :cond_0
    iget-object v1, v0, Lcom/mongodb/ConcurrentLinkedDeque$Node;->element:Ljava/lang/Object;

    goto :goto_0
.end method

.method public poll()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TE;"
        }
    .end annotation

    .prologue
    .line 639
    .local p0, "this":Lcom/mongodb/ConcurrentLinkedDeque;, "Lcom/mongodb/ConcurrentLinkedDeque<TE;>;"
    invoke-virtual {p0}, Lcom/mongodb/ConcurrentLinkedDeque;->pollFirst()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public pollFirst()Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TE;"
        }
    .end annotation

    .prologue
    .line 584
    .local p0, "this":Lcom/mongodb/ConcurrentLinkedDeque;, "Lcom/mongodb/ConcurrentLinkedDeque<TE;>;"
    :cond_0
    iget-object v1, p0, Lcom/mongodb/ConcurrentLinkedDeque;->header:Lcom/mongodb/ConcurrentLinkedDeque$Node;

    invoke-virtual {v1}, Lcom/mongodb/ConcurrentLinkedDeque$Node;->successor()Lcom/mongodb/ConcurrentLinkedDeque$Node;

    move-result-object v0

    .line 585
    .local v0, "n":Lcom/mongodb/ConcurrentLinkedDeque$Node;, "Lcom/mongodb/ConcurrentLinkedDeque$Node<TE;>;"
    invoke-static {v0}, Lcom/mongodb/ConcurrentLinkedDeque;->usable(Lcom/mongodb/ConcurrentLinkedDeque$Node;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 586
    const/4 v1, 0x0

    .line 588
    :goto_0
    return-object v1

    .line 587
    :cond_1
    invoke-virtual {v0}, Lcom/mongodb/ConcurrentLinkedDeque$Node;->delete()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 588
    iget-object v1, v0, Lcom/mongodb/ConcurrentLinkedDeque$Node;->element:Ljava/lang/Object;

    goto :goto_0
.end method

.method public pollLast()Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TE;"
        }
    .end annotation

    .prologue
    .line 594
    .local p0, "this":Lcom/mongodb/ConcurrentLinkedDeque;, "Lcom/mongodb/ConcurrentLinkedDeque<TE;>;"
    :cond_0
    iget-object v1, p0, Lcom/mongodb/ConcurrentLinkedDeque;->trailer:Lcom/mongodb/ConcurrentLinkedDeque$Node;

    invoke-virtual {v1}, Lcom/mongodb/ConcurrentLinkedDeque$Node;->predecessor()Lcom/mongodb/ConcurrentLinkedDeque$Node;

    move-result-object v0

    .line 595
    .local v0, "n":Lcom/mongodb/ConcurrentLinkedDeque$Node;, "Lcom/mongodb/ConcurrentLinkedDeque$Node<TE;>;"
    invoke-static {v0}, Lcom/mongodb/ConcurrentLinkedDeque;->usable(Lcom/mongodb/ConcurrentLinkedDeque$Node;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 596
    const/4 v1, 0x0

    .line 598
    :goto_0
    return-object v1

    .line 597
    :cond_1
    invoke-virtual {v0}, Lcom/mongodb/ConcurrentLinkedDeque$Node;->delete()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 598
    iget-object v1, v0, Lcom/mongodb/ConcurrentLinkedDeque$Node;->element:Ljava/lang/Object;

    goto :goto_0
.end method

.method public pop()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TE;"
        }
    .end annotation

    .prologue
    .line 644
    .local p0, "this":Lcom/mongodb/ConcurrentLinkedDeque;, "Lcom/mongodb/ConcurrentLinkedDeque<TE;>;"
    invoke-virtual {p0}, Lcom/mongodb/ConcurrentLinkedDeque;->removeFirst()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public push(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)V"
        }
    .end annotation

    .prologue
    .line 643
    .local p0, "this":Lcom/mongodb/ConcurrentLinkedDeque;, "Lcom/mongodb/ConcurrentLinkedDeque<TE;>;"
    .local p1, "e":Ljava/lang/Object;, "TE;"
    invoke-virtual {p0, p1}, Lcom/mongodb/ConcurrentLinkedDeque;->addFirst(Ljava/lang/Object;)V

    return-void
.end method

.method public remove()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TE;"
        }
    .end annotation

    .prologue
    .line 640
    .local p0, "this":Lcom/mongodb/ConcurrentLinkedDeque;, "Lcom/mongodb/ConcurrentLinkedDeque<TE;>;"
    invoke-virtual {p0}, Lcom/mongodb/ConcurrentLinkedDeque;->removeFirst()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public remove(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 760
    .local p0, "this":Lcom/mongodb/ConcurrentLinkedDeque;, "Lcom/mongodb/ConcurrentLinkedDeque<TE;>;"
    invoke-virtual {p0, p1}, Lcom/mongodb/ConcurrentLinkedDeque;->removeFirstOccurrence(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public removeFirst()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TE;"
        }
    .end annotation

    .prologue
    .line 606
    .local p0, "this":Lcom/mongodb/ConcurrentLinkedDeque;, "Lcom/mongodb/ConcurrentLinkedDeque<TE;>;"
    invoke-virtual {p0}, Lcom/mongodb/ConcurrentLinkedDeque;->pollFirst()Ljava/lang/Object;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/mongodb/ConcurrentLinkedDeque;->screenNullResult(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public removeFirstOccurrence(Ljava/lang/Object;)Z
    .locals 2
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 656
    .local p0, "this":Lcom/mongodb/ConcurrentLinkedDeque;, "Lcom/mongodb/ConcurrentLinkedDeque<TE;>;"
    invoke-static {p1}, Lcom/mongodb/ConcurrentLinkedDeque;->checkNotNull(Ljava/lang/Object;)V

    .line 658
    :cond_0
    iget-object v1, p0, Lcom/mongodb/ConcurrentLinkedDeque;->header:Lcom/mongodb/ConcurrentLinkedDeque$Node;

    invoke-virtual {v1}, Lcom/mongodb/ConcurrentLinkedDeque$Node;->forward()Lcom/mongodb/ConcurrentLinkedDeque$Node;

    move-result-object v0

    .line 660
    .local v0, "n":Lcom/mongodb/ConcurrentLinkedDeque$Node;, "Lcom/mongodb/ConcurrentLinkedDeque$Node<TE;>;"
    :goto_0
    if-nez v0, :cond_1

    .line 661
    const/4 v1, 0x0

    .line 664
    :goto_1
    return v1

    .line 662
    :cond_1
    iget-object v1, v0, Lcom/mongodb/ConcurrentLinkedDeque$Node;->element:Ljava/lang/Object;

    invoke-virtual {p1, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 663
    invoke-virtual {v0}, Lcom/mongodb/ConcurrentLinkedDeque$Node;->delete()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 664
    const/4 v1, 0x1

    goto :goto_1

    .line 668
    :cond_2
    invoke-virtual {v0}, Lcom/mongodb/ConcurrentLinkedDeque$Node;->forward()Lcom/mongodb/ConcurrentLinkedDeque$Node;

    move-result-object v0

    goto :goto_0
.end method

.method public removeLast()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TE;"
        }
    .end annotation

    .prologue
    .line 613
    .local p0, "this":Lcom/mongodb/ConcurrentLinkedDeque;, "Lcom/mongodb/ConcurrentLinkedDeque<TE;>;"
    invoke-virtual {p0}, Lcom/mongodb/ConcurrentLinkedDeque;->pollLast()Ljava/lang/Object;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/mongodb/ConcurrentLinkedDeque;->screenNullResult(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public removeLastOccurrence(Ljava/lang/Object;)Z
    .locals 3
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 683
    .local p0, "this":Lcom/mongodb/ConcurrentLinkedDeque;, "Lcom/mongodb/ConcurrentLinkedDeque<TE;>;"
    invoke-static {p1}, Lcom/mongodb/ConcurrentLinkedDeque;->checkNotNull(Ljava/lang/Object;)V

    .line 685
    :cond_0
    iget-object v1, p0, Lcom/mongodb/ConcurrentLinkedDeque;->trailer:Lcom/mongodb/ConcurrentLinkedDeque$Node;

    .line 687
    .local v1, "s":Lcom/mongodb/ConcurrentLinkedDeque$Node;, "Lcom/mongodb/ConcurrentLinkedDeque$Node<TE;>;"
    :goto_0
    invoke-virtual {v1}, Lcom/mongodb/ConcurrentLinkedDeque$Node;->back()Lcom/mongodb/ConcurrentLinkedDeque$Node;

    move-result-object v0

    .line 688
    .local v0, "n":Lcom/mongodb/ConcurrentLinkedDeque$Node;, "Lcom/mongodb/ConcurrentLinkedDeque$Node<TE;>;"
    invoke-virtual {v1}, Lcom/mongodb/ConcurrentLinkedDeque$Node;->isDeleted()Z

    move-result v2

    if-nez v2, :cond_0

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/mongodb/ConcurrentLinkedDeque$Node;->successor()Lcom/mongodb/ConcurrentLinkedDeque$Node;

    move-result-object v2

    if-ne v2, v1, :cond_0

    .line 690
    :cond_1
    if-nez v0, :cond_2

    .line 691
    const/4 v2, 0x0

    .line 694
    :goto_1
    return v2

    .line 692
    :cond_2
    iget-object v2, v0, Lcom/mongodb/ConcurrentLinkedDeque$Node;->element:Ljava/lang/Object;

    invoke-virtual {p1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 693
    invoke-virtual {v0}, Lcom/mongodb/ConcurrentLinkedDeque$Node;->delete()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 694
    const/4 v2, 0x1

    goto :goto_1

    .line 698
    :cond_3
    move-object v1, v0

    .line 699
    goto :goto_0
.end method

.method public size()I
    .locals 6

    .prologue
    .line 744
    .local p0, "this":Lcom/mongodb/ConcurrentLinkedDeque;, "Lcom/mongodb/ConcurrentLinkedDeque<TE;>;"
    const-wide/16 v0, 0x0

    .line 745
    .local v0, "count":J
    iget-object v3, p0, Lcom/mongodb/ConcurrentLinkedDeque;->header:Lcom/mongodb/ConcurrentLinkedDeque$Node;

    invoke-virtual {v3}, Lcom/mongodb/ConcurrentLinkedDeque$Node;->forward()Lcom/mongodb/ConcurrentLinkedDeque$Node;

    move-result-object v2

    .local v2, "n":Lcom/mongodb/ConcurrentLinkedDeque$Node;, "Lcom/mongodb/ConcurrentLinkedDeque$Node<TE;>;"
    :goto_0
    if-eqz v2, :cond_0

    .line 746
    const-wide/16 v4, 0x1

    add-long/2addr v0, v4

    .line 745
    invoke-virtual {v2}, Lcom/mongodb/ConcurrentLinkedDeque$Node;->forward()Lcom/mongodb/ConcurrentLinkedDeque$Node;

    move-result-object v2

    goto :goto_0

    .line 747
    :cond_0
    const-wide/32 v4, 0x7fffffff

    cmp-long v3, v0, v4

    if-ltz v3, :cond_1

    const v3, 0x7fffffff

    :goto_1
    return v3

    :cond_1
    long-to-int v3, v0

    goto :goto_1
.end method

.method public toArray()[Ljava/lang/Object;
    .locals 1

    .prologue
    .line 808
    .local p0, "this":Lcom/mongodb/ConcurrentLinkedDeque;, "Lcom/mongodb/ConcurrentLinkedDeque<TE;>;"
    invoke-direct {p0}, Lcom/mongodb/ConcurrentLinkedDeque;->toArrayList()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->toArray()[Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public toArray([Ljava/lang/Object;)[Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([TT;)[TT;"
        }
    .end annotation

    .prologue
    .line 849
    .local p0, "this":Lcom/mongodb/ConcurrentLinkedDeque;, "Lcom/mongodb/ConcurrentLinkedDeque<TE;>;"
    .local p1, "a":[Ljava/lang/Object;, "[TT;"
    invoke-direct {p0}, Lcom/mongodb/ConcurrentLinkedDeque;->toArrayList()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method
