.class public Lorg/apache/tools/tar/TarBuffer;
.super Ljava/lang/Object;
.source "TarBuffer.java"


# static fields
.field public static final DEFAULT_BLKSIZE:I = 0x2800

.field public static final DEFAULT_RCDSIZE:I = 0x200


# instance fields
.field private blockBuffer:[B

.field private blockSize:I

.field private currBlkIdx:I

.field private currRecIdx:I

.field private debug:Z

.field private inStream:Ljava/io/InputStream;

.field private outStream:Ljava/io/OutputStream;

.field private recordSize:I

.field private recsPerBlock:I


# direct methods
.method public constructor <init>(Ljava/io/InputStream;)V
    .locals 1
    .param p1, "inStream"    # Ljava/io/InputStream;

    .prologue
    .line 67
    const/16 v0, 0x2800

    invoke-direct {p0, p1, v0}, Lorg/apache/tools/tar/TarBuffer;-><init>(Ljava/io/InputStream;I)V

    .line 68
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;I)V
    .locals 1
    .param p1, "inStream"    # Ljava/io/InputStream;
    .param p2, "blockSize"    # I

    .prologue
    .line 76
    const/16 v0, 0x200

    invoke-direct {p0, p1, p2, v0}, Lorg/apache/tools/tar/TarBuffer;-><init>(Ljava/io/InputStream;II)V

    .line 77
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;II)V
    .locals 1
    .param p1, "inStream"    # Ljava/io/InputStream;
    .param p2, "blockSize"    # I
    .param p3, "recordSize"    # I

    .prologue
    .line 85
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 86
    iput-object p1, p0, Lorg/apache/tools/tar/TarBuffer;->inStream:Ljava/io/InputStream;

    .line 87
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/tar/TarBuffer;->outStream:Ljava/io/OutputStream;

    .line 89
    invoke-direct {p0, p2, p3}, Lorg/apache/tools/tar/TarBuffer;->initialize(II)V

    .line 90
    return-void
.end method

.method public constructor <init>(Ljava/io/OutputStream;)V
    .locals 1
    .param p1, "outStream"    # Ljava/io/OutputStream;

    .prologue
    .line 97
    const/16 v0, 0x2800

    invoke-direct {p0, p1, v0}, Lorg/apache/tools/tar/TarBuffer;-><init>(Ljava/io/OutputStream;I)V

    .line 98
    return-void
.end method

.method public constructor <init>(Ljava/io/OutputStream;I)V
    .locals 1
    .param p1, "outStream"    # Ljava/io/OutputStream;
    .param p2, "blockSize"    # I

    .prologue
    .line 106
    const/16 v0, 0x200

    invoke-direct {p0, p1, p2, v0}, Lorg/apache/tools/tar/TarBuffer;-><init>(Ljava/io/OutputStream;II)V

    .line 107
    return-void
.end method

.method public constructor <init>(Ljava/io/OutputStream;II)V
    .locals 1
    .param p1, "outStream"    # Ljava/io/OutputStream;
    .param p2, "blockSize"    # I
    .param p3, "recordSize"    # I

    .prologue
    .line 115
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 116
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/tar/TarBuffer;->inStream:Ljava/io/InputStream;

    .line 117
    iput-object p1, p0, Lorg/apache/tools/tar/TarBuffer;->outStream:Ljava/io/OutputStream;

    .line 119
    invoke-direct {p0, p2, p3}, Lorg/apache/tools/tar/TarBuffer;->initialize(II)V

    .line 120
    return-void
.end method

