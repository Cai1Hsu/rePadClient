.class public Lorg/apache/commons/compress/archivers/tar/TarUtils;
.super Ljava/lang/Object;
.source "TarUtils.java"


# static fields
.field private static final BYTE_MASK:I = 0xff

.field static final DEFAULT_ENCODING:Lorg/apache/commons/compress/archivers/zip/ZipEncoding;

.field static final FALLBACK_ENCODING:Lorg/apache/commons/compress/archivers/zip/ZipEncoding;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 37
    const/4 v0, 0x0

    invoke-static {v0}, Lorg/apache/commons/compress/archivers/zip/ZipEncodingHelper;->getZipEncoding(Ljava/lang/String;)Lorg/apache/commons/compress/archivers/zip/ZipEncoding;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/compress/archivers/tar/TarUtils;->DEFAULT_ENCODING:Lorg/apache/commons/compress/archivers/zip/ZipEncoding;

    .line 44
    new-instance v0, Lorg/apache/commons/compress/archivers/tar/TarUtils$1;

    invoke-direct {v0}, Lorg/apache/commons/compress/archivers/tar/TarUtils$1;-><init>()V

    sput-object v0, Lorg/apache/commons/compress/archivers/tar/TarUtils;->FALLBACK_ENCODING:Lorg/apache/commons/compress/archivers/zip/ZipEncoding;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 75
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 76
    return-void
.end method

