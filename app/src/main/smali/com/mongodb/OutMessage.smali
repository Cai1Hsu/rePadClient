.class Lcom/mongodb/OutMessage;
.super Lorg/bson/BasicBSONEncoder;
.source "OutMessage.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mongodb/OutMessage$OpCode;
    }
.end annotation


# static fields
.field static REQUEST_ID:Ljava/util/concurrent/atomic/AtomicInteger;


# instance fields
.field private _buffer:Lorg/bson/io/PoolOutputBuffer;

.field private final _collection:Lcom/mongodb/DBCollection;

.field private final _encoder:Lcom/mongodb/DBEncoder;

.field private final _id:I

.field private final _maxBSONObjectSize:I

.field private final _mongo:Lcom/mongodb/Mongo;

.field private volatile _numDocuments:I

.field private final _opCode:Lcom/mongodb/OutMessage$OpCode;

.field private final _query:Lcom/mongodb/DBObject;

.field private final _queryOptions:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 48
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    sput-object v0, Lcom/mongodb/OutMessage;->REQUEST_ID:Ljava/util/concurrent/atomic/AtomicInteger;

    return-void
.end method

.method private constructor <init>(Lcom/mongodb/DBCollection;Lcom/mongodb/DBEncoder;Lcom/mongodb/DBObject;ILcom/mongodb/ReadPreference;I)V
    .locals 9
    .param p1, "collection"    # Lcom/mongodb/DBCollection;
    .param p2, "enc"    # Lcom/mongodb/DBEncoder;
    .param p3, "query"    # Lcom/mongodb/DBObject;
    .param p4, "options"    # I
    .param p5, "readPref"    # Lcom/mongodb/ReadPreference;
    .param p6, "maxBSONObjectSize"    # I

    .prologue
    .line 127
    invoke-virtual {p1}, Lcom/mongodb/DBCollection;->getDB()Lcom/mongodb/DB;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mongodb/DB;->getMongo()Lcom/mongodb/Mongo;

    move-result-object v2

    sget-object v3, Lcom/mongodb/OutMessage$OpCode;->OP_QUERY:Lcom/mongodb/OutMessage$OpCode;

    move-object v0, p0

    move-object v1, p1

    move-object v4, p2

    move-object v5, p3

    move v6, p4

    move-object v7, p5

    move v8, p6

    invoke-direct/range {v0 .. v8}, Lcom/mongodb/OutMessage;-><init>(Lcom/mongodb/DBCollection;Lcom/mongodb/Mongo;Lcom/mongodb/OutMessage$OpCode;Lcom/mongodb/DBEncoder;Lcom/mongodb/DBObject;ILcom/mongodb/ReadPreference;I)V

    .line 128
    return-void
.end method

.method private constructor <init>(Lcom/mongodb/DBCollection;Lcom/mongodb/Mongo;Lcom/mongodb/OutMessage$OpCode;Lcom/mongodb/DBEncoder;)V
    .locals 9
    .param p1, "collection"    # Lcom/mongodb/DBCollection;
    .param p2, "m"    # Lcom/mongodb/Mongo;
    .param p3, "opCode"    # Lcom/mongodb/OutMessage$OpCode;
    .param p4, "enc"    # Lcom/mongodb/DBEncoder;

    .prologue
    const/4 v5, 0x0

    .line 118
    const/4 v6, -0x1

    const/4 v8, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v7, v5

    invoke-direct/range {v0 .. v8}, Lcom/mongodb/OutMessage;-><init>(Lcom/mongodb/DBCollection;Lcom/mongodb/Mongo;Lcom/mongodb/OutMessage$OpCode;Lcom/mongodb/DBEncoder;Lcom/mongodb/DBObject;ILcom/mongodb/ReadPreference;I)V

    .line 119
    return-void
.end method

