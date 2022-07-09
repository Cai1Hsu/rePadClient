.class public Lorg/apache/tools/ant/types/resources/LazyResourceCollectionWrapper;
.super Lorg/apache/tools/ant/types/resources/AbstractResourceCollectionWrapper;
.source "LazyResourceCollectionWrapper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/types/resources/LazyResourceCollectionWrapper$CachedIterator;,
        Lorg/apache/tools/ant/types/resources/LazyResourceCollectionWrapper$FilteringIterator;
    }
.end annotation


# instance fields
.field private cachedResources:Ljava/util/List;

.field private filteringIterator:Lorg/apache/tools/ant/types/resources/LazyResourceCollectionWrapper$FilteringIterator;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 14
    invoke-direct {p0}, Lorg/apache/tools/ant/types/resources/AbstractResourceCollectionWrapper;-><init>()V

    .line 18
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/types/resources/LazyResourceCollectionWrapper;->cachedResources:Ljava/util/List;

    .line 107
    return-void
.end method

.method static access$000(Lorg/apache/tools/ant/types/resources/LazyResourceCollectionWrapper;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lorg/apache/tools/ant/types/resources/LazyResourceCollectionWrapper;

    .prologue
    .line 14
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/LazyResourceCollectionWrapper;->cachedResources:Ljava/util/List;

    return-object v0
.end method


# virtual methods
.method protected createIterator()Ljava/util/Iterator;
    .locals 3

    .prologue
    .line 24
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/LazyResourceCollectionWrapper;->isCache()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 25
    iget-object v1, p0, Lorg/apache/tools/ant/types/resources/LazyResourceCollectionWrapper;->filteringIterator:Lorg/apache/tools/ant/types/resources/LazyResourceCollectionWrapper$FilteringIterator;

    if-nez v1, :cond_0

    .line 27
    new-instance v1, Lorg/apache/tools/ant/types/resources/LazyResourceCollectionWrapper$FilteringIterator;

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/LazyResourceCollectionWrapper;->getResourceCollection()Lorg/apache/tools/ant/types/ResourceCollection;

    move-result-object v2

    invoke-interface {v2}, Lorg/apache/tools/ant/types/ResourceCollection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    invoke-direct {v1, p0, v2}, Lorg/apache/tools/ant/types/resources/LazyResourceCollectionWrapper$FilteringIterator;-><init>(Lorg/apache/tools/ant/types/resources/LazyResourceCollectionWrapper;Ljava/util/Iterator;)V

    iput-object v1, p0, Lorg/apache/tools/ant/types/resources/LazyResourceCollectionWrapper;->filteringIterator:Lorg/apache/tools/ant/types/resources/LazyResourceCollectionWrapper$FilteringIterator;

    .line 30
    :cond_0
    new-instance v0, Lorg/apache/tools/ant/types/resources/LazyResourceCollectionWrapper$CachedIterator;

    iget-object v1, p0, Lorg/apache/tools/ant/types/resources/LazyResourceCollectionWrapper;->filteringIterator:Lorg/apache/tools/ant/types/resources/LazyResourceCollectionWrapper$FilteringIterator;

    invoke-direct {v0, p0, v1}, Lorg/apache/tools/ant/types/resources/LazyResourceCollectionWrapper$CachedIterator;-><init>(Lorg/apache/tools/ant/types/resources/LazyResourceCollectionWrapper;Ljava/util/Iterator;)V

    .line 34
    .local v0, "iterator":Ljava/util/Iterator;
    :goto_0
    return-object v0

    .line 32
    .end local v0    # "iterator":Ljava/util/Iterator;
    :cond_1
    new-instance v0, Lorg/apache/tools/ant/types/resources/LazyResourceCollectionWrapper$FilteringIterator;

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/LazyResourceCollectionWrapper;->getResourceCollection()Lorg/apache/tools/ant/types/ResourceCollection;

    move-result-object v1

    invoke-interface {v1}, Lorg/apache/tools/ant/types/ResourceCollection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lorg/apache/tools/ant/types/resources/LazyResourceCollectionWrapper$FilteringIterator;-><init>(Lorg/apache/tools/ant/types/resources/LazyResourceCollectionWrapper;Ljava/util/Iterator;)V

    .restart local v0    # "iterator":Ljava/util/Iterator;
    goto :goto_0
.end method

.method protected filterResource(Lorg/apache/tools/ant/types/Resource;)Z
    .locals 1
    .param p1, "r"    # Lorg/apache/tools/ant/types/Resource;

    .prologue
    .line 57
    const/4 v0, 0x0

    return v0
.end method

.method protected getSize()I
    .locals 3

    .prologue
    .line 40
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/LazyResourceCollectionWrapper;->createIterator()Ljava/util/Iterator;

    move-result-object v0

    .line 41
    .local v0, "it":Ljava/util/Iterator;
    const/4 v1, 0x0

    .line 42
    .local v1, "size":I
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 43
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 44
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 46
    :cond_0
    return v1
.end method
