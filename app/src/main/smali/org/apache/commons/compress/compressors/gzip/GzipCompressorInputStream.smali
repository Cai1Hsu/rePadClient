.class public Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;
.super Lorg/apache/commons/compress/compressors/CompressorInputStream;
.source "GzipCompressorInputStream.java"


# static fields
.field static final synthetic $assertionsDisabled:Z

.field private static final FCOMMENT:I = 0x10

.field private static final FEXTRA:I = 0x4

.field private static final FHCRC:I = 0x2

.field private static final FNAME:I = 0x8

.field private static final FRESERVED:I = 0xe0


# instance fields
.field private final buf:[B

.field private bufUsed:I

.field private crc:Ljava/util/zip/CRC32;

.field private final decompressConcatenated:Z

.field private endReached:Z

.field private final in:Ljava/io/InputStream;

.field private inf:Ljava/util/zip/Inflater;

.field private memberSize:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 47
    const-class v0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->$assertionsDisabled:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public constructor <init>(Ljava/io/InputStream;)V
    .locals 1
    .param p1, "inputStream"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 94
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;-><init>(Ljava/io/InputStream;Z)V

    .line 95
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;Z)V
    .locals 3
    .param p1, "inputStream"    # Ljava/io/InputStream;
    .param p2, "decompressConcatenated"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 119
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/CompressorInputStream;-><init>()V

    .line 63
    const/16 v0, 0x2000

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->buf:[B

    .line 66
    iput v1, p0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->bufUsed:I

    .line 69
    new-instance v0, Ljava/util/zip/Inflater;

    invoke-direct {v0, v2}, Ljava/util/zip/Inflater;-><init>(Z)V

    iput-object v0, p0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->inf:Ljava/util/zip/Inflater;

    .line 72
    new-instance v0, Ljava/util/zip/CRC32;

    invoke-direct {v0}, Ljava/util/zip/CRC32;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->crc:Ljava/util/zip/CRC32;

    .line 77
    iput-boolean v1, p0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->endReached:Z

    .line 122
    invoke-virtual {p1}, Ljava/io/InputStream;->markSupported()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 123
    iput-object p1, p0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->in:Ljava/io/InputStream;

    .line 128
    :goto_0
    iput-boolean p2, p0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->decompressConcatenated:Z

    .line 129
    invoke-direct {p0, v2}, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->init(Z)Z

    .line 130
    return-void

    .line 125
    :cond_0
    new-instance v0, Ljava/io/BufferedInputStream;

    invoke-direct {v0, p1}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    iput-object v0, p0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->in:Ljava/io/InputStream;

    goto :goto_0
.end method

.method private init(Z)Z
    .locals 10
    .param p1, "isFirstMember"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x0

    .line 133
    sget-boolean v8, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->$assertionsDisabled:Z

    if-nez v8, :cond_0

    if-nez p1, :cond_0

    iget-boolean v8, p0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->decompressConcatenated:Z

    if-nez v8, :cond_0

    new-instance v7, Ljava/lang/AssertionError;

    invoke-direct {v7}, Ljava/lang/AssertionError;-><init>()V

    throw v7

    .line 136
    :cond_0
    iget-object v8, p0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v8}, Ljava/io/InputStream;->read()I

    move-result v2

    .line 137
    .local v2, "magic0":I
    iget-object v8, p0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v8}, Ljava/io/InputStream;->read()I

    move-result v3

    .line 141
    .local v3, "magic1":I
    const/4 v8, -0x1

    if-ne v2, v8, :cond_1

    if-nez p1, :cond_1

    .line 206
    :goto_0
    return v7

    .line 145
    :cond_1
    const/16 v8, 0x1f

    if-ne v2, v8, :cond_2

    const/16 v8, 0x8b

    if-eq v3, v8, :cond_4

    .line 146
    :cond_2
    new-instance v8, Ljava/io/IOException;

    if-eqz p1, :cond_3

    const-string/jumbo v7, "Input is not in the .gz format"

    :goto_1
    invoke-direct {v8, v7}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v8

    :cond_3
    const-string/jumbo v7, "Garbage after a valid .gz stream"

    goto :goto_1

    .line 152
    :cond_4
    new-instance v1, Ljava/io/DataInputStream;

    iget-object v8, p0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->in:Ljava/io/InputStream;

    invoke-direct {v1, v8}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    .line 153
    .local v1, "inData":Ljava/io/DataInputStream;
    invoke-virtual {v1}, Ljava/io/DataInputStream;->readUnsignedByte()I

    move-result v4

    .line 154
    .local v4, "method":I
    const/16 v8, 0x8

    if-eq v4, v8, :cond_5

    .line 155
    new-instance v7, Ljava/io/IOException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "Unsupported compression method "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v9, " in the .gz header"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 159
    :cond_5
    invoke-virtual {v1}, Ljava/io/DataInputStream;->readUnsignedByte()I

    move-result v0

    .line 160
    .local v0, "flg":I
    and-int/lit16 v8, v0, 0xe0

    if-eqz v8, :cond_6

    .line 161
    new-instance v7, Ljava/io/IOException;

    const-string/jumbo v8, "Reserved flags are set in the .gz header"

    invoke-direct {v7, v8}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 165
    :cond_6
    invoke-virtual {v1}, Ljava/io/DataInputStream;->readInt()I

    .line 166
    invoke-virtual {v1}, Ljava/io/DataInputStream;->readUnsignedByte()I

    .line 167
    invoke-virtual {v1}, Ljava/io/DataInputStream;->readUnsignedByte()I

    .line 170
    and-int/lit8 v8, v0, 0x4

    if-eqz v8, :cond_7

    .line 171
    invoke-virtual {v1}, Ljava/io/DataInputStream;->readUnsignedByte()I

    move-result v5

    .line 172
    .local v5, "xlen":I
    invoke-virtual {v1}, Ljava/io/DataInputStream;->readUnsignedByte()I

    move-result v8

    shl-int/lit8 v8, v8, 0x8

    or-int/2addr v5, v8

    move v6, v5

    .line 177
    .end local v5    # "xlen":I
    .local v6, "xlen":I
    :goto_2
    add-int/lit8 v5, v6, -0x1

    .end local v6    # "xlen":I
    .restart local v5    # "xlen":I
    if-lez v6, :cond_7

    .line 178
    invoke-virtual {v1}, Ljava/io/DataInputStream;->readUnsignedByte()I

    move v6, v5

    .end local v5    # "xlen":I
    .restart local v6    # "xlen":I
    goto :goto_2

    .line 183
    .end local v6    # "xlen":I
    :cond_7
    and-int/lit8 v8, v0, 0x8

    if-eqz v8, :cond_8

    .line 184
    invoke-direct {p0, v1}, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->readToNull(Ljava/io/DataInputStream;)V

    .line 188
    :cond_8
    and-int/lit8 v8, v0, 0x10

    if-eqz v8, :cond_9

    .line 189
    invoke-direct {p0, v1}, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->readToNull(Ljava/io/DataInputStream;)V

    .line 197
    :cond_9
    and-int/lit8 v8, v0, 0x2

    if-eqz v8, :cond_a

    .line 198
    invoke-virtual {v1}, Ljava/io/DataInputStream;->readShort()S

    .line 202
    :cond_a
    iget-object v8, p0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->inf:Ljava/util/zip/Inflater;

    invoke-virtual {v8}, Ljava/util/zip/Inflater;->reset()V

    .line 203
    iget-object v8, p0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->crc:Ljava/util/zip/CRC32;

    invoke-virtual {v8}, Ljava/util/zip/CRC32;->reset()V

    .line 204
    iput v7, p0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->memberSize:I

    .line 206
    const/4 v7, 0x1

    goto/16 :goto_0
