.class public Lcom/mongodb/BasicDBList;
.super Lorg/bson/types/BasicBSONList;
.source "BasicDBList.java"

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
    .line 28
    invoke-direct {p0}, Lorg/bson/types/BasicBSONList;-><init>()V

    return-void
.end method


# virtual methods
.method public copy()Ljava/lang/Object;
    .locals 4

    .prologue
    .line 51
    new-instance v1, Lcom/mongodb/BasicDBList;

    invoke-direct {v1}, Lcom/mongodb/BasicDBList;-><init>()V

    .line 53
    .local v1, "newobj":Lcom/mongodb/BasicDBList;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {p0}, Lcom/mongodb/BasicDBList;->size()I

    move-result v3

    if-ge v0, v3, :cond_2

    .line 54
    invoke-virtual {p0, v0}, Lcom/mongodb/BasicDBList;->get(I)Ljava/lang/Object;

    move-result-object v2

    .line 55
    .local v2, "val":Ljava/lang/Object;
    instance-of v3, v2, Lcom/mongodb/BasicDBObject;

    if-eqz v3, :cond_1

    .line 56
    check-cast v2, Lcom/mongodb/BasicDBObject;

    .end local v2    # "val":Ljava/lang/Object;
    invoke-virtual {v2}, Lcom/mongodb/BasicDBObject;->copy()Ljava/lang/Object;

    move-result-object v2

    .line 60
    .restart local v2    # "val":Ljava/lang/Object;
    :cond_0
    :goto_1
    invoke-virtual {v1, v2}, Lcom/mongodb/BasicDBList;->add(Ljava/lang/Object;)Z

    .line 53
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 57
    :cond_1
    instance-of v3, v2, Lcom/mongodb/BasicDBList;

    if-eqz v3, :cond_0

    .line 58
    check-cast v2, Lcom/mongodb/BasicDBList;

    .end local v2    # "val":Ljava/lang/Object;
    invoke-virtual {v2}, Lcom/mongodb/BasicDBList;->copy()Ljava/lang/Object;

    move-result-object v2

    .restart local v2    # "val":Ljava/lang/Object;
    goto :goto_1

    .line 62
    .end local v2    # "val":Ljava/lang/Object;
    :cond_2
    return-object v1
.end method

.method public isPartialObject()Z
    .locals 1

    .prologue
    .line 42
    iget-boolean v0, p0, Lcom/mongodb/BasicDBList;->_isPartialObject:Z

    return v0
.end method

.method public markAsPartialObject()V
    .locals 1

    .prologue
    .line 46
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mongodb/BasicDBList;->_isPartialObject:Z

    .line 47
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 38
    invoke-static {p0}, Lcom/mongodb/util/JSON;->serialize(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