.method private constructor <init>(Lcom/mongodb/DBCollection;Lcom/mongodb/Mongo;Lcom/mongodb/OutMessage$OpCode;Lcom/mongodb/DBEncoder;Lcom/mongodb/DBObject;ILcom/mongodb/ReadPreference;I)V
    .locals 2
    .param p1, "collection"    # Lcom/mongodb/DBCollection;
    .param p2, "m"    # Lcom/mongodb/Mongo;
    .param p3, "opCode"    # Lcom/mongodb/OutMessage$OpCode;
    .param p4, "enc"    # Lcom/mongodb/DBEncoder;
    .param p5, "query"    # Lcom/mongodb/DBObject;
    .param p6, "options"    # I
    .param p7, "readPref"    # Lcom/mongodb/ReadPreference;
    .param p8, "maxBSONObjectSize"    # I

    .prologue
    .line 131
    invoke-direct {p0}, Lorg/bson/BasicBSONEncoder;-><init>()V

    .line 132
    iput-object p1, p0, Lcom/mongodb/OutMessage;->_collection:Lcom/mongodb/DBCollection;

    .line 133
    iput-object p2, p0, Lcom/mongodb/OutMessage;->_mongo:Lcom/mongodb/Mongo;

    .line 134
    iput-object p4, p0, Lcom/mongodb/OutMessage;->_encoder:Lcom/mongodb/DBEncoder;

    .line 135
    iput p8, p0, Lcom/mongodb/OutMessage;->_maxBSONObjectSize:I

    .line 137
    iget-object v1, p0, Lcom/mongodb/OutMessage;->_mongo:Lcom/mongodb/Mongo;

    iget-object v1, v1, Lcom/mongodb/Mongo;->_bufferPool:Lorg/bson/util/SimplePool;

    invoke-virtual {v1}, Lorg/bson/util/SimplePool;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/bson/io/PoolOutputBuffer;

    iput-object v1, p0, Lcom/mongodb/OutMessage;->_buffer:Lorg/bson/io/PoolOutputBuffer;

    .line 138
    iget-object v1, p0, Lcom/mongodb/OutMessage;->_buffer:Lorg/bson/io/PoolOutputBuffer;

    invoke-virtual {v1}, Lorg/bson/io/PoolOutputBuffer;->reset()V

    .line 139
    iget-object v1, p0, Lcom/mongodb/OutMessage;->_buffer:Lorg/bson/io/PoolOutputBuffer;

    invoke-virtual {p0, v1}, Lcom/mongodb/OutMessage;->set(Lorg/bson/io/OutputBuffer;)V

    .line 141
    sget-object v1, Lcom/mongodb/OutMessage;->REQUEST_ID:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    move-result v1

    iput v1, p0, Lcom/mongodb/OutMessage;->_id:I

    .line 142
    iput-object p3, p0, Lcom/mongodb/OutMessage;->_opCode:Lcom/mongodb/OutMessage$OpCode;

    .line 144
    invoke-direct {p0, p3}, Lcom/mongodb/OutMessage;->writeMessagePrologue(Lcom/mongodb/OutMessage$OpCode;)V

    .line 146
    if-nez p5, :cond_0

    .line 147
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/mongodb/OutMessage;->_query:Lcom/mongodb/DBObject;

    .line 148
    const/4 v1, 0x0

    iput v1, p0, Lcom/mongodb/OutMessage;->_queryOptions:I

    .line 159
    :goto_0
    return-void

    .line 150
    :cond_0
    iput-object p5, p0, Lcom/mongodb/OutMessage;->_query:Lcom/mongodb/DBObject;

    .line 152
    move v0, p6

    .line 153
    .local v0, "allOptions":I
    if-eqz p7, :cond_1

    invoke-virtual {p7}, Lcom/mongodb/ReadPreference;->isSlaveOk()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 154
    or-int/lit8 v0, v0, 0x4

    .line 157
    :cond_1
    iput v0, p0, Lcom/mongodb/OutMessage;->_queryOptions:I

    goto :goto_0
.end method

.method private constructor <init>(Lcom/mongodb/DBCollection;Lcom/mongodb/OutMessage$OpCode;)V
    .locals 1
    .param p1, "collection"    # Lcom/mongodb/DBCollection;
    .param p2, "opCode"    # Lcom/mongodb/OutMessage$OpCode;

    .prologue
    .line 110
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/mongodb/OutMessage;-><init>(Lcom/mongodb/DBCollection;Lcom/mongodb/OutMessage$OpCode;Lcom/mongodb/DBEncoder;)V

    .line 111
    return-void
.end method

.method private constructor <init>(Lcom/mongodb/DBCollection;Lcom/mongodb/OutMessage$OpCode;Lcom/mongodb/DBEncoder;)V
    .locals 1
    .param p1, "collection"    # Lcom/mongodb/DBCollection;
    .param p2, "opCode"    # Lcom/mongodb/OutMessage$OpCode;
    .param p3, "enc"    # Lcom/mongodb/DBEncoder;

    .prologue
    .line 114
    invoke-virtual {p1}, Lcom/mongodb/DBCollection;->getDB()Lcom/mongodb/DB;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mongodb/DB;->getMongo()Lcom/mongodb/Mongo;

    move-result-object v0

    invoke-direct {p0, p1, v0, p2, p3}, Lcom/mongodb/OutMessage;-><init>(Lcom/mongodb/DBCollection;Lcom/mongodb/Mongo;Lcom/mongodb/OutMessage$OpCode;Lcom/mongodb/DBEncoder;)V

    .line 115
    return-void
