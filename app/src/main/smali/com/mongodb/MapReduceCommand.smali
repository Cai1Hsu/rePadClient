.class public Lcom/mongodb/MapReduceCommand;
.super Ljava/lang/Object;
.source "MapReduceCommand.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mongodb/MapReduceCommand$1;,
        Lcom/mongodb/MapReduceCommand$OutputType;
    }
.end annotation


# instance fields
.field _extra:Lcom/mongodb/DBObject;

.field _finalize:Ljava/lang/String;

.field final _input:Ljava/lang/String;

.field _limit:I

.field final _map:Ljava/lang/String;

.field private _maxTimeMS:J

.field _outputDB:Ljava/lang/String;

.field final _outputTarget:Ljava/lang/String;

.field final _outputType:Lcom/mongodb/MapReduceCommand$OutputType;

.field final _query:Lcom/mongodb/DBObject;

.field _readPref:Lcom/mongodb/ReadPreference;

.field final _reduce:Ljava/lang/String;

.field _scope:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field _sort:Lcom/mongodb/DBObject;

.field _verbose:Ljava/lang/Boolean;


# direct methods
.method public constructor <init>(Lcom/mongodb/DBCollection;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/mongodb/MapReduceCommand$OutputType;Lcom/mongodb/DBObject;)V
    .locals 1
    .param p1, "inputCollection"    # Lcom/mongodb/DBCollection;
    .param p2, "map"    # Ljava/lang/String;
    .param p3, "reduce"    # Ljava/lang/String;
    .param p4, "outputCollection"    # Ljava/lang/String;
    .param p5, "type"    # Lcom/mongodb/MapReduceCommand$OutputType;
    .param p6, "query"    # Lcom/mongodb/DBObject;

    .prologue
    .line 71
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 361
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mongodb/MapReduceCommand;->_outputDB:Ljava/lang/String;

    .line 368
    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/mongodb/MapReduceCommand;->_verbose:Ljava/lang/Boolean;

    .line 72
    invoke-virtual {p1}, Lcom/mongodb/DBCollection;->getName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mongodb/MapReduceCommand;->_input:Ljava/lang/String;

    .line 73
    iput-object p2, p0, Lcom/mongodb/MapReduceCommand;->_map:Ljava/lang/String;

    .line 74
    iput-object p3, p0, Lcom/mongodb/MapReduceCommand;->_reduce:Ljava/lang/String;

    .line 75
    iput-object p4, p0, Lcom/mongodb/MapReduceCommand;->_outputTarget:Ljava/lang/String;

    .line 76
    iput-object p5, p0, Lcom/mongodb/MapReduceCommand;->_outputType:Lcom/mongodb/MapReduceCommand$OutputType;

    .line 77
    iput-object p6, p0, Lcom/mongodb/MapReduceCommand;->_query:Lcom/mongodb/DBObject;

    .line 78
    return-void
.end method


# virtual methods
.method public addExtraOption(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 323
    iget-object v0, p0, Lcom/mongodb/MapReduceCommand;->_extra:Lcom/mongodb/DBObject;

    if-nez v0, :cond_0

    .line 324
    new-instance v0, Lcom/mongodb/BasicDBObject;

    invoke-direct {v0}, Lcom/mongodb/BasicDBObject;-><init>()V

    iput-object v0, p0, Lcom/mongodb/MapReduceCommand;->_extra:Lcom/mongodb/DBObject;

    .line 325
    :cond_0
    iget-object v0, p0, Lcom/mongodb/MapReduceCommand;->_extra:Lcom/mongodb/DBObject;

    invoke-interface {v0, p1, p2}, Lcom/mongodb/DBObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 326
    return-void
.end method

.method public getExtraOptions()Lcom/mongodb/DBObject;
    .locals 1

    .prologue
    .line 329
    iget-object v0, p0, Lcom/mongodb/MapReduceCommand;->_extra:Lcom/mongodb/DBObject;

    return-object v0
.end method

.method public getFinalize()Ljava/lang/String;
    .locals 1

    .prologue
    .line 154
    iget-object v0, p0, Lcom/mongodb/MapReduceCommand;->_finalize:Ljava/lang/String;

    return-object v0
.end method

.method public getInput()Ljava/lang/String;
    .locals 1

    .prologue
    .line 106
    iget-object v0, p0, Lcom/mongodb/MapReduceCommand;->_input:Ljava/lang/String;

    return-object v0
.end method

.method public getLimit()I
    .locals 1

    .prologue
    .line 201
    iget v0, p0, Lcom/mongodb/MapReduceCommand;->_limit:I

    return v0
.end method

.method public getMap()Ljava/lang/String;
    .locals 1

    .prologue
    .line 116
    iget-object v0, p0, Lcom/mongodb/MapReduceCommand;->_map:Ljava/lang/String;

    return-object v0
.end method

.method public getMaxTime(Ljava/util/concurrent/TimeUnit;)J
    .locals 3
    .param p1, "timeUnit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 224
    iget-wide v0, p0, Lcom/mongodb/MapReduceCommand;->_maxTimeMS:J

    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p1, v0, v1, v2}, Ljava/util/concurrent/TimeUnit;->convert(JLjava/util/concurrent/TimeUnit;)J

    move-result-wide v0

    return-wide v0
