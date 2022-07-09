.class public Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;
.super Lorg/apache/commons/compress/compressors/CompressorInputStream;
.source "BZip2CompressorInputStream.java"

# interfaces
.implements Lorg/apache/commons/compress/compressors/bzip2/BZip2Constants;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;
    }
.end annotation


# static fields
.field private static final EOF:I = 0x0

.field private static final NO_RAND_PART_A_STATE:I = 0x5

.field private static final NO_RAND_PART_B_STATE:I = 0x6

.field private static final NO_RAND_PART_C_STATE:I = 0x7

.field private static final RAND_PART_A_STATE:I = 0x2

.field private static final RAND_PART_B_STATE:I = 0x3

.field private static final RAND_PART_C_STATE:I = 0x4

.field private static final START_BLOCK_STATE:I = 0x1


# instance fields
.field private blockRandomised:Z

.field private blockSize100k:I

.field private bsBuff:I

.field private bsLive:I

.field private computedBlockCRC:I

.field private computedCombinedCRC:I

.field private final crc:Lorg/apache/commons/compress/compressors/bzip2/CRC;

.field private currentChar:I

.field private currentState:I

.field private data:Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;

.field private final decompressConcatenated:Z

.field private in:Ljava/io/InputStream;

.field private last:I

.field private nInUse:I

.field private origPtr:I

.field private storedBlockCRC:I

.field private storedCombinedCRC:I

.field private su_ch2:I

.field private su_chPrev:I

.field private su_count:I

.field private su_i2:I

.field private su_j2:I

.field private su_rNToGo:I

.field private su_rTPos:I

.field private su_tPos:I

.field private su_z:C


# direct methods
.method public constructor <init>(Ljava/io/InputStream;)V
    .locals 1
    .param p1, "in"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 111
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;-><init>(Ljava/io/InputStream;Z)V

    .line 112
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;Z)V
    .locals 2
    .param p1, "in"    # Ljava/io/InputStream;
    .param p2, "decompressConcatenated"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x1

    .line 133
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/CompressorInputStream;-><init>()V

    .line 60
    new-instance v0, Lorg/apache/commons/compress/compressors/bzip2/CRC;

    invoke-direct {v0}, Lorg/apache/commons/compress/compressors/bzip2/CRC;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->crc:Lorg/apache/commons/compress/compressors/bzip2/CRC;

    .line 67
    const/4 v0, -0x1

    iput v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->currentChar:I

    .line 78
    iput v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->currentState:I

    .line 135
    iput-object p1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->in:Ljava/io/InputStream;

    .line 136
    iput-boolean p2, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->decompressConcatenated:Z

    .line 138
    invoke-direct {p0, v1}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->init(Z)Z

    .line 139
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->initBlock()V

    .line 140
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->setupBlock()V

    .line 141
    return-void
.end method

.method private bsGetBit()Z
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x1

    .line 406
    iget v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->bsLive:I

    .line 407
    .local v1, "bsLiveShadow":I
    iget v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->bsBuff:I

    .line 409
    .local v0, "bsBuffShadow":I
    if-ge v1, v3, :cond_1

    .line 410
    iget-object v4, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v4}, Ljava/io/InputStream;->read()I

    move-result v2

    .line 412
    .local v2, "thech":I
    if-gez v2, :cond_0

    .line 413
    new-instance v3, Ljava/io/IOException;

    const-string/jumbo v4, "unexpected end of stream"

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 416
    :cond_0
    shl-int/lit8 v4, v0, 0x8

    or-int v0, v4, v2

    .line 417
    add-int/lit8 v1, v1, 0x8

    .line 418
    iput v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->bsBuff:I

    .line 421
    .end local v2    # "thech":I
    :cond_1
    add-int/lit8 v4, v1, -0x1

    iput v4, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->bsLive:I

    .line 422
    add-int/lit8 v4, v1, -0x1

    shr-int v4, v0, v4

    and-int/lit8 v4, v4, 0x1

    if-eqz v4, :cond_2

    :goto_0
    return v3

    :cond_2
    const/4 v3, 0x0

    goto :goto_0
.end method

.method private bsGetInt()I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v2, 0x8

    .line 430
    invoke-direct {p0, v2}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->bsR(I)I

    move-result v0

    shl-int/lit8 v0, v0, 0x8

    invoke-direct {p0, v2}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->bsR(I)I

    move-result v1

    or-int/2addr v0, v1

    shl-int/lit8 v0, v0, 0x8

    invoke-direct {p0, v2}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->bsR(I)I

    move-result v1

    or-int/2addr v0, v1

    shl-int/lit8 v0, v0, 0x8

    invoke-direct {p0, v2}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->bsR(I)I

    move-result v1

    or-int/2addr v0, v1

    return v0
.end method

