.class public Lcom/mongodb/DBRef;
.super Lcom/mongodb/DBRefBase;
.source "DBRef.java"


# static fields
.field private static final serialVersionUID:J = -0xbca519dc1a616baL


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 56
    invoke-direct {p0}, Lcom/mongodb/DBRefBase;-><init>()V

    .line 57
    return-void
.end method

.method public constructor <init>(Lcom/mongodb/DB;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 0
    .param p1, "db"    # Lcom/mongodb/DB;
    .param p2, "ns"    # Ljava/lang/String;
    .param p3, "id"    # Ljava/lang/Object;

    .prologue
    .line 51
    invoke-direct {p0, p1, p2, p3}, Lcom/mongodb/DBRefBase;-><init>(Lcom/mongodb/DB;Ljava/lang/String;Ljava/lang/Object;)V

    .line 52
    return-void
.end method

.method public constructor <init>(Lcom/mongodb/DB;Lorg/bson/BSONObject;)V
    .locals 2
    .param p1, "db"    # Lcom/mongodb/DB;
    .param p2, "o"    # Lorg/bson/BSONObject;

    .prologue
    .line 41
    const-string/jumbo v0, "$ref"

    invoke-interface {p2, v0}, Lorg/bson/BSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "$id"

    invoke-interface {p2, v1}, Lorg/bson/BSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    invoke-direct {p0, p1, v0, v1}, Lcom/mongodb/DBRefBase;-><init>(Lcom/mongodb/DB;Ljava/lang/String;Ljava/lang/Object;)V

    .line 42
    return-void
.end method

.method public static fetch(Lcom/mongodb/DB;Lcom/mongodb/DBObject;)Lcom/mongodb/DBObject;
    .locals 5
    .param p0, "db"    # Lcom/mongodb/DB;
    .param p1, "ref"    # Lcom/mongodb/DBObject;

    .prologue
    .line 70
    const-string/jumbo v2, "$ref"

    invoke-interface {p1, v2}, Lcom/mongodb/DBObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .local v1, "ns":Ljava/lang/String;
    if-eqz v1, :cond_0

    const-string/jumbo v2, "$id"

    invoke-interface {p1, v2}, Lcom/mongodb/DBObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .local v0, "id":Ljava/lang/Object;
    if-eqz v0, :cond_0

    .line 71
    invoke-virtual {p0, v1}, Lcom/mongodb/DB;->getCollection(Ljava/lang/String;)Lcom/mongodb/DBCollection;

    move-result-object v2

    new-instance v3, Lcom/mongodb/BasicDBObject;

    const-string/jumbo v4, "_id"

    invoke-direct {v3, v4, v0}, Lcom/mongodb/BasicDBObject;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {v2, v3}, Lcom/mongodb/DBCollection;->findOne(Lcom/mongodb/DBObject;)Lcom/mongodb/DBObject;

    move-result-object v2

    .line 73
    .end local v0    # "id":Ljava/lang/Object;
    :goto_0
    return-object v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method