.end method

.method public getOutputTarget()Ljava/lang/String;
    .locals 1

    .prologue
    .line 135
    iget-object v0, p0, Lcom/mongodb/MapReduceCommand;->_outputTarget:Ljava/lang/String;

    return-object v0
.end method

.method public getOutputType()Lcom/mongodb/MapReduceCommand$OutputType;
    .locals 1

    .prologue
    .line 144
    iget-object v0, p0, Lcom/mongodb/MapReduceCommand;->_outputType:Lcom/mongodb/MapReduceCommand$OutputType;

    return-object v0
.end method

.method public getQuery()Lcom/mongodb/DBObject;
    .locals 1

    .prologue
    .line 173
    iget-object v0, p0, Lcom/mongodb/MapReduceCommand;->_query:Lcom/mongodb/DBObject;

    return-object v0
.end method

.method public getReadPreference()Lcom/mongodb/ReadPreference;
    .locals 1

    .prologue
    .line 348
    iget-object v0, p0, Lcom/mongodb/MapReduceCommand;->_readPref:Lcom/mongodb/ReadPreference;

    return-object v0
.end method

.method public getReduce()Ljava/lang/String;
    .locals 1

    .prologue
    .line 125
    iget-object v0, p0, Lcom/mongodb/MapReduceCommand;->_reduce:Ljava/lang/String;

    return-object v0
.end method

.method public getScope()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 246
    iget-object v0, p0, Lcom/mongodb/MapReduceCommand;->_scope:Ljava/util/Map;

    return-object v0
.end method

.method public getSort()Lcom/mongodb/DBObject;
    .locals 1

    .prologue
    .line 182
    iget-object v0, p0, Lcom/mongodb/MapReduceCommand;->_sort:Lcom/mongodb/DBObject;

    return-object v0
.end method

.method public isVerbose()Ljava/lang/Boolean;
    .locals 1

    .prologue
    .line 97
    iget-object v0, p0, Lcom/mongodb/MapReduceCommand;->_verbose:Ljava/lang/Boolean;

    return-object v0
.end method

.method public setFinalize(Ljava/lang/String;)V
    .locals 0
    .param p1, "finalize"    # Ljava/lang/String;

    .prologue
    .line 164
    iput-object p1, p0, Lcom/mongodb/MapReduceCommand;->_finalize:Ljava/lang/String;

    .line 165
    return-void
.end method

.method public setLimit(I)V
    .locals 0
    .param p1, "limit"    # I

    .prologue
    .line 211
    iput p1, p0, Lcom/mongodb/MapReduceCommand;->_limit:I

    .line 212
    return-void
.end method