.end method

.method private constructor <init>(Lcom/mongodb/DBCollection;Lcom/mongodb/OutMessage$OpCode;Lcom/mongodb/DBEncoder;Lcom/mongodb/DBObject;)V
    .locals 9
    .param p1, "collection"    # Lcom/mongodb/DBCollection;
    .param p2, "opCode"    # Lcom/mongodb/OutMessage$OpCode;
    .param p3, "enc"    # Lcom/mongodb/DBEncoder;
    .param p4, "query"    # Lcom/mongodb/DBObject;

    .prologue
    const/4 v6, 0x0

    .line 122
    invoke-virtual {p1}, Lcom/mongodb/DBCollection;->getDB()Lcom/mongodb/DB;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mongodb/DB;->getMongo()Lcom/mongodb/Mongo;

    move-result-object v2

    const/4 v7, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    move v8, v6

    invoke-direct/range {v0 .. v8}, Lcom/mongodb/OutMessage;-><init>(Lcom/mongodb/DBCollection;Lcom/mongodb/Mongo;Lcom/mongodb/OutMessage$OpCode;Lcom/mongodb/DBEncoder;Lcom/mongodb/DBObject;ILcom/mongodb/ReadPreference;I)V

    .line 123
    return-void
.end method

.method private constructor <init>(Lcom/mongodb/Mongo;Lcom/mongodb/OutMessage$OpCode;)V
    .locals 1
    .param p1, "m"    # Lcom/mongodb/Mongo;
    .param p2, "opCode"    # Lcom/mongodb/OutMessage$OpCode;

    .prologue
    const/4 v0, 0x0

    .line 106
    invoke-direct {p0, v0, p1, p2, v0}, Lcom/mongodb/OutMessage;-><init>(Lcom/mongodb/DBCollection;Lcom/mongodb/Mongo;Lcom/mongodb/OutMessage$OpCode;Lcom/mongodb/DBEncoder;)V

    .line 107
    return-void
.end method

.method static getMore(Lcom/mongodb/DBCollection;JI)Lcom/mongodb/OutMessage;
    .locals 3
    .param p0, "collection"    # Lcom/mongodb/DBCollection;
    .param p1, "cursorId"    # J
    .param p3, "batchSize"    # I

    .prologue
    .line 92
    new-instance v0, Lcom/mongodb/OutMessage;

    sget-object v1, Lcom/mongodb/OutMessage$OpCode;->OP_GETMORE:Lcom/mongodb/OutMessage$OpCode;

    invoke-direct {v0, p0, v1}, Lcom/mongodb/OutMessage;-><init>(Lcom/mongodb/DBCollection;Lcom/mongodb/OutMessage$OpCode;)V

    .line 93
    .local v0, "om":Lcom/mongodb/OutMessage;
    invoke-direct {v0, p1, p2, p3}, Lcom/mongodb/OutMessage;->writeGetMore(JI)V

    .line 95
    return-object v0
.end method

.method public static insert(Lcom/mongodb/DBCollection;Lcom/mongodb/DBEncoder;Lcom/mongodb/WriteConcern;)Lcom/mongodb/OutMessage;
    .locals 2
    .param p0, "collection"    # Lcom/mongodb/DBCollection;
    .param p1, "encoder"    # Lcom/mongodb/DBEncoder;
    .param p2, "concern"    # Lcom/mongodb/WriteConcern;

    .prologue
    .line 51
    new-instance v0, Lcom/mongodb/OutMessage;

    sget-object v1, Lcom/mongodb/OutMessage$OpCode;->OP_INSERT:Lcom/mongodb/OutMessage$OpCode;

    invoke-direct {v0, p0, v1, p1}, Lcom/mongodb/OutMessage;-><init>(Lcom/mongodb/DBCollection;Lcom/mongodb/OutMessage$OpCode;Lcom/mongodb/DBEncoder;)V

    .line 52
    .local v0, "om":Lcom/mongodb/OutMessage;
    invoke-direct {v0, p2}, Lcom/mongodb/OutMessage;->writeInsertPrologue(Lcom/mongodb/WriteConcern;)V

    .line 54
    return-object v0
