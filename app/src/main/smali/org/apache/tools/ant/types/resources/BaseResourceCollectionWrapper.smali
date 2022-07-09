.class public abstract Lorg/apache/tools/ant/types/resources/BaseResourceCollectionWrapper;
.super Lorg/apache/tools/ant/types/resources/AbstractResourceCollectionWrapper;
.source "BaseResourceCollectionWrapper.java"


# instance fields
.field private coll:Ljava/util/Collection;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 28
    invoke-direct {p0}, Lorg/apache/tools/ant/types/resources/AbstractResourceCollectionWrapper;-><init>()V

    .line 31
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/types/resources/BaseResourceCollectionWrapper;->coll:Ljava/util/Collection;

    return-void
.end method

.method private declared-synchronized cacheCollection()Ljava/util/Collection;
    .locals 1

    .prologue
    .line 48
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/BaseResourceCollectionWrapper;->coll:Ljava/util/Collection;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/BaseResourceCollectionWrapper;->isCache()Z

    move-result v0

    if-nez v0, :cond_1

    .line 49
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/BaseResourceCollectionWrapper;->getCollection()Ljava/util/Collection;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/types/resources/BaseResourceCollectionWrapper;->coll:Ljava/util/Collection;

    .line 51
    :cond_1
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/BaseResourceCollectionWrapper;->coll:Ljava/util/Collection;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    .line 48
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method


# virtual methods
.method protected createIterator()Ljava/util/Iterator;
    .locals 1

    .prologue
    .line 34
    invoke-direct {p0}, Lorg/apache/tools/ant/types/resources/BaseResourceCollectionWrapper;->cacheCollection()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method protected abstract getCollection()Ljava/util/Collection;
.end method

.method protected getSize()I
    .locals 1

    .prologue
    .line 38
    invoke-direct {p0}, Lorg/apache/tools/ant/types/resources/BaseResourceCollectionWrapper;->cacheCollection()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->size()I

    move-result v0

    return v0
.end method
