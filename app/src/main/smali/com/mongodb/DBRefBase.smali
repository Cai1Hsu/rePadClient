.class public Lcom/mongodb/DBRefBase;
.super Ljava/lang/Object;
.source "DBRefBase.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final serialVersionUID:J = 0x2a136c04a772d656L


# instance fields
.field final transient _db:Lcom/mongodb/DB;

.field final _id:Ljava/lang/Object;

.field private _loadedPointedTo:Z

.field final _ns:Ljava/lang/String;

.field private _pointedTo:Lcom/mongodb/DBObject;


# direct methods
.method protected constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 128
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mongodb/DBRefBase;->_loadedPointedTo:Z

    .line 49
    iput-object v1, p0, Lcom/mongodb/DBRefBase;->_id:Ljava/lang/Object;

    .line 50
    iput-object v1, p0, Lcom/mongodb/DBRefBase;->_ns:Ljava/lang/String;

    .line 51
    iput-object v1, p0, Lcom/mongodb/DBRefBase;->_db:Lcom/mongodb/DB;

    .line 52
    return-void
.end method

.method public constructor <init>(Lcom/mongodb/DB;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 1
    .param p1, "db"    # Lcom/mongodb/DB;
    .param p2, "ns"    # Ljava/lang/String;
    .param p3, "id"    # Ljava/lang/Object;

    .prologue
    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 128
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mongodb/DBRefBase;->_loadedPointedTo:Z

    .line 40
    iput-object p1, p0, Lcom/mongodb/DBRefBase;->_db:Lcom/mongodb/DB;

    .line 41
    invoke-virtual {p2}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mongodb/DBRefBase;->_ns:Ljava/lang/String;

    .line 42
    iput-object p3, p0, Lcom/mongodb/DBRefBase;->_id:Ljava/lang/Object;

    .line 43
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 106
    if-ne p0, p1, :cond_1

    .line 114
    :cond_0
    :goto_0
    return v1

    .line 107
    :cond_1
    if-eqz p1, :cond_2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_3

    :cond_2
    move v1, v2

    goto :goto_0

    :cond_3
    move-object v0, p1

    .line 109
    check-cast v0, Lcom/mongodb/DBRefBase;

    .line 111
    .local v0, "dbRefBase":Lcom/mongodb/DBRefBase;
    iget-object v3, p0, Lcom/mongodb/DBRefBase;->_id:Ljava/lang/Object;

    if-eqz v3, :cond_5

    iget-object v3, p0, Lcom/mongodb/DBRefBase;->_id:Ljava/lang/Object;

    iget-object v4, v0, Lcom/mongodb/DBRefBase;->_id:Ljava/lang/Object;

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_6

    :cond_4
    move v1, v2

    goto :goto_0

    :cond_5
    iget-object v3, v0, Lcom/mongodb/DBRefBase;->_id:Ljava/lang/Object;

    if-nez v3, :cond_4

    .line 112
    :cond_6
    iget-object v3, p0, Lcom/mongodb/DBRefBase;->_ns:Ljava/lang/String;

    if-eqz v3, :cond_7

    iget-object v3, p0, Lcom/mongodb/DBRefBase;->_ns:Ljava/lang/String;

    iget-object v4, v0, Lcom/mongodb/DBRefBase;->_ns:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    :goto_1
    move v1, v2

    goto :goto_0

    :cond_7
    iget-object v3, v0, Lcom/mongodb/DBRefBase;->_ns:Ljava/lang/String;

    if-eqz v3, :cond_0

    goto :goto_1
.end method

.method public fetch()Lcom/mongodb/DBObject;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/mongodb/MongoException;
        }
    .end annotation

    .prologue
    .line 60
    iget-boolean v1, p0, Lcom/mongodb/DBRefBase;->_loadedPointedTo:Z

    if-eqz v1, :cond_0

    .line 61
    iget-object v1, p0, Lcom/mongodb/DBRefBase;->_pointedTo:Lcom/mongodb/DBObject;

    .line 70
    :goto_0
    return-object v1

    .line 63
    :cond_0
    iget-object v1, p0, Lcom/mongodb/DBRefBase;->_db:Lcom/mongodb/DB;

    if-nez v1, :cond_1

    .line 64
    new-instance v1, Lcom/mongodb/MongoInternalException;

    const-string/jumbo v2, "no db"

    invoke-direct {v1, v2}, Lcom/mongodb/MongoInternalException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 66
    :cond_1
    iget-object v1, p0, Lcom/mongodb/DBRefBase;->_db:Lcom/mongodb/DB;

    iget-object v2, p0, Lcom/mongodb/DBRefBase;->_ns:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/mongodb/DB;->getCollectionFromString(Ljava/lang/String;)Lcom/mongodb/DBCollection;

    move-result-object v0

    .line 68
    .local v0, "coll":Lcom/mongodb/DBCollection;
    iget-object v1, p0, Lcom/mongodb/DBRefBase;->_id:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Lcom/mongodb/DBCollection;->findOne(Ljava/lang/Object;)Lcom/mongodb/DBObject;

    move-result-object v1

    iput-object v1, p0, Lcom/mongodb/DBRefBase;->_pointedTo:Lcom/mongodb/DBObject;

    .line 69
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/mongodb/DBRefBase;->_loadedPointedTo:Z

    .line 70
    iget-object v1, p0, Lcom/mongodb/DBRefBase;->_pointedTo:Lcom/mongodb/DBObject;

    goto :goto_0
.end method

.method public getDB()Lcom/mongodb/DB;
    .locals 1

    .prologue
    .line 101
    iget-object v0, p0, Lcom/mongodb/DBRefBase;->_db:Lcom/mongodb/DB;

    return-object v0
.end method

.method public getId()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 83
    iget-object v0, p0, Lcom/mongodb/DBRefBase;->_id:Ljava/lang/Object;

    return-object v0
.end method

.method public getRef()Ljava/lang/String;
    .locals 1

    .prologue
    .line 91
    iget-object v0, p0, Lcom/mongodb/DBRefBase;->_ns:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 4

    .prologue
    const/4 v1, 0x0

    .line 119
    iget-object v2, p0, Lcom/mongodb/DBRefBase;->_id:Ljava/lang/Object;

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/mongodb/DBRefBase;->_id:Ljava/lang/Object;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v0

    .line 120
    .local v0, "result":I
    :goto_0
    mul-int/lit8 v2, v0, 0x1f

    iget-object v3, p0, Lcom/mongodb/DBRefBase;->_ns:Ljava/lang/String;

    if-eqz v3, :cond_0

    iget-object v1, p0, Lcom/mongodb/DBRefBase;->_ns:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    :cond_0
    add-int v0, v2, v1

    .line 121
    return v0

    .end local v0    # "result":I
    :cond_1
    move v0, v1

    .line 119
    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 75
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "{ \"$ref\" : \""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/mongodb/DBRefBase;->_ns:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\", \"$id\" : \""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/mongodb/DBRefBase;->_id:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\" }"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
