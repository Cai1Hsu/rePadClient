.class Lcom/mongodb/QueryResultIterator;
.super Ljava/lang/Object;
.source "QueryResultIterator.java"

# interfaces
.implements Lcom/mongodb/Cursor;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mongodb/QueryResultIterator$1;,
        Lcom/mongodb/QueryResultIterator$OptionalFinalizer;
    }
.end annotation


# instance fields
.field private _batchSize:I

.field private final _collection:Lcom/mongodb/DBCollectionImpl;

.field private _cur:Ljava/util/Iterator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Iterator",
            "<",
            "Lcom/mongodb/DBObject;",
            ">;"
        }
    .end annotation
.end field

.field private _curSize:I

.field private _cursorId:J

.field private final _db:Lcom/mongodb/DBApiLayer;

.field private final _decoder:Lcom/mongodb/DBDecoder;

.field private final _host:Lcom/mongodb/ServerAddress;

.field private final _limit:I

.field private _numFetched:I

.field private _numGetMores:I

.field private final _optionalFinalizer:Lcom/mongodb/QueryResultIterator$OptionalFinalizer;

.field private final _options:I

.field private final _sizes:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private closed:Z


# direct methods
.method constructor <init>(Lcom/mongodb/DBApiLayer;Lcom/mongodb/DBCollectionImpl;Lcom/mongodb/Response;IIILcom/mongodb/DBDecoder;)V
    .locals 2
    .param p1, "db"    # Lcom/mongodb/DBApiLayer;
    .param p2, "collection"    # Lcom/mongodb/DBCollectionImpl;
    .param p3, "res"    # Lcom/mongodb/Response;
    .param p4, "batchSize"    # I
    .param p5, "limit"    # I
    .param p6, "options"    # I
    .param p7, "decoder"    # Lcom/mongodb/DBDecoder;

    .prologue
    const/4 v1, 0x0

    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/mongodb/QueryResultIterator;->_sizes:Ljava/util/List;

    .line 48
    iput v1, p0, Lcom/mongodb/QueryResultIterator;->_numGetMores:I

    .line 49
    iput v1, p0, Lcom/mongodb/QueryResultIterator;->_numFetched:I

    .line 57
    iput-object p1, p0, Lcom/mongodb/QueryResultIterator;->_db:Lcom/mongodb/DBApiLayer;

    .line 58
    iput-object p2, p0, Lcom/mongodb/QueryResultIterator;->_collection:Lcom/mongodb/DBCollectionImpl;

    .line 59
    iput p4, p0, Lcom/mongodb/QueryResultIterator;->_batchSize:I

    .line 60
    iput p5, p0, Lcom/mongodb/QueryResultIterator;->_limit:I

    .line 61
    iput p6, p0, Lcom/mongodb/QueryResultIterator;->_options:I

    .line 62
    iget-object v0, p3, Lcom/mongodb/Response;->_host:Lcom/mongodb/ServerAddress;

    iput-object v0, p0, Lcom/mongodb/QueryResultIterator;->_host:Lcom/mongodb/ServerAddress;

    .line 63
    iput-object p7, p0, Lcom/mongodb/QueryResultIterator;->_decoder:Lcom/mongodb/DBDecoder;

    .line 64
    invoke-direct {p0, p3}, Lcom/mongodb/QueryResultIterator;->initFromQueryResponse(Lcom/mongodb/Response;)V

    .line 65
    invoke-direct {p0, p2}, Lcom/mongodb/QueryResultIterator;->getOptionalFinalizer(Lcom/mongodb/DBCollectionImpl;)Lcom/mongodb/QueryResultIterator$OptionalFinalizer;

    move-result-object v0

    iput-object v0, p0, Lcom/mongodb/QueryResultIterator;->_optionalFinalizer:Lcom/mongodb/QueryResultIterator$OptionalFinalizer;

    .line 66
    return-void
.end method

