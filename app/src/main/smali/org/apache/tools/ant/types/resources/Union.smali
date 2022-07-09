.class public Lorg/apache/tools/ant/types/resources/Union;
.super Lorg/apache/tools/ant/types/resources/BaseResourceCollectionContainer;
.source "Union.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 48
    invoke-direct {p0}, Lorg/apache/tools/ant/types/resources/BaseResourceCollectionContainer;-><init>()V

    .line 49
    return-void
.end method

.method public constructor <init>(Lorg/apache/tools/ant/Project;)V
    .locals 0
    .param p1, "project"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 56
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/types/resources/BaseResourceCollectionContainer;-><init>(Lorg/apache/tools/ant/Project;)V

    .line 57
    return-void
.end method

.method public constructor <init>(Lorg/apache/tools/ant/Project;Lorg/apache/tools/ant/types/ResourceCollection;)V
    .locals 0
    .param p1, "project"    # Lorg/apache/tools/ant/Project;
    .param p2, "rc"    # Lorg/apache/tools/ant/types/ResourceCollection;

    .prologue
    .line 73
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/types/resources/BaseResourceCollectionContainer;-><init>(Lorg/apache/tools/ant/Project;)V

    .line 74
    invoke-virtual {p0, p2}, Lorg/apache/tools/ant/types/resources/Union;->add(Lorg/apache/tools/ant/types/ResourceCollection;)V

    .line 75
    return-void
.end method

.method public constructor <init>(Lorg/apache/tools/ant/types/ResourceCollection;)V
    .locals 1
    .param p1, "rc"    # Lorg/apache/tools/ant/types/ResourceCollection;

    .prologue
    .line 64
    invoke-static {p1}, Lorg/apache/tools/ant/Project;->getProject(Ljava/lang/Object;)Lorg/apache/tools/ant/Project;

    move-result-object v0

    invoke-direct {p0, v0, p1}, Lorg/apache/tools/ant/types/resources/Union;-><init>(Lorg/apache/tools/ant/Project;Lorg/apache/tools/ant/types/ResourceCollection;)V

    .line 65
    return-void
.end method

.method public static getInstance(Lorg/apache/tools/ant/types/ResourceCollection;)Lorg/apache/tools/ant/types/resources/Union;
    .locals 1
    .param p0, "rc"    # Lorg/apache/tools/ant/types/ResourceCollection;

    .prologue
    .line 42
    instance-of v0, p0, Lorg/apache/tools/ant/types/resources/Union;

    if-eqz v0, :cond_0

    check-cast p0, Lorg/apache/tools/ant/types/resources/Union;

    .end local p0    # "rc":Lorg/apache/tools/ant/types/ResourceCollection;
    :goto_0
    return-object p0

    .restart local p0    # "rc":Lorg/apache/tools/ant/types/ResourceCollection;
    :cond_0
    new-instance v0, Lorg/apache/tools/ant/types/resources/Union;

    invoke-direct {v0, p0}, Lorg/apache/tools/ant/types/resources/Union;-><init>(Lorg/apache/tools/ant/types/ResourceCollection;)V

    move-object p0, v0

    goto :goto_0
.end method

.method private static nextRC(Ljava/util/Iterator;)Lorg/apache/tools/ant/types/ResourceCollection;
    .locals 1
    .param p0, "i"    # Ljava/util/Iterator;

    .prologue
    .line 135
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/ResourceCollection;

    return-object v0
.end method


# virtual methods
.method protected getCollection()Ljava/util/Collection;
    .locals 1

    .prologue
    .line 107
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/resources/Union;->getCollection(Z)Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method

.method protected getCollection(Z)Ljava/util/Collection;
    .locals 6
    .param p1, "asString"    # Z

    .prologue
    .line 117
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Union;->getResourceCollections()Ljava/util/List;

    move-result-object v2

    .line 118
    .local v2, "rc":Ljava/util/List;
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 119
    sget-object v4, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 131
    :cond_0
    return-object v4

    .line 121
    :cond_1
    new-instance v4, Ljava/util/LinkedHashSet;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v5

    mul-int/lit8 v5, v5, 0x2

    invoke-direct {v4, v5}, Ljava/util/LinkedHashSet;-><init>(I)V

    .line 122
    .local v4, "set":Ljava/util/LinkedHashSet;
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "rcIter":Ljava/util/Iterator;
    :cond_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 123
    invoke-static {v3}, Lorg/apache/tools/ant/types/resources/Union;->nextRC(Ljava/util/Iterator;)Lorg/apache/tools/ant/types/ResourceCollection;

    move-result-object v5

    invoke-interface {v5}, Lorg/apache/tools/ant/types/ResourceCollection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "r":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 124
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    .line 125
    .local v0, "o":Ljava/lang/Object;
    if-eqz p1, :cond_3

    .line 126
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 128
    .end local v0    # "o":Ljava/lang/Object;
    :cond_3
    invoke-virtual {v4, v0}, Ljava/util/LinkedHashSet;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method public list()[Ljava/lang/String;
    .locals 2

    .prologue
    .line 83
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Union;->isReference()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 84
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Union;->getCheckedRef()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/tools/ant/types/resources/Union;

    invoke-virtual {v1}, Lorg/apache/tools/ant/types/resources/Union;->list()[Ljava/lang/String;

    move-result-object v1

    .line 87
    :goto_0
    return-object v1

    .line 86
    :cond_0
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/types/resources/Union;->getCollection(Z)Ljava/util/Collection;

    move-result-object v0

    .line 87
    .local v0, "result":Ljava/util/Collection;
    invoke-interface {v0}, Ljava/util/Collection;->size()I

    move-result v1

    new-array v1, v1, [Ljava/lang/String;

    invoke-interface {v0, v1}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/String;

    goto :goto_0
.end method

.method public listResources()[Lorg/apache/tools/ant/types/Resource;
    .locals 2

    .prologue
    .line 95
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Union;->isReference()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 96
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Union;->getCheckedRef()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/tools/ant/types/resources/Union;

    invoke-virtual {v1}, Lorg/apache/tools/ant/types/resources/Union;->listResources()[Lorg/apache/tools/ant/types/Resource;

    move-result-object v1

    .line 99
    :goto_0
    return-object v1

    .line 98
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Union;->getCollection()Ljava/util/Collection;

    move-result-object v0

    .line 99
    .local v0, "result":Ljava/util/Collection;
    invoke-interface {v0}, Ljava/util/Collection;->size()I

    move-result v1

    new-array v1, v1, [Lorg/apache/tools/ant/types/Resource;

    invoke-interface {v0, v1}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Lorg/apache/tools/ant/types/Resource;

    goto :goto_0
.end method