.method public static computeCheckSum([B)J
    .locals 6
    .param p0, "buf"    # [B

    .prologue
    .line 552
    const-wide/16 v2, 0x0

    .line 554
    .local v2, "sum":J
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v1, p0

    if-ge v0, v1, :cond_0

    .line 555
    aget-byte v1, p0, v0

    and-int/lit16 v1, v1, 0xff

    int-to-long v4, v1

    add-long/2addr v2, v4

    .line 554
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 558
    :cond_0
    return-wide v2
.end method

.method private static exceptionMessage([BIIIB)Ljava/lang/String;
    .locals 4
    .param p0, "buffer"    # [B
    .param p1, "offset"    # I
    .param p2, "length"    # I
    .param p3, "current"    # I
    .param p4, "currentByte"    # B

    .prologue
    .line 238
    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, p0, p1, p2}, Ljava/lang/String;-><init>([BII)V

    .line 239
    .local v1, "string":Ljava/lang/String;
    const-string/jumbo v2, "\u0000"

    const-string/jumbo v3, "{NUL}"

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 240
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Invalid byte "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, " at offset "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sub-int v3, p3, p1

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, " in \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "\' len="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 241
    .local v0, "s":Ljava/lang/String;
    return-object v0
.end method

.method private static formatBigIntegerBinary(J[BIIZ)V
    .locals 8
    .param p0, "value"    # J
    .param p2, "buf"    # [B
    .param p3, "offset"    # I
    .param p4, "length"    # I
    .param p5, "negative"    # Z

    .prologue
    const/4 v6, 0x0

    .line 509
    invoke-static {p0, p1}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v5

    .line 510
    .local v5, "val":Ljava/math/BigInteger;
    invoke-virtual {v5}, Ljava/math/BigInteger;->toByteArray()[B

    move-result-object v0

    .line 511
    .local v0, "b":[B
    array-length v3, v0

    .line 512
    .local v3, "len":I
    add-int v7, p3, p4

    sub-int v4, v7, v3

    .line 513
    .local v4, "off":I
    invoke-static {v0, v6, p2, v4, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 514
    if-eqz p5, :cond_0

    const/16 v6, 0xff

    :cond_0
    int-to-byte v1, v6

    .line 515
    .local v1, "fill":B
    add-int/lit8 v2, p3, 0x1

    .local v2, "i":I
    :goto_0
    if-ge v2, v4, :cond_1

    .line 516
    aput-byte v1, p2, v2

    .line 515
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 518
    :cond_1
    return-void
.end method

.method public static formatCheckSumOctalBytes(J[BII)I
    .locals 4
    .param p0, "value"    # J
    .param p2, "buf"    # [B
    .param p3, "offset"    # I
    .param p4, "length"    # I

    .prologue
    .line 536
    add-int/lit8 v0, p4, -0x2

    .line 537
    .local v0, "idx":I
    invoke-static {p0, p1, p2, p3, v0}, Lorg/apache/commons/compress/archivers/tar/TarUtils;->formatUnsignedOctalString(J[BII)V

    .line 539
    add-int/lit8 v1, v0, 0x1

    .end local v0    # "idx":I
    .local v1, "idx":I
    add-int v2, p3, v0

    const/4 v3, 0x0

    aput-byte v3, p2, v2

    .line 540
    add-int v2, p3, v1

    const/16 v3, 0x20

    aput-byte v3, p2, v2

    .line 542
    add-int v2, p3, p4

    return v2
.end method

.method private static formatLongBinary(J[BIIZ)V
    .locals 10
    .param p0, "value"    # J
    .param p2, "buf"    # [B
    .param p3, "offset"    # I
    .param p4, "length"    # I
    .param p5, "negative"    # Z

    .prologue
    const-wide/16 v8, 0x1

    .line 487
    add-int/lit8 v6, p4, -0x1

    mul-int/lit8 v0, v6, 0x8

    .line 488
    .local v0, "bits":I
    shl-long v2, v8, v0

    .line 489
    .local v2, "max":J
    invoke-static {p0, p1}, Ljava/lang/Math;->abs(J)J

    move-result-wide v4

    .line 490
    .local v4, "val":J
    cmp-long v6, v4, v2

    if-ltz v6, :cond_0

    .line 491
    new-instance v6, Ljava/lang/IllegalArgumentException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "Value "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v8, " is too large for "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v8, " byte field."

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 494
    :cond_0
    if-eqz p5, :cond_1

    .line 495
    sub-long v6, v2, v8

    xor-long/2addr v4, v6

    .line 496
    const/16 v6, 0xff

    shl-int/2addr v6, v0

    int-to-long v6, v6

    or-long/2addr v4, v6

    .line 497
    add-long/2addr v4, v8

    .line 499
    :cond_1
    add-int v6, p3, p4

    add-int/lit8 v1, v6, -0x1

    .local v1, "i":I
    :goto_0
    if-lt v1, p3, :cond_2

    .line 500
    long-to-int v6, v4

    int-to-byte v6, v6

    aput-byte v6, p2, v1

    .line 501
    const/16 v6, 0x8

    shr-long/2addr v4, v6

    .line 499
    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    .line 503
    :cond_2
    return-void
.end method

.method public static formatLongOctalBytes(J[BII)I
    .locals 4
    .param p0, "value"    # J
    .param p2, "buf"    # [B
    .param p3, "offset"    # I
    .param p4, "length"    # I

    .prologue
    .line 439
    add-int/lit8 v0, p4, -0x1

    .line 441
    .local v0, "idx":I
    invoke-static {p0, p1, p2, p3, v0}, Lorg/apache/commons/compress/archivers/tar/TarUtils;->formatUnsignedOctalString(J[BII)V

    .line 442
    add-int v1, p3, v0

    const/16 v2, 0x20

    aput-byte v2, p2, v1

    .line 444
    add-int v1, p3, p4

    return v1
.end method

.method public static formatLongOctalOrBinaryBytes(J[BII)I
    .locals 8
    .param p0, "value"    # J
    .param p2, "buf"    # [B
    .param p3, "offset"    # I
    .param p4, "length"    # I

    .prologue
    .line 468
    const/16 v0, 0x8

    if-ne p4, v0, :cond_0

    const-wide/32 v6, 0x1fffff

    .line 470
    .local v6, "maxAsOctalChar":J
    :goto_0
    const-wide/16 v0, 0x0

    cmp-long v0, p0, v0

    if-gez v0, :cond_1

    const/4 v5, 0x1

    .line 471
    .local v5, "negative":Z
    :goto_1
    if-nez v5, :cond_2

    cmp-long v0, p0, v6

    if-gtz v0, :cond_2

    .line 472
    invoke-static {p0, p1, p2, p3, p4}, Lorg/apache/commons/compress/archivers/tar/TarUtils;->formatLongOctalBytes(J[BII)I

    move-result v0

    .line 481
    :goto_2
    return v0

    .line 468
    .end local v5    # "negative":Z
    .end local v6    # "maxAsOctalChar":J
    :cond_0
    const-wide v6, 0x1ffffffffL

    goto :goto_0

    .line 470
    .restart local v6    # "maxAsOctalChar":J
    :cond_1
    const/4 v5, 0x0

    goto :goto_1

    .line 475
    .restart local v5    # "negative":Z
    :cond_2
    const/16 v0, 0x9

    if-ge p4, v0, :cond_3

    move-wide v0, p0

    move-object v2, p2

    move v3, p3

    move v4, p4

    .line 476
    invoke-static/range {v0 .. v5}, Lorg/apache/commons/compress/archivers/tar/TarUtils;->formatLongBinary(J[BIIZ)V

    :cond_3
    move-wide v0, p0

    move-object v2, p2

    move v3, p3

    move v4, p4

    .line 478
    invoke-static/range {v0 .. v5}, Lorg/apache/commons/compress/archivers/tar/TarUtils;->formatBigIntegerBinary(J[BIIZ)V

    .line 480
    if-eqz v5, :cond_4

    const/16 v0, 0xff

    :goto_3
    int-to-byte v0, v0

    aput-byte v0, p2, p3

    .line 481
    add-int v0, p3, p4

    goto :goto_2

    .line 480
    :cond_4
    const/16 v0, 0x80

    goto :goto_3
.end method

.method public static formatNameBytes(Ljava/lang/String;[BII)I
    .locals 3
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "buf"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I

    .prologue
    .line 315
    :try_start_0
    sget-object v2, Lorg/apache/commons/compress/archivers/tar/TarUtils;->DEFAULT_ENCODING:Lorg/apache/commons/compress/archivers/zip/ZipEncoding;

    invoke-static {p0, p1, p2, p3, v2}, Lorg/apache/commons/compress/archivers/tar/TarUtils;->formatNameBytes(Ljava/lang/String;[BIILorg/apache/commons/compress/archivers/zip/ZipEncoding;)I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    .line 318
    :goto_0
    return v2

    .line 316
    :catch_0
    move-exception v0

    .line 318
    .local v0, "ex":Ljava/io/IOException;
    :try_start_1
    sget-object v2, Lorg/apache/commons/compress/archivers/tar/TarUtils;->FALLBACK_ENCODING:Lorg/apache/commons/compress/archivers/zip/ZipEncoding;

    invoke-static {p0, p1, p2, p3, v2}, Lorg/apache/commons/compress/archivers/tar/TarUtils;->formatNameBytes(Ljava/lang/String;[BIILorg/apache/commons/compress/archivers/zip/ZipEncoding;)I
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    move-result v2

    goto :goto_0

    .line 320
    :catch_1
    move-exception v1

    .line 322
    .local v1, "ex2":Ljava/io/IOException;
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method public static formatNameBytes(Ljava/lang/String;[BIILorg/apache/commons/compress/archivers/zip/ZipEncoding;)I
    .locals 7
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "buf"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I
    .param p4, "encoding"    # Lorg/apache/commons/compress/archivers/zip/ZipEncoding;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    .line 348
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    .line 349
    .local v2, "len":I
    invoke-interface {p4, p0}, Lorg/apache/commons/compress/archivers/zip/ZipEncoding;->encode(Ljava/lang/String;)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 350
    .local v0, "b":Ljava/nio/ByteBuffer;
    :goto_0
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->limit()I

    move-result v4

    if-le v4, p3, :cond_0

    if-lez v2, :cond_0

    .line 351
    add-int/lit8 v2, v2, -0x1

    invoke-virtual {p0, v6, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-interface {p4, v4}, Lorg/apache/commons/compress/archivers/zip/ZipEncoding;->encode(Ljava/lang/String;)Ljava/nio/ByteBuffer;

    move-result-object v0

    goto :goto_0

    .line 353
    :cond_0
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->limit()I

    move-result v3

    .line 354
    .local v3, "limit":I
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v4

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->arrayOffset()I

    move-result v5

    invoke-static {v4, v5, p1, p2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 357
    move v1, v3

    .local v1, "i":I
    :goto_1
    if-ge v1, p3, :cond_1

    .line 358
    add-int v4, p2, v1

    aput-byte v6, p1, v4

    .line 357
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 361
    :cond_1
    add-int v4, p2, p3

    return v4
.end method

.method public static formatOctalBytes(J[BII)I
    .locals 4
    .param p0, "value"    # J
    .param p2, "buf"    # [B
    .param p3, "offset"    # I
    .param p4, "length"    # I

    .prologue
    .line 414
    add-int/lit8 v0, p4, -0x2

    .line 415
    .local v0, "idx":I
    invoke-static {p0, p1, p2, p3, v0}, Lorg/apache/commons/compress/archivers/tar/TarUtils;->formatUnsignedOctalString(J[BII)V

    .line 417
    add-int/lit8 v1, v0, 0x1

    .end local v0    # "idx":I
    .local v1, "idx":I
    add-int v2, p3, v0

    const/16 v3, 0x20

    aput-byte v3, p2, v2

    .line 418
    add-int v2, p3, v1

    const/4 v3, 0x0

    aput-byte v3, p2, v2

    .line 420
    add-int v2, p3, p4

    return v2
.end method

.method public static formatUnsignedOctalString(J[BII)V
    .locals 14
    .param p0, "value"    # J
    .param p2, "buffer"    # [B
    .param p3, "offset"    # I
    .param p4, "length"    # I

    .prologue
    const/16 v12, 0x30

    const-wide/16 v10, 0x0

    .line 375
    move/from16 v2, p4

    .line 376
    .local v2, "remaining":I
    add-int/lit8 v2, v2, -0x1

    .line 377
    cmp-long v6, p0, v10

    if-nez v6, :cond_1

    .line 378
    add-int/lit8 v3, v2, -0x1

    .end local v2    # "remaining":I
    .local v3, "remaining":I
    add-int v6, p3, v2

    aput-byte v12, p2, v6

    move v2, v3

    .line 393
    .end local v3    # "remaining":I
    .restart local v2    # "remaining":I
    :cond_0
    :goto_0
    if-ltz v2, :cond_3

    .line 394
    add-int v6, p3, v2

    aput-byte v12, p2, v6

    .line 393
    add-int/lit8 v2, v2, -0x1

    goto :goto_0

    .line 380
    :cond_1
    move-wide v4, p0

    .line 381
    .local v4, "val":J
    :goto_1
    if-ltz v2, :cond_2

    cmp-long v6, v4, v10

    if-eqz v6, :cond_2

    .line 383
    add-int v6, p3, v2

    const-wide/16 v8, 0x7

    and-long/2addr v8, v4

    long-to-int v7, v8

    int-to-byte v7, v7

    add-int/lit8 v7, v7, 0x30

    int-to-byte v7, v7

    aput-byte v7, p2, v6

    .line 384
    const/4 v6, 0x3

    ushr-long/2addr v4, v6

    .line 381
    add-int/lit8 v2, v2, -0x1

    goto :goto_1

    .line 387
    :cond_2
    cmp-long v6, v4, v10

    if-eqz v6, :cond_0

    .line 388
    new-instance v6, Ljava/lang/IllegalArgumentException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v8, "="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-static {p0, p1}, Ljava/lang/Long;->toOctalString(J)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v8, " will not fit in octal number buffer of length "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move/from16 v0, p4

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 396
    .end local v4    # "val":J
    :cond_3
    return-void
.end method

.method private static parseBinaryBigInteger([BIIZ)J
    .locals 5
    .param p0, "buffer"    # [B
    .param p1, "offset"    # I
    .param p2, "length"    # I
    .param p3, "negative"    # Z

    .prologue
    .line 205
    add-int/lit8 v2, p2, -0x1

    new-array v0, v2, [B

    .line 206
    .local v0, "remainder":[B
    add-int/lit8 v2, p1, 0x1

    const/4 v3, 0x0

    add-int/lit8 v4, p2, -0x1

    invoke-static {p0, v2, v0, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 207
    new-instance v1, Ljava/math/BigInteger;

    invoke-direct {v1, v0}, Ljava/math/BigInteger;-><init>([B)V

    .line 208
    .local v1, "val":Ljava/math/BigInteger;
    if-eqz p3, :cond_0

    .line 210
    const-wide/16 v2, -0x1

    invoke-static {v2, v3}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v2

    invoke-virtual {v2}, Ljava/math/BigInteger;->not()Ljava/math/BigInteger;

    move-result-object v1

    .line 212
    :cond_0
    invoke-virtual {v1}, Ljava/math/BigInteger;->bitLength()I

    move-result v2

    const/16 v3, 0x3f

    if-le v2, v3, :cond_1

    .line 213
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "At offset "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, ", "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, " byte binary number"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, " exceeds maximum signed long"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, " value"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 218
    :cond_1
    if-eqz p3, :cond_2

    invoke-virtual {v1}, Ljava/math/BigInteger;->longValue()J

    move-result-wide v2

    neg-long v2, v2

    :goto_0
    return-wide v2

    :cond_2
    invoke-virtual {v1}, Ljava/math/BigInteger;->longValue()J

    move-result-wide v2

    goto :goto_0
.end method

.method private static parseBinaryLong([BIIZ)J
    .locals 10
    .param p0, "buffer"    # [B
    .param p1, "offset"    # I
    .param p2, "length"    # I
    .param p3, "negative"    # Z

    .prologue
    const-wide/16 v8, 0x1

    .line 183
    const/16 v1, 0x9

    if-lt p2, v1, :cond_0

    .line 184
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "At offset "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, ", "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, " byte binary number"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, " exceeds maximum signed long"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, " value"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v1, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 189
    :cond_0
    const-wide/16 v2, 0x0

    .line 190
    .local v2, "val":J
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_0
    if-ge v0, p2, :cond_1

    .line 191
    const/16 v1, 0x8

    shl-long v4, v2, v1

    add-int v1, p1, v0

    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    int-to-long v6, v1

    add-long v2, v4, v6

    .line 190
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 193
    :cond_1
    if-eqz p3, :cond_2

    .line 195
    sub-long/2addr v2, v8

    .line 196
    const-wide/high16 v4, 0x4000000000000000L    # 2.0

    add-int/lit8 v1, p2, -0x1

    mul-int/lit8 v1, v1, 0x8

    int-to-double v6, v1

    invoke-static {v4, v5, v6, v7}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v4

    double-to-long v4, v4

    sub-long/2addr v4, v8

    xor-long/2addr v2, v4

    .line 198
    :cond_2
    if-eqz p3, :cond_3

    neg-long v2, v2

    .end local v2    # "val":J
    :cond_3
    return-wide v2
.end method

.method public static parseBoolean([BI)Z
    .locals 2
    .param p0, "buffer"    # [B
    .param p1, "offset"    # I

    .prologue
    const/4 v0, 0x1

    .line 232
    aget-byte v1, p0, p1

    if-ne v1, v0, :cond_0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static parseName([BII)Ljava/lang/String;
    .locals 3
    .param p0, "buffer"    # [B
    .param p1, "offset"    # I
    .param p2, "length"    # I

    .prologue
    .line 256
    :try_start_0
    sget-object v2, Lorg/apache/commons/compress/archivers/tar/TarUtils;->DEFAULT_ENCODING:Lorg/apache/commons/compress/archivers/zip/ZipEncoding;

    invoke-static {p0, p1, p2, v2}, Lorg/apache/commons/compress/archivers/tar/TarUtils;->parseName([BIILorg/apache/commons/compress/archivers/zip/ZipEncoding;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 259
    :goto_0
    return-object v2

    .line 257
    :catch_0
    move-exception v0

    .line 259
    .local v0, "ex":Ljava/io/IOException;
    :try_start_1
    sget-object v2, Lorg/apache/commons/compress/archivers/tar/TarUtils;->FALLBACK_ENCODING:Lorg/apache/commons/compress/archivers/zip/ZipEncoding;

    invoke-static {p0, p1, p2, v2}, Lorg/apache/commons/compress/archivers/tar/TarUtils;->parseName([BIILorg/apache/commons/compress/archivers/zip/ZipEncoding;)Ljava/lang/String;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v2

    goto :goto_0

    .line 260
    :catch_1
    move-exception v1

    .line 262
    .local v1, "ex2":Ljava/io/IOException;
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method public static parseName([BIILorg/apache/commons/compress/archivers/zip/ZipEncoding;)Ljava/lang/String;
    .locals 3
    .param p0, "buffer"    # [B
    .param p1, "offset"    # I
    .param p2, "length"    # I
    .param p3, "encoding"    # Lorg/apache/commons/compress/archivers/zip/ZipEncoding;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 284
    move v1, p2

    .line 285
    .local v1, "len":I
    :goto_0
    if-lez v1, :cond_0

    .line 286
    add-int v2, p1, v1

    add-int/lit8 v2, v2, -0x1

    aget-byte v2, p0, v2

    if-eqz v2, :cond_1

    .line 290
    :cond_0
    if-lez v1, :cond_2

    .line 291
    new-array v0, v1, [B

    .line 292
    .local v0, "b":[B
    const/4 v2, 0x0

    invoke-static {p0, p1, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 293
    invoke-interface {p3, v0}, Lorg/apache/commons/compress/archivers/zip/ZipEncoding;->decode([B)Ljava/lang/String;

    move-result-object v2

    .line 295
    .end local v0    # "b":[B
    :goto_1
    return-object v2

    .line 285
    :cond_1
    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    .line 295
    :cond_2
    const-string/jumbo v2, ""

    goto :goto_1
.end method

.method public static parseOctal([BII)J
    .locals 10
    .param p0, "buffer"    # [B
    .param p1, "offset"    # I
    .param p2, "length"    # I

    .prologue
    const/16 v7, 0x20

    .line 100
    const-wide/16 v2, 0x0

    .line 101
    .local v2, "result":J
    add-int v1, p1, p2

    .line 102
    .local v1, "end":I
    move v4, p1

    .line 104
    .local v4, "start":I
    const/4 v6, 0x2

    if-ge p2, v6, :cond_0

    .line 105
    new-instance v6, Ljava/lang/IllegalArgumentException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "Length "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v8, " must be at least 2"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 108
    :cond_0
    aget-byte v6, p0, v4

    if-nez v6, :cond_1

    .line 109
    const-wide/16 v6, 0x0

    .line 147
    :goto_0
    return-wide v6

    .line 113
    :cond_1
    :goto_1
    if-ge v4, v1, :cond_2

    .line 114
    aget-byte v6, p0, v4

    if-ne v6, v7, :cond_2

    .line 115
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 123
    :cond_2
    add-int/lit8 v6, v1, -0x1

    aget-byte v5, p0, v6

    .line 124
    .local v5, "trailer":B
    if-eqz v5, :cond_3

    if-ne v5, v7, :cond_7

    .line 125
    :cond_3
    add-int/lit8 v1, v1, -0x1

    .line 131
    add-int/lit8 v6, v1, -0x1

    aget-byte v5, p0, v6

    .line 132
    if-eqz v5, :cond_4

    if-ne v5, v7, :cond_5

    .line 133
    :cond_4
    add-int/lit8 v1, v1, -0x1

    .line 136
    :cond_5
    :goto_2
    if-ge v4, v1, :cond_9

    .line 137
    aget-byte v0, p0, v4

    .line 139
    .local v0, "currentByte":B
    const/16 v6, 0x30

    if-lt v0, v6, :cond_6

    const/16 v6, 0x37

    if-le v0, v6, :cond_8

    .line 140
    :cond_6
    new-instance v6, Ljava/lang/IllegalArgumentException;

    invoke-static {p0, p1, p2, v4, v0}, Lorg/apache/commons/compress/archivers/tar/TarUtils;->exceptionMessage([BIIIB)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 127
    .end local v0    # "currentByte":B
    :cond_7
    new-instance v6, Ljava/lang/IllegalArgumentException;

    add-int/lit8 v7, v1, -0x1

    invoke-static {p0, p1, p2, v7, v5}, Lorg/apache/commons/compress/archivers/tar/TarUtils;->exceptionMessage([BIIIB)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 143
    .restart local v0    # "currentByte":B
    :cond_8
    const/4 v6, 0x3

    shl-long v6, v2, v6

    add-int/lit8 v8, v0, -0x30

    int-to-long v8, v8

    add-long v2, v6, v8

    .line 136
    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    .end local v0    # "currentByte":B
    :cond_9
    move-wide v6, v2

    .line 147
    goto :goto_0
.end method

.method public static parseOctalOrBinary([BII)J
    .locals 4
    .param p0, "buffer"    # [B
    .param p1, "offset"    # I
    .param p2, "length"    # I

    .prologue
    .line 170
    aget-byte v1, p0, p1

    and-int/lit16 v1, v1, 0x80

    if-nez v1, :cond_0

    .line 171
    invoke-static {p0, p1, p2}, Lorg/apache/commons/compress/archivers/tar/TarUtils;->parseOctal([BII)J

    move-result-wide v2

    .line 177
    :goto_0
    return-wide v2

    .line 173
    :cond_0
    aget-byte v1, p0, p1

    const/4 v2, -0x1

    if-ne v1, v2, :cond_1

    const/4 v0, 0x1

    .line 174
    .local v0, "negative":Z
    :goto_1
    const/16 v1, 0x9

    if-ge p2, v1, :cond_2

    .line 175
    invoke-static {p0, p1, p2, v0}, Lorg/apache/commons/compress/archivers/tar/TarUtils;->parseBinaryLong([BIIZ)J

    move-result-wide v2

    goto :goto_0

    .line 173
    .end local v0    # "negative":Z
    :cond_1
    const/4 v0, 0x0

    goto :goto_1

    .line 177
    .restart local v0    # "negative":Z
    :cond_2
    invoke-static {p0, p1, p2, v0}, Lorg/apache/commons/compress/archivers/tar/TarUtils;->parseBinaryBigInteger([BIIZ)J

    move-result-wide v2

    goto :goto_0
.end method
