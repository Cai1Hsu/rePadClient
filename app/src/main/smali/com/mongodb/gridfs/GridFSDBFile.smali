.class public Lcom/mongodb/gridfs/GridFSDBFile;
.super Lcom/mongodb/gridfs/GridFSFile;
.source "GridFSDBFile.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mongodb/gridfs/GridFSDBFile$MyInputStream;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 40
    invoke-direct {p0}, Lcom/mongodb/gridfs/GridFSFile;-><init>()V

    .line 108
    return-void
.end method


# virtual methods
.method getChunk(I)[B
    .locals 5
    .param p1, "i"    # I

    .prologue
    .line 97
    iget-object v1, p0, Lcom/mongodb/gridfs/GridFSDBFile;->_fs:Lcom/mongodb/gridfs/GridFS;

    if-nez v1, :cond_0

    .line 98
    new-instance v1, Ljava/lang/RuntimeException;

    const-string/jumbo v2, "no gridfs!"

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 100
    :cond_0
    iget-object v1, p0, Lcom/mongodb/gridfs/GridFSDBFile;->_fs:Lcom/mongodb/gridfs/GridFS;

    iget-object v1, v1, Lcom/mongodb/gridfs/GridFS;->_chunkCollection:Lcom/mongodb/DBCollection;

    const-string/jumbo v2, "files_id"

    iget-object v3, p0, Lcom/mongodb/gridfs/GridFSDBFile;->_id:Ljava/lang/Object;

    invoke-static {v2, v3}, Lcom/mongodb/BasicDBObjectBuilder;->start(Ljava/lang/String;Ljava/lang/Object;)Lcom/mongodb/BasicDBObjectBuilder;

    move-result-object v2

    const-string/jumbo v3, "n"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lcom/mongodb/BasicDBObjectBuilder;->add(Ljava/lang/String;Ljava/lang/Object;)Lcom/mongodb/BasicDBObjectBuilder;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mongodb/BasicDBObjectBuilder;->get()Lcom/mongodb/DBObject;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/mongodb/DBCollection;->findOne(Lcom/mongodb/DBObject;)Lcom/mongodb/DBObject;

    move-result-object v0

    .line 102
    .local v0, "chunk":Lcom/mongodb/DBObject;
    if-nez v0, :cond_1

    .line 103
    new-instance v1, Lcom/mongodb/MongoException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "can\'t find a chunk!  file id: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/mongodb/gridfs/GridFSDBFile;->_id:Ljava/lang/Object;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, " chunk: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/mongodb/MongoException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 105
    :cond_1
    const-string/jumbo v1, "data"

    invoke-interface {v0, v1}, Lcom/mongodb/DBObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [B

    check-cast v1, [B

    return-object v1
.end method

.method public getInputStream()Ljava/io/InputStream;
    .locals 1

    .prologue
    .line 48
    new-instance v0, Lcom/mongodb/gridfs/GridFSDBFile$MyInputStream;

    invoke-direct {v0, p0}, Lcom/mongodb/gridfs/GridFSDBFile$MyInputStream;-><init>(Lcom/mongodb/gridfs/GridFSDBFile;)V

    return-object v0
.end method

.method remove()V
    .locals 4

    .prologue
    .line 200
    iget-object v0, p0, Lcom/mongodb/gridfs/GridFSDBFile;->_fs:Lcom/mongodb/gridfs/GridFS;

    iget-object v0, v0, Lcom/mongodb/gridfs/GridFS;->_filesCollection:Lcom/mongodb/DBCollection;

    new-instance v1, Lcom/mongodb/BasicDBObject;

    const-string/jumbo v2, "_id"

    iget-object v3, p0, Lcom/mongodb/gridfs/GridFSDBFile;->_id:Ljava/lang/Object;

    invoke-direct {v1, v2, v3}, Lcom/mongodb/BasicDBObject;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Lcom/mongodb/DBCollection;->remove(Lcom/mongodb/DBObject;)Lcom/mongodb/WriteResult;

    .line 201
    iget-object v0, p0, Lcom/mongodb/gridfs/GridFSDBFile;->_fs:Lcom/mongodb/gridfs/GridFS;

    iget-object v0, v0, Lcom/mongodb/gridfs/GridFS;->_chunkCollection:Lcom/mongodb/DBCollection;

    new-instance v1, Lcom/mongodb/BasicDBObject;

    const-string/jumbo v2, "files_id"

    iget-object v3, p0, Lcom/mongodb/gridfs/GridFSDBFile;->_id:Ljava/lang/Object;

    invoke-direct {v1, v2, v3}, Lcom/mongodb/BasicDBObject;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Lcom/mongodb/DBCollection;->remove(Lcom/mongodb/DBObject;)Lcom/mongodb/WriteResult;

    .line 202
    return-void
.end method

.method public writeTo(Ljava/io/File;)J
    .locals 4
    .param p1, "f"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 70
    const/4 v0, 0x0

    .line 72
    .local v0, "out":Ljava/io/FileOutputStream;
    :try_start_0
    new-instance v1, Ljava/io/FileOutputStream;

    invoke-direct {v1, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 73
    .end local v0    # "out":Ljava/io/FileOutputStream;
    .local v1, "out":Ljava/io/FileOutputStream;
    :try_start_1
    invoke-virtual {p0, v1}, Lcom/mongodb/gridfs/GridFSDBFile;->writeTo(Ljava/io/OutputStream;)J
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-result-wide v2

    .line 75
    if-eqz v1, :cond_0

    .line 76
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V

    :cond_0
    return-wide v2

    .line 75
    .end local v1    # "out":Ljava/io/FileOutputStream;
    .restart local v0    # "out":Ljava/io/FileOutputStream;
    :catchall_0
    move-exception v2

    :goto_0
    if-eqz v0, :cond_1

    .line 76
    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V

    :cond_1
    throw v2

    .line 75
    .end local v0    # "out":Ljava/io/FileOutputStream;
    .restart local v1    # "out":Ljava/io/FileOutputStream;
    :catchall_1
    move-exception v2

    move-object v0, v1

    .end local v1    # "out":Ljava/io/FileOutputStream;
    .restart local v0    # "out":Ljava/io/FileOutputStream;
    goto :goto_0
.end method

.method public writeTo(Ljava/io/OutputStream;)J
    .locals 4
    .param p1, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 89
    invoke-virtual {p0}, Lcom/mongodb/gridfs/GridFSDBFile;->numChunks()I

    move-result v1

    .line 90
    .local v1, "nc":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, v1, :cond_0

    .line 91
    invoke-virtual {p0, v0}, Lcom/mongodb/gridfs/GridFSDBFile;->getChunk(I)[B

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/io/OutputStream;->write([B)V

    .line 90
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 93
    :cond_0
    iget-wide v2, p0, Lcom/mongodb/gridfs/GridFSDBFile;->_length:J

    return-wide v2
.end method

.method public writeTo(Ljava/lang/String;)J
    .locals 2
    .param p1, "filename"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 59
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/mongodb/gridfs/GridFSDBFile;->writeTo(Ljava/io/File;)J

    move-result-wide v0

    return-wide v0
.end method
