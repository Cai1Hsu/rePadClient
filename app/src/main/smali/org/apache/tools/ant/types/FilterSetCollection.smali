.class public Lorg/apache/tools/ant/types/FilterSetCollection;
.super Ljava/lang/Object;
.source "FilterSetCollection.java"


# instance fields
.field private filterSets:Ljava/util/Vector;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/types/FilterSetCollection;->filterSets:Ljava/util/Vector;

    .line 47
    return-void
.end method

.method public constructor <init>(Lorg/apache/tools/ant/types/FilterSet;)V
    .locals 1
    .param p1, "filterSet"    # Lorg/apache/tools/ant/types/FilterSet;

    .prologue
    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/types/FilterSetCollection;->filterSets:Ljava/util/Vector;

    .line 54
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/FilterSetCollection;->addFilterSet(Lorg/apache/tools/ant/types/FilterSet;)V

    .line 55
    return-void
.end method


# virtual methods
.method public addFilterSet(Lorg/apache/tools/ant/types/FilterSet;)V
    .locals 1
    .param p1, "filterSet"    # Lorg/apache/tools/ant/types/FilterSet;

    .prologue
    .line 64
    iget-object v0, p0, Lorg/apache/tools/ant/types/FilterSetCollection;->filterSets:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 65
    return-void
.end method

.method public hasFilters()Z
    .locals 3

    .prologue
    .line 89
    iget-object v2, p0, Lorg/apache/tools/ant/types/FilterSetCollection;->filterSets:Ljava/util/Vector;

    invoke-virtual {v2}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v0

    .local v0, "e":Ljava/util/Enumeration;
    :cond_0
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 90
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/tools/ant/types/FilterSet;

    .line 91
    .local v1, "filterSet":Lorg/apache/tools/ant/types/FilterSet;
    invoke-virtual {v1}, Lorg/apache/tools/ant/types/FilterSet;->hasFilters()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 92
    const/4 v2, 0x1

    .line 95
    .end local v1    # "filterSet":Lorg/apache/tools/ant/types/FilterSet;
    :goto_0
    return v2

    :cond_1
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public replaceTokens(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p1, "line"    # Ljava/lang/String;

    .prologue
    .line 75
    move-object v2, p1

    .line 76
    .local v2, "replacedLine":Ljava/lang/String;
    iget-object v3, p0, Lorg/apache/tools/ant/types/FilterSetCollection;->filterSets:Ljava/util/Vector;

    invoke-virtual {v3}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v0

    .local v0, "e":Ljava/util/Enumeration;
    :goto_0
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 77
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/tools/ant/types/FilterSet;

    .line 78
    .local v1, "filterSet":Lorg/apache/tools/ant/types/FilterSet;
    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/types/FilterSet;->replaceTokens(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    .line 80
    .end local v1    # "filterSet":Lorg/apache/tools/ant/types/FilterSet;
    :cond_0
    return-object v2
.end method
