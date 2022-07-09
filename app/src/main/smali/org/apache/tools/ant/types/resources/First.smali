.class public Lorg/apache/tools/ant/types/resources/First;
.super Lorg/apache/tools/ant/types/resources/SizeLimitCollection;
.source "First.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 29
    invoke-direct {p0}, Lorg/apache/tools/ant/types/resources/SizeLimitCollection;-><init>()V

    return-void
.end method


# virtual methods
.method protected getCollection()Ljava/util/Collection;
    .locals 5

    .prologue
    .line 36
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/First;->getValidCount()I

    move-result v1

    .line 37
    .local v1, "ct":I
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/First;->getResourceCollection()Lorg/apache/tools/ant/types/ResourceCollection;

    move-result-object v4

    invoke-interface {v4}, Lorg/apache/tools/ant/types/ResourceCollection;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .line 38
    .local v3, "iter":Ljava/util/Iterator;
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 39
    .local v0, "al":Ljava/util/ArrayList;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v1, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 40
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 39
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 42
    :cond_0
    return-object v0
.end method
