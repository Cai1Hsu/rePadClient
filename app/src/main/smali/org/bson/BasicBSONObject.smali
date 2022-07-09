.class public Lorg/bson/BasicBSONObject;
.super Ljava/util/LinkedHashMap;
.source "BasicBSONObject.java"

# interfaces
.implements Lorg/bson/BSONObject;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/LinkedHashMap",
        "<",
        "Ljava/lang/String;",
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
    .line 53
    invoke-direct {p0}, Ljava/util/LinkedHashMap;-><init>()V

    .line 54
    return-void
.end method

.method public constructor <init>(I)V
    .locals 0
    .param p1, "size"    # I

    .prologue
    .line 57
    invoke-direct {p0, p1}, Ljava/util/LinkedHashMap;-><init>(I)V

    .line 58
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 0
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 65
    invoke-direct {p0}, Ljava/util/LinkedHashMap;-><init>()V

    .line 66
    invoke-virtual {p0, p1, p2}, Lorg/bson/BasicBSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 67
    return-void
.end method

.method public constructor <init>(Ljava/util/Map;)V
    .locals 0
    .param p1, "m"    # Ljava/util/Map;

    .prologue
    .line 75
    invoke-direct {p0, p1}, Ljava/util/LinkedHashMap;-><init>(Ljava/util/Map;)V

    .line 76
    return-void
.end method