.end method

.method static killCursors(Lcom/mongodb/Mongo;I)Lcom/mongodb/OutMessage;
    .locals 2
    .param p0, "mongo"    # Lcom/mongodb/Mongo;
    .param p1, "numCursors"    # I

    .prologue
    .line 99
    new-instance v0, Lcom/mongodb/OutMessage;

    sget-object v1, Lcom/mongodb/OutMessage$OpCode;->OP_KILL_CURSORS:Lcom/mongodb/OutMessage$OpCode;

    invoke-direct {v0, p0, v1}, Lcom/mongodb/OutMessage;-><init>(Lcom/mongodb/Mongo;Lcom/mongodb/OutMessage$OpCode;)V

    .line 100
    .local v0, "om":Lcom/mongodb/OutMessage;
    invoke-direct {v0, p1}, Lcom/mongodb/OutMessage;->writeKillCursorsPrologue(I)V

    .line 102
    return-object v0
.end method

.method static query(Lcom/mongodb/DBCollection;IIILcom/mongodb/DBObject;Lcom/mongodb/DBObject;I)Lcom/mongodb/OutMessage;
    .locals 9
    .param p0, "collection"    # Lcom/mongodb/DBCollection;
    .param p1, "options"    # I
    .param p2, "numToSkip"    # I
    .param p3, "batchSize"    # I
    .param p4, "query"    # Lcom/mongodb/DBObject;
    .param p5, "fields"    # Lcom/mongodb/DBObject;
    .param p6, "maxBSONObjectSize"    # I

    .prologue
    .line 74
    invoke-static {}, Lcom/mongodb/ReadPreference;->primary()Lcom/mongodb/ReadPreference;

    move-result-object v6

    sget-object v0, Lcom/mongodb/DefaultDBEncoder;->FACTORY:Lcom/mongodb/DBEncoderFactory;

    invoke-interface {v0}, Lcom/mongodb/DBEncoderFactory;->create()Lcom/mongodb/DBEncoder;

    move-result-object v7

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move-object v4, p4

    move-object v5, p5

    move v8, p6

    invoke-static/range {v0 .. v8}, Lcom/mongodb/OutMessage;->query(Lcom/mongodb/DBCollection;IIILcom/mongodb/DBObject;Lcom/mongodb/DBObject;Lcom/mongodb/ReadPreference;Lcom/mongodb/DBEncoder;I)Lcom/mongodb/OutMessage;

    move-result-object v0

    return-object v0
.end method

.method static query(Lcom/mongodb/DBCollection;IIILcom/mongodb/DBObject;Lcom/mongodb/DBObject;Lcom/mongodb/ReadPreference;Lcom/mongodb/DBEncoder;)Lcom/mongodb/OutMessage;
    .locals 9
    .param p0, "collection"    # Lcom/mongodb/DBCollection;
    .param p1, "options"    # I
    .param p2, "numToSkip"    # I
    .param p3, "batchSize"    # I
    .param p4, "query"    # Lcom/mongodb/DBObject;
    .param p5, "fields"    # Lcom/mongodb/DBObject;
    .param p6, "readPref"    # Lcom/mongodb/ReadPreference;
    .param p7, "enc"    # Lcom/mongodb/DBEncoder;

    .prologue
    .line 80
    const/4 v8, 0x0

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move-object v4, p4

    move-object v5, p5

    move-object v6, p6

    move-object/from16 v7, p7

    invoke-static/range {v0 .. v8}, Lcom/mongodb/OutMessage;->query(Lcom/mongodb/DBCollection;IIILcom/mongodb/DBObject;Lcom/mongodb/DBObject;Lcom/mongodb/ReadPreference;Lcom/mongodb/DBEncoder;I)Lcom/mongodb/OutMessage;

    move-result-object v0

    return-object v0
.end method

