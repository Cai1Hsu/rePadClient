.class public Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;
.super Lorg/apache/commons/compress/compressors/CompressorOutputStream;
.source "BZip2CompressorOutputStream.java"

# interfaces
.implements Lorg/apache/commons/compress/compressors/bzip2/BZip2Constants;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;
    }
.end annotation


# static fields
.field private static final GREATER_ICOST:I = 0xf

.field private static final LESSER_ICOST:I = 0x0

.field public static final MAX_BLOCKSIZE:I = 0x9

.field public static final MIN_BLOCKSIZE:I = 0x1


# instance fields
.field private final allowableBlockSize:I

.field private blockCRC:I

.field private final blockSize100k:I

.field private blockSorter:Lorg/apache/commons/compress/compressors/bzip2/BlockSort;

.field private bsBuff:I

.field private bsLive:I

.field private combinedCRC:I

.field private final crc:Lorg/apache/commons/compress/compressors/bzip2/CRC;

.field private currentChar:I

.field private data:Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;

.field private last:I

.field private nInUse:I

.field private nMTF:I

.field private out:Ljava/io/OutputStream;

.field private runLength:I


# direct methods
.method public constructor <init>(Ljava/io/OutputStream;)V
    .locals 1
    .param p1, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 358
    const/16 v0, 0x9

    invoke-direct {p0, p1, v0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;-><init>(Ljava/io/OutputStream;I)V

    .line 359
    return-void
.end method

.method public constructor <init>(Ljava/io/OutputStream;I)V
    .locals 3
    .param p1, "out"    # Ljava/io/OutputStream;
    .param p2, "blockSize"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 382
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/CompressorOutputStream;-><init>()V

    .line 307
    new-instance v0, Lorg/apache/commons/compress/compressors/bzip2/CRC;

    invoke-direct {v0}, Lorg/apache/commons/compress/compressors/bzip2/CRC;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->crc:Lorg/apache/commons/compress/compressors/bzip2/CRC;

    .line 313
    const/4 v0, -0x1

    iput v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->currentChar:I

    .line 314
    const/4 v0, 0x0

    iput v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->runLength:I

    .line 384
    const/4 v0, 0x1

    if-ge p2, v0, :cond_0

    .line 385
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "blockSize("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ") < 1"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 388
    :cond_0
    const/16 v0, 0x9

    if-le p2, v0, :cond_1

    .line 389
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "blockSize("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ") > 9"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 393
    :cond_1
    iput p2, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->blockSize100k:I

    .line 394
    iput-object p1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->out:Ljava/io/OutputStream;

    .line 397
    iget v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->blockSize100k:I

    const v1, 0x186a0

    mul-int/2addr v0, v1

    add-int/lit8 v0, v0, -0x14

    iput v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->allowableBlockSize:I

    .line 398
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->init()V

    .line 399
    return-void
.end method

.method private blockSort()V
    .locals 3

    .prologue
    .line 1167
    iget-object v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->blockSorter:Lorg/apache/commons/compress/compressors/bzip2/BlockSort;

    iget-object v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->data:Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;

    iget v2, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->last:I

    invoke-virtual {v0, v1, v2}, Lorg/apache/commons/compress/compressors/bzip2/BlockSort;->blockSort(Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;I)V

    .line 1168
    return-void
.end method

.method private bsFinishedWithStream()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 686
    :goto_0
    iget v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->bsLive:I

    if-lez v1, :cond_0

    .line 687
    iget v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->bsBuff:I

    shr-int/lit8 v0, v1, 0x18

    .line 688
    .local v0, "ch":I
    iget-object v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v1, v0}, Ljava/io/OutputStream;->write(I)V

    .line 689
    iget v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->bsBuff:I

    shl-int/lit8 v1, v1, 0x8

    iput v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->bsBuff:I

    .line 690
    iget v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->bsLive:I

    add-int/lit8 v1, v1, -0x8

    iput v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->bsLive:I

    goto :goto_0

    .line 692
    .end local v0    # "ch":I
    :cond_0
    return-void
.end method

