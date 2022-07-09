.class Lorg/apache/tools/ant/types/resources/LazyResourceCollectionWrapper$CachedIterator;
.super Ljava/lang/Object;
.source "LazyResourceCollectionWrapper.java"

# interfaces
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/types/resources/LazyResourceCollectionWrapper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "CachedIterator"
.end annotation


# instance fields
.field cusrsor:I

.field private final it:Ljava/util/Iterator;

.field private final this$0:Lorg/apache/tools/ant/types/resources/LazyResourceCollectionWrapper;


# direct methods
.method public constructor <init>(Lorg/apache/tools/ant/types/resources/LazyResourceCollectionWrapper;Ljava/util/Iterator;)V
    .locals 1
    .param p1, "this$0"    # Lorg/apache/tools/ant/types/resources/LazyResourceCollectionWrapper;
    .param p2, "it"    # Ljava/util/Iterator;

    .prologue
    .line 120
    iput-object p1, p0, Lorg/apache/tools/ant/types/resources/LazyResourceCollectionWrapper$CachedIterator;->this$0:Lorg/apache/tools/ant/types/resources/LazyResourceCollectionWrapper;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 109
    const/4 v0, 0x0

    iput v0, p0, Lorg/apache/tools/ant/types/resources/LazyResourceCollectionWrapper$CachedIterator;->cusrsor:I

    .line 121
    iput-object p2, p0, Lorg/apache/tools/ant/types/resources/LazyResourceCollectionWrapper$CachedIterator;->it:Ljava/util/Iterator;

    .line 122
    return-void
.end method


# virtual methods
.method public hasNext()Z
    .locals 5

    .prologue
    const/4 v1, 0x1

    .line 125
    iget-object v2, p0, Lorg/apache/tools/ant/types/resources/LazyResourceCollectionWrapper$CachedIterator;->this$0:Lorg/apache/tools/ant/types/resources/LazyResourceCollectionWrapper;

    invoke-static {v2}, Lorg/apache/tools/ant/types/resources/LazyResourceCollectionWrapper;->access$000(Lorg/apache/tools/ant/types/resources/LazyResourceCollectionWrapper;)Ljava/util/List;

    move-result-object v2

    monitor-enter v2

    .line 127
    :try_start_0
    iget-object v3, p0, Lorg/apache/tools/ant/types/resources/LazyResourceCollectionWrapper$CachedIterator;->this$0:Lorg/apache/tools/ant/types/resources/LazyResourceCollectionWrapper;

    invoke-static {v3}, Lorg/apache/tools/ant/types/resources/LazyResourceCollectionWrapper;->access$000(Lorg/apache/tools/ant/types/resources/LazyResourceCollectionWrapper;)Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    iget v4, p0, Lorg/apache/tools/ant/types/resources/LazyResourceCollectionWrapper$CachedIterator;->cusrsor:I

    if-le v3, v4, :cond_0

    .line 128
    monitor-exit v2

    .line 138
    :goto_0
    return v1

    .line 131
    :cond_0
    iget-object v3, p0, Lorg/apache/tools/ant/types/resources/LazyResourceCollectionWrapper$CachedIterator;->it:Ljava/util/Iterator;

    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_1

    .line 132
    const/4 v1, 0x0

    monitor-exit v2

    goto :goto_0

    .line 137
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 135
    :cond_1
    :try_start_1
    iget-object v3, p0, Lorg/apache/tools/ant/types/resources/LazyResourceCollectionWrapper$CachedIterator;->it:Ljava/util/Iterator;

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/Resource;

    .line 136
    .local v0, "r":Lorg/apache/tools/ant/types/Resource;
    iget-object v3, p0, Lorg/apache/tools/ant/types/resources/LazyResourceCollectionWrapper$CachedIterator;->this$0:Lorg/apache/tools/ant/types/resources/LazyResourceCollectionWrapper;

    invoke-static {v3}, Lorg/apache/tools/ant/types/resources/LazyResourceCollectionWrapper;->access$000(Lorg/apache/tools/ant/types/resources/LazyResourceCollectionWrapper;)Ljava/util/List;

    move-result-object v3

    invoke-interface {v3, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 137
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0
.end method

.method public next()Ljava/lang/Object;
    .locals 4

    .prologue
    .line 143
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/LazyResourceCollectionWrapper$CachedIterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_0

    .line 144
    new-instance v0, Ljava/util/NoSuchElementException;

    invoke-direct {v0}, Ljava/util/NoSuchElementException;-><init>()V

    throw v0

    .line 146
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/LazyResourceCollectionWrapper$CachedIterator;->this$0:Lorg/apache/tools/ant/types/resources/LazyResourceCollectionWrapper;

    invoke-static {v0}, Lorg/apache/tools/ant/types/resources/LazyResourceCollectionWrapper;->access$000(Lorg/apache/tools/ant/types/resources/LazyResourceCollectionWrapper;)Ljava/util/List;

    move-result-object v1

    monitor-enter v1

    .line 149
    :try_start_0
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/LazyResourceCollectionWrapper$CachedIterator;->this$0:Lorg/apache/tools/ant/types/resources/LazyResourceCollectionWrapper;

    invoke-static {v0}, Lorg/apache/tools/ant/types/resources/LazyResourceCollectionWrapper;->access$000(Lorg/apache/tools/ant/types/resources/LazyResourceCollectionWrapper;)Ljava/util/List;

    move-result-object v0

    iget v2, p0, Lorg/apache/tools/ant/types/resources/LazyResourceCollectionWrapper$CachedIterator;->cusrsor:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lorg/apache/tools/ant/types/resources/LazyResourceCollectionWrapper$CachedIterator;->cusrsor:I

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    monitor-exit v1

    return-object v0

    .line 150
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public remove()V
    .locals 1

    .prologue
    .line 154
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method
