.class public Lorg/apache/tools/ant/types/resources/Difference;
.super Lorg/apache/tools/ant/types/resources/BaseResourceCollectionContainer;
.source "Difference.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 34
    invoke-direct {p0}, Lorg/apache/tools/ant/types/resources/BaseResourceCollectionContainer;-><init>()V

    return-void
.end method

.method private static nextRC(Ljava/util/Iterator;)Lorg/apache/tools/ant/types/ResourceCollection;
    .locals 1
    .param p0, "i"    # Ljava/util/Iterator;

    .prologue
    .line 64
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/ResourceCollection;

    return-object v0
.end method


# virtual methods
.method protected getCollection()Ljava/util/Collection;
    .locals 10

    .prologue
    .line 41
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Difference;->getResourceCollections()Ljava/util/List;

    move-result-object v4

    .line 42
    .local v4, "rc":Ljava/util/List;
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v6

    .line 43
    .local v6, "size":I
    const/4 v7, 0x2

    if-ge v6, v7, :cond_1

    .line 44
    new-instance v8, Lorg/apache/tools/ant/BuildException;

    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v9, "The difference of "

    invoke-virtual {v7, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7, v6}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string/jumbo v9, " resource collection"

    invoke-virtual {v7, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const/4 v7, 0x1

    if-ne v6, v7, :cond_0

    const-string/jumbo v7, ""

    :goto_0
    invoke-virtual {v9, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string/jumbo v9, " is undefined."

    invoke-virtual {v7, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v8, v7}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v8

    :cond_0
    const-string/jumbo v7, "s"

    goto :goto_0

    .line 48
    :cond_1
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 49
    .local v1, "hs":Ljava/util/HashSet;
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 50
    .local v0, "al":Ljava/util/ArrayList;
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .local v5, "rcIter":Ljava/util/Iterator;
    :cond_2
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_4

    .line 51
    invoke-static {v5}, Lorg/apache/tools/ant/types/resources/Difference;->nextRC(Ljava/util/Iterator;)Lorg/apache/tools/ant/types/ResourceCollection;

    move-result-object v7

    invoke-interface {v7}, Lorg/apache/tools/ant/types/ResourceCollection;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "r":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_2

    .line 52
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 53
    .local v2, "next":Ljava/lang/Object;
    invoke-virtual {v1, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 54
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 56
    :cond_3
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    goto :goto_1

    .line 60
    .end local v2    # "next":Ljava/lang/Object;
    .end local v3    # "r":Ljava/util/Iterator;
    :cond_4
    return-object v0
.end method