.method public setMaxTime(JLjava/util/concurrent/TimeUnit;)V
    .locals 3
    .param p1, "maxTime"    # J
    .param p3, "timeUnit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 237
    sget-object v0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, p1, p2, p3}, Ljava/util/concurrent/TimeUnit;->convert(JLjava/util/concurrent/TimeUnit;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/mongodb/MapReduceCommand;->_maxTimeMS:J

    .line 238
    return-void
.end method

.method public setOutputDB(Ljava/lang/String;)V
    .locals 0
    .param p1, "outputDB"    # Ljava/lang/String;

    .prologue
    .line 264
    iput-object p1, p0, Lcom/mongodb/MapReduceCommand;->_outputDB:Ljava/lang/String;

    .line 265
    return-void
.end method

.method public setReadPreference(Lcom/mongodb/ReadPreference;)V
    .locals 0
    .param p1, "preference"    # Lcom/mongodb/ReadPreference;

    .prologue
    .line 340
    iput-object p1, p0, Lcom/mongodb/MapReduceCommand;->_readPref:Lcom/mongodb/ReadPreference;

    .line 341
    return-void
.end method

.method public setScope(Ljava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 256
    .local p1, "scope":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    iput-object p1, p0, Lcom/mongodb/MapReduceCommand;->_scope:Ljava/util/Map;

    .line 257
    return-void
.end method

.method public setSort(Lcom/mongodb/DBObject;)V
    .locals 0
    .param p1, "sort"    # Lcom/mongodb/DBObject;

    .prologue
    .line 192
    iput-object p1, p0, Lcom/mongodb/MapReduceCommand;->_sort:Lcom/mongodb/DBObject;

    .line 193
    return-void
.end method

.method public setVerbose(Ljava/lang/Boolean;)V
    .locals 0
    .param p1, "verbose"    # Ljava/lang/Boolean;

    .prologue
    .line 88
    iput-object p1, p0, Lcom/mongodb/MapReduceCommand;->_verbose:Ljava/lang/Boolean;

    .line 89
    return-void
.end method

.method public toDBObject()Lcom/mongodb/DBObject;
    .locals 6

    .prologue
    .line 270
    new-instance v0, Lcom/mongodb/BasicDBObject;

    invoke-direct {v0}, Lcom/mongodb/BasicDBObject;-><init>()V

    .line 272
    .local v0, "cmd":Lcom/mongodb/BasicDBObject;
    const-string/jumbo v2, "mapreduce"

    iget-object v3, p0, Lcom/mongodb/MapReduceCommand;->_input:Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Lcom/mongodb/BasicDBObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 273
    const-string/jumbo v2, "map"

    iget-object v3, p0, Lcom/mongodb/MapReduceCommand;->_map:Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Lcom/mongodb/BasicDBObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 274
    const-string/jumbo v2, "reduce"

    iget-object v3, p0, Lcom/mongodb/MapReduceCommand;->_reduce:Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Lcom/mongodb/BasicDBObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 275
    const-string/jumbo v2, "verbose"

    iget-object v3, p0, Lcom/mongodb/MapReduceCommand;->_verbose:Ljava/lang/Boolean;

    invoke-virtual {v0, v2, v3}, Lcom/mongodb/BasicDBObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 277
    new-instance v1, Lcom/mongodb/BasicDBObject;

    invoke-direct {v1}, Lcom/mongodb/BasicDBObject;-><init>()V

    .line 278
    .local v1, "out":Lcom/mongodb/BasicDBObject;
    sget-object v2, Lcom/mongodb/MapReduceCommand$1;->$SwitchMap$com$mongodb$MapReduceCommand$OutputType:[I

    iget-object v3, p0, Lcom/mongodb/MapReduceCommand;->_outputType:Lcom/mongodb/MapReduceCommand$OutputType;

    invoke-virtual {v3}, Lcom/mongodb/MapReduceCommand$OutputType;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_0

    .line 292
    :goto_0
    iget-object v2, p0, Lcom/mongodb/MapReduceCommand;->_outputDB:Ljava/lang/String;

    if-eqz v2, :cond_0

    .line 293
    const-string/jumbo v2, "db"

    iget-object v3, p0, Lcom/mongodb/MapReduceCommand;->_outputDB:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Lcom/mongodb/BasicDBObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 294
    :cond_0
    const-string/jumbo v2, "out"

    invoke-virtual {v0, v2, v1}, Lcom/mongodb/BasicDBObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 296
    iget-object v2, p0, Lcom/mongodb/MapReduceCommand;->_query:Lcom/mongodb/DBObject;

    if-eqz v2, :cond_1

    .line 297
    const-string/jumbo v2, "query"

    iget-object v3, p0, Lcom/mongodb/MapReduceCommand;->_query:Lcom/mongodb/DBObject;

    invoke-virtual {v0, v2, v3}, Lcom/mongodb/BasicDBObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 299
    :cond_1
    iget-object v2, p0, Lcom/mongodb/MapReduceCommand;->_finalize:Ljava/lang/String;

    if-eqz v2, :cond_2

    .line 300
    const-string/jumbo v2, "finalize"

    iget-object v3, p0, Lcom/mongodb/MapReduceCommand;->_finalize:Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Lcom/mongodb/BasicDBObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 302
    :cond_2
    iget-object v2, p0, Lcom/mongodb/MapReduceCommand;->_sort:Lcom/mongodb/DBObject;

    if-eqz v2, :cond_3

    .line 303
    const-string/jumbo v2, "sort"

    iget-object v3, p0, Lcom/mongodb/MapReduceCommand;->_sort:Lcom/mongodb/DBObject;

    invoke-virtual {v0, v2, v3}, Lcom/mongodb/BasicDBObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 305
    :cond_3
    iget v2, p0, Lcom/mongodb/MapReduceCommand;->_limit:I

    if-lez v2, :cond_4

    .line 306
    const-string/jumbo v2, "limit"

    iget v3, p0, Lcom/mongodb/MapReduceCommand;->_limit:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lcom/mongodb/BasicDBObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 308
    :cond_4
    iget-object v2, p0, Lcom/mongodb/MapReduceCommand;->_scope:Ljava/util/Map;

    if-eqz v2, :cond_5

    .line 309
    const-string/jumbo v2, "scope"

    iget-object v3, p0, Lcom/mongodb/MapReduceCommand;->_scope:Ljava/util/Map;

    invoke-virtual {v0, v2, v3}, Lcom/mongodb/BasicDBObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 311
    :cond_5
    iget-object v2, p0, Lcom/mongodb/MapReduceCommand;->_extra:Lcom/mongodb/DBObject;

    if-eqz v2, :cond_6

    .line 312
    iget-object v2, p0, Lcom/mongodb/MapReduceCommand;->_extra:Lcom/mongodb/DBObject;

    invoke-virtual {v0, v2}, Lcom/mongodb/BasicDBObject;->putAll(Lorg/bson/BSONObject;)V

    .line 315
    :cond_6
    iget-wide v2, p0, Lcom/mongodb/MapReduceCommand;->_maxTimeMS:J

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-eqz v2, :cond_7

    .line 316
    const-string/jumbo v2, "maxTimeMS"

    iget-wide v4, p0, Lcom/mongodb/MapReduceCommand;->_maxTimeMS:J

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lcom/mongodb/BasicDBObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 319
    :cond_7
    return-object v0

    .line 280
    :pswitch_0
    const-string/jumbo v2, "inline"

    const/4 v3, 0x1

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/mongodb/BasicDBObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 283
    :pswitch_1
    const-string/jumbo v2, "replace"

    iget-object v3, p0, Lcom/mongodb/MapReduceCommand;->_outputTarget:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Lcom/mongodb/BasicDBObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_0

    .line 286
    :pswitch_2
    const-string/jumbo v2, "merge"

    iget-object v3, p0, Lcom/mongodb/MapReduceCommand;->_outputTarget:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Lcom/mongodb/BasicDBObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_0

    .line 289
    :pswitch_3
    const-string/jumbo v2, "reduce"

    iget-object v3, p0, Lcom/mongodb/MapReduceCommand;->_outputTarget:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Lcom/mongodb/BasicDBObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_0

    .line 278
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 353
    invoke-virtual {p0}, Lcom/mongodb/MapReduceCommand;->toDBObject()Lcom/mongodb/DBObject;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