.method private bsPutInt(I)V
    .locals 2
    .param p1, "u"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v1, 0x8

    .line 714
    shr-int/lit8 v0, p1, 0x18

    and-int/lit16 v0, v0, 0xff

    invoke-direct {p0, v1, v0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->bsW(II)V

    .line 715
    shr-int/lit8 v0, p1, 0x10

    and-int/lit16 v0, v0, 0xff

    invoke-direct {p0, v1, v0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->bsW(II)V

    .line 716
    shr-int/lit8 v0, p1, 0x8

    and-int/lit16 v0, v0, 0xff

    invoke-direct {p0, v1, v0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->bsW(II)V

    .line 717
    and-int/lit16 v0, p1, 0xff

    invoke-direct {p0, v1, v0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->bsW(II)V

    .line 718
    return-void
.end method

.method private bsPutUByte(I)V
    .locals 1
    .param p1, "c"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 710
    const/16 v0, 0x8

    invoke-direct {p0, v0, p1}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->bsW(II)V

    .line 711
    return-void
.end method

.method private bsW(II)V
    .locals 4
    .param p1, "n"    # I
    .param p2, "v"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 695
    iget-object v2, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->out:Ljava/io/OutputStream;

    .line 696
    .local v2, "outShadow":Ljava/io/OutputStream;
    iget v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->bsLive:I

    .line 697
    .local v1, "bsLiveShadow":I
    iget v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->bsBuff:I

    .line 699
    .local v0, "bsBuffShadow":I
    :goto_0
    const/16 v3, 0x8

    if-lt v1, v3, :cond_0

    .line 700
    shr-int/lit8 v3, v0, 0x18

    invoke-virtual {v2, v3}, Ljava/io/OutputStream;->write(I)V

    .line 701
    shl-int/lit8 v0, v0, 0x8

    .line 702
    add-int/lit8 v1, v1, -0x8

    goto :goto_0

    .line 705
    :cond_0
    rsub-int/lit8 v3, v1, 0x20

    sub-int/2addr v3, p1

    shl-int v3, p2, v3

    or-int/2addr v3, v0

    iput v3, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->bsBuff:I

    .line 706
    add-int v3, v1, p1

    iput v3, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->bsLive:I

    .line 707
    return-void
.end method

.method public static chooseBlockSize(J)I
    .locals 4
    .param p0, "inputLength"    # J

    .prologue
    .line 341
    const-wide/16 v0, 0x0

    cmp-long v0, p0, v0

    if-lez v0, :cond_0

    const-wide/32 v0, 0x203a0

    div-long v0, p0, v0

    const-wide/16 v2, 0x1

    add-long/2addr v0, v2

    const-wide/16 v2, 0x9

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v0

    long-to-int v0, v0

    :goto_0
    return v0

    :cond_0
    const/16 v0, 0x9

    goto :goto_0
.end method

.method private endBlock()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v2, 0x59

    .line 557
    iget-object v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->crc:Lorg/apache/commons/compress/compressors/bzip2/CRC;

    invoke-virtual {v0}, Lorg/apache/commons/compress/compressors/bzip2/CRC;->getFinalCRC()I

    move-result v0

    iput v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->blockCRC:I

    .line 558
    iget v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->combinedCRC:I

    shl-int/lit8 v0, v0, 0x1

    iget v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->combinedCRC:I

    ushr-int/lit8 v1, v1, 0x1f

    or-int/2addr v0, v1

    iput v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->combinedCRC:I

    .line 559
    iget v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->combinedCRC:I

    iget v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->blockCRC:I

    xor-int/2addr v0, v1

    iput v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->combinedCRC:I

    .line 562
    iget v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->last:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 595
    :goto_0
    return-void

    .line 567
    :cond_0
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->blockSort()V

    .line 580
    const/16 v0, 0x31

    invoke-direct {p0, v0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->bsPutUByte(I)V

    .line 581
    const/16 v0, 0x41

    invoke-direct {p0, v0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->bsPutUByte(I)V

    .line 582
    invoke-direct {p0, v2}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->bsPutUByte(I)V

    .line 583
    const/16 v0, 0x26

    invoke-direct {p0, v0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->bsPutUByte(I)V

    .line 584
    const/16 v0, 0x53

    invoke-direct {p0, v0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->bsPutUByte(I)V

    .line 585
    invoke-direct {p0, v2}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->bsPutUByte(I)V

    .line 588
    iget v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->blockCRC:I

    invoke-direct {p0, v0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->bsPutInt(I)V

    .line 591
    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->bsW(II)V

    .line 594
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->moveToFrontCodeAndSend()V

    goto :goto_0
.end method

.method private endCompression()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 604
    const/16 v0, 0x17

    invoke-direct {p0, v0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->bsPutUByte(I)V

    .line 605
    const/16 v0, 0x72

    invoke-direct {p0, v0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->bsPutUByte(I)V

    .line 606
    const/16 v0, 0x45

    invoke-direct {p0, v0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->bsPutUByte(I)V

    .line 607
    const/16 v0, 0x38

    invoke-direct {p0, v0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->bsPutUByte(I)V

    .line 608
    const/16 v0, 0x50

    invoke-direct {p0, v0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->bsPutUByte(I)V

    .line 609
    const/16 v0, 0x90

    invoke-direct {p0, v0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->bsPutUByte(I)V

    .line 611
    iget v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->combinedCRC:I

    invoke-direct {p0, v0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->bsPutInt(I)V

    .line 612
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->bsFinishedWithStream()V

    .line 613
    return-void
.end method

.method private generateMTFValues()V
    .locals 22

    .prologue
    .line 1178
    move-object/from16 v0, p0

    iget v9, v0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->last:I

    .line 1179
    .local v9, "lastShadow":I
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->data:Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;

    .line 1180
    .local v3, "dataShadow":Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;
    iget-object v7, v3, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;->inUse:[Z

    .line 1181
    .local v7, "inUse":[Z
    iget-object v2, v3, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;->block:[B

    .line 1182
    .local v2, "block":[B
    iget-object v5, v3, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;->fmap:[I

    .line 1183
    .local v5, "fmap":[I
    iget-object v13, v3, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;->sfmap:[C

    .line 1184
    .local v13, "sfmap":[C
    iget-object v11, v3, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;->mtfFreq:[I

    .line 1185
    .local v11, "mtfFreq":[I
    iget-object v0, v3, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;->unseqToSeq:[B

    move-object/from16 v16, v0

    .line 1186
    .local v16, "unseqToSeq":[B
    iget-object v0, v3, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;->generateMTFValues_yy:[B

    move-object/from16 v18, v0

    .line 1189
    .local v18, "yy":[B
    const/4 v12, 0x0

    .line 1190
    .local v12, "nInUseShadow":I
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_0
    const/16 v20, 0x100

    move/from16 v0, v20

    if-ge v6, v0, :cond_1

    .line 1191
    aget-boolean v20, v7, v6

    if-eqz v20, :cond_0

    .line 1192
    int-to-byte v0, v12

    move/from16 v20, v0

    aput-byte v20, v16, v6

    .line 1193
    add-int/lit8 v12, v12, 0x1

    .line 1190
    :cond_0
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 1196
    :cond_1
    move-object/from16 v0, p0

    iput v12, v0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->nInUse:I

    .line 1198
    add-int/lit8 v4, v12, 0x1

    .line 1200
    .local v4, "eob":I
    move v6, v4

    :goto_1
    if-ltz v6, :cond_2

    .line 1201
    const/16 v20, 0x0

    aput v20, v11, v6

    .line 1200
    add-int/lit8 v6, v6, -0x1

    goto :goto_1

    .line 1204
    :cond_2
    move v6, v12

    :goto_2
    add-int/lit8 v6, v6, -0x1

    if-ltz v6, :cond_3

    .line 1205
    int-to-byte v0, v6

    move/from16 v20, v0

    aput-byte v20, v18, v6

    goto :goto_2

    .line 1208
    :cond_3
    const/16 v17, 0x0

    .line 1209
    .local v17, "wr":I
    const/16 v19, 0x0

    .line 1211
    .local v19, "zPend":I
    const/4 v6, 0x0

    :goto_3
    if-gt v6, v9, :cond_9

    .line 1212
    aget v20, v5, v6

    aget-byte v20, v2, v20

    move/from16 v0, v20

    and-int/lit16 v0, v0, 0xff

    move/from16 v20, v0

    aget-byte v10, v16, v20

    .line 1213
    .local v10, "ll_i":B
    const/16 v20, 0x0

    aget-byte v14, v18, v20

    .line 1214
    .local v14, "tmp":B
    const/4 v8, 0x0

    .line 1216
    .local v8, "j":I
    :goto_4
    if-eq v10, v14, :cond_4

    .line 1217
    add-int/lit8 v8, v8, 0x1

    .line 1218
    move v15, v14

    .line 1219
    .local v15, "tmp2":B
    aget-byte v14, v18, v8

    .line 1220
    aput-byte v15, v18, v8

    goto :goto_4

    .line 1222
    .end local v15    # "tmp2":B
    :cond_4
    const/16 v20, 0x0

    aput-byte v14, v18, v20

    .line 1224
    if-nez v8, :cond_5

    .line 1225
    add-int/lit8 v19, v19, 0x1

    .line 1211
    :goto_5
    add-int/lit8 v6, v6, 0x1

    goto :goto_3

    .line 1227
    :cond_5
    if-lez v19, :cond_8

    .line 1228
    add-int/lit8 v19, v19, -0x1

    .line 1230
    :goto_6
    and-int/lit8 v20, v19, 0x1

    if-nez v20, :cond_6

    .line 1231
    const/16 v20, 0x0

    aput-char v20, v13, v17

    .line 1232
    add-int/lit8 v17, v17, 0x1

    .line 1233
    const/16 v20, 0x0

    aget v21, v11, v20

    add-int/lit8 v21, v21, 0x1

    aput v21, v11, v20

    .line 1240
    :goto_7
    const/16 v20, 0x2

    move/from16 v0, v19

    move/from16 v1, v20

    if-lt v0, v1, :cond_7

    .line 1241
    add-int/lit8 v20, v19, -0x2

    shr-int/lit8 v19, v20, 0x1

    goto :goto_6

    .line 1235
    :cond_6
    const/16 v20, 0x1

    aput-char v20, v13, v17

    .line 1236
    add-int/lit8 v17, v17, 0x1

    .line 1237
    const/16 v20, 0x1

    aget v21, v11, v20

    add-int/lit8 v21, v21, 0x1

    aput v21, v11, v20

    goto :goto_7

    .line 1246
    :cond_7
    const/16 v19, 0x0

    .line 1248
    :cond_8
    add-int/lit8 v20, v8, 0x1

    move/from16 v0, v20

    int-to-char v0, v0

    move/from16 v20, v0

    aput-char v20, v13, v17

    .line 1249
    add-int/lit8 v17, v17, 0x1

    .line 1250
    add-int/lit8 v20, v8, 0x1

    aget v21, v11, v20

    add-int/lit8 v21, v21, 0x1

    aput v21, v11, v20

    goto :goto_5

    .line 1254
    .end local v8    # "j":I
    .end local v10    # "ll_i":B
    .end local v14    # "tmp":B
    :cond_9
    if-lez v19, :cond_b

    .line 1255
    add-int/lit8 v19, v19, -0x1

    .line 1257
    :goto_8
    and-int/lit8 v20, v19, 0x1

    if-nez v20, :cond_a

    .line 1258
    const/16 v20, 0x0

    aput-char v20, v13, v17

    .line 1259
    add-int/lit8 v17, v17, 0x1

    .line 1260
    const/16 v20, 0x0

    aget v21, v11, v20

    add-int/lit8 v21, v21, 0x1

    aput v21, v11, v20

    .line 1267
    :goto_9
    const/16 v20, 0x2

    move/from16 v0, v19

    move/from16 v1, v20

    if-lt v0, v1, :cond_b

    .line 1268
    add-int/lit8 v20, v19, -0x2

    shr-int/lit8 v19, v20, 0x1

    goto :goto_8

    .line 1262
    :cond_a
    const/16 v20, 0x1

    aput-char v20, v13, v17

    .line 1263
    add-int/lit8 v17, v17, 0x1

    .line 1264
    const/16 v20, 0x1

    aget v21, v11, v20

    add-int/lit8 v21, v21, 0x1

    aput v21, v11, v20

    goto :goto_9

    .line 1275
    :cond_b
    int-to-char v0, v4

    move/from16 v20, v0

    aput-char v20, v13, v17

    .line 1276
    aget v20, v11, v4

    add-int/lit8 v20, v20, 0x1

    aput v20, v11, v4

    .line 1277
    add-int/lit8 v20, v17, 0x1

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput v0, v1, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->nMTF:I

    .line 1278
    return-void
.end method

.method private static hbAssignCodes([I[BIII)V
    .locals 4
    .param p0, "code"    # [I
    .param p1, "length"    # [B
    .param p2, "minLen"    # I
    .param p3, "maxLen"    # I
    .param p4, "alphaSize"    # I

    .prologue
    .line 673
    const/4 v2, 0x0

    .line 674
    .local v2, "vec":I
    move v1, p2

    .local v1, "n":I
    :goto_0
    if-gt v1, p3, :cond_2

    .line 675
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    if-ge v0, p4, :cond_1

    .line 676
    aget-byte v3, p1, v0

    and-int/lit16 v3, v3, 0xff

    if-ne v3, v1, :cond_0

    .line 677
    aput v2, p0, v0

    .line 678
    add-int/lit8 v2, v2, 0x1

    .line 675
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 681
    :cond_1
    shl-int/lit8 v2, v2, 0x1

    .line 674
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 683
    .end local v0    # "i":I
    :cond_2
    return-void
.end method

.method private static hbMakeCodeLengths([B[ILorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;II)V
    .locals 23
    .param p0, "len"    # [B
    .param p1, "freq"    # [I
    .param p2, "dat"    # Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;
    .param p3, "alphaSize"    # I
    .param p4, "maxLen"    # I

    .prologue
    .line 150
    move-object/from16 v0, p2

    iget-object v2, v0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;->heap:[I

    .line 151
    .local v2, "heap":[I
    move-object/from16 v0, p2

    iget-object v14, v0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;->weight:[I

    .line 152
    .local v14, "weight":[I
    move-object/from16 v0, p2

    iget-object v10, v0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;->parent:[I

    .line 154
    .local v10, "parent":[I
    move/from16 v3, p3

    .local v3, "i":I
    :goto_0
    add-int/lit8 v3, v3, -0x1

    if-ltz v3, :cond_1

    .line 155
    add-int/lit8 v21, v3, 0x1

    aget v20, p1, v3

    if-nez v20, :cond_0

    const/16 v20, 0x1

    :goto_1
    shl-int/lit8 v20, v20, 0x8

    aput v20, v14, v21

    goto :goto_0

    :cond_0
    aget v20, p1, v3

    goto :goto_1

    .line 158
    :cond_1
    const/4 v13, 0x1

    .local v13, "tooLong":Z
    :cond_2
    if-eqz v13, :cond_11

    .line 159
    const/4 v13, 0x0

    .line 161
    move/from16 v9, p3

    .line 162
    .local v9, "nNodes":I
    const/4 v8, 0x0

    .line 163
    .local v8, "nHeap":I
    const/16 v20, 0x0

    const/16 v21, 0x0

    aput v21, v2, v20

    .line 164
    const/16 v20, 0x0

    const/16 v21, 0x0

    aput v21, v14, v20

    .line 165
    const/16 v20, 0x0

    const/16 v21, -0x2

    aput v21, v10, v20

    .line 167
    const/4 v3, 0x1

    :goto_2
    move/from16 v0, p3

    if-gt v3, v0, :cond_5

    .line 168
    const/16 v20, -0x1

    aput v20, v10, v3

    .line 169
    add-int/lit8 v8, v8, 0x1

    .line 170
    aput v3, v2, v8

    .line 172
    move/from16 v19, v8

    .line 173
    .local v19, "zz":I
    aget v12, v2, v19

    .line 174
    .local v12, "tmp":I
    :goto_3
    aget v20, v14, v12

    shr-int/lit8 v21, v19, 0x1

    aget v21, v2, v21

    aget v21, v14, v21

    move/from16 v0, v20

    move/from16 v1, v21

    if-ge v0, v1, :cond_3

    .line 175
    shr-int/lit8 v20, v19, 0x1

    aget v20, v2, v20

    aput v20, v2, v19

    .line 176
    shr-int/lit8 v19, v19, 0x1

    goto :goto_3

    .line 178
    :cond_3
    aput v12, v2, v19

    .line 167
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 265
    .local v6, "n1":I
    .local v7, "n2":I
    .local v15, "weight_n1":I
    .local v16, "weight_n2":I
    .local v17, "weight_tmp":I
    .local v18, "yy":I
    :cond_4
    aput v12, v2, v19

    .line 181
    .end local v6    # "n1":I
    .end local v7    # "n2":I
    .end local v12    # "tmp":I
    .end local v15    # "weight_n1":I
    .end local v16    # "weight_n2":I
    .end local v17    # "weight_tmp":I
    .end local v18    # "yy":I
    .end local v19    # "zz":I
    :cond_5
    const/16 v20, 0x1

    move/from16 v0, v20

    if-le v8, v0, :cond_d

    .line 182
    const/16 v20, 0x1

    aget v6, v2, v20

    .line 183
    .restart local v6    # "n1":I
    const/16 v20, 0x1

    aget v21, v2, v8

    aput v21, v2, v20

    .line 184
    add-int/lit8 v8, v8, -0x1

    .line 186
    const/16 v18, 0x0

    .line 187
    .restart local v18    # "yy":I
    const/16 v19, 0x1

    .line 188
    .restart local v19    # "zz":I
    const/16 v20, 0x1

    aget v12, v2, v20

    .line 191
    .restart local v12    # "tmp":I
    :goto_4
    shl-int/lit8 v18, v19, 0x1

    .line 193
    move/from16 v0, v18

    if-le v0, v8, :cond_8

    .line 210
    :cond_6
    aput v12, v2, v19

    .line 212
    const/16 v20, 0x1

    aget v7, v2, v20

    .line 213
    .restart local v7    # "n2":I
    const/16 v20, 0x1

    aget v21, v2, v8

    aput v21, v2, v20

    .line 214
    add-int/lit8 v8, v8, -0x1

    .line 216
    const/16 v18, 0x0

    .line 217
    const/16 v19, 0x1

    .line 218
    const/16 v20, 0x1

    aget v12, v2, v20

    .line 221
    :goto_5
    shl-int/lit8 v18, v19, 0x1

    .line 223
    move/from16 v0, v18

    if-le v0, v8, :cond_a

    .line 240
    :cond_7
    aput v12, v2, v19

    .line 241
    add-int/lit8 v9, v9, 0x1

    .line 242
    aput v9, v10, v7

    aput v9, v10, v6

    .line 244
    aget v15, v14, v6

    .line 245
    .restart local v15    # "weight_n1":I
    aget v16, v14, v7

    .line 246
    .restart local v16    # "weight_n2":I
    and-int/lit16 v0, v15, -0x100

    move/from16 v20, v0

    move/from16 v0, v16

    and-int/lit16 v0, v0, -0x100

    move/from16 v21, v0

    add-int v21, v21, v20

    and-int/lit16 v0, v15, 0xff

    move/from16 v20, v0

    move/from16 v0, v16

    and-int/lit16 v0, v0, 0xff

    move/from16 v22, v0

    move/from16 v0, v20

    move/from16 v1, v22

    if-le v0, v1, :cond_c

    and-int/lit16 v0, v15, 0xff

    move/from16 v20, v0

    :goto_6
    add-int/lit8 v20, v20, 0x1

    or-int v20, v20, v21

    aput v20, v14, v9

    .line 253
    const/16 v20, -0x1

    aput v20, v10, v9

    .line 254
    add-int/lit8 v8, v8, 0x1

    .line 255
    aput v9, v2, v8

    .line 257
    const/4 v12, 0x0

    .line 258
    move/from16 v19, v8

    .line 259
    aget v12, v2, v19

    .line 260
    aget v17, v14, v12

    .line 261
    .restart local v17    # "weight_tmp":I
    :goto_7
    shr-int/lit8 v20, v19, 0x1

    aget v20, v2, v20

    aget v20, v14, v20

    move/from16 v0, v17

    move/from16 v1, v20

    if-ge v0, v1, :cond_4

    .line 262
    shr-int/lit8 v20, v19, 0x1

    aget v20, v2, v20

    aput v20, v2, v19

    .line 263
    shr-int/lit8 v19, v19, 0x1

    goto :goto_7

    .line 197
    .end local v7    # "n2":I
    .end local v15    # "weight_n1":I
    .end local v16    # "weight_n2":I
    .end local v17    # "weight_tmp":I
    :cond_8
    move/from16 v0, v18

    if-ge v0, v8, :cond_9

    add-int/lit8 v20, v18, 0x1

    aget v20, v2, v20

    aget v20, v14, v20

    aget v21, v2, v18

    aget v21, v14, v21

    move/from16 v0, v20

    move/from16 v1, v21

    if-ge v0, v1, :cond_9

    .line 199
    add-int/lit8 v18, v18, 0x1

    .line 202
    :cond_9
    aget v20, v14, v12

    aget v21, v2, v18

    aget v21, v14, v21

    move/from16 v0, v20

    move/from16 v1, v21

    if-lt v0, v1, :cond_6

    .line 206
    aget v20, v2, v18

    aput v20, v2, v19

    .line 207
    move/from16 v19, v18

    goto/16 :goto_4

    .line 227
    .restart local v7    # "n2":I
    :cond_a
    move/from16 v0, v18

    if-ge v0, v8, :cond_b

    add-int/lit8 v20, v18, 0x1

    aget v20, v2, v20

    aget v20, v14, v20

    aget v21, v2, v18

    aget v21, v14, v21

    move/from16 v0, v20

    move/from16 v1, v21

    if-ge v0, v1, :cond_b

    .line 229
    add-int/lit8 v18, v18, 0x1

    .line 232
    :cond_b
    aget v20, v14, v12

    aget v21, v2, v18

    aget v21, v14, v21

    move/from16 v0, v20

    move/from16 v1, v21

    if-lt v0, v1, :cond_7

    .line 236
    aget v20, v2, v18

    aput v20, v2, v19

    .line 237
    move/from16 v19, v18

    goto/16 :goto_5

    .line 246
    .restart local v15    # "weight_n1":I
    .restart local v16    # "weight_n2":I
    :cond_c
    move/from16 v0, v16

    and-int/lit16 v0, v0, 0xff

    move/from16 v20, v0

    goto/16 :goto_6

    .line 269
    .end local v6    # "n1":I
    .end local v7    # "n2":I
    .end local v12    # "tmp":I
    .end local v15    # "weight_n1":I
    .end local v16    # "weight_n2":I
    .end local v18    # "yy":I
    .end local v19    # "zz":I
    :cond_d
    const/4 v3, 0x1

    :goto_8
    move/from16 v0, p3

    if-gt v3, v0, :cond_10

    .line 270
    const/4 v4, 0x0

    .line 271
    .local v4, "j":I
    move v5, v3

    .line 273
    .local v5, "k":I
    :goto_9
    aget v11, v10, v5

    .local v11, "parent_k":I
    if-ltz v11, :cond_e

    .line 274
    move v5, v11

    .line 275
    add-int/lit8 v4, v4, 0x1

    goto :goto_9

    .line 278
    :cond_e
    add-int/lit8 v20, v3, -0x1

    int-to-byte v0, v4

    move/from16 v21, v0

    aput-byte v21, p0, v20

    .line 279
    move/from16 v0, p4

    if-le v4, v0, :cond_f

    .line 280
    const/4 v13, 0x1

    .line 269
    :cond_f
    add-int/lit8 v3, v3, 0x1

    goto :goto_8

    .line 284
    .end local v4    # "j":I
    .end local v5    # "k":I
    .end local v11    # "parent_k":I
    :cond_10
    if-eqz v13, :cond_2

    .line 285
    const/4 v3, 0x1

    :goto_a
    move/from16 v0, p3

    if-ge v3, v0, :cond_2

    .line 286
    aget v20, v14, v3

    shr-int/lit8 v4, v20, 0x8

    .line 287
    .restart local v4    # "j":I
    shr-int/lit8 v20, v4, 0x1

    add-int/lit8 v4, v20, 0x1

    .line 288
    shl-int/lit8 v20, v4, 0x8

    aput v20, v14, v3

    .line 285
    add-int/lit8 v3, v3, 0x1

    goto :goto_a

    .line 292
    .end local v4    # "j":I
    .end local v8    # "nHeap":I
    .end local v9    # "nNodes":I
    :cond_11
    return-void
.end method

.method private init()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 529
    const/16 v0, 0x42

    invoke-direct {p0, v0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->bsPutUByte(I)V

    .line 530
    const/16 v0, 0x5a

    invoke-direct {p0, v0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->bsPutUByte(I)V

    .line 532
    new-instance v0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;

    iget v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->blockSize100k:I

    invoke-direct {v0, v1}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;-><init>(I)V

    iput-object v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->data:Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;

    .line 533
    new-instance v0, Lorg/apache/commons/compress/compressors/bzip2/BlockSort;

    iget-object v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->data:Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;

    invoke-direct {v0, v1}, Lorg/apache/commons/compress/compressors/bzip2/BlockSort;-><init>(Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;)V

    iput-object v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->blockSorter:Lorg/apache/commons/compress/compressors/bzip2/BlockSort;

    .line 536
    const/16 v0, 0x68

    invoke-direct {p0, v0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->bsPutUByte(I)V

    .line 537
    iget v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->blockSize100k:I

    add-int/lit8 v0, v0, 0x30

    invoke-direct {p0, v0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->bsPutUByte(I)V

    .line 539
    const/4 v0, 0x0

    iput v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->combinedCRC:I

    .line 540
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->initBlock()V

    .line 541
    return-void
.end method

.method private initBlock()V
    .locals 3

    .prologue
    .line 545
    iget-object v2, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->crc:Lorg/apache/commons/compress/compressors/bzip2/CRC;

    invoke-virtual {v2}, Lorg/apache/commons/compress/compressors/bzip2/CRC;->initialiseCRC()V

    .line 546
    const/4 v2, -0x1

    iput v2, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->last:I

    .line 549
    iget-object v2, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->data:Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;

    iget-object v1, v2, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;->inUse:[Z

    .line 550
    .local v1, "inUse":[Z
    const/16 v0, 0x100

    .local v0, "i":I
    :goto_0
    add-int/lit8 v0, v0, -0x1

    if-ltz v0, :cond_0

    .line 551
    const/4 v2, 0x0

    aput-boolean v2, v1, v0

    goto :goto_0

    .line 554
    :cond_0
    return-void
.end method

.method private moveToFrontCodeAndSend()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1161
    const/16 v0, 0x18

    iget-object v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->data:Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;

    iget v1, v1, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;->origPtr:I

    invoke-direct {p0, v0, v1}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->bsW(II)V

    .line 1162
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->generateMTFValues()V

    .line 1163
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->sendMTFValues()V

    .line 1164
    return-void
.end method

.method private sendMTFValues()V
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 721
    iget-object v7, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->data:Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;

    iget-object v1, v7, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;->sendMTFValues_len:[[B

    .line 722
    .local v1, "len":[[B
    iget v7, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->nInUse:I

    add-int/lit8 v0, v7, 0x2

    .line 724
    .local v0, "alphaSize":I
    const/4 v5, 0x6

    .local v5, "t":I
    :cond_0
    add-int/lit8 v5, v5, -0x1

    if-ltz v5, :cond_1

    .line 725
    aget-object v2, v1, v5

    .line 726
    .local v2, "len_t":[B
    move v6, v0

    .local v6, "v":I
    :goto_0
    add-int/lit8 v6, v6, -0x1

    if-ltz v6, :cond_0

    .line 727
    const/16 v7, 0xf

    aput-byte v7, v2, v6

    goto :goto_0

    .line 733
    .end local v2    # "len_t":[B
    .end local v6    # "v":I
    :cond_1
    iget v7, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->nMTF:I

    const/16 v8, 0xc8

    if-ge v7, v8, :cond_2

    const/4 v3, 0x2

    .line 737
    .local v3, "nGroups":I
    :goto_1
    invoke-direct {p0, v3, v0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->sendMTFValues0(II)V

    .line 742
    invoke-direct {p0, v3, v0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->sendMTFValues1(II)I

    move-result v4

    .line 745
    .local v4, "nSelectors":I
    invoke-direct {p0, v3, v4}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->sendMTFValues2(II)V

    .line 748
    invoke-direct {p0, v3, v0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->sendMTFValues3(II)V

    .line 751
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->sendMTFValues4()V

    .line 754
    invoke-direct {p0, v3, v4}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->sendMTFValues5(II)V

    .line 757
    invoke-direct {p0, v3, v0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->sendMTFValues6(II)V

    .line 760
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->sendMTFValues7()V

    .line 761
    return-void

    .line 733
    .end local v3    # "nGroups":I
    .end local v4    # "nSelectors":I
    :cond_2
    iget v7, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->nMTF:I

    const/16 v8, 0x258

    if-ge v7, v8, :cond_3

    const/4 v3, 0x3

    goto :goto_1

    :cond_3
    iget v7, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->nMTF:I

    const/16 v8, 0x4b0

    if-ge v7, v8, :cond_4

    const/4 v3, 0x4

    goto :goto_1

    :cond_4
    iget v7, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->nMTF:I

    const/16 v8, 0x960

    if-ge v7, v8, :cond_5

    const/4 v3, 0x5

    goto :goto_1

    :cond_5
    const/4 v3, 0x6

    goto :goto_1
.end method

.method private sendMTFValues0(II)V
    .locals 13
    .param p1, "nGroups"    # I
    .param p2, "alphaSize"    # I

    .prologue
    .line 764
    iget-object v12, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->data:Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;

    iget-object v5, v12, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;->sendMTFValues_len:[[B

    .line 765
    .local v5, "len":[[B
    iget-object v12, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->data:Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;

    iget-object v7, v12, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;->mtfFreq:[I

    .line 767
    .local v7, "mtfFreq":[I
    iget v9, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->nMTF:I

    .line 768
    .local v9, "remF":I
    const/4 v4, 0x0

    .line 770
    .local v4, "gs":I
    move v8, p1

    .local v8, "nPart":I
    :goto_0
    if-lez v8, :cond_3

    .line 771
    div-int v10, v9, v8

    .line 772
    .local v10, "tFreq":I
    add-int/lit8 v2, v4, -0x1

    .line 773
    .local v2, "ge":I
    const/4 v1, 0x0

    .line 775
    .local v1, "aFreq":I
    add-int/lit8 v0, p2, -0x1

    .local v0, "a":I
    move v3, v2

    .end local v2    # "ge":I
    .local v3, "ge":I
    :goto_1
    if-ge v1, v10, :cond_0

    if-ge v3, v0, :cond_0

    .line 776
    add-int/lit8 v2, v3, 0x1

    .end local v3    # "ge":I
    .restart local v2    # "ge":I
    aget v12, v7, v2

    add-int/2addr v1, v12

    move v3, v2

    .end local v2    # "ge":I
    .restart local v3    # "ge":I
    goto :goto_1

    .line 779
    :cond_0
    if-le v3, v4, :cond_4

    if-eq v8, p1, :cond_4

    const/4 v12, 0x1

    if-eq v8, v12, :cond_4

    sub-int v12, p1, v8

    and-int/lit8 v12, v12, 0x1

    if-eqz v12, :cond_4

    .line 781
    add-int/lit8 v2, v3, -0x1

    .end local v3    # "ge":I
    .restart local v2    # "ge":I
    aget v12, v7, v3

    sub-int/2addr v1, v12

    .line 784
    :goto_2
    add-int/lit8 v12, v8, -0x1

    aget-object v6, v5, v12

    .line 785
    .local v6, "len_np":[B
    move v11, p2

    .local v11, "v":I
    :goto_3
    add-int/lit8 v11, v11, -0x1

    if-ltz v11, :cond_2

    .line 786
    if-lt v11, v4, :cond_1

    if-gt v11, v2, :cond_1

    .line 787
    const/4 v12, 0x0

    aput-byte v12, v6, v11

    goto :goto_3

    .line 789
    :cond_1
    const/16 v12, 0xf

    aput-byte v12, v6, v11

    goto :goto_3

    .line 793
    :cond_2
    add-int/lit8 v4, v2, 0x1

    .line 794
    sub-int/2addr v9, v1

    .line 770
    add-int/lit8 v8, v8, -0x1

    goto :goto_0

    .line 796
    .end local v0    # "a":I
    .end local v1    # "aFreq":I
    .end local v2    # "ge":I
    .end local v6    # "len_np":[B
    .end local v10    # "tFreq":I
    .end local v11    # "v":I
    :cond_3
    return-void

    .restart local v0    # "a":I
    .restart local v1    # "aFreq":I
    .restart local v3    # "ge":I
    .restart local v10    # "tFreq":I
    :cond_4
    move v2, v3

    .end local v3    # "ge":I
    .restart local v2    # "ge":I
    goto :goto_2
.end method

.method private sendMTFValues1(II)I
    .locals 41
    .param p1, "nGroups"    # I
    .param p2, "alphaSize"    # I

    .prologue
    .line 799
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->data:Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;

    .line 800
    .local v15, "dataShadow":Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;
    iget-object v0, v15, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;->sendMTFValues_rfreq:[[I

    move-object/from16 v31, v0

    .line 801
    .local v31, "rfreq":[[I
    iget-object v0, v15, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;->sendMTFValues_fave:[I

    move-object/from16 v16, v0

    .line 802
    .local v16, "fave":[I
    iget-object v7, v15, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;->sendMTFValues_cost:[S

    .line 803
    .local v7, "cost":[S
    iget-object v0, v15, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;->sfmap:[C

    move-object/from16 v35, v0

    .line 804
    .local v35, "sfmap":[C
    iget-object v0, v15, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;->selector:[B

    move-object/from16 v34, v0

    .line 805
    .local v34, "selector":[B
    iget-object v0, v15, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;->sendMTFValues_len:[[B

    move-object/from16 v22, v0

    .line 806
    .local v22, "len":[[B
    const/16 v37, 0x0

    aget-object v23, v22, v37

    .line 807
    .local v23, "len_0":[B
    const/16 v37, 0x1

    aget-object v24, v22, v37

    .line 808
    .local v24, "len_1":[B
    const/16 v37, 0x2

    aget-object v25, v22, v37

    .line 809
    .local v25, "len_2":[B
    const/16 v37, 0x3

    aget-object v26, v22, v37

    .line 810
    .local v26, "len_3":[B
    const/16 v37, 0x4

    aget-object v27, v22, v37

    .line 811
    .local v27, "len_4":[B
    const/16 v37, 0x5

    aget-object v28, v22, v37

    .line 812
    .local v28, "len_5":[B
    move-object/from16 v0, p0

    iget v0, v0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->nMTF:I

    move/from16 v29, v0

    .line 814
    .local v29, "nMTFShadow":I
    const/16 v30, 0x0

    .line 816
    .local v30, "nSelectors":I
    const/16 v21, 0x0

    .local v21, "iter":I
    :goto_0
    const/16 v37, 0x4

    move/from16 v0, v21

    move/from16 v1, v37

    if-ge v0, v1, :cond_c

    .line 817
    move/from16 v36, p1

    .local v36, "t":I
    :cond_0
    add-int/lit8 v36, v36, -0x1

    if-ltz v36, :cond_1

    .line 818
    const/16 v37, 0x0

    aput v37, v16, v36

    .line 819
    aget-object v33, v31, v36

    .line 820
    .local v33, "rfreqt":[I
    move/from16 v19, p2

    .local v19, "i":I
    :goto_1
    add-int/lit8 v19, v19, -0x1

    if-ltz v19, :cond_0

    .line 821
    const/16 v37, 0x0

    aput v37, v33, v19

    goto :goto_1

    .line 825
    .end local v19    # "i":I
    .end local v33    # "rfreqt":[I
    :cond_1
    const/16 v30, 0x0

    .line 827
    const/16 v18, 0x0

    .local v18, "gs":I
    :goto_2
    move-object/from16 v0, p0

    iget v0, v0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->nMTF:I

    move/from16 v37, v0

    move/from16 v0, v18

    move/from16 v1, v37

    if-ge v0, v1, :cond_a

    .line 835
    add-int/lit8 v37, v18, 0x32

    add-int/lit8 v37, v37, -0x1

    add-int/lit8 v38, v29, -0x1

    invoke-static/range {v37 .. v38}, Ljava/lang/Math;->min(II)I

    move-result v17

    .line 837
    .local v17, "ge":I
    const/16 v37, 0x6

    move/from16 v0, p1

    move/from16 v1, v37

    if-ne v0, v1, :cond_5

    .line 840
    const/4 v8, 0x0

    .line 841
    .local v8, "cost0":S
    const/4 v9, 0x0

    .line 842
    .local v9, "cost1":S
    const/4 v10, 0x0

    .line 843
    .local v10, "cost2":S
    const/4 v11, 0x0

    .line 844
    .local v11, "cost3":S
    const/4 v12, 0x0

    .line 845
    .local v12, "cost4":S
    const/4 v13, 0x0

    .line 847
    .local v13, "cost5":S
    move/from16 v19, v18

    .restart local v19    # "i":I
    :goto_3
    move/from16 v0, v19

    move/from16 v1, v17

    if-gt v0, v1, :cond_2

    .line 848
    aget-char v20, v35, v19

    .line 849
    .local v20, "icv":I
    aget-byte v37, v23, v20

    move/from16 v0, v37

    and-int/lit16 v0, v0, 0xff

    move/from16 v37, v0

    add-int v37, v37, v8

    move/from16 v0, v37

    int-to-short v8, v0

    .line 850
    aget-byte v37, v24, v20

    move/from16 v0, v37

    and-int/lit16 v0, v0, 0xff

    move/from16 v37, v0

    add-int v37, v37, v9

    move/from16 v0, v37

    int-to-short v9, v0

    .line 851
    aget-byte v37, v25, v20

    move/from16 v0, v37

    and-int/lit16 v0, v0, 0xff

    move/from16 v37, v0

    add-int v37, v37, v10

    move/from16 v0, v37

    int-to-short v10, v0

    .line 852
    aget-byte v37, v26, v20

    move/from16 v0, v37

    and-int/lit16 v0, v0, 0xff

    move/from16 v37, v0

    add-int v37, v37, v11

    move/from16 v0, v37

    int-to-short v11, v0

    .line 853
    aget-byte v37, v27, v20

    move/from16 v0, v37

    and-int/lit16 v0, v0, 0xff

    move/from16 v37, v0

    add-int v37, v37, v12

    move/from16 v0, v37

    int-to-short v12, v0

    .line 854
    aget-byte v37, v28, v20

    move/from16 v0, v37

    and-int/lit16 v0, v0, 0xff

    move/from16 v37, v0

    add-int v37, v37, v13

    move/from16 v0, v37

    int-to-short v13, v0

    .line 847
    add-int/lit8 v19, v19, 0x1

    goto :goto_3

    .line 857
    .end local v20    # "icv":I
    :cond_2
    const/16 v37, 0x0

    aput-short v8, v7, v37

    .line 858
    const/16 v37, 0x1

    aput-short v9, v7, v37

    .line 859
    const/16 v37, 0x2

    aput-short v10, v7, v37

    .line 860
    const/16 v37, 0x3

    aput-short v11, v7, v37

    .line 861
    const/16 v37, 0x4

    aput-short v12, v7, v37

    .line 862
    const/16 v37, 0x5

    aput-short v13, v7, v37

    .line 881
    .end local v8    # "cost0":S
    .end local v9    # "cost1":S
    .end local v10    # "cost2":S
    .end local v11    # "cost3":S
    .end local v12    # "cost4":S
    .end local v13    # "cost5":S
    :cond_3
    const/4 v6, -0x1

    .line 882
    .local v6, "bt":I
    move/from16 v36, p1

    const v5, 0x3b9ac9ff

    .local v5, "bc":I
    :cond_4
    :goto_4
    add-int/lit8 v36, v36, -0x1

    if-ltz v36, :cond_8

    .line 883
    aget-short v14, v7, v36

    .line 884
    .local v14, "cost_t":I
    if-ge v14, v5, :cond_4

    .line 885
    move v5, v14

    .line 886
    move/from16 v6, v36

    goto :goto_4

    .line 865
    .end local v5    # "bc":I
    .end local v6    # "bt":I
    .end local v14    # "cost_t":I
    .end local v19    # "i":I
    :cond_5
    move/from16 v36, p1

    :goto_5
    add-int/lit8 v36, v36, -0x1

    if-ltz v36, :cond_6

    .line 866
    const/16 v37, 0x0

    aput-short v37, v7, v36

    goto :goto_5

    .line 869
    :cond_6
    move/from16 v19, v18

    .restart local v19    # "i":I
    :goto_6
    move/from16 v0, v19

    move/from16 v1, v17

    if-gt v0, v1, :cond_3

    .line 870
    aget-char v20, v35, v19

    .line 871
    .restart local v20    # "icv":I
    move/from16 v36, p1

    :goto_7
    add-int/lit8 v36, v36, -0x1

    if-ltz v36, :cond_7

    .line 872
    aget-short v37, v7, v36

    aget-object v38, v22, v36

    aget-byte v38, v38, v20

    move/from16 v0, v38

    and-int/lit16 v0, v0, 0xff

    move/from16 v38, v0

    add-int v37, v37, v38

    move/from16 v0, v37

    int-to-short v0, v0

    move/from16 v37, v0

    aput-short v37, v7, v36

    goto :goto_7

    .line 869
    :cond_7
    add-int/lit8 v19, v19, 0x1

    goto :goto_6

    .line 890
    .end local v20    # "icv":I
    .restart local v5    # "bc":I
    .restart local v6    # "bt":I
    :cond_8
    aget v37, v16, v6

    add-int/lit8 v37, v37, 0x1

    aput v37, v16, v6

    .line 891
    int-to-byte v0, v6

    move/from16 v37, v0

    aput-byte v37, v34, v30

    .line 892
    add-int/lit8 v30, v30, 0x1

    .line 897
    aget-object v32, v31, v6

    .line 898
    .local v32, "rfreq_bt":[I
    move/from16 v19, v18

    :goto_8
    move/from16 v0, v19

    move/from16 v1, v17

    if-gt v0, v1, :cond_9

    .line 899
    aget-char v37, v35, v19

    aget v38, v32, v37

    add-int/lit8 v38, v38, 0x1

    aput v38, v32, v37

    .line 898
    add-int/lit8 v19, v19, 0x1

    goto :goto_8

    .line 902
    :cond_9
    add-int/lit8 v18, v17, 0x1

    .line 903
    goto/16 :goto_2

    .line 908
    .end local v5    # "bc":I
    .end local v6    # "bt":I
    .end local v17    # "ge":I
    .end local v19    # "i":I
    .end local v32    # "rfreq_bt":[I
    :cond_a
    const/16 v36, 0x0

    :goto_9
    move/from16 v0, v36

    move/from16 v1, p1

    if-ge v0, v1, :cond_b

    .line 909
    aget-object v37, v22, v36

    aget-object v38, v31, v36

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->data:Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;

    move-object/from16 v39, v0

    const/16 v40, 0x14

    move-object/from16 v0, v37

    move-object/from16 v1, v38

    move-object/from16 v2, v39

    move/from16 v3, p2

    move/from16 v4, v40

    invoke-static {v0, v1, v2, v3, v4}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->hbMakeCodeLengths([B[ILorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;II)V

    .line 908
    add-int/lit8 v36, v36, 0x1

    goto :goto_9

    .line 816
    :cond_b
    add-int/lit8 v21, v21, 0x1

    goto/16 :goto_0

    .line 913
    .end local v18    # "gs":I
    .end local v36    # "t":I
    :cond_c
    return v30
.end method

.method private sendMTFValues2(II)V
    .locals 10
    .param p1, "nGroups"    # I
    .param p2, "nSelectors"    # I

    .prologue
    const/4 v9, 0x0

    .line 919
    iget-object v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->data:Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;

    .line 920
    .local v0, "dataShadow":Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;
    iget-object v4, v0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;->sendMTFValues2_pos:[B

    .line 922
    .local v4, "pos":[B
    move v1, p1

    .local v1, "i":I
    :goto_0
    add-int/lit8 v1, v1, -0x1

    if-ltz v1, :cond_0

    .line 923
    int-to-byte v7, v1

    aput-byte v7, v4, v1

    goto :goto_0

    .line 926
    :cond_0
    const/4 v1, 0x0

    :goto_1
    if-ge v1, p2, :cond_2

    .line 927
    iget-object v7, v0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;->selector:[B

    aget-byte v3, v7, v1

    .line 928
    .local v3, "ll_i":B
    aget-byte v5, v4, v9

    .line 929
    .local v5, "tmp":B
    const/4 v2, 0x0

    .line 931
    .local v2, "j":I
    :goto_2
    if-eq v3, v5, :cond_1

    .line 932
    add-int/lit8 v2, v2, 0x1

    .line 933
    move v6, v5

    .line 934
    .local v6, "tmp2":B
    aget-byte v5, v4, v2

    .line 935
    aput-byte v6, v4, v2

    goto :goto_2

    .line 938
    .end local v6    # "tmp2":B
    :cond_1
    aput-byte v5, v4, v9

    .line 939
    iget-object v7, v0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;->selectorMtf:[B

    int-to-byte v8, v2

    aput-byte v8, v7, v1

    .line 926
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 941
    .end local v2    # "j":I
    .end local v3    # "ll_i":B
    .end local v5    # "tmp":B
    :cond_2
    return-void
.end method

.method private sendMTFValues3(II)V
    .locals 10
    .param p1, "nGroups"    # I
    .param p2, "alphaSize"    # I

    .prologue
    .line 944
    iget-object v8, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->data:Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;

    iget-object v0, v8, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;->sendMTFValues_code:[[I

    .line 945
    .local v0, "code":[[I
    iget-object v8, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->data:Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;

    iget-object v3, v8, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;->sendMTFValues_len:[[B

    .line 947
    .local v3, "len":[[B
    const/4 v7, 0x0

    .local v7, "t":I
    :goto_0
    if-ge v7, p1, :cond_3

    .line 948
    const/16 v6, 0x20

    .line 949
    .local v6, "minLen":I
    const/4 v5, 0x0

    .line 950
    .local v5, "maxLen":I
    aget-object v4, v3, v7

    .line 951
    .local v4, "len_t":[B
    move v1, p2

    .local v1, "i":I
    :cond_0
    :goto_1
    add-int/lit8 v1, v1, -0x1

    if-ltz v1, :cond_2

    .line 952
    aget-byte v8, v4, v1

    and-int/lit16 v2, v8, 0xff

    .line 953
    .local v2, "l":I
    if-le v2, v5, :cond_1

    .line 954
    move v5, v2

    .line 956
    :cond_1
    if-ge v2, v6, :cond_0

    .line 957
    move v6, v2

    goto :goto_1

    .line 964
    .end local v2    # "l":I
    :cond_2
    aget-object v8, v0, v7

    aget-object v9, v3, v7

    invoke-static {v8, v9, v6, v5, p2}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->hbAssignCodes([I[BIII)V

    .line 947
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 966
    .end local v1    # "i":I
    .end local v4    # "len_t":[B
    .end local v5    # "maxLen":I
    .end local v6    # "minLen":I
    :cond_3
    return-void
.end method

.method private sendMTFValues4()V
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v10, 0x0

    const/16 v11, 0x10

    const/4 v9, 0x1

    .line 969
    iget-object v8, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->data:Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;

    iget-object v4, v8, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;->inUse:[Z

    .line 970
    .local v4, "inUse":[Z
    iget-object v8, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->data:Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;

    iget-object v5, v8, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;->sentMTFValues4_inUse16:[Z

    .line 972
    .local v5, "inUse16":[Z
    const/16 v2, 0x10

    .local v2, "i":I
    :cond_0
    add-int/lit8 v2, v2, -0x1

    if-ltz v2, :cond_2

    .line 973
    aput-boolean v10, v5, v2

    .line 974
    mul-int/lit8 v3, v2, 0x10

    .line 975
    .local v3, "i16":I
    const/16 v6, 0x10

    .local v6, "j":I
    :cond_1
    :goto_0
    add-int/lit8 v6, v6, -0x1

    if-ltz v6, :cond_0

    .line 976
    add-int v8, v3, v6

    aget-boolean v8, v4, v8

    if-eqz v8, :cond_1

    .line 977
    aput-boolean v9, v5, v2

    goto :goto_0

    .line 982
    .end local v3    # "i16":I
    .end local v6    # "j":I
    :cond_2
    const/4 v2, 0x0

    :goto_1
    if-ge v2, v11, :cond_4

    .line 983
    aget-boolean v8, v5, v2

    if-eqz v8, :cond_3

    move v8, v9

    :goto_2
    invoke-direct {p0, v9, v8}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->bsW(II)V

    .line 982
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_3
    move v8, v10

    .line 983
    goto :goto_2

    .line 986
    :cond_4
    iget-object v7, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->out:Ljava/io/OutputStream;

    .line 987
    .local v7, "outShadow":Ljava/io/OutputStream;
    iget v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->bsLive:I

    .line 988
    .local v1, "bsLiveShadow":I
    iget v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->bsBuff:I

    .line 990
    .local v0, "bsBuffShadow":I
    const/4 v2, 0x0

    :goto_3
    if-ge v2, v11, :cond_8

    .line 991
    aget-boolean v8, v5, v2

    if-eqz v8, :cond_7

    .line 992
    mul-int/lit8 v3, v2, 0x10

    .line 993
    .restart local v3    # "i16":I
    const/4 v6, 0x0

    .restart local v6    # "j":I
    :goto_4
    if-ge v6, v11, :cond_7

    .line 995
    :goto_5
    const/16 v8, 0x8

    if-lt v1, v8, :cond_5

    .line 996
    shr-int/lit8 v8, v0, 0x18

    invoke-virtual {v7, v8}, Ljava/io/OutputStream;->write(I)V

    .line 997
    shl-int/lit8 v0, v0, 0x8

    .line 998
    add-int/lit8 v1, v1, -0x8

    goto :goto_5

    .line 1000
    :cond_5
    add-int v8, v3, v6

    aget-boolean v8, v4, v8

    if-eqz v8, :cond_6

    .line 1001
    rsub-int/lit8 v8, v1, 0x20

    add-int/lit8 v8, v8, -0x1

    shl-int v8, v9, v8

    or-int/2addr v0, v8

    .line 1003
    :cond_6
    add-int/lit8 v1, v1, 0x1

    .line 993
    add-int/lit8 v6, v6, 0x1

    goto :goto_4

    .line 990
    .end local v3    # "i16":I
    .end local v6    # "j":I
    :cond_7
    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    .line 1008
    :cond_8
    iput v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->bsBuff:I

    .line 1009
    iput v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->bsLive:I

    .line 1010
    return-void
.end method

.method private sendMTFValues5(II)V
    .locals 10
    .param p1, "nGroups"    # I
    .param p2, "nSelectors"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v9, 0x8

    .line 1014
    const/4 v7, 0x3

    invoke-direct {p0, v7, p1}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->bsW(II)V

    .line 1015
    const/16 v7, 0xf

    invoke-direct {p0, v7, p2}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->bsW(II)V

    .line 1017
    iget-object v5, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->out:Ljava/io/OutputStream;

    .line 1018
    .local v5, "outShadow":Ljava/io/OutputStream;
    iget-object v7, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->data:Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;

    iget-object v6, v7, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;->selectorMtf:[B

    .line 1020
    .local v6, "selectorMtf":[B
    iget v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->bsLive:I

    .line 1021
    .local v1, "bsLiveShadow":I
    iget v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->bsBuff:I

    .line 1023
    .local v0, "bsBuffShadow":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    if-ge v3, p2, :cond_3

    .line 1024
    const/4 v4, 0x0

    .local v4, "j":I
    aget-byte v7, v6, v3

    and-int/lit16 v2, v7, 0xff

    .local v2, "hj":I
    :goto_1
    if-ge v4, v2, :cond_1

    .line 1026
    :goto_2
    if-lt v1, v9, :cond_0

    .line 1027
    shr-int/lit8 v7, v0, 0x18

    invoke-virtual {v5, v7}, Ljava/io/OutputStream;->write(I)V

    .line 1028
    shl-int/lit8 v0, v0, 0x8

    .line 1029
    add-int/lit8 v1, v1, -0x8

    goto :goto_2

    .line 1031
    :cond_0
    const/4 v7, 0x1

    rsub-int/lit8 v8, v1, 0x20

    add-int/lit8 v8, v8, -0x1

    shl-int/2addr v7, v8

    or-int/2addr v0, v7

    .line 1032
    add-int/lit8 v1, v1, 0x1

    .line 1024
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 1036
    :cond_1
    :goto_3
    if-lt v1, v9, :cond_2

    .line 1037
    shr-int/lit8 v7, v0, 0x18

    invoke-virtual {v5, v7}, Ljava/io/OutputStream;->write(I)V

    .line 1038
    shl-int/lit8 v0, v0, 0x8

    .line 1039
    add-int/lit8 v1, v1, -0x8

    goto :goto_3

    .line 1042
    :cond_2
    add-int/lit8 v1, v1, 0x1

    .line 1023
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 1045
    .end local v2    # "hj":I
    .end local v4    # "j":I
    :cond_3
    iput v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->bsBuff:I

    .line 1046
    iput v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->bsLive:I

    .line 1047
    return-void
.end method

.method private sendMTFValues6(II)V
    .locals 12
    .param p1, "nGroups"    # I
    .param p2, "alphaSize"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v11, 0x8

    .line 1051
    iget-object v9, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->data:Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;

    iget-object v4, v9, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;->sendMTFValues_len:[[B

    .line 1052
    .local v4, "len":[[B
    iget-object v7, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->out:Ljava/io/OutputStream;

    .line 1054
    .local v7, "outShadow":Ljava/io/OutputStream;
    iget v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->bsLive:I

    .line 1055
    .local v1, "bsLiveShadow":I
    iget v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->bsBuff:I

    .line 1057
    .local v0, "bsBuffShadow":I
    const/4 v8, 0x0

    .local v8, "t":I
    :goto_0
    if-ge v8, p1, :cond_7

    .line 1058
    aget-object v5, v4, v8

    .line 1059
    .local v5, "len_t":[B
    const/4 v9, 0x0

    aget-byte v9, v5, v9

    and-int/lit16 v2, v9, 0xff

    .line 1062
    .local v2, "curr":I
    :goto_1
    if-lt v1, v11, :cond_0

    .line 1063
    shr-int/lit8 v9, v0, 0x18

    invoke-virtual {v7, v9}, Ljava/io/OutputStream;->write(I)V

    .line 1064
    shl-int/lit8 v0, v0, 0x8

    .line 1065
    add-int/lit8 v1, v1, -0x8

    goto :goto_1

    .line 1067
    :cond_0
    rsub-int/lit8 v9, v1, 0x20

    add-int/lit8 v9, v9, -0x5

    shl-int v9, v2, v9

    or-int/2addr v0, v9

    .line 1068
    add-int/lit8 v1, v1, 0x5

    .line 1070
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_2
    if-ge v3, p2, :cond_6

    .line 1071
    aget-byte v9, v5, v3

    and-int/lit16 v6, v9, 0xff

    .line 1072
    .local v6, "lti":I
    :goto_3
    if-ge v2, v6, :cond_3

    .line 1074
    :goto_4
    if-lt v1, v11, :cond_1

    .line 1075
    shr-int/lit8 v9, v0, 0x18

    invoke-virtual {v7, v9}, Ljava/io/OutputStream;->write(I)V

    .line 1076
    shl-int/lit8 v0, v0, 0x8

    .line 1077
    add-int/lit8 v1, v1, -0x8

    goto :goto_4

    .line 1079
    :cond_1
    const/4 v9, 0x2

    rsub-int/lit8 v10, v1, 0x20

    add-int/lit8 v10, v10, -0x2

    shl-int/2addr v9, v10

    or-int/2addr v0, v9

    .line 1080
    add-int/lit8 v1, v1, 0x2

    .line 1082
    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    .line 1092
    :cond_2
    const/4 v9, 0x3

    rsub-int/lit8 v10, v1, 0x20

    add-int/lit8 v10, v10, -0x2

    shl-int/2addr v9, v10

    or-int/2addr v0, v9

    .line 1093
    add-int/lit8 v1, v1, 0x2

    .line 1095
    add-int/lit8 v2, v2, -0x1

    .line 1085
    :cond_3
    if-le v2, v6, :cond_4

    .line 1087
    :goto_5
    if-lt v1, v11, :cond_2

    .line 1088
    shr-int/lit8 v9, v0, 0x18

    invoke-virtual {v7, v9}, Ljava/io/OutputStream;->write(I)V

    .line 1089
    shl-int/lit8 v0, v0, 0x8

    .line 1090
    add-int/lit8 v1, v1, -0x8

    goto :goto_5

    .line 1099
    :cond_4
    :goto_6
    if-lt v1, v11, :cond_5

    .line 1100
    shr-int/lit8 v9, v0, 0x18

    invoke-virtual {v7, v9}, Ljava/io/OutputStream;->write(I)V

    .line 1101
    shl-int/lit8 v0, v0, 0x8

    .line 1102
    add-int/lit8 v1, v1, -0x8

    goto :goto_6

    .line 1105
    :cond_5
    add-int/lit8 v1, v1, 0x1

    .line 1070
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 1057
    .end local v6    # "lti":I
    :cond_6
    add-int/lit8 v8, v8, 0x1

    goto :goto_0

    .line 1109
    .end local v2    # "curr":I
    .end local v3    # "i":I
    .end local v5    # "len_t":[B
    :cond_7
    iput v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->bsBuff:I

    .line 1110
    iput v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->bsLive:I

    .line 1111
    return-void
.end method

.method private sendMTFValues7()V
    .locals 20
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1114
    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->data:Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;

    .line 1115
    .local v5, "dataShadow":Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;
    iget-object v8, v5, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;->sendMTFValues_len:[[B

    .line 1116
    .local v8, "len":[[B
    iget-object v3, v5, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;->sendMTFValues_code:[[I

    .line 1117
    .local v3, "code":[[I
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->out:Ljava/io/OutputStream;

    .line 1118
    .local v12, "outShadow":Ljava/io/OutputStream;
    iget-object v14, v5, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;->selector:[B

    .line 1119
    .local v14, "selector":[B
    iget-object v0, v5, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;->sfmap:[C

    move-object/from16 v16, v0

    .line 1120
    .local v16, "sfmap":[C
    move-object/from16 v0, p0

    iget v11, v0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->nMTF:I

    .line 1122
    .local v11, "nMTFShadow":I
    const/4 v13, 0x0

    .line 1124
    .local v13, "selCtr":I
    move-object/from16 v0, p0

    iget v2, v0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->bsLive:I

    .line 1125
    .local v2, "bsLiveShadow":I
    move-object/from16 v0, p0

    iget v1, v0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->bsBuff:I

    .line 1127
    .local v1, "bsBuffShadow":I
    const/4 v7, 0x0

    .local v7, "gs":I
    :goto_0
    if-ge v7, v11, :cond_2

    .line 1128
    add-int/lit8 v18, v7, 0x32

    add-int/lit8 v18, v18, -0x1

    add-int/lit8 v19, v11, -0x1

    invoke-static/range {v18 .. v19}, Ljava/lang/Math;->min(II)I

    move-result v6

    .line 1129
    .local v6, "ge":I
    aget-byte v18, v14, v13

    move/from16 v0, v18

    and-int/lit16 v15, v0, 0xff

    .line 1130
    .local v15, "selector_selCtr":I
    aget-object v4, v3, v15

    .line 1131
    .local v4, "code_selCtr":[I
    aget-object v9, v8, v15

    .line 1133
    .local v9, "len_selCtr":[B
    :goto_1
    if-gt v7, v6, :cond_1

    .line 1134
    aget-char v17, v16, v7

    .line 1140
    .local v17, "sfmap_i":I
    :goto_2
    const/16 v18, 0x8

    move/from16 v0, v18

    if-lt v2, v0, :cond_0

    .line 1141
    shr-int/lit8 v18, v1, 0x18

    move/from16 v0, v18

    invoke-virtual {v12, v0}, Ljava/io/OutputStream;->write(I)V

    .line 1142
    shl-int/lit8 v1, v1, 0x8

    .line 1143
    add-int/lit8 v2, v2, -0x8

    goto :goto_2

    .line 1145
    :cond_0
    aget-byte v18, v9, v17

    move/from16 v0, v18

    and-int/lit16 v10, v0, 0xff

    .line 1146
    .local v10, "n":I
    aget v18, v4, v17

    rsub-int/lit8 v19, v2, 0x20

    sub-int v19, v19, v10

    shl-int v18, v18, v19

    or-int v1, v1, v18

    .line 1147
    add-int/2addr v2, v10

    .line 1149
    add-int/lit8 v7, v7, 0x1

    .line 1150
    goto :goto_1

    .line 1152
    .end local v10    # "n":I
    .end local v17    # "sfmap_i":I
    :cond_1
    add-int/lit8 v7, v6, 0x1

    .line 1153
    add-int/lit8 v13, v13, 0x1

    .line 1154
    goto :goto_0

    .line 1156
    .end local v4    # "code_selCtr":[I
    .end local v6    # "ge":I
    .end local v9    # "len_selCtr":[B
    .end local v15    # "selector_selCtr":I
    :cond_2
    move-object/from16 v0, p0

    iput v1, v0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->bsBuff:I

    .line 1157
    move-object/from16 v0, p0

    iput v2, v0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->bsLive:I

    .line 1158
    return-void
.end method

.method private write0(I)V
    .locals 3
    .param p1, "b"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, -0x1

    .line 650
    iget v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->currentChar:I

    if-eq v0, v2, :cond_2

    .line 651
    and-int/lit16 p1, p1, 0xff

    .line 652
    iget v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->currentChar:I

    if-ne v0, p1, :cond_1

    .line 653
    iget v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->runLength:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->runLength:I

    const/16 v1, 0xfe

    if-le v0, v1, :cond_0

    .line 654
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->writeRun()V

    .line 655
    iput v2, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->currentChar:I

    .line 656
    const/4 v0, 0x0

    iput v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->runLength:I

    .line 668
    :cond_0
    :goto_0
    return-void

    .line 660
    :cond_1
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->writeRun()V

    .line 661
    const/4 v0, 0x1

    iput v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->runLength:I

    .line 662
    iput p1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->currentChar:I

    goto :goto_0

    .line 665
    :cond_2
    and-int/lit16 v0, p1, 0xff

    iput v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->currentChar:I

    .line 666
    iget v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->runLength:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->runLength:I

    goto :goto_0
.end method

.method private writeRun()V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x1

    .line 425
    iget v4, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->last:I

    .line 427
    .local v4, "lastShadow":I
    iget v6, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->allowableBlockSize:I

    if-ge v4, v6, :cond_0

    .line 428
    iget v2, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->currentChar:I

    .line 429
    .local v2, "currentCharShadow":I
    iget-object v3, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->data:Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;

    .line 430
    .local v3, "dataShadow":Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;
    iget-object v6, v3, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;->inUse:[Z

    aput-boolean v7, v6, v2

    .line 431
    int-to-byte v1, v2

    .line 433
    .local v1, "ch":B
    iget v5, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->runLength:I

    .line 434
    .local v5, "runLengthShadow":I
    iget-object v6, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->crc:Lorg/apache/commons/compress/compressors/bzip2/CRC;

    invoke-virtual {v6, v2, v5}, Lorg/apache/commons/compress/compressors/bzip2/CRC;->updateCRC(II)V

    .line 436
    packed-switch v5, :pswitch_data_0

    .line 458
    add-int/lit8 v5, v5, -0x4

    .line 459
    iget-object v6, v3, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;->inUse:[Z

    aput-boolean v7, v6, v5

    .line 460
    iget-object v0, v3, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;->block:[B

    .line 461
    .local v0, "block":[B
    add-int/lit8 v6, v4, 0x2

    aput-byte v1, v0, v6

    .line 462
    add-int/lit8 v6, v4, 0x3

    aput-byte v1, v0, v6

    .line 463
    add-int/lit8 v6, v4, 0x4

    aput-byte v1, v0, v6

    .line 464
    add-int/lit8 v6, v4, 0x5

    aput-byte v1, v0, v6

    .line 465
    add-int/lit8 v6, v4, 0x6

    int-to-byte v7, v5

    aput-byte v7, v0, v6

    .line 466
    add-int/lit8 v6, v4, 0x5

    iput v6, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->last:I

    .line 476
    .end local v0    # "block":[B
    .end local v1    # "ch":B
    .end local v2    # "currentCharShadow":I
    .end local v3    # "dataShadow":Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;
    .end local v5    # "runLengthShadow":I
    :goto_0
    return-void

    .line 438
    .restart local v1    # "ch":B
    .restart local v2    # "currentCharShadow":I
    .restart local v3    # "dataShadow":Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;
    .restart local v5    # "runLengthShadow":I
    :pswitch_0
    iget-object v6, v3, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;->block:[B

    add-int/lit8 v7, v4, 0x2

    aput-byte v1, v6, v7

    .line 439
    add-int/lit8 v6, v4, 0x1

    iput v6, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->last:I

    goto :goto_0

    .line 443
    :pswitch_1
    iget-object v6, v3, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;->block:[B

    add-int/lit8 v7, v4, 0x2

    aput-byte v1, v6, v7

    .line 444
    iget-object v6, v3, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;->block:[B

    add-int/lit8 v7, v4, 0x3

    aput-byte v1, v6, v7

    .line 445
    add-int/lit8 v6, v4, 0x2

    iput v6, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->last:I

    goto :goto_0

    .line 449
    :pswitch_2
    iget-object v0, v3, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;->block:[B

    .line 450
    .restart local v0    # "block":[B
    add-int/lit8 v6, v4, 0x2

    aput-byte v1, v0, v6

    .line 451
    add-int/lit8 v6, v4, 0x3

    aput-byte v1, v0, v6

    .line 452
    add-int/lit8 v6, v4, 0x4

    aput-byte v1, v0, v6

    .line 453
    add-int/lit8 v6, v4, 0x3

    iput v6, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->last:I

    goto :goto_0

    .line 472
    .end local v0    # "block":[B
    .end local v1    # "ch":B
    .end local v2    # "currentCharShadow":I
    .end local v3    # "dataShadow":Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;
    .end local v5    # "runLengthShadow":I
    :cond_0
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->endBlock()V

    .line 473
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->initBlock()V

    .line 474
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->writeRun()V

    goto :goto_0

    .line 436
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
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
    .line 507
    iget-object v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->out:Ljava/io/OutputStream;

    if-eqz v1, :cond_0

    .line 508
    iget-object v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->out:Ljava/io/OutputStream;

    .line 509
    .local v0, "outShadow":Ljava/io/OutputStream;
    invoke-virtual {p0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->finish()V

    .line 510
    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V

    .line 512
    .end local v0    # "outShadow":Ljava/io/OutputStream;
    :cond_0
    return-void
.end method

.method protected finalize()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 483
    invoke-virtual {p0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->finish()V

    .line 484
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    .line 485
    return-void
.end method

.method public finish()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 489
    iget-object v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->out:Ljava/io/OutputStream;

    if-eqz v0, :cond_1

    .line 491
    :try_start_0
    iget v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->runLength:I

    if-lez v0, :cond_0

    .line 492
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->writeRun()V

    .line 494
    :cond_0
    const/4 v0, -0x1

    iput v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->currentChar:I

    .line 495
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->endBlock()V

    .line 496
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->endCompression()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 498
    iput-object v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->out:Ljava/io/OutputStream;

    .line 499
    iput-object v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->data:Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;

    .line 500
    iput-object v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->blockSorter:Lorg/apache/commons/compress/compressors/bzip2/BlockSort;

    .line 503
    :cond_1
    return-void

    .line 498
    :catchall_0
    move-exception v0

    iput-object v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->out:Ljava/io/OutputStream;

    .line 499
    iput-object v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->data:Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data;

    .line 500
    iput-object v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->blockSorter:Lorg/apache/commons/compress/compressors/bzip2/BlockSort;

    throw v0
.end method

.method public flush()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 516
    iget-object v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->out:Ljava/io/OutputStream;

    .line 517
    .local v0, "outShadow":Ljava/io/OutputStream;
    if-eqz v0, :cond_0

    .line 518
    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V

    .line 520
    :cond_0
    return-void
.end method

.method public final getBlockSize()I
    .locals 1

    .prologue
    .line 619
    iget v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->blockSize100k:I

    return v0
.end method

.method public write(I)V
    .locals 2
    .param p1, "b"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 404
    iget-object v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->out:Ljava/io/OutputStream;

    if-eqz v0, :cond_0

    .line 405
    invoke-direct {p0, p1}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->write0(I)V

    .line 409
    return-void

    .line 407
    :cond_0
    new-instance v0, Ljava/io/IOException;

    const-string/jumbo v1, "closed"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public write([BII)V
    .locals 5
    .param p1, "buf"    # [B
    .param p2, "offs"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 625
    if-gez p2, :cond_0

    .line 626
    new-instance v2, Ljava/lang/IndexOutOfBoundsException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "offs("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, ") < 0."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 628
    :cond_0
    if-gez p3, :cond_1

    .line 629
    new-instance v2, Ljava/lang/IndexOutOfBoundsException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "len("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, ") < 0."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 631
    :cond_1
    add-int v2, p2, p3

    array-length v3, p1

    if-le v2, v3, :cond_2

    .line 632
    new-instance v2, Ljava/lang/IndexOutOfBoundsException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "offs("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, ") + len("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, ") > buf.length("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    array-length v4, p1

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, ")."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 636
    :cond_2
    iget-object v2, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->out:Ljava/io/OutputStream;

    if-nez v2, :cond_3

    .line 637
    new-instance v2, Ljava/io/IOException;

    const-string/jumbo v3, "stream closed"

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 640
    :cond_3
    add-int v0, p2, p3

    .local v0, "hi":I
    move v1, p2

    .end local p2    # "offs":I
    .local v1, "offs":I
    :goto_0
    if-ge v1, v0, :cond_4

    .line 641
    add-int/lit8 p2, v1, 0x1

    .end local v1    # "offs":I
    .restart local p2    # "offs":I
    aget-byte v2, p1, v1

    invoke-direct {p0, v2}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->write0(I)V

    move v1, p2

    .end local p2    # "offs":I
    .restart local v1    # "offs":I
    goto :goto_0

    .line 643
    :cond_4
    return-void
.end method