.method static query(Lcom/mongodb/DBCollection;IIILcom/mongodb/DBObject;Lcom/mongodb/DBObject;Lcom/mongodb/ReadPreference;Lcom/mongodb/DBEncoder;I)Lcom/mongodb/OutMessage;
    .locals 7
    .param p0, "collection"    # Lcom/mongodb/DBCollection;
    .param p1, "options"    # I
    .param p2, "numToSkip"    # I
    .param p3, "batchSize"    # I
    .param p4, "query"    # Lcom/mongodb/DBObject;
    .param p5, "fields"    # Lcom/mongodb/DBObject;
    .param p6, "readPref"    # Lcom/mongodb/ReadPreference;
    .param p7, "enc"    # Lcom/mongodb/DBEncoder;
    .param p8, "maxBSONObjectSize"    # I

    .prologue
    .line 85
    new-instance v0, Lcom/mongodb/OutMessage;

    move-object v1, p0

    move-object v2, p7

    move-object v3, p4

    move v4, p1

    move-object v5, p6

    move v6, p8

    invoke-direct/range {v0 .. v6}, Lcom/mongodb/OutMessage;-><init>(Lcom/mongodb/DBCollection;Lcom/mongodb/DBEncoder;Lcom/mongodb/DBObject;ILcom/mongodb/ReadPreference;I)V

    .line 86
    .local v0, "om":Lcom/mongodb/OutMessage;
    invoke-direct {v0, p5, p2, p3}, Lcom/mongodb/OutMessage;->writeQuery(Lcom/mongodb/DBObject;II)V

    .line 88
    return-object v0
.end method

.method public static remove(Lcom/mongodb/DBCollection;Lcom/mongodb/DBEncoder;Lcom/mongodb/DBObject;Z)Lcom/mongodb/OutMessage;
    .locals 2
    .param p0, "collection"    # Lcom/mongodb/DBCollection;
    .param p1, "encoder"    # Lcom/mongodb/DBEncoder;
    .param p2, "query"    # Lcom/mongodb/DBObject;
    .param p3, "multi"    # Z

    .prologue
    .line 66
    new-instance v0, Lcom/mongodb/OutMessage;

    sget-object v1, Lcom/mongodb/OutMessage$OpCode;->OP_DELETE:Lcom/mongodb/OutMessage$OpCode;

    invoke-direct {v0, p0, v1, p1, p2}, Lcom/mongodb/OutMessage;-><init>(Lcom/mongodb/DBCollection;Lcom/mongodb/OutMessage$OpCode;Lcom/mongodb/DBEncoder;Lcom/mongodb/DBObject;)V

    .line 67
    .local v0, "om":Lcom/mongodb/OutMessage;
    invoke-direct {v0, p3}, Lcom/mongodb/OutMessage;->writeRemove(Z)V

    .line 69
    return-object v0
.end method

.method public static update(Lcom/mongodb/DBCollection;Lcom/mongodb/DBEncoder;ZZLcom/mongodb/DBObject;Lcom/mongodb/DBObject;)Lcom/mongodb/OutMessage;
    .locals 2
    .param p0, "collection"    # Lcom/mongodb/DBCollection;
    .param p1, "encoder"    # Lcom/mongodb/DBEncoder;
    .param p2, "upsert"    # Z
    .param p3, "multi"    # Z
    .param p4, "query"    # Lcom/mongodb/DBObject;
    .param p5, "o"    # Lcom/mongodb/DBObject;

    .prologue
    .line 59
    new-instance v0, Lcom/mongodb/OutMessage;

    sget-object v1, Lcom/mongodb/OutMessage$OpCode;->OP_UPDATE:Lcom/mongodb/OutMessage$OpCode;

    invoke-direct {v0, p0, v1, p1, p4}, Lcom/mongodb/OutMessage;-><init>(Lcom/mongodb/DBCollection;Lcom/mongodb/OutMessage$OpCode;Lcom/mongodb/DBEncoder;Lcom/mongodb/DBObject;)V

    .line 60
    .local v0, "om":Lcom/mongodb/OutMessage;
    invoke-direct {v0, p2, p3, p4, p5}, Lcom/mongodb/OutMessage;->writeUpdate(ZZLcom/mongodb/DBObject;Lcom/mongodb/DBObject;)V

    .line 62
    return-object v0
.end method

.method private writeGetMore(JI)V
    .locals 1
    .param p1, "cursorId"    # J
    .param p3, "batchSize"    # I

    .prologue
    .line 193
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/mongodb/OutMessage;->writeInt(I)V

    .line 194
    iget-object v0, p0, Lcom/mongodb/OutMessage;->_collection:Lcom/mongodb/DBCollection;

    invoke-virtual {v0}, Lcom/mongodb/DBCollection;->getFullName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/mongodb/OutMessage;->writeCString(Ljava/lang/String;)V

    .line 195
    invoke-virtual {p0, p3}, Lcom/mongodb/OutMessage;->writeInt(I)V

    .line 196
    invoke-virtual {p0, p1, p2}, Lcom/mongodb/OutMessage;->writeLong(J)V

    .line 197
    return-void
