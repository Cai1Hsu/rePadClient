.class Lorg/apache/commons/compress/archivers/tar/TarBuffer;
.super Ljava/lang/Object;
.source "TarBuffer.java"


# static fields
.field public static final DEFAULT_BLKSIZE:I = 0x2800

.field public static final DEFAULT_RCDSIZE:I = 0x200


# instance fields
.field private final blockBuffer:[B

.field private final blockSize:I

.field private currBlkIdx:I

.field private currRecIdx:I

.field private inStream:Ljava/io/InputStream;

.field private outStream:Ljava/io/OutputStream;

.field private final recordSize:I

.field private final recsPerBlock:I


# direct methods
.method public constructor <init>(Ljava/io/InputStream;)V
    .locals 1
    .param p1, "inStream"    # Ljava/io/InputStream;

    .prologue
    .line 63
    const/16 v0, 0x2800

    invoke-direct {p0, p1, v0}, Lorg/apache/commons/compress/archivers/tar/TarBuffer;-><init>(Ljava/io/InputStream;I)V

    .line 64
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;I)V
    .locals 1
    .param p1, "inStream"    # Ljava/io/InputStream;
    .param p2, "blockSize"    # I

    .prologue
    .line 72
    const/16 v0, 0x200

    invoke-direct {p0, p1, p2, v0}, Lorg/apache/commons/compress/archivers/tar/TarBuffer;-><init>(Ljava/io/InputStream;II)V

    .line 73
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;II)V
    .locals 1
    .param p1, "inStream"    # Ljava/io/InputStream;
    .param p2, "blockSize"    # I
    .param p3, "recordSize"    # I

    .prologue
    .line 82
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, p2, p3}, Lorg/apache/commons/compress/archivers/tar/TarBuffer;-><init>(Ljava/io/InputStream;Ljava/io/OutputStream;II)V

    .line 83
    return-void
.end method