.method constructor <init>(Lcom/mongodb/DBObject;Lcom/mongodb/DBApiLayer;Lcom/mongodb/DBCollectionImpl;ILcom/mongodb/DBDecoder;Lcom/mongodb/ServerAddress;)V
    .locals 2
    .param p1, "cursorDocument"    # Lcom/mongodb/DBObject;
    .param p2, "db"    # Lcom/mongodb/DBApiLayer;
    .param p3, "collection"    # Lcom/mongodb/DBCollectionImpl;
    .param p4, "batchSize"    # I
    .param p5, "decoder"    # Lcom/mongodb/DBDecoder;
    .param p6, "serverAddress"    # Lcom/mongodb/ServerAddress;

    .prologue
    const/4 v1, 0x0

    .line 70
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/mongodb/QueryResultIterator;->_sizes:Ljava/util/List;

    .line 48
    iput v1, p0, Lcom/mongodb/QueryResultIterator;->_numGetMores:I

    .line 49
    iput v1, p0, Lcom/mongodb/QueryResultIterator;->_numFetched:I

    .line 71
    iput-object p2, p0, Lcom/mongodb/QueryResultIterator;->_db:Lcom/mongodb/DBApiLayer;

    .line 72
    iput-object p3, p0, Lcom/mongodb/QueryResultIterator;->_collection:Lcom/mongodb/DBCollectionImpl;

    .line 73
    iput p4, p0, Lcom/mongodb/QueryResultIterator;->_batchSize:I

    .line 74
    iput-object p6, p0, Lcom/mongodb/QueryResultIterator;->_host:Lcom/mongodb/ServerAddress;

    .line 75
    iput v1, p0, Lcom/mongodb/QueryResultIterator;->_limit:I

    .line 76
    iput v1, p0, Lcom/mongodb/QueryResultIterator;->_options:I

    .line 77
    iput-object p5, p0, Lcom/mongodb/QueryResultIterator;->_decoder:Lcom/mongodb/DBDecoder;

    .line 78
    invoke-direct {p0, p1}, Lcom/mongodb/QueryResultIterator;->initFromCursorDocument(Lcom/mongodb/DBObject;)V

    .line 79
    invoke-direct {p0, p3}, Lcom/mongodb/QueryResultIterator;->getOptionalFinalizer(Lcom/mongodb/DBCollectionImpl;)Lcom/mongodb/QueryResultIterator$OptionalFinalizer;

    move-result-object v0

    iput-object v0, p0, Lcom/mongodb/QueryResultIterator;->_optionalFinalizer:Lcom/mongodb/QueryResultIterator$OptionalFinalizer;

    .line 80
    return-void
.end method

.method static synthetic access$100(Lcom/mongodb/QueryResultIterator;)Z
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/QueryResultIterator;

    .prologue
    .line 31
    iget-boolean v0, p0, Lcom/mongodb/QueryResultIterator;->closed:Z

    return v0
.end method

.method static synthetic access$200(Lcom/mongodb/QueryResultIterator;)J
    .locals 2
    .param p0, "x0"    # Lcom/mongodb/QueryResultIterator;

    .prologue
    .line 31
    iget-wide v0, p0, Lcom/mongodb/QueryResultIterator;->_cursorId:J

    return-wide v0
.end method

.method static synthetic access$300(Lcom/mongodb/QueryResultIterator;)Lcom/mongodb/ServerAddress;
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/QueryResultIterator;

    .prologue
    .line 31
    iget-object v0, p0, Lcom/mongodb/QueryResultIterator;->_host:Lcom/mongodb/ServerAddress;

    return-object v0
.end method

.method static synthetic access$400(Lcom/mongodb/QueryResultIterator;)Lcom/mongodb/DBApiLayer;
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/QueryResultIterator;

    .prologue
    .line 31
    iget-object v0, p0, Lcom/mongodb/QueryResultIterator;->_db:Lcom/mongodb/DBApiLayer;

    return-object v0
.end method

.method static chooseBatchSize(III)I
    .locals 4
    .param p0, "batchSize"    # I
    .param p1, "limit"    # I
    .param p2, "fetched"    # I

    .prologue
    .line 83
    invoke-static {p0}, Ljava/lang/Math;->abs(I)I

    move-result v0

    .line 84
    .local v0, "bs":I
    if-lez p1, :cond_2

    sub-int v1, p1, p2

    .line 86
    .local v1, "remaining":I
    :goto_0
    if-nez v0, :cond_3

    if-lez v1, :cond_3

    .line 87
    move v2, v1

    .line 93
    .local v2, "res":I
    :goto_1
    if-gez p0, :cond_0

    .line 95
    neg-int v2, v2

    .line 98
    :cond_0
    const/4 v3, 0x1

    if-ne v2, v3, :cond_1

    .line 100
    const/4 v2, -0x1

    .line 102
    :cond_1
    return v2

    .line 84
    .end local v1    # "remaining":I
    .end local v2    # "res":I
    :cond_2
    const/4 v1, 0x0

    goto :goto_0

    .line 88
    .restart local v1    # "remaining":I
    :cond_3
    if-lez v0, :cond_4

    if-nez v1, :cond_4

    .line 89
    move v2, v0

    .restart local v2    # "res":I
    goto :goto_1

    .line 91
    .end local v2    # "res":I
    :cond_4
    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v2

    .restart local v2    # "res":I
    goto :goto_1