.end method

.method private writeInsertPrologue(Lcom/mongodb/WriteConcern;)V
    .locals 2
    .param p1, "concern"    # Lcom/mongodb/WriteConcern;

    .prologue
    .line 162
    const/4 v0, 0x0

    .line 163
    .local v0, "flags":I
    invoke-virtual {p1}, Lcom/mongodb/WriteConcern;->getContinueOnErrorForInsert()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 164
    or-int/lit8 v0, v0, 0x1

    .line 166
    :cond_0
    invoke-virtual {p0, v0}, Lcom/mongodb/OutMessage;->writeInt(I)V

    .line 167
    iget-object v1, p0, Lcom/mongodb/OutMessage;->_collection:Lcom/mongodb/DBCollection;

    invoke-virtual {v1}, Lcom/mongodb/DBCollection;->getFullName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/mongodb/OutMessage;->writeCString(Ljava/lang/String;)V

    .line 168
    return-void
.end method

.method private writeKillCursorsPrologue(I)V
    .locals 1
    .param p1, "numCursors"    # I

    .prologue
    .line 200
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/mongodb/OutMessage;->writeInt(I)V

    .line 201
    invoke-virtual {p0, p1}, Lcom/mongodb/OutMessage;->writeInt(I)V

    .line 202
    return-void
.end method

.method private writeMessagePrologue(Lcom/mongodb/OutMessage$OpCode;)V
    .locals 2
    .param p1, "opCode"    # Lcom/mongodb/OutMessage$OpCode;

    .prologue
    const/4 v1, 0x0

    .line 217
    invoke-virtual {p0, v1}, Lcom/mongodb/OutMessage;->writeInt(I)V

    .line 218
    iget v0, p0, Lcom/mongodb/OutMessage;->_id:I

    invoke-virtual {p0, v0}, Lcom/mongodb/OutMessage;->writeInt(I)V

    .line 219
    invoke-virtual {p0, v1}, Lcom/mongodb/OutMessage;->writeInt(I)V

    .line 220
    invoke-virtual {p1}, Lcom/mongodb/OutMessage$OpCode;->getValue()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/mongodb/OutMessage;->writeInt(I)V

    .line 221
    return-void
.end method

.method private writeQuery(Lcom/mongodb/DBObject;II)V
    .locals 1
    .param p1, "fields"    # Lcom/mongodb/DBObject;
    .param p2, "numToSkip"    # I
    .param p3, "batchSize"    # I

    .prologue
    .line 205
    iget v0, p0, Lcom/mongodb/OutMessage;->_queryOptions:I

    invoke-virtual {p0, v0}, Lcom/mongodb/OutMessage;->writeInt(I)V

    .line 206
    iget-object v0, p0, Lcom/mongodb/OutMessage;->_collection:Lcom/mongodb/DBCollection;

    invoke-virtual {v0}, Lcom/mongodb/DBCollection;->getFullName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/mongodb/OutMessage;->writeCString(Ljava/lang/String;)V

    .line 208
    invoke-virtual {p0, p2}, Lcom/mongodb/OutMessage;->writeInt(I)V

    .line 209
    invoke-virtual {p0, p3}, Lcom/mongodb/OutMessage;->writeInt(I)V

    .line 211
    iget-object v0, p0, Lcom/mongodb/OutMessage;->_query:Lcom/mongodb/DBObject;

    invoke-virtual {p0, v0}, Lcom/mongodb/OutMessage;->putObject(Lorg/bson/BSONObject;)I

    .line 212
    if-eqz p1, :cond_0

    .line 213
    invoke-virtual {p0, p1}, Lcom/mongodb/OutMessage;->putObject(Lorg/bson/BSONObject;)I

    .line 214
    :cond_0
    return-void
.end method

