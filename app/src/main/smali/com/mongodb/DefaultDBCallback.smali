.class public Lcom/mongodb/DefaultDBCallback;
.super Lorg/bson/BasicBSONCallback;
.source "DefaultDBCallback.java"

# interfaces
.implements Lcom/mongodb/DBCallback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mongodb/DefaultDBCallback$DefaultFactory;
    }
.end annotation


# static fields
.field public static FACTORY:Lcom/mongodb/DBCallbackFactory;

.field static final LOGGER:Ljava/util/logging/Logger;


# instance fields
.field final _collection:Lcom/mongodb/DBCollection;

.field final _db:Lcom/mongodb/DB;

.field private _nameStack:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 45
    new-instance v0, Lcom/mongodb/DefaultDBCallback$DefaultFactory;

    invoke-direct {v0}, Lcom/mongodb/DefaultDBCallback$DefaultFactory;-><init>()V

    sput-object v0, Lcom/mongodb/DefaultDBCallback;->FACTORY:Lcom/mongodb/DBCallbackFactory;

    .line 154
    const-string/jumbo v0, "com.mongo.DECODING"

    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v0

    sput-object v0, Lcom/mongodb/DefaultDBCallback;->LOGGER:Ljava/util/logging/Logger;

    return-void
.end method

.method public constructor <init>(Lcom/mongodb/DBCollection;)V
    .locals 1
    .param p1, "coll"    # Lcom/mongodb/DBCollection;

    .prologue
    .line 47
    invoke-direct {p0}, Lorg/bson/BasicBSONCallback;-><init>()V

    .line 48
    iput-object p1, p0, Lcom/mongodb/DefaultDBCallback;->_collection:Lcom/mongodb/DBCollection;

    .line 49
    iget-object v0, p0, Lcom/mongodb/DefaultDBCallback;->_collection:Lcom/mongodb/DBCollection;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    iput-object v0, p0, Lcom/mongodb/DefaultDBCallback;->_db:Lcom/mongodb/DB;

    .line 50
    return-void

    .line 49
    :cond_0
    iget-object v0, p0, Lcom/mongodb/DefaultDBCallback;->_collection:Lcom/mongodb/DBCollection;

    invoke-virtual {v0}, Lcom/mongodb/DBCollection;->getDB()Lcom/mongodb/DB;

    move-result-object v0

    goto :goto_0
.end method

.method private _create(Ljava/util/List;)Lcom/mongodb/DBObject;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/mongodb/DBObject;"
        }
    .end annotation

    .prologue
    .line 106
    .local p1, "path":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v1, 0x0

    .line 108
    .local v1, "c":Ljava/lang/Class;
    iget-object v5, p0, Lcom/mongodb/DefaultDBCallback;->_collection:Lcom/mongodb/DBCollection;

    if-eqz v5, :cond_1

    iget-object v5, p0, Lcom/mongodb/DefaultDBCallback;->_collection:Lcom/mongodb/DBCollection;

    iget-object v5, v5, Lcom/mongodb/DBCollection;->_objectClass:Ljava/lang/Class;

    if-eqz v5, :cond_1

    .line 109
    if-eqz p1, :cond_0

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v5

    if-nez v5, :cond_2

    .line 110
    :cond_0
    iget-object v5, p0, Lcom/mongodb/DefaultDBCallback;->_collection:Lcom/mongodb/DBCollection;

    iget-object v1, v5, Lcom/mongodb/DBCollection;->_objectClass:Ljava/lang/Class;

    .line 124
    :cond_1
    :goto_0
    if-eqz v1, :cond_5

    .line 126
    :try_start_0
    invoke-virtual {v1}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/mongodb/DBObject;
    :try_end_0
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1

    .line 138
    :goto_1
    return-object v5

    .line 113
    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 114
    .local v0, "buf":Ljava/lang/StringBuilder;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_2
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v5

    if-ge v2, v5, :cond_4

    .line 115
    if-lez v2, :cond_3

    .line 116
    const-string/jumbo v5, "."

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 117
    :cond_3
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 114
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 119
    :cond_4
    iget-object v5, p0, Lcom/mongodb/DefaultDBCallback;->_collection:Lcom/mongodb/DBCollection;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/mongodb/DBCollection;->getInternalClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    goto :goto_0

    .line 128
    .end local v0    # "buf":Ljava/lang/StringBuilder;
    .end local v2    # "i":I
    :catch_0
    move-exception v4

    .line 129
    .local v4, "ie":Ljava/lang/InstantiationException;
    sget-object v5, Lcom/mongodb/DefaultDBCallback;->LOGGER:Ljava/util/logging/Logger;

    sget-object v6, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "can\'t create a: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v6, v7, v4}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 130
    new-instance v5, Lcom/mongodb/MongoInternalException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "can\'t instantiate a : "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6, v4}, Lcom/mongodb/MongoInternalException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v5

    .line 132
    .end local v4    # "ie":Ljava/lang/InstantiationException;
    :catch_1
    move-exception v3

    .line 133
    .local v3, "iae":Ljava/lang/IllegalAccessException;
    sget-object v5, Lcom/mongodb/DefaultDBCallback;->LOGGER:Ljava/util/logging/Logger;

    sget-object v6, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "can\'t create a: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v6, v7, v3}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 134
    new-instance v5, Lcom/mongodb/MongoInternalException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "can\'t instantiate a : "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6, v3}, Lcom/mongodb/MongoInternalException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v5

    .line 138
    .end local v3    # "iae":Ljava/lang/IllegalAccessException;
    :cond_5
    new-instance v5, Lcom/mongodb/BasicDBObject;

    invoke-direct {v5}, Lcom/mongodb/BasicDBObject;-><init>()V

    goto/16 :goto_1
