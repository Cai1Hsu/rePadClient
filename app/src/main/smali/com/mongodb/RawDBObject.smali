.class public Lcom/mongodb/RawDBObject;
.super Ljava/lang/Object;
.source "RawDBObject.java"

# interfaces
.implements Lcom/mongodb/DBObject;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mongodb/RawDBObject$ElementIter;,
        Lcom/mongodb/RawDBObject$Element;
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field private static final _cStrBuf:[B


# instance fields
.field final _buf:Ljava/nio/ByteBuffer;

.field final _end:I

.field final _offset:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 365
    const/16 v0, 0x400

    new-array v0, v0, [B

    sput-object v0, Lcom/mongodb/RawDBObject;->_cStrBuf:[B

    return-void
.end method

.method constructor <init>(Ljava/nio/ByteBuffer;)V
    .locals 1
    .param p1, "buf"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 63
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/mongodb/RawDBObject;-><init>(Ljava/nio/ByteBuffer;I)V

    .line 64
    return-void
.end method

.method constructor <init>(Ljava/nio/ByteBuffer;I)V
    .locals 2
    .param p1, "buf"    # Ljava/nio/ByteBuffer;
    .param p2, "offset"    # I

    .prologue
    .line 66
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 67
    iput-object p1, p0, Lcom/mongodb/RawDBObject;->_buf:Ljava/nio/ByteBuffer;

    .line 68
    iput p2, p0, Lcom/mongodb/RawDBObject;->_offset:I

    .line 69
    iget-object v0, p0, Lcom/mongodb/RawDBObject;->_buf:Ljava/nio/ByteBuffer;

    iget v1, p0, Lcom/mongodb/RawDBObject;->_offset:I

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->getInt(I)I

    move-result v0

    iput v0, p0, Lcom/mongodb/RawDBObject;->_end:I

    .line 70
    return-void
.end method


# virtual methods
.method _cStrLength(I)I
    .locals 2
    .param p1, "start"    # I

    .prologue
    .line 185
    move v0, p1

    .line 186
    .local v0, "end":I
    :goto_0
    iget-object v1, p0, Lcom/mongodb/RawDBObject;->_buf:Ljava/nio/ByteBuffer;

    invoke-virtual {v1, v0}, Ljava/nio/ByteBuffer;->get(I)B

    move-result v1

    if-eqz v1, :cond_0

    .line 187
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 188
    :cond_0
    sub-int v1, v0, p1

    add-int/lit8 v1, v1, 0x1

    return v1
.end method

.method _readCStr(I)Ljava/lang/String;
    .locals 1
    .param p1, "start"    # I

    .prologue
    .line 133
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/mongodb/RawDBObject;->_readCStr(I[I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method _readCStr(I[I)Ljava/lang/String;
    .locals 9
    .param p1, "start"    # I
    .param p2, "end"    # [I

    .prologue
    .line 137
    sget-object v5, Lcom/mongodb/RawDBObject;->_cStrBuf:[B

    monitor-enter v5

    .line 138
    const/4 v0, 0x0

    .line 139
    .local v0, "pos":I
    :cond_0
    :try_start_0
    iget-object v4, p0, Lcom/mongodb/RawDBObject;->_buf:Ljava/nio/ByteBuffer;

    add-int v6, v0, p1

    invoke-virtual {v4, v6}, Ljava/nio/ByteBuffer;->get(I)B

    move-result v4

    if-eqz v4, :cond_4

    .line 140
    sget-object v4, Lcom/mongodb/RawDBObject;->_cStrBuf:[B

    iget-object v6, p0, Lcom/mongodb/RawDBObject;->_buf:Ljava/nio/ByteBuffer;

    add-int v7, v0, p1

    invoke-virtual {v6, v7}, Ljava/nio/ByteBuffer;->get(I)B

    move-result v6

    aput-byte v6, v4, v0

    .line 141
    add-int/lit8 v0, v0, 0x1

    .line 142
    sget-object v4, Lcom/mongodb/RawDBObject;->_cStrBuf:[B

    array-length v4, v4

    if-lt v0, v4, :cond_1

    .line 143
    new-instance v4, Ljava/lang/IllegalArgumentException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "c string too big for RawDBObject.  so far["

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    new-instance v7, Ljava/lang/String;

    sget-object v8, Lcom/mongodb/RawDBObject;->_cStrBuf:[B

    invoke-direct {v7, v8}, Ljava/lang/String;-><init>([B)V

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, "]"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 160
    :catchall_0
    move-exception v4

    monitor-exit v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v4

    .line 145
    :cond_1
    add-int v4, v0, p1

    :try_start_1
    iget-object v6, p0, Lcom/mongodb/RawDBObject;->_buf:Ljava/nio/ByteBuffer;

    invoke-virtual {v6}, Ljava/nio/ByteBuffer;->limit()I

    move-result v6

    if-lt v4, v6, :cond_0

    .line 146
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 147
    .local v1, "sb":Ljava/lang/StringBuilder;
    const/4 v2, 0x0

    .local v2, "x":I
    :goto_0
    const/16 v4, 0xa

    if-ge v2, v4, :cond_2

    .line 148
    add-int v3, p1, v2

    .line 149
    .local v3, "y":I
    iget-object v4, p0, Lcom/mongodb/RawDBObject;->_buf:Ljava/nio/ByteBuffer;

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->limit()I

    move-result v4

    if-lt v3, v4, :cond_3

    .line 153
    .end local v3    # "y":I
    :cond_2
    new-instance v4, Ljava/lang/IllegalArgumentException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "can\'t find end of cstring.  start:"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, " pos: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, " ["

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, "]"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 151
    .restart local v3    # "y":I
    :cond_3
    iget-object v4, p0, Lcom/mongodb/RawDBObject;->_buf:Ljava/nio/ByteBuffer;

    invoke-virtual {v4, v3}, Ljava/nio/ByteBuffer;->get(I)B

    move-result v4

    int-to-char v4, v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 147
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 156
    .end local v1    # "sb":Ljava/lang/StringBuilder;
    .end local v2    # "x":I
    .end local v3    # "y":I
    :cond_4
    if-eqz p2, :cond_5

    array-length v4, p2

    if-lez v4, :cond_5

    .line 157
    const/4 v4, 0x0

    add-int v6, p1, v0

    aput v6, p2, v4

    .line 158
    :cond_5
    new-instance v4, Ljava/lang/String;

    sget-object v6, Lcom/mongodb/RawDBObject;->_cStrBuf:[B

    const/4 v7, 0x0

    invoke-direct {v4, v6, v7, v0}, Ljava/lang/String;-><init>([BII)V

    monitor-exit v5
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    return-object v4
.end method

.method _readJavaString(I)Ljava/lang/String;
    .locals 7
    .param p1, "start"    # I

    .prologue
    .line 164
    iget-object v4, p0, Lcom/mongodb/RawDBObject;->_buf:Ljava/nio/ByteBuffer;

    invoke-virtual {v4, p1}, Ljava/nio/ByteBuffer;->getInt(I)I

    move-result v4

    add-int/lit8 v2, v4, -0x1

    .line 166
    .local v2, "size":I
    new-array v0, v2, [B

    .line 168
    .local v0, "b":[B
    iget-object v4, p0, Lcom/mongodb/RawDBObject;->_buf:Ljava/nio/ByteBuffer;

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->position()I

    move-result v1

    .line 169
    .local v1, "old":I
    iget-object v4, p0, Lcom/mongodb/RawDBObject;->_buf:Ljava/nio/ByteBuffer;

    add-int/lit8 v5, p1, 0x4

    invoke-virtual {v4, v5}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 170
    iget-object v4, p0, Lcom/mongodb/RawDBObject;->_buf:Ljava/nio/ByteBuffer;

    const/4 v5, 0x0

    array-length v6, v0

    invoke-virtual {v4, v0, v5, v6}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 171
    iget-object v4, p0, Lcom/mongodb/RawDBObject;->_buf:Ljava/nio/ByteBuffer;

    invoke-virtual {v4, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 174
    :try_start_0
    new-instance v4, Ljava/lang/String;

    const-string/jumbo v5, "UTF-8"

    invoke-direct {v4, v0, v5}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 177
    :goto_0
    return-object v4

    .line 176
    :catch_0
    move-exception v3

    .line 177
    .local v3, "uee":Ljava/io/UnsupportedEncodingException;
    new-instance v4, Ljava/lang/String;

    invoke-direct {v4, v0}, Ljava/lang/String;-><init>([B)V

    goto :goto_0
.end method

.method public containsField(Ljava/lang/String;)Z
    .locals 1
    .param p1, "field"    # Ljava/lang/String;

    .prologue
    .line 115
    invoke-virtual {p0, p1}, Lcom/mongodb/RawDBObject;->findElement(Ljava/lang/String;)Lcom/mongodb/RawDBObject$Element;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public containsKey(Ljava/lang/String;)Z
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 111
    invoke-virtual {p0, p1}, Lcom/mongodb/RawDBObject;->containsField(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method findElement(Ljava/lang/String;)Lcom/mongodb/RawDBObject$Element;
    .locals 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 192
    new-instance v1, Lcom/mongodb/RawDBObject$ElementIter;

    invoke-direct {v1, p0}, Lcom/mongodb/RawDBObject$ElementIter;-><init>(Lcom/mongodb/RawDBObject;)V

    .line 193
    .local v1, "i":Lcom/mongodb/RawDBObject$ElementIter;
    :cond_0
    invoke-virtual {v1}, Lcom/mongodb/RawDBObject$ElementIter;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 194
    invoke-virtual {v1}, Lcom/mongodb/RawDBObject$ElementIter;->next()Lcom/mongodb/RawDBObject$Element;

    move-result-object v0

    .line 195
    .local v0, "e":Lcom/mongodb/RawDBObject$Element;
    invoke-virtual {v0}, Lcom/mongodb/RawDBObject$Element;->fieldName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 198
    .end local v0    # "e":Lcom/mongodb/RawDBObject$Element;
    :goto_0
    return-object v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public get(Ljava/lang/String;)Ljava/lang/Object;
    .locals 2
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 73
    invoke-virtual {p0, p1}, Lcom/mongodb/RawDBObject;->findElement(Ljava/lang/String;)Lcom/mongodb/RawDBObject$Element;

    move-result-object v0

    .line 74
    .local v0, "e":Lcom/mongodb/RawDBObject$Element;
    if-nez v0, :cond_0

    .line 75
    const/4 v1, 0x0

    .line 76
    :goto_0
    return-object v1

    :cond_0
    invoke-virtual {v0}, Lcom/mongodb/RawDBObject$Element;->getObject()Ljava/lang/Object;

    move-result-object v1

    goto :goto_0
.end method

.method public isPartialObject()Z
    .locals 1

    .prologue
    .line 202
    const/4 v0, 0x0

    return v0
.end method

.method public keySet()Ljava/util/Set;
    .locals 4
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
    .line 119
    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    .line 121
    .local v2, "keys":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    new-instance v1, Lcom/mongodb/RawDBObject$ElementIter;

    invoke-direct {v1, p0}, Lcom/mongodb/RawDBObject$ElementIter;-><init>(Lcom/mongodb/RawDBObject;)V

    .line 122
    .local v1, "i":Lcom/mongodb/RawDBObject$ElementIter;
    :goto_0
    invoke-virtual {v1}, Lcom/mongodb/RawDBObject$ElementIter;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 123
    invoke-virtual {v1}, Lcom/mongodb/RawDBObject$ElementIter;->next()Lcom/mongodb/RawDBObject$Element;

    move-result-object v0

    .line 124
    .local v0, "e":Lcom/mongodb/RawDBObject$Element;
    invoke-virtual {v0}, Lcom/mongodb/RawDBObject$Element;->eoo()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 129
    .end local v0    # "e":Lcom/mongodb/RawDBObject$Element;
    :cond_0
    return-object v2

    .line 126
    .restart local v0    # "e":Lcom/mongodb/RawDBObject$Element;
    :cond_1
    invoke-virtual {v0}, Lcom/mongodb/RawDBObject$Element;->fieldName()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method public markAsPartialObject()V
    .locals 2

    .prologue
    .line 207
    new-instance v0, Ljava/lang/RuntimeException;

    const-string/jumbo v1, "RawDBObject can\'t be a partial object"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "v"    # Ljava/lang/Object;

    .prologue
    .line 91
    new-instance v0, Ljava/lang/RuntimeException;

    const-string/jumbo v1, "read only"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public putAll(Ljava/util/Map;)V
    .locals 2
    .param p1, "m"    # Ljava/util/Map;

    .prologue
    .line 99
    new-instance v0, Ljava/lang/RuntimeException;

    const-string/jumbo v1, "read only"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public putAll(Lorg/bson/BSONObject;)V
    .locals 2
    .param p1, "o"    # Lorg/bson/BSONObject;

    .prologue
    .line 95
    new-instance v0, Ljava/lang/RuntimeException;

    const-string/jumbo v1, "read only"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public removeField(Ljava/lang/String;)Ljava/lang/Object;
    .locals 2
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 103
    new-instance v0, Ljava/lang/RuntimeException;

    const-string/jumbo v1, "read only"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public toMap()Ljava/util/Map;
    .locals 4

    .prologue
    .line 81
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 82
    .local v1, "m":Ljava/util/Map;
    invoke-virtual {p0}, Lcom/mongodb/RawDBObject;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 83
    .local v0, "i":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 84
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 85
    .local v2, "s":Ljava/lang/Object;
    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/mongodb/RawDBObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 87
    .end local v2    # "s":Ljava/lang/Object;
    :cond_0
    return-object v1
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 212
    const-string/jumbo v0, "Object"

    return-object v0
.end method
