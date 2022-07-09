.class public Lcom/mongodb/gridfs/GridFS;
.super Ljava/lang/Object;
.source "GridFS.java"


# static fields
.field public static final DEFAULT_BUCKET:Ljava/lang/String; = "fs"

.field public static final DEFAULT_CHUNKSIZE:I = 0x3fc00

.field private static final LOGGER:Ljava/util/logging/Logger;

.field public static final MAX_CHUNKSIZE:J = 0x3567e0L
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field


# instance fields
.field protected final _bucketName:Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field protected final _chunkCollection:Lcom/mongodb/DBCollection;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field protected final _db:Lcom/mongodb/DB;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field protected final _filesCollection:Lcom/mongodb/DBCollection;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 47
    const-string/jumbo v0, "com.mongodb.gridfs"

    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v0

    sput-object v0, Lcom/mongodb/gridfs/GridFS;->LOGGER:Ljava/util/logging/Logger;

    return-void
.end method

.method public constructor <init>(Lcom/mongodb/DB;)V
    .locals 1
    .param p1, "db"    # Lcom/mongodb/DB;

    .prologue
    .line 81
    const-string/jumbo v0, "fs"

    invoke-direct {p0, p1, v0}, Lcom/mongodb/gridfs/GridFS;-><init>(Lcom/mongodb/DB;Ljava/lang/String;)V

    .line 82
    return-void
.end method

