.class Lorg/apache/tools/ant/types/resources/LazyResourceCollectionWrapper$FilteringIterator;
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
    name = "FilteringIterator"
.end annotation


# instance fields
.field ended:Z

.field protected final it:Ljava/util/Iterator;

.field next:Lorg/apache/tools/ant/types/Resource;

.field private final this$0:Lorg/apache/tools/ant/types/resources/LazyResourceCollectionWrapper;


# direct methods
.method public constructor <init>(Lorg/apache/tools/ant/types/resources/LazyResourceCollectionWrapper;Ljava/util/Iterator;)V
    .locals 1
    .param p1, "this$0"    # Lorg/apache/tools/ant/types/resources/LazyResourceCollectionWrapper;
    .param p2, "it"    # Ljava/util/Iterator;

    .prologue
    .line 68
    iput-object p1, p0, Lorg/apache/tools/ant/types/resources/LazyResourceCollectionWrapper$FilteringIterator;->this$0:Lorg/apache/tools/ant/types/resources/LazyResourceCollectionWrapper;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 62
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/types/resources/LazyResourceCollectionWrapper$FilteringIterator;->next:Lorg/apache/tools/ant/types/Resource;

    .line 64
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/types/resources/LazyResourceCollectionWrapper$FilteringIterator;->ended:Z

    .line 69
    iput-object p2, p0, Lorg/apache/tools/ant/types/resources/LazyResourceCollectionWrapper$FilteringIterator;->it:Ljava/util/Iterator;

    .line 70
    return-void
.end method


# virtual methods
.method public hasNext()Z
    .locals 4

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 73
    iget-boolean v0, p0, Lorg/apache/tools/ant/types/resources/LazyResourceCollectionWrapper$FilteringIterator;->ended:Z

    if-eqz v0, :cond_1

    move v0, v1

    .line 86
    :goto_0
    return v0

    .line 81
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/LazyResourceCollectionWrapper$FilteringIterator;->it:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/Resource;

    iput-object v0, p0, Lorg/apache/tools/ant/types/resources/LazyResourceCollectionWrapper$FilteringIterator;->next:Lorg/apache/tools/ant/types/Resource;

    .line 82
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/LazyResourceCollectionWrapper$FilteringIterator;->this$0:Lorg/apache/tools/ant/types/resources/LazyResourceCollectionWrapper;

    iget-object v3, p0, Lorg/apache/tools/ant/types/resources/LazyResourceCollectionWrapper$FilteringIterator;->next:Lorg/apache/tools/ant/types/Resource;

    invoke-virtual {v0, v3}, Lorg/apache/tools/ant/types/resources/LazyResourceCollectionWrapper;->filterResource(Lorg/apache/tools/ant/types/Resource;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 83
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/types/resources/LazyResourceCollectionWrapper$FilteringIterator;->next:Lorg/apache/tools/ant/types/Resource;

    .line 76
    :cond_1
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/LazyResourceCollectionWrapper$FilteringIterator;->next:Lorg/apache/tools/ant/types/Resource;

    if-nez v0, :cond_2

    .line 77
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/LazyResourceCollectionWrapper$FilteringIterator;->it:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_0

    .line 78
    iput-boolean v2, p0, Lorg/apache/tools/ant/types/resources/LazyResourceCollectionWrapper$FilteringIterator;->ended:Z

    move v0, v1

    .line 79
    goto :goto_0

    :cond_2
    move v0, v2

    .line 86
    goto :goto_0
.end method

.method public next()Ljava/lang/Object;
    .locals 2

    .prologue
    .line 90
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/LazyResourceCollectionWrapper$FilteringIterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_0

    .line 91
    new-instance v1, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v1}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v1

    .line 93
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/LazyResourceCollectionWrapper$FilteringIterator;->next:Lorg/apache/tools/ant/types/Resource;

    .line 94
    .local v0, "r":Lorg/apache/tools/ant/types/Resource;
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/apache/tools/ant/types/resources/LazyResourceCollectionWrapper$FilteringIterator;->next:Lorg/apache/tools/ant/types/Resource;

    .line 95
    return-object v0
.end method

.method public remove()V
    .locals 1

    .prologue
    .line 99
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method
