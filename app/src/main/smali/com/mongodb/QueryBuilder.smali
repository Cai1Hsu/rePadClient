.class public Lcom/mongodb/QueryBuilder;
.super Ljava/lang/Object;
.source "QueryBuilder.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mongodb/QueryBuilder$1;,
        Lcom/mongodb/QueryBuilder$NullObject;,
        Lcom/mongodb/QueryBuilder$QueryBuilderException;
    }
.end annotation


# instance fields
.field private _currentKey:Ljava/lang/String;

.field private _hasNot:Z

.field private _query:Lcom/mongodb/DBObject;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    new-instance v0, Lcom/mongodb/BasicDBObject;

    invoke-direct {v0}, Lcom/mongodb/BasicDBObject;-><init>()V

    iput-object v0, p0, Lcom/mongodb/QueryBuilder;->_query:Lcom/mongodb/DBObject;

    .line 43
    return-void
.end method

.method private addOperand(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 7
    .param p1, "op"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    const/4 v6, 0x0

    .line 431
    if-nez p1, :cond_1

    .line 432
    iget-boolean v4, p0, Lcom/mongodb/QueryBuilder;->_hasNot:Z

    if-eqz v4, :cond_0

    .line 433
    new-instance v3, Lcom/mongodb/BasicDBObject;

    const-string/jumbo v4, "$not"

    invoke-direct {v3, v4, p2}, Lcom/mongodb/BasicDBObject;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    .line 434
    .local v3, "value":Lcom/mongodb/BasicDBObject;
    iput-boolean v6, p0, Lcom/mongodb/QueryBuilder;->_hasNot:Z

    .end local p2    # "value":Ljava/lang/Object;
    move-object p2, v3

    .line 436
    .end local v3    # "value":Lcom/mongodb/BasicDBObject;
    .restart local p2    # "value":Ljava/lang/Object;
    :cond_0
    iget-object v4, p0, Lcom/mongodb/QueryBuilder;->_query:Lcom/mongodb/DBObject;

    iget-object v5, p0, Lcom/mongodb/QueryBuilder;->_currentKey:Ljava/lang/String;

    invoke-interface {v4, v5, p2}, Lcom/mongodb/DBObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 458
    :goto_0
    return-void

    .line 440
    :cond_1
    iget-object v4, p0, Lcom/mongodb/QueryBuilder;->_query:Lcom/mongodb/DBObject;

    iget-object v5, p0, Lcom/mongodb/QueryBuilder;->_currentKey:Ljava/lang/String;

    invoke-interface {v4, v5}, Lcom/mongodb/DBObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    .line 442
    .local v2, "storedValue":Ljava/lang/Object;
    instance-of v4, v2, Lcom/mongodb/DBObject;

    if-nez v4, :cond_4

    .line 443
    new-instance v1, Lcom/mongodb/BasicDBObject;

    invoke-direct {v1}, Lcom/mongodb/BasicDBObject;-><init>()V

    .line 444
    .local v1, "operand":Lcom/mongodb/BasicDBObject;
    iget-boolean v4, p0, Lcom/mongodb/QueryBuilder;->_hasNot:Z

    if-eqz v4, :cond_3

    .line 445
    new-instance v0, Lcom/mongodb/BasicDBObject;

    const-string/jumbo v4, "$not"

    invoke-direct {v0, v4, v1}, Lcom/mongodb/BasicDBObject;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    .line 446
    .local v0, "notOperand":Lcom/mongodb/DBObject;
    iget-object v4, p0, Lcom/mongodb/QueryBuilder;->_query:Lcom/mongodb/DBObject;

    iget-object v5, p0, Lcom/mongodb/QueryBuilder;->_currentKey:Ljava/lang/String;

    invoke-interface {v4, v5, v0}, Lcom/mongodb/DBObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 447
    iput-boolean v6, p0, Lcom/mongodb/QueryBuilder;->_hasNot:Z

    .line 457
    .end local v0    # "notOperand":Lcom/mongodb/DBObject;
    :cond_2
    :goto_1
    invoke-virtual {v1, p1, p2}, Lcom/mongodb/BasicDBObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 449
    :cond_3
    iget-object v4, p0, Lcom/mongodb/QueryBuilder;->_query:Lcom/mongodb/DBObject;

    iget-object v5, p0, Lcom/mongodb/QueryBuilder;->_currentKey:Ljava/lang/String;

    invoke-interface {v4, v5, v1}, Lcom/mongodb/DBObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 452
    .end local v1    # "operand":Lcom/mongodb/BasicDBObject;
    :cond_4
    iget-object v4, p0, Lcom/mongodb/QueryBuilder;->_query:Lcom/mongodb/DBObject;

    iget-object v5, p0, Lcom/mongodb/QueryBuilder;->_currentKey:Ljava/lang/String;

    invoke-interface {v4, v5}, Lcom/mongodb/DBObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mongodb/BasicDBObject;

    .line 453
    .restart local v1    # "operand":Lcom/mongodb/BasicDBObject;
    const-string/jumbo v4, "$not"

    invoke-virtual {v1, v4}, Lcom/mongodb/BasicDBObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_2

    .line 454
    const-string/jumbo v4, "$not"

    invoke-virtual {v1, v4}, Lcom/mongodb/BasicDBObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .end local v1    # "operand":Lcom/mongodb/BasicDBObject;
    check-cast v1, Lcom/mongodb/BasicDBObject;

    .restart local v1    # "operand":Lcom/mongodb/BasicDBObject;
    goto :goto_1
.end method

.method public static start()Lcom/mongodb/QueryBuilder;
    .locals 1

    .prologue
    .line 50
    new-instance v0, Lcom/mongodb/QueryBuilder;

    invoke-direct {v0}, Lcom/mongodb/QueryBuilder;-><init>()V

    return-object v0
.end method

.method public static start(Ljava/lang/String;)Lcom/mongodb/QueryBuilder;
    .locals 1
    .param p0, "key"    # Ljava/lang/String;

    .prologue
    .line 59
    new-instance v0, Lcom/mongodb/QueryBuilder;

    invoke-direct {v0}, Lcom/mongodb/QueryBuilder;-><init>()V

    invoke-virtual {v0, p0}, Lcom/mongodb/QueryBuilder;->put(Ljava/lang/String;)Lcom/mongodb/QueryBuilder;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public all(Ljava/lang/Object;)Lcom/mongodb/QueryBuilder;
    .locals 1
    .param p1, "object"    # Ljava/lang/Object;

    .prologue
    .line 182
    const-string/jumbo v0, "$all"

    invoke-direct {p0, v0, p1}, Lcom/mongodb/QueryBuilder;->addOperand(Ljava/lang/String;Ljava/lang/Object;)V

    .line 183
    return-object p0
.end method

.method public and(Ljava/lang/String;)Lcom/mongodb/QueryBuilder;
    .locals 1
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 83
    invoke-virtual {p0, p1}, Lcom/mongodb/QueryBuilder;->put(Ljava/lang/String;)Lcom/mongodb/QueryBuilder;

    move-result-object v0

    return-object v0
.end method

.method public varargs and([Lcom/mongodb/DBObject;)Lcom/mongodb/QueryBuilder;
    .locals 3
    .param p1, "ands"    # [Lcom/mongodb/DBObject;

    .prologue
    .line 407
    iget-object v1, p0, Lcom/mongodb/QueryBuilder;->_query:Lcom/mongodb/DBObject;

    const-string/jumbo v2, "$and"

    invoke-interface {v1, v2}, Lcom/mongodb/DBObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 408
    .local v0, "l":Ljava/util/List;
    if-nez v0, :cond_0

    .line 409
    new-instance v0, Ljava/util/ArrayList;

    .end local v0    # "l":Ljava/util/List;
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 410
    .restart local v0    # "l":Ljava/util/List;
    iget-object v1, p0, Lcom/mongodb/QueryBuilder;->_query:Lcom/mongodb/DBObject;

    const-string/jumbo v2, "$and"

    invoke-interface {v1, v2, v0}, Lcom/mongodb/DBObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 412
    :cond_0
    invoke-static {v0, p1}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    .line 413
    return-object p0
.end method

.method public elemMatch(Lcom/mongodb/DBObject;)Lcom/mongodb/QueryBuilder;
    .locals 1
    .param p1, "match"    # Lcom/mongodb/DBObject;

    .prologue
    .line 222
    const-string/jumbo v0, "$elemMatch"

    invoke-direct {p0, v0, p1}, Lcom/mongodb/QueryBuilder;->addOperand(Ljava/lang/String;Ljava/lang/Object;)V

    .line 223
    return-object p0
.end method

.method public exists(Ljava/lang/Object;)Lcom/mongodb/QueryBuilder;
    .locals 1
    .param p1, "object"    # Ljava/lang/Object;

    .prologue
    .line 202
    const-string/jumbo v0, "$exists"

    invoke-direct {p0, v0, p1}, Lcom/mongodb/QueryBuilder;->addOperand(Ljava/lang/String;Ljava/lang/Object;)V

    .line 203
    return-object p0
.end method

.method public get()Lcom/mongodb/DBObject;
    .locals 5

    .prologue
    .line 422
    iget-object v2, p0, Lcom/mongodb/QueryBuilder;->_query:Lcom/mongodb/DBObject;

    invoke-interface {v2}, Lcom/mongodb/DBObject;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 423
    .local v1, "key":Ljava/lang/String;
    iget-object v2, p0, Lcom/mongodb/QueryBuilder;->_query:Lcom/mongodb/DBObject;

    invoke-interface {v2, v1}, Lcom/mongodb/DBObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    instance-of v2, v2, Lcom/mongodb/QueryBuilder$NullObject;

    if-eqz v2, :cond_0

    .line 424
    new-instance v2, Lcom/mongodb/QueryBuilder$QueryBuilderException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "No operand for key:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/mongodb/QueryBuilder$QueryBuilderException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 427
    .end local v1    # "key":Ljava/lang/String;
    :cond_1
    iget-object v2, p0, Lcom/mongodb/QueryBuilder;->_query:Lcom/mongodb/DBObject;

    return-object v2
.end method

.method public greaterThan(Ljava/lang/Object;)Lcom/mongodb/QueryBuilder;
    .locals 1
    .param p1, "object"    # Ljava/lang/Object;

    .prologue
    .line 92
    const-string/jumbo v0, "$gt"

    invoke-direct {p0, v0, p1}, Lcom/mongodb/QueryBuilder;->addOperand(Ljava/lang/String;Ljava/lang/Object;)V

    .line 93
    return-object p0
.end method

.method public greaterThanEquals(Ljava/lang/Object;)Lcom/mongodb/QueryBuilder;
    .locals 1
    .param p1, "object"    # Ljava/lang/Object;

    .prologue
    .line 102
    const-string/jumbo v0, "$gte"

    invoke-direct {p0, v0, p1}, Lcom/mongodb/QueryBuilder;->addOperand(Ljava/lang/String;Ljava/lang/Object;)V

    .line 103
    return-object p0
.end method

.method public in(Ljava/lang/Object;)Lcom/mongodb/QueryBuilder;
    .locals 1
    .param p1, "object"    # Ljava/lang/Object;

    .prologue
    .line 152
    const-string/jumbo v0, "$in"

    invoke-direct {p0, v0, p1}, Lcom/mongodb/QueryBuilder;->addOperand(Ljava/lang/String;Ljava/lang/Object;)V

    .line 153
    return-object p0
.end method

.method public is(Ljava/lang/Object;)Lcom/mongodb/QueryBuilder;
    .locals 1
    .param p1, "object"    # Ljava/lang/Object;

    .prologue
    .line 132
    const/4 v0, 0x0

    invoke-direct {p0, v0, p1}, Lcom/mongodb/QueryBuilder;->addOperand(Ljava/lang/String;Ljava/lang/Object;)V

    .line 133
    return-object p0
.end method

.method public lessThan(Ljava/lang/Object;)Lcom/mongodb/QueryBuilder;
    .locals 1
    .param p1, "object"    # Ljava/lang/Object;

    .prologue
    .line 112
    const-string/jumbo v0, "$lt"

    invoke-direct {p0, v0, p1}, Lcom/mongodb/QueryBuilder;->addOperand(Ljava/lang/String;Ljava/lang/Object;)V

    .line 113
    return-object p0
.end method

.method public lessThanEquals(Ljava/lang/Object;)Lcom/mongodb/QueryBuilder;
    .locals 1
    .param p1, "object"    # Ljava/lang/Object;

    .prologue
    .line 122
    const-string/jumbo v0, "$lte"

    invoke-direct {p0, v0, p1}, Lcom/mongodb/QueryBuilder;->addOperand(Ljava/lang/String;Ljava/lang/Object;)V

    .line 123
    return-object p0
.end method

.method public mod(Ljava/lang/Object;)Lcom/mongodb/QueryBuilder;
    .locals 1
    .param p1, "object"    # Ljava/lang/Object;

    .prologue
    .line 172
    const-string/jumbo v0, "$mod"

    invoke-direct {p0, v0, p1}, Lcom/mongodb/QueryBuilder;->addOperand(Ljava/lang/String;Ljava/lang/Object;)V

    .line 173
    return-object p0
.end method

.method public near(DD)Lcom/mongodb/QueryBuilder;
    .locals 5
    .param p1, "x"    # D
    .param p3, "y"    # D

    .prologue
    .line 248
    const-string/jumbo v0, "$near"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Double;

    const/4 v2, 0x0

    invoke-static {p1, p2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    invoke-static {p3, p4}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/mongodb/QueryBuilder;->addOperand(Ljava/lang/String;Ljava/lang/Object;)V

    .line 250
    return-object p0
.end method

.method public near(DDD)Lcom/mongodb/QueryBuilder;
    .locals 5
    .param p1, "x"    # D
    .param p3, "y"    # D
    .param p5, "maxDistance"    # D

    .prologue
    .line 261
    const-string/jumbo v0, "$near"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Double;

    const/4 v2, 0x0

    invoke-static {p1, p2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    invoke-static {p3, p4}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/mongodb/QueryBuilder;->addOperand(Ljava/lang/String;Ljava/lang/Object;)V

    .line 263
    const-string/jumbo v0, "$maxDistance"

    invoke-static {p5, p6}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/mongodb/QueryBuilder;->addOperand(Ljava/lang/String;Ljava/lang/Object;)V

    .line 266
    return-object p0
.end method

.method public nearSphere(DD)Lcom/mongodb/QueryBuilder;
    .locals 5
    .param p1, "longitude"    # D
    .param p3, "latitude"    # D

    .prologue
    .line 276
    const-string/jumbo v0, "$nearSphere"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Double;

    const/4 v2, 0x0

    invoke-static {p1, p2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    invoke-static {p3, p4}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/mongodb/QueryBuilder;->addOperand(Ljava/lang/String;Ljava/lang/Object;)V

    .line 278
    return-object p0
.end method

.method public nearSphere(DDD)Lcom/mongodb/QueryBuilder;
    .locals 5
    .param p1, "longitude"    # D
    .param p3, "latitude"    # D
    .param p5, "maxDistance"    # D

    .prologue
    .line 289
    const-string/jumbo v0, "$nearSphere"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Double;

    const/4 v2, 0x0

    invoke-static {p1, p2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    invoke-static {p3, p4}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/mongodb/QueryBuilder;->addOperand(Ljava/lang/String;Ljava/lang/Object;)V

    .line 291
    const-string/jumbo v0, "$maxDistance"

    invoke-static {p5, p6}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/mongodb/QueryBuilder;->addOperand(Ljava/lang/String;Ljava/lang/Object;)V

    .line 293
    return-object p0
.end method

.method public not()Lcom/mongodb/QueryBuilder;
    .locals 1

    .prologue
    .line 380
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mongodb/QueryBuilder;->_hasNot:Z

    .line 381
    return-object p0
.end method

.method public notEquals(Ljava/lang/Object;)Lcom/mongodb/QueryBuilder;
    .locals 1
    .param p1, "object"    # Ljava/lang/Object;

    .prologue
    .line 142
    const-string/jumbo v0, "$ne"

    invoke-direct {p0, v0, p1}, Lcom/mongodb/QueryBuilder;->addOperand(Ljava/lang/String;Ljava/lang/Object;)V

    .line 143
    return-object p0
.end method

.method public notIn(Ljava/lang/Object;)Lcom/mongodb/QueryBuilder;
    .locals 1
    .param p1, "object"    # Ljava/lang/Object;

    .prologue
    .line 162
    const-string/jumbo v0, "$nin"

    invoke-direct {p0, v0, p1}, Lcom/mongodb/QueryBuilder;->addOperand(Ljava/lang/String;Ljava/lang/Object;)V

    .line 163
    return-object p0
.end method

.method public varargs or([Lcom/mongodb/DBObject;)Lcom/mongodb/QueryBuilder;
    .locals 3
    .param p1, "ors"    # [Lcom/mongodb/DBObject;

    .prologue
    .line 391
    iget-object v1, p0, Lcom/mongodb/QueryBuilder;->_query:Lcom/mongodb/DBObject;

    const-string/jumbo v2, "$or"

    invoke-interface {v1, v2}, Lcom/mongodb/DBObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 392
    .local v0, "l":Ljava/util/List;
    if-nez v0, :cond_0

    .line 393
    new-instance v0, Ljava/util/ArrayList;

    .end local v0    # "l":Ljava/util/List;
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 394
    .restart local v0    # "l":Ljava/util/List;
    iget-object v1, p0, Lcom/mongodb/QueryBuilder;->_query:Lcom/mongodb/DBObject;

    const-string/jumbo v2, "$or"

    invoke-interface {v1, v2, v0}, Lcom/mongodb/DBObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 396
    :cond_0
    invoke-static {v0, p1}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    .line 397
    return-object p0
.end method

.method public put(Ljava/lang/String;)Lcom/mongodb/QueryBuilder;
    .locals 4
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 69
    iput-object p1, p0, Lcom/mongodb/QueryBuilder;->_currentKey:Ljava/lang/String;

    .line 70
    iget-object v0, p0, Lcom/mongodb/QueryBuilder;->_query:Lcom/mongodb/DBObject;

    invoke-interface {v0, p1}, Lcom/mongodb/DBObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_0

    .line 71
    iget-object v0, p0, Lcom/mongodb/QueryBuilder;->_query:Lcom/mongodb/DBObject;

    iget-object v1, p0, Lcom/mongodb/QueryBuilder;->_currentKey:Ljava/lang/String;

    new-instance v2, Lcom/mongodb/QueryBuilder$NullObject;

    const/4 v3, 0x0

    invoke-direct {v2, v3}, Lcom/mongodb/QueryBuilder$NullObject;-><init>(Lcom/mongodb/QueryBuilder$1;)V

    invoke-interface {v0, v1, v2}, Lcom/mongodb/DBObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 73
    :cond_0
    return-object p0
.end method

.method public regex(Ljava/util/regex/Pattern;)Lcom/mongodb/QueryBuilder;
    .locals 1
    .param p1, "regex"    # Ljava/util/regex/Pattern;

    .prologue
    .line 212
    const/4 v0, 0x0

    invoke-direct {p0, v0, p1}, Lcom/mongodb/QueryBuilder;->addOperand(Ljava/lang/String;Ljava/lang/Object;)V

    .line 213
    return-object p0
.end method

.method public size(Ljava/lang/Object;)Lcom/mongodb/QueryBuilder;
    .locals 1
    .param p1, "object"    # Ljava/lang/Object;

    .prologue
    .line 192
    const-string/jumbo v0, "$size"

    invoke-direct {p0, v0, p1}, Lcom/mongodb/QueryBuilder;->addOperand(Ljava/lang/String;Ljava/lang/Object;)V

    .line 193
    return-object p0
.end method

.method public text(Ljava/lang/String;)Lcom/mongodb/QueryBuilder;
    .locals 1
    .param p1, "search"    # Ljava/lang/String;

    .prologue
    .line 347
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/mongodb/QueryBuilder;->text(Ljava/lang/String;Ljava/lang/String;)Lcom/mongodb/QueryBuilder;

    move-result-object v0

    return-object v0
.end method

.method public text(Ljava/lang/String;Ljava/lang/String;)Lcom/mongodb/QueryBuilder;
    .locals 2
    .param p1, "search"    # Ljava/lang/String;
    .param p2, "language"    # Ljava/lang/String;

    .prologue
    .line 359
    iget-object v0, p0, Lcom/mongodb/QueryBuilder;->_currentKey:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 360
    new-instance v0, Lcom/mongodb/QueryBuilder$QueryBuilderException;

    const-string/jumbo v1, "The text operand may only occur at the top-level of a query. It does not apply to a specific element, but rather to a document as a whole."

    invoke-direct {v0, v1}, Lcom/mongodb/QueryBuilder$QueryBuilderException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 364
    :cond_0
    const-string/jumbo v0, "$text"

    invoke-virtual {p0, v0}, Lcom/mongodb/QueryBuilder;->put(Ljava/lang/String;)Lcom/mongodb/QueryBuilder;

    .line 365
    const-string/jumbo v0, "$search"

    invoke-direct {p0, v0, p1}, Lcom/mongodb/QueryBuilder;->addOperand(Ljava/lang/String;Ljava/lang/Object;)V

    .line 366
    if-eqz p2, :cond_1

    .line 367
    const-string/jumbo v0, "$language"

    invoke-direct {p0, v0, p2}, Lcom/mongodb/QueryBuilder;->addOperand(Ljava/lang/String;Ljava/lang/Object;)V

    .line 370
    :cond_1
    return-object p0
.end method

.method public withinBox(DDDD)Lcom/mongodb/QueryBuilder;
    .locals 9
    .param p1, "x"    # D
    .param p3, "y"    # D
    .param p5, "x2"    # D
    .param p7, "y2"    # D

    .prologue
    .line 320
    const-string/jumbo v0, "$within"

    new-instance v1, Lcom/mongodb/BasicDBObject;

    const-string/jumbo v2, "$box"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Double;

    const/4 v6, 0x0

    invoke-static {p1, p2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x1

    invoke-static {p3, p4}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v7

    aput-object v7, v5, v6

    aput-object v5, v3, v4

    const/4 v4, 0x1

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Double;

    const/4 v6, 0x0

    invoke-static {p5, p6}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x1

    invoke-static/range {p7 .. p8}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v7

    aput-object v7, v5, v6

    aput-object v5, v3, v4

    invoke-direct {v1, v2, v3}, Lcom/mongodb/BasicDBObject;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-direct {p0, v0, v1}, Lcom/mongodb/QueryBuilder;->addOperand(Ljava/lang/String;Ljava/lang/Object;)V

    .line 322
    return-object p0
.end method

.method public withinCenter(DDD)Lcom/mongodb/QueryBuilder;
    .locals 9
    .param p1, "x"    # D
    .param p3, "y"    # D
    .param p5, "radius"    # D

    .prologue
    const/4 v4, 0x2

    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 236
    const-string/jumbo v0, "$within"

    new-instance v1, Lcom/mongodb/BasicDBObject;

    const-string/jumbo v2, "$center"

    new-array v3, v4, [Ljava/lang/Object;

    new-array v4, v4, [Ljava/lang/Double;

    invoke-static {p1, p2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v5

    aput-object v5, v4, v6

    invoke-static {p3, p4}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v5

    aput-object v5, v4, v7

    aput-object v4, v3, v6

    invoke-static {p5, p6}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v4

    aput-object v4, v3, v7

    invoke-direct {v1, v2, v3}, Lcom/mongodb/BasicDBObject;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-direct {p0, v0, v1}, Lcom/mongodb/QueryBuilder;->addOperand(Ljava/lang/String;Ljava/lang/Object;)V

    .line 238
    return-object p0
.end method

.method public withinCenterSphere(DDD)Lcom/mongodb/QueryBuilder;
    .locals 9
    .param p1, "longitude"    # D
    .param p3, "latitude"    # D
    .param p5, "maxDistance"    # D

    .prologue
    const/4 v4, 0x2

    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 305
    const-string/jumbo v0, "$within"

    new-instance v1, Lcom/mongodb/BasicDBObject;

    const-string/jumbo v2, "$centerSphere"

    new-array v3, v4, [Ljava/lang/Object;

    new-array v4, v4, [Ljava/lang/Double;

    invoke-static {p1, p2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v5

    aput-object v5, v4, v6

    invoke-static {p3, p4}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v5

    aput-object v5, v4, v7

    aput-object v4, v3, v6

    invoke-static {p5, p6}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v4

    aput-object v4, v3, v7

    invoke-direct {v1, v2, v3}, Lcom/mongodb/BasicDBObject;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-direct {p0, v0, v1}, Lcom/mongodb/QueryBuilder;->addOperand(Ljava/lang/String;Ljava/lang/Object;)V

    .line 307
    return-object p0
.end method

.method public withinPolygon(Ljava/util/List;)Lcom/mongodb/QueryBuilder;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<[",
            "Ljava/lang/Double;",
            ">;)",
            "Lcom/mongodb/QueryBuilder;"
        }
    .end annotation

    .prologue
    .line 332
    .local p1, "points":Ljava/util/List;, "Ljava/util/List<[Ljava/lang/Double;>;"
    if-eqz p1, :cond_0

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x3

    if-ge v0, v1, :cond_1

    .line 333
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Polygon insufficient number of vertices defined"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 334
    :cond_1
    const-string/jumbo v0, "$within"

    new-instance v1, Lcom/mongodb/BasicDBObject;

    const-string/jumbo v2, "$polygon"

    invoke-direct {v1, v2, p1}, Lcom/mongodb/BasicDBObject;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-direct {p0, v0, v1}, Lcom/mongodb/QueryBuilder;->addOperand(Ljava/lang/String;Ljava/lang/Object;)V

    .line 336
    return-object p0
.end method
