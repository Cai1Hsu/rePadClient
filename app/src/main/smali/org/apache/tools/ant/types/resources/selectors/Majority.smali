.class public Lorg/apache/tools/ant/types/resources/selectors/Majority;
.super Lorg/apache/tools/ant/types/resources/selectors/ResourceSelectorContainer;
.source "Majority.java"

# interfaces
.implements Lorg/apache/tools/ant/types/resources/selectors/ResourceSelector;


# instance fields
.field private tie:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 36
    invoke-direct {p0}, Lorg/apache/tools/ant/types/resources/selectors/ResourceSelectorContainer;-><init>()V

    .line 31
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/types/resources/selectors/Majority;->tie:Z

    .line 37
    return-void
.end method

.method public constructor <init>([Lorg/apache/tools/ant/types/resources/selectors/ResourceSelector;)V
    .locals 1
    .param p1, "r"    # [Lorg/apache/tools/ant/types/resources/selectors/ResourceSelector;

    .prologue
    .line 44
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/types/resources/selectors/ResourceSelectorContainer;-><init>([Lorg/apache/tools/ant/types/resources/selectors/ResourceSelector;)V

    .line 31
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/types/resources/selectors/Majority;->tie:Z

    .line 45
    return-void
.end method


# virtual methods
.method public declared-synchronized isSelected(Lorg/apache/tools/ant/types/Resource;)Z
    .locals 9
    .param p1, "r"    # Lorg/apache/tools/ant/types/Resource;

    .prologue
    const/4 v7, 0x1

    const/4 v8, 0x0

    .line 61
    monitor-enter p0

    const/4 v4, 0x0

    .line 62
    .local v4, "passed":I
    const/4 v2, 0x0

    .line 63
    .local v2, "failed":I
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/selectors/Majority;->selectorCount()I

    move-result v0

    .line 64
    .local v0, "count":I
    rem-int/lit8 v6, v0, 0x2

    if-nez v6, :cond_2

    move v1, v7

    .line 65
    .local v1, "even":Z
    :goto_0
    div-int/lit8 v5, v0, 0x2

    .line 67
    .local v5, "threshold":I
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/selectors/Majority;->getSelectors()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_5

    .line 68
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/apache/tools/ant/types/resources/selectors/ResourceSelector;

    invoke-interface {v6, p1}, Lorg/apache/tools/ant/types/resources/selectors/ResourceSelector;->isSelected(Lorg/apache/tools/ant/types/Resource;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 69
    add-int/lit8 v4, v4, 0x1

    .line 70
    if-gt v4, v5, :cond_1

    if-eqz v1, :cond_0

    iget-boolean v6, p0, Lorg/apache/tools/ant/types/resources/selectors/Majority;->tie:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v6, :cond_0

    if-ne v4, v5, :cond_0

    :cond_1
    move v6, v7

    .line 81
    :goto_1
    monitor-exit p0

    return v6

    .end local v1    # "even":Z
    .end local v3    # "i":Ljava/util/Iterator;
    .end local v5    # "threshold":I
    :cond_2
    move v1, v8

    .line 64
    goto :goto_0

    .line 74
    .restart local v1    # "even":Z
    .restart local v3    # "i":Ljava/util/Iterator;
    .restart local v5    # "threshold":I
    :cond_3
    add-int/lit8 v2, v2, 0x1

    .line 75
    if-gt v2, v5, :cond_4

    if-eqz v1, :cond_0

    :try_start_1
    iget-boolean v6, p0, Lorg/apache/tools/ant/types/resources/selectors/Majority;->tie:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-nez v6, :cond_0

    if-ne v2, v5, :cond_0

    :cond_4
    move v6, v8

    .line 76
    goto :goto_1

    :cond_5
    move v6, v8

    .line 81
    goto :goto_1

    .line 61
    .end local v0    # "count":I
    .end local v1    # "even":Z
    .end local v3    # "i":Ljava/util/Iterator;
    .end local v5    # "threshold":I
    :catchall_0
    move-exception v6

    monitor-exit p0

    throw v6
.end method

.method public declared-synchronized setAllowtie(Z)V
    .locals 1
    .param p1, "b"    # Z

    .prologue
    .line 52
    monitor-enter p0

    :try_start_0
    iput-boolean p1, p0, Lorg/apache/tools/ant/types/resources/selectors/Majority;->tie:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 53
    monitor-exit p0

    return-void

    .line 52
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