.method private writeRemove(Z)V
    .locals 2
    .param p1, "multi"    # Z

    .prologue
    const/4 v0, 0x0

    .line 184
    invoke-virtual {p0, v0}, Lcom/mongodb/OutMessage;->writeInt(I)V

    .line 185
    iget-object v1, p0, Lcom/mongodb/OutMessage;->_collection:Lcom/mongodb/DBCollection;

    invoke-virtual {v1}, Lcom/mongodb/DBCollection;->getFullName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/mongodb/OutMessage;->writeCString(Ljava/lang/String;)V

    .line 187
    if-eqz p1, :cond_0

    :goto_0
    invoke-virtual {p0, v0}, Lcom/mongodb/OutMessage;->writeInt(I)V

    .line 189
    iget-object v0, p0, Lcom/mongodb/OutMessage;->_query:Lcom/mongodb/DBObject;

    invoke-virtual {p0, v0}, Lcom/mongodb/OutMessage;->putObject(Lorg/bson/BSONObject;)I

    .line 190
    return-void

    .line 187
    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method private writeUpdate(ZZLcom/mongodb/DBObject;Lcom/mongodb/DBObject;)V
    .locals 2
    .param p1, "upsert"    # Z
    .param p2, "multi"    # Z
    .param p3, "query"    # Lcom/mongodb/DBObject;
    .param p4, "o"    # Lcom/mongodb/DBObject;

    .prologue
    .line 171
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lcom/mongodb/OutMessage;->writeInt(I)V

    .line 172
    iget-object v1, p0, Lcom/mongodb/OutMessage;->_collection:Lcom/mongodb/DBCollection;

    invoke-virtual {v1}, Lcom/mongodb/DBCollection;->getFullName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/mongodb/OutMessage;->writeCString(Ljava/lang/String;)V

    .line 174
    const/4 v0, 0x0

    .line 175
    .local v0, "flags":I
    if-eqz p1, :cond_0

    or-int/lit8 v0, v0, 0x1

    .line 176
    :cond_0
    if-eqz p2, :cond_1

    or-int/lit8 v0, v0, 0x2

    .line 177
    :cond_1
    invoke-virtual {p0, v0}, Lcom/mongodb/OutMessage;->writeInt(I)V

    .line 179
    invoke-virtual {p0, p3}, Lcom/mongodb/OutMessage;->putObject(Lorg/bson/BSONObject;)I

    .line 180
    invoke-virtual {p0, p4}, Lcom/mongodb/OutMessage;->putObject(Lorg/bson/BSONObject;)I

    .line 181
    return-void
.end method


# virtual methods
.method doneWithMessage()V
    .locals 2

    .prologue
    .line 248
    iget-object v0, p0, Lcom/mongodb/OutMessage;->_buffer:Lorg/bson/io/PoolOutputBuffer;

    if-nez v0, :cond_0

    .line 249
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "Only call this once per instance"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 252
    :cond_0
    iget-object v0, p0, Lcom/mongodb/OutMessage;->_buffer:Lorg/bson/io/PoolOutputBuffer;

    invoke-virtual {v0}, Lorg/bson/io/PoolOutputBuffer;->reset()V

    .line 253
    iget-object v0, p0, Lcom/mongodb/OutMessage;->_mongo:Lcom/mongodb/Mongo;

    iget-object v0, v0, Lcom/mongodb/Mongo;->_bufferPool:Lorg/bson/util/SimplePool;

    iget-object v1, p0, Lcom/mongodb/OutMessage;->_buffer:Lorg/bson/io/PoolOutputBuffer;

    invoke-virtual {v0, v1}, Lorg/bson/util/SimplePool;->done(Ljava/lang/Object;)V

    .line 254
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mongodb/OutMessage;->_buffer:Lorg/bson/io/PoolOutputBuffer;

    .line 255
    invoke-virtual {p0}, Lcom/mongodb/OutMessage;->done()V

    .line 256
    return-void
.end method

.method getId()I
    .locals 1

    .prologue
    .line 263
    iget v0, p0, Lcom/mongodb/OutMessage;->_id:I

    return v0
.end method

.method getNamespace()Ljava/lang/String;
    .locals 1

    .prologue
    .line 275
    iget-object v0, p0, Lcom/mongodb/OutMessage;->_collection:Lcom/mongodb/DBCollection;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mongodb/OutMessage;->_collection:Lcom/mongodb/DBCollection;

    invoke-virtual {v0}, Lcom/mongodb/DBCollection;->getFullName()Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method getNumDocuments()I
    .locals 1

    .prologue
    .line 279
    iget v0, p0, Lcom/mongodb/OutMessage;->_numDocuments:I

    return v0
.end method

.method getOpCode()Lcom/mongodb/OutMessage$OpCode;
    .locals 1

    .prologue
    .line 267
    iget-object v0, p0, Lcom/mongodb/OutMessage;->_opCode:Lcom/mongodb/OutMessage$OpCode;

    return-object v0
.end method

.method getQuery()Lcom/mongodb/DBObject;
    .locals 1

    .prologue
    .line 271
    iget-object v0, p0, Lcom/mongodb/OutMessage;->_query:Lcom/mongodb/DBObject;

    return-object v0
