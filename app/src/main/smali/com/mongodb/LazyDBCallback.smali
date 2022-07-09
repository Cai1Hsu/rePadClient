.class public Lcom/mongodb/LazyDBCallback;
.super Lorg/bson/LazyBSONCallback;
.source "LazyDBCallback.java"

# interfaces
.implements Lcom/mongodb/DBCallback;


# static fields
.field private static final log:Ljava/util/logging/Logger;


# instance fields
.field final _collection:Lcom/mongodb/DBCollection;

.field final _db:Lcom/mongodb/DB;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 61
    const-class v0, Lcom/mongodb/LazyDBCallback;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v0

    sput-object v0, Lcom/mongodb/LazyDBCallback;->log:Ljava/util/logging/Logger;

    return-void
.end method

.method public constructor <init>(Lcom/mongodb/DBCollection;)V
    .locals 1
    .param p1, "coll"    # Lcom/mongodb/DBCollection;

    .prologue
    .line 31
    invoke-direct {p0}, Lorg/bson/LazyBSONCallback;-><init>()V

    .line 32
    iput-object p1, p0, Lcom/mongodb/LazyDBCallback;->_collection:Lcom/mongodb/DBCollection;

    .line 33
    iget-object v0, p0, Lcom/mongodb/LazyDBCallback;->_collection:Lcom/mongodb/DBCollection;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    iput-object v0, p0, Lcom/mongodb/LazyDBCallback;->_db:Lcom/mongodb/DB;

    .line 34
    return-void

    .line 33
    :cond_0
    iget-object v0, p0, Lcom/mongodb/LazyDBCallback;->_collection:Lcom/mongodb/DBCollection;

    invoke-virtual {v0}, Lcom/mongodb/DBCollection;->getDB()Lcom/mongodb/DB;

    move-result-object v0

    goto :goto_0
.end method


# virtual methods
.method public createArray([BI)Ljava/util/List;
    .locals 1
    .param p1, "data"    # [B
    .param p2, "offset"    # I

    .prologue
    .line 52
    new-instance v0, Lcom/mongodb/LazyDBList;

    invoke-direct {v0, p1, p2, p0}, Lcom/mongodb/LazyDBList;-><init>([BILorg/bson/LazyBSONCallback;)V

    return-object v0
.end method

.method public createDBRef(Ljava/lang/String;Lorg/bson/types/ObjectId;)Ljava/lang/Object;
    .locals 2
    .param p1, "ns"    # Ljava/lang/String;
    .param p2, "id"    # Lorg/bson/types/ObjectId;

    .prologue
    .line 56
    new-instance v0, Lcom/mongodb/DBRef;

    iget-object v1, p0, Lcom/mongodb/LazyDBCallback;->_db:Lcom/mongodb/DB;

    invoke-direct {v0, v1, p1, p2}, Lcom/mongodb/DBRef;-><init>(Lcom/mongodb/DB;Ljava/lang/String;Ljava/lang/Object;)V

    return-object v0
.end method

.method public createObject([BI)Ljava/lang/Object;
    .locals 4
    .param p1, "data"    # [B
    .param p2, "offset"    # I

    .prologue
    .line 38
    new-instance v1, Lcom/mongodb/LazyDBObject;

    invoke-direct {v1, p1, p2, p0}, Lcom/mongodb/LazyDBObject;-><init>([BILorg/bson/LazyBSONCallback;)V

    .line 42
    .local v1, "o":Lcom/mongodb/LazyDBObject;
    invoke-virtual {v1}, Lcom/mongodb/LazyDBObject;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 43
    .local v0, "it":Ljava/util/Iterator;
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    const-string/jumbo v3, "$ref"

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const-string/jumbo v2, "$id"

    invoke-virtual {v1, v2}, Lcom/mongodb/LazyDBObject;->containsField(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 45
    new-instance v2, Lcom/mongodb/DBRef;

    iget-object v3, p0, Lcom/mongodb/LazyDBCallback;->_db:Lcom/mongodb/DB;

    invoke-direct {v2, v3, v1}, Lcom/mongodb/DBRef;-><init>(Lcom/mongodb/DB;Lorg/bson/BSONObject;)V

    move-object v1, v2

    .line 47
    .end local v1    # "o":Lcom/mongodb/LazyDBObject;
    :cond_0
    return-object v1
.end method
