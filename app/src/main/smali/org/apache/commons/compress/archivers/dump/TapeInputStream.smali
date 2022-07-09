.class Lorg/apache/commons/compress/archivers/dump/TapeInputStream;
.super Ljava/io/FilterInputStream;
.source "TapeInputStream.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/commons/compress/archivers/dump/TapeInputStream$1;
    }
.end annotation


# instance fields
.field private blockBuffer:[B

.field private blockSize:I

.field private bytesRead:J

.field private currBlkIdx:I

.field private isCompressed:Z

.field private readOffset:I

.field private recordSize:I


# direct methods
.method public constructor <init>(Ljava/io/InputStream;)V
    .locals 2
    .param p1, "in"    # Ljava/io/InputStream;

    .prologue
    const/16 v1, 0x400

    .line 49
    invoke-direct {p0, p1}, Ljava/io/FilterInputStream;-><init>(Ljava/io/InputStream;)V

    .line 37
    new-array v0, v1, [B

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->blockBuffer:[B

    .line 38
    const/4 v0, -0x1

    iput v0, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->currBlkIdx:I

    .line 39
    iput v1, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->blockSize:I

    .line 40
    iput v1, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->recordSize:I

    .line 41
    iput v1, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->readOffset:I

    .line 42
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->isCompressed:Z

    .line 43
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->bytesRead:J

    .line 50
    return-void
.end method

.method private readBlock(Z)Z
    .locals 14
    .param p1, "decompress"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x1

    const/4 v8, 0x0

    .line 255
    const/4 v7, 0x1

    .line 257
    .local v7, "success":Z
    iget-object v9, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->in:Ljava/io/InputStream;

    if-nez v9, :cond_0

    .line 258
    new-instance v8, Ljava/io/IOException;

    const-string/jumbo v9, "input buffer is closed"

    invoke-direct {v8, v9}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 261
    :cond_0
    iget-boolean v9, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->isCompressed:Z

    if-eqz v9, :cond_1

    iget v9, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->currBlkIdx:I

    const/4 v10, -0x1

    if-ne v9, v10, :cond_3

    .line 263
    :cond_1
    iget-object v9, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->blockBuffer:[B

    iget v10, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->blockSize:I

    invoke-direct {p0, v9, v8, v10}, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->readFully([BII)Z

    move-result v7

    .line 264
    iget-wide v10, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->bytesRead:J

    iget v9, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->blockSize:I

    int-to-long v12, v9

    add-long/2addr v10, v12

    iput-wide v10, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->bytesRead:J

    .line 325
    :goto_0
    iget v9, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->currBlkIdx:I

    add-int/lit8 v9, v9, 0x1

    iput v9, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->currBlkIdx:I

    .line 326
    iput v8, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->readOffset:I

    move v8, v7

    .line 328
    :cond_2
    return v8

    .line 266
    :cond_3
    iget-object v9, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->blockBuffer:[B

    const/4 v10, 0x4

    invoke-direct {p0, v9, v8, v10}, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->readFully([BII)Z

    move-result v9

    if-eqz v9, :cond_2

    .line 269
    iget-wide v10, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->bytesRead:J

    const-wide/16 v12, 0x4

    add-long/2addr v10, v12

    iput-wide v10, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->bytesRead:J

    .line 271
    iget-object v9, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->blockBuffer:[B

    invoke-static {v9, v8}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveUtil;->convert32([BI)I

    move-result v4

    .line 272
    .local v4, "h":I
    and-int/lit8 v9, v4, 0x1

    if-ne v9, v1, :cond_4

    .line 274
    .local v1, "compressed":Z
    :goto_1
    if-nez v1, :cond_5

    .line 276
    iget-object v9, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->blockBuffer:[B

    iget v10, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->blockSize:I

    invoke-direct {p0, v9, v8, v10}, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->readFully([BII)Z

    move-result v7

    .line 277
    iget-wide v10, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->bytesRead:J

    iget v9, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->blockSize:I

    int-to-long v12, v9

    add-long/2addr v10, v12

    iput-wide v10, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->bytesRead:J

    goto :goto_0

    .end local v1    # "compressed":Z
    :cond_4
    move v1, v8

    .line 272
    goto :goto_1

    .line 280
    .restart local v1    # "compressed":Z
    :cond_5
    shr-int/lit8 v9, v4, 0x1

    and-int/lit8 v3, v9, 0x7

    .line 281
    .local v3, "flags":I
    shr-int/lit8 v9, v4, 0x4

    const v10, 0xfffffff

    and-int v6, v9, v10

    .line 282
    .local v6, "length":I
    new-array v0, v6, [B

    .line 283
    .local v0, "compBuffer":[B
    invoke-direct {p0, v0, v8, v6}, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->readFully([BII)Z

    move-result v7

    .line 284
    iget-wide v10, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->bytesRead:J

    int-to-long v12, v6

    add-long/2addr v10, v12

    iput-wide v10, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->bytesRead:J

    .line 286
    if-nez p1, :cond_6

    .line 288
    iget-object v9, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->blockBuffer:[B

    invoke-static {v9, v8}, Ljava/util/Arrays;->fill([BB)V

    goto :goto_0

    .line 290
    :cond_6
    sget-object v9, Lorg/apache/commons/compress/archivers/dump/TapeInputStream$1;->$SwitchMap$org$apache$commons$compress$archivers$dump$DumpArchiveConstants$COMPRESSION_TYPE:[I

    and-int/lit8 v10, v3, 0x3

    invoke-static {v10}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveConstants$COMPRESSION_TYPE;->find(I)Lorg/apache/commons/compress/archivers/dump/DumpArchiveConstants$COMPRESSION_TYPE;

    move-result-object v10

    invoke-virtual {v10}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveConstants$COMPRESSION_TYPE;->ordinal()I

    move-result v10

    aget v9, v9, v10

    packed-switch v9, :pswitch_data_0

    .line 319
    new-instance v8, Lorg/apache/commons/compress/archivers/dump/UnsupportedCompressionAlgorithmException;

    invoke-direct {v8}, Lorg/apache/commons/compress/archivers/dump/UnsupportedCompressionAlgorithmException;-><init>()V

    throw v8

    .line 295
    :pswitch_0
    :try_start_0
    new-instance v5, Ljava/util/zip/Inflater;

    invoke-direct {v5}, Ljava/util/zip/Inflater;-><init>()V

    .line 296
    .local v5, "inflator":Ljava/util/zip/Inflater;
    const/4 v9, 0x0

    array-length v10, v0

    invoke-virtual {v5, v0, v9, v10}, Ljava/util/zip/Inflater;->setInput([BII)V

    .line 297
    iget-object v9, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->blockBuffer:[B

    invoke-virtual {v5, v9}, Ljava/util/zip/Inflater;->inflate([B)I

    move-result v6

    .line 299
    iget v9, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->blockSize:I

    if-eq v6, v9, :cond_7

    .line 300
    new-instance v8, Lorg/apache/commons/compress/archivers/dump/ShortFileException;

    invoke-direct {v8}, Lorg/apache/commons/compress/archivers/dump/ShortFileException;-><init>()V

    throw v8
    :try_end_0
    .catch Ljava/util/zip/DataFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 304
    .end local v5    # "inflator":Ljava/util/zip/Inflater;
    :catch_0
    move-exception v2

    .line 305
    .local v2, "e":Ljava/util/zip/DataFormatException;
    new-instance v8, Lorg/apache/commons/compress/archivers/dump/DumpArchiveException;

    const-string/jumbo v9, "bad data"

    invoke-direct {v8, v9, v2}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v8

    .line 303
    .end local v2    # "e":Ljava/util/zip/DataFormatException;
    .restart local v5    # "inflator":Ljava/util/zip/Inflater;
    :cond_7
    :try_start_1
    invoke-virtual {v5}, Ljava/util/zip/Inflater;->end()V
    :try_end_1
    .catch Ljava/util/zip/DataFormatException; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_0

    .line 311
    .end local v5    # "inflator":Ljava/util/zip/Inflater;
    :pswitch_1
    new-instance v8, Lorg/apache/commons/compress/archivers/dump/UnsupportedCompressionAlgorithmException;

    const-string/jumbo v9, "BZLIB2"

    invoke-direct {v8, v9}, Lorg/apache/commons/compress/archivers/dump/UnsupportedCompressionAlgorithmException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 315
    :pswitch_2
    new-instance v8, Lorg/apache/commons/compress/archivers/dump/UnsupportedCompressionAlgorithmException;

    const-string/jumbo v9, "LZO"

    invoke-direct {v8, v9}, Lorg/apache/commons/compress/archivers/dump/UnsupportedCompressionAlgorithmException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 290
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method private readFully([BII)Z
    .locals 5
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 336
    const/4 v0, 0x0

    .line 338
    .local v0, "count":I
    :goto_0
    if-ge v0, p3, :cond_1

    .line 339
    iget-object v2, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->in:Ljava/io/InputStream;

    add-int v3, p2, v0

    sub-int v4, p3, v0

    invoke-virtual {v2, p1, v3, v4}, Ljava/io/InputStream;->read([BII)I

    move-result v1

    .line 341
    .local v1, "n":I
    const/4 v2, -0x1

    if-ne v1, v2, :cond_0

    .line 342
    new-instance v2, Lorg/apache/commons/compress/archivers/dump/ShortFileException;

    invoke-direct {v2}, Lorg/apache/commons/compress/archivers/dump/ShortFileException;-><init>()V

    throw v2

    .line 345
    :cond_0
    add-int/2addr v0, v1

    .line 346
    goto :goto_0

    .line 348
    .end local v1    # "n":I
    :cond_1
    const/4 v2, 0x1

    return v2
.end method


# virtual methods
.method public available()I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 89
    iget v0, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->readOffset:I

    iget v1, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->blockSize:I

    if-ge v0, v1, :cond_0

    .line 90
    iget v0, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->blockSize:I

    iget v1, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->readOffset:I

    sub-int/2addr v0, v1

    .line 93
    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->available()I

    move-result v0

    goto :goto_0
.end method

.method public close()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 205
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->in:Ljava/io/InputStream;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->in:Ljava/io/InputStream;

    sget-object v1, Ljava/lang/System;->in:Ljava/io/InputStream;

    if-eq v0, v1, :cond_0

    .line 206
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 208
    :cond_0
    return-void
.end method

.method public getBytesRead()J
    .locals 2

    .prologue
    .line 355
    iget-wide v0, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->bytesRead:J

    return-wide v0
.end method

.method public peek()[B
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 220
    iget v1, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->readOffset:I

    iget v2, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->blockSize:I

    if-ne v1, v2, :cond_0

    const/4 v1, 0x1

    invoke-direct {p0, v1}, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->readBlock(Z)Z

    move-result v1

    if-nez v1, :cond_0

    .line 221
    const/4 v0, 0x0

    .line 228
    :goto_0
    return-object v0

    .line 225
    :cond_0
    iget v1, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->recordSize:I

    new-array v0, v1, [B

    .line 226
    .local v0, "b":[B
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->blockBuffer:[B

    iget v2, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->readOffset:I

    const/4 v3, 0x0

    array-length v4, v0

    invoke-static {v1, v2, v0, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_0
.end method

.method public read()I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 101
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "all reads must be multiple of record size ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->recordSize:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " bytes."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public read([BII)I
    .locals 5
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 116
    iget v2, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->recordSize:I

    rem-int v2, p3, v2

    if-eqz v2, :cond_0

    .line 117
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "all reads must be multiple of record size ("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->recordSize:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, " bytes."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 122
    :cond_0
    const/4 v0, 0x0

    .line 124
    .local v0, "bytes":I
    :goto_0
    if-ge v0, p3, :cond_1

    .line 128
    iget v2, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->readOffset:I

    iget v3, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->blockSize:I

    if-ne v2, v3, :cond_2

    const/4 v2, 0x1

    invoke-direct {p0, v2}, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->readBlock(Z)Z

    move-result v2

    if-nez v2, :cond_2

    .line 129
    const/4 v0, -0x1

    .line 149
    .end local v0    # "bytes":I
    :cond_1
    return v0

    .line 132
    .restart local v0    # "bytes":I
    :cond_2
    const/4 v1, 0x0

    .line 134
    .local v1, "n":I
    iget v2, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->readOffset:I

    sub-int v3, p3, v0

    add-int/2addr v2, v3

    iget v3, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->blockSize:I

    if-gt v2, v3, :cond_3

    .line 136
    sub-int v1, p3, v0

    .line 143
    :goto_1
    iget-object v2, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->blockBuffer:[B

    iget v3, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->readOffset:I

    invoke-static {v2, v3, p1, p2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 144
    iget v2, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->readOffset:I

    add-int/2addr v2, v1

    iput v2, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->readOffset:I

    .line 145
    add-int/2addr v0, v1

    .line 146
    add-int/2addr p2, v1

    .line 147
    goto :goto_0

    .line 139
    :cond_3
    iget v2, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->blockSize:I

    iget v3, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->readOffset:I

    sub-int v1, v2, v3

    goto :goto_1
.end method

.method public readRecord()[B
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 238
    iget v1, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->recordSize:I

    new-array v0, v1, [B

    .line 240
    .local v0, "result":[B
    const/4 v1, -0x1

    const/4 v2, 0x0

    array-length v3, v0

    invoke-virtual {p0, v0, v2, v3}, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->read([BII)I

    move-result v2

    if-ne v1, v2, :cond_0

    .line 241
    new-instance v1, Lorg/apache/commons/compress/archivers/dump/ShortFileException;

    invoke-direct {v1}, Lorg/apache/commons/compress/archivers/dump/ShortFileException;-><init>()V

    throw v1

    .line 244
    :cond_0
    return-object v0
.end method

.method public resetBlockSize(IZ)V
    .locals 6
    .param p1, "recsPerBlock"    # I
    .param p2, "isCompressed"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 68
    iput-boolean p2, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->isCompressed:Z

    .line 70
    iget v1, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->recordSize:I

    mul-int/2addr v1, p1

    iput v1, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->blockSize:I

    .line 73
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->blockBuffer:[B

    .line 76
    .local v0, "oldBuffer":[B
    iget v1, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->blockSize:I

    new-array v1, v1, [B

    iput-object v1, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->blockBuffer:[B

    .line 77
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->blockBuffer:[B

    iget v2, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->recordSize:I

    invoke-static {v0, v5, v1, v5, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 78
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->blockBuffer:[B

    iget v2, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->recordSize:I

    iget v3, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->blockSize:I

    iget v4, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->recordSize:I

    sub-int/2addr v3, v4

    invoke-direct {p0, v1, v2, v3}, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->readFully([BII)Z

    .line 80
    iput v5, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->currBlkIdx:I

    .line 81
    iget v1, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->recordSize:I

    iput v1, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->readOffset:I

    .line 82
    return-void
.end method

.method public skip(J)J
    .locals 9
    .param p1, "len"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 162
    iget v4, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->recordSize:I

    int-to-long v4, v4

    rem-long v4, p1, v4

    const-wide/16 v6, 0x0

    cmp-long v4, v4, v6

    if-eqz v4, :cond_0

    .line 163
    new-instance v4, Ljava/lang/IllegalArgumentException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "all reads must be multiple of record size ("

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v6, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->recordSize:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, " bytes."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 168
    :cond_0
    const-wide/16 v0, 0x0

    .line 170
    .local v0, "bytes":J
    :goto_0
    cmp-long v4, v0, p1

    if-gez v4, :cond_1

    .line 175
    iget v4, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->readOffset:I

    iget v5, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->blockSize:I

    if-ne v4, v5, :cond_3

    sub-long v4, p1, v0

    iget v6, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->blockSize:I

    int-to-long v6, v6

    cmp-long v4, v4, v6

    if-gez v4, :cond_2

    const/4 v4, 0x1

    :goto_1
    invoke-direct {p0, v4}, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->readBlock(Z)Z

    move-result v4

    if-nez v4, :cond_3

    .line 177
    const-wide/16 v0, -0x1

    .line 195
    .end local v0    # "bytes":J
    :cond_1
    return-wide v0

    .line 175
    .restart local v0    # "bytes":J
    :cond_2
    const/4 v4, 0x0

    goto :goto_1

    .line 180
    :cond_3
    const-wide/16 v2, 0x0

    .line 182
    .local v2, "n":J
    iget v4, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->readOffset:I

    int-to-long v4, v4

    sub-long v6, p1, v0

    add-long/2addr v4, v6

    iget v6, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->blockSize:I

    int-to-long v6, v6

    cmp-long v4, v4, v6

    if-gtz v4, :cond_4

    .line 184
    sub-long v2, p1, v0

    .line 191
    :goto_2
    iget v4, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->readOffset:I

    int-to-long v4, v4

    add-long/2addr v4, v2

    long-to-int v4, v4

    iput v4, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->readOffset:I

    .line 192
    add-long/2addr v0, v2

    .line 193
    goto :goto_0

    .line 187
    :cond_4
    iget v4, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->blockSize:I

    iget v5, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->readOffset:I

    sub-int/2addr v4, v5

    int-to-long v2, v4

    goto :goto_2
.end method
