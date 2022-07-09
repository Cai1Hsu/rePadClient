.class public Lorg/apache/tools/bzip2/CBZip2InputStream;
.super Ljava/io/InputStream;
.source "CBZip2InputStream.java"

# interfaces
.implements Lorg/apache/tools/bzip2/BZip2Constants;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/bzip2/CBZip2InputStream$Data;
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

.field private final crc:Lorg/apache/tools/bzip2/CRC;

.field private currentChar:I

.field private currentState:I

.field private data:Lorg/apache/tools/bzip2/CBZip2InputStream$Data;

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
    .line 146
    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    .line 90
    new-instance v0, Lorg/apache/tools/bzip2/CRC;

    invoke-direct {v0}, Lorg/apache/tools/bzip2/CRC;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->crc:Lorg/apache/tools/bzip2/CRC;

    .line 96
    const/4 v0, -0x1

    iput v0, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->currentChar:I

    .line 107
    const/4 v0, 0x1

    iput v0, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->currentState:I

    .line 148
    iput-object p1, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->in:Ljava/io/InputStream;

    .line 149
    invoke-direct {p0}, Lorg/apache/tools/bzip2/CBZip2InputStream;->init()V

    .line 150
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

    .line 365
    iget v1, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->bsLive:I

    .line 366
    .local v1, "bsLiveShadow":I
    iget v0, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->bsBuff:I

    .line 368
    .local v0, "bsBuffShadow":I
    if-ge v1, v3, :cond_1

    .line 369
    iget-object v4, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v4}, Ljava/io/InputStream;->read()I

    move-result v2

    .line 371
    .local v2, "thech":I
    if-gez v2, :cond_0

    .line 372
    new-instance v3, Ljava/io/IOException;

    const-string/jumbo v4, "unexpected end of stream"

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 375
    :cond_0
    shl-int/lit8 v4, v0, 0x8

    or-int v0, v4, v2

    .line 376
    add-int/lit8 v1, v1, 0x8

    .line 377
    iput v0, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->bsBuff:I

    .line 380
    .end local v2    # "thech":I
    :cond_1
    add-int/lit8 v4, v1, -0x1

    iput v4, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->bsLive:I

    .line 381
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

    .line 389
    invoke-direct {p0, v2}, Lorg/apache/tools/bzip2/CBZip2InputStream;->bsR(I)I

    move-result v0

    shl-int/lit8 v0, v0, 0x8

    invoke-direct {p0, v2}, Lorg/apache/tools/bzip2/CBZip2InputStream;->bsR(I)I

    move-result v1

    or-int/2addr v0, v1

    shl-int/lit8 v0, v0, 0x8

    invoke-direct {p0, v2}, Lorg/apache/tools/bzip2/CBZip2InputStream;->bsR(I)I

    move-result v1

    or-int/2addr v0, v1

    shl-int/lit8 v0, v0, 0x8

    invoke-direct {p0, v2}, Lorg/apache/tools/bzip2/CBZip2InputStream;->bsR(I)I

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
    .line 385
    const/16 v0, 0x8

    invoke-direct {p0, v0}, Lorg/apache/tools/bzip2/CBZip2InputStream;->bsR(I)I

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
    .line 341
    iget v1, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->bsLive:I

    .line 342
    .local v1, "bsLiveShadow":I
    iget v0, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->bsBuff:I

    .line 344
    .local v0, "bsBuffShadow":I
    if-ge v1, p1, :cond_2

    .line 345
    iget-object v2, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->in:Ljava/io/InputStream;

    .line 347
    .local v2, "inShadow":Ljava/io/InputStream;
    :cond_0
    invoke-virtual {v2}, Ljava/io/InputStream;->read()I

    move-result v3

    .line 349
    .local v3, "thech":I
    if-gez v3, :cond_1

    .line 350
    new-instance v4, Ljava/io/IOException;

    const-string/jumbo v5, "unexpected end of stream"

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 353
    :cond_1
    shl-int/lit8 v4, v0, 0x8

    or-int v0, v4, v3

    .line 354
    add-int/lit8 v1, v1, 0x8

    .line 355
    if-lt v1, p1, :cond_0

    .line 357
    iput v0, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->bsBuff:I

    .line 360
    .end local v2    # "inShadow":Ljava/io/InputStream;
    .end local v3    # "thech":I
    :cond_2
    sub-int v4, v1, p1

    iput v4, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->bsLive:I

    .line 361
    sub-int v4, v1, p1

    shr-int v4, v0, v4

    const/4 v5, 0x1

    shl-int/2addr v5, p1

    add-int/lit8 v5, v5, -0x1

    and-int/2addr v4, v5

    return v4
.end method

.method private complete()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 317
    invoke-direct {p0}, Lorg/apache/tools/bzip2/CBZip2InputStream;->bsGetInt()I

    move-result v0

    iput v0, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->storedCombinedCRC:I

    .line 318
    const/4 v0, 0x0

    iput v0, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->currentState:I

    .line 319
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->data:Lorg/apache/tools/bzip2/CBZip2InputStream$Data;

    .line 321
    iget v0, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->storedCombinedCRC:I

    iget v1, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->computedCombinedCRC:I

    if-eq v0, v1, :cond_0

    .line 322
    invoke-static {}, Lorg/apache/tools/bzip2/CBZip2InputStream;->reportCRCError()V

    .line 324
    :cond_0
    return-void
.end method