.method private bsGetUByte()C
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 426
    const/16 v0, 0x8

    invoke-direct {p0, v0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->bsR(I)I

    move-result v0

    int-to-char v0, v0

    return v0
.end method

.method private bsR(I)I
    .locals 6
    .param p1, "n"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 382
    iget v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->bsLive:I

    .line 383
    .local v1, "bsLiveShadow":I
    iget v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->bsBuff:I

    .line 385
    .local v0, "bsBuffShadow":I
    if-ge v1, p1, :cond_2

    .line 386
    iget-object v2, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->in:Ljava/io/InputStream;

    .line 388
    .local v2, "inShadow":Ljava/io/InputStream;
    :cond_0
    invoke-virtual {v2}, Ljava/io/InputStream;->read()I

    move-result v3

    .line 390
    .local v3, "thech":I
    if-gez v3, :cond_1

    .line 391
    new-instance v4, Ljava/io/IOException;

    const-string/jumbo v5, "unexpected end of stream"

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 394
    :cond_1
    shl-int/lit8 v4, v0, 0x8

    or-int v0, v4, v3

    .line 395
    add-int/lit8 v1, v1, 0x8

    .line 396
    if-lt v1, p1, :cond_0

    .line 398
    iput v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->bsBuff:I

    .line 401
    .end local v2    # "inShadow":Ljava/io/InputStream;
    .end local v3    # "thech":I
    :cond_2
    sub-int v4, v1, p1

    iput v4, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->bsLive:I

    .line 402
    sub-int v4, v1, p1

    shr-int v4, v0, v4

    const/4 v5, 0x1

    shl-int/2addr v5, p1

    add-int/lit8 v5, v5, -0x1

    and-int/2addr v4, v5

    return v4
.end method

.method private complete()Z
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 353
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->bsGetInt()I

    move-result v1

    iput v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->storedCombinedCRC:I

    .line 354
    iput v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->currentState:I

    .line 355
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->data:Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;

    .line 357
    iget v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->storedCombinedCRC:I

    iget v2, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->computedCombinedCRC:I

    if-eq v1, v2, :cond_0

    .line 358
    new-instance v0, Ljava/io/IOException;

    const-string/jumbo v1, "BZip2 CRC error"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 363
    :cond_0
    iget-boolean v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->decompressConcatenated:Z

    if-eqz v1, :cond_1

    invoke-direct {p0, v0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->init(Z)Z

    move-result v1

    if-nez v1, :cond_2

    :cond_1
    const/4 v0, 0x1

    :cond_2
    return v0
.end method

.method private createHuffmanDecodingTables(II)V
    .locals 19
    .param p1, "alphaSize"    # I
    .param p2, "nGroups"    # I

    .prologue
    .line 560
    move-object/from16 v0, p0

    iget-object v10, v0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->data:Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;

    .line 561
    .local v10, "dataShadow":Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;
    iget-object v12, v10, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;->temp_charArray2d:[[C

    .line 562
    .local v12, "len":[[C
    iget-object v0, v10, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;->minLens:[I

    move-object/from16 v16, v0

    .line 563
    .local v16, "minLens":[I
    iget-object v15, v10, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;->limit:[[I

    .line 564
    .local v15, "limit":[[I
    iget-object v9, v10, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;->base:[[I

    .line 565
    .local v9, "base":[[I
    iget-object v0, v10, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;->perm:[[I

    move-object/from16 v17, v0

    .line 567
    .local v17, "perm":[[I
    const/16 v18, 0x0

    .local v18, "t":I
    :goto_0
    move/from16 v0, v18

    move/from16 v1, p2

    if-ge v0, v1, :cond_3

    .line 568
    const/16 v6, 0x20

    .line 569
    .local v6, "minLen":I
    const/4 v7, 0x0

    .line 570
    .local v7, "maxLen":I
    aget-object v13, v12, v18

    .line 571
    .local v13, "len_t":[C
    move/from16 v11, p1

    .local v11, "i":I
    :cond_0
    :goto_1
    add-int/lit8 v11, v11, -0x1

    if-ltz v11, :cond_2

    .line 572
    aget-char v14, v13, v11

    .line 573
    .local v14, "lent":C
    if-le v14, v7, :cond_1

    .line 574
    move v7, v14

    .line 576
    :cond_1
    if-ge v14, v6, :cond_0

    .line 577
    move v6, v14

    goto :goto_1

    .line 580
    .end local v14    # "lent":C
    :cond_2
    aget-object v2, v15, v18

    aget-object v3, v9, v18

    aget-object v4, v17, v18

    aget-object v5, v12, v18

    move/from16 v8, p1

    invoke-static/range {v2 .. v8}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->hbCreateDecodeTables([I[I[I[CIII)V

    .line 582
    aput v6, v16, v18

    .line 567
    add-int/lit8 v18, v18, 0x1

    goto :goto_0

    .line 584
    .end local v6    # "minLen":I
    .end local v7    # "maxLen":I
    .end local v11    # "i":I
    .end local v13    # "len_t":[C
    :cond_3
    return-void
.end method

.method private endBlock()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 334
    iget-object v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->crc:Lorg/apache/commons/compress/compressors/bzip2/CRC;

    invoke-virtual {v0}, Lorg/apache/commons/compress/compressors/bzip2/CRC;->getFinalCRC()I

    move-result v0

    iput v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->computedBlockCRC:I

    .line 337
    iget v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->storedBlockCRC:I

    iget v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->computedBlockCRC:I

    if-eq v0, v1, :cond_0

    .line 340
    iget v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->storedCombinedCRC:I

    shl-int/lit8 v0, v0, 0x1

    iget v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->storedCombinedCRC:I

    ushr-int/lit8 v1, v1, 0x1f

    or-int/2addr v0, v1

    iput v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->computedCombinedCRC:I

    .line 342
    iget v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->computedCombinedCRC:I

    iget v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->storedBlockCRC:I

    xor-int/2addr v0, v1

    iput v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->computedCombinedCRC:I

    .line 344
    new-instance v0, Ljava/io/IOException;

    const-string/jumbo v1, "BZip2 CRC error"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 347
    :cond_0
    iget v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->computedCombinedCRC:I

    shl-int/lit8 v0, v0, 0x1

    iget v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->computedCombinedCRC:I

    ushr-int/lit8 v1, v1, 0x1f

    or-int/2addr v0, v1

    iput v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->computedCombinedCRC:I

    .line 349
    iget v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->computedCombinedCRC:I

    iget v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->computedBlockCRC:I

    xor-int/2addr v0, v1

    iput v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->computedCombinedCRC:I

    .line 350
    return-void
.end method

.method private getAndMoveToFrontDecode()V
    .locals 43
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 587
    const/16 v40, 0x18

    move-object/from16 v0, p0

    move/from16 v1, v40

    invoke-direct {v0, v1}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->bsR(I)I

    move-result v40

    move/from16 v0, v40

    move-object/from16 v1, p0

    iput v0, v1, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->origPtr:I

    .line 588
    invoke-direct/range {p0 .. p0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->recvDecodingTables()V

    .line 590
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->in:Ljava/io/InputStream;

    .line 591
    .local v15, "inShadow":Ljava/io/InputStream;
    move-object/from16 v0, p0

    iget-object v10, v0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->data:Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;

    .line 592
    .local v10, "dataShadow":Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;
    iget-object v0, v10, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;->ll8:[B

    move-object/from16 v22, v0

    .line 593
    .local v22, "ll8":[B
    iget-object v0, v10, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;->unzftab:[I

    move-object/from16 v35, v0

    .line 594
    .local v35, "unzftab":[I
    iget-object v0, v10, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;->selector:[B

    move-object/from16 v31, v0

    .line 595
    .local v31, "selector":[B
    iget-object v0, v10, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;->seqToUnseq:[B

    move-object/from16 v32, v0

    .line 596
    .local v32, "seqToUnseq":[B
    iget-object v0, v10, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;->getAndMoveToFrontDecode_yy:[C

    move-object/from16 v36, v0

    .line 597
    .local v36, "yy":[C
    iget-object v0, v10, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;->minLens:[I

    move-object/from16 v23, v0

    .line 598
    .local v23, "minLens":[I
    iget-object v0, v10, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;->limit:[[I

    move-object/from16 v19, v0

    .line 599
    .local v19, "limit":[[I
    iget-object v5, v10, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;->base:[[I

    .line 600
    .local v5, "base":[[I
    iget-object v0, v10, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;->perm:[[I

    move-object/from16 v27, v0

    .line 601
    .local v27, "perm":[[I
    move-object/from16 v0, p0

    iget v0, v0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->blockSize100k:I

    move/from16 v40, v0

    const v41, 0x186a0

    mul-int v20, v40, v41

    .line 608
    .local v20, "limitLast":I
    const/16 v14, 0x100

    .local v14, "i":I
    :goto_0
    add-int/lit8 v14, v14, -0x1

    if-ltz v14, :cond_0

    .line 609
    int-to-char v0, v14

    move/from16 v40, v0

    aput-char v40, v36, v14

    .line 610
    const/16 v40, 0x0

    aput v40, v35, v14

    goto :goto_0

    .line 613
    :cond_0
    const/4 v12, 0x0

    .line 614
    .local v12, "groupNo":I
    const/16 v13, 0x31

    .line 615
    .local v13, "groupPos":I
    move-object/from16 v0, p0

    iget v0, v0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->nInUse:I

    move/from16 v40, v0

    add-int/lit8 v11, v40, 0x1

    .line 616
    .local v11, "eob":I
    const/16 v40, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v40

    invoke-direct {v0, v1}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->getAndMoveToFrontDecode0(I)I

    move-result v26

    .line 617
    .local v26, "nextSym":I
    move-object/from16 v0, p0

    iget v7, v0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->bsBuff:I

    .line 618
    .local v7, "bsBuffShadow":I
    move-object/from16 v0, p0

    iget v8, v0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->bsLive:I

    .line 619
    .local v8, "bsLiveShadow":I
    const/16 v18, -0x1

    .line 620
    .local v18, "lastShadow":I
    aget-byte v40, v31, v12

    move/from16 v0, v40

    and-int/lit16 v0, v0, 0xff

    move/from16 v38, v0

    .line 621
    .local v38, "zt":I
    aget-object v6, v5, v38

    .line 622
    .local v6, "base_zt":[I
    aget-object v21, v19, v38

    .line 623
    .local v21, "limit_zt":[I
    aget-object v28, v27, v38

    .line 624
    .local v28, "perm_zt":[I
    aget v24, v23, v38

    .line 626
    .local v24, "minLens_zt":I
    :cond_1
    :goto_1
    move/from16 v0, v26

    if-eq v0, v11, :cond_16

    .line 627
    if-eqz v26, :cond_2

    const/16 v40, 0x1

    move/from16 v0, v26

    move/from16 v1, v40

    if-ne v0, v1, :cond_c

    .line 628
    :cond_2
    const/16 v29, -0x1

    .line 630
    .local v29, "s":I
    const/16 v25, 0x1

    .line 631
    .local v25, "n":I
    :goto_2
    if-nez v26, :cond_3

    .line 632
    add-int v29, v29, v25

    .line 639
    :goto_3
    if-nez v13, :cond_4

    .line 640
    const/16 v13, 0x31

    .line 641
    add-int/lit8 v12, v12, 0x1

    aget-byte v40, v31, v12

    move/from16 v0, v40

    and-int/lit16 v0, v0, 0xff

    move/from16 v38, v0

    .line 642
    aget-object v6, v5, v38

    .line 643
    aget-object v21, v19, v38

    .line 644
    aget-object v28, v27, v38

    .line 645
    aget v24, v23, v38

    .line 650
    :goto_4
    move/from16 v37, v24

    .line 654
    .local v37, "zn":I
    :goto_5
    move/from16 v0, v37

    if-ge v8, v0, :cond_6

    .line 655
    invoke-virtual {v15}, Ljava/io/InputStream;->read()I

    move-result v33

    .line 656
    .local v33, "thech":I
    if-ltz v33, :cond_5

    .line 657
    shl-int/lit8 v40, v7, 0x8

    or-int v7, v40, v33

    .line 658
    add-int/lit8 v8, v8, 0x8

    .line 659
    goto :goto_5

    .line 633
    .end local v33    # "thech":I
    .end local v37    # "zn":I
    :cond_3
    const/16 v40, 0x1

    move/from16 v0, v26

    move/from16 v1, v40

    if-ne v0, v1, :cond_a

    .line 634
    shl-int/lit8 v40, v25, 0x1

    add-int v29, v29, v40

    goto :goto_3

    .line 647
    :cond_4
    add-int/lit8 v13, v13, -0x1

    goto :goto_4

    .line 661
    .restart local v33    # "thech":I
    .restart local v37    # "zn":I
    :cond_5
    new-instance v40, Ljava/io/IOException;

    const-string/jumbo v41, "unexpected end of stream"

    invoke-direct/range {v40 .. v41}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v40

    .line 664
    .end local v33    # "thech":I
    :cond_6
    sub-int v40, v8, v37

    shr-int v40, v7, v40

    const/16 v41, 0x1

    shl-int v41, v41, v37

    add-int/lit8 v41, v41, -0x1

    and-int v39, v40, v41

    .line 666
    .local v39, "zvec":I
    sub-int v8, v8, v37

    .line 668
    :goto_6
    aget v40, v21, v37

    move/from16 v0, v39

    move/from16 v1, v40

    if-le v0, v1, :cond_9

    .line 669
    add-int/lit8 v37, v37, 0x1

    .line 670
    :goto_7
    const/16 v40, 0x1

    move/from16 v0, v40

    if-ge v8, v0, :cond_8

    .line 671
    invoke-virtual {v15}, Ljava/io/InputStream;->read()I

    move-result v33

    .line 672
    .restart local v33    # "thech":I
    if-ltz v33, :cond_7

    .line 673
    shl-int/lit8 v40, v7, 0x8

    or-int v7, v40, v33

    .line 674
    add-int/lit8 v8, v8, 0x8

    .line 675
    goto :goto_7

    .line 677
    :cond_7
    new-instance v40, Ljava/io/IOException;

    const-string/jumbo v41, "unexpected end of stream"

    invoke-direct/range {v40 .. v41}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v40

    .line 681
    .end local v33    # "thech":I
    :cond_8
    add-int/lit8 v8, v8, -0x1

    .line 682
    shl-int/lit8 v40, v39, 0x1

    shr-int v41, v7, v8

    and-int/lit8 v41, v41, 0x1

    or-int v39, v40, v41

    goto :goto_6

    .line 685
    :cond_9
    aget v40, v6, v37

    sub-int v40, v39, v40

    aget v26, v28, v40

    .line 630
    shl-int/lit8 v25, v25, 0x1

    goto/16 :goto_2

    .line 688
    .end local v37    # "zn":I
    .end local v39    # "zvec":I
    :cond_a
    const/16 v40, 0x0

    aget-char v40, v36, v40

    aget-byte v9, v32, v40

    .line 689
    .local v9, "ch":B
    and-int/lit16 v0, v9, 0xff

    move/from16 v40, v0

    aget v41, v35, v40

    add-int/lit8 v42, v29, 0x1

    add-int v41, v41, v42

    aput v41, v35, v40

    move/from16 v30, v29

    .line 691
    .end local v29    # "s":I
    .local v30, "s":I
    :goto_8
    add-int/lit8 v29, v30, -0x1

    .end local v30    # "s":I
    .restart local v29    # "s":I
    if-ltz v30, :cond_b

    .line 692
    add-int/lit8 v18, v18, 0x1

    aput-byte v9, v22, v18

    move/from16 v30, v29

    .end local v29    # "s":I
    .restart local v30    # "s":I
    goto :goto_8

    .line 695
    .end local v30    # "s":I
    .restart local v29    # "s":I
    :cond_b
    move/from16 v0, v18

    move/from16 v1, v20

    if-lt v0, v1, :cond_1

    .line 696
    new-instance v40, Ljava/io/IOException;

    const-string/jumbo v41, "block overrun"

    invoke-direct/range {v40 .. v41}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v40

    .line 699
    .end local v9    # "ch":B
    .end local v25    # "n":I
    .end local v29    # "s":I
    :cond_c
    add-int/lit8 v18, v18, 0x1

    move/from16 v0, v18

    move/from16 v1, v20

    if-lt v0, v1, :cond_d

    .line 700
    new-instance v40, Ljava/io/IOException;

    const-string/jumbo v41, "block overrun"

    invoke-direct/range {v40 .. v41}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v40

    .line 703
    :cond_d
    add-int/lit8 v40, v26, -0x1

    aget-char v34, v36, v40

    .line 704
    .local v34, "tmp":C
    aget-byte v40, v32, v34

    move/from16 v0, v40

    and-int/lit16 v0, v0, 0xff

    move/from16 v40, v0

    aget v41, v35, v40

    add-int/lit8 v41, v41, 0x1

    aput v41, v35, v40

    .line 705
    aget-byte v40, v32, v34

    aput-byte v40, v22, v18

    .line 712
    const/16 v40, 0x10

    move/from16 v0, v26

    move/from16 v1, v40

    if-gt v0, v1, :cond_e

    .line 713
    add-int/lit8 v16, v26, -0x1

    .local v16, "j":I
    move/from16 v17, v16

    .end local v16    # "j":I
    .local v17, "j":I
    :goto_9
    if-lez v17, :cond_f

    .line 714
    add-int/lit8 v16, v17, -0x1

    .end local v17    # "j":I
    .restart local v16    # "j":I
    aget-char v40, v36, v16

    aput-char v40, v36, v17

    move/from16 v17, v16

    .end local v16    # "j":I
    .restart local v17    # "j":I
    goto :goto_9

    .line 717
    .end local v17    # "j":I
    :cond_e
    const/16 v40, 0x0

    const/16 v41, 0x1

    add-int/lit8 v42, v26, -0x1

    move-object/from16 v0, v36

    move/from16 v1, v40

    move-object/from16 v2, v36

    move/from16 v3, v41

    move/from16 v4, v42

    invoke-static {v0, v1, v2, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 720
    :cond_f
    const/16 v40, 0x0

    aput-char v34, v36, v40

    .line 722
    if-nez v13, :cond_10

    .line 723
    const/16 v13, 0x31

    .line 724
    add-int/lit8 v12, v12, 0x1

    aget-byte v40, v31, v12

    move/from16 v0, v40

    and-int/lit16 v0, v0, 0xff

    move/from16 v38, v0

    .line 725
    aget-object v6, v5, v38

    .line 726
    aget-object v21, v19, v38

    .line 727
    aget-object v28, v27, v38

    .line 728
    aget v24, v23, v38

    .line 733
    :goto_a
    move/from16 v37, v24

    .line 737
    .restart local v37    # "zn":I
    :goto_b
    move/from16 v0, v37

    if-ge v8, v0, :cond_12

    .line 738
    invoke-virtual {v15}, Ljava/io/InputStream;->read()I

    move-result v33

    .line 739
    .restart local v33    # "thech":I
    if-ltz v33, :cond_11

    .line 740
    shl-int/lit8 v40, v7, 0x8

    or-int v7, v40, v33

    .line 741
    add-int/lit8 v8, v8, 0x8

    .line 742
    goto :goto_b

    .line 730
    .end local v33    # "thech":I
    .end local v37    # "zn":I
    :cond_10
    add-int/lit8 v13, v13, -0x1

    goto :goto_a

    .line 744
    .restart local v33    # "thech":I
    .restart local v37    # "zn":I
    :cond_11
    new-instance v40, Ljava/io/IOException;

    const-string/jumbo v41, "unexpected end of stream"

    invoke-direct/range {v40 .. v41}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v40

    .line 747
    .end local v33    # "thech":I
    :cond_12
    sub-int v40, v8, v37

    shr-int v40, v7, v40

    const/16 v41, 0x1

    shl-int v41, v41, v37

    add-int/lit8 v41, v41, -0x1

    and-int v39, v40, v41

    .line 749
    .restart local v39    # "zvec":I
    sub-int v8, v8, v37

    .line 751
    :goto_c
    aget v40, v21, v37

    move/from16 v0, v39

    move/from16 v1, v40

    if-le v0, v1, :cond_15

    .line 752
    add-int/lit8 v37, v37, 0x1

    .line 753
    :goto_d
    const/16 v40, 0x1

    move/from16 v0, v40

    if-ge v8, v0, :cond_14

    .line 754
    invoke-virtual {v15}, Ljava/io/InputStream;->read()I

    move-result v33

    .line 755
    .restart local v33    # "thech":I
    if-ltz v33, :cond_13

    .line 756
    shl-int/lit8 v40, v7, 0x8

    or-int v7, v40, v33

    .line 757
    add-int/lit8 v8, v8, 0x8

    .line 758
    goto :goto_d

    .line 760
    :cond_13
    new-instance v40, Ljava/io/IOException;

    const-string/jumbo v41, "unexpected end of stream"

    invoke-direct/range {v40 .. v41}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v40

    .line 763
    .end local v33    # "thech":I
    :cond_14
    add-int/lit8 v8, v8, -0x1

    .line 764
    shl-int/lit8 v40, v39, 0x1

    shr-int v41, v7, v8

    and-int/lit8 v41, v41, 0x1

    or-int v39, v40, v41

    goto :goto_c

    .line 766
    :cond_15
    aget v40, v6, v37

    sub-int v40, v39, v40

    aget v26, v28, v40

    .line 767
    goto/16 :goto_1

    .line 770
    .end local v34    # "tmp":C
    .end local v37    # "zn":I
    .end local v39    # "zvec":I
    :cond_16
    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->last:I

    .line 771
    move-object/from16 v0, p0

    iput v8, v0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->bsLive:I

    .line 772
    move-object/from16 v0, p0

    iput v7, v0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->bsBuff:I

    .line 773
    return-void
.end method

.method private getAndMoveToFrontDecode0(I)I
    .locals 11
    .param p1, "groupNo"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 776
    iget-object v3, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->in:Ljava/io/InputStream;

    .line 777
    .local v3, "inShadow":Ljava/io/InputStream;
    iget-object v2, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->data:Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;

    .line 778
    .local v2, "dataShadow":Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;
    iget-object v9, v2, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;->selector:[B

    aget-byte v9, v9, p1

    and-int/lit16 v7, v9, 0xff

    .line 779
    .local v7, "zt":I
    iget-object v9, v2, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;->limit:[[I

    aget-object v4, v9, v7

    .line 780
    .local v4, "limit_zt":[I
    iget-object v9, v2, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;->minLens:[I

    aget v6, v9, v7

    .line 781
    .local v6, "zn":I
    invoke-direct {p0, v6}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->bsR(I)I

    move-result v8

    .line 782
    .local v8, "zvec":I
    iget v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->bsLive:I

    .line 783
    .local v1, "bsLiveShadow":I
    iget v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->bsBuff:I

    .line 785
    .local v0, "bsBuffShadow":I
    :goto_0
    aget v9, v4, v6

    if-le v8, v9, :cond_2

    .line 786
    add-int/lit8 v6, v6, 0x1

    .line 787
    :goto_1
    const/4 v9, 0x1

    if-ge v1, v9, :cond_1

    .line 788
    invoke-virtual {v3}, Ljava/io/InputStream;->read()I

    move-result v5

    .line 790
    .local v5, "thech":I
    if-ltz v5, :cond_0

    .line 791
    shl-int/lit8 v9, v0, 0x8

    or-int v0, v9, v5

    .line 792
    add-int/lit8 v1, v1, 0x8

    .line 793
    goto :goto_1

    .line 795
    :cond_0
    new-instance v9, Ljava/io/IOException;

    const-string/jumbo v10, "unexpected end of stream"

    invoke-direct {v9, v10}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 798
    .end local v5    # "thech":I
    :cond_1
    add-int/lit8 v1, v1, -0x1

    .line 799
    shl-int/lit8 v9, v8, 0x1

    shr-int v10, v0, v1

    and-int/lit8 v10, v10, 0x1

    or-int v8, v9, v10

    goto :goto_0

    .line 802
    :cond_2
    iput v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->bsLive:I

    .line 803
    iput v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->bsBuff:I

    .line 805
    iget-object v9, v2, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;->perm:[[I

    aget-object v9, v9, v7

    iget-object v10, v2, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;->base:[[I

    aget-object v10, v10, v7

    aget v10, v10, v6

    sub-int v10, v8, v10

    aget v9, v9, v10

    return v9
.end method

.method private static hbCreateDecodeTables([I[I[I[CIII)V
    .locals 9
    .param p0, "limit"    # [I
    .param p1, "base"    # [I
    .param p2, "perm"    # [I
    .param p3, "length"    # [C
    .param p4, "minLen"    # I
    .param p5, "maxLen"    # I
    .param p6, "alphaSize"    # I

    .prologue
    .line 439
    move v1, p4

    .local v1, "i":I
    const/4 v4, 0x0

    .local v4, "pp":I
    :goto_0
    if-gt v1, p5, :cond_1

    .line 440
    const/4 v2, 0x0

    .local v2, "j":I
    move v5, v4

    .end local v4    # "pp":I
    .local v5, "pp":I
    :goto_1
    if-ge v2, p6, :cond_0

    .line 441
    aget-char v7, p3, v2

    if-ne v7, v1, :cond_7

    .line 442
    add-int/lit8 v4, v5, 0x1

    .end local v5    # "pp":I
    .restart local v4    # "pp":I
    aput v2, p2, v5

    .line 440
    :goto_2
    add-int/lit8 v2, v2, 0x1

    move v5, v4

    .end local v4    # "pp":I
    .restart local v5    # "pp":I
    goto :goto_1

    .line 439
    :cond_0
    add-int/lit8 v1, v1, 0x1

    move v4, v5

    .end local v5    # "pp":I
    .restart local v4    # "pp":I
    goto :goto_0

    .line 447
    .end local v2    # "j":I
    :cond_1
    const/16 v1, 0x17

    :goto_3
    add-int/lit8 v1, v1, -0x1

    if-lez v1, :cond_2

    .line 448
    const/4 v7, 0x0

    aput v7, p1, v1

    .line 449
    const/4 v7, 0x0

    aput v7, p0, v1

    goto :goto_3

    .line 452
    :cond_2
    const/4 v1, 0x0

    :goto_4
    if-ge v1, p6, :cond_3

    .line 453
    aget-char v7, p3, v1

    add-int/lit8 v7, v7, 0x1

    aget v8, p1, v7

    add-int/lit8 v8, v8, 0x1

    aput v8, p1, v7

    .line 452
    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    .line 456
    :cond_3
    const/4 v1, 0x1

    const/4 v7, 0x0

    aget v0, p1, v7

    .local v0, "b":I
    :goto_5
    const/16 v7, 0x17

    if-ge v1, v7, :cond_4

    .line 457
    aget v7, p1, v1

    add-int/2addr v0, v7

    .line 458
    aput v0, p1, v1

    .line 456
    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    .line 461
    :cond_4
    move v1, p4

    const/4 v6, 0x0

    .local v6, "vec":I
    aget v0, p1, v1

    :goto_6
    if-gt v1, p5, :cond_5

    .line 462
    add-int/lit8 v7, v1, 0x1

    aget v3, p1, v7

    .line 463
    .local v3, "nb":I
    sub-int v7, v3, v0

    add-int/2addr v6, v7

    .line 464
    move v0, v3

    .line 465
    add-int/lit8 v7, v6, -0x1

    aput v7, p0, v1

    .line 466
    shl-int/lit8 v6, v6, 0x1

    .line 461
    add-int/lit8 v1, v1, 0x1

    goto :goto_6

    .line 469
    .end local v3    # "nb":I
    :cond_5
    add-int/lit8 v1, p4, 0x1

    :goto_7
    if-gt v1, p5, :cond_6

    .line 470
    add-int/lit8 v7, v1, -0x1

    aget v7, p0, v7

    add-int/lit8 v7, v7, 0x1

    shl-int/lit8 v7, v7, 0x1

    aget v8, p1, v1

    sub-int/2addr v7, v8

    aput v7, p1, v1

    .line 469
    add-int/lit8 v1, v1, 0x1

    goto :goto_7

    .line 472
    :cond_6
    return-void

    .end local v0    # "b":I
    .end local v4    # "pp":I
    .end local v6    # "vec":I
    .restart local v2    # "j":I
    .restart local v5    # "pp":I
    :cond_7
    move v4, v5

    .end local v5    # "pp":I
    .restart local v4    # "pp":I
    goto :goto_2
.end method

.method private init(Z)Z
    .locals 6
    .param p1, "isFirstStream"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 243
    iget-object v5, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->in:Ljava/io/InputStream;

    if-nez v5, :cond_0

    .line 244
    new-instance v4, Ljava/io/IOException;

    const-string/jumbo v5, "No InputStream"

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 247
    :cond_0
    iget-object v5, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v5}, Ljava/io/InputStream;->read()I

    move-result v1

    .line 248
    .local v1, "magic0":I
    iget-object v5, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v5}, Ljava/io/InputStream;->read()I

    move-result v2

    .line 249
    .local v2, "magic1":I
    iget-object v5, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v5}, Ljava/io/InputStream;->read()I

    move-result v3

    .line 250
    .local v3, "magic2":I
    const/4 v5, -0x1

    if-ne v1, v5, :cond_1

    if-nez p1, :cond_1

    .line 270
    :goto_0
    return v4

    .line 254
    :cond_1
    const/16 v5, 0x42

    if-ne v1, v5, :cond_2

    const/16 v5, 0x5a

    if-ne v2, v5, :cond_2

    const/16 v5, 0x68

    if-eq v3, v5, :cond_4

    .line 255
    :cond_2
    new-instance v5, Ljava/io/IOException;

    if-eqz p1, :cond_3

    const-string/jumbo v4, "Stream is not in the BZip2 format"

    :goto_1
    invoke-direct {v5, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v5

    :cond_3
    const-string/jumbo v4, "Garbage after a valid BZip2 stream"

    goto :goto_1

    .line 260
    :cond_4
    iget-object v5, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v5}, Ljava/io/InputStream;->read()I

    move-result v0

    .line 261
    .local v0, "blockSize":I
    const/16 v5, 0x31

    if-lt v0, v5, :cond_5

    const/16 v5, 0x39

    if-le v0, v5, :cond_6

    .line 262
    :cond_5
    new-instance v4, Ljava/io/IOException;

    const-string/jumbo v5, "BZip2 block size is invalid"

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 265
    :cond_6
    add-int/lit8 v5, v0, -0x30

    iput v5, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->blockSize100k:I

    .line 267
    iput v4, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->bsLive:I

    .line 268
    iput v4, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->computedCombinedCRC:I

    .line 270
    const/4 v4, 0x1

    goto :goto_0
.end method

.method private initBlock()V
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v9, 0x59

    const/4 v6, 0x0

    const/4 v7, 0x1

    .line 283
    :cond_0
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->bsGetUByte()C

    move-result v0

    .line 284
    .local v0, "magic0":C
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->bsGetUByte()C

    move-result v1

    .line 285
    .local v1, "magic1":C
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->bsGetUByte()C

    move-result v2

    .line 286
    .local v2, "magic2":C
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->bsGetUByte()C

    move-result v3

    .line 287
    .local v3, "magic3":C
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->bsGetUByte()C

    move-result v4

    .line 288
    .local v4, "magic4":C
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->bsGetUByte()C

    move-result v5

    .line 291
    .local v5, "magic5":C
    const/16 v8, 0x17

    if-ne v0, v8, :cond_1

    const/16 v8, 0x72

    if-ne v1, v8, :cond_1

    const/16 v8, 0x45

    if-ne v2, v8, :cond_1

    const/16 v8, 0x38

    if-ne v3, v8, :cond_1

    const/16 v8, 0x50

    if-ne v4, v8, :cond_1

    const/16 v8, 0x90

    if-eq v5, v8, :cond_3

    .line 304
    :cond_1
    const/16 v8, 0x31

    if-ne v0, v8, :cond_2

    const/16 v8, 0x41

    if-ne v1, v8, :cond_2

    if-ne v2, v9, :cond_2

    const/16 v8, 0x26

    if-ne v3, v8, :cond_2

    const/16 v8, 0x53

    if-ne v4, v8, :cond_2

    if-eq v5, v9, :cond_4

    .line 311
    :cond_2
    iput v6, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->currentState:I

    .line 312
    new-instance v6, Ljava/io/IOException;

    const-string/jumbo v7, "bad block header"

    invoke-direct {v6, v7}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 299
    :cond_3
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->complete()Z

    move-result v8

    if-eqz v8, :cond_0

    .line 331
    :goto_0
    return-void

    .line 314
    :cond_4
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->bsGetInt()I

    move-result v8

    iput v8, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->storedBlockCRC:I

    .line 315
    invoke-direct {p0, v7}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->bsR(I)I

    move-result v8

    if-ne v8, v7, :cond_5

    move v6, v7

    :cond_5
    iput-boolean v6, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->blockRandomised:Z

    .line 321
    iget-object v6, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->data:Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;

    if-nez v6, :cond_6

    .line 322
    new-instance v6, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;

    iget v8, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->blockSize100k:I

    invoke-direct {v6, v8}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;-><init>(I)V

    iput-object v6, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->data:Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;

    .line 326
    :cond_6
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->getAndMoveToFrontDecode()V

    .line 328
    iget-object v6, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->crc:Lorg/apache/commons/compress/compressors/bzip2/CRC;

    invoke-virtual {v6}, Lorg/apache/commons/compress/compressors/bzip2/CRC;->initialiseCRC()V

    .line 329
    iput v7, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->currentState:I

    goto :goto_0
.end method

.method private makeMaps()V
    .locals 6

    .prologue
    .line 189
    iget-object v5, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->data:Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;

    iget-object v1, v5, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;->inUse:[Z

    .line 190
    .local v1, "inUse":[Z
    iget-object v5, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->data:Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;

    iget-object v4, v5, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;->seqToUnseq:[B

    .line 192
    .local v4, "seqToUnseq":[B
    const/4 v2, 0x0

    .line 194
    .local v2, "nInUseShadow":I
    const/4 v0, 0x0

    .local v0, "i":I
    move v3, v2

    .end local v2    # "nInUseShadow":I
    .local v3, "nInUseShadow":I
    :goto_0
    const/16 v5, 0x100

    if-ge v0, v5, :cond_0

    .line 195
    aget-boolean v5, v1, v0

    if-eqz v5, :cond_1

    .line 196
    add-int/lit8 v2, v3, 0x1

    .end local v3    # "nInUseShadow":I
    .restart local v2    # "nInUseShadow":I
    int-to-byte v5, v0

    aput-byte v5, v4, v3

    .line 194
    :goto_1
    add-int/lit8 v0, v0, 0x1

    move v3, v2

    .end local v2    # "nInUseShadow":I
    .restart local v3    # "nInUseShadow":I
    goto :goto_0

    .line 200
    :cond_0
    iput v3, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->nInUse:I

    .line 201
    return-void

    :cond_1
    move v2, v3

    .end local v3    # "nInUseShadow":I
    .restart local v2    # "nInUseShadow":I
    goto :goto_1
.end method

.method public static matches([BI)Z
    .locals 4
    .param p0, "signature"    # [B
    .param p1, "length"    # I

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 1035
    const/4 v2, 0x3

    if-ge p1, v2, :cond_1

    .line 1051
    :cond_0
    :goto_0
    return v0

    .line 1039
    :cond_1
    aget-byte v2, p0, v0

    const/16 v3, 0x42

    if-ne v2, v3, :cond_0

    .line 1043
    aget-byte v2, p0, v1

    const/16 v3, 0x5a

    if-ne v2, v3, :cond_0

    .line 1047
    const/4 v2, 0x2

    aget-byte v2, p0, v2

    const/16 v3, 0x68

    if-ne v2, v3, :cond_0

    move v0, v1

    .line 1051
    goto :goto_0
.end method

.method private read0()I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 204
    iget v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->currentChar:I

    .line 206
    .local v0, "retChar":I
    iget v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->currentState:I

    packed-switch v1, :pswitch_data_0

    .line 236
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1}, Ljava/lang/IllegalStateException;-><init>()V

    throw v1

    .line 208
    :pswitch_0
    const/4 v0, -0x1

    .line 239
    .end local v0    # "retChar":I
    :goto_0
    return v0

    .line 211
    .restart local v0    # "retChar":I
    :pswitch_1
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1}, Ljava/lang/IllegalStateException;-><init>()V

    throw v1

    .line 214
    :pswitch_2
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1}, Ljava/lang/IllegalStateException;-><init>()V

    throw v1

    .line 217
    :pswitch_3
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->setupRandPartB()V

    goto :goto_0

    .line 221
    :pswitch_4
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->setupRandPartC()V

    goto :goto_0

    .line 225
    :pswitch_5
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1}, Ljava/lang/IllegalStateException;-><init>()V

    throw v1

    .line 228
    :pswitch_6
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->setupNoRandPartB()V

    goto :goto_0

    .line 232
    :pswitch_7
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->setupNoRandPartC()V

    goto :goto_0

    .line 206
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
    .end packed-switch
.end method

.method private recvDecodingTables()V
    .locals 22
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 475
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->data:Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;

    .line 476
    .local v4, "dataShadow":Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;
    iget-object v7, v4, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;->inUse:[Z

    .line 477
    .local v7, "inUse":[Z
    iget-object v14, v4, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;->recvDecodingTables_pos:[B

    .line 478
    .local v14, "pos":[B
    iget-object v15, v4, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;->selector:[B

    .line 479
    .local v15, "selector":[B
    iget-object v0, v4, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;->selectorMtf:[B

    move-object/from16 v16, v0

    .line 481
    .local v16, "selectorMtf":[B
    const/4 v8, 0x0

    .line 484
    .local v8, "inUse16":I
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_0
    const/16 v20, 0x10

    move/from16 v0, v20

    if-ge v5, v0, :cond_1

    .line 485
    invoke-direct/range {p0 .. p0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->bsGetBit()Z

    move-result v20

    if-eqz v20, :cond_0

    .line 486
    const/16 v20, 0x1

    shl-int v20, v20, v5

    or-int v8, v8, v20

    .line 484
    :cond_0
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 490
    :cond_1
    const/16 v5, 0x100

    :goto_1
    add-int/lit8 v5, v5, -0x1

    if-ltz v5, :cond_2

    .line 491
    const/16 v20, 0x0

    aput-boolean v20, v7, v5

    goto :goto_1

    .line 494
    :cond_2
    const/4 v5, 0x0

    :goto_2
    const/16 v20, 0x10

    move/from16 v0, v20

    if-ge v5, v0, :cond_5

    .line 495
    const/16 v20, 0x1

    shl-int v20, v20, v5

    and-int v20, v20, v8

    if-eqz v20, :cond_4

    .line 496
    shl-int/lit8 v6, v5, 0x4

    .line 497
    .local v6, "i16":I
    const/4 v9, 0x0

    .local v9, "j":I
    :goto_3
    const/16 v20, 0x10

    move/from16 v0, v20

    if-ge v9, v0, :cond_4

    .line 498
    invoke-direct/range {p0 .. p0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->bsGetBit()Z

    move-result v20

    if-eqz v20, :cond_3

    .line 499
    add-int v20, v6, v9

    const/16 v21, 0x1

    aput-boolean v21, v7, v20

    .line 497
    :cond_3
    add-int/lit8 v9, v9, 0x1

    goto :goto_3

    .line 494
    .end local v6    # "i16":I
    .end local v9    # "j":I
    :cond_4
    add-int/lit8 v5, v5, 0x1

    goto :goto_2

    .line 505
    :cond_5
    invoke-direct/range {p0 .. p0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->makeMaps()V

    .line 506
    move-object/from16 v0, p0

    iget v0, v0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->nInUse:I

    move/from16 v20, v0

    add-int/lit8 v2, v20, 0x2

    .line 509
    .local v2, "alphaSize":I
    const/16 v20, 0x3

    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-direct {v0, v1}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->bsR(I)I

    move-result v12

    .line 510
    .local v12, "nGroups":I
    const/16 v20, 0xf

    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-direct {v0, v1}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->bsR(I)I

    move-result v13

    .line 512
    .local v13, "nSelectors":I
    const/4 v5, 0x0

    :goto_4
    if-ge v5, v13, :cond_7

    .line 513
    const/4 v9, 0x0

    .line 514
    .restart local v9    # "j":I
    :goto_5
    invoke-direct/range {p0 .. p0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->bsGetBit()Z

    move-result v20

    if-eqz v20, :cond_6

    .line 515
    add-int/lit8 v9, v9, 0x1

    goto :goto_5

    .line 517
    :cond_6
    int-to-byte v0, v9

    move/from16 v20, v0

    aput-byte v20, v16, v5

    .line 512
    add-int/lit8 v5, v5, 0x1

    goto :goto_4

    .line 521
    .end local v9    # "j":I
    :cond_7
    move/from16 v19, v12

    .local v19, "v":I
    :goto_6
    add-int/lit8 v19, v19, -0x1

    if-ltz v19, :cond_8

    .line 522
    move/from16 v0, v19

    int-to-byte v0, v0

    move/from16 v20, v0

    aput-byte v20, v14, v19

    goto :goto_6

    .line 525
    :cond_8
    const/4 v5, 0x0

    :goto_7
    if-ge v5, v13, :cond_a

    .line 526
    aget-byte v20, v16, v5

    move/from16 v0, v20

    and-int/lit16 v0, v0, 0xff

    move/from16 v19, v0

    .line 527
    aget-byte v18, v14, v19

    .line 528
    .local v18, "tmp":B
    :goto_8
    if-lez v19, :cond_9

    .line 530
    add-int/lit8 v20, v19, -0x1

    aget-byte v20, v14, v20

    aput-byte v20, v14, v19

    .line 531
    add-int/lit8 v19, v19, -0x1

    goto :goto_8

    .line 533
    :cond_9
    const/16 v20, 0x0

    aput-byte v18, v14, v20

    .line 534
    aput-byte v18, v15, v5

    .line 525
    add-int/lit8 v5, v5, 0x1

    goto :goto_7

    .line 537
    .end local v18    # "tmp":B
    :cond_a
    iget-object v10, v4, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;->temp_charArray2d:[[C

    .line 540
    .local v10, "len":[[C
    const/16 v17, 0x0

    .local v17, "t":I
    :goto_9
    move/from16 v0, v17

    if-ge v0, v12, :cond_e

    .line 541
    const/16 v20, 0x5

    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-direct {v0, v1}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->bsR(I)I

    move-result v3

    .line 542
    .local v3, "curr":I
    aget-object v11, v10, v17

    .line 543
    .local v11, "len_t":[C
    const/4 v5, 0x0

    :goto_a
    if-ge v5, v2, :cond_d

    .line 544
    :goto_b
    invoke-direct/range {p0 .. p0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->bsGetBit()Z

    move-result v20

    if-eqz v20, :cond_c

    .line 545
    invoke-direct/range {p0 .. p0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->bsGetBit()Z

    move-result v20

    if-eqz v20, :cond_b

    const/16 v20, -0x1

    :goto_c
    add-int v3, v3, v20

    goto :goto_b

    :cond_b
    const/16 v20, 0x1

    goto :goto_c

    .line 547
    :cond_c
    int-to-char v0, v3

    move/from16 v20, v0

    aput-char v20, v11, v5

    .line 543
    add-int/lit8 v5, v5, 0x1

    goto :goto_a

    .line 540
    :cond_d
    add-int/lit8 v17, v17, 0x1

    goto :goto_9

    .line 552
    .end local v3    # "curr":I
    .end local v11    # "len_t":[C
    :cond_e
    move-object/from16 v0, p0

    invoke-direct {v0, v2, v12}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->createHuffmanDecodingTables(II)V

    .line 553
    return-void
.end method

.method private setupBlock()V
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v10, 0x100

    const/4 v9, 0x0

    .line 809
    iget-object v6, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->data:Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;

    if-nez v6, :cond_0

    .line 844
    :goto_0
    return-void

    .line 813
    :cond_0
    iget-object v6, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->data:Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;

    iget-object v1, v6, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;->cftab:[I

    .line 814
    .local v1, "cftab":[I
    iget-object v6, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->data:Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;

    iget v7, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->last:I

    add-int/lit8 v7, v7, 0x1

    invoke-virtual {v6, v7}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;->initTT(I)[I

    move-result-object v5

    .line 815
    .local v5, "tt":[I
    iget-object v6, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->data:Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;

    iget-object v4, v6, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;->ll8:[B

    .line 816
    .local v4, "ll8":[B
    aput v9, v1, v9

    .line 817
    iget-object v6, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->data:Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;

    iget-object v6, v6, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;->unzftab:[I

    const/4 v7, 0x1

    invoke-static {v6, v9, v1, v7, v10}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 819
    const/4 v2, 0x1

    .local v2, "i":I
    aget v0, v1, v9

    .local v0, "c":I
    :goto_1
    if-gt v2, v10, :cond_1

    .line 820
    aget v6, v1, v2

    add-int/2addr v0, v6

    .line 821
    aput v0, v1, v2

    .line 819
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 824
    :cond_1
    const/4 v2, 0x0

    iget v3, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->last:I

    .local v3, "lastShadow":I
    :goto_2
    if-gt v2, v3, :cond_2

    .line 825
    aget-byte v6, v4, v2

    and-int/lit16 v6, v6, 0xff

    aget v7, v1, v6

    add-int/lit8 v8, v7, 0x1

    aput v8, v1, v6

    aput v2, v5, v7

    .line 824
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 828
    :cond_2
    iget v6, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->origPtr:I

    if-ltz v6, :cond_3

    iget v6, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->origPtr:I

    array-length v7, v5

    if-lt v6, v7, :cond_4

    .line 829
    :cond_3
    new-instance v6, Ljava/io/IOException;

    const-string/jumbo v7, "stream corrupted"

    invoke-direct {v6, v7}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 832
    :cond_4
    iget v6, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->origPtr:I

    aget v6, v5, v6

    iput v6, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_tPos:I

    .line 833
    iput v9, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_count:I

    .line 834
    iput v9, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_i2:I

    .line 835
    iput v10, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_ch2:I

    .line 837
    iget-boolean v6, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->blockRandomised:Z

    if-eqz v6, :cond_5

    .line 838
    iput v9, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_rNToGo:I

    .line 839
    iput v9, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_rTPos:I

    .line 840
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->setupRandPartA()V

    goto :goto_0

    .line 842
    :cond_5
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->setupNoRandPartA()V

    goto :goto_0
.end method

.method private setupNoRandPartA()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 872
    iget v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_i2:I

    iget v2, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->last:I

    if-gt v1, v2, :cond_0

    .line 873
    iget v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_ch2:I

    iput v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_chPrev:I

    .line 874
    iget-object v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->data:Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;

    iget-object v1, v1, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;->ll8:[B

    iget v2, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_tPos:I

    aget-byte v1, v1, v2

    and-int/lit16 v0, v1, 0xff

    .line 875
    .local v0, "su_ch2Shadow":I
    iput v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_ch2:I

    .line 876
    iget-object v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->data:Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;

    iget-object v1, v1, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;->tt:[I

    iget v2, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_tPos:I

    aget v1, v1, v2

    iput v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_tPos:I

    .line 877
    iget v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_i2:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_i2:I

    .line 878
    iput v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->currentChar:I

    .line 879
    const/4 v1, 0x6

    iput v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->currentState:I

    .line 880
    iget-object v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->crc:Lorg/apache/commons/compress/compressors/bzip2/CRC;

    invoke-virtual {v1, v0}, Lorg/apache/commons/compress/compressors/bzip2/CRC;->updateCRC(I)V

    .line 887
    .end local v0    # "su_ch2Shadow":I
    :goto_0
    return-void

    .line 882
    :cond_0
    const/4 v1, 0x5

    iput v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->currentState:I

    .line 883
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->endBlock()V

    .line 884
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->initBlock()V

    .line 885
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->setupBlock()V

    goto :goto_0
.end method

.method private setupNoRandPartB()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 931
    iget v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_ch2:I

    iget v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_chPrev:I

    if-eq v0, v1, :cond_0

    .line 932
    const/4 v0, 0x1

    iput v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_count:I

    .line 933
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->setupNoRandPartA()V

    .line 942
    :goto_0
    return-void

    .line 934
    :cond_0
    iget v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_count:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_count:I

    const/4 v1, 0x4

    if-lt v0, v1, :cond_1

    .line 935
    iget-object v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->data:Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;

    iget-object v0, v0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;->ll8:[B

    iget v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_tPos:I

    aget-byte v0, v0, v1

    and-int/lit16 v0, v0, 0xff

    int-to-char v0, v0

    iput-char v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_z:C

    .line 936
    iget-object v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->data:Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;

    iget-object v0, v0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;->tt:[I

    iget v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_tPos:I

    aget v0, v0, v1

    iput v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_tPos:I

    .line 937
    const/4 v0, 0x0

    iput v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_j2:I

    .line 938
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->setupNoRandPartC()V

    goto :goto_0

    .line 940
    :cond_1
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->setupNoRandPartA()V

    goto :goto_0
.end method

.method private setupNoRandPartC()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 945
    iget v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_j2:I

    iget-char v2, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_z:C

    if-ge v1, v2, :cond_0

    .line 946
    iget v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_ch2:I

    .line 947
    .local v0, "su_ch2Shadow":I
    iput v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->currentChar:I

    .line 948
    iget-object v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->crc:Lorg/apache/commons/compress/compressors/bzip2/CRC;

    invoke-virtual {v1, v0}, Lorg/apache/commons/compress/compressors/bzip2/CRC;->updateCRC(I)V

    .line 949
    iget v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_j2:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_j2:I

    .line 950
    const/4 v1, 0x7

    iput v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->currentState:I

    .line 956
    .end local v0    # "su_ch2Shadow":I
    :goto_0
    return-void

    .line 952
    :cond_0
    iget v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_i2:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_i2:I

    .line 953
    const/4 v1, 0x0

    iput v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_count:I

    .line 954
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->setupNoRandPartA()V

    goto :goto_0
.end method

.method private setupRandPartA()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 847
    iget v3, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_i2:I

    iget v4, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->last:I

    if-gt v3, v4, :cond_3

    .line 848
    iget v3, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_ch2:I

    iput v3, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_chPrev:I

    .line 849
    iget-object v3, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->data:Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;

    iget-object v3, v3, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;->ll8:[B

    iget v4, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_tPos:I

    aget-byte v3, v3, v4

    and-int/lit16 v0, v3, 0xff

    .line 850
    .local v0, "su_ch2Shadow":I
    iget-object v3, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->data:Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;

    iget-object v3, v3, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;->tt:[I

    iget v4, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_tPos:I

    aget v3, v3, v4

    iput v3, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_tPos:I

    .line 851
    iget v3, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_rNToGo:I

    if-nez v3, :cond_1

    .line 852
    iget v3, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_rTPos:I

    invoke-static {v3}, Lorg/apache/commons/compress/compressors/bzip2/Rand;->rNums(I)I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    iput v3, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_rNToGo:I

    .line 853
    iget v3, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_rTPos:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_rTPos:I

    const/16 v4, 0x200

    if-ne v3, v4, :cond_0

    .line 854
    iput v2, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_rTPos:I

    .line 859
    :cond_0
    :goto_0
    iget v3, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_rNToGo:I

    if-ne v3, v1, :cond_2

    :goto_1
    xor-int/2addr v0, v1

    iput v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_ch2:I

    .line 860
    iget v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_i2:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_i2:I

    .line 861
    iput v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->currentChar:I

    .line 862
    const/4 v1, 0x3

    iput v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->currentState:I

    .line 863
    iget-object v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->crc:Lorg/apache/commons/compress/compressors/bzip2/CRC;

    invoke-virtual {v1, v0}, Lorg/apache/commons/compress/compressors/bzip2/CRC;->updateCRC(I)V

    .line 869
    .end local v0    # "su_ch2Shadow":I
    :goto_2
    return-void

    .line 857
    .restart local v0    # "su_ch2Shadow":I
    :cond_1
    iget v3, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_rNToGo:I

    add-int/lit8 v3, v3, -0x1

    iput v3, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_rNToGo:I

    goto :goto_0

    :cond_2
    move v1, v2

    .line 859
    goto :goto_1

    .line 865
    .end local v0    # "su_ch2Shadow":I
    :cond_3
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->endBlock()V

    .line 866
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->initBlock()V

    .line 867
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->setupBlock()V

    goto :goto_2
.end method

.method private setupRandPartB()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x4

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 890
    iget v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_ch2:I

    iget v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_chPrev:I

    if-eq v0, v1, :cond_0

    .line 891
    iput v4, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->currentState:I

    .line 892
    iput v3, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_count:I

    .line 893
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->setupRandPartA()V

    .line 915
    :goto_0
    return-void

    .line 894
    :cond_0
    iget v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_count:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_count:I

    if-lt v0, v5, :cond_4

    .line 895
    iget-object v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->data:Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;

    iget-object v0, v0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;->ll8:[B

    iget v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_tPos:I

    aget-byte v0, v0, v1

    and-int/lit16 v0, v0, 0xff

    int-to-char v0, v0

    iput-char v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_z:C

    .line 896
    iget-object v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->data:Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;

    iget-object v0, v0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;->tt:[I

    iget v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_tPos:I

    aget v0, v0, v1

    iput v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_tPos:I

    .line 897
    iget v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_rNToGo:I

    if-nez v0, :cond_3

    .line 898
    iget v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_rTPos:I

    invoke-static {v0}, Lorg/apache/commons/compress/compressors/bzip2/Rand;->rNums(I)I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_rNToGo:I

    .line 899
    iget v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_rTPos:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_rTPos:I

    const/16 v1, 0x200

    if-ne v0, v1, :cond_1

    .line 900
    iput v2, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_rTPos:I

    .line 905
    :cond_1
    :goto_1
    iput v2, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_j2:I

    .line 906
    iput v5, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->currentState:I

    .line 907
    iget v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_rNToGo:I

    if-ne v0, v3, :cond_2

    .line 908
    iget-char v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_z:C

    xor-int/lit8 v0, v0, 0x1

    int-to-char v0, v0

    iput-char v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_z:C

    .line 910
    :cond_2
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->setupRandPartC()V

    goto :goto_0

    .line 903
    :cond_3
    iget v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_rNToGo:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_rNToGo:I

    goto :goto_1

    .line 912
    :cond_4
    iput v4, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->currentState:I

    .line 913
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->setupRandPartA()V

    goto :goto_0
.end method

.method private setupRandPartC()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 918
    iget v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_j2:I

    iget-char v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_z:C

    if-ge v0, v1, :cond_0

    .line 919
    iget v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_ch2:I

    iput v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->currentChar:I

    .line 920
    iget-object v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->crc:Lorg/apache/commons/compress/compressors/bzip2/CRC;

    iget v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_ch2:I

    invoke-virtual {v0, v1}, Lorg/apache/commons/compress/compressors/bzip2/CRC;->updateCRC(I)V

    .line 921
    iget v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_j2:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_j2:I

    .line 928
    :goto_0
    return-void

    .line 923
    :cond_0
    const/4 v0, 0x2

    iput v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->currentState:I

    .line 924
    iget v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_i2:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_i2:I

    .line 925
    const/4 v0, 0x0

    iput v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_count:I

    .line 926
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->setupRandPartA()V

    goto :goto_0
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

    .line 368
    iget-object v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->in:Ljava/io/InputStream;

    .line 369
    .local v0, "inShadow":Ljava/io/InputStream;
    if-eqz v0, :cond_1

    .line 371
    :try_start_0
    sget-object v1, Ljava/lang/System;->in:Ljava/io/InputStream;

    if-eq v0, v1, :cond_0

    .line 372
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 375
    :cond_0
    iput-object v2, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->data:Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;

    .line 376
    iput-object v2, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->in:Ljava/io/InputStream;

    .line 379
    :cond_1
    return-void

    .line 375
    :catchall_0
    move-exception v1

    iput-object v2, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->data:Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;

    .line 376
    iput-object v2, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->in:Ljava/io/InputStream;

    throw v1
.end method

.method public read()I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 146
    iget-object v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->in:Ljava/io/InputStream;

    if-eqz v1, :cond_1

    .line 147
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->read0()I

    move-result v0

    .line 148
    .local v0, "r":I
    if-gez v0, :cond_0

    const/4 v1, -0x1

    :goto_0
    invoke-virtual {p0, v1}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->count(I)V

    .line 149
    return v0

    .line 148
    :cond_0
    const/4 v1, 0x1

    goto :goto_0

    .line 151
    .end local v0    # "r":I
    :cond_1
    new-instance v1, Ljava/io/IOException;

    const-string/jumbo v2, "stream closed"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public read([BII)I
    .locals 8
    .param p1, "dest"    # [B
    .param p2, "offs"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 163
    if-gez p2, :cond_0

    .line 164
    new-instance v5, Ljava/lang/IndexOutOfBoundsException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "offs("

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, ") < 0."

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 166
    :cond_0
    if-gez p3, :cond_1

    .line 167
    new-instance v5, Ljava/lang/IndexOutOfBoundsException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "len("

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, ") < 0."

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 169
    :cond_1
    add-int v5, p2, p3

    array-length v6, p1

    if-le v5, v6, :cond_2

    .line 170
    new-instance v5, Ljava/lang/IndexOutOfBoundsException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "offs("

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, ") + len("

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, ") > dest.length("

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    array-length v7, p1

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, ")."

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 173
    :cond_2
    iget-object v5, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->in:Ljava/io/InputStream;

    if-nez v5, :cond_3

    .line 174
    new-instance v5, Ljava/io/IOException;

    const-string/jumbo v6, "stream closed"

    invoke-direct {v5, v6}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 177
    :cond_3
    add-int v4, p2, p3

    .line 178
    .local v4, "hi":I
    move v2, p2

    .local v2, "destOffs":I
    move v3, v2

    .line 179
    .end local v2    # "destOffs":I
    .local v3, "destOffs":I
    :goto_0
    if-ge v3, v4, :cond_4

    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->read0()I

    move-result v0

    .local v0, "b":I
    if-ltz v0, :cond_4

    .line 180
    add-int/lit8 v2, v3, 0x1

    .end local v3    # "destOffs":I
    .restart local v2    # "destOffs":I
    int-to-byte v5, v0

    aput-byte v5, p1, v3

    move v3, v2

    .end local v2    # "destOffs":I
    .restart local v3    # "destOffs":I
    goto :goto_0

    .line 183
    .end local v0    # "b":I
    :cond_4
    if-ne v3, p2, :cond_5

    const/4 v1, -0x1

    .line 184
    .local v1, "c":I
    :goto_1
    invoke-virtual {p0, v1}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->count(I)V

    .line 185
    return v1

    .line 183
    .end local v1    # "c":I
    :cond_5
    sub-int v1, v3, p2

    goto :goto_1
.end method