.end method

.method public static matches([BI)Z
    .locals 4
    .param p0, "signature"    # [B
    .param p1, "length"    # I

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 324
    const/4 v2, 0x2

    if-ge p1, v2, :cond_1

    .line 336
    :cond_0
    :goto_0
    return v0

    .line 328
    :cond_1
    aget-byte v2, p0, v0

    const/16 v3, 0x1f

    if-ne v2, v3, :cond_0

    .line 332
    aget-byte v2, p0, v1

    const/16 v3, -0x75

    if-ne v2, v3, :cond_0

    move v0, v1

    .line 336
    goto :goto_0
.end method

.method private readToNull(Ljava/io/DataInputStream;)V
    .locals 1
    .param p1, "inData"    # Ljava/io/DataInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 210
    :cond_0
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readUnsignedByte()I

    move-result v0

    if-nez v0, :cond_0

    .line 211
    return-void
.end method


# virtual methods
.method public close()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 346
    iget-object v0, p0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->inf:Ljava/util/zip/Inflater;

    if-eqz v0, :cond_0

    .line 347
    iget-object v0, p0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->inf:Ljava/util/zip/Inflater;

    invoke-virtual {v0}, Ljava/util/zip/Inflater;->end()V

    .line 348
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->inf:Ljava/util/zip/Inflater;

    .line 351
    :cond_0
    iget-object v0, p0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->in:Ljava/io/InputStream;

    sget-object v1, Ljava/lang/System;->in:Ljava/io/InputStream;

    if-eq v0, v1, :cond_1

    .line 352
    iget-object v0, p0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 354
    :cond_1
    return-void
.end method

.method public read()I
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    const/4 v1, -0x1

    .line 216
    new-array v0, v2, [B

    .line 217
    .local v0, "buf":[B
    invoke-virtual {p0, v0, v3, v2}, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->read([BII)I

    move-result v2

    if-ne v2, v1, :cond_0

    :goto_0
    return v1

    :cond_0
    aget-byte v1, v0, v3

    and-int/lit16 v1, v1, 0xff

    goto :goto_0
.end method

.method public read([BII)I
    .locals 18
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 227
    move-object/from16 v0, p0

    iget-boolean v13, v0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->endReached:Z

    if-eqz v13, :cond_1

    .line 228
    const/4 v11, -0x1

    .line 310
    :cond_0
    :goto_0
    return v11

    .line 231
    :cond_1
    const/4 v11, 0x0

    .line 233
    .local v11, "size":I
    :cond_2
    if-lez p3, :cond_0

    .line 234
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->inf:Ljava/util/zip/Inflater;

    invoke-virtual {v13}, Ljava/util/zip/Inflater;->needsInput()Z

    move-result v13

    if-eqz v13, :cond_4

    .line 237
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->in:Ljava/io/InputStream;

    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->buf:[B

    array-length v14, v14

    invoke-virtual {v13, v14}, Ljava/io/InputStream;->mark(I)V

    .line 239
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->in:Ljava/io/InputStream;

    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->buf:[B

    invoke-virtual {v13, v14}, Ljava/io/InputStream;->read([B)I

    move-result v13

    move-object/from16 v0, p0

    iput v13, v0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->bufUsed:I

    .line 240
    move-object/from16 v0, p0

    iget v13, v0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->bufUsed:I

    const/4 v14, -0x1

    if-ne v13, v14, :cond_3

    .line 241
    new-instance v13, Ljava/io/EOFException;

    invoke-direct {v13}, Ljava/io/EOFException;-><init>()V

    throw v13

    .line 244
    :cond_3
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->inf:Ljava/util/zip/Inflater;

    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->buf:[B

    const/4 v15, 0x0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->bufUsed:I

    move/from16 v16, v0

    invoke-virtual/range {v13 .. v16}, Ljava/util/zip/Inflater;->setInput([BII)V

    .line 249
    :cond_4
    :try_start_0
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->inf:Ljava/util/zip/Inflater;

    move-object/from16 v0, p1

    move/from16 v1, p2

    move/from16 v2, p3

    invoke-virtual {v13, v0, v1, v2}, Ljava/util/zip/Inflater;->inflate([BII)I
    :try_end_0
    .catch Ljava/util/zip/DataFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v10

    .line 254
    .local v10, "ret":I
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->crc:Ljava/util/zip/CRC32;

    move-object/from16 v0, p1

    move/from16 v1, p2

    invoke-virtual {v13, v0, v1, v10}, Ljava/util/zip/CRC32;->update([BII)V

    .line 255
    move-object/from16 v0, p0

    iget v13, v0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->memberSize:I

    add-int/2addr v13, v10

    move-object/from16 v0, p0

    iput v13, v0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->memberSize:I

    .line 256
    add-int p2, p2, v10

    .line 257
    sub-int p3, p3, v10

    .line 258
    add-int/2addr v11, v10

    .line 259
    move-object/from16 v0, p0

    invoke-virtual {v0, v10}, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->count(I)V

    .line 261
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->inf:Ljava/util/zip/Inflater;

    invoke-virtual {v13}, Ljava/util/zip/Inflater;->finished()Z

    move-result v13

    if-eqz v13, :cond_2

    .line 267
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v13}, Ljava/io/InputStream;->reset()V

    .line 269
    move-object/from16 v0, p0

    iget v13, v0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->bufUsed:I

    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->inf:Ljava/util/zip/Inflater;

    invoke-virtual {v14}, Ljava/util/zip/Inflater;->getRemaining()I

    move-result v14

    sub-int v12, v13, v14

    .line 270
    .local v12, "skipAmount":I
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->in:Ljava/io/InputStream;

    int-to-long v14, v12

    invoke-virtual {v13, v14, v15}, Ljava/io/InputStream;->skip(J)J

    move-result-wide v14

    int-to-long v0, v12

    move-wide/from16 v16, v0

    cmp-long v13, v14, v16

    if-eqz v13, :cond_5

    .line 271
    new-instance v13, Ljava/io/IOException;

    invoke-direct {v13}, Ljava/io/IOException;-><init>()V

    throw v13

    .line 250
    .end local v10    # "ret":I
    .end local v12    # "skipAmount":I
    :catch_0
    move-exception v6

    .line 251
    .local v6, "e":Ljava/util/zip/DataFormatException;
    new-instance v13, Ljava/io/IOException;

    const-string/jumbo v14, "Gzip-compressed data is corrupt"

    invoke-direct {v13, v14}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v13

    .line 274
    .end local v6    # "e":Ljava/util/zip/DataFormatException;
    .restart local v10    # "ret":I
    .restart local v12    # "skipAmount":I
    :cond_5
    const/4 v13, 0x0

    move-object/from16 v0, p0

    iput v13, v0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->bufUsed:I

    .line 276
    new-instance v8, Ljava/io/DataInputStream;

    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->in:Ljava/io/InputStream;

    invoke-direct {v8, v13}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    .line 279
    .local v8, "inData":Ljava/io/DataInputStream;
    const-wide/16 v4, 0x0

    .line 280
    .local v4, "crcStored":J
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_1
    const/4 v13, 0x4

    if-ge v7, v13, :cond_6

    .line 281
    invoke-virtual {v8}, Ljava/io/DataInputStream;->readUnsignedByte()I

    move-result v13

    int-to-long v14, v13

    mul-int/lit8 v13, v7, 0x8

    shl-long/2addr v14, v13

    or-long/2addr v4, v14

    .line 280
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    .line 284
    :cond_6
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->crc:Ljava/util/zip/CRC32;

    invoke-virtual {v13}, Ljava/util/zip/CRC32;->getValue()J

    move-result-wide v14

    cmp-long v13, v4, v14

    if-eqz v13, :cond_7

    .line 285
    new-instance v13, Ljava/io/IOException;

    const-string/jumbo v14, "Gzip-compressed data is corrupt (CRC32 error)"

    invoke-direct {v13, v14}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v13

    .line 290
    :cond_7
    const/4 v9, 0x0

    .line 291
    .local v9, "isize":I
    const/4 v7, 0x0

    :goto_2
    const/4 v13, 0x4

    if-ge v7, v13, :cond_8

    .line 292
    invoke-virtual {v8}, Ljava/io/DataInputStream;->readUnsignedByte()I

    move-result v13

    mul-int/lit8 v14, v7, 0x8

    shl-int/2addr v13, v14

    or-int/2addr v9, v13

    .line 291
    add-int/lit8 v7, v7, 0x1

    goto :goto_2

    .line 295
    :cond_8
    move-object/from16 v0, p0

    iget v13, v0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->memberSize:I

    if-eq v9, v13, :cond_9

    .line 296
    new-instance v13, Ljava/io/IOException;

    const-string/jumbo v14, "Gzip-compressed data is corrupt(uncompressed size mismatch)"

    invoke-direct {v13, v14}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v13

    .line 301
    :cond_9
    move-object/from16 v0, p0

    iget-boolean v13, v0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->decompressConcatenated:Z

    if-eqz v13, :cond_a

    const/4 v13, 0x0

    move-object/from16 v0, p0

    invoke-direct {v0, v13}, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->init(Z)Z

    move-result v13

    if-nez v13, :cond_2

    .line 302
    :cond_a
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->inf:Ljava/util/zip/Inflater;

    invoke-virtual {v13}, Ljava/util/zip/Inflater;->end()V

    .line 303
    const/4 v13, 0x0

    move-object/from16 v0, p0

    iput-object v13, v0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->inf:Ljava/util/zip/Inflater;

    .line 304
    const/4 v13, 0x1

    move-object/from16 v0, p0

    iput-boolean v13, v0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->endReached:Z

    .line 305
    if-nez v11, :cond_0

    const/4 v11, -0x1

    goto/16 :goto_0
.end method
