.class public Lcom/mongodb/BasicDBObject;
.super Lorg/bson/BasicBSONObject;
.source "BasicDBObject.java"

# interfaces
.implements Lcom/mongodb/DBObject;


# static fields
.field private static final serialVersionUID:J = -0x3d463948dc511dfeL


# instance fields
.field private _isPartialObject:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 41
    invoke-direct {p0}, Lorg/bson/BasicBSONObject;-><init>()V

    .line 42
    return-void
.end method

.method public constructor <init>(I)V
    .locals 0
    .param p1, "size"    # I

    .prologue
    .line 49
    invoke-direct {p0, p1}, Lorg/bson/BasicBSONObject;-><init>(I)V

    .line 50
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 0
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 58
    invoke-direct {p0, p1, p2}, Lorg/bson/BasicBSONObject;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    .line 59
    return-void
.end method

.method public constructor <init>(Ljava/util/Map;)V
    .locals 0
    .param p1, "m"    # Ljava/util/Map;

    .prologue
    .line 66
    invoke-direct {p0, p1}, Lorg/bson/BasicBSONObject;-><init>(Ljava/util/Map;)V

    .line 67
    return-void
.end method


# virtual methods
.method public append(Ljava/lang/String;Ljava/lang/Object;)Lcom/mongodb/BasicDBObject;
    .locals 0
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "val"    # Ljava/lang/Object;

    .prologue
    .line 88
    invoke-virtual {p0, p1, p2}, Lcom/mongodb/BasicDBObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 89
    return-object p0
.end method

.method public bridge synthetic append(Ljava/lang/String;Ljava/lang/Object;)Lorg/bson/BasicBSONObject;
    .locals 1
    .param p1, "x0"    # Ljava/lang/String;
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    .line 34
    invoke-virtual {p0, p1, p2}, Lcom/mongodb/BasicDBObject;->append(Ljava/lang/String;Ljava/lang/Object;)Lcom/mongodb/BasicDBObject;

    move-result-object v0

    return-object v0
.end method

.method public copy()Ljava/lang/Object;
    .locals 5

    .prologue
    .line 94
    new-instance v2, Lcom/mongodb/BasicDBObject;

    invoke-virtual {p0}, Lcom/mongodb/BasicDBObject;->toMap()Ljava/util/Map;

    move-result-object v4

    invoke-direct {v2, v4}, Lcom/mongodb/BasicDBObject;-><init>(Ljava/util/Map;)V

    .line 96
    .local v2, "newobj":Lcom/mongodb/BasicDBObject;
    invoke-virtual {p0}, Lcom/mongodb/BasicDBObject;->keySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 97
    .local v0, "field":Ljava/lang/String;
    invoke-virtual {p0, v0}, Lcom/mongodb/BasicDBObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    .line 98
    .local v3, "val":Ljava/lang/Object;
    instance-of v4, v3, Lcom/mongodb/BasicDBObject;

    if-eqz v4, :cond_1

    .line 99
    check-cast v3, Lcom/mongodb/BasicDBObject;

    .end local v3    # "val":Ljava/lang/Object;
    invoke-virtual {v3}, Lcom/mongodb/BasicDBObject;->copy()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v2, v0, v4}, Lcom/mongodb/BasicDBObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 100
    .restart local v3    # "val":Ljava/lang/Object;
    :cond_1
    instance-of v4, v3, Lcom/mongodb/BasicDBList;

    if-eqz v4, :cond_0

    .line 101
    check-cast v3, Lcom/mongodb/BasicDBList;

    .end local v3    # "val":Ljava/lang/Object;
    invoke-virtual {v3}, Lcom/mongodb/BasicDBList;->copy()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v2, v0, v4}, Lcom/mongodb/BasicDBObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 104
    .end local v0    # "field":Ljava/lang/String;
    :cond_2
    return-object v2
.end method

.method public isPartialObject()Z
    .locals 1

    .prologue
    .line 70
    iget-boolean v0, p0, Lcom/mongodb/BasicDBObject;->_isPartialObject:Z

    return v0
.end method

.method public markAsPartialObject()V
    .locals 1

    .prologue
    .line 74
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mongodb/BasicDBObject;->_isPartialObject:Z

    .line 75
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 83
    invoke-static {p0}, Lcom/mongodb/util/JSON;->serialize(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
