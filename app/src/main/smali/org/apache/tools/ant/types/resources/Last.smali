.class public Lorg/apache/tools/ant/types/resources/Last;
.super Lorg/apache/tools/ant/types/resources/SizeLimitCollection;
.source "Last.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 33
    invoke-direct {p0}, Lorg/apache/tools/ant/types/resources/SizeLimitCollection;-><init>()V

    return-void
.end method


# virtual methods
.method protected getCollection()Ljava/util/Collection;
    .locals 10

    .prologue
    .line 40
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Last;->getValidCount()I

    move-result v1

    .line 41
    .local v1, "count":I
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Last;->getResourceCollection()Lorg/apache/tools/ant/types/ResourceCollection;

    move-result-object v6

    .line 42
    .local v6, "rc":Lorg/apache/tools/ant/types/ResourceCollection;
    move v3, v1

    .line 43
    .local v3, "i":I
    invoke-interface {v6}, Lorg/apache/tools/ant/types/ResourceCollection;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .line 44
    .local v4, "iter":Ljava/util/Iterator;
    invoke-interface {v6}, Lorg/apache/tools/ant/types/ResourceCollection;->size()I

    move-result v7

    .line 45
    .local v7, "size":I
    :goto_0
    if-ge v3, v7, :cond_0

    .line 46
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 45
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 49
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 50
    .local v0, "al":Ljava/util/ArrayList;
    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_1

    .line 51
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    invoke-virtual {v0, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 50
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 53
    :cond_1
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    .line 54
    .local v2, "found":I
    if-eq v2, v1, :cond_2

    if-ge v7, v1, :cond_3

    if-ne v2, v7, :cond_3

    .line 65
    .end local v0    # "al":Ljava/util/ArrayList;
    :cond_2
    :goto_2
    return-object v0

    .line 59
    .restart local v0    # "al":Ljava/util/ArrayList;
    :cond_3
    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v9, "Resource collection "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v8

    const-string/jumbo v9, " reports size "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8, v7}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v8

    const-string/jumbo v9, " but returns "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8, v3}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v8

    const-string/jumbo v9, " elements."

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    .line 63
    .local v5, "msg":Ljava/lang/String;
    if-le v2, v1, :cond_4

    .line 64
    const/4 v8, 0x1

    invoke-virtual {p0, v5, v8}, Lorg/apache/tools/ant/types/resources/Last;->log(Ljava/lang/String;I)V

    .line 65
    sub-int v8, v2, v1

    invoke-virtual {v0, v8, v2}, Ljava/util/ArrayList;->subList(II)Ljava/util/List;

    move-result-object v0

    goto :goto_2

    .line 68
    :cond_4
    new-instance v8, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v8, v5}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v8
.end method