.end method


# virtual methods
.method public create()Lorg/bson/BSONObject;
    .locals 1

    .prologue
    .line 88
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/mongodb/DefaultDBCallback;->_create(Ljava/util/List;)Lcom/mongodb/DBObject;

    move-result-object v0

    return-object v0
.end method

.method public create(ZLjava/util/List;)Lorg/bson/BSONObject;
    .locals 1
    .param p1, "array"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Lorg/bson/BSONObject;"
        }
    .end annotation

    .prologue
    .line 99
    .local p2, "path":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-eqz p1, :cond_0

    .line 100
    new-instance v0, Lcom/mongodb/BasicDBList;

    invoke-direct {v0}, Lcom/mongodb/BasicDBList;-><init>()V

    .line 101
    :goto_0
    return-object v0

    :cond_0
    invoke-direct {p0, p2}, Lcom/mongodb/DefaultDBCallback;->_create(Ljava/util/List;)Lcom/mongodb/DBObject;

    move-result-object v0

    goto :goto_0
.end method

.method dbget()Lcom/mongodb/DBObject;
    .locals 1

    .prologue
    .line 142
    invoke-virtual {p0}, Lcom/mongodb/DefaultDBCallback;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mongodb/DBObject;

    return-object v0
.end method

.method public gotDBRef(Ljava/lang/String;Ljava/lang/String;Lorg/bson/types/ObjectId;)V
    .locals 3
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "ns"    # Ljava/lang/String;
    .param p3, "id"    # Lorg/bson/types/ObjectId;

    .prologue
    .line 54
    sget-object v0, Lcom/mongodb/Bytes;->COLLECTION_REF_ID:Lorg/bson/types/ObjectId;

    invoke-virtual {p3, v0}, Lorg/bson/types/ObjectId;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 55
    invoke-virtual {p0}, Lcom/mongodb/DefaultDBCallback;->cur()Lorg/bson/BSONObject;

    move-result-object v0

    iget-object v1, p0, Lcom/mongodb/DefaultDBCallback;->_collection:Lcom/mongodb/DBCollection;

    invoke-interface {v0, p1, v1}, Lorg/bson/BSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 58
    :goto_0
    return-void

    .line 57
    :cond_0
    invoke-virtual {p0}, Lcom/mongodb/DefaultDBCallback;->cur()Lorg/bson/BSONObject;

    move-result-object v0

    new-instance v1, Lcom/mongodb/DBRef;

    iget-object v2, p0, Lcom/mongodb/DefaultDBCallback;->_db:Lcom/mongodb/DB;

    invoke-direct {v1, v2, p2, p3}, Lcom/mongodb/DBRef;-><init>(Lcom/mongodb/DB;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-interface {v0, p1, v1}, Lorg/bson/BSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method

.method public objectDone()Ljava/lang/Object;
    .locals 5

    .prologue
    .line 68
    invoke-super {p0}, Lorg/bson/BasicBSONCallback;->objectDone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/bson/BSONObject;

    .line 69
    .local v1, "o":Lorg/bson/BSONObject;
    const/4 v0, 0x0

    .line 70
    .local v0, "lastName":Ljava/lang/String;
    iget-object v2, p0, Lcom/mongodb/DefaultDBCallback;->_nameStack:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->size()I

    move-result v2

    if-lez v2, :cond_0

    .line 71
    iget-object v2, p0, Lcom/mongodb/DefaultDBCallback;->_nameStack:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->removeLast()Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "lastName":Ljava/lang/String;
    check-cast v0, Ljava/lang/String;

    .line 73
    .restart local v0    # "lastName":Ljava/lang/String;
    :cond_0
    instance-of v2, v1, Ljava/util/List;

    if-nez v2, :cond_1

    if-eqz v0, :cond_1

    const-string/jumbo v2, "$ref"

    invoke-interface {v1, v2}, Lorg/bson/BSONObject;->containsField(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    const-string/jumbo v2, "$id"

    invoke-interface {v1, v2}, Lorg/bson/BSONObject;->containsField(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 76
    invoke-virtual {p0}, Lcom/mongodb/DefaultDBCallback;->cur()Lorg/bson/BSONObject;

    move-result-object v2

    new-instance v3, Lcom/mongodb/DBRef;

    iget-object v4, p0, Lcom/mongodb/DefaultDBCallback;->_db:Lcom/mongodb/DB;

    invoke-direct {v3, v4, v1}, Lcom/mongodb/DBRef;-><init>(Lcom/mongodb/DB;Lorg/bson/BSONObject;)V

    invoke-interface {v2, v0, v3}, Lorg/bson/BSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 79
    .end local v1    # "o":Lorg/bson/BSONObject;
    :cond_1
    return-object v1
.end method

.method public objectStart(ZLjava/lang/String;)V
    .locals 1
    .param p1, "array"    # Z
    .param p2, "name"    # Ljava/lang/String;

    .prologue
    .line 62
    iget-object v0, p0, Lcom/mongodb/DefaultDBCallback;->_nameStack:Ljava/util/LinkedList;

    invoke-virtual {v0, p2}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 63
    invoke-super {p0, p1, p2}, Lorg/bson/BasicBSONCallback;->objectStart(ZLjava/lang/String;)V

    .line 64
    return-void
.end method

.method public reset()V
    .locals 1

    .prologue
    .line 147
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/mongodb/DefaultDBCallback;->_nameStack:Ljava/util/LinkedList;

    .line 148
    invoke-super {p0}, Lorg/bson/BasicBSONCallback;->reset()V

    .line 149
    return-void
.end method