.end method

.method hasOption(I)Z
    .locals 1
    .param p1, "option"    # I

    .prologue
    .line 259
    iget v0, p0, Lcom/mongodb/OutMessage;->_queryOptions:I

    and-int/2addr v0, p1

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method pipe(Ljava/io/OutputStream;)V
    .locals 2
    .param p1, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 232
    iget-object v0, p0, Lcom/mongodb/OutMessage;->_buffer:Lorg/bson/io/PoolOutputBuffer;

    if-nez v0, :cond_0

    .line 233
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "Already closed"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 236
    :cond_0
    iget-object v0, p0, Lcom/mongodb/OutMessage;->_buffer:Lorg/bson/io/PoolOutputBuffer;

    invoke-virtual {v0, p1}, Lorg/bson/io/PoolOutputBuffer;->pipe(Ljava/io/OutputStream;)I

    .line 237
    return-void
.end method

.method prepare()V
    .locals 3

    .prologue
    .line 224
    iget-object v0, p0, Lcom/mongodb/OutMessage;->_buffer:Lorg/bson/io/PoolOutputBuffer;

    if-nez v0, :cond_0

    .line 225
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "Already closed"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 228
    :cond_0
    iget-object v0, p0, Lcom/mongodb/OutMessage;->_buffer:Lorg/bson/io/PoolOutputBuffer;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/mongodb/OutMessage;->_buffer:Lorg/bson/io/PoolOutputBuffer;

    invoke-virtual {v2}, Lorg/bson/io/PoolOutputBuffer;->size()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Lorg/bson/io/PoolOutputBuffer;->writeInt(II)V

    .line 229
    return-void
.end method

.method public putObject(Lorg/bson/BSONObject;)I
    .locals 4
    .param p1, "o"    # Lorg/bson/BSONObject;

    .prologue
    .line 284
    iget-object v1, p0, Lcom/mongodb/OutMessage;->_buffer:Lorg/bson/io/PoolOutputBuffer;

    if-nez v1, :cond_0

    .line 285
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string/jumbo v2, "Already closed"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 289
    :cond_0
    iget-object v1, p0, Lcom/mongodb/OutMessage;->_encoder:Lcom/mongodb/DBEncoder;

    iget-object v2, p0, Lcom/mongodb/OutMessage;->_buf:Lorg/bson/io/OutputBuffer;

    invoke-interface {v1, v2, p1}, Lcom/mongodb/DBEncoder;->writeObject(Lorg/bson/io/OutputBuffer;Lorg/bson/BSONObject;)I

    move-result v0

    .line 290
    .local v0, "objectSize":I
    iget v1, p0, Lcom/mongodb/OutMessage;->_maxBSONObjectSize:I

    if-eqz v1, :cond_1

    iget v1, p0, Lcom/mongodb/OutMessage;->_maxBSONObjectSize:I

    :goto_0
    const/high16 v2, 0x400000

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v1

    if-le v0, v1, :cond_2

    .line 291
    new-instance v1, Lcom/mongodb/MongoInternalException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "DBObject of size "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, " is over Max BSON size "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/mongodb/OutMessage;->_mongo:Lcom/mongodb/Mongo;

    invoke-virtual {v3}, Lcom/mongodb/Mongo;->getMaxBsonObjectSize()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/mongodb/MongoInternalException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 290
    :cond_1
    iget-object v1, p0, Lcom/mongodb/OutMessage;->_mongo:Lcom/mongodb/Mongo;

    invoke-virtual {v1}, Lcom/mongodb/Mongo;->getMaxBsonObjectSize()I

    move-result v1

    goto :goto_0

    .line 293
    :cond_2
    iget v1, p0, Lcom/mongodb/OutMessage;->_numDocuments:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/mongodb/OutMessage;->_numDocuments:I

    .line 294
    return v0
.end method

.method size()I
    .locals 2

    .prologue
    .line 240
    iget-object v0, p0, Lcom/mongodb/OutMessage;->_buffer:Lorg/bson/io/PoolOutputBuffer;

    if-nez v0, :cond_0

    .line 241
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "Already closed"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 244
    :cond_0
    iget-object v0, p0, Lcom/mongodb/OutMessage;->_buffer:Lorg/bson/io/PoolOutputBuffer;

    invoke-virtual {v0}, Lorg/bson/io/PoolOutputBuffer;->size()I

    move-result v0

    return v0
.end method