.method private static canonicalize(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p0, "from"    # Ljava/lang/Object;

    .prologue
    .line 363
    instance-of v0, p0, Lorg/bson/BSONObject;

    if-eqz v0, :cond_1

    instance-of v0, p0, Lorg/bson/types/BasicBSONList;

    if-nez v0, :cond_1

    .line 364
    check-cast p0, Lorg/bson/BSONObject;

    .end local p0    # "from":Ljava/lang/Object;
    invoke-static {p0}, Lorg/bson/BasicBSONObject;->canonicalizeBSONObject(Lorg/bson/BSONObject;)Lorg/bson/BasicBSONObject;

    move-result-object p0

    .line 370
    :cond_0
    :goto_0
    return-object p0

    .line 365
    .restart local p0    # "from":Ljava/lang/Object;
    :cond_1
    instance-of v0, p0, Ljava/util/List;

    if-eqz v0, :cond_2

    .line 366
    check-cast p0, Ljava/util/List;

    .end local p0    # "from":Ljava/lang/Object;
    invoke-static {p0}, Lorg/bson/BasicBSONObject;->canonicalizeList(Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    goto :goto_0

    .line 367
    .restart local p0    # "from":Ljava/lang/Object;
    :cond_2
    instance-of v0, p0, Ljava/util/Map;

    if-eqz v0, :cond_0

    .line 368
    check-cast p0, Ljava/util/Map;

    .end local p0    # "from":Ljava/lang/Object;
    invoke-static {p0}, Lorg/bson/BasicBSONObject;->canonicalizeMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object p0

    goto :goto_0
.end method

.method private static canonicalizeBSONObject(Lorg/bson/BSONObject;)Lorg/bson/BasicBSONObject;
    .locals 6
    .param p0, "from"    # Lorg/bson/BSONObject;

    .prologue
    .line 385
    new-instance v0, Lorg/bson/BasicBSONObject;

    invoke-direct {v0}, Lorg/bson/BasicBSONObject;-><init>()V

    .line 386
    .local v0, "canonicalized":Lorg/bson/BasicBSONObject;
    new-instance v3, Ljava/util/TreeSet;

    invoke-interface {p0}, Lorg/bson/BSONObject;->keySet()Ljava/util/Set;

    move-result-object v5

    invoke-direct {v3, v5}, Ljava/util/TreeSet;-><init>(Ljava/util/Collection;)V

    .line 387
    .local v3, "keysInOrder":Ljava/util/TreeSet;, "Ljava/util/TreeSet<Ljava/lang/String;>;"
    invoke-virtual {v3}, Ljava/util/TreeSet;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 388
    .local v2, "key":Ljava/lang/String;
    invoke-interface {p0, v2}, Lorg/bson/BSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    .line 389
    .local v4, "val":Ljava/lang/Object;
    invoke-static {v4}, Lorg/bson/BasicBSONObject;->canonicalize(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v0, v2, v5}, Lorg/bson/BasicBSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 391
    .end local v2    # "key":Ljava/lang/String;
    .end local v4    # "val":Ljava/lang/Object;
    :cond_0
    return-object v0
.end method

.method private static canonicalizeList(Ljava/util/List;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Object;",
            ">;)",
            "Ljava/util/List;"
        }
    .end annotation

    .prologue
    .line 395
    .local p0, "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v3

    invoke-direct {v0, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 396
    .local v0, "canonicalized":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 397
    .local v1, "cur":Ljava/lang/Object;
    invoke-static {v1}, Lorg/bson/BasicBSONObject;->canonicalize(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 399
    .end local v1    # "cur":Ljava/lang/Object;
    :cond_0
    return-object v0
.end method

.method private static canonicalizeMap(Ljava/util/Map;)Ljava/util/Map;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 375
    .local p0, "from":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-interface {p0}, Ljava/util/Map;->size()I

    move-result v5

    invoke-direct {v0, v5}, Ljava/util/LinkedHashMap;-><init>(I)V

    .line 376
    .local v0, "canonicalized":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    new-instance v3, Ljava/util/TreeSet;

    invoke-interface {p0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v5

    invoke-direct {v3, v5}, Ljava/util/TreeSet;-><init>(Ljava/util/Collection;)V

    .line 377
    .local v3, "keysInOrder":Ljava/util/TreeSet;, "Ljava/util/TreeSet<Ljava/lang/String;>;"
    invoke-virtual {v3}, Ljava/util/TreeSet;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 378
    .local v2, "key":Ljava/lang/String;
    invoke-interface {p0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    .line 379
    .local v4, "val":Ljava/lang/Object;
    invoke-static {v4}, Lorg/bson/BasicBSONObject;->canonicalize(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    invoke-interface {v0, v2, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 381
    .end local v2    # "key":Ljava/lang/String;
    .end local v4    # "val":Ljava/lang/Object;
    :cond_0
    return-object v0
.end method

.method private decode([B)Lorg/bson/BSONObject;
    .locals 1
    .param p1, "encodedBytes"    # [B

    .prologue
    .line 357
    new-instance v0, Lorg/bson/BasicBSONDecoder;

    invoke-direct {v0}, Lorg/bson/BasicBSONDecoder;-><init>()V

    invoke-virtual {v0, p1}, Lorg/bson/BasicBSONDecoder;->readObject([B)Lorg/bson/BSONObject;

    move-result-object v0

    return-object v0
.end method

.method private encode()[B
    .locals 1

    .prologue
    .line 353
    new-instance v0, Lorg/bson/BasicBSONEncoder;

    invoke-direct {v0}, Lorg/bson/BasicBSONEncoder;-><init>()V

    invoke-virtual {v0, p0}, Lorg/bson/BasicBSONEncoder;->encode(Lorg/bson/BSONObject;)[B

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public append(Ljava/lang/String;Ljava/lang/Object;)Lorg/bson/BasicBSONObject;
    .locals 0
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "val"    # Ljava/lang/Object;

    .prologue
    .line 310
    invoke-virtual {p0, p1, p2}, Lorg/bson/BasicBSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 312
    return-object p0
.end method

.method public containsField(Ljava/lang/String;)Z
    .locals 1
    .param p1, "field"    # Ljava/lang/String;

    .prologue
    .line 99
    invoke-super {p0, p1}, Ljava/util/LinkedHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public containsKey(Ljava/lang/String;)Z
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 107
    invoke-virtual {p0, p1}, Lorg/bson/BasicBSONObject;->containsField(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 330
    if-ne p1, p0, :cond_1

    .line 331
    const/4 v1, 0x1

    .line 344
    :cond_0
    :goto_0
    return v1

    .line 334
    :cond_1
    instance-of v2, p1, Lorg/bson/BSONObject;

    if-eqz v2, :cond_0

    move-object v0, p1

    .line 338
    check-cast v0, Lorg/bson/BSONObject;

    .line 340
    .local v0, "other":Lorg/bson/BSONObject;
    invoke-virtual {p0}, Lorg/bson/BasicBSONObject;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v0}, Lorg/bson/BSONObject;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Set;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 344
    invoke-static {p0}, Lorg/bson/BasicBSONObject;->canonicalizeBSONObject(Lorg/bson/BSONObject;)Lorg/bson/BasicBSONObject;

    move-result-object v1

    invoke-direct {v1}, Lorg/bson/BasicBSONObject;->encode()[B

    move-result-object v1

    invoke-static {v0}, Lorg/bson/BasicBSONObject;->canonicalizeBSONObject(Lorg/bson/BSONObject;)Lorg/bson/BasicBSONObject;

    move-result-object v2

    invoke-direct {v2}, Lorg/bson/BasicBSONObject;->encode()[B

    move-result-object v2

    invoke-static {v1, v2}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v1

    goto :goto_0
.end method

.method public get(Ljava/lang/String;)Ljava/lang/Object;
    .locals 1
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 115
    invoke-super {p0, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getBoolean(Ljava/lang/String;)Z
    .locals 1
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 223
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lorg/bson/BasicBSONObject;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public getBoolean(Ljava/lang/String;Z)Z
    .locals 4
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "def"    # Z

    .prologue
    .line 232
    invoke-virtual {p0, p1}, Lorg/bson/BasicBSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 233
    .local v0, "foo":Ljava/lang/Object;
    if-nez v0, :cond_0

    .line 238
    .end local v0    # "foo":Ljava/lang/Object;
    .end local p2    # "def":Z
    :goto_0
    return p2

    .line 235
    .restart local v0    # "foo":Ljava/lang/Object;
    .restart local p2    # "def":Z
    :cond_0
    instance-of v1, v0, Ljava/lang/Number;

    if-eqz v1, :cond_2

    .line 236
    check-cast v0, Ljava/lang/Number;

    .end local v0    # "foo":Ljava/lang/Object;
    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    move-result v1

    if-lez v1, :cond_1

    const/4 v1, 0x1

    :goto_1
    move p2, v1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    goto :goto_1

    .line 237
    .restart local v0    # "foo":Ljava/lang/Object;
    :cond_2
    instance-of v1, v0, Ljava/lang/Boolean;

    if-eqz v1, :cond_3

    .line 238
    check-cast v0, Ljava/lang/Boolean;

    .end local v0    # "foo":Ljava/lang/Object;
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    goto :goto_0

    .line 239
    .restart local v0    # "foo":Ljava/lang/Object;
    :cond_3
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "can\'t coerce to bool:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public getDate(Ljava/lang/String;)Ljava/util/Date;
    .locals 1
    .param p1, "field"    # Ljava/lang/String;

    .prologue
    .line 268
    invoke-virtual {p0, p1}, Lorg/bson/BasicBSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Date;

    return-object v0
.end method

.method public getDate(Ljava/lang/String;Ljava/util/Date;)Ljava/util/Date;
    .locals 1
    .param p1, "field"    # Ljava/lang/String;
    .param p2, "def"    # Ljava/util/Date;

    .prologue
    .line 278
    invoke-virtual {p0, p1}, Lorg/bson/BasicBSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 279
    .local v0, "foo":Ljava/lang/Object;
    if-eqz v0, :cond_0

    check-cast v0, Ljava/util/Date;

    .end local v0    # "foo":Ljava/lang/Object;
    :goto_0
    return-object v0

    .restart local v0    # "foo":Ljava/lang/Object;
    :cond_0
    move-object v0, p2

    goto :goto_0
.end method

.method public getDouble(Ljava/lang/String;)D
    .locals 4
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 175
    invoke-virtual {p0, p1}, Lorg/bson/BasicBSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 176
    .local v0, "foo":Ljava/lang/Object;
    check-cast v0, Ljava/lang/Number;

    .end local v0    # "foo":Ljava/lang/Object;
    invoke-virtual {v0}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v2

    return-wide v2
.end method

.method public getDouble(Ljava/lang/String;D)D
    .locals 2
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "def"    # D

    .prologue
    .line 186
    invoke-virtual {p0, p1}, Lorg/bson/BasicBSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 187
    .local v0, "foo":Ljava/lang/Object;
    if-nez v0, :cond_0

    .line 190
    .end local v0    # "foo":Ljava/lang/Object;
    .end local p2    # "def":D
    :goto_0
    return-wide p2

    .restart local v0    # "foo":Ljava/lang/Object;
    .restart local p2    # "def":D
    :cond_0
    check-cast v0, Ljava/lang/Number;

    .end local v0    # "foo":Ljava/lang/Object;
    invoke-virtual {v0}, Ljava/lang/Number;->doubleValue()D

    move-result-wide p2

    goto :goto_0
.end method

.method public getInt(Ljava/lang/String;)I
    .locals 4
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 123
    invoke-virtual {p0, p1}, Lorg/bson/BasicBSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 124
    .local v0, "o":Ljava/lang/Object;
    if-nez v0, :cond_0

    .line 125
    new-instance v1, Ljava/lang/NullPointerException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "no value for: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 127
    :cond_0
    invoke-static {v0}, Lorg/bson/BSON;->toInt(Ljava/lang/Object;)I

    move-result v1

    return v1
.end method

.method public getInt(Ljava/lang/String;I)I
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "def"    # I

    .prologue
    .line 136
    invoke-virtual {p0, p1}, Lorg/bson/BasicBSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 137
    .local v0, "foo":Ljava/lang/Object;
    if-nez v0, :cond_0

    .line 140
    .end local p2    # "def":I
    :goto_0
    return p2

    .restart local p2    # "def":I
    :cond_0
    invoke-static {v0}, Lorg/bson/BSON;->toInt(Ljava/lang/Object;)I

    move-result p2

    goto :goto_0
.end method

.method public getLong(Ljava/lang/String;)J
    .locals 4
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 150
    invoke-virtual {p0, p1}, Lorg/bson/BasicBSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 151
    .local v0, "foo":Ljava/lang/Object;
    check-cast v0, Ljava/lang/Number;

    .end local v0    # "foo":Ljava/lang/Object;
    invoke-virtual {v0}, Ljava/lang/Number;->longValue()J

    move-result-wide v2

    return-wide v2
.end method

.method public getLong(Ljava/lang/String;J)J
    .locals 2
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "def"    # J

    .prologue
    .line 161
    invoke-virtual {p0, p1}, Lorg/bson/BasicBSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 162
    .local v0, "foo":Ljava/lang/Object;
    if-nez v0, :cond_0

    .line 165
    .end local v0    # "foo":Ljava/lang/Object;
    .end local p2    # "def":J
    :goto_0
    return-wide p2

    .restart local v0    # "foo":Ljava/lang/Object;
    .restart local p2    # "def":J
    :cond_0
    check-cast v0, Ljava/lang/Number;

    .end local v0    # "foo":Ljava/lang/Object;
    invoke-virtual {v0}, Ljava/lang/Number;->longValue()J

    move-result-wide p2

    goto :goto_0
.end method

.method public getObjectId(Ljava/lang/String;)Lorg/bson/types/ObjectId;
    .locals 1
    .param p1, "field"    # Ljava/lang/String;

    .prologue
    .line 248
    invoke-virtual {p0, p1}, Lorg/bson/BasicBSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/bson/types/ObjectId;

    return-object v0
.end method

.method public getObjectId(Ljava/lang/String;Lorg/bson/types/ObjectId;)Lorg/bson/types/ObjectId;
    .locals 1
    .param p1, "field"    # Ljava/lang/String;
    .param p2, "def"    # Lorg/bson/types/ObjectId;

    .prologue
    .line 258
    invoke-virtual {p0, p1}, Lorg/bson/BasicBSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 259
    .local v0, "foo":Ljava/lang/Object;
    if-eqz v0, :cond_0

    check-cast v0, Lorg/bson/types/ObjectId;

    .end local v0    # "foo":Ljava/lang/Object;
    :goto_0
    return-object v0

    .restart local v0    # "foo":Ljava/lang/Object;
    :cond_0
    move-object v0, p2

    goto :goto_0
.end method

.method public getString(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 198
    invoke-virtual {p0, p1}, Lorg/bson/BasicBSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 199
    .local v0, "foo":Ljava/lang/Object;
    if-nez v0, :cond_0

    .line 200
    const/4 v1, 0x0

    .line 201
    :goto_0
    return-object v1

    :cond_0
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method public getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "def"    # Ljava/lang/String;

    .prologue
    .line 211
    invoke-virtual {p0, p1}, Lorg/bson/BasicBSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 212
    .local v0, "foo":Ljava/lang/Object;
    if-nez v0, :cond_0

    .line 215
    .end local p2    # "def":Ljava/lang/String;
    :goto_0
    return-object p2

    .restart local p2    # "def":Ljava/lang/String;
    :cond_0
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    goto :goto_0
.end method

.method public hashCode()I
    .locals 1

    .prologue
    .line 349
    invoke-static {p0}, Lorg/bson/BasicBSONObject;->canonicalizeBSONObject(Lorg/bson/BSONObject;)Lorg/bson/BasicBSONObject;

    move-result-object v0

    invoke-direct {v0}, Lorg/bson/BasicBSONObject;->encode()[B

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->hashCode([B)I

    move-result v0

    return v0
.end method

.method public bridge synthetic put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    .line 46
    check-cast p1, Ljava/lang/String;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lorg/bson/BasicBSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "val"    # Ljava/lang/Object;

    .prologue
    .line 288
    invoke-super {p0, p1, p2}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public putAll(Ljava/util/Map;)V
    .locals 4
    .param p1, "m"    # Ljava/util/Map;

    .prologue
    .line 293
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

    .line 294
    .local v0, "entry":Ljava/util/Map$Entry;
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {p0, v2, v3}, Lorg/bson/BasicBSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 296
    .end local v0    # "entry":Ljava/util/Map$Entry;
    :cond_0
    return-void
.end method

.method public putAll(Lorg/bson/BSONObject;)V
    .locals 3
    .param p1, "o"    # Lorg/bson/BSONObject;

    .prologue
    .line 299
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

    .line 300
    .local v1, "k":Ljava/lang/String;
    invoke-interface {p1, v1}, Lorg/bson/BSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lorg/bson/BasicBSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 302
    .end local v1    # "k":Ljava/lang/String;
    :cond_0
    return-void
.end method

.method public removeField(Ljava/lang/String;)Ljava/lang/Object;
    .locals 1
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 91
    invoke-virtual {p0, p1}, Lorg/bson/BasicBSONObject;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public toMap()Ljava/util/Map;
    .locals 1

    .prologue
    .line 83
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0, p0}, Ljava/util/LinkedHashMap;-><init>(Ljava/util/Map;)V

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 319
    invoke-static {}, Lcom/mongodb/util/JSONSerializers;->getStrict()Lcom/mongodb/util/ObjectSerializer;

    move-result-object v0

    invoke-interface {v0, p0}, Lcom/mongodb/util/ObjectSerializer;->serialize(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
