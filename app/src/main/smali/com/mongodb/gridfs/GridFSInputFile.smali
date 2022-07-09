.class public Lcom/mongodb/gridfs/GridFSInputFile;
.super Lcom/mongodb/gridfs/GridFSFile;
.source "GridFSInputFile.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mongodb/gridfs/GridFSInputFile$MyOutputStream;
    }
.end annotation


# instance fields
.field private _buffer:[B

.field private _closeStreamOnPersist:Z

.field private _currentBufferPosition:I

.field private _currentChunkNumber:I

.field private final _in:Ljava/io/InputStream;

.field private _messageDigester:Ljava/security/MessageDigest;

.field private _outputStream:Ljava/io/OutputStream;

.field private _savedChunks:Z

.field private _totalBytes:J


# direct methods
.method protected constructor <init>(Lcom/mongodb/gridfs/GridFS;)V
    .locals 1
    .param p1, "fs"    # Lcom/mongodb/gridfs/GridFS;

    .prologue
    const/4 v0, 0x0

    .line 114
    invoke-direct {p0, p1, v0, v0}, Lcom/mongodb/gridfs/GridFSInputFile;-><init>(Lcom/mongodb/gridfs/GridFS;Ljava/io/InputStream;Ljava/lang/String;)V

    .line 115
    return-void
.end method

.method protected constructor <init>(Lcom/mongodb/gridfs/GridFS;Ljava/io/InputStream;Ljava/lang/String;)V
    .locals 1
    .param p1, "fs"    # Lcom/mongodb/gridfs/GridFS;
    .param p2, "in"    # Ljava/io/InputStream;
    .param p3, "filename"    # Ljava/lang/String;

    .prologue
    .line 87
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/mongodb/gridfs/GridFSInputFile;-><init>(Lcom/mongodb/gridfs/GridFS;Ljava/io/InputStream;Ljava/lang/String;Z)V

    .line 88
    return-void
.end method

.method protected constructor <init>(Lcom/mongodb/gridfs/GridFS;Ljava/io/InputStream;Ljava/lang/String;Z)V
    .locals 5
    .param p1, "fs"    # Lcom/mongodb/gridfs/GridFS;
    .param p2, "in"    # Ljava/io/InputStream;
    .param p3, "filename"    # Ljava/lang/String;
    .param p4, "closeStreamOnPersist"    # Z

    .prologue
    const/4 v4, 0x0

    const/4 v1, 0x0

    .line 57
    invoke-direct {p0}, Lcom/mongodb/gridfs/GridFSFile;-><init>()V

    .line 337
    iput-boolean v1, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_savedChunks:Z

    .line 338
    iput-object v4, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_buffer:[B

    .line 339
    iput v1, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_currentChunkNumber:I

    .line 340
    iput v1, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_currentBufferPosition:I

    .line 341
    const-wide/16 v2, 0x0

    iput-wide v2, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_totalBytes:J

    .line 342
    iput-object v4, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_messageDigester:Ljava/security/MessageDigest;

    .line 343
    iput-object v4, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_outputStream:Ljava/io/OutputStream;

    .line 58
    iput-object p1, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_fs:Lcom/mongodb/gridfs/GridFS;

    .line 59
    iput-object p2, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_in:Ljava/io/InputStream;

    .line 60
    iput-object p3, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_filename:Ljava/lang/String;

    .line 61
    iput-boolean p4, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_closeStreamOnPersist:Z

    .line 63
    new-instance v1, Lorg/bson/types/ObjectId;

    invoke-direct {v1}, Lorg/bson/types/ObjectId;-><init>()V

    iput-object v1, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_id:Ljava/lang/Object;

    .line 64
    const-wide/32 v2, 0x3fc00

    iput-wide v2, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_chunkSize:J

    .line 65
    new-instance v1, Ljava/util/Date;

    invoke-direct {v1}, Ljava/util/Date;-><init>()V

    iput-object v1, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_uploadDate:Ljava/util/Date;

    .line 67
    :try_start_0
    const-string/jumbo v1, "MD5"

    invoke-static {v1}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v1

    iput-object v1, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_messageDigester:Ljava/security/MessageDigest;
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0

    .line 71
    iget-object v1, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_messageDigester:Ljava/security/MessageDigest;

    invoke-virtual {v1}, Ljava/security/MessageDigest;->reset()V

    .line 72
    iget-wide v2, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_chunkSize:J

    long-to-int v1, v2

    new-array v1, v1, [B

    iput-object v1, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_buffer:[B

    .line 73
    return-void

    .line 68
    :catch_0
    move-exception v0

    .line 69
    .local v0, "e":Ljava/security/NoSuchAlgorithmException;
    new-instance v1, Ljava/lang/RuntimeException;

    const-string/jumbo v2, "No MD5!"

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method protected constructor <init>(Lcom/mongodb/gridfs/GridFS;Ljava/lang/String;)V
    .locals 1
    .param p1, "fs"    # Lcom/mongodb/gridfs/GridFS;
    .param p2, "filename"    # Ljava/lang/String;

    .prologue
    .line 102
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, p2}, Lcom/mongodb/gridfs/GridFSInputFile;-><init>(Lcom/mongodb/gridfs/GridFS;Ljava/io/InputStream;Ljava/lang/String;)V

    .line 103
    return-void
.end method

.method private _dumpBuffer(Z)V
    .locals 7
    .param p1, "writePartial"    # Z

    .prologue
    const/4 v6, 0x0

    .line 264
    iget v2, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_currentBufferPosition:I

    int-to-long v2, v2

    iget-wide v4, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_chunkSize:J

    cmp-long v2, v2, v4

    if-gez v2, :cond_1

    if-nez p1, :cond_1

    .line 287
    :cond_0
    :goto_0
    return-void

    .line 268
    :cond_1
    iget v2, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_currentBufferPosition:I

    if-eqz v2, :cond_0

    .line 273
    iget-object v1, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_buffer:[B

    .line 274
    .local v1, "writeBuffer":[B
    iget v2, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_currentBufferPosition:I

    int-to-long v2, v2

    iget-wide v4, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_chunkSize:J

    cmp-long v2, v2, v4

    if-eqz v2, :cond_2

    .line 275
    iget v2, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_currentBufferPosition:I

    new-array v1, v2, [B

    .line 276
    iget-object v2, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_buffer:[B

    iget v3, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_currentBufferPosition:I

    invoke-static {v2, v6, v1, v6, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 279
    :cond_2
    iget-object v2, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_id:Ljava/lang/Object;

    iget v3, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_currentChunkNumber:I

    invoke-virtual {p0, v2, v3, v1}, Lcom/mongodb/gridfs/GridFSInputFile;->createChunk(Ljava/lang/Object;I[B)Lcom/mongodb/DBObject;

    move-result-object v0

    .line 281
    .local v0, "chunk":Lcom/mongodb/DBObject;
    iget-object v2, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_fs:Lcom/mongodb/gridfs/GridFS;

    iget-object v2, v2, Lcom/mongodb/gridfs/GridFS;->_chunkCollection:Lcom/mongodb/DBCollection;

    invoke-virtual {v2, v0}, Lcom/mongodb/DBCollection;->save(Lcom/mongodb/DBObject;)Lcom/mongodb/WriteResult;

    .line 283
    iget v2, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_currentChunkNumber:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_currentChunkNumber:I

    .line 284
    iget-wide v2, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_totalBytes:J

    array-length v4, v1

    int-to-long v4, v4

    add-long/2addr v2, v4

    iput-wide v2, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_totalBytes:J

    .line 285
    iget-object v2, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_messageDigester:Ljava/security/MessageDigest;

    invoke-virtual {v2, v1}, Ljava/security/MessageDigest;->update([B)V

    .line 286
    iput v6, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_currentBufferPosition:I

    goto :goto_0
.end method

.method private _finishData()V
    .locals 2

    .prologue
    .line 321
    iget-boolean v0, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_savedChunks:Z

    if-nez v0, :cond_0

    .line 322
    iget-object v0, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_messageDigester:Ljava/security/MessageDigest;

    invoke-virtual {v0}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v0

    invoke-static {v0}, Lcom/mongodb/util/Util;->toHex([B)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_md5:Ljava/lang/String;

    .line 323
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_messageDigester:Ljava/security/MessageDigest;

    .line 324
    iget-wide v0, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_totalBytes:J

    iput-wide v0, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_length:J

    .line 325
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_savedChunks:Z

    .line 327
    :try_start_0
    iget-object v0, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_in:Ljava/io/InputStream;

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_closeStreamOnPersist:Z

    if-eqz v0, :cond_0

    .line 328
    iget-object v0, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_in:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 333
    :cond_0
    :goto_0
    return-void

    .line 329
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method private _readStream2Buffer()I
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 304
    const/4 v0, 0x0

    .line 305
    .local v0, "bytesRead":I
    :cond_0
    :goto_0
    iget v1, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_currentBufferPosition:I

    int-to-long v2, v1

    iget-wide v4, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_chunkSize:J

    cmp-long v1, v2, v4

    if-gez v1, :cond_2

    if-ltz v0, :cond_2

    .line 306
    iget-object v1, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_in:Ljava/io/InputStream;

    iget-object v2, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_buffer:[B

    iget v3, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_currentBufferPosition:I

    iget-wide v4, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_chunkSize:J

    long-to-int v4, v4

    iget v5, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_currentBufferPosition:I

    sub-int/2addr v4, v5

    invoke-virtual {v1, v2, v3, v4}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    .line 308
    if-lez v0, :cond_1

    .line 309
    iget v1, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_currentBufferPosition:I

    add-int/2addr v1, v0

    iput v1, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_currentBufferPosition:I

    goto :goto_0

    .line 310
    :cond_1
    if-nez v0, :cond_0

    .line 311
    new-instance v1, Ljava/lang/RuntimeException;

    const-string/jumbo v2, "i\'m doing something wrong"

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 314
    :cond_2
    return v0
.end method

.method static synthetic access$000(Lcom/mongodb/gridfs/GridFSInputFile;)I
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/gridfs/GridFSInputFile;

    .prologue
    .line 42
    iget v0, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_currentBufferPosition:I

    return v0
.end method

.method static synthetic access$012(Lcom/mongodb/gridfs/GridFSInputFile;I)I
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/gridfs/GridFSInputFile;
    .param p1, "x1"    # I

    .prologue
    .line 42
    iget v0, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_currentBufferPosition:I

    add-int/2addr v0, p1

    iput v0, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_currentBufferPosition:I

    return v0
.end method

.method static synthetic access$100(Lcom/mongodb/gridfs/GridFSInputFile;)[B
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/gridfs/GridFSInputFile;

    .prologue
    .line 42
    iget-object v0, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_buffer:[B

    return-object v0
.end method

.method static synthetic access$200(Lcom/mongodb/gridfs/GridFSInputFile;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/mongodb/gridfs/GridFSInputFile;
    .param p1, "x1"    # Z

    .prologue
    .line 42
    invoke-direct {p0, p1}, Lcom/mongodb/gridfs/GridFSInputFile;->_dumpBuffer(Z)V

    return-void
.end method

.method static synthetic access$300(Lcom/mongodb/gridfs/GridFSInputFile;)V
    .locals 0
    .param p0, "x0"    # Lcom/mongodb/gridfs/GridFSInputFile;

    .prologue
    .line 42
    invoke-direct {p0}, Lcom/mongodb/gridfs/GridFSInputFile;->_finishData()V

    return-void
.end method

.method static synthetic access$401(Lcom/mongodb/gridfs/GridFSInputFile;)V
    .locals 0
    .param p0, "x0"    # Lcom/mongodb/gridfs/GridFSInputFile;

    .prologue
    .line 42
    invoke-super {p0}, Lcom/mongodb/gridfs/GridFSFile;->save()V

    return-void
.end method


# virtual methods
.method protected createChunk(Ljava/lang/Object;I[B)Lcom/mongodb/DBObject;
    .locals 3
    .param p1, "id"    # Ljava/lang/Object;
    .param p2, "currentChunkNumber"    # I
    .param p3, "writeBuffer"    # [B

    .prologue
    .line 290
    invoke-static {}, Lcom/mongodb/BasicDBObjectBuilder;->start()Lcom/mongodb/BasicDBObjectBuilder;

    move-result-object v0

    const-string/jumbo v1, "files_id"

    invoke-virtual {v0, v1, p1}, Lcom/mongodb/BasicDBObjectBuilder;->add(Ljava/lang/String;Ljava/lang/Object;)Lcom/mongodb/BasicDBObjectBuilder;

    move-result-object v0

    const-string/jumbo v1, "n"

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/mongodb/BasicDBObjectBuilder;->add(Ljava/lang/String;Ljava/lang/Object;)Lcom/mongodb/BasicDBObjectBuilder;

    move-result-object v0

    const-string/jumbo v1, "data"

    invoke-virtual {v0, v1, p3}, Lcom/mongodb/BasicDBObjectBuilder;->add(Ljava/lang/String;Ljava/lang/Object;)Lcom/mongodb/BasicDBObjectBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mongodb/BasicDBObjectBuilder;->get()Lcom/mongodb/DBObject;

    move-result-object v0

    return-object v0
.end method

.method public getOutputStream()Ljava/io/OutputStream;
    .locals 1

    .prologue
    .line 249
    iget-object v0, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_outputStream:Ljava/io/OutputStream;

    if-nez v0, :cond_0

    .line 250
    new-instance v0, Lcom/mongodb/gridfs/GridFSInputFile$MyOutputStream;

    invoke-direct {v0, p0}, Lcom/mongodb/gridfs/GridFSInputFile$MyOutputStream;-><init>(Lcom/mongodb/gridfs/GridFSInputFile;)V

    iput-object v0, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_outputStream:Ljava/io/OutputStream;

    .line 252
    :cond_0
    iget-object v0, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_outputStream:Ljava/io/OutputStream;

    return-object v0
.end method

.method public save()V
    .locals 2

    .prologue
    .line 158
    iget-wide v0, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_chunkSize:J

    invoke-virtual {p0, v0, v1}, Lcom/mongodb/gridfs/GridFSInputFile;->save(J)V

    .line 159
    return-void
.end method

.method public save(J)V
    .locals 3
    .param p1, "chunkSize"    # J

    .prologue
    .line 170
    iget-object v1, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_outputStream:Ljava/io/OutputStream;

    if-eqz v1, :cond_0

    .line 171
    new-instance v1, Lcom/mongodb/MongoException;

    const-string/jumbo v2, "cannot mix OutputStream and regular save()"

    invoke-direct {v1, v2}, Lcom/mongodb/MongoException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 175
    :cond_0
    iget-boolean v1, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_savedChunks:Z

    if-nez v1, :cond_1

    .line 177
    :try_start_0
    invoke-virtual {p0, p1, p2}, Lcom/mongodb/gridfs/GridFSInputFile;->saveChunks(J)I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 183
    :cond_1
    invoke-super {p0}, Lcom/mongodb/gridfs/GridFSFile;->save()V

    .line 184
    return-void

    .line 178
    :catch_0
    move-exception v0

    .line 179
    .local v0, "ioe":Ljava/io/IOException;
    new-instance v1, Lcom/mongodb/MongoException;

    const-string/jumbo v2, "couldn\'t save chunks"

    invoke-direct {v1, v2, v0}, Lcom/mongodb/MongoException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public saveChunks()I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 196
    iget-wide v0, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_chunkSize:J

    invoke-virtual {p0, v0, v1}, Lcom/mongodb/gridfs/GridFSInputFile;->saveChunks(J)I

    move-result v0

    return v0
.end method

.method public saveChunks(J)I
    .locals 5
    .param p1, "chunkSize"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 213
    iget-object v1, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_outputStream:Ljava/io/OutputStream;

    if-eqz v1, :cond_0

    .line 214
    new-instance v1, Lcom/mongodb/MongoException;

    const-string/jumbo v2, "cannot mix OutputStream and regular save()"

    invoke-direct {v1, v2}, Lcom/mongodb/MongoException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 215
    :cond_0
    iget-boolean v1, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_savedChunks:Z

    if-eqz v1, :cond_1

    .line 216
    new-instance v1, Lcom/mongodb/MongoException;

    const-string/jumbo v2, "chunks already saved!"

    invoke-direct {v1, v2}, Lcom/mongodb/MongoException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 218
    :cond_1
    const-wide/16 v2, 0x0

    cmp-long v1, p1, v2

    if-gtz v1, :cond_2

    .line 219
    new-instance v1, Lcom/mongodb/MongoException;

    const-string/jumbo v2, "chunkSize must be greater than zero"

    invoke-direct {v1, v2}, Lcom/mongodb/MongoException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 222
    :cond_2
    iget-wide v2, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_chunkSize:J

    cmp-long v1, v2, p1

    if-eqz v1, :cond_3

    .line 223
    iput-wide p1, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_chunkSize:J

    .line 224
    iget-wide v2, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_chunkSize:J

    long-to-int v1, v2

    new-array v1, v1, [B

    iput-object v1, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_buffer:[B

    .line 227
    :cond_3
    const/4 v0, 0x0

    .line 228
    .local v0, "bytesRead":I
    :goto_0
    if-ltz v0, :cond_4

    .line 229
    const/4 v1, 0x0

    iput v1, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_currentBufferPosition:I

    .line 230
    invoke-direct {p0}, Lcom/mongodb/gridfs/GridFSInputFile;->_readStream2Buffer()I

    move-result v0

    .line 231
    const/4 v1, 0x1

    invoke-direct {p0, v1}, Lcom/mongodb/gridfs/GridFSInputFile;->_dumpBuffer(Z)V

    goto :goto_0

    .line 235
    :cond_4
    invoke-direct {p0}, Lcom/mongodb/gridfs/GridFSInputFile;->_finishData()V

    .line 236
    iget v1, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_currentChunkNumber:I

    return v1
.end method

.method public setChunkSize(J)V
    .locals 3
    .param p1, "chunkSize"    # J

    .prologue
    .line 146
    iget-object v0, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_outputStream:Ljava/io/OutputStream;

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_savedChunks:Z

    if-eqz v0, :cond_1

    .line 150
    :cond_0
    :goto_0
    return-void

    .line 148
    :cond_1
    iput-wide p1, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_chunkSize:J

    .line 149
    iget-wide v0, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_chunkSize:J

    long-to-int v0, v0

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_buffer:[B

    goto :goto_0
.end method

.method public setContentType(Ljava/lang/String;)V
    .locals 0
    .param p1, "ct"    # Ljava/lang/String;

    .prologue
    .line 138
    iput-object p1, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_contentType:Ljava/lang/String;

    .line 139
    return-void
.end method

.method public setFilename(Ljava/lang/String;)V
    .locals 0
    .param p1, "fn"    # Ljava/lang/String;

    .prologue
    .line 128
    iput-object p1, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_filename:Ljava/lang/String;

    .line 129
    return-void
.end method

.method public setId(Ljava/lang/Object;)V
    .locals 0
    .param p1, "id"    # Ljava/lang/Object;

    .prologue
    .line 118
    iput-object p1, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_id:Ljava/lang/Object;

    .line 119
    return-void
.end method