.method public constructor <init>(Lcom/mongodb/DB;Ljava/lang/String;)V
    .locals 10
    .param p1, "db"    # Lcom/mongodb/DB;
    .param p2, "bucket"    # Ljava/lang/String;

    .prologue
    const-wide/16 v8, 0x3e8

    const/4 v6, 0x1

    .line 93
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 94
    iput-object p1, p0, Lcom/mongodb/gridfs/GridFS;->_db:Lcom/mongodb/DB;

    .line 95
    iput-object p2, p0, Lcom/mongodb/gridfs/GridFS;->_bucketName:Ljava/lang/String;

    .line 97
    iget-object v1, p0, Lcom/mongodb/gridfs/GridFS;->_db:Lcom/mongodb/DB;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/mongodb/gridfs/GridFS;->_bucketName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, ".files"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/mongodb/DB;->getCollection(Ljava/lang/String;)Lcom/mongodb/DBCollection;

    move-result-object v1

    iput-object v1, p0, Lcom/mongodb/gridfs/GridFS;->_filesCollection:Lcom/mongodb/DBCollection;

    .line 98
    iget-object v1, p0, Lcom/mongodb/gridfs/GridFS;->_db:Lcom/mongodb/DB;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/mongodb/gridfs/GridFS;->_bucketName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, ".chunks"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/mongodb/DB;->getCollection(Ljava/lang/String;)Lcom/mongodb/DBCollection;

    move-result-object v1

    iput-object v1, p0, Lcom/mongodb/gridfs/GridFS;->_chunkCollection:Lcom/mongodb/DBCollection;

    .line 102
    :try_start_0
    iget-object v1, p0, Lcom/mongodb/gridfs/GridFS;->_filesCollection:Lcom/mongodb/DBCollection;

    invoke-virtual {v1}, Lcom/mongodb/DBCollection;->count()J

    move-result-wide v2

    cmp-long v1, v2, v8

    if-gez v1, :cond_0

    .line 103
    iget-object v1, p0, Lcom/mongodb/gridfs/GridFS;->_filesCollection:Lcom/mongodb/DBCollection;

    invoke-static {}, Lcom/mongodb/BasicDBObjectBuilder;->start()Lcom/mongodb/BasicDBObjectBuilder;

    move-result-object v2

    const-string/jumbo v3, "filename"

    const/4 v4, 0x1

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lcom/mongodb/BasicDBObjectBuilder;->add(Ljava/lang/String;Ljava/lang/Object;)Lcom/mongodb/BasicDBObjectBuilder;

    move-result-object v2

    const-string/jumbo v3, "uploadDate"

    const/4 v4, 0x1

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lcom/mongodb/BasicDBObjectBuilder;->add(Ljava/lang/String;Ljava/lang/Object;)Lcom/mongodb/BasicDBObjectBuilder;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mongodb/BasicDBObjectBuilder;->get()Lcom/mongodb/DBObject;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/mongodb/DBCollection;->ensureIndex(Lcom/mongodb/DBObject;)V

    .line 105
    :cond_0
    iget-object v1, p0, Lcom/mongodb/gridfs/GridFS;->_chunkCollection:Lcom/mongodb/DBCollection;

    invoke-virtual {v1}, Lcom/mongodb/DBCollection;->count()J

    move-result-wide v2

    cmp-long v1, v2, v8

    if-gez v1, :cond_1

    .line 106
    iget-object v1, p0, Lcom/mongodb/gridfs/GridFS;->_chunkCollection:Lcom/mongodb/DBCollection;

    invoke-static {}, Lcom/mongodb/BasicDBObjectBuilder;->start()Lcom/mongodb/BasicDBObjectBuilder;

    move-result-object v2

    const-string/jumbo v3, "files_id"

    const/4 v4, 0x1

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lcom/mongodb/BasicDBObjectBuilder;->add(Ljava/lang/String;Ljava/lang/Object;)Lcom/mongodb/BasicDBObjectBuilder;

    move-result-object v2

    const-string/jumbo v3, "n"

    const/4 v4, 0x1

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lcom/mongodb/BasicDBObjectBuilder;->add(Ljava/lang/String;Ljava/lang/Object;)Lcom/mongodb/BasicDBObjectBuilder;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mongodb/BasicDBObjectBuilder;->get()Lcom/mongodb/DBObject;

    move-result-object v2

    invoke-static {}, Lcom/mongodb/BasicDBObjectBuilder;->start()Lcom/mongodb/BasicDBObjectBuilder;

    move-result-object v3

    const-string/jumbo v4, "unique"

    const/4 v5, 0x1

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lcom/mongodb/BasicDBObjectBuilder;->add(Ljava/lang/String;Ljava/lang/Object;)Lcom/mongodb/BasicDBObjectBuilder;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mongodb/BasicDBObjectBuilder;->get()Lcom/mongodb/DBObject;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/mongodb/DBCollection;->ensureIndex(Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;)V
    :try_end_0
    .catch Lcom/mongodb/MongoException; {:try_start_0 .. :try_end_0} :catch_0

    .line 112
    :cond_1
    :goto_0
    iget-object v1, p0, Lcom/mongodb/gridfs/GridFS;->_filesCollection:Lcom/mongodb/DBCollection;

    const-class v2, Lcom/mongodb/gridfs/GridFSDBFile;

    invoke-virtual {v1, v2}, Lcom/mongodb/DBCollection;->setObjectClass(Ljava/lang/Class;)V

    .line 113
    return-void

    .line 109
    :catch_0
    move-exception v0

    .line 110
    .local v0, "e":Lcom/mongodb/MongoException;
    sget-object v1, Lcom/mongodb/gridfs/GridFS;->LOGGER:Ljava/util/logging/Logger;

    const-string/jumbo v2, "Unable to ensure indices on GridFS collections in database %s"

    new-array v3, v6, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-virtual {p1}, Lcom/mongodb/DB;->getName()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/logging/Logger;->info(Ljava/lang/String;)V

    goto :goto_0
.end method


# virtual methods
.method protected _fix(Ljava/lang/Object;)Lcom/mongodb/gridfs/GridFSDBFile;
    .locals 3
    .param p1, "o"    # Ljava/lang/Object;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 256
    if-nez p1, :cond_0

    .line 257
    const/4 v0, 0x0

    .line 264
    :goto_0
    return-object v0

    .line 259
    :cond_0
    instance-of v1, p1, Lcom/mongodb/gridfs/GridFSDBFile;

    if-nez v1, :cond_1

    .line 260
    new-instance v1, Ljava/lang/RuntimeException;

    const-string/jumbo v2, "somehow didn\'t get a GridFSDBFile"

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_1
    move-object v0, p1

    .line 262
    check-cast v0, Lcom/mongodb/gridfs/GridFSDBFile;

    .line 263
    .local v0, "f":Lcom/mongodb/gridfs/GridFSDBFile;
    iput-object p0, v0, Lcom/mongodb/gridfs/GridFSDBFile;->_fs:Lcom/mongodb/gridfs/GridFS;

    goto :goto_0