.end method

.method private getGetMoreBatchSize()I
    .locals 3

    .prologue
    .line 145
    iget v0, p0, Lcom/mongodb/QueryResultIterator;->_batchSize:I

    iget v1, p0, Lcom/mongodb/QueryResultIterator;->_limit:I

    iget v2, p0, Lcom/mongodb/QueryResultIterator;->_numFetched:I

    invoke-static {v0, v1, v2}, Lcom/mongodb/QueryResultIterator;->chooseBatchSize(III)I

    move-result v0

    return v0
.end method

.method private getMore()V
    .locals 8

    .prologue
    .line 137
    iget-object v0, p0, Lcom/mongodb/QueryResultIterator;->_db:Lcom/mongodb/DBApiLayer;

    iget-object v0, v0, Lcom/mongodb/DBApiLayer;->_connector:Lcom/mongodb/DBTCPConnector;

    iget-object v1, p0, Lcom/mongodb/QueryResultIterator;->_collection:Lcom/mongodb/DBCollectionImpl;

    invoke-virtual {v1}, Lcom/mongodb/DBCollectionImpl;->getDB()Lcom/mongodb/DB;

    move-result-object v1

    iget-object v2, p0, Lcom/mongodb/QueryResultIterator;->_collection:Lcom/mongodb/DBCollectionImpl;

    iget-object v3, p0, Lcom/mongodb/QueryResultIterator;->_collection:Lcom/mongodb/DBCollectionImpl;

    iget-wide v4, p0, Lcom/mongodb/QueryResultIterator;->_cursorId:J

    invoke-direct {p0}, Lcom/mongodb/QueryResultIterator;->getGetMoreBatchSize()I

    move-result v7

    invoke-static {v3, v4, v5, v7}, Lcom/mongodb/OutMessage;->getMore(Lcom/mongodb/DBCollection;JI)Lcom/mongodb/OutMessage;

    move-result-object v3

    iget-object v4, p0, Lcom/mongodb/QueryResultIterator;->_host:Lcom/mongodb/ServerAddress;

    iget-object v5, p0, Lcom/mongodb/QueryResultIterator;->_decoder:Lcom/mongodb/DBDecoder;

    invoke-virtual/range {v0 .. v5}, Lcom/mongodb/DBTCPConnector;->call(Lcom/mongodb/DB;Lcom/mongodb/DBCollection;Lcom/mongodb/OutMessage;Lcom/mongodb/ServerAddress;Lcom/mongodb/DBDecoder;)Lcom/mongodb/Response;

    move-result-object v6

    .line 140
    .local v6, "res":Lcom/mongodb/Response;
    iget v0, p0, Lcom/mongodb/QueryResultIterator;->_numGetMores:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/mongodb/QueryResultIterator;->_numGetMores:I

    .line 141
    invoke-direct {p0, v6}, Lcom/mongodb/QueryResultIterator;->initFromQueryResponse(Lcom/mongodb/Response;)V

    .line 142
    return-void
.end method

.method private getOptionalFinalizer(Lcom/mongodb/DBCollectionImpl;)Lcom/mongodb/QueryResultIterator$OptionalFinalizer;
    .locals 6
    .param p1, "coll"    # Lcom/mongodb/DBCollectionImpl;

    .prologue
    const/4 v1, 0x0

    .line 244
    invoke-virtual {p1}, Lcom/mongodb/DBCollectionImpl;->getDB()Lcom/mongodb/DB;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mongodb/DB;->getMongo()Lcom/mongodb/Mongo;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mongodb/Mongo;->getMongoOptions()Lcom/mongodb/MongoOptions;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mongodb/MongoOptions;->isCursorFinalizerEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-wide v2, p0, Lcom/mongodb/QueryResultIterator;->_cursorId:J

    const-wide/16 v4, 0x0

    cmp-long v0, v2, v4

    if-eqz v0, :cond_0

    new-instance v0, Lcom/mongodb/QueryResultIterator$OptionalFinalizer;

    invoke-direct {v0, p0, v1}, Lcom/mongodb/QueryResultIterator$OptionalFinalizer;-><init>(Lcom/mongodb/QueryResultIterator;Lcom/mongodb/QueryResultIterator$1;)V

    :goto_0
    return-object v0

    :cond_0
    move-object v0, v1

    goto :goto_0
