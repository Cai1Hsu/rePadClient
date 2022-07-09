.class public abstract Lcom/mongodb/gridfs/GridFSFile;
.super Ljava/lang/Object;
.source "GridFSFile.java"

# interfaces
.implements Lcom/mongodb/DBObject;


# static fields
.field static final VALID_FIELDS:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field _aliases:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field _chunkSize:J

.field _contentType:Ljava/lang/String;

.field _extradata:Lcom/mongodb/DBObject;

.field _filename:Ljava/lang/String;

.field protected _fs:Lcom/mongodb/gridfs/GridFS;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field _id:Ljava/lang/Object;

.field _length:J

.field _md5:Ljava/lang/String;

.field _uploadDate:Ljava/util/Date;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    .line 312
    new-instance v0, Ljava/util/HashSet;

    const/16 v1, 0x8

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string/jumbo v3, "_id"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string/jumbo v3, "filename"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string/jumbo v3, "contentType"

    aput-object v3, v1, v2

    const/4 v2, 0x3

    const-string/jumbo v3, "length"

    aput-object v3, v1, v2

    const/4 v2, 0x4

    const-string/jumbo v3, "chunkSize"

    aput-object v3, v1, v2

    const/4 v2, 0x5

    const-string/jumbo v3, "uploadDate"

    aput-object v3, v1, v2

    const/4 v2, 0x6

    const-string/jumbo v3, "aliases"

    aput-object v3, v1, v2

    const/4 v2, 0x7

    const-string/jumbo v3, "md5"

    aput-object v3, v1, v2

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    sput-object v0, Lcom/mongodb/gridfs/GridFSFile;->VALID_FIELDS:Ljava/util/Set;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 298
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mongodb/gridfs/GridFSFile;->_fs:Lcom/mongodb/gridfs/GridFS;

    .line 308
    new-instance v0, Lcom/mongodb/BasicDBObject;

    invoke-direct {v0}, Lcom/mongodb/BasicDBObject;-><init>()V

    iput-object v0, p0, Lcom/mongodb/gridfs/GridFSFile;->_extradata:Lcom/mongodb/DBObject;

    return-void
.end method


