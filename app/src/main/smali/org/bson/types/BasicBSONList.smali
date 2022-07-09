.class public Lorg/bson/types/BasicBSONList;
.super Ljava/util/ArrayList;
.source "BasicBSONList.java"

# interfaces
.implements Lorg/bson/BSONObject;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/ArrayList",
        "<",
        "Ljava/lang/Object;",
        ">;",
        "Lorg/bson/BSONObject;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x3d463948dc511dfeL


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 59
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    return-void
.end method


# virtual methods
.method _getInt(Ljava/lang/String;)I
    .locals 1
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 156
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lorg/bson/types/BasicBSONList;->_getInt(Ljava/lang/String;Z)I

    move-result v0

    return v0
.end method

.method _getInt(Ljava/lang/String;Z)I
    .locals 4
    .param p1, "s"    # Ljava/lang/String;
    .param p2, "err"    # Z

    .prologue
    .line 161
    :try_start_0
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 166
    :goto_0
    return v1

    .line 163
    :catch_0
    move-exception v0

    .line 164
    .local v0, "e":Ljava/lang/Exception;
    if-eqz p2, :cond_0

    .line 165
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "BasicBSONList can only work with numeric keys, not: ["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "]"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 166
    :cond_0
    const/4 v1, -0x1

    goto :goto_0
.end method

.method public containsField(Ljava/lang/String;)Z
    .locals 3
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 134
    invoke-virtual {p0, p1, v1}, Lorg/bson/types/BasicBSONList;->_getInt(Ljava/lang/String;Z)I

    move-result v0

    .line 135
    .local v0, "i":I
    if-gez v0, :cond_1

    .line 137
    :cond_0
    :goto_0
    return v1

    :cond_1
    if-ltz v0, :cond_0

    invoke-virtual {p0}, Lorg/bson/types/BasicBSONList;->size()I

    move-result v2

    if-ge v0, v2, :cond_0

    const/4 v1, 0x1

    goto :goto_0
.end method

.method public containsKey(Ljava/lang/String;)Z
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 130
    invoke-virtual {p0, p1}, Lorg/bson/types/BasicBSONList;->containsField(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public get(Ljava/lang/String;)Ljava/lang/Object;
    .locals 3
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 108
    invoke-virtual {p0, p1}, Lorg/bson/types/BasicBSONList;->_getInt(Ljava/lang/String;)I

    move-result v0

    .line 109
    .local v0, "i":I
    if-gez v0, :cond_1

    .line 113
    :cond_0
    :goto_0
    return-object v1

    .line 111
    :cond_1
    invoke-virtual {p0}, Lorg/bson/types/BasicBSONList;->size()I

    move-result v2

    if-ge v0, v2, :cond_0

    .line 113
    invoke-virtual {p0, v0}, Lorg/bson/types/BasicBSONList;->get(I)Ljava/lang/Object;

    move-result-object v1

    goto :goto_0
.end method

.method public keySet()Ljava/util/Set;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 141
    new-instance v0, Lorg/bson/util/StringRangeSet;

    invoke-virtual {p0}, Lorg/bson/types/BasicBSONList;->size()I

    move-result v1

    invoke-direct {v0, v1}, Lorg/bson/util/StringRangeSet;-><init>(I)V

    return-object v0
.end method

.method public put(ILjava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "key"    # I
    .param p2, "v"    # Ljava/lang/Object;

    .prologue
    .line 81
    :goto_0
    invoke-virtual {p0}, Lorg/bson/types/BasicBSONList;->size()I

    move-result v0

    if-lt p1, v0, :cond_0

    .line 82
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/bson/types/BasicBSONList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 83
    :cond_0
    invoke-virtual {p0, p1, p2}, Lorg/bson/types/BasicBSONList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 84
    return-object p2
.end method

.method public put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "v"    # Ljava/lang/Object;

    .prologue
    .line 70
    invoke-virtual {p0, p1}, Lorg/bson/types/BasicBSONList;->_getInt(Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p0, v0, p2}, Lorg/bson/types/BasicBSONList;->put(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public putAll(Ljava/util/Map;)V
    .locals 4
    .param p1, "m"    # Ljava/util/Map;

    .prologue
    .line 89
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 90
    .local v0, "entry":Ljava/util/Map$Entry;
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {p0, v2, v3}, Lorg/bson/types/BasicBSONList;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 92
    .end local v0    # "entry":Ljava/util/Map$Entry;
    :cond_0
    return-void
.end method

.method public putAll(Lorg/bson/BSONObject;)V
    .locals 3
    .param p1, "o"    # Lorg/bson/BSONObject;

    .prologue
    .line 95
    invoke-interface {p1}, Lorg/bson/BSONObject;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 96
    .local v1, "k":Ljava/lang/String;
    invoke-interface {p1, v1}, Lorg/bson/BSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lorg/bson/types/BasicBSONList;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 98
    .end local v1    # "k":Ljava/lang/String;
    :cond_0
    return-void
.end method

.method public removeField(Ljava/lang/String;)Ljava/lang/Object;
    .locals 3
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 117
    invoke-virtual {p0, p1}, Lorg/bson/types/BasicBSONList;->_getInt(Ljava/lang/String;)I

    move-result v0

    .line 118
    .local v0, "i":I
    if-gez v0, :cond_1

    .line 122
    :cond_0
    :goto_0
    return-object v1

    .line 120
    :cond_1
    invoke-virtual {p0}, Lorg/bson/types/BasicBSONList;->size()I

    move-result v2

    if-ge v0, v2, :cond_0

    .line 122
    invoke-virtual {p0, v0}, Lorg/bson/types/BasicBSONList;->remove(I)Ljava/lang/Object;

    move-result-object v1

    goto :goto_0
.end method

.method public toMap()Ljava/util/Map;
    .locals 4

    .prologue
    .line 146
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 147
    .local v1, "m":Ljava/util/Map;
    invoke-virtual {p0}, Lorg/bson/types/BasicBSONList;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 148
    .local v0, "i":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 149
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 150
    .local v2, "s":Ljava/lang/Object;
    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lorg/bson/types/BasicBSONList;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 152
    .end local v2    # "s":Ljava/lang/Object;
    :cond_0
    return-object v1
.end method