.method private createHuffmanDecodingTables(II)V
    .locals 19
    .param p1, "alphaSize"    # I
    .param p2, "nGroups"    # I

    .prologue
    .line 523
    move-object/from16 v0, p0

    iget-object v10, v0, Lorg/apache/tools/bzip2/CBZip2InputStream;->data:Lorg/apache/tools/bzip2/CBZip2InputStream$Data;

    .line 524
    .local v10, "dataShadow":Lorg/apache/tools/bzip2/CBZip2InputStream$Data;
    iget-object v12, v10, Lorg/apache/tools/bzip2/CBZip2InputStream$Data;->temp_charArray2d:[[C

    .line 525
    .local v12, "len":[[C
    iget-object v0, v10, Lorg/apache/tools/bzip2/CBZip2InputStream$Data;->minLens:[I

    move-object/from16 v16, v0

    .line 526
    .local v16, "minLens":[I
    iget-object v15, v10, Lorg/apache/tools/bzip2/CBZip2InputStream$Data;->limit:[[I

    .line 527
    .local v15, "limit":[[I
    iget-object v9, v10, Lorg/apache/tools/bzip2/CBZip2InputStream$Data;->base:[[I

    .line 528
    .local v9, "base":[[I
    iget-object v0, v10, Lorg/apache/tools/bzip2/CBZip2InputStream$Data;->perm:[[I

    move-object/from16 v17, v0

    .line 530
    .local v17, "perm":[[I
    const/16 v18, 0x0

    .local v18, "t":I
    :goto_0
    move/from16 v0, v18

    move/from16 v1, p2

    if-ge v0, v1, :cond_3

    .line 531
    const/16 v6, 0x20

    .line 532
    .local v6, "minLen":I
    const/4 v7, 0x0

    .line 533
    .local v7, "maxLen":I
    aget-object v13, v12, v18

    .line 534
    .local v13, "len_t":[C
    move/from16 v11, p1

    .local v11, "i":I
    :cond_0
    :goto_1
    add-int/lit8 v11, v11, -0x1

    if-ltz v11, :cond_2

    .line 535
    aget-char v14, v13, v11

    .line 536
    .local v14, "lent":C
    if-le v14, v7, :cond_1

    .line 537
    move v7, v14

    .line 539
    :cond_1
    if-ge v14, v6, :cond_0

    .line 540
    move v6, v14

    goto :goto_1

    .line 543
    .end local v14    # "lent":C
    :cond_2
    aget-object v2, v15, v18

    aget-object v3, v9, v18

    aget-object v4, v17, v18

    aget-object v5, v12, v18

    move/from16 v8, p1

    invoke-static/range {v2 .. v8}, Lorg/apache/tools/bzip2/CBZip2InputStream;->hbCreateDecodeTables([I[I[I[CIII)V

    .line 545
    aput v6, v16, v18

    .line 530
    add-int/lit8 v18, v18, 0x1

    goto :goto_0

    .line 547
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
    .line 296
    iget-object v0, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->crc:Lorg/apache/tools/bzip2/CRC;

    invoke-virtual {v0}, Lorg/apache/tools/bzip2/CRC;->getFinalCRC()I

    move-result v0

    iput v0, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->computedBlockCRC:I

    .line 299
    iget v0, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->storedBlockCRC:I

    iget v1, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->computedBlockCRC:I

    if-eq v0, v1, :cond_0

    .line 302
    iget v0, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->storedCombinedCRC:I

    shl-int/lit8 v0, v0, 0x1

    iget v1, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->storedCombinedCRC:I

    ushr-int/lit8 v1, v1, 0x1f

    or-int/2addr v0, v1

    iput v0, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->computedCombinedCRC:I

    .line 305
    iget v0, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->computedCombinedCRC:I

    iget v1, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->storedBlockCRC:I

    xor-int/2addr v0, v1

    iput v0, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->computedCombinedCRC:I

    .line 307
    invoke-static {}, Lorg/apache/tools/bzip2/CBZip2InputStream;->reportCRCError()V

    .line 310
    :cond_0
    iget v0, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->computedCombinedCRC:I

    shl-int/lit8 v0, v0, 0x1

    iget v1, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->computedCombinedCRC:I

    ushr-int/lit8 v1, v1, 0x1f

    or-int/2addr v0, v1

    iput v0, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->computedCombinedCRC:I

    .line 313
    iget v0, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->computedCombinedCRC:I

    iget v1, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->computedBlockCRC:I

    xor-int/2addr v0, v1

    iput v0, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->computedCombinedCRC:I

    .line 314
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
    .line 550
    const/16 v40, 0x18

    move-object/from16 v0, p0

    move/from16 v1, v40

    invoke-direct {v0, v1}, Lorg/apache/tools/bzip2/CBZip2InputStream;->bsR(I)I

    move-result v40

    move/from16 v0, v40

    move-object/from16 v1, p0

    iput v0, v1, Lorg/apache/tools/bzip2/CBZip2InputStream;->origPtr:I

    .line 551
    invoke-direct/range {p0 .. p0}, Lorg/apache/tools/bzip2/CBZip2InputStream;->recvDecodingTables()V

    .line 553
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/apache/tools/bzip2/CBZip2InputStream;->in:Ljava/io/InputStream;

    .line 554
    .local v15, "inShadow":Ljava/io/InputStream;
    move-object/from16 v0, p0

    iget-object v10, v0, Lorg/apache/tools/bzip2/CBZip2InputStream;->data:Lorg/apache/tools/bzip2/CBZip2InputStream$Data;

    .line 555
    .local v10, "dataShadow":Lorg/apache/tools/bzip2/CBZip2InputStream$Data;
    iget-object v0, v10, Lorg/apache/tools/bzip2/CBZip2InputStream$Data;->ll8:[B

    move-object/from16 v22, v0

    .line 556
    .local v22, "ll8":[B
    iget-object v0, v10, Lorg/apache/tools/bzip2/CBZip2InputStream$Data;->unzftab:[I

    move-object/from16 v35, v0

    .line 557
    .local v35, "unzftab":[I
    iget-object v0, v10, Lorg/apache/tools/bzip2/CBZip2InputStream$Data;->selector:[B

    move-object/from16 v31, v0

    .line 558
    .local v31, "selector":[B
    iget-object v0, v10, Lorg/apache/tools/bzip2/CBZip2InputStream$Data;->seqToUnseq:[B

    move-object/from16 v32, v0

    .line 559
    .local v32, "seqToUnseq":[B
    iget-object v0, v10, Lorg/apache/tools/bzip2/CBZip2InputStream$Data;->getAndMoveToFrontDecode_yy:[C

    move-object/from16 v36, v0

    .line 560
    .local v36, "yy":[C
    iget-object v0, v10, Lorg/apache/tools/bzip2/CBZip2InputStream$Data;->minLens:[I

    move-object/from16 v23, v0

    .line 561
    .local v23, "minLens":[I
    iget-object v0, v10, Lorg/apache/tools/bzip2/CBZip2InputStream$Data;->limit:[[I

    move-object/from16 v19, v0

    .line 562
    .local v19, "limit":[[I
    iget-object v5, v10, Lorg/apache/tools/bzip2/CBZip2InputStream$Data;->base:[[I

    .line 563
    .local v5, "base":[[I
    iget-object v0, v10, Lorg/apache/tools/bzip2/CBZip2InputStream$Data;->perm:[[I

    move-object/from16 v27, v0

    .line 564
    .local v27, "perm":[[I
    move-object/from16 v0, p0

    iget v0, v0, Lorg/apache/tools/bzip2/CBZip2InputStream;->blockSize100k:I

    move/from16 v40, v0

    const v41, 0x186a0

    mul-int v20, v40, v41

    .line 572
    .local v20, "limitLast":I
    const/16 v14, 0x100

    .local v14, "i":I
    :goto_0
    add-int/lit8 v14, v14, -0x1

    if-ltz v14, :cond_0

    .line 573
    int-to-char v0, v14

    move/from16 v40, v0

    aput-char v40, v36, v14

    .line 574
    const/16 v40, 0x0

    aput v40, v35, v14

    goto :goto_0

    .line 577
    :cond_0
    const/4 v12, 0x0

    .line 578
    .local v12, "groupNo":I
    const/16 v13, 0x31

    .line 579
    .local v13, "groupPos":I
    move-object/from16 v0, p0

    iget v0, v0, Lorg/apache/tools/bzip2/CBZip2InputStream;->nInUse:I

    move/from16 v40, v0

    add-int/lit8 v11, v40, 0x1

    .line 580
    .local v11, "eob":I
    const/16 v40, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v40

    invoke-direct {v0, v1}, Lorg/apache/tools/bzip2/CBZip2InputStream;->getAndMoveToFrontDecode0(I)I

    move-result v26

    .line 581
    .local v26, "nextSym":I
    move-object/from16 v0, p0

    iget v7, v0, Lorg/apache/tools/bzip2/CBZip2InputStream;->bsBuff:I

    .line 582
    .local v7, "bsBuffShadow":I
    move-object/from16 v0, p0

    iget v8, v0, Lorg/apache/tools/bzip2/CBZip2InputStream;->bsLive:I

    .line 583
    .local v8, "bsLiveShadow":I
    const/16 v18, -0x1

    .line 584
    .local v18, "lastShadow":I
    aget-byte v40, v31, v12

    move/from16 v0, v40

    and-int/lit16 v0, v0, 0xff

    move/from16 v38, v0

    .line 585
    .local v38, "zt":I
    aget-object v6, v5, v38

    .line 586
    .local v6, "base_zt":[I
    aget-object v21, v19, v38

    .line 587
    .local v21, "limit_zt":[I
    aget-object v28, v27, v38

    .line 588
    .local v28, "perm_zt":[I
    aget v24, v23, v38

    .line 590
    .local v24, "minLens_zt":I
    :cond_1
    :goto_1
    move/from16 v0, v26

    if-eq v0, v11, :cond_16

    .line 591
    if-eqz v26, :cond_2

    const/16 v40, 0x1

    move/from16 v0, v26

    move/from16 v1, v40

    if-ne v0, v1, :cond_c

    .line 592
    :cond_2
    const/16 v29, -0x1

    .line 594
    .local v29, "s":I
    const/16 v25, 0x1

    .line 595
    .local v25, "n":I
    :goto_2
    if-nez v26, :cond_3

    .line 596
    add-int v29, v29, v25

    .line 603
    :goto_3
    if-nez v13, :cond_4

    .line 604
    const/16 v13, 0x31

    .line 605
    add-int/lit8 v12, v12, 0x1

    aget-byte v40, v31, v12

    move/from16 v0, v40

    and-int/lit16 v0, v0, 0xff

    move/from16 v38, v0

    .line 606
    aget-object v6, v5, v38

    .line 607
    aget-object v21, v19, v38

    .line 608
    aget-object v28, v27, v38

    .line 609
    aget v24, v23, v38

    .line 614
    :goto_4
    move/from16 v37, v24

    .line 618
    .local v37, "zn":I
    :goto_5
    move/from16 v0, v37

    if-ge v8, v0, :cond_6

    .line 619
    invoke-virtual {v15}, Ljava/io/InputStream;->read()I

    move-result v33

    .line 620
    .local v33, "thech":I
    if-ltz v33, :cond_5

    .line 621
    shl-int/lit8 v40, v7, 0x8

    or-int v7, v40, v33

    .line 622
    add-int/lit8 v8, v8, 0x8

    .line 623
    goto :goto_5

    .line 597
    .end local v33    # "thech":I
    .end local v37    # "zn":I
    :cond_3
    const/16 v40, 0x1

    move/from16 v0, v26

    move/from16 v1, v40

    if-ne v0, v1, :cond_a

    .line 598
    shl-int/lit8 v40, v25, 0x1

    add-int v29, v29, v40

    goto :goto_3

    .line 611
    :cond_4
    add-int/lit8 v13, v13, -0x1

    goto :goto_4

    .line 625
    .restart local v33    # "thech":I
    .restart local v37    # "zn":I
    :cond_5
    new-instance v40, Ljava/io/IOException;

    const-string/jumbo v41, "unexpected end of stream"

    invoke-direct/range {v40 .. v41}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v40

    .line 628
    .end local v33    # "thech":I
    :cond_6
    sub-int v40, v8, v37

    shr-int v40, v7, v40

    const/16 v41, 0x1

    shl-int v41, v41, v37

    add-int/lit8 v41, v41, -0x1

    and-int v39, v40, v41

    .line 629
    .local v39, "zvec":I
    sub-int v8, v8, v37

    .line 631
    :goto_6
    aget v40, v21, v37

    move/from16 v0, v39

    move/from16 v1, v40

    if-le v0, v1, :cond_9

    .line 632
    add-int/lit8 v37, v37, 0x1

    .line 633
    :goto_7
    const/16 v40, 0x1

    move/from16 v0, v40

    if-ge v8, v0, :cond_8

    .line 634
    invoke-virtual {v15}, Ljava/io/InputStream;->read()I

    move-result v33

    .line 635
    .restart local v33    # "thech":I
    if-ltz v33, :cond_7

    .line 636
    shl-int/lit8 v40, v7, 0x8

    or-int v7, v40, v33

    .line 637
    add-int/lit8 v8, v8, 0x8

    .line 638
    goto :goto_7

    .line 640
    :cond_7
    new-instance v40, Ljava/io/IOException;

    const-string/jumbo v41, "unexpected end of stream"

    invoke-direct/range {v40 .. v41}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v40

    .line 643
    .end local v33    # "thech":I
    :cond_8
    add-int/lit8 v8, v8, -0x1

    .line 644
    shl-int/lit8 v40, v39, 0x1

    shr-int v41, v7, v8

    and-int/lit8 v41, v41, 0x1

    or-int v39, v40, v41

    goto :goto_6

    .line 646
    :cond_9
    aget v40, v6, v37

    sub-int v40, v39, v40

    aget v26, v28, v40

    .line 594
    shl-int/lit8 v25, v25, 0x1

    goto/16 :goto_2

    .line 649
    .end local v37    # "zn":I
    .end local v39    # "zvec":I
    :cond_a
    const/16 v40, 0x0

    aget-char v40, v36, v40

    aget-byte v9, v32, v40

    .line 650
    .local v9, "ch":B
    and-int/lit16 v0, v9, 0xff

    move/from16 v40, v0

    aget v41, v35, v40

    add-int/lit8 v42, v29, 0x1

    add-int v41, v41, v42

    aput v41, v35, v40

    move/from16 v30, v29

    .line 652
    .end local v29    # "s":I
    .local v30, "s":I
    :goto_8
    add-int/lit8 v29, v30, -0x1

    .end local v30    # "s":I
    .restart local v29    # "s":I
    if-ltz v30, :cond_b

    .line 653
    add-int/lit8 v18, v18, 0x1

    aput-byte v9, v22, v18

    move/from16 v30, v29

    .end local v29    # "s":I
    .restart local v30    # "s":I
    goto :goto_8

    .line 656
    .end local v30    # "s":I
    .restart local v29    # "s":I
    :cond_b
    move/from16 v0, v18

    move/from16 v1, v20

    if-lt v0, v1, :cond_1

    .line 657
    new-instance v40, Ljava/io/IOException;

    const-string/jumbo v41, "block overrun"

    invoke-direct/range {v40 .. v41}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v40

    .line 660
    .end local v9    # "ch":B
    .end local v25    # "n":I
    .end local v29    # "s":I
    :cond_c
    add-int/lit8 v18, v18, 0x1

    move/from16 v0, v18

    move/from16 v1, v20

    if-lt v0, v1, :cond_d

    .line 661
    new-instance v40, Ljava/io/IOException;

    const-string/jumbo v41, "block overrun"

    invoke-direct/range {v40 .. v41}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v40

    .line 664
    :cond_d
    add-int/lit8 v40, v26, -0x1

    aget-char v34, v36, v40

    .line 665
    .local v34, "tmp":C
    aget-byte v40, v32, v34

    move/from16 v0, v40

    and-int/lit16 v0, v0, 0xff

    move/from16 v40, v0

    aget v41, v35, v40

    add-int/lit8 v41, v41, 0x1

    aput v41, v35, v40

    .line 666
    aget-byte v40, v32, v34

    aput-byte v40, v22, v18

    .line 673
    const/16 v40, 0x10

    move/from16 v0, v26

    move/from16 v1, v40

    if-gt v0, v1, :cond_e

    .line 674
    add-int/lit8 v16, v26, -0x1

    .local v16, "j":I
    move/from16 v17, v16

    .end local v16    # "j":I
    .local v17, "j":I
    :goto_9
    if-lez v17, :cond_f

    .line 675
    add-int/lit8 v16, v17, -0x1

    .end local v17    # "j":I
    .restart local v16    # "j":I
    aget-char v40, v36, v16

    aput-char v40, v36, v17

    move/from16 v17, v16

    .end local v16    # "j":I
    .restart local v17    # "j":I
    goto :goto_9

    .line 678
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

    .line 681
    :cond_f
    const/16 v40, 0x0

    aput-char v34, v36, v40

    .line 683
    if-nez v13, :cond_10

    .line 684
    const/16 v13, 0x31

    .line 685
    add-int/lit8 v12, v12, 0x1

    aget-byte v40, v31, v12

    move/from16 v0, v40

    and-int/lit16 v0, v0, 0xff

    move/from16 v38, v0

    .line 686
    aget-object v6, v5, v38

    .line 687
    aget-object v21, v19, v38

    .line 688
    aget-object v28, v27, v38

    .line 689
    aget v24, v23, v38

    .line 694
    :goto_a
    move/from16 v37, v24

    .line 698
    .restart local v37    # "zn":I
    :goto_b
    move/from16 v0, v37

    if-ge v8, v0, :cond_12

    .line 699
    invoke-virtual {v15}, Ljava/io/InputStream;->read()I

    move-result v33

    .line 700
    .restart local v33    # "thech":I
    if-ltz v33, :cond_11

    .line 701
    shl-int/lit8 v40, v7, 0x8

    or-int v7, v40, v33

    .line 702
    add-int/lit8 v8, v8, 0x8

    .line 703
    goto :goto_b

    .line 691
    .end local v33    # "thech":I
    .end local v37    # "zn":I
    :cond_10
    add-int/lit8 v13, v13, -0x1

    goto :goto_a

    .line 705
    .restart local v33    # "thech":I
    .restart local v37    # "zn":I
    :cond_11
    new-instance v40, Ljava/io/IOException;

    const-string/jumbo v41, "unexpected end of stream"

    invoke-direct/range {v40 .. v41}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v40

    .line 708
    .end local v33    # "thech":I
    :cond_12
    sub-int v40, v8, v37

    shr-int v40, v7, v40

    const/16 v41, 0x1

    shl-int v41, v41, v37

    add-int/lit8 v41, v41, -0x1

    and-int v39, v40, v41

    .line 709
    .restart local v39    # "zvec":I
    sub-int v8, v8, v37

    .line 711
    :goto_c
    aget v40, v21, v37

    move/from16 v0, v39

    move/from16 v1, v40

    if-le v0, v1, :cond_15

    .line 712
    add-int/lit8 v37, v37, 0x1

    .line 713
    :goto_d
    const/16 v40, 0x1

    move/from16 v0, v40

    if-ge v8, v0, :cond_14

    .line 714
    invoke-virtual {v15}, Ljava/io/InputStream;->read()I

    move-result v33

    .line 715
    .restart local v33    # "thech":I
    if-ltz v33, :cond_13

    .line 716
    shl-int/lit8 v40, v7, 0x8

    or-int v7, v40, v33

    .line 717
    add-int/lit8 v8, v8, 0x8

    .line 718
    goto :goto_d

    .line 720
    :cond_13
    new-instance v40, Ljava/io/IOException;

    const-string/jumbo v41, "unexpected end of stream"

    invoke-direct/range {v40 .. v41}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v40

    .line 723
    .end local v33    # "thech":I
    :cond_14
    add-int/lit8 v8, v8, -0x1

    .line 724
    shl-int/lit8 v40, v39, 0x1

    shr-int v41, v7, v8

    and-int/lit8 v41, v41, 0x1

    or-int v39, v40, v41

    goto :goto_c

    .line 726
    :cond_15
    aget v40, v6, v37

    sub-int v40, v39, v40

    aget v26, v28, v40

    goto/16 :goto_1

    .line 730
    .end local v34    # "tmp":C
    .end local v37    # "zn":I
    .end local v39    # "zvec":I
    :cond_16
    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lorg/apache/tools/bzip2/CBZip2InputStream;->last:I

    .line 731
    move-object/from16 v0, p0

    iput v8, v0, Lorg/apache/tools/bzip2/CBZip2InputStream;->bsLive:I

    .line 732
    move-object/from16 v0, p0

    iput v7, v0, Lorg/apache/tools/bzip2/CBZip2InputStream;->bsBuff:I

    .line 733
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
    .line 737
    iget-object v3, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->in:Ljava/io/InputStream;

    .line 738
    .local v3, "inShadow":Ljava/io/InputStream;
    iget-object v2, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->data:Lorg/apache/tools/bzip2/CBZip2InputStream$Data;

    .line 739
    .local v2, "dataShadow":Lorg/apache/tools/bzip2/CBZip2InputStream$Data;
    iget-object v9, v2, Lorg/apache/tools/bzip2/CBZip2InputStream$Data;->selector:[B

    aget-byte v9, v9, p1

    and-int/lit16 v7, v9, 0xff

    .line 740
    .local v7, "zt":I
    iget-object v9, v2, Lorg/apache/tools/bzip2/CBZip2InputStream$Data;->limit:[[I

    aget-object v4, v9, v7

    .line 741
    .local v4, "limit_zt":[I
    iget-object v9, v2, Lorg/apache/tools/bzip2/CBZip2InputStream$Data;->minLens:[I

    aget v6, v9, v7

    .line 742
    .local v6, "zn":I
    invoke-direct {p0, v6}, Lorg/apache/tools/bzip2/CBZip2InputStream;->bsR(I)I

    move-result v8

    .line 743
    .local v8, "zvec":I
    iget v1, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->bsLive:I

    .line 744
    .local v1, "bsLiveShadow":I
    iget v0, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->bsBuff:I

    .line 746
    .local v0, "bsBuffShadow":I
    :goto_0
    aget v9, v4, v6

    if-le v8, v9, :cond_2

    .line 747
    add-int/lit8 v6, v6, 0x1

    .line 748
    :goto_1
    const/4 v9, 0x1

    if-ge v1, v9, :cond_1

    .line 749
    invoke-virtual {v3}, Ljava/io/InputStream;->read()I

    move-result v5

    .line 751
    .local v5, "thech":I
    if-ltz v5, :cond_0

    .line 752
    shl-int/lit8 v9, v0, 0x8

    or-int v0, v9, v5

    .line 753
    add-int/lit8 v1, v1, 0x8

    .line 754
    goto :goto_1

    .line 756
    :cond_0
    new-instance v9, Ljava/io/IOException;

    const-string/jumbo v10, "unexpected end of stream"

    invoke-direct {v9, v10}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 759
    .end local v5    # "thech":I
    :cond_1
    add-int/lit8 v1, v1, -0x1

    .line 760
    shl-int/lit8 v9, v8, 0x1

    shr-int v10, v0, v1

    and-int/lit8 v10, v10, 0x1

    or-int v8, v9, v10

    goto :goto_0

    .line 763
    :cond_2
    iput v1, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->bsLive:I

    .line 764
    iput v0, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->bsBuff:I

    .line 766
    iget-object v9, v2, Lorg/apache/tools/bzip2/CBZip2InputStream$Data;->perm:[[I

    aget-object v9, v9, v7

    iget-object v10, v2, Lorg/apache/tools/bzip2/CBZip2InputStream$Data;->base:[[I

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
    .line 402
    move v1, p4

    .local v1, "i":I
    const/4 v4, 0x0

    .local v4, "pp":I
    :goto_0
    if-gt v1, p5, :cond_1

    .line 403
    const/4 v2, 0x0

    .local v2, "j":I
    move v5, v4

    .end local v4    # "pp":I
    .local v5, "pp":I
    :goto_1
    if-ge v2, p6, :cond_0

    .line 404
    aget-char v7, p3, v2

    if-ne v7, v1, :cond_7

    .line 405
    add-int/lit8 v4, v5, 0x1

    .end local v5    # "pp":I
    .restart local v4    # "pp":I
    aput v2, p2, v5

    .line 403
    :goto_2
    add-int/lit8 v2, v2, 0x1

    move v5, v4

    .end local v4    # "pp":I
    .restart local v5    # "pp":I
    goto :goto_1

    .line 402
    :cond_0
    add-int/lit8 v1, v1, 0x1

    move v4, v5

    .end local v5    # "pp":I
    .restart local v4    # "pp":I
    goto :goto_0

    .line 410
    .end local v2    # "j":I
    :cond_1
    const/16 v1, 0x17

    :goto_3
    add-int/lit8 v1, v1, -0x1

    if-lez v1, :cond_2

    .line 411
    const/4 v7, 0x0

    aput v7, p1, v1

    .line 412
    const/4 v7, 0x0

    aput v7, p0, v1

    goto :goto_3

    .line 415
    :cond_2
    const/4 v1, 0x0

    :goto_4
    if-ge v1, p6, :cond_3

    .line 416
    aget-char v7, p3, v1

    add-int/lit8 v7, v7, 0x1

    aget v8, p1, v7

    add-int/lit8 v8, v8, 0x1

    aput v8, p1, v7

    .line 415
    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    .line 419
    :cond_3
    const/4 v1, 0x1

    const/4 v7, 0x0

    aget v0, p1, v7

    .local v0, "b":I
    :goto_5
    const/16 v7, 0x17

    if-ge v1, v7, :cond_4

    .line 420
    aget v7, p1, v1

    add-int/2addr v0, v7

    .line 421
    aput v0, p1, v1

    .line 419
    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    .line 424
    :cond_4
    move v1, p4

    const/4 v6, 0x0

    .local v6, "vec":I
    aget v0, p1, v1

    :goto_6
    if-gt v1, p5, :cond_5

    .line 425
    add-int/lit8 v7, v1, 0x1

    aget v3, p1, v7

    .line 426
    .local v3, "nb":I
    sub-int v7, v3, v0

    add-int/2addr v6, v7

    .line 427
    move v0, v3

    .line 428
    add-int/lit8 v7, v6, -0x1

    aput v7, p0, v1

    .line 429
    shl-int/lit8 v6, v6, 0x1

    .line 424
    add-int/lit8 v1, v1, 0x1

    goto :goto_6

    .line 432
    .end local v3    # "nb":I
    :cond_5
    add-int/lit8 v1, p4, 0x1

    :goto_7
    if-gt v1, p5, :cond_6

    .line 433
    add-int/lit8 v7, v1, -0x1

    aget v7, p0, v7

    add-int/lit8 v7, v7, 0x1

    shl-int/lit8 v7, v7, 0x1

    aget v8, p1, v1

    sub-int/2addr v7, v8

    aput v7, p1, v1

    .line 432
    add-int/lit8 v1, v1, 0x1

    goto :goto_7

    .line 435
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

.method private init()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 226
    iget-object v2, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->in:Ljava/io/InputStream;

    if-nez v2, :cond_0

    .line 227
    new-instance v2, Ljava/io/IOException;

    const-string/jumbo v3, "No InputStream"

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 229
    :cond_0
    iget-object v2, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v2}, Ljava/io/InputStream;->available()I

    move-result v2

    if-nez v2, :cond_1

    .line 230
    new-instance v2, Ljava/io/IOException;

    const-string/jumbo v3, "Empty InputStream"

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 232
    :cond_1
    iget-object v2, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v2}, Ljava/io/InputStream;->read()I

    move-result v1

    .line 233
    .local v1, "magic2":I
    const/16 v2, 0x68

    if-eq v1, v2, :cond_2

    .line 234
    new-instance v2, Ljava/io/IOException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "Stream is not BZip2 formatted: expected \'h\' as first byte but got \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    int-to-char v4, v1

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, "\'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 239
    :cond_2
    iget-object v2, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v2}, Ljava/io/InputStream;->read()I

    move-result v0

    .line 240
    .local v0, "blockSize":I
    const/16 v2, 0x31

    if-lt v0, v2, :cond_3

    const/16 v2, 0x39

    if-le v0, v2, :cond_4

    .line 241
    :cond_3
    new-instance v2, Ljava/io/IOException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "Stream is not BZip2 formatted: illegal blocksize "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    int-to-char v4, v0

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 245
    :cond_4
    add-int/lit8 v2, v0, -0x30

    iput v2, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->blockSize100k:I

    .line 247
    invoke-direct {p0}, Lorg/apache/tools/bzip2/CBZip2InputStream;->initBlock()V

    .line 248
    invoke-direct {p0}, Lorg/apache/tools/bzip2/CBZip2InputStream;->setupBlock()V

    .line 249
    return-void
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

    .line 252
    invoke-direct {p0}, Lorg/apache/tools/bzip2/CBZip2InputStream;->bsGetUByte()C

    move-result v0

    .line 253
    .local v0, "magic0":C
    invoke-direct {p0}, Lorg/apache/tools/bzip2/CBZip2InputStream;->bsGetUByte()C

    move-result v1

    .line 254
    .local v1, "magic1":C
    invoke-direct {p0}, Lorg/apache/tools/bzip2/CBZip2InputStream;->bsGetUByte()C

    move-result v2

    .line 255
    .local v2, "magic2":C
    invoke-direct {p0}, Lorg/apache/tools/bzip2/CBZip2InputStream;->bsGetUByte()C

    move-result v3

    .line 256
    .local v3, "magic3":C
    invoke-direct {p0}, Lorg/apache/tools/bzip2/CBZip2InputStream;->bsGetUByte()C

    move-result v4

    .line 257
    .local v4, "magic4":C
    invoke-direct {p0}, Lorg/apache/tools/bzip2/CBZip2InputStream;->bsGetUByte()C

    move-result v5

    .line 259
    .local v5, "magic5":C
    const/16 v8, 0x17

    if-ne v0, v8, :cond_0

    const/16 v8, 0x72

    if-ne v1, v8, :cond_0

    const/16 v8, 0x45

    if-ne v2, v8, :cond_0

    const/16 v8, 0x38

    if-ne v3, v8, :cond_0

    const/16 v8, 0x50

    if-ne v4, v8, :cond_0

    const/16 v8, 0x90

    if-ne v5, v8, :cond_0

    .line 265
    invoke-direct {p0}, Lorg/apache/tools/bzip2/CBZip2InputStream;->complete()V

    .line 293
    :goto_0
    return-void

    .line 266
    :cond_0
    const/16 v8, 0x31

    if-ne v0, v8, :cond_1

    const/16 v8, 0x41

    if-ne v1, v8, :cond_1

    if-ne v2, v9, :cond_1

    const/16 v8, 0x26

    if-ne v3, v8, :cond_1

    const/16 v8, 0x53

    if-ne v4, v8, :cond_1

    if-eq v5, v9, :cond_2

    .line 273
    :cond_1
    iput v6, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->currentState:I

    .line 274
    new-instance v6, Ljava/io/IOException;

    const-string/jumbo v7, "bad block header"

    invoke-direct {v6, v7}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 276
    :cond_2
    invoke-direct {p0}, Lorg/apache/tools/bzip2/CBZip2InputStream;->bsGetInt()I

    move-result v8

    iput v8, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->storedBlockCRC:I

    .line 277
    invoke-direct {p0, v7}, Lorg/apache/tools/bzip2/CBZip2InputStream;->bsR(I)I

    move-result v8

    if-ne v8, v7, :cond_3

    move v6, v7

    :cond_3
    iput-boolean v6, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->blockRandomised:Z

    .line 283
    iget-object v6, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->data:Lorg/apache/tools/bzip2/CBZip2InputStream$Data;

    if-nez v6, :cond_4

    .line 284
    new-instance v6, Lorg/apache/tools/bzip2/CBZip2InputStream$Data;

    iget v8, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->blockSize100k:I

    invoke-direct {v6, v8}, Lorg/apache/tools/bzip2/CBZip2InputStream$Data;-><init>(I)V

    iput-object v6, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->data:Lorg/apache/tools/bzip2/CBZip2InputStream$Data;

    .line 288
    :cond_4
    invoke-direct {p0}, Lorg/apache/tools/bzip2/CBZip2InputStream;->getAndMoveToFrontDecode()V

    .line 290
    iget-object v6, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->crc:Lorg/apache/tools/bzip2/CRC;

    invoke-virtual {v6}, Lorg/apache/tools/bzip2/CRC;->initialiseCRC()V

    .line 291
    iput v7, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->currentState:I

    goto :goto_0
.end method

.method private makeMaps()V
    .locals 6

    .prologue
    .line 57
    iget-object v5, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->data:Lorg/apache/tools/bzip2/CBZip2InputStream$Data;

    iget-object v1, v5, Lorg/apache/tools/bzip2/CBZip2InputStream$Data;->inUse:[Z

    .line 58
    .local v1, "inUse":[Z
    iget-object v5, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->data:Lorg/apache/tools/bzip2/CBZip2InputStream$Data;

    iget-object v4, v5, Lorg/apache/tools/bzip2/CBZip2InputStream$Data;->seqToUnseq:[B

    .line 60
    .local v4, "seqToUnseq":[B
    const/4 v2, 0x0

    .line 62
    .local v2, "nInUseShadow":I
    const/4 v0, 0x0

    .local v0, "i":I
    move v3, v2

    .end local v2    # "nInUseShadow":I
    .local v3, "nInUseShadow":I
    :goto_0
    const/16 v5, 0x100

    if-ge v0, v5, :cond_0

    .line 63
    aget-boolean v5, v1, v0

    if-eqz v5, :cond_1

    .line 64
    add-int/lit8 v2, v3, 0x1

    .end local v3    # "nInUseShadow":I
    .restart local v2    # "nInUseShadow":I
    int-to-byte v5, v0

    aput-byte v5, v4, v3

    .line 62
    :goto_1
    add-int/lit8 v0, v0, 0x1

    move v3, v2

    .end local v2    # "nInUseShadow":I
    .restart local v3    # "nInUseShadow":I
    goto :goto_0

    .line 67
    :cond_0
    iput v3, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->nInUse:I

    .line 68
    return-void

    :cond_1
    move v2, v3

    .end local v3    # "nInUseShadow":I
    .restart local v2    # "nInUseShadow":I
    goto :goto_1
.end method

.method private read0()I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 187
    iget v0, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->currentChar:I

    .line 189
    .local v0, "retChar":I
    iget v1, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->currentState:I

    packed-switch v1, :pswitch_data_0

    .line 219
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1}, Ljava/lang/IllegalStateException;-><init>()V

    throw v1

    .line 191
    :pswitch_0
    const/4 v0, -0x1

    .line 222
    .end local v0    # "retChar":I
    :goto_0
    return v0

    .line 194
    .restart local v0    # "retChar":I
    :pswitch_1
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1}, Ljava/lang/IllegalStateException;-><init>()V

    throw v1

    .line 197
    :pswitch_2
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1}, Ljava/lang/IllegalStateException;-><init>()V

    throw v1

    .line 200
    :pswitch_3
    invoke-direct {p0}, Lorg/apache/tools/bzip2/CBZip2InputStream;->setupRandPartB()V

    goto :goto_0

    .line 204
    :pswitch_4
    invoke-direct {p0}, Lorg/apache/tools/bzip2/CBZip2InputStream;->setupRandPartC()V

    goto :goto_0

    .line 208
    :pswitch_5
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1}, Ljava/lang/IllegalStateException;-><init>()V

    throw v1

    .line 211
    :pswitch_6
    invoke-direct {p0}, Lorg/apache/tools/bzip2/CBZip2InputStream;->setupNoRandPartB()V

    goto :goto_0

    .line 215
    :pswitch_7
    invoke-direct {p0}, Lorg/apache/tools/bzip2/CBZip2InputStream;->setupNoRandPartC()V

    goto :goto_0

    .line 189
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
    .line 438
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/apache/tools/bzip2/CBZip2InputStream;->data:Lorg/apache/tools/bzip2/CBZip2InputStream$Data;

    .line 439
    .local v4, "dataShadow":Lorg/apache/tools/bzip2/CBZip2InputStream$Data;
    iget-object v7, v4, Lorg/apache/tools/bzip2/CBZip2InputStream$Data;->inUse:[Z

    .line 440
    .local v7, "inUse":[Z
    iget-object v14, v4, Lorg/apache/tools/bzip2/CBZip2InputStream$Data;->recvDecodingTables_pos:[B

    .line 441
    .local v14, "pos":[B
    iget-object v15, v4, Lorg/apache/tools/bzip2/CBZip2InputStream$Data;->selector:[B

    .line 442
    .local v15, "selector":[B
    iget-object v0, v4, Lorg/apache/tools/bzip2/CBZip2InputStream$Data;->selectorMtf:[B

    move-object/from16 v16, v0

    .line 444
    .local v16, "selectorMtf":[B
    const/4 v8, 0x0

    .line 447
    .local v8, "inUse16":I
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_0
    const/16 v20, 0x10

    move/from16 v0, v20

    if-ge v5, v0, :cond_1

    .line 448
    invoke-direct/range {p0 .. p0}, Lorg/apache/tools/bzip2/CBZip2InputStream;->bsGetBit()Z

    move-result v20

    if-eqz v20, :cond_0

    .line 449
    const/16 v20, 0x1

    shl-int v20, v20, v5

    or-int v8, v8, v20

    .line 447
    :cond_0
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 453
    :cond_1
    const/16 v5, 0x100

    :goto_1
    add-int/lit8 v5, v5, -0x1

    if-ltz v5, :cond_2

    .line 454
    const/16 v20, 0x0

    aput-boolean v20, v7, v5

    goto :goto_1

    .line 457
    :cond_2
    const/4 v5, 0x0

    :goto_2
    const/16 v20, 0x10

    move/from16 v0, v20

    if-ge v5, v0, :cond_5

    .line 458
    const/16 v20, 0x1

    shl-int v20, v20, v5

    and-int v20, v20, v8

    if-eqz v20, :cond_4

    .line 459
    shl-int/lit8 v6, v5, 0x4

    .line 460
    .local v6, "i16":I
    const/4 v9, 0x0

    .local v9, "j":I
    :goto_3
    const/16 v20, 0x10

    move/from16 v0, v20

    if-ge v9, v0, :cond_4

    .line 461
    invoke-direct/range {p0 .. p0}, Lorg/apache/tools/bzip2/CBZip2InputStream;->bsGetBit()Z

    move-result v20

    if-eqz v20, :cond_3

    .line 462
    add-int v20, v6, v9

    const/16 v21, 0x1

    aput-boolean v21, v7, v20

    .line 460
    :cond_3
    add-int/lit8 v9, v9, 0x1

    goto :goto_3

    .line 457
    .end local v6    # "i16":I
    .end local v9    # "j":I
    :cond_4
    add-int/lit8 v5, v5, 0x1

    goto :goto_2

    .line 468
    :cond_5
    invoke-direct/range {p0 .. p0}, Lorg/apache/tools/bzip2/CBZip2InputStream;->makeMaps()V

    .line 469
    move-object/from16 v0, p0

    iget v0, v0, Lorg/apache/tools/bzip2/CBZip2InputStream;->nInUse:I

    move/from16 v20, v0

    add-int/lit8 v2, v20, 0x2

    .line 472
    .local v2, "alphaSize":I
    const/16 v20, 0x3

    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-direct {v0, v1}, Lorg/apache/tools/bzip2/CBZip2InputStream;->bsR(I)I

    move-result v12

    .line 473
    .local v12, "nGroups":I
    const/16 v20, 0xf

    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-direct {v0, v1}, Lorg/apache/tools/bzip2/CBZip2InputStream;->bsR(I)I

    move-result v13

    .line 475
    .local v13, "nSelectors":I
    const/4 v5, 0x0

    :goto_4
    if-ge v5, v13, :cond_7

    .line 476
    const/4 v9, 0x0

    .line 477
    .restart local v9    # "j":I
    :goto_5
    invoke-direct/range {p0 .. p0}, Lorg/apache/tools/bzip2/CBZip2InputStream;->bsGetBit()Z

    move-result v20

    if-eqz v20, :cond_6

    .line 478
    add-int/lit8 v9, v9, 0x1

    goto :goto_5

    .line 480
    :cond_6
    int-to-byte v0, v9

    move/from16 v20, v0

    aput-byte v20, v16, v5

    .line 475
    add-int/lit8 v5, v5, 0x1

    goto :goto_4

    .line 484
    .end local v9    # "j":I
    :cond_7
    move/from16 v19, v12

    .local v19, "v":I
    :goto_6
    add-int/lit8 v19, v19, -0x1

    if-ltz v19, :cond_8

    .line 485
    move/from16 v0, v19

    int-to-byte v0, v0

    move/from16 v20, v0

    aput-byte v20, v14, v19

    goto :goto_6

    .line 488
    :cond_8
    const/4 v5, 0x0

    :goto_7
    if-ge v5, v13, :cond_a

    .line 489
    aget-byte v20, v16, v5

    move/from16 v0, v20

    and-int/lit16 v0, v0, 0xff

    move/from16 v19, v0

    .line 490
    aget-byte v18, v14, v19

    .line 491
    .local v18, "tmp":B
    :goto_8
    if-lez v19, :cond_9

    .line 493
    add-int/lit8 v20, v19, -0x1

    aget-byte v20, v14, v20

    aput-byte v20, v14, v19

    .line 494
    add-int/lit8 v19, v19, -0x1

    goto :goto_8

    .line 496
    :cond_9
    const/16 v20, 0x0

    aput-byte v18, v14, v20

    .line 497
    aput-byte v18, v15, v5

    .line 488
    add-int/lit8 v5, v5, 0x1

    goto :goto_7

    .line 500
    .end local v18    # "tmp":B
    :cond_a
    iget-object v10, v4, Lorg/apache/tools/bzip2/CBZip2InputStream$Data;->temp_charArray2d:[[C

    .line 503
    .local v10, "len":[[C
    const/16 v17, 0x0

    .local v17, "t":I
    :goto_9
    move/from16 v0, v17

    if-ge v0, v12, :cond_e

    .line 504
    const/16 v20, 0x5

    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-direct {v0, v1}, Lorg/apache/tools/bzip2/CBZip2InputStream;->bsR(I)I

    move-result v3

    .line 505
    .local v3, "curr":I
    aget-object v11, v10, v17

    .line 506
    .local v11, "len_t":[C
    const/4 v5, 0x0

    :goto_a
    if-ge v5, v2, :cond_d

    .line 507
    :goto_b
    invoke-direct/range {p0 .. p0}, Lorg/apache/tools/bzip2/CBZip2InputStream;->bsGetBit()Z

    move-result v20

    if-eqz v20, :cond_c

    .line 508
    invoke-direct/range {p0 .. p0}, Lorg/apache/tools/bzip2/CBZip2InputStream;->bsGetBit()Z

    move-result v20

    if-eqz v20, :cond_b

    const/16 v20, -0x1

    :goto_c
    add-int v3, v3, v20

    goto :goto_b

    :cond_b
    const/16 v20, 0x1

    goto :goto_c

    .line 510
    :cond_c
    int-to-char v0, v3

    move/from16 v20, v0

    aput-char v20, v11, v5

    .line 506
    add-int/lit8 v5, v5, 0x1

    goto :goto_a

    .line 503
    :cond_d
    add-int/lit8 v17, v17, 0x1

    goto :goto_9

    .line 515
    .end local v3    # "curr":I
    .end local v11    # "len_t":[C
    :cond_e
    move-object/from16 v0, p0

    invoke-direct {v0, v2, v12}, Lorg/apache/tools/bzip2/CBZip2InputStream;->createHuffmanDecodingTables(II)V

    .line 516
    return-void
.end method

.method private static reportCRCError()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 53
    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string/jumbo v1, "BZip2 CRC error"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 54
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

    .line 770
    iget-object v6, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->data:Lorg/apache/tools/bzip2/CBZip2InputStream$Data;

    if-nez v6, :cond_0

    .line 805
    :goto_0
    return-void

    .line 774
    :cond_0
    iget-object v6, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->data:Lorg/apache/tools/bzip2/CBZip2InputStream$Data;

    iget-object v1, v6, Lorg/apache/tools/bzip2/CBZip2InputStream$Data;->cftab:[I

    .line 775
    .local v1, "cftab":[I
    iget-object v6, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->data:Lorg/apache/tools/bzip2/CBZip2InputStream$Data;

    iget v7, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->last:I

    add-int/lit8 v7, v7, 0x1

    invoke-virtual {v6, v7}, Lorg/apache/tools/bzip2/CBZip2InputStream$Data;->initTT(I)[I

    move-result-object v5

    .line 776
    .local v5, "tt":[I
    iget-object v6, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->data:Lorg/apache/tools/bzip2/CBZip2InputStream$Data;

    iget-object v4, v6, Lorg/apache/tools/bzip2/CBZip2InputStream$Data;->ll8:[B

    .line 777
    .local v4, "ll8":[B
    aput v9, v1, v9

    .line 778
    iget-object v6, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->data:Lorg/apache/tools/bzip2/CBZip2InputStream$Data;

    iget-object v6, v6, Lorg/apache/tools/bzip2/CBZip2InputStream$Data;->unzftab:[I

    const/4 v7, 0x1

    invoke-static {v6, v9, v1, v7, v10}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 780
    const/4 v2, 0x1

    .local v2, "i":I
    aget v0, v1, v9

    .local v0, "c":I
    :goto_1
    if-gt v2, v10, :cond_1

    .line 781
    aget v6, v1, v2

    add-int/2addr v0, v6

    .line 782
    aput v0, v1, v2

    .line 780
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 785
    :cond_1
    const/4 v2, 0x0

    iget v3, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->last:I

    .local v3, "lastShadow":I
    :goto_2
    if-gt v2, v3, :cond_2

    .line 786
    aget-byte v6, v4, v2

    and-int/lit16 v6, v6, 0xff

    aget v7, v1, v6

    add-int/lit8 v8, v7, 0x1

    aput v8, v1, v6

    aput v2, v5, v7

    .line 785
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 789
    :cond_2
    iget v6, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->origPtr:I

    if-ltz v6, :cond_3

    iget v6, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->origPtr:I

    array-length v7, v5

    if-lt v6, v7, :cond_4

    .line 790
    :cond_3
    new-instance v6, Ljava/io/IOException;

    const-string/jumbo v7, "stream corrupted"

    invoke-direct {v6, v7}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 793
    :cond_4
    iget v6, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->origPtr:I

    aget v6, v5, v6

    iput v6, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->su_tPos:I

    .line 794
    iput v9, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->su_count:I

    .line 795
    iput v9, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->su_i2:I

    .line 796
    iput v10, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->su_ch2:I

    .line 798
    iget-boolean v6, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->blockRandomised:Z

    if-eqz v6, :cond_5

    .line 799
    iput v9, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->su_rNToGo:I

    .line 800
    iput v9, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->su_rTPos:I

    .line 801
    invoke-direct {p0}, Lorg/apache/tools/bzip2/CBZip2InputStream;->setupRandPartA()V

    goto :goto_0

    .line 803
    :cond_5
    invoke-direct {p0}, Lorg/apache/tools/bzip2/CBZip2InputStream;->setupNoRandPartA()V

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
    .line 833
    iget v1, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->su_i2:I

    iget v2, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->last:I

    if-gt v1, v2, :cond_0

    .line 834
    iget v1, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->su_ch2:I

    iput v1, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->su_chPrev:I

    .line 835
    iget-object v1, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->data:Lorg/apache/tools/bzip2/CBZip2InputStream$Data;

    iget-object v1, v1, Lorg/apache/tools/bzip2/CBZip2InputStream$Data;->ll8:[B

    iget v2, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->su_tPos:I

    aget-byte v1, v1, v2

    and-int/lit16 v0, v1, 0xff

    .line 836
    .local v0, "su_ch2Shadow":I
    iput v0, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->su_ch2:I

    .line 837
    iget-object v1, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->data:Lorg/apache/tools/bzip2/CBZip2InputStream$Data;

    iget-object v1, v1, Lorg/apache/tools/bzip2/CBZip2InputStream$Data;->tt:[I

    iget v2, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->su_tPos:I

    aget v1, v1, v2

    iput v1, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->su_tPos:I

    .line 838
    iget v1, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->su_i2:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->su_i2:I

    .line 839
    iput v0, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->currentChar:I

    .line 840
    const/4 v1, 0x6

    iput v1, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->currentState:I

    .line 841
    iget-object v1, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->crc:Lorg/apache/tools/bzip2/CRC;

    invoke-virtual {v1, v0}, Lorg/apache/tools/bzip2/CRC;->updateCRC(I)V

    .line 848
    .end local v0    # "su_ch2Shadow":I
    :goto_0
    return-void

    .line 843
    :cond_0
    const/4 v1, 0x5

    iput v1, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->currentState:I

    .line 844
    invoke-direct {p0}, Lorg/apache/tools/bzip2/CBZip2InputStream;->endBlock()V

    .line 845
    invoke-direct {p0}, Lorg/apache/tools/bzip2/CBZip2InputStream;->initBlock()V

    .line 846
    invoke-direct {p0}, Lorg/apache/tools/bzip2/CBZip2InputStream;->setupBlock()V

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
    .line 892
    iget v0, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->su_ch2:I

    iget v1, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->su_chPrev:I

    if-eq v0, v1, :cond_0

    .line 893
    const/4 v0, 0x1

    iput v0, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->su_count:I

    .line 894
    invoke-direct {p0}, Lorg/apache/tools/bzip2/CBZip2InputStream;->setupNoRandPartA()V

    .line 903
    :goto_0
    return-void

    .line 895
    :cond_0
    iget v0, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->su_count:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->su_count:I

    const/4 v1, 0x4

    if-lt v0, v1, :cond_1

    .line 896
    iget-object v0, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->data:Lorg/apache/tools/bzip2/CBZip2InputStream$Data;

    iget-object v0, v0, Lorg/apache/tools/bzip2/CBZip2InputStream$Data;->ll8:[B

    iget v1, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->su_tPos:I

    aget-byte v0, v0, v1

    and-int/lit16 v0, v0, 0xff

    int-to-char v0, v0

    iput-char v0, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->su_z:C

    .line 897
    iget-object v0, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->data:Lorg/apache/tools/bzip2/CBZip2InputStream$Data;

    iget-object v0, v0, Lorg/apache/tools/bzip2/CBZip2InputStream$Data;->tt:[I

    iget v1, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->su_tPos:I

    aget v0, v0, v1

    iput v0, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->su_tPos:I

    .line 898
    const/4 v0, 0x0

    iput v0, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->su_j2:I

    .line 899
    invoke-direct {p0}, Lorg/apache/tools/bzip2/CBZip2InputStream;->setupNoRandPartC()V

    goto :goto_0

    .line 901
    :cond_1
    invoke-direct {p0}, Lorg/apache/tools/bzip2/CBZip2InputStream;->setupNoRandPartA()V

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
    .line 906
    iget v1, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->su_j2:I

    iget-char v2, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->su_z:C

    if-ge v1, v2, :cond_0

    .line 907
    iget v0, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->su_ch2:I

    .line 908
    .local v0, "su_ch2Shadow":I
    iput v0, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->currentChar:I

    .line 909
    iget-object v1, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->crc:Lorg/apache/tools/bzip2/CRC;

    invoke-virtual {v1, v0}, Lorg/apache/tools/bzip2/CRC;->updateCRC(I)V

    .line 910
    iget v1, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->su_j2:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->su_j2:I

    .line 911
    const/4 v1, 0x7

    iput v1, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->currentState:I

    .line 917
    .end local v0    # "su_ch2Shadow":I
    :goto_0
    return-void

    .line 913
    :cond_0
    iget v1, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->su_i2:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->su_i2:I

    .line 914
    const/4 v1, 0x0

    iput v1, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->su_count:I

    .line 915
    invoke-direct {p0}, Lorg/apache/tools/bzip2/CBZip2InputStream;->setupNoRandPartA()V

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

    .line 808
    iget v3, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->su_i2:I

    iget v4, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->last:I

    if-gt v3, v4, :cond_3

    .line 809
    iget v3, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->su_ch2:I

    iput v3, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->su_chPrev:I

    .line 810
    iget-object v3, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->data:Lorg/apache/tools/bzip2/CBZip2InputStream$Data;

    iget-object v3, v3, Lorg/apache/tools/bzip2/CBZip2InputStream$Data;->ll8:[B

    iget v4, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->su_tPos:I

    aget-byte v3, v3, v4

    and-int/lit16 v0, v3, 0xff

    .line 811
    .local v0, "su_ch2Shadow":I
    iget-object v3, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->data:Lorg/apache/tools/bzip2/CBZip2InputStream$Data;

    iget-object v3, v3, Lorg/apache/tools/bzip2/CBZip2InputStream$Data;->tt:[I

    iget v4, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->su_tPos:I

    aget v3, v3, v4

    iput v3, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->su_tPos:I

    .line 812
    iget v3, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->su_rNToGo:I

    if-nez v3, :cond_1

    .line 813
    sget-object v3, Lorg/apache/tools/bzip2/BZip2Constants;->rNums:[I

    iget v4, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->su_rTPos:I

    aget v3, v3, v4

    add-int/lit8 v3, v3, -0x1

    iput v3, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->su_rNToGo:I

    .line 814
    iget v3, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->su_rTPos:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->su_rTPos:I

    const/16 v4, 0x200

    if-ne v3, v4, :cond_0

    .line 815
    iput v2, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->su_rTPos:I

    .line 820
    :cond_0
    :goto_0
    iget v3, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->su_rNToGo:I

    if-ne v3, v1, :cond_2

    :goto_1
    xor-int/2addr v0, v1

    iput v0, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->su_ch2:I

    .line 821
    iget v1, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->su_i2:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->su_i2:I

    .line 822
    iput v0, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->currentChar:I

    .line 823
    const/4 v1, 0x3

    iput v1, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->currentState:I

    .line 824
    iget-object v1, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->crc:Lorg/apache/tools/bzip2/CRC;

    invoke-virtual {v1, v0}, Lorg/apache/tools/bzip2/CRC;->updateCRC(I)V

    .line 830
    .end local v0    # "su_ch2Shadow":I
    :goto_2
    return-void

    .line 818
    .restart local v0    # "su_ch2Shadow":I
    :cond_1
    iget v3, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->su_rNToGo:I

    add-int/lit8 v3, v3, -0x1

    iput v3, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->su_rNToGo:I

    goto :goto_0

    :cond_2
    move v1, v2

    .line 820
    goto :goto_1

    .line 826
    .end local v0    # "su_ch2Shadow":I
    :cond_3
    invoke-direct {p0}, Lorg/apache/tools/bzip2/CBZip2InputStream;->endBlock()V

    .line 827
    invoke-direct {p0}, Lorg/apache/tools/bzip2/CBZip2InputStream;->initBlock()V

    .line 828
    invoke-direct {p0}, Lorg/apache/tools/bzip2/CBZip2InputStream;->setupBlock()V

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

    .line 851
    iget v0, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->su_ch2:I

    iget v1, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->su_chPrev:I

    if-eq v0, v1, :cond_0

    .line 852
    iput v4, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->currentState:I

    .line 853
    iput v3, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->su_count:I

    .line 854
    invoke-direct {p0}, Lorg/apache/tools/bzip2/CBZip2InputStream;->setupRandPartA()V

    .line 876
    :goto_0
    return-void

    .line 855
    :cond_0
    iget v0, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->su_count:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->su_count:I

    if-lt v0, v5, :cond_4

    .line 856
    iget-object v0, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->data:Lorg/apache/tools/bzip2/CBZip2InputStream$Data;

    iget-object v0, v0, Lorg/apache/tools/bzip2/CBZip2InputStream$Data;->ll8:[B

    iget v1, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->su_tPos:I

    aget-byte v0, v0, v1

    and-int/lit16 v0, v0, 0xff

    int-to-char v0, v0

    iput-char v0, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->su_z:C

    .line 857
    iget-object v0, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->data:Lorg/apache/tools/bzip2/CBZip2InputStream$Data;

    iget-object v0, v0, Lorg/apache/tools/bzip2/CBZip2InputStream$Data;->tt:[I

    iget v1, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->su_tPos:I

    aget v0, v0, v1

    iput v0, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->su_tPos:I

    .line 858
    iget v0, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->su_rNToGo:I

    if-nez v0, :cond_3

    .line 859
    sget-object v0, Lorg/apache/tools/bzip2/BZip2Constants;->rNums:[I

    iget v1, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->su_rTPos:I

    aget v0, v0, v1

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->su_rNToGo:I

    .line 860
    iget v0, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->su_rTPos:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->su_rTPos:I

    const/16 v1, 0x200

    if-ne v0, v1, :cond_1

    .line 861
    iput v2, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->su_rTPos:I

    .line 866
    :cond_1
    :goto_1
    iput v2, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->su_j2:I

    .line 867
    iput v5, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->currentState:I

    .line 868
    iget v0, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->su_rNToGo:I

    if-ne v0, v3, :cond_2

    .line 869
    iget-char v0, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->su_z:C

    xor-int/lit8 v0, v0, 0x1

    int-to-char v0, v0

    iput-char v0, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->su_z:C

    .line 871
    :cond_2
    invoke-direct {p0}, Lorg/apache/tools/bzip2/CBZip2InputStream;->setupRandPartC()V

    goto :goto_0

    .line 864
    :cond_3
    iget v0, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->su_rNToGo:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->su_rNToGo:I

    goto :goto_1

    .line 873
    :cond_4
    iput v4, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->currentState:I

    .line 874
    invoke-direct {p0}, Lorg/apache/tools/bzip2/CBZip2InputStream;->setupRandPartA()V

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
    .line 879
    iget v0, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->su_j2:I

    iget-char v1, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->su_z:C

    if-ge v0, v1, :cond_0

    .line 880
    iget v0, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->su_ch2:I

    iput v0, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->currentChar:I

    .line 881
    iget-object v0, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->crc:Lorg/apache/tools/bzip2/CRC;

    iget v1, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->su_ch2:I

    invoke-virtual {v0, v1}, Lorg/apache/tools/bzip2/CRC;->updateCRC(I)V

    .line 882
    iget v0, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->su_j2:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->su_j2:I

    .line 889
    :goto_0
    return-void

    .line 884
    :cond_0
    const/4 v0, 0x2

    iput v0, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->currentState:I

    .line 885
    iget v0, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->su_i2:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->su_i2:I

    .line 886
    const/4 v0, 0x0

    iput v0, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->su_count:I

    .line 887
    invoke-direct {p0}, Lorg/apache/tools/bzip2/CBZip2InputStream;->setupRandPartA()V

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

    .line 327
    iget-object v0, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->in:Ljava/io/InputStream;

    .line 328
    .local v0, "inShadow":Ljava/io/InputStream;
    if-eqz v0, :cond_1

    .line 330
    :try_start_0
    sget-object v1, Ljava/lang/System;->in:Ljava/io/InputStream;

    if-eq v0, v1, :cond_0

    .line 331
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 334
    :cond_0
    iput-object v2, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->data:Lorg/apache/tools/bzip2/CBZip2InputStream$Data;

    .line 335
    iput-object v2, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->in:Ljava/io/InputStream;

    .line 338
    :cond_1
    return-void

    .line 334
    :catchall_0
    move-exception v1

    iput-object v2, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->data:Lorg/apache/tools/bzip2/CBZip2InputStream$Data;

    .line 335
    iput-object v2, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->in:Ljava/io/InputStream;

    .line 334
    throw v1
.end method

.method public read()I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 153
    iget-object v0, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->in:Ljava/io/InputStream;

    if-eqz v0, :cond_0

    .line 154
    invoke-direct {p0}, Lorg/apache/tools/bzip2/CBZip2InputStream;->read0()I

    move-result v0

    return v0

    .line 156
    :cond_0
    new-instance v0, Ljava/io/IOException;

    const-string/jumbo v1, "stream closed"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public read([BII)I
    .locals 7
    .param p1, "dest"    # [B
    .param p2, "offs"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 162
    if-gez p2, :cond_0

    .line 163
    new-instance v4, Ljava/lang/IndexOutOfBoundsException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "offs("

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string/jumbo v6, ") < 0."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 165
    :cond_0
    if-gez p3, :cond_1

    .line 166
    new-instance v4, Ljava/lang/IndexOutOfBoundsException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "len("

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, p3}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string/jumbo v6, ") < 0."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 168
    :cond_1
    add-int v4, p2, p3

    array-length v5, p1

    if-le v4, v5, :cond_2

    .line 169
    new-instance v4, Ljava/lang/IndexOutOfBoundsException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "offs("

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string/jumbo v6, ") + len("

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, p3}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string/jumbo v6, ") > dest.length("

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    array-length v6, p1

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string/jumbo v6, ")."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 173
    :cond_2
    iget-object v4, p0, Lorg/apache/tools/bzip2/CBZip2InputStream;->in:Ljava/io/InputStream;

    if-nez v4, :cond_3

    .line 174
    new-instance v4, Ljava/io/IOException;

    const-string/jumbo v5, "stream closed"

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 177
    :cond_3
    add-int v3, p2, p3

    .line 178
    .local v3, "hi":I
    move v1, p2

    .local v1, "destOffs":I
    move v2, v1

    .line 179
    .end local v1    # "destOffs":I
    .local v2, "destOffs":I
    :goto_0
    if-ge v2, v3, :cond_4

    invoke-direct {p0}, Lorg/apache/tools/bzip2/CBZip2InputStream;->read0()I

    move-result v0

    .local v0, "b":I
    if-ltz v0, :cond_4

    .line 180
    add-int/lit8 v1, v2, 0x1

    .end local v2    # "destOffs":I
    .restart local v1    # "destOffs":I
    int-to-byte v4, v0

    aput-byte v4, p1, v2

    move v2, v1

    .end local v1    # "destOffs":I
    .restart local v2    # "destOffs":I
    goto :goto_0

    .line 183
    .end local v0    # "b":I
    :cond_4
    if-ne v2, p2, :cond_5

    const/4 v4, -0x1

    :goto_1
    return v4

    :cond_5
    sub-int v4, v2, p2

    goto :goto_1
.end method
