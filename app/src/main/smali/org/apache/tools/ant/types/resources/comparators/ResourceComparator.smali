.class public abstract Lorg/apache/tools/ant/types/resources/comparators/ResourceComparator;
.super Lorg/apache/tools/ant/types/DataType;
.source "ResourceComparator.java"

# interfaces
.implements Ljava/util/Comparator;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 29
    invoke-direct {p0}, Lorg/apache/tools/ant/types/DataType;-><init>()V

    return-void
.end method


# virtual methods
.method public final compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 2
    .param p1, "foo"    # Ljava/lang/Object;
    .param p2, "bar"    # Ljava/lang/Object;

    .prologue
    .line 40
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/comparators/ResourceComparator;->dieOnCircularReference()V

    .line 41
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/comparators/ResourceComparator;->isReference()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/comparators/ResourceComparator;->getCheckedRef()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/tools/ant/types/resources/comparators/ResourceComparator;

    move-object v0, v1

    .line 43
    .local v0, "c":Lorg/apache/tools/ant/types/resources/comparators/ResourceComparator;
    :goto_0
    check-cast p1, Lorg/apache/tools/ant/types/Resource;

    .end local p1    # "foo":Ljava/lang/Object;
    check-cast p2, Lorg/apache/tools/ant/types/Resource;

    .end local p2    # "bar":Ljava/lang/Object;
    invoke-virtual {v0, p1, p2}, Lorg/apache/tools/ant/types/resources/comparators/ResourceComparator;->resourceCompare(Lorg/apache/tools/ant/types/Resource;Lorg/apache/tools/ant/types/Resource;)I

    move-result v1

    return v1

    .end local v0    # "c":Lorg/apache/tools/ant/types/resources/comparators/ResourceComparator;
    .restart local p1    # "foo":Ljava/lang/Object;
    .restart local p2    # "bar":Ljava/lang/Object;
    :cond_0
    move-object v0, p0

    .line 41
    goto :goto_0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 3
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v0, 0x0

    .line 52
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/comparators/ResourceComparator;->isReference()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 53
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/comparators/ResourceComparator;->getCheckedRef()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 58
    :cond_0
    :goto_0
    return v0

    .line 55
    :cond_1
    if-eqz p1, :cond_0

    .line 58
    if-eq p1, p0, :cond_2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    :cond_2
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public declared-synchronized hashCode()I
    .locals 1

    .prologue
    .line 66
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/comparators/ResourceComparator;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 67
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/comparators/ResourceComparator;->getCheckedRef()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    .line 69
    :goto_0
    monitor-exit p0

    return v0

    :cond_0
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v0

    goto :goto_0

    .line 66
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected abstract resourceCompare(Lorg/apache/tools/ant/types/Resource;Lorg/apache/tools/ant/types/Resource;)I
.end method