.method private initialize(II)V
    .locals 3
    .param p1, "blockSize"    # I
    .param p2, "recordSize"    # I

    .prologue
    const/4 v2, 0x0

    .line 126
    iput-boolean v2, p0, Lorg/apache/tools/tar/TarBuffer;->debug:Z

    .line 127
    iput p1, p0, Lorg/apache/tools/tar/TarBuffer;->blockSize:I

    .line 128
    iput p2, p0, Lorg/apache/tools/tar/TarBuffer;->recordSize:I

    .line 129
    iget v0, p0, Lorg/apache/tools/tar/TarBuffer;->blockSize:I

    iget v1, p0, Lorg/apache/tools/tar/TarBuffer;->recordSize:I

    div-int/2addr v0, v1

    iput v0, p0, Lorg/apache/tools/tar/TarBuffer;->recsPerBlock:I

    .line 130
    iget v0, p0, Lorg/apache/tools/tar/TarBuffer;->blockSize:I

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/apache/tools/tar/TarBuffer;->blockBuffer:[B

    .line 132
    iget-object v0, p0, Lorg/apache/tools/tar/TarBuffer;->inStream:Ljava/io/InputStream;

    if-eqz v0, :cond_0

    .line 133
    const/4 v0, -0x1

    iput v0, p0, Lorg/apache/tools/tar/TarBuffer;->currBlkIdx:I

    .line 134
    iget v0, p0, Lorg/apache/tools/tar/TarBuffer;->recsPerBlock:I

    iput v0, p0, Lorg/apache/tools/tar/TarBuffer;->currRecIdx:I

    .line 139
    :goto_0
    return-void

    .line 136
    :cond_0
    iput v2, p0, Lorg/apache/tools/tar/TarBuffer;->currBlkIdx:I

    .line 137
    iput v2, p0, Lorg/apache/tools/tar/TarBuffer;->currRecIdx:I

    goto :goto_0
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

    .line 243
    iget-boolean v5, p0, Lorg/apache/tools/tar/TarBuffer;->debug:Z

    if-eqz v5, :cond_0

    .line 244
    sget-object v5, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v7, "ReadBlock: blkIdx = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    iget v7, p0, Lorg/apache/tools/tar/TarBuffer;->currBlkIdx:I

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 247
    :cond_0
    iget-object v5, p0, Lorg/apache/tools/tar/TarBuffer;->inStream:Ljava/io/InputStream;

    if-nez v5, :cond_1

    .line 248
    new-instance v4, Ljava/io/IOException;

    const-string/jumbo v5, "reading from an output buffer"

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 251
    :cond_1
    iput v4, p0, Lorg/apache/tools/tar/TarBuffer;->currRecIdx:I

    .line 253
    const/4 v1, 0x0

    .line 254
    .local v1, "offset":I
    iget v0, p0, Lorg/apache/tools/tar/TarBuffer;->blockSize:I

    .line 256
    .local v0, "bytesNeeded":I
    :cond_2
    :goto_0
    if-lez v0, :cond_4

    .line 257
    iget-object v5, p0, Lorg/apache/tools/tar/TarBuffer;->inStream:Ljava/io/InputStream;

    iget-object v6, p0, Lorg/apache/tools/tar/TarBuffer;->blockBuffer:[B

    invoke-virtual {v5, v6, v1, v0}, Ljava/io/InputStream;->read([BII)I

    move-result v5

    int-to-long v2, v5

    .line 273
    .local v2, "numBytes":J
    const-wide/16 v6, -0x1

    cmp-long v5, v2, v6

    if-nez v5, :cond_5

    .line 274
    if-nez v1, :cond_3

    .line 305
    .end local v2    # "numBytes":J
    :goto_1
    return v4

    .line 286
    .restart local v2    # "numBytes":J
    :cond_3
    iget-object v5, p0, Lorg/apache/tools/tar/TarBuffer;->blockBuffer:[B

    add-int v6, v1, v0

    invoke-static {v5, v1, v6, v4}, Ljava/util/Arrays;->fill([BIIB)V

    .line 303
    .end local v2    # "numBytes":J
    :cond_4
    iget v4, p0, Lorg/apache/tools/tar/TarBuffer;->currBlkIdx:I

    add-int/lit8 v4, v4, 0x1

    iput v4, p0, Lorg/apache/tools/tar/TarBuffer;->currBlkIdx:I

    .line 305
    const/4 v4, 0x1

    goto :goto_1

    .line 291
    .restart local v2    # "numBytes":J
    :cond_5
    int-to-long v6, v1

    add-long/2addr v6, v2

    long-to-int v1, v6

    .line 292
    int-to-long v6, v0

    sub-long/2addr v6, v2

    long-to-int v0, v6

    .line 294
    iget v5, p0, Lorg/apache/tools/tar/TarBuffer;->blockSize:I

    int-to-long v6, v5

    cmp-long v5, v2, v6

    if-eqz v5, :cond_2

    .line 295
    iget-boolean v5, p0, Lorg/apache/tools/tar/TarBuffer;->debug:Z

    if-eqz v5, :cond_2

    .line 296
    sget-object v5, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v7, "ReadBlock: INCOMPLETE READ "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, v2, v3}, Ljava/lang/StringBuffer;->append(J)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string/jumbo v7, " of "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    iget v7, p0, Lorg/apache/tools/tar/TarBuffer;->blockSize:I

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string/jumbo v7, " bytes read."

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

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

    .line 402
    iget-boolean v0, p0, Lorg/apache/tools/tar/TarBuffer;->debug:Z

    if-eqz v0, :cond_0

    .line 403
    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "WriteBlock: blkIdx = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget v2, p0, Lorg/apache/tools/tar/TarBuffer;->currBlkIdx:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 406
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/tar/TarBuffer;->outStream:Ljava/io/OutputStream;

    if-nez v0, :cond_1

    .line 407
    new-instance v0, Ljava/io/IOException;

    const-string/jumbo v1, "writing to an input buffer"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 410
    :cond_1
    iget-object v0, p0, Lorg/apache/tools/tar/TarBuffer;->outStream:Ljava/io/OutputStream;

    iget-object v1, p0, Lorg/apache/tools/tar/TarBuffer;->blockBuffer:[B

    iget v2, p0, Lorg/apache/tools/tar/TarBuffer;->blockSize:I

    invoke-virtual {v0, v1, v3, v2}, Ljava/io/OutputStream;->write([BII)V

    .line 411
    iget-object v0, p0, Lorg/apache/tools/tar/TarBuffer;->outStream:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V

    .line 413
    iput v3, p0, Lorg/apache/tools/tar/TarBuffer;->currRecIdx:I

    .line 414
    iget v0, p0, Lorg/apache/tools/tar/TarBuffer;->currBlkIdx:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/apache/tools/tar/TarBuffer;->currBlkIdx:I

    .line 415
    iget-object v0, p0, Lorg/apache/tools/tar/TarBuffer;->blockBuffer:[B

    invoke-static {v0, v3}, Ljava/util/Arrays;->fill([BB)V

    .line 416
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

    .line 441
    iget-boolean v0, p0, Lorg/apache/tools/tar/TarBuffer;->debug:Z

    if-eqz v0, :cond_0

    .line 442
    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string/jumbo v1, "TarBuffer.closeBuffer()."

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 445
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/tar/TarBuffer;->outStream:Ljava/io/OutputStream;

    if-eqz v0, :cond_2

    .line 446
    invoke-virtual {p0}, Lorg/apache/tools/tar/TarBuffer;->flushBlock()V

    .line 448
    iget-object v0, p0, Lorg/apache/tools/tar/TarBuffer;->outStream:Ljava/io/OutputStream;

    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    if-eq v0, v1, :cond_1

    iget-object v0, p0, Lorg/apache/tools/tar/TarBuffer;->outStream:Ljava/io/OutputStream;

    sget-object v1, Ljava/lang/System;->err:Ljava/io/PrintStream;

    if-eq v0, v1, :cond_1

    .line 450
    iget-object v0, p0, Lorg/apache/tools/tar/TarBuffer;->outStream:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V

    .line 452
    iput-object v2, p0, Lorg/apache/tools/tar/TarBuffer;->outStream:Ljava/io/OutputStream;

    .line 461
    :cond_1
    :goto_0
    return-void

    .line 454
    :cond_2
    iget-object v0, p0, Lorg/apache/tools/tar/TarBuffer;->inStream:Ljava/io/InputStream;

    if-eqz v0, :cond_1

    .line 455
    iget-object v0, p0, Lorg/apache/tools/tar/TarBuffer;->inStream:Ljava/io/InputStream;

    sget-object v1, Ljava/lang/System;->in:Ljava/io/InputStream;

    if-eq v0, v1, :cond_1

    .line 456
    iget-object v0, p0, Lorg/apache/tools/tar/TarBuffer;->inStream:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 458
    iput-object v2, p0, Lorg/apache/tools/tar/TarBuffer;->inStream:Ljava/io/InputStream;

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
    .line 422
    iget-boolean v0, p0, Lorg/apache/tools/tar/TarBuffer;->debug:Z

    if-eqz v0, :cond_0

    .line 423
    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string/jumbo v1, "TarBuffer.flushBlock() called."

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 426
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/tar/TarBuffer;->outStream:Ljava/io/OutputStream;

    if-nez v0, :cond_1

    .line 427
    new-instance v0, Ljava/io/IOException;

    const-string/jumbo v1, "writing to an input buffer"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 430
    :cond_1
    iget v0, p0, Lorg/apache/tools/tar/TarBuffer;->currRecIdx:I

    if-lez v0, :cond_2

    .line 431
    invoke-direct {p0}, Lorg/apache/tools/tar/TarBuffer;->writeBlock()V

    .line 433
    :cond_2
    return-void
.end method

.method public getBlockSize()I
    .locals 1

    .prologue
    .line 146
    iget v0, p0, Lorg/apache/tools/tar/TarBuffer;->blockSize:I

    return v0
.end method

.method public getCurrentBlockNum()I
    .locals 1

    .prologue
    .line 314
    iget v0, p0, Lorg/apache/tools/tar/TarBuffer;->currBlkIdx:I

    return v0
.end method

.method public getCurrentRecordNum()I
    .locals 1

    .prologue
    .line 324
    iget v0, p0, Lorg/apache/tools/tar/TarBuffer;->currRecIdx:I

    add-int/lit8 v0, v0, -0x1

    return v0
.end method

.method public getRecordSize()I
    .locals 1

    .prologue
    .line 154
    iget v0, p0, Lorg/apache/tools/tar/TarBuffer;->recordSize:I

    return v0
.end method

.method public isEOFRecord([B)Z
    .locals 3
    .param p1, "record"    # [B

    .prologue
    .line 174
    const/4 v0, 0x0

    .local v0, "i":I
    invoke-virtual {p0}, Lorg/apache/tools/tar/TarBuffer;->getRecordSize()I

    move-result v1

    .local v1, "sz":I
    :goto_0
    if-ge v0, v1, :cond_1

    .line 175
    aget-byte v2, p1, v0

    if-eqz v2, :cond_0

    .line 176
    const/4 v2, 0x0

    .line 180
    :goto_1
    return v2

    .line 174
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 180
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
    .line 213
    iget-boolean v1, p0, Lorg/apache/tools/tar/TarBuffer;->debug:Z

    if-eqz v1, :cond_0

    .line 214
    sget-object v1, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "ReadRecord: recIdx = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget v3, p0, Lorg/apache/tools/tar/TarBuffer;->currRecIdx:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, " blkIdx = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget v3, p0, Lorg/apache/tools/tar/TarBuffer;->currBlkIdx:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 218
    :cond_0
    iget-object v1, p0, Lorg/apache/tools/tar/TarBuffer;->inStream:Ljava/io/InputStream;

    if-nez v1, :cond_1

    .line 219
    new-instance v1, Ljava/io/IOException;

    const-string/jumbo v2, "reading from an output buffer"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 222
    :cond_1
    iget v1, p0, Lorg/apache/tools/tar/TarBuffer;->currRecIdx:I

    iget v2, p0, Lorg/apache/tools/tar/TarBuffer;->recsPerBlock:I

    if-lt v1, v2, :cond_2

    .line 223
    invoke-direct {p0}, Lorg/apache/tools/tar/TarBuffer;->readBlock()Z

    move-result v1

    if-nez v1, :cond_2

    .line 224
    const/4 v0, 0x0

    .line 236
    :goto_0
    return-object v0

    .line 228
    :cond_2
    iget v1, p0, Lorg/apache/tools/tar/TarBuffer;->recordSize:I

    new-array v0, v1, [B

    .line 230
    .local v0, "result":[B
    iget-object v1, p0, Lorg/apache/tools/tar/TarBuffer;->blockBuffer:[B

    iget v2, p0, Lorg/apache/tools/tar/TarBuffer;->currRecIdx:I

    iget v3, p0, Lorg/apache/tools/tar/TarBuffer;->recordSize:I

    mul-int/2addr v2, v3

    const/4 v3, 0x0

    iget v4, p0, Lorg/apache/tools/tar/TarBuffer;->recordSize:I

    invoke-static {v1, v2, v0, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 234
    iget v1, p0, Lorg/apache/tools/tar/TarBuffer;->currRecIdx:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lorg/apache/tools/tar/TarBuffer;->currRecIdx:I

    goto :goto_0
.end method

.method public setDebug(Z)V
    .locals 0
    .param p1, "debug"    # Z

    .prologue
    .line 163
    iput-boolean p1, p0, Lorg/apache/tools/tar/TarBuffer;->debug:Z

    .line 164
    return-void
.end method

.method public skipRecord()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 188
    iget-boolean v0, p0, Lorg/apache/tools/tar/TarBuffer;->debug:Z

    if-eqz v0, :cond_0

    .line 189
    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "SkipRecord: recIdx = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget v2, p0, Lorg/apache/tools/tar/TarBuffer;->currRecIdx:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, " blkIdx = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget v2, p0, Lorg/apache/tools/tar/TarBuffer;->currBlkIdx:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 193
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/tar/TarBuffer;->inStream:Ljava/io/InputStream;

    if-nez v0, :cond_1

    .line 194
    new-instance v0, Ljava/io/IOException;

    const-string/jumbo v1, "reading (via skip) from an output buffer"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 197
    :cond_1
    iget v0, p0, Lorg/apache/tools/tar/TarBuffer;->currRecIdx:I

    iget v1, p0, Lorg/apache/tools/tar/TarBuffer;->recsPerBlock:I

    if-lt v0, v1, :cond_2

    .line 198
    invoke-direct {p0}, Lorg/apache/tools/tar/TarBuffer;->readBlock()Z

    move-result v0

    if-nez v0, :cond_2

    .line 204
    :goto_0
    return-void

    .line 203
    :cond_2
    iget v0, p0, Lorg/apache/tools/tar/TarBuffer;->currRecIdx:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/apache/tools/tar/TarBuffer;->currRecIdx:I

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
    .line 334
    iget-boolean v0, p0, Lorg/apache/tools/tar/TarBuffer;->debug:Z

    if-eqz v0, :cond_0

    .line 335
    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "WriteRecord: recIdx = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget v2, p0, Lorg/apache/tools/tar/TarBuffer;->currRecIdx:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, " blkIdx = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget v2, p0, Lorg/apache/tools/tar/TarBuffer;->currBlkIdx:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 339
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/tar/TarBuffer;->outStream:Ljava/io/OutputStream;

    if-nez v0, :cond_1

    .line 340
    new-instance v0, Ljava/io/IOException;

    const-string/jumbo v1, "writing to an input buffer"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 343
    :cond_1
    array-length v0, p1

    iget v1, p0, Lorg/apache/tools/tar/TarBuffer;->recordSize:I

    if-eq v0, v1, :cond_2

    .line 344
    new-instance v0, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "record to write has length \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    array-length v2, p1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, "\' which is not the record size of \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget v2, p0, Lorg/apache/tools/tar/TarBuffer;->recordSize:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, "\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 350
    :cond_2
    iget v0, p0, Lorg/apache/tools/tar/TarBuffer;->currRecIdx:I

    iget v1, p0, Lorg/apache/tools/tar/TarBuffer;->recsPerBlock:I

    if-lt v0, v1, :cond_3

    .line 351
    invoke-direct {p0}, Lorg/apache/tools/tar/TarBuffer;->writeBlock()V

    .line 354
    :cond_3
    const/4 v0, 0x0

    iget-object v1, p0, Lorg/apache/tools/tar/TarBuffer;->blockBuffer:[B

    iget v2, p0, Lorg/apache/tools/tar/TarBuffer;->currRecIdx:I

    iget v3, p0, Lorg/apache/tools/tar/TarBuffer;->recordSize:I

    mul-int/2addr v2, v3

    iget v3, p0, Lorg/apache/tools/tar/TarBuffer;->recordSize:I

    invoke-static {p1, v0, v1, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 358
    iget v0, p0, Lorg/apache/tools/tar/TarBuffer;->currRecIdx:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/apache/tools/tar/TarBuffer;->currRecIdx:I

    .line 359
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
    .line 371
    iget-boolean v0, p0, Lorg/apache/tools/tar/TarBuffer;->debug:Z

    if-eqz v0, :cond_0

    .line 372
    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "WriteRecord: recIdx = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget v2, p0, Lorg/apache/tools/tar/TarBuffer;->currRecIdx:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, " blkIdx = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget v2, p0, Lorg/apache/tools/tar/TarBuffer;->currBlkIdx:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 376
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/tar/TarBuffer;->outStream:Ljava/io/OutputStream;

    if-nez v0, :cond_1

    .line 377
    new-instance v0, Ljava/io/IOException;

    const-string/jumbo v1, "writing to an input buffer"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 380
    :cond_1
    iget v0, p0, Lorg/apache/tools/tar/TarBuffer;->recordSize:I

    add-int/2addr v0, p2

    array-length v1, p1

    if-le v0, v1, :cond_2

    .line 381
    new-instance v0, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "record has length \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    array-length v2, p1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, "\' with offset \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, "\' which is less than the record size of \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget v2, p0, Lorg/apache/tools/tar/TarBuffer;->recordSize:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, "\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 387
    :cond_2
    iget v0, p0, Lorg/apache/tools/tar/TarBuffer;->currRecIdx:I

    iget v1, p0, Lorg/apache/tools/tar/TarBuffer;->recsPerBlock:I

    if-lt v0, v1, :cond_3

    .line 388
    invoke-direct {p0}, Lorg/apache/tools/tar/TarBuffer;->writeBlock()V

    .line 391
    :cond_3
    iget-object v0, p0, Lorg/apache/tools/tar/TarBuffer;->blockBuffer:[B

    iget v1, p0, Lorg/apache/tools/tar/TarBuffer;->currRecIdx:I

    iget v2, p0, Lorg/apache/tools/tar/TarBuffer;->recordSize:I

    mul-int/2addr v1, v2

    iget v2, p0, Lorg/apache/tools/tar/TarBuffer;->recordSize:I

    invoke-static {p1, p2, v0, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 395
    iget v0, p0, Lorg/apache/tools/tar/TarBuffer;->currRecIdx:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/apache/tools/tar/TarBuffer;->currRecIdx:I

    .line 396
    return-void
.end method