.method private constructor <init>(Ljava/io/InputStream;Ljava/io/OutputStream;II)V
    .locals 3
    .param p1, "inStream"    # Ljava/io/InputStream;
    .param p2, "outStream"    # Ljava/io/OutputStream;
    .param p3, "blockSize"    # I
    .param p4, "recordSize"    # I

    .prologue
    const/4 v2, 0x0

    .line 115
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 116
    iput-object p1, p0, Lorg/apache/commons/compress/archivers/tar/TarBuffer;->inStream:Ljava/io/InputStream;

    .line 117
    iput-object p2, p0, Lorg/apache/commons/compress/archivers/tar/TarBuffer;->outStream:Ljava/io/OutputStream;

    .line 118
    iput p3, p0, Lorg/apache/commons/compress/archivers/tar/TarBuffer;->blockSize:I

    .line 119
    iput p4, p0, Lorg/apache/commons/compress/archivers/tar/TarBuffer;->recordSize:I

    .line 120
    iget v0, p0, Lorg/apache/commons/compress/archivers/tar/TarBuffer;->blockSize:I

    iget v1, p0, Lorg/apache/commons/compress/archivers/tar/TarBuffer;->recordSize:I

    div-int/2addr v0, v1

    iput v0, p0, Lorg/apache/commons/compress/archivers/tar/TarBuffer;->recsPerBlock:I

    .line 121
    iget v0, p0, Lorg/apache/commons/compress/archivers/tar/TarBuffer;->blockSize:I

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/tar/TarBuffer;->blockBuffer:[B

    .line 123
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/tar/TarBuffer;->inStream:Ljava/io/InputStream;

    if-eqz v0, :cond_0

    .line 124
    const/4 v0, -0x1

    iput v0, p0, Lorg/apache/commons/compress/archivers/tar/TarBuffer;->currBlkIdx:I

    .line 125
    iget v0, p0, Lorg/apache/commons/compress/archivers/tar/TarBuffer;->recsPerBlock:I

    iput v0, p0, Lorg/apache/commons/compress/archivers/tar/TarBuffer;->currRecIdx:I

    .line 130
    :goto_0
    return-void

    .line 127
    :cond_0
    iput v2, p0, Lorg/apache/commons/compress/archivers/tar/TarBuffer;->currBlkIdx:I

    .line 128
    iput v2, p0, Lorg/apache/commons/compress/archivers/tar/TarBuffer;->currRecIdx:I

    goto :goto_0
.end method

.method public constructor <init>(Ljava/io/OutputStream;)V
    .locals 1
    .param p1, "outStream"    # Ljava/io/OutputStream;

    .prologue
    .line 90
    const/16 v0, 0x2800

    invoke-direct {p0, p1, v0}, Lorg/apache/commons/compress/archivers/tar/TarBuffer;-><init>(Ljava/io/OutputStream;I)V

    .line 91
    return-void
.end method

.method public constructor <init>(Ljava/io/OutputStream;I)V
    .locals 1
    .param p1, "outStream"    # Ljava/io/OutputStream;
    .param p2, "blockSize"    # I

    .prologue
    .line 99
    const/16 v0, 0x200

    invoke-direct {p0, p1, p2, v0}, Lorg/apache/commons/compress/archivers/tar/TarBuffer;-><init>(Ljava/io/OutputStream;II)V

    .line 100
    return-void
.end method

.method public constructor <init>(Ljava/io/OutputStream;II)V
    .locals 1
    .param p1, "outStream"    # Ljava/io/OutputStream;
    .param p2, "blockSize"    # I
    .param p3, "recordSize"    # I

    .prologue
    .line 109
    const/4 v0, 0x0

    invoke-direct {p0, v0, p1, p2, p3}, Lorg/apache/commons/compress/archivers/tar/TarBuffer;-><init>(Ljava/io/InputStream;Ljava/io/OutputStream;II)V

    .line 110
    return-void
.end method

.method private readBlock()Z
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 214
    iget-object v5, p0, Lorg/apache/commons/compress/archivers/tar/TarBuffer;->inStream:Ljava/io/InputStream;

    if-nez v5, :cond_0

    .line 215
    new-instance v4, Ljava/io/IOException;

    const-string/jumbo v5, "reading from an output buffer"

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 218
    :cond_0
    iput v4, p0, Lorg/apache/commons/compress/archivers/tar/TarBuffer;->currRecIdx:I

    .line 220
    const/4 v1, 0x0

    .line 221
    .local v1, "offset":I
    iget v0, p0, Lorg/apache/commons/compress/archivers/tar/TarBuffer;->blockSize:I

    .line 223
    .local v0, "bytesNeeded":I
    :cond_1
    :goto_0
    if-lez v0, :cond_3

    .line 224
    iget-object v5, p0, Lorg/apache/commons/compress/archivers/tar/TarBuffer;->inStream:Ljava/io/InputStream;

    iget-object v6, p0, Lorg/apache/commons/compress/archivers/tar/TarBuffer;->blockBuffer:[B

    invoke-virtual {v5, v6, v1, v0}, Ljava/io/InputStream;->read([BII)I

    move-result v5

    int-to-long v2, v5

    .line 240
    .local v2, "numBytes":J
    const-wide/16 v6, -0x1

    cmp-long v5, v2, v6

    if-nez v5, :cond_4

    .line 241
    if-nez v1, :cond_2

    .line 268
    .end local v2    # "numBytes":J
    :goto_1
    return v4

    .line 253
    .restart local v2    # "numBytes":J
    :cond_2
    iget-object v5, p0, Lorg/apache/commons/compress/archivers/tar/TarBuffer;->blockBuffer:[B

    add-int v6, v1, v0

    invoke-static {v5, v1, v6, v4}, Ljava/util/Arrays;->fill([BIIB)V

    .line 266
    .end local v2    # "numBytes":J
    :cond_3
    iget v4, p0, Lorg/apache/commons/compress/archivers/tar/TarBuffer;->currBlkIdx:I

    add-int/lit8 v4, v4, 0x1

    iput v4, p0, Lorg/apache/commons/compress/archivers/tar/TarBuffer;->currBlkIdx:I

    .line 268
    const/4 v4, 0x1

    goto :goto_1

    .line 258
    .restart local v2    # "numBytes":J
    :cond_4
    int-to-long v6, v1

    add-long/2addr v6, v2

    long-to-int v1, v6

    .line 259
    int-to-long v6, v0

    sub-long/2addr v6, v2

    long-to-int v0, v6

    .line 261
    iget v5, p0, Lorg/apache/commons/compress/archivers/tar/TarBuffer;->blockSize:I

    int-to-long v6, v5

    cmp-long v5, v2, v6

    if-eqz v5, :cond_1

    goto :goto_0
.end method

.method private writeBlock()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 361
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/tar/TarBuffer;->outStream:Ljava/io/OutputStream;

    if-nez v0, :cond_0

    .line 362
    new-instance v0, Ljava/io/IOException;

    const-string/jumbo v1, "writing to an input buffer"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 365
    :cond_0
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/tar/TarBuffer;->outStream:Ljava/io/OutputStream;

    iget-object v1, p0, Lorg/apache/commons/compress/archivers/tar/TarBuffer;->blockBuffer:[B

    iget v2, p0, Lorg/apache/commons/compress/archivers/tar/TarBuffer;->blockSize:I

    invoke-virtual {v0, v1, v3, v2}, Ljava/io/OutputStream;->write([BII)V

    .line 366
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/tar/TarBuffer;->outStream:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V

    .line 368
    iput v3, p0, Lorg/apache/commons/compress/archivers/tar/TarBuffer;->currRecIdx:I

    .line 369
    iget v0, p0, Lorg/apache/commons/compress/archivers/tar/TarBuffer;->currBlkIdx:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/apache/commons/compress/archivers/tar/TarBuffer;->currBlkIdx:I

    .line 370
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/tar/TarBuffer;->blockBuffer:[B

    invoke-static {v0, v3}, Ljava/util/Arrays;->fill([BB)V

    .line 371
    return-void
.end method


# virtual methods
.method public close()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 392
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/tar/TarBuffer;->outStream:Ljava/io/OutputStream;

    if-eqz v0, :cond_1

    .line 393
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/tar/TarBuffer;->flushBlock()V

    .line 395
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/tar/TarBuffer;->outStream:Ljava/io/OutputStream;

    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lorg/apache/commons/compress/archivers/tar/TarBuffer;->outStream:Ljava/io/OutputStream;

    sget-object v1, Ljava/lang/System;->err:Ljava/io/PrintStream;

    if-eq v0, v1, :cond_0

    .line 397
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/tar/TarBuffer;->outStream:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V

    .line 399
    iput-object v2, p0, Lorg/apache/commons/compress/archivers/tar/TarBuffer;->outStream:Ljava/io/OutputStream;

    .line 407
    :cond_0
    :goto_0
    return-void

    .line 401
    :cond_1
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/tar/TarBuffer;->inStream:Ljava/io/InputStream;

    if-eqz v0, :cond_0

    .line 402
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/tar/TarBuffer;->inStream:Ljava/io/InputStream;

    sget-object v1, Ljava/lang/System;->in:Ljava/io/InputStream;

    if-eq v0, v1, :cond_2

    .line 403
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/tar/TarBuffer;->inStream:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 405
    :cond_2
    iput-object v2, p0, Lorg/apache/commons/compress/archivers/tar/TarBuffer;->inStream:Ljava/io/InputStream;

    goto :goto_0
.end method

.method flushBlock()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 377
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/tar/TarBuffer;->outStream:Ljava/io/OutputStream;

    if-nez v0, :cond_0

    .line 378
    new-instance v0, Ljava/io/IOException;

    const-string/jumbo v1, "writing to an input buffer"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 381
    :cond_0
    iget v0, p0, Lorg/apache/commons/compress/archivers/tar/TarBuffer;->currRecIdx:I

    if-lez v0, :cond_1

    .line 382
    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/tar/TarBuffer;->writeBlock()V

    .line 384
    :cond_1
    return-void
.end method

.method public getBlockSize()I
    .locals 1

    .prologue
    .line 137
    iget v0, p0, Lorg/apache/commons/compress/archivers/tar/TarBuffer;->blockSize:I

    return v0
.end method

.method public getCurrentBlockNum()I
    .locals 1

    .prologue
    .line 277
    iget v0, p0, Lorg/apache/commons/compress/archivers/tar/TarBuffer;->currBlkIdx:I

    return v0
.end method

.method public getCurrentRecordNum()I
    .locals 1

    .prologue
    .line 287
    iget v0, p0, Lorg/apache/commons/compress/archivers/tar/TarBuffer;->currRecIdx:I

    add-int/lit8 v0, v0, -0x1

    return v0
.end method

.method public getRecordSize()I
    .locals 1

    .prologue
    .line 145
    iget v0, p0, Lorg/apache/commons/compress/archivers/tar/TarBuffer;->recordSize:I

    return v0
.end method

.method public isEOFRecord([B)Z
    .locals 3
    .param p1, "record"    # [B

    .prologue
    .line 156
    const/4 v0, 0x0

    .local v0, "i":I
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/tar/TarBuffer;->getRecordSize()I

    move-result v1

    .local v1, "sz":I
    :goto_0
    if-ge v0, v1, :cond_1

    .line 157
    aget-byte v2, p1, v0

    if-eqz v2, :cond_0

    .line 158
    const/4 v2, 0x0

    .line 162
    :goto_1
    return v2

    .line 156
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 162
    :cond_1
    const/4 v2, 0x1

    goto :goto_1
.end method

.method public readRecord()[B
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 188
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/tar/TarBuffer;->inStream:Ljava/io/InputStream;

    if-nez v1, :cond_1

    .line 189
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/tar/TarBuffer;->outStream:Ljava/io/OutputStream;

    if-nez v1, :cond_0

    .line 190
    new-instance v1, Ljava/io/IOException;

    const-string/jumbo v2, "input buffer is closed"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 192
    :cond_0
    new-instance v1, Ljava/io/IOException;

    const-string/jumbo v2, "reading from an output buffer"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 195
    :cond_1
    iget v1, p0, Lorg/apache/commons/compress/archivers/tar/TarBuffer;->currRecIdx:I

    iget v2, p0, Lorg/apache/commons/compress/archivers/tar/TarBuffer;->recsPerBlock:I

    if-lt v1, v2, :cond_2

    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/tar/TarBuffer;->readBlock()Z

    move-result v1

    if-nez v1, :cond_2

    .line 196
    const/4 v0, 0x0

    .line 207
    :goto_0
    return-object v0

    .line 199
    :cond_2
    iget v1, p0, Lorg/apache/commons/compress/archivers/tar/TarBuffer;->recordSize:I

    new-array v0, v1, [B

    .line 201
    .local v0, "result":[B
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/tar/TarBuffer;->blockBuffer:[B

    iget v2, p0, Lorg/apache/commons/compress/archivers/tar/TarBuffer;->currRecIdx:I

    iget v3, p0, Lorg/apache/commons/compress/archivers/tar/TarBuffer;->recordSize:I

    mul-int/2addr v2, v3

    const/4 v3, 0x0

    iget v4, p0, Lorg/apache/commons/compress/archivers/tar/TarBuffer;->recordSize:I

    invoke-static {v1, v2, v0, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 205
    iget v1, p0, Lorg/apache/commons/compress/archivers/tar/TarBuffer;->currRecIdx:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lorg/apache/commons/compress/archivers/tar/TarBuffer;->currRecIdx:I

    goto :goto_0
.end method

.method public skipRecord()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 170
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/tar/TarBuffer;->inStream:Ljava/io/InputStream;

    if-nez v0, :cond_0

    .line 171
    new-instance v0, Ljava/io/IOException;

    const-string/jumbo v1, "reading (via skip) from an output buffer"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 174
    :cond_0
    iget v0, p0, Lorg/apache/commons/compress/archivers/tar/TarBuffer;->currRecIdx:I

    iget v1, p0, Lorg/apache/commons/compress/archivers/tar/TarBuffer;->recsPerBlock:I

    if-lt v0, v1, :cond_1

    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/tar/TarBuffer;->readBlock()Z

    move-result v0

    if-nez v0, :cond_1

    .line 179
    :goto_0
    return-void

    .line 178
    :cond_1
    iget v0, p0, Lorg/apache/commons/compress/archivers/tar/TarBuffer;->currRecIdx:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/apache/commons/compress/archivers/tar/TarBuffer;->currRecIdx:I

    goto :goto_0
.end method

.method public writeRecord([B)V
    .locals 4
    .param p1, "record"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 297
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/tar/TarBuffer;->outStream:Ljava/io/OutputStream;

    if-nez v0, :cond_1

    .line 298
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/tar/TarBuffer;->inStream:Ljava/io/InputStream;

    if-nez v0, :cond_0

    .line 299
    new-instance v0, Ljava/io/IOException;

    const-string/jumbo v1, "Output buffer is closed"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 301
    :cond_0
    new-instance v0, Ljava/io/IOException;

    const-string/jumbo v1, "writing to an input buffer"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 304
    :cond_1
    array-length v0, p1

    iget v1, p0, Lorg/apache/commons/compress/archivers/tar/TarBuffer;->recordSize:I

    if-eq v0, v1, :cond_2

    .line 305
    new-instance v0, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "record to write has length \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    array-length v2, p1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "\' which is not the record size of \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lorg/apache/commons/compress/archivers/tar/TarBuffer;->recordSize:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 311
    :cond_2
    iget v0, p0, Lorg/apache/commons/compress/archivers/tar/TarBuffer;->currRecIdx:I

    iget v1, p0, Lorg/apache/commons/compress/archivers/tar/TarBuffer;->recsPerBlock:I

    if-lt v0, v1, :cond_3

    .line 312
    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/tar/TarBuffer;->writeBlock()V

    .line 315
    :cond_3
    const/4 v0, 0x0

    iget-object v1, p0, Lorg/apache/commons/compress/archivers/tar/TarBuffer;->blockBuffer:[B

    iget v2, p0, Lorg/apache/commons/compress/archivers/tar/TarBuffer;->currRecIdx:I

    iget v3, p0, Lorg/apache/commons/compress/archivers/tar/TarBuffer;->recordSize:I

    mul-int/2addr v2, v3

    iget v3, p0, Lorg/apache/commons/compress/archivers/tar/TarBuffer;->recordSize:I

    invoke-static {p1, v0, v1, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 319
    iget v0, p0, Lorg/apache/commons/compress/archivers/tar/TarBuffer;->currRecIdx:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/apache/commons/compress/archivers/tar/TarBuffer;->currRecIdx:I

    .line 320
    return-void
.end method

.method public writeRecord([BI)V
    .locals 3
    .param p1, "buf"    # [B
    .param p2, "offset"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 332
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/tar/TarBuffer;->outStream:Ljava/io/OutputStream;

    if-nez v0, :cond_1

    .line 333
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/tar/TarBuffer;->inStream:Ljava/io/InputStream;

    if-nez v0, :cond_0

    .line 334
    new-instance v0, Ljava/io/IOException;

    const-string/jumbo v1, "Output buffer is closed"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 336
    :cond_0
    new-instance v0, Ljava/io/IOException;

    const-string/jumbo v1, "writing to an input buffer"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 339
    :cond_1
    iget v0, p0, Lorg/apache/commons/compress/archivers/tar/TarBuffer;->recordSize:I

    add-int/2addr v0, p2

    array-length v1, p1

    if-le v0, v1, :cond_2

    .line 340
    new-instance v0, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "record has length \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    array-length v2, p1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "\' with offset \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "\' which is less than the record size of \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lorg/apache/commons/compress/archivers/tar/TarBuffer;->recordSize:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 346
    :cond_2
    iget v0, p0, Lorg/apache/commons/compress/archivers/tar/TarBuffer;->currRecIdx:I

    iget v1, p0, Lorg/apache/commons/compress/archivers/tar/TarBuffer;->recsPerBlock:I

    if-lt v0, v1, :cond_3

    .line 347
    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/tar/TarBuffer;->writeBlock()V

    .line 350
    :cond_3
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/tar/TarBuffer;->blockBuffer:[B

    iget v1, p0, Lorg/apache/commons/compress/archivers/tar/TarBuffer;->currRecIdx:I

    iget v2, p0, Lorg/apache/commons/compress/archivers/tar/TarBuffer;->recordSize:I

    mul-int/2addr v1, v2

    iget v2, p0, Lorg/apache/commons/compress/archivers/tar/TarBuffer;->recordSize:I

    invoke-static {p1, p2, v0, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 354
    iget v0, p0, Lorg/apache/commons/compress/archivers/tar/TarBuffer;->currRecIdx:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/apache/commons/compress/archivers/tar/TarBuffer;->currRecIdx:I

    .line 355
    return-void
.end method
