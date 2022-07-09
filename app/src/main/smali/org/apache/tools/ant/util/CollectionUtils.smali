.class public Lorg/apache/tools/ant/util/CollectionUtils;
.super Ljava/lang/Object;
.source "CollectionUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/util/CollectionUtils$CompoundEnumeration;,
        Lorg/apache/tools/ant/util/CollectionUtils$EmptyEnumeration;
    }
.end annotation


# static fields
.field public static final EMPTY_LIST:Ljava/util/List;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 42
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/util/CollectionUtils;->EMPTY_LIST:Ljava/util/List;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 224
    return-void
.end method

.method public static append(Ljava/util/Enumeration;Ljava/util/Enumeration;)Ljava/util/Enumeration;
    .locals 1
    .param p0, "e1"    # Ljava/util/Enumeration;
    .param p1, "e2"    # Ljava/util/Enumeration;

    .prologue
    .line 173
    new-instance v0, Lorg/apache/tools/ant/util/CollectionUtils$CompoundEnumeration;

    invoke-direct {v0, p0, p1}, Lorg/apache/tools/ant/util/CollectionUtils$CompoundEnumeration;-><init>(Ljava/util/Enumeration;Ljava/util/Enumeration;)V

    return-object v0
.end method

.method public static asCollection(Ljava/util/Iterator;)Ljava/util/Collection;
    .locals 2
    .param p0, "iter"    # Ljava/util/Iterator;

    .prologue
    .line 217
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 218
    .local v0, "l":Ljava/util/List;
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 219
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 221
    :cond_0
    return-object v0
.end method

.method public static asEnumeration(Ljava/util/Iterator;)Ljava/util/Enumeration;
    .locals 1
    .param p0, "iter"    # Ljava/util/Iterator;

    .prologue
    .line 182
    new-instance v0, Lorg/apache/tools/ant/util/CollectionUtils$1;

    invoke-direct {v0, p0}, Lorg/apache/tools/ant/util/CollectionUtils$1;-><init>(Ljava/util/Iterator;)V

    return-object v0
.end method

.method public static asIterator(Ljava/util/Enumeration;)Ljava/util/Iterator;
    .locals 1
    .param p0, "e"    # Ljava/util/Enumeration;

    .prologue
    .line 198
    new-instance v0, Lorg/apache/tools/ant/util/CollectionUtils$2;

    invoke-direct {v0, p0}, Lorg/apache/tools/ant/util/CollectionUtils$2;-><init>(Ljava/util/Enumeration;)V

    return-object v0
.end method

.method public static equals(Ljava/util/Dictionary;Ljava/util/Dictionary;)Z
    .locals 8
    .param p0, "d1"    # Ljava/util/Dictionary;
    .param p1, "d2"    # Ljava/util/Dictionary;

    .prologue
    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 77
    if-ne p0, p1, :cond_1

    .line 102
    :cond_0
    :goto_0
    return v4

    .line 81
    :cond_1
    if-eqz p0, :cond_2

    if-nez p1, :cond_3

    :cond_2
    move v4, v5

    .line 82
    goto :goto_0

    .line 85
    :cond_3
    invoke-virtual {p0}, Ljava/util/Dictionary;->size()I

    move-result v6

    invoke-virtual {p1}, Ljava/util/Dictionary;->size()I

    move-result v7

    if-eq v6, v7, :cond_4

    move v4, v5

    .line 86
    goto :goto_0

    .line 89
    :cond_4
    invoke-virtual {p0}, Ljava/util/Dictionary;->keys()Ljava/util/Enumeration;

    move-result-object v0

    .line 90
    .local v0, "e1":Ljava/util/Enumeration;
    :cond_5
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v6

    if-eqz v6, :cond_0

    .line 91
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    .line 92
    .local v1, "key":Ljava/lang/Object;
    invoke-virtual {p0, v1}, Ljava/util/Dictionary;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 93
    .local v2, "value1":Ljava/lang/Object;
    invoke-virtual {p1, v1}, Ljava/util/Dictionary;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .line 94
    .local v3, "value2":Ljava/lang/Object;
    if-eqz v3, :cond_6

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_5

    :cond_6
    move v4, v5

    .line 95
    goto :goto_0
.end method

.method public static equals(Ljava/util/Vector;Ljava/util/Vector;)Z
    .locals 1
    .param p0, "v1"    # Ljava/util/Vector;
    .param p1, "v2"    # Ljava/util/Vector;

    .prologue
    .line 54
    if-ne p0, p1, :cond_0

    .line 55
    const/4 v0, 0x1

    .line 62
    :goto_0
    return v0

    .line 58
    :cond_0
    if-eqz p0, :cond_1

    if-nez p1, :cond_2

    .line 59
    :cond_1
    const/4 v0, 0x0

    goto :goto_0

    .line 62
    :cond_2
    invoke-virtual {p0, p1}, Ljava/util/Vector;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_0
.end method

.method public static flattenToString(Ljava/util/Collection;)Ljava/lang/String;
    .locals 4
    .param p0, "c"    # Ljava/util/Collection;

    .prologue
    .line 112
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 113
    .local v1, "iter":Ljava/util/Iterator;
    const/4 v0, 0x1

    .line 114
    .local v0, "first":Z
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    .line 115
    .local v2, "sb":Ljava/lang/StringBuffer;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 116
    if-nez v0, :cond_0

    .line 117
    const-string/jumbo v3, ","

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 119
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 120
    const/4 v0, 0x0

    goto :goto_0

    .line 122
    :cond_1
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method public static frequency(Ljava/util/Collection;Ljava/lang/Object;)I
    .locals 4
    .param p0, "c"    # Ljava/util/Collection;
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 255
    const/4 v0, 0x0

    .line 256
    .local v0, "freq":I
    if-eqz p0, :cond_2

    .line 257
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 258
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 259
    .local v2, "test":Ljava/lang/Object;
    if-nez p1, :cond_1

    if-nez v2, :cond_0

    .line 260
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 259
    :cond_1
    invoke-virtual {p1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    goto :goto_1

    .line 264
    .end local v1    # "i":Ljava/util/Iterator;
    .end local v2    # "test":Ljava/lang/Object;
    :cond_2
    return v0
.end method

.method public static putAll(Ljava/util/Dictionary;Ljava/util/Dictionary;)V
    .locals 3
    .param p0, "m1"    # Ljava/util/Dictionary;
    .param p1, "m2"    # Ljava/util/Dictionary;

    .prologue
    .line 133
    invoke-virtual {p1}, Ljava/util/Dictionary;->keys()Ljava/util/Enumeration;

    move-result-object v0

    .local v0, "it":Ljava/util/Enumeration;
    :goto_0
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 134
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    .line 135
    .local v1, "key":Ljava/lang/Object;
    invoke-virtual {p1, v1}, Ljava/util/Dictionary;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Ljava/util/Dictionary;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 137
    .end local v1    # "key":Ljava/lang/Object;
    :cond_0
    return-void
.end method