# virtual methods
.method public containsField(Ljava/lang/String;)Z
    .locals 1
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 250
    invoke-virtual {p0}, Lcom/mongodb/gridfs/GridFSFile;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public containsKey(Ljava/lang/String;)Z
    .locals 1
    .param p1, "s"    # Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 246
    invoke-virtual {p0, p1}, Lcom/mongodb/gridfs/GridFSFile;->containsField(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public get(Ljava/lang/String;)Ljava/lang/Object;
    .locals 2
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 206
    if-nez p1, :cond_0

    .line 207
    new-instance v0, Ljava/lang/RuntimeException;

    const-string/jumbo v1, "key should never be null"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 208
    :cond_0
    const-string/jumbo v0, "_id"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 209
    iget-object v0, p0, Lcom/mongodb/gridfs/GridFSFile;->_id:Ljava/lang/Object;

    .line 222
    :goto_0
    return-object v0

    .line 210
    :cond_1
    const-string/jumbo v0, "filename"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 211
    iget-object v0, p0, Lcom/mongodb/gridfs/GridFSFile;->_filename:Ljava/lang/String;

    goto :goto_0

    .line 212
    :cond_2
    const-string/jumbo v0, "contentType"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 213
    iget-object v0, p0, Lcom/mongodb/gridfs/GridFSFile;->_contentType:Ljava/lang/String;

    goto :goto_0

    .line 214
    :cond_3
    const-string/jumbo v0, "length"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 215
    iget-wide v0, p0, Lcom/mongodb/gridfs/GridFSFile;->_length:J

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    goto :goto_0

    .line 216
    :cond_4
    const-string/jumbo v0, "chunkSize"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 217
    iget-wide v0, p0, Lcom/mongodb/gridfs/GridFSFile;->_chunkSize:J

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    goto :goto_0

    .line 218
    :cond_5
    const-string/jumbo v0, "uploadDate"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 219
    iget-object v0, p0, Lcom/mongodb/gridfs/GridFSFile;->_uploadDate:Ljava/util/Date;

    goto :goto_0

    .line 220
    :cond_6
    const-string/jumbo v0, "md5"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 221
    iget-object v0, p0, Lcom/mongodb/gridfs/GridFSFile;->_md5:Ljava/lang/String;

    goto :goto_0

    .line 222
    :cond_7
    iget-object v0, p0, Lcom/mongodb/gridfs/GridFSFile;->_extradata:Lcom/mongodb/DBObject;

    invoke-interface {v0, p1}, Lcom/mongodb/DBObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_0
.end method

.method public getAliases()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 152
    iget-object v0, p0, Lcom/mongodb/gridfs/GridFSFile;->_extradata:Lcom/mongodb/DBObject;

    const-string/jumbo v1, "aliases"

    invoke-interface {v0, v1}, Lcom/mongodb/DBObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    return-object v0
.end method

.method public getChunkSize()J
    .locals 2

    .prologue
    .line 134
    iget-wide v0, p0, Lcom/mongodb/gridfs/GridFSFile;->_chunkSize:J

    return-wide v0
.end method

.method public getContentType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 118
    iget-object v0, p0, Lcom/mongodb/gridfs/GridFSFile;->_contentType:Ljava/lang/String;

    return-object v0
.end method

.method public getFilename()Ljava/lang/String;
    .locals 1

    .prologue
    .line 110
    iget-object v0, p0, Lcom/mongodb/gridfs/GridFSFile;->_filename:Ljava/lang/String;

    return-object v0
.end method

.method protected getGridFS()Lcom/mongodb/gridfs/GridFS;
    .locals 1

    .prologue
    .line 284
    iget-object v0, p0, Lcom/mongodb/gridfs/GridFSFile;->_fs:Lcom/mongodb/gridfs/GridFS;

    return-object v0
.end method

.method public getId()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 102
    iget-object v0, p0, Lcom/mongodb/gridfs/GridFSFile;->_id:Ljava/lang/Object;

    return-object v0
.end method

.method public getLength()J
    .locals 2

    .prologue
    .line 126
    iget-wide v0, p0, Lcom/mongodb/gridfs/GridFSFile;->_length:J

    return-wide v0
.end method

.method public getMD5()Ljava/lang/String;
    .locals 1

    .prologue
    .line 176
    iget-object v0, p0, Lcom/mongodb/gridfs/GridFSFile;->_md5:Ljava/lang/String;

    return-object v0
.end method

.method public getMetaData()Lcom/mongodb/DBObject;
    .locals 2

    .prologue
    .line 160
    iget-object v0, p0, Lcom/mongodb/gridfs/GridFSFile;->_extradata:Lcom/mongodb/DBObject;

    const-string/jumbo v1, "metadata"

    invoke-interface {v0, v1}, Lcom/mongodb/DBObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mongodb/DBObject;

    return-object v0
.end method

.method public getUploadDate()Ljava/util/Date;
    .locals 1

    .prologue
    .line 142
    iget-object v0, p0, Lcom/mongodb/gridfs/GridFSFile;->_uploadDate:Ljava/util/Date;

    return-object v0
.end method

.method public isPartialObject()Z
    .locals 1

    .prologue
    .line 262
    const/4 v0, 0x0

    return v0
.end method

.method public keySet()Ljava/util/Set;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 255
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 256
    .local v0, "keys":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    sget-object v1, Lcom/mongodb/gridfs/GridFSFile;->VALID_FIELDS:Ljava/util/Set;

    invoke-interface {v0, v1}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 257
    iget-object v1, p0, Lcom/mongodb/gridfs/GridFSFile;->_extradata:Lcom/mongodb/DBObject;

    invoke-interface {v1}, Lcom/mongodb/DBObject;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 258
    return-object v0
.end method

.method public markAsPartialObject()V
    .locals 2

    .prologue
    .line 266
    new-instance v0, Ljava/lang/RuntimeException;

    const-string/jumbo v1, "can\'t load partial GridFSFile file"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public numChunks()I
    .locals 4

    .prologue
    .line 87
    iget-wide v2, p0, Lcom/mongodb/gridfs/GridFSFile;->_length:J

    long-to-double v0, v2

    .line 88
    .local v0, "d":D
    iget-wide v2, p0, Lcom/mongodb/gridfs/GridFSFile;->_chunkSize:J

    long-to-double v2, v2

    div-double/2addr v0, v2

    .line 89
    invoke-static {v0, v1}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v2

    double-to-int v2, v2

    return v2
.end method

.method public put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "v"    # Ljava/lang/Object;

    .prologue
    .line 184
    if-nez p1, :cond_0

    .line 185
    new-instance v0, Ljava/lang/RuntimeException;

    const-string/jumbo v1, "key should never be null"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 186
    :cond_0
    const-string/jumbo v0, "_id"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 187
    iput-object p2, p0, Lcom/mongodb/gridfs/GridFSFile;->_id:Ljava/lang/Object;

    .line 202
    :goto_0
    return-object p2

    .line 188
    :cond_1
    const-string/jumbo v0, "filename"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 189
    if-nez p2, :cond_2

    const/4 v0, 0x0

    :goto_1
    iput-object v0, p0, Lcom/mongodb/gridfs/GridFSFile;->_filename:Ljava/lang/String;

    goto :goto_0

    :cond_2
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    .line 190
    :cond_3
    const-string/jumbo v0, "contentType"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    move-object v0, p2

    .line 191
    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/mongodb/gridfs/GridFSFile;->_contentType:Ljava/lang/String;

    goto :goto_0

    .line 192
    :cond_4
    const-string/jumbo v0, "length"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    move-object v0, p2

    .line 193
    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->longValue()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/mongodb/gridfs/GridFSFile;->_length:J

    goto :goto_0

    .line 194
    :cond_5
    const-string/jumbo v0, "chunkSize"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    move-object v0, p2

    .line 195
    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->longValue()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/mongodb/gridfs/GridFSFile;->_chunkSize:J

    goto :goto_0

    .line 196
    :cond_6
    const-string/jumbo v0, "uploadDate"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    move-object v0, p2

    .line 197
    check-cast v0, Ljava/util/Date;

    iput-object v0, p0, Lcom/mongodb/gridfs/GridFSFile;->_uploadDate:Ljava/util/Date;

    goto :goto_0

    .line 198
    :cond_7
    const-string/jumbo v0, "md5"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_8

    move-object v0, p2

    .line 199
    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/mongodb/gridfs/GridFSFile;->_md5:Ljava/lang/String;

    goto :goto_0

    .line 201
    :cond_8
    iget-object v0, p0, Lcom/mongodb/gridfs/GridFSFile;->_extradata:Lcom/mongodb/DBObject;

    invoke-interface {v0, p1, p2}, Lcom/mongodb/DBObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method

.method public putAll(Ljava/util/Map;)V
    .locals 1
    .param p1, "m"    # Ljava/util/Map;

    .prologue
    .line 230
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public putAll(Lorg/bson/BSONObject;)V
    .locals 1
    .param p1, "o"    # Lorg/bson/BSONObject;

    .prologue
    .line 226
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public removeField(Ljava/lang/String;)Ljava/lang/Object;
    .locals 1
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 238
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public save()V
    .locals 2

    .prologue
    .line 51
    iget-object v0, p0, Lcom/mongodb/gridfs/GridFSFile;->_fs:Lcom/mongodb/gridfs/GridFS;

    if-nez v0, :cond_0

    .line 52
    new-instance v0, Lcom/mongodb/MongoException;

    const-string/jumbo v1, "need _fs"

    invoke-direct {v0, v1}, Lcom/mongodb/MongoException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 53
    :cond_0
    iget-object v0, p0, Lcom/mongodb/gridfs/GridFSFile;->_fs:Lcom/mongodb/gridfs/GridFS;

    iget-object v0, v0, Lcom/mongodb/gridfs/GridFS;->_filesCollection:Lcom/mongodb/DBCollection;

    invoke-virtual {v0, p0}, Lcom/mongodb/DBCollection;->save(Lcom/mongodb/DBObject;)Lcom/mongodb/WriteResult;

    .line 54
    return-void
.end method

.method protected setGridFS(Lcom/mongodb/gridfs/GridFS;)V
    .locals 0
    .param p1, "fs"    # Lcom/mongodb/gridfs/GridFS;

    .prologue
    .line 292
    iput-object p1, p0, Lcom/mongodb/gridfs/GridFSFile;->_fs:Lcom/mongodb/gridfs/GridFS;

    .line 293
    return-void
.end method

.method public setMetaData(Lcom/mongodb/DBObject;)V
    .locals 2
    .param p1, "metadata"    # Lcom/mongodb/DBObject;

    .prologue
    .line 168
    iget-object v0, p0, Lcom/mongodb/gridfs/GridFSFile;->_extradata:Lcom/mongodb/DBObject;

    const-string/jumbo v1, "metadata"

    invoke-interface {v0, v1, p1}, Lcom/mongodb/DBObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 169
    return-void
.end method

.method public toMap()Ljava/util/Map;
    .locals 1

    .prologue
    .line 234
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 275
    invoke-static {p0}, Lcom/mongodb/util/JSON;->serialize(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public validate()V
    .locals 6

    .prologue
    .line 62
    iget-object v3, p0, Lcom/mongodb/gridfs/GridFSFile;->_fs:Lcom/mongodb/gridfs/GridFS;

    if-nez v3, :cond_0

    .line 63
    new-instance v3, Lcom/mongodb/MongoException;

    const-string/jumbo v4, "no _fs"

    invoke-direct {v3, v4}, Lcom/mongodb/MongoException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 64
    :cond_0
    iget-object v3, p0, Lcom/mongodb/gridfs/GridFSFile;->_md5:Ljava/lang/String;

    if-nez v3, :cond_1

    .line 65
    new-instance v3, Lcom/mongodb/MongoException;

    const-string/jumbo v4, "no _md5 stored"

    invoke-direct {v3, v4}, Lcom/mongodb/MongoException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 67
    :cond_1
    new-instance v0, Lcom/mongodb/BasicDBObject;

    const-string/jumbo v3, "filemd5"

    iget-object v4, p0, Lcom/mongodb/gridfs/GridFSFile;->_id:Ljava/lang/Object;

    invoke-direct {v0, v3, v4}, Lcom/mongodb/BasicDBObject;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    .line 68
    .local v0, "cmd":Lcom/mongodb/DBObject;
    const-string/jumbo v3, "root"

    iget-object v4, p0, Lcom/mongodb/gridfs/GridFSFile;->_fs:Lcom/mongodb/gridfs/GridFS;

    iget-object v4, v4, Lcom/mongodb/gridfs/GridFS;->_bucketName:Ljava/lang/String;

    invoke-interface {v0, v3, v4}, Lcom/mongodb/DBObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 69
    iget-object v3, p0, Lcom/mongodb/gridfs/GridFSFile;->_fs:Lcom/mongodb/gridfs/GridFS;

    iget-object v3, v3, Lcom/mongodb/gridfs/GridFS;->_db:Lcom/mongodb/DB;

    invoke-virtual {v3, v0}, Lcom/mongodb/DB;->command(Lcom/mongodb/DBObject;)Lcom/mongodb/CommandResult;

    move-result-object v2

    .line 70
    .local v2, "res":Lcom/mongodb/DBObject;
    if-eqz v2, :cond_3

    const-string/jumbo v3, "md5"

    invoke-interface {v2, v3}, Lcom/mongodb/DBObject;->containsField(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 71
    const-string/jumbo v3, "md5"

    invoke-interface {v2, v3}, Lcom/mongodb/DBObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    .line 72
    .local v1, "m":Ljava/lang/String;
    iget-object v3, p0, Lcom/mongodb/gridfs/GridFSFile;->_md5:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 73
    return-void

    .line 74
    :cond_2
    new-instance v3, Lcom/mongodb/MongoException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "md5 differ.  mine ["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/mongodb/gridfs/GridFSFile;->_md5:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "] theirs ["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "]"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/mongodb/MongoException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 78
    .end local v1    # "m":Ljava/lang/String;
    :cond_3
    new-instance v3, Lcom/mongodb/MongoException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "no md5 returned from server: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/mongodb/MongoException;-><init>(Ljava/lang/String;)V

    throw v3
.end method