.end method

.method public createFile()Lcom/mongodb/gridfs/GridFSInputFile;
    .locals 1

    .prologue
    .line 406
    new-instance v0, Lcom/mongodb/gridfs/GridFSInputFile;

    invoke-direct {v0, p0}, Lcom/mongodb/gridfs/GridFSInputFile;-><init>(Lcom/mongodb/gridfs/GridFS;)V

    return-object v0
.end method

.method public createFile(Ljava/io/File;)Lcom/mongodb/gridfs/GridFSInputFile;
    .locals 3
    .param p1, "f"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 336
    new-instance v0, Ljava/io/FileInputStream;

    invoke-direct {v0, p1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-virtual {p1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {p0, v0, v1, v2}, Lcom/mongodb/gridfs/GridFS;->createFile(Ljava/io/InputStream;Ljava/lang/String;Z)Lcom/mongodb/gridfs/GridFSInputFile;

    move-result-object v0

    return-object v0
.end method

.method public createFile(Ljava/io/InputStream;)Lcom/mongodb/gridfs/GridFSInputFile;
    .locals 1
    .param p1, "in"    # Ljava/io/InputStream;

    .prologue
    .line 346
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/mongodb/gridfs/GridFS;->createFile(Ljava/io/InputStream;Ljava/lang/String;)Lcom/mongodb/gridfs/GridFSInputFile;

    move-result-object v0

    return-object v0
.end method

.method public createFile(Ljava/io/InputStream;Ljava/lang/String;)Lcom/mongodb/gridfs/GridFSInputFile;
    .locals 1
    .param p1, "in"    # Ljava/io/InputStream;
    .param p2, "filename"    # Ljava/lang/String;

    .prologue
    .line 369
    new-instance v0, Lcom/mongodb/gridfs/GridFSInputFile;

    invoke-direct {v0, p0, p1, p2}, Lcom/mongodb/gridfs/GridFSInputFile;-><init>(Lcom/mongodb/gridfs/GridFS;Ljava/io/InputStream;Ljava/lang/String;)V

    return-object v0
.end method

.method public createFile(Ljava/io/InputStream;Ljava/lang/String;Z)Lcom/mongodb/gridfs/GridFSInputFile;
    .locals 1
    .param p1, "in"    # Ljava/io/InputStream;
    .param p2, "filename"    # Ljava/lang/String;
    .param p3, "closeStreamOnPersist"    # Z

    .prologue
    .line 382
    new-instance v0, Lcom/mongodb/gridfs/GridFSInputFile;

    invoke-direct {v0, p0, p1, p2, p3}, Lcom/mongodb/gridfs/GridFSInputFile;-><init>(Lcom/mongodb/gridfs/GridFS;Ljava/io/InputStream;Ljava/lang/String;Z)V

    return-object v0
.end method

.method public createFile(Ljava/io/InputStream;Z)Lcom/mongodb/gridfs/GridFSInputFile;
    .locals 1
    .param p1, "in"    # Ljava/io/InputStream;
    .param p2, "closeStreamOnPersist"    # Z

    .prologue
    .line 358
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0, p2}, Lcom/mongodb/gridfs/GridFS;->createFile(Ljava/io/InputStream;Ljava/lang/String;Z)Lcom/mongodb/gridfs/GridFSInputFile;

    move-result-object v0

    return-object v0
.end method

.method public createFile(Ljava/lang/String;)Lcom/mongodb/gridfs/GridFSInputFile;
    .locals 1
    .param p1, "filename"    # Ljava/lang/String;

    .prologue
    .line 391
    new-instance v0, Lcom/mongodb/gridfs/GridFSInputFile;

    invoke-direct {v0, p0, p1}, Lcom/mongodb/gridfs/GridFSInputFile;-><init>(Lcom/mongodb/gridfs/GridFS;Ljava/lang/String;)V

    return-object v0
.end method

.method public createFile([B)Lcom/mongodb/gridfs/GridFSInputFile;
    .locals 2
    .param p1, "data"    # [B

    .prologue
    .line 323
    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lcom/mongodb/gridfs/GridFS;->createFile(Ljava/io/InputStream;Z)Lcom/mongodb/gridfs/GridFSInputFile;

    move-result-object v0

    return-object v0
.end method

.method public find(Lorg/bson/types/ObjectId;)Lcom/mongodb/gridfs/GridFSDBFile;
    .locals 1
    .param p1, "id"    # Lorg/bson/types/ObjectId;

    .prologue
    .line 163
    invoke-virtual {p0, p1}, Lcom/mongodb/gridfs/GridFS;->findOne(Lorg/bson/types/ObjectId;)Lcom/mongodb/gridfs/GridFSDBFile;

    move-result-object v0

    return-object v0
.end method

.method public find(Lcom/mongodb/DBObject;)Ljava/util/List;
    .locals 1
    .param p1, "query"    # Lcom/mongodb/DBObject;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/mongodb/DBObject;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/gridfs/GridFSDBFile;",
            ">;"
        }
    .end annotation

    .prologue
    .line 221
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/mongodb/gridfs/GridFS;->find(Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public find(Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;)Ljava/util/List;
    .locals 3
    .param p1, "query"    # Lcom/mongodb/DBObject;
    .param p2, "sort"    # Lcom/mongodb/DBObject;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/mongodb/DBObject;",
            "Lcom/mongodb/DBObject;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/gridfs/GridFSDBFile;",
            ">;"
        }
    .end annotation

    .prologue
    .line 232
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 234
    .local v1, "files":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/gridfs/GridFSDBFile;>;"
    const/4 v0, 0x0

    .line 236
    .local v0, "c":Lcom/mongodb/DBCursor;
    :try_start_0
    iget-object v2, p0, Lcom/mongodb/gridfs/GridFS;->_filesCollection:Lcom/mongodb/DBCollection;

    invoke-virtual {v2, p1}, Lcom/mongodb/DBCollection;->find(Lcom/mongodb/DBObject;)Lcom/mongodb/DBCursor;

    move-result-object v0

    .line 237
    if-eqz p2, :cond_0

    .line 238
    invoke-virtual {v0, p2}, Lcom/mongodb/DBCursor;->sort(Lcom/mongodb/DBObject;)Lcom/mongodb/DBCursor;

    .line 240
    :cond_0
    :goto_0
    invoke-virtual {v0}, Lcom/mongodb/DBCursor;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 241
    invoke-virtual {v0}, Lcom/mongodb/DBCursor;->next()Lcom/mongodb/DBObject;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/mongodb/gridfs/GridFS;->_fix(Ljava/lang/Object;)Lcom/mongodb/gridfs/GridFSDBFile;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 244
    :catchall_0
    move-exception v2

    if-eqz v0, :cond_1

    .line 245
    invoke-virtual {v0}, Lcom/mongodb/DBCursor;->close()V

    :cond_1
    throw v2

    .line 244
    :cond_2
    if-eqz v0, :cond_3

    .line 245
    invoke-virtual {v0}, Lcom/mongodb/DBCursor;->close()V

    .line 248
    :cond_3
    return-object v1
.end method

.method public find(Ljava/lang/String;)Ljava/util/List;
    .locals 1
    .param p1, "filename"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/gridfs/GridFSDBFile;",
            ">;"
        }
    .end annotation

    .prologue
    .line 200
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/mongodb/gridfs/GridFS;->find(Ljava/lang/String;Lcom/mongodb/DBObject;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public find(Ljava/lang/String;Lcom/mongodb/DBObject;)Ljava/util/List;
    .locals 2
    .param p1, "filename"    # Ljava/lang/String;
    .param p2, "sort"    # Lcom/mongodb/DBObject;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/mongodb/DBObject;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/gridfs/GridFSDBFile;",
            ">;"
        }
    .end annotation

    .prologue
    .line 211
    new-instance v0, Lcom/mongodb/BasicDBObject;

    const-string/jumbo v1, "filename"

    invoke-direct {v0, v1, p1}, Lcom/mongodb/BasicDBObject;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {p0, v0, p2}, Lcom/mongodb/gridfs/GridFS;->find(Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public findOne(Lcom/mongodb/DBObject;)Lcom/mongodb/gridfs/GridFSDBFile;
    .locals 1
    .param p1, "query"    # Lcom/mongodb/DBObject;

    .prologue
    .line 190
    iget-object v0, p0, Lcom/mongodb/gridfs/GridFS;->_filesCollection:Lcom/mongodb/DBCollection;

    invoke-virtual {v0, p1}, Lcom/mongodb/DBCollection;->findOne(Lcom/mongodb/DBObject;)Lcom/mongodb/DBObject;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/mongodb/gridfs/GridFS;->_fix(Ljava/lang/Object;)Lcom/mongodb/gridfs/GridFSDBFile;

    move-result-object v0

    return-object v0
.end method

.method public findOne(Ljava/lang/String;)Lcom/mongodb/gridfs/GridFSDBFile;
    .locals 2
    .param p1, "filename"    # Ljava/lang/String;

    .prologue
    .line 181
    new-instance v0, Lcom/mongodb/BasicDBObject;

    const-string/jumbo v1, "filename"

    invoke-direct {v0, v1, p1}, Lcom/mongodb/BasicDBObject;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {p0, v0}, Lcom/mongodb/gridfs/GridFS;->findOne(Lcom/mongodb/DBObject;)Lcom/mongodb/gridfs/GridFSDBFile;

    move-result-object v0

    return-object v0
.end method

.method public findOne(Lorg/bson/types/ObjectId;)Lcom/mongodb/gridfs/GridFSDBFile;
    .locals 2
    .param p1, "id"    # Lorg/bson/types/ObjectId;

    .prologue
    .line 172
    new-instance v0, Lcom/mongodb/BasicDBObject;

    const-string/jumbo v1, "_id"

    invoke-direct {v0, v1, p1}, Lcom/mongodb/BasicDBObject;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {p0, v0}, Lcom/mongodb/gridfs/GridFS;->findOne(Lcom/mongodb/DBObject;)Lcom/mongodb/gridfs/GridFSDBFile;

    move-result-object v0

    return-object v0
.end method

.method public getBucketName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 420
    iget-object v0, p0, Lcom/mongodb/gridfs/GridFS;->_bucketName:Ljava/lang/String;

    return-object v0
.end method

.method protected getChunksCollection()Lcom/mongodb/DBCollection;
    .locals 1

    .prologue
    .line 446
    iget-object v0, p0, Lcom/mongodb/gridfs/GridFS;->_chunkCollection:Lcom/mongodb/DBCollection;

    return-object v0
.end method

.method public getDB()Lcom/mongodb/DB;
    .locals 1

    .prologue
    .line 428
    iget-object v0, p0, Lcom/mongodb/gridfs/GridFS;->_db:Lcom/mongodb/DB;

    return-object v0
.end method

.method public getFileList()Lcom/mongodb/DBCursor;
    .locals 1

    .prologue
    .line 127
    new-instance v0, Lcom/mongodb/BasicDBObject;

    invoke-direct {v0}, Lcom/mongodb/BasicDBObject;-><init>()V

    invoke-virtual {p0, v0}, Lcom/mongodb/gridfs/GridFS;->getFileList(Lcom/mongodb/DBObject;)Lcom/mongodb/DBCursor;

    move-result-object v0

    return-object v0
.end method

.method public getFileList(Lcom/mongodb/DBObject;)Lcom/mongodb/DBCursor;
    .locals 3
    .param p1, "query"    # Lcom/mongodb/DBObject;

    .prologue
    .line 137
    new-instance v0, Lcom/mongodb/BasicDBObject;

    const-string/jumbo v1, "filename"

    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/mongodb/BasicDBObject;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {p0, p1, v0}, Lcom/mongodb/gridfs/GridFS;->getFileList(Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;)Lcom/mongodb/DBCursor;

    move-result-object v0

    return-object v0
.end method

.method public getFileList(Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;)Lcom/mongodb/DBCursor;
    .locals 1
    .param p1, "query"    # Lcom/mongodb/DBObject;
    .param p2, "sort"    # Lcom/mongodb/DBObject;

    .prologue
    .line 148
    iget-object v0, p0, Lcom/mongodb/gridfs/GridFS;->_filesCollection:Lcom/mongodb/DBCollection;

    invoke-virtual {v0, p1}, Lcom/mongodb/DBCollection;->find(Lcom/mongodb/DBObject;)Lcom/mongodb/DBCursor;

    move-result-object v0

    invoke-virtual {v0, p2}, Lcom/mongodb/DBCursor;->sort(Lcom/mongodb/DBObject;)Lcom/mongodb/DBCursor;

    move-result-object v0

    return-object v0
.end method

.method protected getFilesCollection()Lcom/mongodb/DBCollection;
    .locals 1

    .prologue
    .line 437
    iget-object v0, p0, Lcom/mongodb/gridfs/GridFS;->_filesCollection:Lcom/mongodb/DBCollection;

    return-object v0
.end method

.method public remove(Lcom/mongodb/DBObject;)V
    .locals 4
    .param p1, "query"    # Lcom/mongodb/DBObject;

    .prologue
    .line 303
    if-nez p1, :cond_0

    .line 304
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v3, "query can not be null"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 306
    :cond_0
    invoke-virtual {p0, p1}, Lcom/mongodb/gridfs/GridFS;->find(Lcom/mongodb/DBObject;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mongodb/gridfs/GridFSDBFile;

    .line 307
    .local v0, "f":Lcom/mongodb/gridfs/GridFSDBFile;
    invoke-virtual {v0}, Lcom/mongodb/gridfs/GridFSDBFile;->remove()V

    goto :goto_0

    .line 309
    .end local v0    # "f":Lcom/mongodb/gridfs/GridFSDBFile;
    :cond_1
    return-void
.end method

.method public remove(Ljava/lang/String;)V
    .locals 2
    .param p1, "filename"    # Ljava/lang/String;

    .prologue
    .line 291
    if-nez p1, :cond_0

    .line 292
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "filename can not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 294
    :cond_0
    new-instance v0, Lcom/mongodb/BasicDBObject;

    const-string/jumbo v1, "filename"

    invoke-direct {v0, v1, p1}, Lcom/mongodb/BasicDBObject;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {p0, v0}, Lcom/mongodb/gridfs/GridFS;->remove(Lcom/mongodb/DBObject;)V

    .line 295
    return-void
.end method

.method public remove(Lorg/bson/types/ObjectId;)V
    .locals 3
    .param p1, "id"    # Lorg/bson/types/ObjectId;

    .prologue
    .line 278
    if-nez p1, :cond_0

    .line 279
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "file id can not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 281
    :cond_0
    iget-object v0, p0, Lcom/mongodb/gridfs/GridFS;->_filesCollection:Lcom/mongodb/DBCollection;

    new-instance v1, Lcom/mongodb/BasicDBObject;

    const-string/jumbo v2, "_id"

    invoke-direct {v1, v2, p1}, Lcom/mongodb/BasicDBObject;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Lcom/mongodb/DBCollection;->remove(Lcom/mongodb/DBObject;)Lcom/mongodb/WriteResult;

    .line 282
    iget-object v0, p0, Lcom/mongodb/gridfs/GridFS;->_chunkCollection:Lcom/mongodb/DBCollection;

    new-instance v1, Lcom/mongodb/BasicDBObject;

    const-string/jumbo v2, "files_id"

    invoke-direct {v1, v2, p1}, Lcom/mongodb/BasicDBObject;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Lcom/mongodb/DBCollection;->remove(Lcom/mongodb/DBObject;)Lcom/mongodb/WriteResult;

    .line 283
    return-void
.end method
