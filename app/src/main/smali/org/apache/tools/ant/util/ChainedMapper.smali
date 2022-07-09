.class public Lorg/apache/tools/ant/util/ChainedMapper;
.super Lorg/apache/tools/ant/util/ContainerMapper;
.source "ChainedMapper.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 32
    invoke-direct {p0}, Lorg/apache/tools/ant/util/ContainerMapper;-><init>()V

    return-void
.end method


# virtual methods
.method public mapFileName(Ljava/lang/String;)[Ljava/lang/String;
    .locals 7
    .param p1, "sourceFileName"    # Ljava/lang/String;

    .prologue
    .line 36
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 37
    .local v0, "inputs":Ljava/util/List;
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 38
    .local v5, "results":Ljava/util/List;
    invoke-interface {v5, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 39
    const/4 v4, 0x0

    .line 41
    .local v4, "mapper":Lorg/apache/tools/ant/util/FileNameMapper;
    invoke-virtual {p0}, Lorg/apache/tools/ant/util/ChainedMapper;->getMappers()Ljava/util/List;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "mIter":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_2

    .line 42
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    .end local v4    # "mapper":Lorg/apache/tools/ant/util/FileNameMapper;
    check-cast v4, Lorg/apache/tools/ant/util/FileNameMapper;

    .line 43
    .restart local v4    # "mapper":Lorg/apache/tools/ant/util/FileNameMapper;
    if-eqz v4, :cond_0

    .line 44
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 45
    invoke-interface {v0, v5}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 46
    invoke-interface {v5}, Ljava/util/List;->clear()V

    .line 48
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "it":Ljava/util/Iterator;
    :cond_1
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_0

    .line 49
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-interface {v4, v6}, Lorg/apache/tools/ant/util/FileNameMapper;->mapFileName(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    .line 50
    .local v3, "mapped":[Ljava/lang/String;
    if-eqz v3, :cond_1

    .line 51
    invoke-static {v3}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v6

    invoke-interface {v5, v6}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    goto :goto_0

    .line 56
    .end local v1    # "it":Ljava/util/Iterator;
    .end local v3    # "mapped":[Ljava/lang/String;
    :cond_2
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v6

    if-nez v6, :cond_3

    const/4 v6, 0x0

    :goto_1
    return-object v6

    :cond_3
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v6

    new-array v6, v6, [Ljava/lang/String;

    invoke-interface {v5, v6}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v6

    check-cast v6, [Ljava/lang/String;

    goto :goto_1
.end method