.end method

.method private init(IJILjava/util/Iterator;)V
    .locals 2
    .param p1, "flags"    # I
    .param p2, "cursorId"    # J
    .param p4, "size"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IJI",
            "Ljava/util/Iterator",
            "<",
            "Lcom/mongodb/DBObject;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 193
    .local p5, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/mongodb/DBObject;>;"
    iput p4, p0, Lcom/mongodb/QueryResultIterator;->_curSize:I

    .line 194
    iput-object p5, p0, Lcom/mongodb/QueryResultIterator;->_cur:Ljava/util/Iterator;

    .line 195
    iget-object v0, p0, Lcom/mongodb/QueryResultIterator;->_sizes:Ljava/util/List;

    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 196
    iget v0, p0, Lcom/mongodb/QueryResultIterator;->_numFetched:I

    add-int/2addr v0, p4

    iput v0, p0, Lcom/mongodb/QueryResultIterator;->_numFetched:I

    .line 198
    iget-wide v0, p0, Lcom/mongodb/QueryResultIterator;->_cursorId:J

    invoke-direct {p0, v0, v1, p1}, Lcom/mongodb/QueryResultIterator;->throwOnQueryFailure(JI)V

    .line 199
    iput-wide p2, p0, Lcom/mongodb/QueryResultIterator;->_cursorId:J

    .line 201
    const-wide/16 v0, 0x0

    cmp-long v0, p2, v0

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/mongodb/QueryResultIterator;->_limit:I

    if-lez v0, :cond_0

    iget v0, p0, Lcom/mongodb/QueryResultIterator;->_limit:I

    iget v1, p0, Lcom/mongodb/QueryResultIterator;->_numFetched:I

    sub-int/2addr v0, v1

    if-gtz v0, :cond_0

    .line 203
    invoke-virtual {p0}, Lcom/mongodb/QueryResultIterator;->killCursor()V

    .line 205
    :cond_0
    return-void
.end method

