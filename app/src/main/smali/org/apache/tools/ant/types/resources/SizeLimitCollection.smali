.class public abstract Lorg/apache/tools/ant/types/resources/SizeLimitCollection;
.super Lorg/apache/tools/ant/types/resources/BaseResourceCollectionWrapper;
.source "SizeLimitCollection.java"


# static fields
.field private static final BAD_COUNT:Ljava/lang/String; = "size-limited collection count should be set to an int >= 0"


# instance fields
.field private count:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 26
    invoke-direct {p0}, Lorg/apache/tools/ant/types/resources/BaseResourceCollectionWrapper;-><init>()V

    .line 30
    const/4 v0, 0x1

    iput v0, p0, Lorg/apache/tools/ant/types/resources/SizeLimitCollection;->count:I

    return-void
.end method


# virtual methods
.method public declared-synchronized getCount()I
    .locals 1

    .prologue
    .line 46
    monitor-enter p0

    :try_start_0
    iget v0, p0, Lorg/apache/tools/ant/types/resources/SizeLimitCollection;->count:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected getValidCount()I
    .locals 3

    .prologue
    .line 64
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/SizeLimitCollection;->getCount()I

    move-result v0

    .line 65
    .local v0, "ct":I
    if-gez v0, :cond_0

    .line 66
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v2, "size-limited collection count should be set to an int >= 0"

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 68
    :cond_0
    return v0
.end method

.method public declared-synchronized setCount(I)V
    .locals 1
    .param p1, "i"    # I

    .prologue
    .line 37
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/SizeLimitCollection;->checkAttributesAllowed()V

    .line 38
    iput p1, p0, Lorg/apache/tools/ant/types/resources/SizeLimitCollection;->count:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 39
    monitor-exit p0

    return-void

    .line 37
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized size()I
    .locals 3

    .prologue
    .line 54
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/SizeLimitCollection;->getResourceCollection()Lorg/apache/tools/ant/types/ResourceCollection;

    move-result-object v2

    invoke-interface {v2}, Lorg/apache/tools/ant/types/ResourceCollection;->size()I

    move-result v1

    .line 55
    .local v1, "sz":I
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/SizeLimitCollection;->getValidCount()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    .line 56
    .local v0, "ct":I
    if-ge v1, v0, :cond_0

    .end local v1    # "sz":I
    :goto_0
    monitor-exit p0

    return v1

    .restart local v1    # "sz":I
    :cond_0
    move v1, v0

    goto :goto_0

    .line 54
    .end local v0    # "ct":I
    .end local v1    # "sz":I
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2
.end method
