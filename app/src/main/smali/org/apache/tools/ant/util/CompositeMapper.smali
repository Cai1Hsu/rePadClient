.class public Lorg/apache/tools/ant/util/CompositeMapper;
.super Lorg/apache/tools/ant/util/ContainerMapper;
.source "CompositeMapper.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 27
    invoke-direct {p0}, Lorg/apache/tools/ant/util/ContainerMapper;-><init>()V

    return-void
.end method


# virtual methods
.method public mapFileName(Ljava/lang/String;)[Ljava/lang/String;
    .locals 6
    .param p1, "sourceFileName"    # Ljava/lang/String;

    .prologue
    .line 31
    new-instance v4, Ljava/util/LinkedHashSet;

    invoke-direct {v4}, Ljava/util/LinkedHashSet;-><init>()V

    .line 33
    .local v4, "results":Ljava/util/LinkedHashSet;
    const/4 v3, 0x0

    .line 34
    .local v3, "mapper":Lorg/apache/tools/ant/util/FileNameMapper;
    invoke-virtual {p0}, Lorg/apache/tools/ant/util/CompositeMapper;->getMappers()Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "mIter":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 35
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    .end local v3    # "mapper":Lorg/apache/tools/ant/util/FileNameMapper;
    check-cast v3, Lorg/apache/tools/ant/util/FileNameMapper;

    .line 36
    .restart local v3    # "mapper":Lorg/apache/tools/ant/util/FileNameMapper;
    if-eqz v3, :cond_0

    .line 37
    invoke-interface {v3, p1}, Lorg/apache/tools/ant/util/FileNameMapper;->mapFileName(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 38
    .local v2, "mapped":[Ljava/lang/String;
    if-eqz v2, :cond_0

    .line 39
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v5, v2

    if-ge v0, v5, :cond_0

    .line 40
    aget-object v5, v2, v0

    invoke-virtual {v4, v5}, Ljava/util/LinkedHashSet;->add(Ljava/lang/Object;)Z

    .line 39
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 45
    .end local v0    # "i":I
    .end local v2    # "mapped":[Ljava/lang/String;
    :cond_1
    invoke-virtual {v4}, Ljava/util/LinkedHashSet;->size()I

    move-result v5

    if-nez v5, :cond_2

    const/4 v5, 0x0

    :goto_1
    return-object v5

    :cond_2
    invoke-virtual {v4}, Ljava/util/LinkedHashSet;->size()I

    move-result v5

    new-array v5, v5, [Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/util/LinkedHashSet;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [Ljava/lang/String;

    goto :goto_1
.end method
