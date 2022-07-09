.class public Lcom/mongodb/MapReduceOutput;
.super Ljava/lang/Object;
.source "MapReduceOutput.java"


# instance fields
.field final _cmd:Lcom/mongodb/DBObject;

.field final _coll:Lcom/mongodb/DBCollection;

.field final _collname:Ljava/lang/String;

.field final _commandResult:Lcom/mongodb/CommandResult;

.field final _counts:Lcom/mongodb/BasicDBObject;

.field _dbname:Ljava/lang/String;

.field final _resultSet:Ljava/lang/Iterable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Iterable",
            "<",
            "Lcom/mongodb/DBObject;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/mongodb/DBCollection;Lcom/mongodb/DBObject;Lcom/mongodb/CommandResult;)V
    .locals 5
    .param p1, "from"    # Lcom/mongodb/DBCollection;
    .param p2, "cmd"    # Lcom/mongodb/DBObject;
    .param p3, "raw"    # Lcom/mongodb/CommandResult;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 206
    iput-object v4, p0, Lcom/mongodb/MapReduceOutput;->_dbname:Ljava/lang/String;

    .line 42
    iput-object p3, p0, Lcom/mongodb/MapReduceOutput;->_commandResult:Lcom/mongodb/CommandResult;

    .line 43
    iput-object p2, p0, Lcom/mongodb/MapReduceOutput;->_cmd:Lcom/mongodb/DBObject;

    .line 45
    const-string/jumbo v3, "results"

    invoke-virtual {p3, v3}, Lcom/mongodb/CommandResult;->containsField(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 46
    iput-object v4, p0, Lcom/mongodb/MapReduceOutput;->_coll:Lcom/mongodb/DBCollection;

    .line 47
    iput-object v4, p0, Lcom/mongodb/MapReduceOutput;->_collname:Ljava/lang/String;

    .line 48
    const-string/jumbo v3, "results"

    invoke-virtual {p3, v3}, Lcom/mongodb/CommandResult;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Iterable;

    iput-object v3, p0, Lcom/mongodb/MapReduceOutput;->_resultSet:Ljava/lang/Iterable;

    .line 68
    :goto_0
    const-string/jumbo v3, "counts"

    invoke-virtual {p3, v3}, Lcom/mongodb/CommandResult;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/mongodb/BasicDBObject;

    iput-object v3, p0, Lcom/mongodb/MapReduceOutput;->_counts:Lcom/mongodb/BasicDBObject;

    .line 69
    return-void

    .line 50
    :cond_0
    const-string/jumbo v3, "result"

    invoke-virtual {p3, v3}, Lcom/mongodb/CommandResult;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    .line 51
    .local v2, "res":Ljava/lang/Object;
    instance-of v3, v2, Ljava/lang/String;

    if-eqz v3, :cond_2

    .line 52
    check-cast v2, Ljava/lang/String;

    .end local v2    # "res":Ljava/lang/Object;
    iput-object v2, p0, Lcom/mongodb/MapReduceOutput;->_collname:Ljava/lang/String;

    .line 59
    :goto_1
    iget-object v0, p1, Lcom/mongodb/DBCollection;->_db:Lcom/mongodb/DB;

    .line 60
    .local v0, "db":Lcom/mongodb/DB;
    iget-object v3, p0, Lcom/mongodb/MapReduceOutput;->_dbname:Ljava/lang/String;

    if-eqz v3, :cond_1

    .line 61
    iget-object v3, p0, Lcom/mongodb/MapReduceOutput;->_dbname:Ljava/lang/String;

    invoke-virtual {v0, v3}, Lcom/mongodb/DB;->getSisterDB(Ljava/lang/String;)Lcom/mongodb/DB;

    move-result-object v0

    .line 63
    :cond_1
    iget-object v3, p0, Lcom/mongodb/MapReduceOutput;->_collname:Ljava/lang/String;

    invoke-virtual {v0, v3}, Lcom/mongodb/DB;->getCollection(Ljava/lang/String;)Lcom/mongodb/DBCollection;

    move-result-object v3

    iput-object v3, p0, Lcom/mongodb/MapReduceOutput;->_coll:Lcom/mongodb/DBCollection;

    .line 65
    iget-object v3, p0, Lcom/mongodb/MapReduceOutput;->_coll:Lcom/mongodb/DBCollection;

    iget-object v4, p0, Lcom/mongodb/MapReduceOutput;->_coll:Lcom/mongodb/DBCollection;

    invoke-virtual {v4}, Lcom/mongodb/DBCollection;->getOptions()I

    move-result v4

    and-int/lit8 v4, v4, -0x5

    invoke-virtual {v3, v4}, Lcom/mongodb/DBCollection;->setOptions(I)V

    .line 66
    iget-object v3, p0, Lcom/mongodb/MapReduceOutput;->_coll:Lcom/mongodb/DBCollection;

    invoke-virtual {v3}, Lcom/mongodb/DBCollection;->find()Lcom/mongodb/DBCursor;

    move-result-object v3

    iput-object v3, p0, Lcom/mongodb/MapReduceOutput;->_resultSet:Ljava/lang/Iterable;

    goto :goto_0

    .end local v0    # "db":Lcom/mongodb/DB;
    .restart local v2    # "res":Ljava/lang/Object;
    :cond_2
    move-object v1, v2

    .line 54
    check-cast v1, Lcom/mongodb/BasicDBObject;

    .line 55
    .local v1, "output":Lcom/mongodb/BasicDBObject;
    const-string/jumbo v3, "collection"

    invoke-virtual {v1, v3}, Lcom/mongodb/BasicDBObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/mongodb/MapReduceOutput;->_collname:Ljava/lang/String;

    .line 56
    const-string/jumbo v3, "db"

    invoke-virtual {v1, v3}, Lcom/mongodb/BasicDBObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/mongodb/MapReduceOutput;->_dbname:Ljava/lang/String;

    goto :goto_1
.end method


# virtual methods
.method public drop()V
    .locals 1

    .prologue
    .line 86
    iget-object v0, p0, Lcom/mongodb/MapReduceOutput;->_coll:Lcom/mongodb/DBCollection;

    if-eqz v0, :cond_0

    .line 87
    iget-object v0, p0, Lcom/mongodb/MapReduceOutput;->_coll:Lcom/mongodb/DBCollection;

    invoke-virtual {v0}, Lcom/mongodb/DBCollection;->drop()V

    .line 88
    :cond_0
    return-void
.end method

.method public final getCollectionName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 155
    iget-object v0, p0, Lcom/mongodb/MapReduceOutput;->_collname:Ljava/lang/String;

    return-object v0
.end method

.method public getCommand()Lcom/mongodb/DBObject;
    .locals 1

    .prologue
    .line 132
    iget-object v0, p0, Lcom/mongodb/MapReduceOutput;->_cmd:Lcom/mongodb/DBObject;

    return-object v0
.end method

.method public getCommandResult()Lcom/mongodb/CommandResult;
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 124
    iget-object v0, p0, Lcom/mongodb/MapReduceOutput;->_commandResult:Lcom/mongodb/CommandResult;

    return-object v0
.end method

.method public getDatabaseName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 165
    iget-object v0, p0, Lcom/mongodb/MapReduceOutput;->_dbname:Ljava/lang/String;

    return-object v0
.end method

.method public getDuration()I
    .locals 2

    .prologue
    .line 174
    iget-object v0, p0, Lcom/mongodb/MapReduceOutput;->_commandResult:Lcom/mongodb/CommandResult;

    const-string/jumbo v1, "timeMillis"

    invoke-virtual {v0, v1}, Lcom/mongodb/CommandResult;->getInt(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public getEmitCount()I
    .locals 2

    .prologue
    .line 201
    iget-object v0, p0, Lcom/mongodb/MapReduceOutput;->_counts:Lcom/mongodb/BasicDBObject;

    const-string/jumbo v1, "emit"

    invoke-virtual {v0, v1}, Lcom/mongodb/BasicDBObject;->getInt(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public getInputCount()I
    .locals 2

    .prologue
    .line 183
    iget-object v0, p0, Lcom/mongodb/MapReduceOutput;->_counts:Lcom/mongodb/BasicDBObject;

    const-string/jumbo v1, "input"

    invoke-virtual {v0, v1}, Lcom/mongodb/BasicDBObject;->getInt(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public getOutputCollection()Lcom/mongodb/DBCollection;
    .locals 1

    .prologue
    .line 96
    iget-object v0, p0, Lcom/mongodb/MapReduceOutput;->_coll:Lcom/mongodb/DBCollection;

    return-object v0
.end method

.method public getOutputCount()I
    .locals 2

    .prologue
    .line 192
    iget-object v0, p0, Lcom/mongodb/MapReduceOutput;->_counts:Lcom/mongodb/BasicDBObject;

    const-string/jumbo v1, "output"

    invoke-virtual {v0, v1}, Lcom/mongodb/BasicDBObject;->getInt(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public getRaw()Lcom/mongodb/BasicDBObject;
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 110
    iget-object v0, p0, Lcom/mongodb/MapReduceOutput;->_commandResult:Lcom/mongodb/CommandResult;

    return-object v0
.end method

.method public getServerUsed()Lcom/mongodb/ServerAddress;
    .locals 1

    .prologue
    .line 141
    iget-object v0, p0, Lcom/mongodb/MapReduceOutput;->_commandResult:Lcom/mongodb/CommandResult;

    invoke-virtual {v0}, Lcom/mongodb/CommandResult;->getServerUsed()Lcom/mongodb/ServerAddress;

    move-result-object v0

    return-object v0
.end method

.method public results()Ljava/lang/Iterable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Iterable",
            "<",
            "Lcom/mongodb/DBObject;",
            ">;"
        }
    .end annotation

    .prologue
    .line 77
    iget-object v0, p0, Lcom/mongodb/MapReduceOutput;->_resultSet:Ljava/lang/Iterable;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 145
    iget-object v0, p0, Lcom/mongodb/MapReduceOutput;->_commandResult:Lcom/mongodb/CommandResult;

    invoke-virtual {v0}, Lcom/mongodb/CommandResult;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