.method private initFromCursorDocument(Lcom/mongodb/DBObject;)V
    .locals 13
    .param p1, "cursorDocument"    # Lcom/mongodb/DBObject;

    .prologue
    const/4 v1, 0x0

    .line 181
    const-string/jumbo v0, "cursor"

    invoke-interface {p1, v0}, Lcom/mongodb/DBObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/util/Map;

    .line 182
    .local v10, "cursor":Ljava/util/Map;
    if-eqz v10, :cond_0

    .line 183
    const-string/jumbo v0, "id"

    invoke-interface {v10, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    .line 184
    .local v2, "cursorId":J
    const-string/jumbo v0, "firstBatch"

    invoke-interface {v10, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/util/List;

    .line 185
    .local v11, "firstBatch":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/DBObject;>;"
    invoke-interface {v11}, Ljava/util/List;->size()I

    move-result v4

    invoke-interface {v11}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/mongodb/QueryResultIterator;->init(IJILjava/util/Iterator;)V

    .line 190
    .end local v2    # "cursorId":J
    .end local v11    # "firstBatch":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/DBObject;>;"
    :goto_0
    return-void

    .line 187
    :cond_0
    const-string/jumbo v0, "result"

    invoke-interface {p1, v0}, Lcom/mongodb/DBObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/util/List;

    .line 188
    .local v12, "result":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/DBObject;>;"
    const-wide/16 v6, 0x0

    invoke-interface {v12}, Ljava/util/List;->size()I

    move-result v8

    invoke-interface {v12}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    move-object v4, p0

    move v5, v1

    invoke-direct/range {v4 .. v9}, Lcom/mongodb/QueryResultIterator;->init(IJILjava/util/Iterator;)V

    goto :goto_0
.end method

.method private initFromQueryResponse(Lcom/mongodb/Response;)V
    .locals 6
    .param p1, "response"    # Lcom/mongodb/Response;

    .prologue
    .line 176
    iget v1, p1, Lcom/mongodb/Response;->_flags:I

    invoke-virtual {p1}, Lcom/mongodb/Response;->cursor()J

    move-result-wide v2

    invoke-virtual {p1}, Lcom/mongodb/Response;->size()I

    move-result v4

    invoke-virtual {p1}, Lcom/mongodb/Response;->iterator()Ljava/util/Iterator;

    move-result-object v5

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/mongodb/QueryResultIterator;->init(IJILjava/util/Iterator;)V

    .line 177
    return-void
.end method

.method private throwOnQueryFailure(JI)V
    .locals 5
    .param p1, "cursorId"    # J
    .param p3, "flags"    # I

    .prologue
    const/4 v3, 0x0

    .line 208
    and-int/lit8 v1, p3, 0x2

    if-lez v1, :cond_1

    .line 209
    iget-object v1, p0, Lcom/mongodb/QueryResultIterator;->_cur:Ljava/util/Iterator;

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/bson/BSONObject;

    .line 210
    .local v0, "errorDocument":Lorg/bson/BSONObject;
    invoke-static {v0}, Lcom/mongodb/ServerError;->getCode(Lorg/bson/BSONObject;)I

    move-result v1

    const/16 v2, 0x32

    if-ne v1, v2, :cond_0

    .line 211
    new-instance v1, Lcom/mongodb/MongoExecutionTimeoutException;

    invoke-static {v0}, Lcom/mongodb/ServerError;->getCode(Lorg/bson/BSONObject;)I

    move-result v2

    invoke-static {v0, v3}, Lcom/mongodb/ServerError;->getMsg(Lorg/bson/BSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lcom/mongodb/MongoExecutionTimeoutException;-><init>(ILjava/lang/String;)V

    throw v1

    .line 214
    :cond_0
    new-instance v1, Lcom/mongodb/MongoException;

    invoke-static {v0}, Lcom/mongodb/ServerError;->getCode(Lorg/bson/BSONObject;)I

    move-result v2

    invoke-static {v0, v3}, Lcom/mongodb/ServerError;->getMsg(Lorg/bson/BSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lcom/mongodb/MongoException;-><init>(ILjava/lang/String;)V

    throw v1

    .line 217
    .end local v0    # "errorDocument":Lorg/bson/BSONObject;
    :cond_1
    and-int/lit8 v1, p3, 0x1

    if-lez v1, :cond_2

    .line 218
    new-instance v1, Lcom/mongodb/MongoException$CursorNotFound;

    iget-object v2, p0, Lcom/mongodb/QueryResultIterator;->_host:Lcom/mongodb/ServerAddress;

    invoke-direct {v1, p1, p2, v2}, Lcom/mongodb/MongoException$CursorNotFound;-><init>(JLcom/mongodb/ServerAddress;)V

    throw v1

    .line 220
    :cond_2
    return-void
.end method


# virtual methods
.method public close()V
    .locals 1

    .prologue
    .line 169
    iget-boolean v0, p0, Lcom/mongodb/QueryResultIterator;->closed:Z

    if-nez v0, :cond_0

    .line 170
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mongodb/QueryResultIterator;->closed:Z

    .line 171
    invoke-virtual {p0}, Lcom/mongodb/QueryResultIterator;->killCursor()V

    .line 173
    :cond_0
    return-void
.end method

.method public getCursorId()J
    .locals 2

    .prologue
    .line 157
    iget-wide v0, p0, Lcom/mongodb/QueryResultIterator;->_cursorId:J

    return-wide v0
.end method

.method public getServerAddress()Lcom/mongodb/ServerAddress;
    .locals 1

    .prologue
    .line 236
    iget-object v0, p0, Lcom/mongodb/QueryResultIterator;->_host:Lcom/mongodb/ServerAddress;

    return-object v0
.end method

.method getSizes()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 165
    iget-object v0, p0, Lcom/mongodb/QueryResultIterator;->_sizes:Ljava/util/List;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method hasFinalizer()Z
    .locals 1

    .prologue
    .line 240
    iget-object v0, p0, Lcom/mongodb/QueryResultIterator;->_optionalFinalizer:Lcom/mongodb/QueryResultIterator$OptionalFinalizer;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public hasNext()Z
    .locals 6

    .prologue
    const/4 v0, 0x1

    .line 118
    iget-boolean v1, p0, Lcom/mongodb/QueryResultIterator;->closed:Z

    if-eqz v1, :cond_0

    .line 119
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "Iterator has been closed"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 122
    :cond_0
    iget-object v1, p0, Lcom/mongodb/QueryResultIterator;->_cur:Ljava/util/Iterator;

    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 133
    :goto_0
    return v0

    .line 126
    :cond_1
    iget-wide v2, p0, Lcom/mongodb/QueryResultIterator;->_cursorId:J

    const-wide/16 v4, 0x0

    cmp-long v1, v2, v4

    if-eqz v1, :cond_2

    .line 127
    invoke-direct {p0}, Lcom/mongodb/QueryResultIterator;->getMore()V

    .line 128
    iget v1, p0, Lcom/mongodb/QueryResultIterator;->_curSize:I

    if-lez v1, :cond_1

    goto :goto_0

    .line 133
    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method

.method killCursor()V
    .locals 8

    .prologue
    const-wide/16 v4, 0x0

    .line 224
    iget-wide v2, p0, Lcom/mongodb/QueryResultIterator;->_cursorId:J

    cmp-long v1, v2, v4

    if-nez v1, :cond_0

    .line 233
    :goto_0
    return-void

    .line 228
    :cond_0
    :try_start_0
    iget-object v1, p0, Lcom/mongodb/QueryResultIterator;->_db:Lcom/mongodb/DBApiLayer;

    iget-object v2, p0, Lcom/mongodb/QueryResultIterator;->_host:Lcom/mongodb/ServerAddress;

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Long;

    const/4 v4, 0x0

    iget-wide v6, p0, Lcom/mongodb/QueryResultIterator;->_cursorId:J

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v3}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/mongodb/DBApiLayer;->killCursors(Lcom/mongodb/ServerAddress;Ljava/util/List;)V

    .line 229
    const-wide/16 v2, 0x0

    iput-wide v2, p0, Lcom/mongodb/QueryResultIterator;->_cursorId:J
    :try_end_0
    .catch Lcom/mongodb/MongoException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 230
    :catch_0
    move-exception v0

    .line 231
    .local v0, "e":Lcom/mongodb/MongoException;
    iget-object v1, p0, Lcom/mongodb/QueryResultIterator;->_db:Lcom/mongodb/DBApiLayer;

    new-instance v2, Lcom/mongodb/DBApiLayer$DeadCursor;

    iget-wide v4, p0, Lcom/mongodb/QueryResultIterator;->_cursorId:J

    iget-object v3, p0, Lcom/mongodb/QueryResultIterator;->_host:Lcom/mongodb/ServerAddress;

    invoke-direct {v2, v4, v5, v3}, Lcom/mongodb/DBApiLayer$DeadCursor;-><init>(JLcom/mongodb/ServerAddress;)V

    invoke-virtual {v1, v2}, Lcom/mongodb/DBApiLayer;->addDeadCursor(Lcom/mongodb/DBApiLayer$DeadCursor;)V

    goto :goto_0
.end method

.method public next()Lcom/mongodb/DBObject;
    .locals 2

    .prologue
    .line 106
    iget-boolean v0, p0, Lcom/mongodb/QueryResultIterator;->closed:Z

    if-eqz v0, :cond_0

    .line 107
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "Iterator has been closed"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 110
    :cond_0
    invoke-virtual {p0}, Lcom/mongodb/QueryResultIterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_1

    .line 111
    new-instance v0, Ljava/util/NoSuchElementException;

    invoke-direct {v0}, Ljava/util/NoSuchElementException;-><init>()V

    throw v0

    .line 114
    :cond_1
    iget-object v0, p0, Lcom/mongodb/QueryResultIterator;->_cur:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mongodb/DBObject;

    return-object v0
.end method

.method public bridge synthetic next()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 31
    invoke-virtual {p0}, Lcom/mongodb/QueryResultIterator;->next()Lcom/mongodb/DBObject;

    move-result-object v0

    return-object v0
.end method

.method numGetMores()I
    .locals 1

    .prologue
    .line 161
    iget v0, p0, Lcom/mongodb/QueryResultIterator;->_numGetMores:I

    return v0
.end method

.method public remove()V
    .locals 2

    .prologue
    .line 149
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string/jumbo v1, "can\'t remove a document via a query result iterator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setBatchSize(I)V
    .locals 0
    .param p1, "size"    # I

    .prologue
    .line 153
    iput p1, p0, Lcom/mongodb/QueryResultIterator;->_batchSize:I

    .line 154
    return-void
.end method
