.class public Lorg/apache/tools/bzip2/CBZip2OutputStream;
.super Ljava/io/OutputStream;
.source "CBZip2OutputStream.java"

# interfaces
.implements Lorg/apache/tools/bzip2/BZip2Constants;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;
    }
.end annotation


# static fields
.field protected static final CLEARMASK:I = -0x200001

.field protected static final DEPTH_THRESH:I = 0xa

.field protected static final GREATER_ICOST:I = 0xf

.field private static final INCS:[I

.field protected static final LESSER_ICOST:I = 0x0

.field public static final MAX_BLOCKSIZE:I = 0x9

.field public static final MIN_BLOCKSIZE:I = 0x1

.field protected static final QSORT_STACK_SIZE:I = 0x3e8

.field protected static final SETMASK:I = 0x200000

.field protected static final SMALL_THRESH:I = 0x14

.field protected static final WORK_FACTOR:I = 0x1e


# instance fields
.field private allowableBlockSize:I

.field private blockCRC:I

.field private blockRandomised:Z

.field private final blockSize100k:I

.field private bsBuff:I

.field private bsLive:I

.field private combinedCRC:I

.field private final crc:Lorg/apache/tools/bzip2/CRC;

.field private currentChar:I

.field private data:Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;

.field private firstAttempt:Z

.field private last:I

.field private nInUse:I

.field private nMTF:I

.field private origPtr:I

.field private out:Ljava/io/OutputStream;

.field private runLength:I

.field private workDone:I

.field private workLimit:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 210
    const/16 v0, 0xe

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->INCS:[I

    return-void

    :array_0
    .array-data 4
        0x1
        0x4
        0xd
        0x28
        0x79
        0x16c
        0x445
        0xcd0
        0x2671
        0x7354
        0x159fd
        0x40df8
        0xc29e9
        0x247dbc
    .end array-data
.end method

.method public constructor <init>(Ljava/io/OutputStream;)V
    .locals 1
    .param p1, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 609
    const/16 v0, 0x9

    invoke-direct {p0, p1, v0}, Lorg/apache/tools/bzip2/CBZip2OutputStream;-><init>(Ljava/io/OutputStream;I)V

    .line 610
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
    .line 639
    invoke-direct {p0}, Ljava/io/OutputStream;-><init>()V

    .line 546
    new-instance v0, Lorg/apache/tools/bzip2/CRC;

    invoke-direct {v0}, Lorg/apache/tools/bzip2/CRC;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->crc:Lorg/apache/tools/bzip2/CRC;

    .line 560
    const/4 v0, -0x1

    iput v0, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->currentChar:I

    .line 561
    const/4 v0, 0x0

    iput v0, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->runLength:I

    .line 641
    const/4 v0, 0x1

    if-ge p2, v0, :cond_0

    .line 642
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "blockSize("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, ") < 1"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 645
    :cond_0
    const/16 v0, 0x9

    if-le p2, v0, :cond_1

    .line 646
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "blockSize("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, ") > 9"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 650
    :cond_1
    iput p2, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->blockSize100k:I

    .line 651
    iput-object p1, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->out:Ljava/io/OutputStream;

    .line 652
    invoke-direct {p0}, Lorg/apache/tools/bzip2/CBZip2OutputStream;->init()V

    .line 653
    return-void
.end method

.method private blockSort()V
    .locals 6

    .prologue
    const/4 v5, 0x0

    .line 1608
    iget v3, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->last:I

    mul-int/lit8 v3, v3, 0x1e

    iput v3, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->workLimit:I

    .line 1609
    iput v5, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->workDone:I

    .line 1610
    iput-boolean v5, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->blockRandomised:Z

    .line 1611
    const/4 v3, 0x1

    iput-boolean v3, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->firstAttempt:Z

    .line 1612
    invoke-direct {p0}, Lorg/apache/tools/bzip2/CBZip2OutputStream;->mainSort()V

    .line 1614
    iget-boolean v3, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->firstAttempt:Z

    if-eqz v3, :cond_0

    iget v3, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->workDone:I

    iget v4, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->workLimit:I

    if-le v3, v4, :cond_0

    .line 1615
    invoke-direct {p0}, Lorg/apache/tools/bzip2/CBZip2OutputStream;->randomiseBlock()V

    .line 1616
    iput v5, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->workDone:I

    iput v5, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->workLimit:I

    .line 1617
    iput-boolean v5, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->firstAttempt:Z

    .line 1618
    invoke-direct {p0}, Lorg/apache/tools/bzip2/CBZip2OutputStream;->mainSort()V

    .line 1621
    :cond_0
    iget-object v3, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->data:Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;

    iget-object v0, v3, Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;->fmap:[I

    .line 1622
    .local v0, "fmap":[I
    const/4 v3, -0x1

    iput v3, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->origPtr:I

    .line 1623
    const/4 v1, 0x0

    .local v1, "i":I
    iget v2, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->last:I

    .local v2, "lastShadow":I
    :goto_0
    if-gt v1, v2, :cond_1

    .line 1624
    aget v3, v0, v1

    if-nez v3, :cond_2

    .line 1625
    iput v1, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->origPtr:I

    .line 1631
    :cond_1
    return-void

    .line 1623
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method private bsFinishedWithStream()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 919
    :goto_0
    iget v1, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->bsLive:I

    if-lez v1, :cond_0

    .line 920
    iget v1, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->bsBuff:I

    shr-int/lit8 v0, v1, 0x18

    .line 921
    .local v0, "ch":I
    iget-object v1, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v1, v0}, Ljava/io/OutputStream;->write(I)V

    .line 922
    iget v1, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->bsBuff:I

    shl-int/lit8 v1, v1, 0x8

    iput v1, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->bsBuff:I

    .line 923
    iget v1, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->bsLive:I

    add-int/lit8 v1, v1, -0x8

    iput v1, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->bsLive:I

    goto :goto_0

    .line 925
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

    .line 947
    shr-int/lit8 v0, p1, 0x18

    and-int/lit16 v0, v0, 0xff

    invoke-direct {p0, v1, v0}, Lorg/apache/tools/bzip2/CBZip2OutputStream;->bsW(II)V

    .line 948
    shr-int/lit8 v0, p1, 0x10

    and-int/lit16 v0, v0, 0xff

    invoke-direct {p0, v1, v0}, Lorg/apache/tools/bzip2/CBZip2OutputStream;->bsW(II)V

    .line 949
    shr-int/lit8 v0, p1, 0x8

    and-int/lit16 v0, v0, 0xff

    invoke-direct {p0, v1, v0}, Lorg/apache/tools/bzip2/CBZip2OutputStream;->bsW(II)V

    .line 950
    and-int/lit16 v0, p1, 0xff

    invoke-direct {p0, v1, v0}, Lorg/apache/tools/bzip2/CBZip2OutputStream;->bsW(II)V

    .line 951
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
    .line 943
    const/16 v0, 0x8

    invoke-direct {p0, v0, p1}, Lorg/apache/tools/bzip2/CBZip2OutputStream;->bsW(II)V

    .line 944
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
    .line 928
    iget-object v2, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->out:Ljava/io/OutputStream;

    .line 929
    .local v2, "outShadow":Ljava/io/OutputStream;
    iget v1, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->bsLive:I

    .line 930
    .local v1, "bsLiveShadow":I
    iget v0, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->bsBuff:I

    .line 932
    .local v0, "bsBuffShadow":I
    :goto_0
    const/16 v3, 0x8

    if-lt v1, v3, :cond_0

    .line 933
    shr-int/lit8 v3, v0, 0x18

    invoke-virtual {v2, v3}, Ljava/io/OutputStream;->write(I)V

    .line 934
    shl-int/lit8 v0, v0, 0x8

    .line 935
    add-int/lit8 v1, v1, -0x8

    goto :goto_0

    .line 938
    :cond_0
    rsub-int/lit8 v3, v1, 0x20

    sub-int/2addr v3, p1

    shl-int v3, p2, v3

    or-int/2addr v3, v0

    iput v3, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->bsBuff:I

    .line 939
    add-int v3, v1, p1

    iput v3, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->bsLive:I

    .line 940
    return-void
.end method

.method public static chooseBlockSize(J)I
    .locals 4
    .param p0, "inputLength"    # J

    .prologue
    .line 587
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
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v3, 0x59

    const/4 v2, 0x1

    .line 791
    iget-object v0, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->crc:Lorg/apache/tools/bzip2/CRC;

    invoke-virtual {v0}, Lorg/apache/tools/bzip2/CRC;->getFinalCRC()I

    move-result v0

    iput v0, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->blockCRC:I

    .line 792
    iget v0, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->combinedCRC:I

    shl-int/lit8 v0, v0, 0x1

    iget v1, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->combinedCRC:I

    ushr-int/lit8 v1, v1, 0x1f

    or-int/2addr v0, v1

    iput v0, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->combinedCRC:I

    .line 793
    iget v0, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->combinedCRC:I

    iget v1, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->blockCRC:I

    xor-int/2addr v0, v1

    iput v0, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->combinedCRC:I

    .line 796
    iget v0, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->last:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 833
    :goto_0
    return-void

    .line 801
    :cond_0
    invoke-direct {p0}, Lorg/apache/tools/bzip2/CBZip2OutputStream;->blockSort()V

    .line 814
    const/16 v0, 0x31

    invoke-direct {p0, v0}, Lorg/apache/tools/bzip2/CBZip2OutputStream;->bsPutUByte(I)V

    .line 815
    const/16 v0, 0x41

    invoke-direct {p0, v0}, Lorg/apache/tools/bzip2/CBZip2OutputStream;->bsPutUByte(I)V

    .line 816
    invoke-direct {p0, v3}, Lorg/apache/tools/bzip2/CBZip2OutputStream;->bsPutUByte(I)V

    .line 817
    const/16 v0, 0x26

    invoke-direct {p0, v0}, Lorg/apache/tools/bzip2/CBZip2OutputStream;->bsPutUByte(I)V

    .line 818
    const/16 v0, 0x53

    invoke-direct {p0, v0}, Lorg/apache/tools/bzip2/CBZip2OutputStream;->bsPutUByte(I)V

    .line 819
    invoke-direct {p0, v3}, Lorg/apache/tools/bzip2/CBZip2OutputStream;->bsPutUByte(I)V

    .line 822
    iget v0, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->blockCRC:I

    invoke-direct {p0, v0}, Lorg/apache/tools/bzip2/CBZip2OutputStream;->bsPutInt(I)V

    .line 825
    iget-boolean v0, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->blockRandomised:Z

    if-eqz v0, :cond_1

    .line 826
    invoke-direct {p0, v2, v2}, Lorg/apache/tools/bzip2/CBZip2OutputStream;->bsW(II)V

    .line 832
    :goto_1
    invoke-direct {p0}, Lorg/apache/tools/bzip2/CBZip2OutputStream;->moveToFrontCodeAndSend()V

    goto :goto_0

    .line 828
    :cond_1
    const/4 v0, 0x0

    invoke-direct {p0, v2, v0}, Lorg/apache/tools/bzip2/CBZip2OutputStream;->bsW(II)V

    goto :goto_1
.end method

.method private endCompression()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 842
    const/16 v0, 0x17

    invoke-direct {p0, v0}, Lorg/apache/tools/bzip2/CBZip2OutputStream;->bsPutUByte(I)V

    .line 843
    const/16 v0, 0x72

    invoke-direct {p0, v0}, Lorg/apache/tools/bzip2/CBZip2OutputStream;->bsPutUByte(I)V

    .line 844
    const/16 v0, 0x45

    invoke-direct {p0, v0}, Lorg/apache/tools/bzip2/CBZip2OutputStream;->bsPutUByte(I)V

    .line 845
    const/16 v0, 0x38

    invoke-direct {p0, v0}, Lorg/apache/tools/bzip2/CBZip2OutputStream;->bsPutUByte(I)V

    .line 846
    const/16 v0, 0x50

    invoke-direct {p0, v0}, Lorg/apache/tools/bzip2/CBZip2OutputStream;->bsPutUByte(I)V

    .line 847
    const/16 v0, 0x90

    invoke-direct {p0, v0}, Lorg/apache/tools/bzip2/CBZip2OutputStream;->bsPutUByte(I)V

    .line 849
    iget v0, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->combinedCRC:I

    invoke-direct {p0, v0}, Lorg/apache/tools/bzip2/CBZip2OutputStream;->bsPutInt(I)V

    .line 850
    invoke-direct {p0}, Lorg/apache/tools/bzip2/CBZip2OutputStream;->bsFinishedWithStream()V

    .line 851
    return-void
.end method

.method private generateMTFValues()V
    .locals 22

    .prologue
    .line 1934
    move-object/from16 v0, p0

    iget v9, v0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->last:I

    .line 1935
    .local v9, "lastShadow":I
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->data:Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;

    .line 1936
    .local v3, "dataShadow":Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;
    iget-object v7, v3, Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;->inUse:[Z

    .line 1937
    .local v7, "inUse":[Z
    iget-object v2, v3, Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;->block:[B

    .line 1938
    .local v2, "block":[B
    iget-object v5, v3, Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;->fmap:[I

    .line 1939
    .local v5, "fmap":[I
    iget-object v13, v3, Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;->sfmap:[C

    .line 1940
    .local v13, "sfmap":[C
    iget-object v11, v3, Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;->mtfFreq:[I

    .line 1941
    .local v11, "mtfFreq":[I
    iget-object v0, v3, Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;->unseqToSeq:[B

    move-object/from16 v16, v0

    .line 1942
    .local v16, "unseqToSeq":[B
    iget-object v0, v3, Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;->generateMTFValues_yy:[B

    move-object/from16 v18, v0

    .line 1945
    .local v18, "yy":[B
    const/4 v12, 0x0

    .line 1946
    .local v12, "nInUseShadow":I
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_0
    const/16 v20, 0x100

    move/from16 v0, v20

    if-ge v6, v0, :cond_1

    .line 1947
    aget-boolean v20, v7, v6

    if-eqz v20, :cond_0

    .line 1948
    int-to-byte v0, v12

    move/from16 v20, v0

    aput-byte v20, v16, v6

    .line 1949
    add-int/lit8 v12, v12, 0x1

    .line 1946
    :cond_0
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 1952
    :cond_1
    move-object/from16 v0, p0

    iput v12, v0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->nInUse:I

    .line 1954
    add-int/lit8 v4, v12, 0x1

    .line 1956
    .local v4, "eob":I
    move v6, v4

    :goto_1
    if-ltz v6, :cond_2

    .line 1957
    const/16 v20, 0x0

    aput v20, v11, v6

    .line 1956
    add-int/lit8 v6, v6, -0x1

    goto :goto_1

    .line 1960
    :cond_2
    move v6, v12

    :goto_2
    add-int/lit8 v6, v6, -0x1

    if-ltz v6, :cond_3

    .line 1961
    int-to-byte v0, v6

    move/from16 v20, v0

    aput-byte v20, v18, v6

    goto :goto_2

    .line 1964
    :cond_3
    const/16 v17, 0x0

    .line 1965
    .local v17, "wr":I
    const/16 v19, 0x0

    .line 1967
    .local v19, "zPend":I
    const/4 v6, 0x0

    :goto_3
    if-gt v6, v9, :cond_9

    .line 1968
    aget v20, v5, v6

    aget-byte v20, v2, v20

    move/from16 v0, v20

    and-int/lit16 v0, v0, 0xff

    move/from16 v20, v0

    aget-byte v10, v16, v20

    .line 1969
    .local v10, "ll_i":B
    const/16 v20, 0x0

    aget-byte v14, v18, v20

    .line 1970
    .local v14, "tmp":B
    const/4 v8, 0x0

    .line 1972
    .local v8, "j":I
    :goto_4
    if-eq v10, v14, :cond_4

    .line 1973
    add-int/lit8 v8, v8, 0x1

    .line 1974
    move v15, v14

    .line 1975
    .local v15, "tmp2":B
    aget-byte v14, v18, v8

    .line 1976
    aput-byte v15, v18, v8

    goto :goto_4

    .line 1978
    .end local v15    # "tmp2":B
    :cond_4
    const/16 v20, 0x0

    aput-byte v14, v18, v20

    .line 1980
    if-nez v8, :cond_5

    .line 1981
    add-int/lit8 v19, v19, 0x1

    .line 1967
    :goto_5
    add-int/lit8 v6, v6, 0x1

    goto :goto_3

    .line 1983
    :cond_5
    if-lez v19, :cond_8

    .line 1984
    add-int/lit8 v19, v19, -0x1

    .line 1986
    :goto_6
    and-int/lit8 v20, v19, 0x1

    if-nez v20, :cond_6

    .line 1987
    const/16 v20, 0x0

    aput-char v20, v13, v17

    .line 1988
    add-int/lit8 v17, v17, 0x1

    .line 1989
    const/16 v20, 0x0

    aget v21, v11, v20

    add-int/lit8 v21, v21, 0x1

    aput v21, v11, v20

    .line 1996
    :goto_7
    const/16 v20, 0x2

    move/from16 v0, v19

    move/from16 v1, v20

    if-lt v0, v1, :cond_7

    .line 1997
    add-int/lit8 v20, v19, -0x2

    shr-int/lit8 v19, v20, 0x1

    goto :goto_6

    .line 1991
    :cond_6
    const/16 v20, 0x1

    aput-char v20, v13, v17

    .line 1992
    add-int/lit8 v17, v17, 0x1

    .line 1993
    const/16 v20, 0x1

    aget v21, v11, v20

    add-int/lit8 v21, v21, 0x1

    aput v21, v11, v20

    goto :goto_7

    .line 2002
    :cond_7
    const/16 v19, 0x0

    .line 2004
    :cond_8
    add-int/lit8 v20, v8, 0x1

    move/from16 v0, v20

    int-to-char v0, v0

    move/from16 v20, v0

    aput-char v20, v13, v17

    .line 2005
    add-int/lit8 v17, v17, 0x1

    .line 2006
    add-int/lit8 v20, v8, 0x1

    aget v21, v11, v20

    add-int/lit8 v21, v21, 0x1

    aput v21, v11, v20

    goto :goto_5

    .line 2010
    .end local v8    # "j":I
    .end local v10    # "ll_i":B
    .end local v14    # "tmp":B
    :cond_9
    if-lez v19, :cond_b

    .line 2011
    add-int/lit8 v19, v19, -0x1

    .line 2013
    :goto_8
    and-int/lit8 v20, v19, 0x1

    if-nez v20, :cond_a

    .line 2014
    const/16 v20, 0x0

    aput-char v20, v13, v17

    .line 2015
    add-int/lit8 v17, v17, 0x1

    .line 2016
    const/16 v20, 0x0

    aget v21, v11, v20

    add-int/lit8 v21, v21, 0x1

    aput v21, v11, v20

    .line 2023
    :goto_9
    const/16 v20, 0x2

    move/from16 v0, v19

    move/from16 v1, v20

    if-lt v0, v1, :cond_b

    .line 2024
    add-int/lit8 v20, v19, -0x2

    shr-int/lit8 v19, v20, 0x1

    goto :goto_8

    .line 2018
    :cond_a
    const/16 v20, 0x1

    aput-char v20, v13, v17

    .line 2019
    add-int/lit8 v17, v17, 0x1

    .line 2020
    const/16 v20, 0x1

    aget v21, v11, v20

    add-int/lit8 v21, v21, 0x1

    aput v21, v11, v20

    goto :goto_9

    .line 2031
    :cond_b
    int-to-char v0, v4

    move/from16 v20, v0

    aput-char v20, v13, v17

    .line 2032
    aget v20, v11, v4

    add-int/lit8 v20, v20, 0x1

    aput v20, v11, v4

    .line 2033
    add-int/lit8 v20, v17, 0x1

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput v0, v1, Lorg/apache/tools/bzip2/CBZip2OutputStream;->nMTF:I

    .line 2034
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
    .line 906
    const/4 v2, 0x0

    .line 907
    .local v2, "vec":I
    move v1, p2

    .local v1, "n":I
    :goto_0
    if-gt v1, p3, :cond_2

    .line 908
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    if-ge v0, p4, :cond_1

    .line 909
    aget-byte v3, p1, v0

    and-int/lit16 v3, v3, 0xff

    if-ne v3, v1, :cond_0

    .line 910
    aput v2, p0, v0

    .line 911
    add-int/lit8 v2, v2, 0x1

    .line 908
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 914
    :cond_1
    shl-int/lit8 v2, v2, 0x1

    .line 907
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 916
    .end local v0    # "i":I
    :cond_2
    return-void
.end method

.method private static hbMakeCodeLengths([B[ILorg/apache/tools/bzip2/CBZip2OutputStream$Data;II)V
    .locals 23
    .param p0, "len"    # [B
    .param p1, "freq"    # [I
    .param p2, "dat"    # Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;
    .param p3, "alphaSize"    # I
    .param p4, "maxLen"    # I

    .prologue
    .line 382
    move-object/from16 v0, p2

    iget-object v2, v0, Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;->heap:[I

    .line 383
    .local v2, "heap":[I
    move-object/from16 v0, p2

    iget-object v14, v0, Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;->weight:[I

    .line 384
    .local v14, "weight":[I
    move-object/from16 v0, p2

    iget-object v10, v0, Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;->parent:[I

    .line 386
    .local v10, "parent":[I
    move/from16 v3, p3

    .local v3, "i":I
    :goto_0
    add-int/lit8 v3, v3, -0x1

    if-ltz v3, :cond_1

    .line 387
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

    .line 390
    :cond_1
    const/4 v13, 0x1

    .local v13, "tooLong":Z
    :cond_2
    if-eqz v13, :cond_11

    .line 391
    const/4 v13, 0x0

    .line 393
    move/from16 v9, p3

    .line 394
    .local v9, "nNodes":I
    const/4 v8, 0x0

    .line 395
    .local v8, "nHeap":I
    const/16 v20, 0x0

    const/16 v21, 0x0

    aput v21, v2, v20

    .line 396
    const/16 v20, 0x0

    const/16 v21, 0x0

    aput v21, v14, v20

    .line 397
    const/16 v20, 0x0

    const/16 v21, -0x2

    aput v21, v10, v20

    .line 399
    const/4 v3, 0x1

    :goto_2
    move/from16 v0, p3

    if-gt v3, v0, :cond_5

    .line 400
    const/16 v20, -0x1

    aput v20, v10, v3

    .line 401
    add-int/lit8 v8, v8, 0x1

    .line 402
    aput v3, v2, v8

    .line 404
    move/from16 v19, v8

    .line 405
    .local v19, "zz":I
    aget v12, v2, v19

    .line 406
    .local v12, "tmp":I
    :goto_3
    aget v20, v14, v12

    shr-int/lit8 v21, v19, 0x1

    aget v21, v2, v21

    aget v21, v14, v21

    move/from16 v0, v20

    move/from16 v1, v21

    if-ge v0, v1, :cond_3

    .line 407
    shr-int/lit8 v20, v19, 0x1

    aget v20, v2, v20

    aput v20, v2, v19

    .line 408
    shr-int/lit8 v19, v19, 0x1

    goto :goto_3

    .line 410
    :cond_3
    aput v12, v2, v19

    .line 399
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 497
    .local v6, "n1":I
    .local v7, "n2":I
    .local v15, "weight_n1":I
    .local v16, "weight_n2":I
    .local v17, "weight_tmp":I
    .local v18, "yy":I
    :cond_4
    aput v12, v2, v19

    .line 413
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

    .line 414
    const/16 v20, 0x1

    aget v6, v2, v20

    .line 415
    .restart local v6    # "n1":I
    const/16 v20, 0x1

    aget v21, v2, v8

    aput v21, v2, v20

    .line 416
    add-int/lit8 v8, v8, -0x1

    .line 418
    const/16 v18, 0x0

    .line 419
    .restart local v18    # "yy":I
    const/16 v19, 0x1

    .line 420
    .restart local v19    # "zz":I
    const/16 v20, 0x1

    aget v12, v2, v20

    .line 423
    .restart local v12    # "tmp":I
    :goto_4
    shl-int/lit8 v18, v19, 0x1

    .line 425
    move/from16 v0, v18

    if-le v0, v8, :cond_8

    .line 442
    :cond_6
    aput v12, v2, v19

    .line 444
    const/16 v20, 0x1

    aget v7, v2, v20

    .line 445
    .restart local v7    # "n2":I
    const/16 v20, 0x1

    aget v21, v2, v8

    aput v21, v2, v20

    .line 446
    add-int/lit8 v8, v8, -0x1

    .line 448
    const/16 v18, 0x0

    .line 449
    const/16 v19, 0x1

    .line 450
    const/16 v20, 0x1

    aget v12, v2, v20

    .line 453
    :goto_5
    shl-int/lit8 v18, v19, 0x1

    .line 455
    move/from16 v0, v18

    if-le v0, v8, :cond_a

    .line 472
    :cond_7
    aput v12, v2, v19

    .line 473
    add-int/lit8 v9, v9, 0x1

    .line 474
    aput v9, v10, v7

    aput v9, v10, v6

    .line 476
    aget v15, v14, v6

    .line 477
    .restart local v15    # "weight_n1":I
    aget v16, v14, v7

    .line 478
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

    .line 485
    const/16 v20, -0x1

    aput v20, v10, v9

    .line 486
    add-int/lit8 v8, v8, 0x1

    .line 487
    aput v9, v2, v8

    .line 489
    const/4 v12, 0x0

    .line 490
    move/from16 v19, v8

    .line 491
    aget v12, v2, v19

    .line 492
    aget v17, v14, v12

    .line 493
    .restart local v17    # "weight_tmp":I
    :goto_7
    shr-int/lit8 v20, v19, 0x1

    aget v20, v2, v20

    aget v20, v14, v20

    move/from16 v0, v17

    move/from16 v1, v20

    if-ge v0, v1, :cond_4

    .line 494
    shr-int/lit8 v20, v19, 0x1

    aget v20, v2, v20

    aput v20, v2, v19

    .line 495
    shr-int/lit8 v19, v19, 0x1

    goto :goto_7

    .line 429
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

    .line 431
    add-int/lit8 v18, v18, 0x1

    .line 434
    :cond_9
    aget v20, v14, v12

    aget v21, v2, v18

    aget v21, v14, v21

    move/from16 v0, v20

    move/from16 v1, v21

    if-lt v0, v1, :cond_6

    .line 438
    aget v20, v2, v18

    aput v20, v2, v19

    .line 439
    move/from16 v19, v18

    goto/16 :goto_4

    .line 459
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

    .line 461
    add-int/lit8 v18, v18, 0x1

    .line 464
    :cond_b
    aget v20, v14, v12

    aget v21, v2, v18

    aget v21, v14, v21

    move/from16 v0, v20

    move/from16 v1, v21

    if-lt v0, v1, :cond_7

    .line 468
    aget v20, v2, v18

    aput v20, v2, v19

    .line 469
    move/from16 v19, v18

    goto/16 :goto_5

    .line 478
    .restart local v15    # "weight_n1":I
    .restart local v16    # "weight_n2":I
    :cond_c
    move/from16 v0, v16

    and-int/lit16 v0, v0, 0xff

    move/from16 v20, v0

    goto/16 :goto_6

    .line 501
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

    .line 502
    const/4 v4, 0x0

    .line 503
    .local v4, "j":I
    move v5, v3

    .line 505
    .local v5, "k":I
    :goto_9
    aget v11, v10, v5

    .local v11, "parent_k":I
    if-ltz v11, :cond_e

    .line 506
    move v5, v11

    .line 507
    add-int/lit8 v4, v4, 0x1

    goto :goto_9

    .line 510
    :cond_e
    add-int/lit8 v20, v3, -0x1

    int-to-byte v0, v4

    move/from16 v21, v0

    aput-byte v21, p0, v20

    .line 511
    move/from16 v0, p4

    if-le v4, v0, :cond_f

    .line 512
    const/4 v13, 0x1

    .line 501
    :cond_f
    add-int/lit8 v3, v3, 0x1

    goto :goto_8

    .line 516
    .end local v4    # "j":I
    .end local v5    # "k":I
    .end local v11    # "parent_k":I
    :cond_10
    if-eqz v13, :cond_2

    .line 517
    const/4 v3, 0x1

    :goto_a
    move/from16 v0, p3

    if-ge v3, v0, :cond_2

    .line 518
    aget v20, v14, v3

    shr-int/lit8 v4, v20, 0x8

    .line 519
    .restart local v4    # "j":I
    shr-int/lit8 v20, v4, 0x1

    add-int/lit8 v4, v20, 0x1

    .line 520
    shl-int/lit8 v20, v4, 0x8

    aput v20, v14, v3

    .line 517
    add-int/lit8 v3, v3, 0x1

    goto :goto_a

    .line 524
    .end local v4    # "j":I
    .end local v8    # "nHeap":I
    .end local v9    # "nNodes":I
    :cond_11
    return-void
.end method

.method protected static hbMakeCodeLengths([C[III)V
    .locals 23
    .param p0, "len"    # [C
    .param p1, "freq"    # [I
    .param p2, "alphaSize"    # I
    .param p3, "maxLen"    # I

    .prologue
    .line 225
    const/16 v20, 0x204

    move/from16 v0, v20

    new-array v2, v0, [I

    .line 226
    .local v2, "heap":[I
    const/16 v20, 0x204

    move/from16 v0, v20

    new-array v14, v0, [I

    .line 227
    .local v14, "weight":[I
    const/16 v20, 0x204

    move/from16 v0, v20

    new-array v10, v0, [I

    .line 229
    .local v10, "parent":[I
    move/from16 v3, p2

    .local v3, "i":I
    :goto_0
    add-int/lit8 v3, v3, -0x1

    if-ltz v3, :cond_1

    .line 230
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

    .line 233
    :cond_1
    const/4 v13, 0x1

    .local v13, "tooLong":Z
    :cond_2
    if-eqz v13, :cond_11

    .line 234
    const/4 v13, 0x0

    .line 236
    move/from16 v9, p2

    .line 237
    .local v9, "nNodes":I
    const/4 v8, 0x0

    .line 238
    .local v8, "nHeap":I
    const/16 v20, 0x0

    const/16 v21, 0x0

    aput v21, v2, v20

    .line 239
    const/16 v20, 0x0

    const/16 v21, 0x0

    aput v21, v14, v20

    .line 240
    const/16 v20, 0x0

    const/16 v21, -0x2

    aput v21, v10, v20

    .line 242
    const/4 v3, 0x1

    :goto_2
    move/from16 v0, p2

    if-gt v3, v0, :cond_5

    .line 243
    const/16 v20, -0x1

    aput v20, v10, v3

    .line 244
    add-int/lit8 v8, v8, 0x1

    .line 245
    aput v3, v2, v8

    .line 247
    move/from16 v19, v8

    .line 248
    .local v19, "zz":I
    aget v12, v2, v19

    .line 249
    .local v12, "tmp":I
    :goto_3
    aget v20, v14, v12

    shr-int/lit8 v21, v19, 0x1

    aget v21, v2, v21

    aget v21, v14, v21

    move/from16 v0, v20

    move/from16 v1, v21

    if-ge v0, v1, :cond_3

    .line 250
    shr-int/lit8 v20, v19, 0x1

    aget v20, v2, v20

    aput v20, v2, v19

    .line 251
    shr-int/lit8 v19, v19, 0x1

    goto :goto_3

    .line 253
    :cond_3
    aput v12, v2, v19

    .line 242
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 344
    .local v6, "n1":I
    .local v7, "n2":I
    .local v15, "weight_n1":I
    .local v16, "weight_n2":I
    .local v17, "weight_tmp":I
    .local v18, "yy":I
    :cond_4
    aput v12, v2, v19

    .line 258
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

    .line 259
    const/16 v20, 0x1

    aget v6, v2, v20

    .line 260
    .restart local v6    # "n1":I
    const/16 v20, 0x1

    aget v21, v2, v8

    aput v21, v2, v20

    .line 261
    add-int/lit8 v8, v8, -0x1

    .line 263
    const/16 v18, 0x0

    .line 264
    .restart local v18    # "yy":I
    const/16 v19, 0x1

    .line 265
    .restart local v19    # "zz":I
    const/16 v20, 0x1

    aget v12, v2, v20

    .line 268
    .restart local v12    # "tmp":I
    :goto_4
    shl-int/lit8 v18, v19, 0x1

    .line 270
    move/from16 v0, v18

    if-le v0, v8, :cond_8

    .line 287
    :cond_6
    aput v12, v2, v19

    .line 289
    const/16 v20, 0x1

    aget v7, v2, v20

    .line 290
    .restart local v7    # "n2":I
    const/16 v20, 0x1

    aget v21, v2, v8

    aput v21, v2, v20

    .line 291
    add-int/lit8 v8, v8, -0x1

    .line 293
    const/16 v18, 0x0

    .line 294
    const/16 v19, 0x1

    .line 295
    const/16 v20, 0x1

    aget v12, v2, v20

    .line 298
    :goto_5
    shl-int/lit8 v18, v19, 0x1

    .line 300
    move/from16 v0, v18

    if-le v0, v8, :cond_a

    .line 317
    :cond_7
    aput v12, v2, v19

    .line 318
    add-int/lit8 v9, v9, 0x1

    .line 319
    aput v9, v10, v7

    aput v9, v10, v6

    .line 321
    aget v15, v14, v6

    .line 322
    .restart local v15    # "weight_n1":I
    aget v16, v14, v7

    .line 323
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

    .line 332
    const/16 v20, -0x1

    aput v20, v10, v9

    .line 333
    add-int/lit8 v8, v8, 0x1

    .line 334
    aput v9, v2, v8

    .line 336
    const/4 v12, 0x0

    .line 337
    move/from16 v19, v8

    .line 338
    aget v12, v2, v19

    .line 339
    aget v17, v14, v12

    .line 340
    .restart local v17    # "weight_tmp":I
    :goto_7
    shr-int/lit8 v20, v19, 0x1

    aget v20, v2, v20

    aget v20, v14, v20

    move/from16 v0, v17

    move/from16 v1, v20

    if-ge v0, v1, :cond_4

    .line 341
    shr-int/lit8 v20, v19, 0x1

    aget v20, v2, v20

    aput v20, v2, v19

    .line 342
    shr-int/lit8 v19, v19, 0x1

    goto :goto_7

    .line 274
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

    .line 276
    add-int/lit8 v18, v18, 0x1

    .line 279
    :cond_9
    aget v20, v14, v12

    aget v21, v2, v18

    aget v21, v14, v21

    move/from16 v0, v20

    move/from16 v1, v21

    if-lt v0, v1, :cond_6

    .line 283
    aget v20, v2, v18

    aput v20, v2, v19

    .line 284
    move/from16 v19, v18

    goto/16 :goto_4

    .line 304
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

    .line 306
    add-int/lit8 v18, v18, 0x1

    .line 309
    :cond_b
    aget v20, v14, v12

    aget v21, v2, v18

    aget v21, v14, v21

    move/from16 v0, v20

    move/from16 v1, v21

    if-lt v0, v1, :cond_7

    .line 313
    aget v20, v2, v18

    aput v20, v2, v19

    .line 314
    move/from16 v19, v18

    goto/16 :goto_5

    .line 323
    .restart local v15    # "weight_n1":I
    .restart local v16    # "weight_n2":I
    :cond_c
    move/from16 v0, v16

    and-int/lit16 v0, v0, 0xff

    move/from16 v20, v0

    goto/16 :goto_6

    .line 350
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
    move/from16 v0, p2

    if-gt v3, v0, :cond_10

    .line 351
    const/4 v4, 0x0

    .line 352
    .local v4, "j":I
    move v5, v3

    .line 354
    .local v5, "k":I
    :goto_9
    aget v11, v10, v5

    .local v11, "parent_k":I
    if-ltz v11, :cond_e

    .line 355
    move v5, v11

    .line 356
    add-int/lit8 v4, v4, 0x1

    goto :goto_9

    .line 359
    :cond_e
    add-int/lit8 v20, v3, -0x1

    int-to-char v0, v4

    move/from16 v21, v0

    aput-char v21, p0, v20

    .line 360
    move/from16 v0, p3

    if-le v4, v0, :cond_f

    .line 361
    const/4 v13, 0x1

    .line 350
    :cond_f
    add-int/lit8 v3, v3, 0x1

    goto :goto_8

    .line 365
    .end local v4    # "j":I
    .end local v5    # "k":I
    .end local v11    # "parent_k":I
    :cond_10
    if-eqz v13, :cond_2

    .line 366
    const/4 v3, 0x1

    :goto_a
    move/from16 v0, p2

    if-ge v3, v0, :cond_2

    .line 367
    aget v20, v14, v3

    shr-int/lit8 v4, v20, 0x8

    .line 368
    .restart local v4    # "j":I
    shr-int/lit8 v20, v4, 0x1

    add-int/lit8 v4, v20, 0x1

    .line 369
    shl-int/lit8 v20, v4, 0x8

    aput v20, v14, v3

    .line 366
    add-int/lit8 v3, v3, 0x1

    goto :goto_a

    .line 373
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
    .line 762
    new-instance v0, Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;

    iget v1, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->blockSize100k:I

    invoke-direct {v0, v1}, Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;-><init>(I)V

    iput-object v0, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->data:Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;

    .line 768
    const/16 v0, 0x68

    invoke-direct {p0, v0}, Lorg/apache/tools/bzip2/CBZip2OutputStream;->bsPutUByte(I)V

    .line 769
    iget v0, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->blockSize100k:I

    add-int/lit8 v0, v0, 0x30

    invoke-direct {p0, v0}, Lorg/apache/tools/bzip2/CBZip2OutputStream;->bsPutUByte(I)V

    .line 771
    const/4 v0, 0x0

    iput v0, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->combinedCRC:I

    .line 772
    invoke-direct {p0}, Lorg/apache/tools/bzip2/CBZip2OutputStream;->initBlock()V

    .line 773
    return-void
.end method

.method private initBlock()V
    .locals 4

    .prologue
    .line 777
    iget-object v2, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->crc:Lorg/apache/tools/bzip2/CRC;

    invoke-virtual {v2}, Lorg/apache/tools/bzip2/CRC;->initialiseCRC()V

    .line 778
    const/4 v2, -0x1

    iput v2, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->last:I

    .line 781
    iget-object v2, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->data:Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;

    iget-object v1, v2, Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;->inUse:[Z

    .line 782
    .local v1, "inUse":[Z
    const/16 v0, 0x100

    .local v0, "i":I
    :goto_0
    add-int/lit8 v0, v0, -0x1

    if-ltz v0, :cond_0

    .line 783
    const/4 v2, 0x0

    aput-boolean v2, v1, v0

    goto :goto_0

    .line 787
    :cond_0
    iget v2, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->blockSize100k:I

    const v3, 0x186a0

    mul-int/2addr v2, v3

    add-int/lit8 v2, v2, -0x14

    iput v2, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->allowableBlockSize:I

    .line 788
    return-void
.end method

.method private mainQSort3(Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;III)V
    .locals 27
    .param p1, "dataShadow"    # Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;
    .param p2, "loSt"    # I
    .param p3, "hiSt"    # I
    .param p4, "dSt"    # I

    .prologue
    .line 1638
    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;->stack_ll:[I

    move-object/from16 v18, v0

    .line 1639
    .local v18, "stack_ll":[I
    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;->stack_hh:[I

    move-object/from16 v17, v0

    .line 1640
    .local v17, "stack_hh":[I
    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;->stack_dd:[I

    move-object/from16 v16, v0

    .line 1641
    .local v16, "stack_dd":[I
    move-object/from16 v0, p1

    iget-object v5, v0, Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;->fmap:[I

    .line 1642
    .local v5, "fmap":[I
    move-object/from16 v0, p1

    iget-object v2, v0, Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;->block:[B

    .line 1644
    .local v2, "block":[B
    const/16 v24, 0x0

    aput p2, v18, v24

    .line 1645
    const/16 v24, 0x0

    aput p3, v17, v24

    .line 1646
    const/16 v24, 0x0

    aput p4, v16, v24

    .line 1648
    const/4 v15, 0x1

    .local v15, "sp":I
    :cond_0
    :goto_0
    add-int/lit8 v15, v15, -0x1

    if-ltz v15, :cond_2

    .line 1649
    aget v9, v18, v15

    .line 1650
    .local v9, "lo":I
    aget v8, v17, v15

    .line 1651
    .local v8, "hi":I
    aget v3, v16, v15

    .line 1653
    .local v3, "d":I
    sub-int v24, v8, v9

    const/16 v25, 0x14

    move/from16 v0, v24

    move/from16 v1, v25

    if-lt v0, v1, :cond_1

    const/16 v24, 0xa

    move/from16 v0, v24

    if-le v3, v0, :cond_3

    .line 1654
    :cond_1
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v9, v8, v3}, Lorg/apache/tools/bzip2/CBZip2OutputStream;->mainSimpleSort(Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;III)Z

    move-result v24

    if-eqz v24, :cond_0

    .line 1738
    .end local v3    # "d":I
    .end local v8    # "hi":I
    .end local v9    # "lo":I
    :cond_2
    return-void

    .line 1658
    .restart local v3    # "d":I
    .restart local v8    # "hi":I
    .restart local v9    # "lo":I
    :cond_3
    add-int/lit8 v4, v3, 0x1

    .line 1659
    .local v4, "d1":I
    aget v24, v5, v9

    add-int v24, v24, v4

    aget-byte v24, v2, v24

    aget v25, v5, v8

    add-int v25, v25, v4

    aget-byte v25, v2, v25

    add-int v26, v9, v8

    ushr-int/lit8 v26, v26, 0x1

    aget v26, v5, v26

    add-int v26, v26, v4

    aget-byte v26, v2, v26

    invoke-static/range {v24 .. v26}, Lorg/apache/tools/bzip2/CBZip2OutputStream;->med3(BBB)B

    move-result v24

    move/from16 v0, v24

    and-int/lit16 v13, v0, 0xff

    .line 1662
    .local v13, "med":I
    move/from16 v22, v9

    .line 1663
    .local v22, "unLo":I
    move/from16 v20, v8

    .line 1664
    .local v20, "unHi":I
    move v10, v9

    .line 1665
    .local v10, "ltLo":I
    move v6, v8

    .local v6, "gtHi":I
    move v11, v10

    .end local v10    # "ltLo":I
    .local v11, "ltLo":I
    move/from16 v23, v22

    .line 1668
    .end local v22    # "unLo":I
    .local v23, "unLo":I
    :goto_1
    move/from16 v0, v23

    move/from16 v1, v20

    if-gt v0, v1, :cond_b

    .line 1669
    aget v24, v5, v23

    add-int v24, v24, v4

    aget-byte v24, v2, v24

    move/from16 v0, v24

    and-int/lit16 v0, v0, 0xff

    move/from16 v24, v0

    sub-int v14, v24, v13

    .line 1671
    .local v14, "n":I
    if-nez v14, :cond_4

    .line 1672
    aget v19, v5, v23

    .line 1673
    .local v19, "temp":I
    add-int/lit8 v22, v23, 0x1

    .end local v23    # "unLo":I
    .restart local v22    # "unLo":I
    aget v24, v5, v11

    aput v24, v5, v23

    .line 1674
    add-int/lit8 v10, v11, 0x1

    .end local v11    # "ltLo":I
    .restart local v10    # "ltLo":I
    aput v19, v5, v11

    .end local v19    # "temp":I
    :goto_2
    move v11, v10

    .end local v10    # "ltLo":I
    .restart local v11    # "ltLo":I
    move/from16 v23, v22

    .line 1678
    .end local v22    # "unLo":I
    .restart local v23    # "unLo":I
    goto :goto_1

    .line 1675
    :cond_4
    if-gez v14, :cond_b

    .line 1676
    add-int/lit8 v22, v23, 0x1

    .end local v23    # "unLo":I
    .restart local v22    # "unLo":I
    move v10, v11

    .end local v11    # "ltLo":I
    .restart local v10    # "ltLo":I
    goto :goto_2

    .line 1682
    .end local v6    # "gtHi":I
    .end local v10    # "ltLo":I
    .end local v14    # "n":I
    .end local v20    # "unHi":I
    .end local v22    # "unLo":I
    .local v7, "gtHi":I
    .restart local v11    # "ltLo":I
    .local v21, "unHi":I
    .restart local v23    # "unLo":I
    :goto_3
    move/from16 v0, v23

    move/from16 v1, v21

    if-gt v0, v1, :cond_6

    .line 1683
    aget v24, v5, v21

    add-int v24, v24, v4

    aget-byte v24, v2, v24

    move/from16 v0, v24

    and-int/lit16 v0, v0, 0xff

    move/from16 v24, v0

    sub-int v14, v24, v13

    .line 1685
    .restart local v14    # "n":I
    if-nez v14, :cond_5

    .line 1686
    aget v19, v5, v21

    .line 1687
    .restart local v19    # "temp":I
    add-int/lit8 v20, v21, -0x1

    .end local v21    # "unHi":I
    .restart local v20    # "unHi":I
    aget v24, v5, v7

    aput v24, v5, v21

    .line 1688
    add-int/lit8 v6, v7, -0x1

    .end local v7    # "gtHi":I
    .restart local v6    # "gtHi":I
    aput v19, v5, v7

    .end local v19    # "temp":I
    :goto_4
    move v7, v6

    .end local v6    # "gtHi":I
    .restart local v7    # "gtHi":I
    move/from16 v21, v20

    .line 1692
    .end local v20    # "unHi":I
    .restart local v21    # "unHi":I
    goto :goto_3

    .line 1689
    :cond_5
    if-lez v14, :cond_6

    .line 1690
    add-int/lit8 v20, v21, -0x1

    .end local v21    # "unHi":I
    .restart local v20    # "unHi":I
    move v6, v7

    .end local v7    # "gtHi":I
    .restart local v6    # "gtHi":I
    goto :goto_4

    .line 1696
    .end local v6    # "gtHi":I
    .end local v14    # "n":I
    .end local v20    # "unHi":I
    .restart local v7    # "gtHi":I
    .restart local v21    # "unHi":I
    :cond_6
    move/from16 v0, v23

    move/from16 v1, v21

    if-gt v0, v1, :cond_7

    .line 1697
    aget v19, v5, v23

    .line 1698
    .restart local v19    # "temp":I
    add-int/lit8 v22, v23, 0x1

    .end local v23    # "unLo":I
    .restart local v22    # "unLo":I
    aget v24, v5, v21

    aput v24, v5, v23

    .line 1699
    add-int/lit8 v20, v21, -0x1

    .end local v21    # "unHi":I
    .restart local v20    # "unHi":I
    aput v19, v5, v21

    move v6, v7

    .end local v7    # "gtHi":I
    .restart local v6    # "gtHi":I
    move/from16 v23, v22

    .end local v22    # "unLo":I
    .restart local v23    # "unLo":I
    goto :goto_1

    .line 1705
    .end local v6    # "gtHi":I
    .end local v19    # "temp":I
    .end local v20    # "unHi":I
    .restart local v7    # "gtHi":I
    .restart local v21    # "unHi":I
    :cond_7
    if-ge v7, v11, :cond_8

    .line 1706
    aput v9, v18, v15

    .line 1707
    aput v8, v17, v15

    .line 1708
    aput v4, v16, v15

    .line 1709
    add-int/lit8 v15, v15, 0x1

    goto/16 :goto_0

    .line 1711
    :cond_8
    sub-int v24, v11, v9

    sub-int v25, v23, v11

    move/from16 v0, v24

    move/from16 v1, v25

    if-ge v0, v1, :cond_9

    sub-int v14, v11, v9

    .line 1713
    .restart local v14    # "n":I
    :goto_5
    sub-int v24, v23, v14

    move/from16 v0, v24

    invoke-static {v5, v9, v0, v14}, Lorg/apache/tools/bzip2/CBZip2OutputStream;->vswap([IIII)V

    .line 1714
    sub-int v24, v8, v7

    sub-int v25, v7, v21

    move/from16 v0, v24

    move/from16 v1, v25

    if-ge v0, v1, :cond_a

    sub-int v12, v8, v7

    .line 1716
    .local v12, "m":I
    :goto_6
    sub-int v24, v8, v12

    add-int/lit8 v24, v24, 0x1

    move/from16 v0, v23

    move/from16 v1, v24

    invoke-static {v5, v0, v1, v12}, Lorg/apache/tools/bzip2/CBZip2OutputStream;->vswap([IIII)V

    .line 1718
    add-int v24, v9, v23

    sub-int v24, v24, v11

    add-int/lit8 v14, v24, -0x1

    .line 1719
    sub-int v24, v7, v21

    sub-int v24, v8, v24

    add-int/lit8 v12, v24, 0x1

    .line 1721
    aput v9, v18, v15

    .line 1722
    aput v14, v17, v15

    .line 1723
    aput v3, v16, v15

    .line 1724
    add-int/lit8 v15, v15, 0x1

    .line 1726
    add-int/lit8 v24, v14, 0x1

    aput v24, v18, v15

    .line 1727
    add-int/lit8 v24, v12, -0x1

    aput v24, v17, v15

    .line 1728
    aput v4, v16, v15

    .line 1729
    add-int/lit8 v15, v15, 0x1

    .line 1731
    aput v12, v18, v15

    .line 1732
    aput v8, v17, v15

    .line 1733
    aput v3, v16, v15

    .line 1734
    add-int/lit8 v15, v15, 0x1

    goto/16 :goto_0

    .line 1711
    .end local v12    # "m":I
    .end local v14    # "n":I
    :cond_9
    sub-int v14, v23, v11

    goto :goto_5

    .line 1714
    .restart local v14    # "n":I
    :cond_a
    sub-int v12, v7, v21

    goto :goto_6

    .end local v7    # "gtHi":I
    .end local v14    # "n":I
    .end local v21    # "unHi":I
    .restart local v6    # "gtHi":I
    .restart local v20    # "unHi":I
    :cond_b
    move v7, v6

    .end local v6    # "gtHi":I
    .restart local v7    # "gtHi":I
    move/from16 v21, v20

    .end local v20    # "unHi":I
    .restart local v21    # "unHi":I
    goto/16 :goto_3
.end method

.method private mainSimpleSort(Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;III)Z
    .locals 26
    .param p1, "dataShadow"    # Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;
    .param p2, "lo"    # I
    .param p3, "hi"    # I
    .param p4, "d"    # I

    .prologue
    .line 1411
    sub-int v24, p3, p2

    add-int/lit8 v3, v24, 0x1

    .line 1412
    .local v3, "bigN":I
    const/16 v24, 0x2

    move/from16 v0, v24

    if-ge v3, v0, :cond_1

    .line 1413
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->firstAttempt:Z

    move/from16 v24, v0

    if-eqz v24, :cond_0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->workDone:I

    move/from16 v24, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->workLimit:I

    move/from16 v25, v0

    move/from16 v0, v24

    move/from16 v1, v25

    if-le v0, v1, :cond_0

    const/16 v24, 0x1

    .line 1590
    :goto_0
    return v24

    .line 1413
    :cond_0
    const/16 v24, 0x0

    goto :goto_0

    .line 1416
    :cond_1
    const/4 v8, 0x0

    .line 1417
    .local v8, "hp":I
    :goto_1
    sget-object v24, Lorg/apache/tools/bzip2/CBZip2OutputStream;->INCS:[I

    aget v24, v24, v8

    move/from16 v0, v24

    if-ge v0, v3, :cond_2

    .line 1418
    add-int/lit8 v8, v8, 0x1

    goto :goto_1

    .line 1421
    :cond_2
    move-object/from16 v0, p1

    iget-object v6, v0, Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;->fmap:[I

    .line 1422
    .local v6, "fmap":[I
    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;->quadrant:[C

    move-object/from16 v18, v0

    .line 1423
    .local v18, "quadrant":[C
    move-object/from16 v0, p1

    iget-object v4, v0, Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;->block:[B

    .line 1424
    .local v4, "block":[B
    move-object/from16 v0, p0

    iget v15, v0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->last:I

    .line 1425
    .local v15, "lastShadow":I
    add-int/lit8 v14, v15, 0x1

    .line 1426
    .local v14, "lastPlus1":I
    move-object/from16 v0, p0

    iget-boolean v5, v0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->firstAttempt:Z

    .line 1427
    .local v5, "firstAttemptShadow":Z
    move-object/from16 v0, p0

    iget v0, v0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->workLimit:I

    move/from16 v22, v0

    .line 1428
    .local v22, "workLimitShadow":I
    move-object/from16 v0, p0

    iget v0, v0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->workDone:I

    move/from16 v21, v0

    .line 1433
    .local v21, "workDoneShadow":I
    :cond_3
    add-int/lit8 v8, v8, -0x1

    if-ltz v8, :cond_19

    .line 1434
    sget-object v24, Lorg/apache/tools/bzip2/CBZip2OutputStream;->INCS:[I

    aget v7, v24, v8

    .line 1435
    .local v7, "h":I
    add-int v24, p2, v7

    add-int/lit8 v16, v24, -0x1

    .line 1437
    .local v16, "mj":I
    add-int v9, p2, v7

    .local v9, "i":I
    :cond_4
    move/from16 v0, p3

    if-gt v9, v0, :cond_3

    .line 1439
    const/4 v13, 0x3

    .local v13, "k":I
    :goto_2
    move/from16 v0, p3

    if-gt v9, v0, :cond_18

    add-int/lit8 v13, v13, -0x1

    if-ltz v13, :cond_18

    .line 1440
    aget v19, v6, v9

    .line 1441
    .local v19, "v":I
    add-int v20, v19, p4

    .line 1442
    .local v20, "vd":I
    move v12, v9

    .line 1454
    .local v12, "j":I
    const/16 v17, 0x0

    .line 1455
    .local v17, "onceRunned":Z
    const/4 v2, 0x0

    .line 1458
    .local v2, "a":I
    :goto_3
    if-eqz v17, :cond_6

    .line 1459
    aput v2, v6, v12

    .line 1460
    sub-int/2addr v12, v7

    move/from16 v0, v16

    if-gt v12, v0, :cond_7

    .line 1579
    :cond_5
    aput v19, v6, v12

    .line 1439
    add-int/lit8 v9, v9, 0x1

    goto :goto_2

    .line 1464
    :cond_6
    const/16 v17, 0x1

    .line 1467
    :cond_7
    sub-int v24, v12, v7

    aget v2, v6, v24

    .line 1468
    add-int v10, v2, p4

    .line 1469
    .local v10, "i1":I
    move/from16 v11, v20

    .line 1473
    .local v11, "i2":I
    add-int/lit8 v24, v10, 0x1

    aget-byte v24, v4, v24

    add-int/lit8 v25, v11, 0x1

    aget-byte v25, v4, v25

    move/from16 v0, v24

    move/from16 v1, v25

    if-ne v0, v1, :cond_17

    .line 1474
    add-int/lit8 v24, v10, 0x2

    aget-byte v24, v4, v24

    add-int/lit8 v25, v11, 0x2

    aget-byte v25, v4, v25

    move/from16 v0, v24

    move/from16 v1, v25

    if-ne v0, v1, :cond_16

    .line 1475
    add-int/lit8 v24, v10, 0x3

    aget-byte v24, v4, v24

    add-int/lit8 v25, v11, 0x3

    aget-byte v25, v4, v25

    move/from16 v0, v24

    move/from16 v1, v25

    if-ne v0, v1, :cond_15

    .line 1476
    add-int/lit8 v24, v10, 0x4

    aget-byte v24, v4, v24

    add-int/lit8 v25, v11, 0x4

    aget-byte v25, v4, v25

    move/from16 v0, v24

    move/from16 v1, v25

    if-ne v0, v1, :cond_14

    .line 1477
    add-int/lit8 v24, v10, 0x5

    aget-byte v24, v4, v24

    add-int/lit8 v25, v11, 0x5

    aget-byte v25, v4, v25

    move/from16 v0, v24

    move/from16 v1, v25

    if-ne v0, v1, :cond_13

    .line 1478
    add-int/lit8 v10, v10, 0x6

    aget-byte v24, v4, v10

    add-int/lit8 v11, v11, 0x6

    aget-byte v25, v4, v11

    move/from16 v0, v24

    move/from16 v1, v25

    if-ne v0, v1, :cond_12

    .line 1479
    move/from16 v23, v15

    .line 1480
    .local v23, "x":I
    :goto_4
    if-lez v23, :cond_5

    .line 1481
    add-int/lit8 v23, v23, -0x4

    .line 1483
    add-int/lit8 v24, v10, 0x1

    aget-byte v24, v4, v24

    add-int/lit8 v25, v11, 0x1

    aget-byte v25, v4, v25

    move/from16 v0, v24

    move/from16 v1, v25

    if-ne v0, v1, :cond_11

    .line 1484
    aget-char v24, v18, v10

    aget-char v25, v18, v11

    move/from16 v0, v24

    move/from16 v1, v25

    if-ne v0, v1, :cond_10

    .line 1485
    add-int/lit8 v24, v10, 0x2

    aget-byte v24, v4, v24

    add-int/lit8 v25, v11, 0x2

    aget-byte v25, v4, v25

    move/from16 v0, v24

    move/from16 v1, v25

    if-ne v0, v1, :cond_f

    .line 1486
    add-int/lit8 v24, v10, 0x1

    aget-char v24, v18, v24

    add-int/lit8 v25, v11, 0x1

    aget-char v25, v18, v25

    move/from16 v0, v24

    move/from16 v1, v25

    if-ne v0, v1, :cond_e

    .line 1487
    add-int/lit8 v24, v10, 0x3

    aget-byte v24, v4, v24

    add-int/lit8 v25, v11, 0x3

    aget-byte v25, v4, v25

    move/from16 v0, v24

    move/from16 v1, v25

    if-ne v0, v1, :cond_d

    .line 1488
    add-int/lit8 v24, v10, 0x2

    aget-char v24, v18, v24

    add-int/lit8 v25, v11, 0x2

    aget-char v25, v18, v25

    move/from16 v0, v24

    move/from16 v1, v25

    if-ne v0, v1, :cond_c

    .line 1489
    add-int/lit8 v24, v10, 0x4

    aget-byte v24, v4, v24

    add-int/lit8 v25, v11, 0x4

    aget-byte v25, v4, v25

    move/from16 v0, v24

    move/from16 v1, v25

    if-ne v0, v1, :cond_b

    .line 1490
    add-int/lit8 v24, v10, 0x3

    aget-char v24, v18, v24

    add-int/lit8 v25, v11, 0x3

    aget-char v25, v18, v25

    move/from16 v0, v24

    move/from16 v1, v25

    if-ne v0, v1, :cond_a

    .line 1491
    add-int/lit8 v10, v10, 0x4

    if-lt v10, v14, :cond_8

    .line 1492
    sub-int/2addr v10, v14

    .line 1494
    :cond_8
    add-int/lit8 v11, v11, 0x4

    if-lt v11, v14, :cond_9

    .line 1495
    sub-int/2addr v11, v14

    .line 1497
    :cond_9
    add-int/lit8 v21, v21, 0x1

    .line 1498
    goto :goto_4

    .line 1499
    :cond_a
    add-int/lit8 v24, v10, 0x3

    aget-char v24, v18, v24

    add-int/lit8 v25, v11, 0x3

    aget-char v25, v18, v25

    move/from16 v0, v24

    move/from16 v1, v25

    if-le v0, v1, :cond_5

    goto/16 :goto_3

    .line 1504
    :cond_b
    add-int/lit8 v24, v10, 0x4

    aget-byte v24, v4, v24

    move/from16 v0, v24

    and-int/lit16 v0, v0, 0xff

    move/from16 v24, v0

    add-int/lit8 v25, v11, 0x4

    aget-byte v25, v4, v25

    move/from16 v0, v25

    and-int/lit16 v0, v0, 0xff

    move/from16 v25, v0

    move/from16 v0, v24

    move/from16 v1, v25

    if-le v0, v1, :cond_5

    goto/16 :goto_3

    .line 1509
    :cond_c
    add-int/lit8 v24, v10, 0x2

    aget-char v24, v18, v24

    add-int/lit8 v25, v11, 0x2

    aget-char v25, v18, v25

    move/from16 v0, v24

    move/from16 v1, v25

    if-le v0, v1, :cond_5

    goto/16 :goto_3

    .line 1514
    :cond_d
    add-int/lit8 v24, v10, 0x3

    aget-byte v24, v4, v24

    move/from16 v0, v24

    and-int/lit16 v0, v0, 0xff

    move/from16 v24, v0

    add-int/lit8 v25, v11, 0x3

    aget-byte v25, v4, v25

    move/from16 v0, v25

    and-int/lit16 v0, v0, 0xff

    move/from16 v25, v0

    move/from16 v0, v24

    move/from16 v1, v25

    if-le v0, v1, :cond_5

    goto/16 :goto_3

    .line 1519
    :cond_e
    add-int/lit8 v24, v10, 0x1

    aget-char v24, v18, v24

    add-int/lit8 v25, v11, 0x1

    aget-char v25, v18, v25

    move/from16 v0, v24

    move/from16 v1, v25

    if-le v0, v1, :cond_5

    goto/16 :goto_3

    .line 1524
    :cond_f
    add-int/lit8 v24, v10, 0x2

    aget-byte v24, v4, v24

    move/from16 v0, v24

    and-int/lit16 v0, v0, 0xff

    move/from16 v24, v0

    add-int/lit8 v25, v11, 0x2

    aget-byte v25, v4, v25

    move/from16 v0, v25

    and-int/lit16 v0, v0, 0xff

    move/from16 v25, v0

    move/from16 v0, v24

    move/from16 v1, v25

    if-le v0, v1, :cond_5

    goto/16 :goto_3

    .line 1529
    :cond_10
    aget-char v24, v18, v10

    aget-char v25, v18, v11

    move/from16 v0, v24

    move/from16 v1, v25

    if-le v0, v1, :cond_5

    goto/16 :goto_3

    .line 1534
    :cond_11
    add-int/lit8 v24, v10, 0x1

    aget-byte v24, v4, v24

    move/from16 v0, v24

    and-int/lit16 v0, v0, 0xff

    move/from16 v24, v0

    add-int/lit8 v25, v11, 0x1

    aget-byte v25, v4, v25

    move/from16 v0, v25

    and-int/lit16 v0, v0, 0xff

    move/from16 v25, v0

    move/from16 v0, v24

    move/from16 v1, v25

    if-le v0, v1, :cond_5

    goto/16 :goto_3

    .line 1544
    .end local v23    # "x":I
    :cond_12
    aget-byte v24, v4, v10

    move/from16 v0, v24

    and-int/lit16 v0, v0, 0xff

    move/from16 v24, v0

    aget-byte v25, v4, v11

    move/from16 v0, v25

    and-int/lit16 v0, v0, 0xff

    move/from16 v25, v0

    move/from16 v0, v24

    move/from16 v1, v25

    if-le v0, v1, :cond_5

    goto/16 :goto_3

    .line 1550
    :cond_13
    add-int/lit8 v24, v10, 0x5

    aget-byte v24, v4, v24

    move/from16 v0, v24

    and-int/lit16 v0, v0, 0xff

    move/from16 v24, v0

    add-int/lit8 v25, v11, 0x5

    aget-byte v25, v4, v25

    move/from16 v0, v25

    and-int/lit16 v0, v0, 0xff

    move/from16 v25, v0

    move/from16 v0, v24

    move/from16 v1, v25

    if-le v0, v1, :cond_5

    goto/16 :goto_3

    .line 1555
    :cond_14
    add-int/lit8 v24, v10, 0x4

    aget-byte v24, v4, v24

    move/from16 v0, v24

    and-int/lit16 v0, v0, 0xff

    move/from16 v24, v0

    add-int/lit8 v25, v11, 0x4

    aget-byte v25, v4, v25

    move/from16 v0, v25

    and-int/lit16 v0, v0, 0xff

    move/from16 v25, v0

    move/from16 v0, v24

    move/from16 v1, v25

    if-le v0, v1, :cond_5

    goto/16 :goto_3

    .line 1560
    :cond_15
    add-int/lit8 v24, v10, 0x3

    aget-byte v24, v4, v24

    move/from16 v0, v24

    and-int/lit16 v0, v0, 0xff

    move/from16 v24, v0

    add-int/lit8 v25, v11, 0x3

    aget-byte v25, v4, v25

    move/from16 v0, v25

    and-int/lit16 v0, v0, 0xff

    move/from16 v25, v0

    move/from16 v0, v24

    move/from16 v1, v25

    if-le v0, v1, :cond_5

    goto/16 :goto_3

    .line 1565
    :cond_16
    add-int/lit8 v24, v10, 0x2

    aget-byte v24, v4, v24

    move/from16 v0, v24

    and-int/lit16 v0, v0, 0xff

    move/from16 v24, v0

    add-int/lit8 v25, v11, 0x2

    aget-byte v25, v4, v25

    move/from16 v0, v25

    and-int/lit16 v0, v0, 0xff

    move/from16 v25, v0

    move/from16 v0, v24

    move/from16 v1, v25

    if-le v0, v1, :cond_5

    goto/16 :goto_3

    .line 1570
    :cond_17
    add-int/lit8 v24, v10, 0x1

    aget-byte v24, v4, v24

    move/from16 v0, v24

    and-int/lit16 v0, v0, 0xff

    move/from16 v24, v0

    add-int/lit8 v25, v11, 0x1

    aget-byte v25, v4, v25

    move/from16 v0, v25

    and-int/lit16 v0, v0, 0xff

    move/from16 v25, v0

    move/from16 v0, v24

    move/from16 v1, v25

    if-le v0, v1, :cond_5

    goto/16 :goto_3

    .line 1582
    .end local v2    # "a":I
    .end local v10    # "i1":I
    .end local v11    # "i2":I
    .end local v12    # "j":I
    .end local v17    # "onceRunned":Z
    .end local v19    # "v":I
    .end local v20    # "vd":I
    :cond_18
    if-eqz v5, :cond_4

    move/from16 v0, p3

    if-gt v9, v0, :cond_4

    move/from16 v0, v21

    move/from16 v1, v22

    if-le v0, v1, :cond_4

    .line 1589
    .end local v7    # "h":I
    .end local v9    # "i":I
    .end local v13    # "k":I
    .end local v16    # "mj":I
    :cond_19
    move/from16 v0, v21

    move-object/from16 v1, p0

    iput v0, v1, Lorg/apache/tools/bzip2/CBZip2OutputStream;->workDone:I

    .line 1590
    if-eqz v5, :cond_1a

    move/from16 v0, v21

    move/from16 v1, v22

    if-le v0, v1, :cond_1a

    const/16 v24, 0x1

    goto/16 :goto_0

    :cond_1a
    const/16 v24, 0x0

    goto/16 :goto_0
.end method

.method private mainSort()V
    .locals 39

    .prologue
    .line 1741
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->data:Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;

    .line 1742
    .local v14, "dataShadow":Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;
    iget-object v0, v14, Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;->mainSort_runningOrder:[I

    move-object/from16 v30, v0

    .line 1743
    .local v30, "runningOrder":[I
    iget-object v13, v14, Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;->mainSort_copy:[I

    .line 1744
    .local v13, "copy":[I
    iget-object v9, v14, Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;->mainSort_bigDone:[Z

    .line 1745
    .local v9, "bigDone":[Z
    iget-object v0, v14, Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;->ftab:[I

    move-object/from16 v18, v0

    .line 1746
    .local v18, "ftab":[I
    iget-object v10, v14, Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;->block:[B

    .line 1747
    .local v10, "block":[B
    iget-object v0, v14, Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;->fmap:[I

    move-object/from16 v16, v0

    .line 1748
    .local v16, "fmap":[I
    iget-object v0, v14, Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;->quadrant:[C

    move-object/from16 v28, v0

    .line 1749
    .local v28, "quadrant":[C
    move-object/from16 v0, p0

    iget v0, v0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->last:I

    move/from16 v25, v0

    .line 1750
    .local v25, "lastShadow":I
    move-object/from16 v0, p0

    iget v0, v0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->workLimit:I

    move/from16 v35, v0

    .line 1751
    .local v35, "workLimitShadow":I
    move-object/from16 v0, p0

    iget-boolean v15, v0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->firstAttempt:Z

    .line 1754
    .local v15, "firstAttemptShadow":Z
    const v23, 0x10001

    .local v23, "i":I
    :goto_0
    add-int/lit8 v23, v23, -0x1

    if-ltz v23, :cond_0

    .line 1755
    const/16 v36, 0x0

    aput v36, v18, v23

    goto :goto_0

    .line 1763
    :cond_0
    const/16 v23, 0x0

    :goto_1
    const/16 v36, 0x14

    move/from16 v0, v23

    move/from16 v1, v36

    if-ge v0, v1, :cond_1

    .line 1764
    add-int v36, v25, v23

    add-int/lit8 v36, v36, 0x2

    add-int/lit8 v37, v25, 0x1

    rem-int v37, v23, v37

    add-int/lit8 v37, v37, 0x1

    aget-byte v37, v10, v37

    aput-byte v37, v10, v36

    .line 1763
    add-int/lit8 v23, v23, 0x1

    goto :goto_1

    .line 1766
    :cond_1
    add-int/lit8 v36, v25, 0x14

    add-int/lit8 v23, v36, 0x1

    :goto_2
    add-int/lit8 v23, v23, -0x1

    if-ltz v23, :cond_2

    .line 1767
    const/16 v36, 0x0

    aput-char v36, v28, v23

    goto :goto_2

    .line 1769
    :cond_2
    const/16 v36, 0x0

    add-int/lit8 v37, v25, 0x1

    aget-byte v37, v10, v37

    aput-byte v37, v10, v36

    .line 1773
    const/16 v36, 0x0

    aget-byte v36, v10, v36

    move/from16 v0, v36

    and-int/lit16 v11, v0, 0xff

    .line 1774
    .local v11, "c1":I
    const/16 v23, 0x0

    :goto_3
    move/from16 v0, v23

    move/from16 v1, v25

    if-gt v0, v1, :cond_3

    .line 1775
    add-int/lit8 v36, v23, 0x1

    aget-byte v36, v10, v36

    move/from16 v0, v36

    and-int/lit16 v12, v0, 0xff

    .line 1776
    .local v12, "c2":I
    shl-int/lit8 v36, v11, 0x8

    add-int v36, v36, v12

    aget v37, v18, v36

    add-int/lit8 v37, v37, 0x1

    aput v37, v18, v36

    .line 1777
    move v11, v12

    .line 1774
    add-int/lit8 v23, v23, 0x1

    goto :goto_3

    .line 1780
    .end local v12    # "c2":I
    :cond_3
    const/16 v23, 0x1

    :goto_4
    const/high16 v36, 0x10000

    move/from16 v0, v23

    move/from16 v1, v36

    if-gt v0, v1, :cond_4

    .line 1781
    aget v36, v18, v23

    add-int/lit8 v37, v23, -0x1

    aget v37, v18, v37

    add-int v36, v36, v37

    aput v36, v18, v23

    .line 1780
    add-int/lit8 v23, v23, 0x1

    goto :goto_4

    .line 1783
    :cond_4
    const/16 v36, 0x1

    aget-byte v36, v10, v36

    move/from16 v0, v36

    and-int/lit16 v11, v0, 0xff

    .line 1784
    const/16 v23, 0x0

    :goto_5
    move/from16 v0, v23

    move/from16 v1, v25

    if-ge v0, v1, :cond_5

    .line 1785
    add-int/lit8 v36, v23, 0x2

    aget-byte v36, v10, v36

    move/from16 v0, v36

    and-int/lit16 v12, v0, 0xff

    .line 1786
    .restart local v12    # "c2":I
    shl-int/lit8 v36, v11, 0x8

    add-int v36, v36, v12

    aget v37, v18, v36

    add-int/lit8 v37, v37, -0x1

    aput v37, v18, v36

    aput v23, v16, v37

    .line 1787
    move v11, v12

    .line 1784
    add-int/lit8 v23, v23, 0x1

    goto :goto_5

    .line 1790
    .end local v12    # "c2":I
    :cond_5
    add-int/lit8 v36, v25, 0x1

    aget-byte v36, v10, v36

    move/from16 v0, v36

    and-int/lit16 v0, v0, 0xff

    move/from16 v36, v0

    shl-int/lit8 v36, v36, 0x8

    const/16 v37, 0x1

    aget-byte v37, v10, v37

    move/from16 v0, v37

    and-int/lit16 v0, v0, 0xff

    move/from16 v37, v0

    add-int v36, v36, v37

    aget v37, v18, v36

    add-int/lit8 v37, v37, -0x1

    aput v37, v18, v36

    aput v25, v16, v37

    .line 1796
    const/16 v23, 0x100

    :goto_6
    add-int/lit8 v23, v23, -0x1

    if-ltz v23, :cond_6

    .line 1797
    const/16 v36, 0x0

    aput-boolean v36, v9, v23

    .line 1798
    aput v23, v30, v23

    goto :goto_6

    .line 1801
    :cond_6
    const/16 v20, 0x16c

    .local v20, "h":I
    :cond_7
    const/16 v36, 0x1

    move/from16 v0, v20

    move/from16 v1, v36

    if-eq v0, v1, :cond_a

    .line 1802
    div-int/lit8 v20, v20, 0x3

    .line 1803
    move/from16 v23, v20

    :goto_7
    const/16 v36, 0xff

    move/from16 v0, v23

    move/from16 v1, v36

    if-gt v0, v1, :cond_7

    .line 1804
    aget v34, v30, v23

    .line 1805
    .local v34, "vv":I
    add-int/lit8 v36, v34, 0x1

    shl-int/lit8 v36, v36, 0x8

    aget v36, v18, v36

    shl-int/lit8 v37, v34, 0x8

    aget v37, v18, v37

    sub-int v4, v36, v37

    .line 1806
    .local v4, "a":I
    add-int/lit8 v6, v20, -0x1

    .line 1807
    .local v6, "b":I
    move/from16 v24, v23

    .line 1808
    .local v24, "j":I
    sub-int v36, v24, v20

    aget v29, v30, v36

    .local v29, "ro":I
    :goto_8
    add-int/lit8 v36, v29, 0x1

    shl-int/lit8 v36, v36, 0x8

    aget v36, v18, v36

    shl-int/lit8 v37, v29, 0x8

    aget v37, v18, v37

    sub-int v36, v36, v37

    move/from16 v0, v36

    if-le v0, v4, :cond_8

    .line 1810
    aput v29, v30, v24

    .line 1811
    sub-int v24, v24, v20

    .line 1812
    move/from16 v0, v24

    if-gt v0, v6, :cond_9

    .line 1816
    :cond_8
    aput v34, v30, v24

    .line 1803
    add-int/lit8 v23, v23, 0x1

    goto :goto_7

    .line 1808
    :cond_9
    sub-int v36, v24, v20

    aget v29, v30, v36

    goto :goto_8

    .line 1823
    .end local v4    # "a":I
    .end local v6    # "b":I
    .end local v24    # "j":I
    .end local v29    # "ro":I
    .end local v34    # "vv":I
    :cond_a
    const/16 v23, 0x0

    :goto_9
    const/16 v36, 0xff

    move/from16 v0, v23

    move/from16 v1, v36

    if-gt v0, v1, :cond_b

    .line 1827
    aget v33, v30, v23

    .line 1836
    .local v33, "ss":I
    const/16 v24, 0x0

    .restart local v24    # "j":I
    :goto_a
    const/16 v36, 0xff

    move/from16 v0, v24

    move/from16 v1, v36

    if-gt v0, v1, :cond_e

    .line 1837
    shl-int/lit8 v36, v33, 0x8

    add-int v31, v36, v24

    .line 1838
    .local v31, "sb":I
    aget v19, v18, v31

    .line 1839
    .local v19, "ftab_sb":I
    const/high16 v36, 0x200000

    and-int v36, v36, v19

    const/high16 v37, 0x200000

    move/from16 v0, v36

    move/from16 v1, v37

    if-eq v0, v1, :cond_d

    .line 1840
    const v36, -0x200001

    and-int v26, v19, v36

    .line 1841
    .local v26, "lo":I
    add-int/lit8 v36, v31, 0x1

    aget v36, v18, v36

    const v37, -0x200001

    and-int v36, v36, v37

    add-int/lit8 v21, v36, -0x1

    .line 1842
    .local v21, "hi":I
    move/from16 v0, v21

    move/from16 v1, v26

    if-le v0, v1, :cond_c

    .line 1843
    const/16 v36, 0x2

    move-object/from16 v0, p0

    move/from16 v1, v26

    move/from16 v2, v21

    move/from16 v3, v36

    invoke-direct {v0, v14, v1, v2, v3}, Lorg/apache/tools/bzip2/CBZip2OutputStream;->mainQSort3(Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;III)V

    .line 1844
    if-eqz v15, :cond_c

    move-object/from16 v0, p0

    iget v0, v0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->workDone:I

    move/from16 v36, v0

    move/from16 v0, v36

    move/from16 v1, v35

    if-le v0, v1, :cond_c

    .line 1903
    .end local v19    # "ftab_sb":I
    .end local v21    # "hi":I
    .end local v24    # "j":I
    .end local v26    # "lo":I
    .end local v31    # "sb":I
    .end local v33    # "ss":I
    :cond_b
    return-void

    .line 1849
    .restart local v19    # "ftab_sb":I
    .restart local v21    # "hi":I
    .restart local v24    # "j":I
    .restart local v26    # "lo":I
    .restart local v31    # "sb":I
    .restart local v33    # "ss":I
    :cond_c
    const/high16 v36, 0x200000

    or-int v36, v36, v19

    aput v36, v18, v31

    .line 1836
    .end local v21    # "hi":I
    .end local v26    # "lo":I
    :cond_d
    add-int/lit8 v24, v24, 0x1

    goto :goto_a

    .line 1857
    .end local v19    # "ftab_sb":I
    .end local v31    # "sb":I
    :cond_e
    const/16 v24, 0x0

    :goto_b
    const/16 v36, 0xff

    move/from16 v0, v24

    move/from16 v1, v36

    if-gt v0, v1, :cond_f

    .line 1858
    shl-int/lit8 v36, v24, 0x8

    add-int v36, v36, v33

    aget v36, v18, v36

    const v37, -0x200001

    and-int v36, v36, v37

    aput v36, v13, v24

    .line 1857
    add-int/lit8 v24, v24, 0x1

    goto :goto_b

    .line 1861
    :cond_f
    shl-int/lit8 v36, v33, 0x8

    aget v36, v18, v36

    const v37, -0x200001

    and-int v24, v36, v37

    add-int/lit8 v36, v33, 0x1

    shl-int/lit8 v36, v36, 0x8

    aget v36, v18, v36

    const v37, -0x200001

    and-int v22, v36, v37

    .local v22, "hj":I
    :goto_c
    move/from16 v0, v24

    move/from16 v1, v22

    if-ge v0, v1, :cond_12

    .line 1862
    aget v17, v16, v24

    .line 1863
    .local v17, "fmap_j":I
    aget-byte v36, v10, v17

    move/from16 v0, v36

    and-int/lit16 v11, v0, 0xff

    .line 1864
    aget-boolean v36, v9, v11

    if-nez v36, :cond_10

    .line 1865
    aget v37, v13, v11

    if-nez v17, :cond_11

    move/from16 v36, v25

    :goto_d
    aput v36, v16, v37

    .line 1866
    aget v36, v13, v11

    add-int/lit8 v36, v36, 0x1

    aput v36, v13, v11

    .line 1861
    :cond_10
    add-int/lit8 v24, v24, 0x1

    goto :goto_c

    .line 1865
    :cond_11
    add-int/lit8 v36, v17, -0x1

    goto :goto_d

    .line 1870
    .end local v17    # "fmap_j":I
    :cond_12
    const/16 v24, 0x100

    :goto_e
    add-int/lit8 v24, v24, -0x1

    if-ltz v24, :cond_13

    .line 1871
    shl-int/lit8 v36, v24, 0x8

    add-int v36, v36, v33

    aget v37, v18, v36

    const/high16 v38, 0x200000

    or-int v37, v37, v38

    aput v37, v18, v36

    goto :goto_e

    .line 1881
    :cond_13
    const/16 v36, 0x1

    aput-boolean v36, v9, v33

    .line 1883
    const/16 v36, 0xff

    move/from16 v0, v23

    move/from16 v1, v36

    if-ge v0, v1, :cond_16

    .line 1884
    shl-int/lit8 v36, v33, 0x8

    aget v36, v18, v36

    const v37, -0x200001

    and-int v8, v36, v37

    .line 1885
    .local v8, "bbStart":I
    add-int/lit8 v36, v33, 0x1

    shl-int/lit8 v36, v36, 0x8

    aget v36, v18, v36

    const v37, -0x200001

    and-int v36, v36, v37

    sub-int v7, v36, v8

    .line 1886
    .local v7, "bbSize":I
    const/16 v32, 0x0

    .line 1888
    .local v32, "shifts":I
    :goto_f
    shr-int v36, v7, v32

    const v37, 0xfffe

    move/from16 v0, v36

    move/from16 v1, v37

    if-le v0, v1, :cond_14

    .line 1889
    add-int/lit8 v32, v32, 0x1

    goto :goto_f

    .line 1892
    :cond_14
    const/16 v24, 0x0

    :goto_10
    move/from16 v0, v24

    if-ge v0, v7, :cond_16

    .line 1893
    add-int v36, v8, v24

    aget v5, v16, v36

    .line 1894
    .local v5, "a2update":I
    shr-int v36, v24, v32

    move/from16 v0, v36

    int-to-char v0, v0

    move/from16 v27, v0

    .line 1895
    .local v27, "qVal":C
    aput-char v27, v28, v5

    .line 1896
    const/16 v36, 0x14

    move/from16 v0, v36

    if-ge v5, v0, :cond_15

    .line 1897
    add-int v36, v5, v25

    add-int/lit8 v36, v36, 0x1

    aput-char v27, v28, v36

    .line 1892
    :cond_15
    add-int/lit8 v24, v24, 0x1

    goto :goto_10

    .line 1823
    .end local v5    # "a2update":I
    .end local v7    # "bbSize":I
    .end local v8    # "bbStart":I
    .end local v27    # "qVal":C
    .end local v32    # "shifts":I
    :cond_16
    add-int/lit8 v23, v23, 0x1

    goto/16 :goto_9
.end method

.method private static med3(BBB)B
    .locals 0
    .param p0, "a"    # B
    .param p1, "b"    # B
    .param p2, "c"    # B

    .prologue
    .line 1603
    if-ge p0, p1, :cond_3

    if-ge p1, p2, :cond_1

    .end local p1    # "b":B
    :cond_0
    :goto_0
    return p1

    .restart local p1    # "b":B
    :cond_1
    if-ge p0, p2, :cond_2

    move p1, p2

    goto :goto_0

    :cond_2
    move p1, p0

    goto :goto_0

    :cond_3
    if-gt p1, p2, :cond_0

    if-le p0, p2, :cond_4

    move p1, p2

    goto :goto_0

    :cond_4
    move p1, p0

    goto :goto_0
.end method

.method private moveToFrontCodeAndSend()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1394
    const/16 v0, 0x18

    iget v1, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->origPtr:I

    invoke-direct {p0, v0, v1}, Lorg/apache/tools/bzip2/CBZip2OutputStream;->bsW(II)V

    .line 1395
    invoke-direct {p0}, Lorg/apache/tools/bzip2/CBZip2OutputStream;->generateMTFValues()V

    .line 1396
    invoke-direct {p0}, Lorg/apache/tools/bzip2/CBZip2OutputStream;->sendMTFValues()V

    .line 1397
    return-void
.end method

.method private randomiseBlock()V
    .locals 11

    .prologue
    const/4 v9, 0x0

    const/4 v8, 0x1

    .line 1906
    iget-object v7, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->data:Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;

    iget-object v2, v7, Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;->inUse:[Z

    .line 1907
    .local v2, "inUse":[Z
    iget-object v7, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->data:Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;

    iget-object v0, v7, Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;->block:[B

    .line 1908
    .local v0, "block":[B
    iget v4, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->last:I

    .line 1910
    .local v4, "lastShadow":I
    const/16 v1, 0x100

    .local v1, "i":I
    :goto_0
    add-int/lit8 v1, v1, -0x1

    if-ltz v1, :cond_0

    .line 1911
    aput-boolean v9, v2, v1

    goto :goto_0

    .line 1913
    :cond_0
    const/4 v5, 0x0

    .line 1914
    .local v5, "rNToGo":I
    const/4 v6, 0x0

    .line 1915
    .local v6, "rTPos":I
    const/4 v1, 0x0

    const/4 v3, 0x1

    .local v3, "j":I
    :goto_1
    if-gt v1, v4, :cond_3

    .line 1916
    if-nez v5, :cond_1

    .line 1917
    sget-object v7, Lorg/apache/tools/bzip2/BZip2Constants;->rNums:[I

    aget v7, v7, v6

    int-to-char v5, v7

    .line 1918
    add-int/lit8 v6, v6, 0x1

    const/16 v7, 0x200

    if-ne v6, v7, :cond_1

    .line 1919
    const/4 v6, 0x0

    .line 1923
    :cond_1
    add-int/lit8 v5, v5, -0x1

    .line 1924
    aget-byte v10, v0, v3

    if-ne v5, v8, :cond_2

    move v7, v8

    :goto_2
    xor-int/2addr v7, v10

    int-to-byte v7, v7

    aput-byte v7, v0, v3

    .line 1927
    aget-byte v7, v0, v3

    and-int/lit16 v7, v7, 0xff

    aput-boolean v8, v2, v7

    .line 1915
    move v1, v3

    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    :cond_2
    move v7, v9

    .line 1924
    goto :goto_2

    .line 1930
    :cond_3
    iput-boolean v8, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->blockRandomised:Z

    .line 1931
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
    .line 954
    iget-object v7, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->data:Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;

    iget-object v1, v7, Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;->sendMTFValues_len:[[B

    .line 955
    .local v1, "len":[[B
    iget v7, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->nInUse:I

    add-int/lit8 v0, v7, 0x2

    .line 957
    .local v0, "alphaSize":I
    const/4 v5, 0x6

    .local v5, "t":I
    :cond_0
    add-int/lit8 v5, v5, -0x1

    if-ltz v5, :cond_1

    .line 958
    aget-object v2, v1, v5

    .line 959
    .local v2, "len_t":[B
    move v6, v0

    .local v6, "v":I
    :goto_0
    add-int/lit8 v6, v6, -0x1

    if-ltz v6, :cond_0

    .line 960
    const/16 v7, 0xf

    aput-byte v7, v2, v6

    goto :goto_0

    .line 966
    .end local v2    # "len_t":[B
    .end local v6    # "v":I
    :cond_1
    iget v7, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->nMTF:I

    const/16 v8, 0xc8

    if-ge v7, v8, :cond_2

    const/4 v3, 0x2

    .line 970
    .local v3, "nGroups":I
    :goto_1
    invoke-direct {p0, v3, v0}, Lorg/apache/tools/bzip2/CBZip2OutputStream;->sendMTFValues0(II)V

    .line 975
    invoke-direct {p0, v3, v0}, Lorg/apache/tools/bzip2/CBZip2OutputStream;->sendMTFValues1(II)I

    move-result v4

    .line 978
    .local v4, "nSelectors":I
    invoke-direct {p0, v3, v4}, Lorg/apache/tools/bzip2/CBZip2OutputStream;->sendMTFValues2(II)V

    .line 981
    invoke-direct {p0, v3, v0}, Lorg/apache/tools/bzip2/CBZip2OutputStream;->sendMTFValues3(II)V

    .line 984
    invoke-direct {p0}, Lorg/apache/tools/bzip2/CBZip2OutputStream;->sendMTFValues4()V

    .line 987
    invoke-direct {p0, v3, v4}, Lorg/apache/tools/bzip2/CBZip2OutputStream;->sendMTFValues5(II)V

    .line 990
    invoke-direct {p0, v3, v0}, Lorg/apache/tools/bzip2/CBZip2OutputStream;->sendMTFValues6(II)V

    .line 993
    invoke-direct {p0, v4}, Lorg/apache/tools/bzip2/CBZip2OutputStream;->sendMTFValues7(I)V

    .line 994
    return-void

    .line 966
    .end local v3    # "nGroups":I
    .end local v4    # "nSelectors":I
    :cond_2
    iget v7, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->nMTF:I

    const/16 v8, 0x258

    if-ge v7, v8, :cond_3

    const/4 v3, 0x3

    goto :goto_1

    :cond_3
    iget v7, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->nMTF:I

    const/16 v8, 0x4b0

    if-ge v7, v8, :cond_4

    const/4 v3, 0x4

    goto :goto_1

    :cond_4
    iget v7, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->nMTF:I

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
    .line 997
    iget-object v12, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->data:Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;

    iget-object v5, v12, Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;->sendMTFValues_len:[[B

    .line 998
    .local v5, "len":[[B
    iget-object v12, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->data:Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;

    iget-object v7, v12, Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;->mtfFreq:[I

    .line 1000
    .local v7, "mtfFreq":[I
    iget v9, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->nMTF:I

    .line 1001
    .local v9, "remF":I
    const/4 v4, 0x0

    .line 1003
    .local v4, "gs":I
    move v8, p1

    .local v8, "nPart":I
    :goto_0
    if-lez v8, :cond_3

    .line 1004
    div-int v10, v9, v8

    .line 1005
    .local v10, "tFreq":I
    add-int/lit8 v2, v4, -0x1

    .line 1006
    .local v2, "ge":I
    const/4 v1, 0x0

    .line 1008
    .local v1, "aFreq":I
    add-int/lit8 v0, p2, -0x1

    .local v0, "a":I
    move v3, v2

    .end local v2    # "ge":I
    .local v3, "ge":I
    :goto_1
    if-ge v1, v10, :cond_0

    if-ge v3, v0, :cond_0

    .line 1009
    add-int/lit8 v2, v3, 0x1

    .end local v3    # "ge":I
    .restart local v2    # "ge":I
    aget v12, v7, v2

    add-int/2addr v1, v12

    move v3, v2

    .end local v2    # "ge":I
    .restart local v3    # "ge":I
    goto :goto_1

    .line 1012
    :cond_0
    if-le v3, v4, :cond_4

    if-eq v8, p1, :cond_4

    const/4 v12, 0x1

    if-eq v8, v12, :cond_4

    sub-int v12, p1, v8

    and-int/lit8 v12, v12, 0x1

    if-eqz v12, :cond_4

    .line 1014
    add-int/lit8 v2, v3, -0x1

    .end local v3    # "ge":I
    .restart local v2    # "ge":I
    aget v12, v7, v3

    sub-int/2addr v1, v12

    .line 1017
    :goto_2
    add-int/lit8 v12, v8, -0x1

    aget-object v6, v5, v12

    .line 1018
    .local v6, "len_np":[B
    move v11, p2

    .local v11, "v":I
    :goto_3
    add-int/lit8 v11, v11, -0x1

    if-ltz v11, :cond_2

    .line 1019
    if-lt v11, v4, :cond_1

    if-gt v11, v2, :cond_1

    .line 1020
    const/4 v12, 0x0

    aput-byte v12, v6, v11

    goto :goto_3

    .line 1022
    :cond_1
    const/16 v12, 0xf

    aput-byte v12, v6, v11

    goto :goto_3

    .line 1026
    :cond_2
    add-int/lit8 v4, v2, 0x1

    .line 1027
    sub-int/2addr v9, v1

    .line 1003
    add-int/lit8 v8, v8, -0x1

    goto :goto_0

    .line 1029
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
    .line 1032
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->data:Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;

    .line 1033
    .local v15, "dataShadow":Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;
    iget-object v0, v15, Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;->sendMTFValues_rfreq:[[I

    move-object/from16 v31, v0

    .line 1034
    .local v31, "rfreq":[[I
    iget-object v0, v15, Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;->sendMTFValues_fave:[I

    move-object/from16 v16, v0

    .line 1035
    .local v16, "fave":[I
    iget-object v7, v15, Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;->sendMTFValues_cost:[S

    .line 1036
    .local v7, "cost":[S
    iget-object v0, v15, Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;->sfmap:[C

    move-object/from16 v35, v0

    .line 1037
    .local v35, "sfmap":[C
    iget-object v0, v15, Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;->selector:[B

    move-object/from16 v34, v0

    .line 1038
    .local v34, "selector":[B
    iget-object v0, v15, Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;->sendMTFValues_len:[[B

    move-object/from16 v22, v0

    .line 1039
    .local v22, "len":[[B
    const/16 v37, 0x0

    aget-object v23, v22, v37

    .line 1040
    .local v23, "len_0":[B
    const/16 v37, 0x1

    aget-object v24, v22, v37

    .line 1041
    .local v24, "len_1":[B
    const/16 v37, 0x2

    aget-object v25, v22, v37

    .line 1042
    .local v25, "len_2":[B
    const/16 v37, 0x3

    aget-object v26, v22, v37

    .line 1043
    .local v26, "len_3":[B
    const/16 v37, 0x4

    aget-object v27, v22, v37

    .line 1044
    .local v27, "len_4":[B
    const/16 v37, 0x5

    aget-object v28, v22, v37

    .line 1045
    .local v28, "len_5":[B
    move-object/from16 v0, p0

    iget v0, v0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->nMTF:I

    move/from16 v29, v0

    .line 1047
    .local v29, "nMTFShadow":I
    const/16 v30, 0x0

    .line 1049
    .local v30, "nSelectors":I
    const/16 v21, 0x0

    .local v21, "iter":I
    :goto_0
    const/16 v37, 0x4

    move/from16 v0, v21

    move/from16 v1, v37

    if-ge v0, v1, :cond_c

    .line 1050
    move/from16 v36, p1

    .local v36, "t":I
    :cond_0
    add-int/lit8 v36, v36, -0x1

    if-ltz v36, :cond_1

    .line 1051
    const/16 v37, 0x0

    aput v37, v16, v36

    .line 1052
    aget-object v33, v31, v36

    .line 1053
    .local v33, "rfreqt":[I
    move/from16 v19, p2

    .local v19, "i":I
    :goto_1
    add-int/lit8 v19, v19, -0x1

    if-ltz v19, :cond_0

    .line 1054
    const/16 v37, 0x0

    aput v37, v33, v19

    goto :goto_1

    .line 1058
    .end local v19    # "i":I
    .end local v33    # "rfreqt":[I
    :cond_1
    const/16 v30, 0x0

    .line 1060
    const/16 v18, 0x0

    .local v18, "gs":I
    :goto_2
    move-object/from16 v0, p0

    iget v0, v0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->nMTF:I

    move/from16 v37, v0

    move/from16 v0, v18

    move/from16 v1, v37

    if-ge v0, v1, :cond_a

    .line 1068
    add-int/lit8 v37, v18, 0x32

    add-int/lit8 v37, v37, -0x1

    add-int/lit8 v38, v29, -0x1

    invoke-static/range {v37 .. v38}, Ljava/lang/Math;->min(II)I

    move-result v17

    .line 1070
    .local v17, "ge":I
    const/16 v37, 0x6

    move/from16 v0, p1

    move/from16 v1, v37

    if-ne v0, v1, :cond_5

    .line 1073
    const/4 v8, 0x0

    .line 1074
    .local v8, "cost0":S
    const/4 v9, 0x0

    .line 1075
    .local v9, "cost1":S
    const/4 v10, 0x0

    .line 1076
    .local v10, "cost2":S
    const/4 v11, 0x0

    .line 1077
    .local v11, "cost3":S
    const/4 v12, 0x0

    .line 1078
    .local v12, "cost4":S
    const/4 v13, 0x0

    .line 1080
    .local v13, "cost5":S
    move/from16 v19, v18

    .restart local v19    # "i":I
    :goto_3
    move/from16 v0, v19

    move/from16 v1, v17

    if-gt v0, v1, :cond_2

    .line 1081
    aget-char v20, v35, v19

    .line 1082
    .local v20, "icv":I
    aget-byte v37, v23, v20

    move/from16 v0, v37

    and-int/lit16 v0, v0, 0xff

    move/from16 v37, v0

    add-int v37, v37, v8

    move/from16 v0, v37

    int-to-short v8, v0

    .line 1083
    aget-byte v37, v24, v20

    move/from16 v0, v37

    and-int/lit16 v0, v0, 0xff

    move/from16 v37, v0

    add-int v37, v37, v9

    move/from16 v0, v37

    int-to-short v9, v0

    .line 1084
    aget-byte v37, v25, v20

    move/from16 v0, v37

    and-int/lit16 v0, v0, 0xff

    move/from16 v37, v0

    add-int v37, v37, v10

    move/from16 v0, v37

    int-to-short v10, v0

    .line 1085
    aget-byte v37, v26, v20

    move/from16 v0, v37

    and-int/lit16 v0, v0, 0xff

    move/from16 v37, v0

    add-int v37, v37, v11

    move/from16 v0, v37

    int-to-short v11, v0

    .line 1086
    aget-byte v37, v27, v20

    move/from16 v0, v37

    and-int/lit16 v0, v0, 0xff

    move/from16 v37, v0

    add-int v37, v37, v12

    move/from16 v0, v37

    int-to-short v12, v0

    .line 1087
    aget-byte v37, v28, v20

    move/from16 v0, v37

    and-int/lit16 v0, v0, 0xff

    move/from16 v37, v0

    add-int v37, v37, v13

    move/from16 v0, v37

    int-to-short v13, v0

    .line 1080
    add-int/lit8 v19, v19, 0x1

    goto :goto_3

    .line 1090
    .end local v20    # "icv":I
    :cond_2
    const/16 v37, 0x0

    aput-short v8, v7, v37

    .line 1091
    const/16 v37, 0x1

    aput-short v9, v7, v37

    .line 1092
    const/16 v37, 0x2

    aput-short v10, v7, v37

    .line 1093
    const/16 v37, 0x3

    aput-short v11, v7, v37

    .line 1094
    const/16 v37, 0x4

    aput-short v12, v7, v37

    .line 1095
    const/16 v37, 0x5

    aput-short v13, v7, v37

    .line 1114
    .end local v8    # "cost0":S
    .end local v9    # "cost1":S
    .end local v10    # "cost2":S
    .end local v11    # "cost3":S
    .end local v12    # "cost4":S
    .end local v13    # "cost5":S
    :cond_3
    const/4 v6, -0x1

    .line 1115
    .local v6, "bt":I
    move/from16 v36, p1

    const v5, 0x3b9ac9ff

    .local v5, "bc":I
    :cond_4
    :goto_4
    add-int/lit8 v36, v36, -0x1

    if-ltz v36, :cond_8

    .line 1116
    aget-short v14, v7, v36

    .line 1117
    .local v14, "cost_t":I
    if-ge v14, v5, :cond_4

    .line 1118
    move v5, v14

    .line 1119
    move/from16 v6, v36

    goto :goto_4

    .line 1098
    .end local v5    # "bc":I
    .end local v6    # "bt":I
    .end local v14    # "cost_t":I
    .end local v19    # "i":I
    :cond_5
    move/from16 v36, p1

    :goto_5
    add-int/lit8 v36, v36, -0x1

    if-ltz v36, :cond_6

    .line 1099
    const/16 v37, 0x0

    aput-short v37, v7, v36

    goto :goto_5

    .line 1102
    :cond_6
    move/from16 v19, v18

    .restart local v19    # "i":I
    :goto_6
    move/from16 v0, v19

    move/from16 v1, v17

    if-gt v0, v1, :cond_3

    .line 1103
    aget-char v20, v35, v19

    .line 1104
    .restart local v20    # "icv":I
    move/from16 v36, p1

    :goto_7
    add-int/lit8 v36, v36, -0x1

    if-ltz v36, :cond_7

    .line 1105
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

    .line 1102
    :cond_7
    add-int/lit8 v19, v19, 0x1

    goto :goto_6

    .line 1123
    .end local v20    # "icv":I
    .restart local v5    # "bc":I
    .restart local v6    # "bt":I
    :cond_8
    aget v37, v16, v6

    add-int/lit8 v37, v37, 0x1

    aput v37, v16, v6

    .line 1124
    int-to-byte v0, v6

    move/from16 v37, v0

    aput-byte v37, v34, v30

    .line 1125
    add-int/lit8 v30, v30, 0x1

    .line 1130
    aget-object v32, v31, v6

    .line 1131
    .local v32, "rfreq_bt":[I
    move/from16 v19, v18

    :goto_8
    move/from16 v0, v19

    move/from16 v1, v17

    if-gt v0, v1, :cond_9

    .line 1132
    aget-char v37, v35, v19

    aget v38, v32, v37

    add-int/lit8 v38, v38, 0x1

    aput v38, v32, v37

    .line 1131
    add-int/lit8 v19, v19, 0x1

    goto :goto_8

    .line 1135
    :cond_9
    add-int/lit8 v18, v17, 0x1

    goto/16 :goto_2

    .line 1141
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

    .line 1142
    aget-object v37, v22, v36

    aget-object v38, v31, v36

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->data:Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;

    move-object/from16 v39, v0

    const/16 v40, 0x14

    move-object/from16 v0, v37

    move-object/from16 v1, v38

    move-object/from16 v2, v39

    move/from16 v3, p2

    move/from16 v4, v40

    invoke-static {v0, v1, v2, v3, v4}, Lorg/apache/tools/bzip2/CBZip2OutputStream;->hbMakeCodeLengths([B[ILorg/apache/tools/bzip2/CBZip2OutputStream$Data;II)V

    .line 1141
    add-int/lit8 v36, v36, 0x1

    goto :goto_9

    .line 1049
    :cond_b
    add-int/lit8 v21, v21, 0x1

    goto/16 :goto_0

    .line 1146
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

    .line 1152
    iget-object v0, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->data:Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;

    .line 1153
    .local v0, "dataShadow":Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;
    iget-object v4, v0, Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;->sendMTFValues2_pos:[B

    .line 1155
    .local v4, "pos":[B
    move v1, p1

    .local v1, "i":I
    :goto_0
    add-int/lit8 v1, v1, -0x1

    if-ltz v1, :cond_0

    .line 1156
    int-to-byte v7, v1

    aput-byte v7, v4, v1

    goto :goto_0

    .line 1159
    :cond_0
    const/4 v1, 0x0

    :goto_1
    if-ge v1, p2, :cond_2

    .line 1160
    iget-object v7, v0, Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;->selector:[B

    aget-byte v3, v7, v1

    .line 1161
    .local v3, "ll_i":B
    aget-byte v5, v4, v9

    .line 1162
    .local v5, "tmp":B
    const/4 v2, 0x0

    .line 1164
    .local v2, "j":I
    :goto_2
    if-eq v3, v5, :cond_1

    .line 1165
    add-int/lit8 v2, v2, 0x1

    .line 1166
    move v6, v5

    .line 1167
    .local v6, "tmp2":B
    aget-byte v5, v4, v2

    .line 1168
    aput-byte v6, v4, v2

    goto :goto_2

    .line 1171
    .end local v6    # "tmp2":B
    :cond_1
    aput-byte v5, v4, v9

    .line 1172
    iget-object v7, v0, Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;->selectorMtf:[B

    int-to-byte v8, v2

    aput-byte v8, v7, v1

    .line 1159
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 1174
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
    .line 1177
    iget-object v8, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->data:Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;

    iget-object v0, v8, Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;->sendMTFValues_code:[[I

    .line 1178
    .local v0, "code":[[I
    iget-object v8, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->data:Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;

    iget-object v3, v8, Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;->sendMTFValues_len:[[B

    .line 1180
    .local v3, "len":[[B
    const/4 v7, 0x0

    .local v7, "t":I
    :goto_0
    if-ge v7, p1, :cond_3

    .line 1181
    const/16 v6, 0x20

    .line 1182
    .local v6, "minLen":I
    const/4 v5, 0x0

    .line 1183
    .local v5, "maxLen":I
    aget-object v4, v3, v7

    .line 1184
    .local v4, "len_t":[B
    move v1, p2

    .local v1, "i":I
    :cond_0
    :goto_1
    add-int/lit8 v1, v1, -0x1

    if-ltz v1, :cond_2

    .line 1185
    aget-byte v8, v4, v1

    and-int/lit16 v2, v8, 0xff

    .line 1186
    .local v2, "l":I
    if-le v2, v5, :cond_1

    .line 1187
    move v5, v2

    .line 1189
    :cond_1
    if-ge v2, v6, :cond_0

    .line 1190
    move v6, v2

    goto :goto_1

    .line 1197
    .end local v2    # "l":I
    :cond_2
    aget-object v8, v0, v7

    aget-object v9, v3, v7

    invoke-static {v8, v9, v6, v5, p2}, Lorg/apache/tools/bzip2/CBZip2OutputStream;->hbAssignCodes([I[BIII)V

    .line 1180
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 1199
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

    .line 1202
    iget-object v8, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->data:Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;

    iget-object v4, v8, Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;->inUse:[Z

    .line 1203
    .local v4, "inUse":[Z
    iget-object v8, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->data:Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;

    iget-object v5, v8, Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;->sentMTFValues4_inUse16:[Z

    .line 1205
    .local v5, "inUse16":[Z
    const/16 v2, 0x10

    .local v2, "i":I
    :cond_0
    add-int/lit8 v2, v2, -0x1

    if-ltz v2, :cond_2

    .line 1206
    aput-boolean v10, v5, v2

    .line 1207
    mul-int/lit8 v3, v2, 0x10

    .line 1208
    .local v3, "i16":I
    const/16 v6, 0x10

    .local v6, "j":I
    :cond_1
    :goto_0
    add-int/lit8 v6, v6, -0x1

    if-ltz v6, :cond_0

    .line 1209
    add-int v8, v3, v6

    aget-boolean v8, v4, v8

    if-eqz v8, :cond_1

    .line 1210
    aput-boolean v9, v5, v2

    goto :goto_0

    .line 1215
    .end local v3    # "i16":I
    .end local v6    # "j":I
    :cond_2
    const/4 v2, 0x0

    :goto_1
    if-ge v2, v11, :cond_4

    .line 1216
    aget-boolean v8, v5, v2

    if-eqz v8, :cond_3

    move v8, v9

    :goto_2
    invoke-direct {p0, v9, v8}, Lorg/apache/tools/bzip2/CBZip2OutputStream;->bsW(II)V

    .line 1215
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_3
    move v8, v10

    .line 1216
    goto :goto_2

    .line 1219
    :cond_4
    iget-object v7, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->out:Ljava/io/OutputStream;

    .line 1220
    .local v7, "outShadow":Ljava/io/OutputStream;
    iget v1, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->bsLive:I

    .line 1221
    .local v1, "bsLiveShadow":I
    iget v0, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->bsBuff:I

    .line 1223
    .local v0, "bsBuffShadow":I
    const/4 v2, 0x0

    :goto_3
    if-ge v2, v11, :cond_8

    .line 1224
    aget-boolean v8, v5, v2

    if-eqz v8, :cond_7

    .line 1225
    mul-int/lit8 v3, v2, 0x10

    .line 1226
    .restart local v3    # "i16":I
    const/4 v6, 0x0

    .restart local v6    # "j":I
    :goto_4
    if-ge v6, v11, :cond_7

    .line 1228
    :goto_5
    const/16 v8, 0x8

    if-lt v1, v8, :cond_5

    .line 1229
    shr-int/lit8 v8, v0, 0x18

    invoke-virtual {v7, v8}, Ljava/io/OutputStream;->write(I)V

    .line 1230
    shl-int/lit8 v0, v0, 0x8

    .line 1231
    add-int/lit8 v1, v1, -0x8

    goto :goto_5

    .line 1233
    :cond_5
    add-int v8, v3, v6

    aget-boolean v8, v4, v8

    if-eqz v8, :cond_6

    .line 1234
    rsub-int/lit8 v8, v1, 0x20

    add-int/lit8 v8, v8, -0x1

    shl-int v8, v9, v8

    or-int/2addr v0, v8

    .line 1236
    :cond_6
    add-int/lit8 v1, v1, 0x1

    .line 1226
    add-int/lit8 v6, v6, 0x1

    goto :goto_4

    .line 1223
    .end local v3    # "i16":I
    .end local v6    # "j":I
    :cond_7
    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    .line 1241
    :cond_8
    iput v0, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->bsBuff:I

    .line 1242
    iput v1, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->bsLive:I

    .line 1243
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

    .line 1247
    const/4 v7, 0x3

    invoke-direct {p0, v7, p1}, Lorg/apache/tools/bzip2/CBZip2OutputStream;->bsW(II)V

    .line 1248
    const/16 v7, 0xf

    invoke-direct {p0, v7, p2}, Lorg/apache/tools/bzip2/CBZip2OutputStream;->bsW(II)V

    .line 1250
    iget-object v5, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->out:Ljava/io/OutputStream;

    .line 1251
    .local v5, "outShadow":Ljava/io/OutputStream;
    iget-object v7, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->data:Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;

    iget-object v6, v7, Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;->selectorMtf:[B

    .line 1253
    .local v6, "selectorMtf":[B
    iget v1, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->bsLive:I

    .line 1254
    .local v1, "bsLiveShadow":I
    iget v0, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->bsBuff:I

    .line 1256
    .local v0, "bsBuffShadow":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    if-ge v3, p2, :cond_3

    .line 1257
    const/4 v4, 0x0

    .local v4, "j":I
    aget-byte v7, v6, v3

    and-int/lit16 v2, v7, 0xff

    .local v2, "hj":I
    :goto_1
    if-ge v4, v2, :cond_1

    .line 1259
    :goto_2
    if-lt v1, v9, :cond_0

    .line 1260
    shr-int/lit8 v7, v0, 0x18

    invoke-virtual {v5, v7}, Ljava/io/OutputStream;->write(I)V

    .line 1261
    shl-int/lit8 v0, v0, 0x8

    .line 1262
    add-int/lit8 v1, v1, -0x8

    goto :goto_2

    .line 1264
    :cond_0
    const/4 v7, 0x1

    rsub-int/lit8 v8, v1, 0x20

    add-int/lit8 v8, v8, -0x1

    shl-int/2addr v7, v8

    or-int/2addr v0, v7

    .line 1265
    add-int/lit8 v1, v1, 0x1

    .line 1257
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 1269
    :cond_1
    :goto_3
    if-lt v1, v9, :cond_2

    .line 1270
    shr-int/lit8 v7, v0, 0x18

    invoke-virtual {v5, v7}, Ljava/io/OutputStream;->write(I)V

    .line 1271
    shl-int/lit8 v0, v0, 0x8

    .line 1272
    add-int/lit8 v1, v1, -0x8

    goto :goto_3

    .line 1275
    :cond_2
    add-int/lit8 v1, v1, 0x1

    .line 1256
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 1278
    .end local v2    # "hj":I
    .end local v4    # "j":I
    :cond_3
    iput v0, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->bsBuff:I

    .line 1279
    iput v1, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->bsLive:I

    .line 1280
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

    .line 1284
    iget-object v9, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->data:Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;

    iget-object v4, v9, Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;->sendMTFValues_len:[[B

    .line 1285
    .local v4, "len":[[B
    iget-object v7, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->out:Ljava/io/OutputStream;

    .line 1287
    .local v7, "outShadow":Ljava/io/OutputStream;
    iget v1, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->bsLive:I

    .line 1288
    .local v1, "bsLiveShadow":I
    iget v0, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->bsBuff:I

    .line 1290
    .local v0, "bsBuffShadow":I
    const/4 v8, 0x0

    .local v8, "t":I
    :goto_0
    if-ge v8, p1, :cond_7

    .line 1291
    aget-object v5, v4, v8

    .line 1292
    .local v5, "len_t":[B
    const/4 v9, 0x0

    aget-byte v9, v5, v9

    and-int/lit16 v2, v9, 0xff

    .line 1295
    .local v2, "curr":I
    :goto_1
    if-lt v1, v11, :cond_0

    .line 1296
    shr-int/lit8 v9, v0, 0x18

    invoke-virtual {v7, v9}, Ljava/io/OutputStream;->write(I)V

    .line 1297
    shl-int/lit8 v0, v0, 0x8

    .line 1298
    add-int/lit8 v1, v1, -0x8

    goto :goto_1

    .line 1300
    :cond_0
    rsub-int/lit8 v9, v1, 0x20

    add-int/lit8 v9, v9, -0x5

    shl-int v9, v2, v9

    or-int/2addr v0, v9

    .line 1301
    add-int/lit8 v1, v1, 0x5

    .line 1303
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_2
    if-ge v3, p2, :cond_6

    .line 1304
    aget-byte v9, v5, v3

    and-int/lit16 v6, v9, 0xff

    .line 1305
    .local v6, "lti":I
    :goto_3
    if-ge v2, v6, :cond_3

    .line 1307
    :goto_4
    if-lt v1, v11, :cond_1

    .line 1308
    shr-int/lit8 v9, v0, 0x18

    invoke-virtual {v7, v9}, Ljava/io/OutputStream;->write(I)V

    .line 1309
    shl-int/lit8 v0, v0, 0x8

    .line 1310
    add-int/lit8 v1, v1, -0x8

    goto :goto_4

    .line 1312
    :cond_1
    const/4 v9, 0x2

    rsub-int/lit8 v10, v1, 0x20

    add-int/lit8 v10, v10, -0x2

    shl-int/2addr v9, v10

    or-int/2addr v0, v9

    .line 1313
    add-int/lit8 v1, v1, 0x2

    .line 1315
    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    .line 1325
    :cond_2
    const/4 v9, 0x3

    rsub-int/lit8 v10, v1, 0x20

    add-int/lit8 v10, v10, -0x2

    shl-int/2addr v9, v10

    or-int/2addr v0, v9

    .line 1326
    add-int/lit8 v1, v1, 0x2

    .line 1328
    add-int/lit8 v2, v2, -0x1

    .line 1318
    :cond_3
    if-le v2, v6, :cond_4

    .line 1320
    :goto_5
    if-lt v1, v11, :cond_2

    .line 1321
    shr-int/lit8 v9, v0, 0x18

    invoke-virtual {v7, v9}, Ljava/io/OutputStream;->write(I)V

    .line 1322
    shl-int/lit8 v0, v0, 0x8

    .line 1323
    add-int/lit8 v1, v1, -0x8

    goto :goto_5

    .line 1332
    :cond_4
    :goto_6
    if-lt v1, v11, :cond_5

    .line 1333
    shr-int/lit8 v9, v0, 0x18

    invoke-virtual {v7, v9}, Ljava/io/OutputStream;->write(I)V

    .line 1334
    shl-int/lit8 v0, v0, 0x8

    .line 1335
    add-int/lit8 v1, v1, -0x8

    goto :goto_6

    .line 1338
    :cond_5
    add-int/lit8 v1, v1, 0x1

    .line 1303
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 1290
    .end local v6    # "lti":I
    :cond_6
    add-int/lit8 v8, v8, 0x1

    goto :goto_0

    .line 1342
    .end local v2    # "curr":I
    .end local v3    # "i":I
    .end local v5    # "len_t":[B
    :cond_7
    iput v0, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->bsBuff:I

    .line 1343
    iput v1, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->bsLive:I

    .line 1344
    return-void
.end method

.method private sendMTFValues7(I)V
    .locals 20
    .param p1, "nSelectors"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1347
    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->data:Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;

    .line 1348
    .local v5, "dataShadow":Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;
    iget-object v8, v5, Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;->sendMTFValues_len:[[B

    .line 1349
    .local v8, "len":[[B
    iget-object v3, v5, Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;->sendMTFValues_code:[[I

    .line 1350
    .local v3, "code":[[I
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->out:Ljava/io/OutputStream;

    .line 1351
    .local v12, "outShadow":Ljava/io/OutputStream;
    iget-object v14, v5, Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;->selector:[B

    .line 1352
    .local v14, "selector":[B
    iget-object v0, v5, Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;->sfmap:[C

    move-object/from16 v16, v0

    .line 1353
    .local v16, "sfmap":[C
    move-object/from16 v0, p0

    iget v11, v0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->nMTF:I

    .line 1355
    .local v11, "nMTFShadow":I
    const/4 v13, 0x0

    .line 1357
    .local v13, "selCtr":I
    move-object/from16 v0, p0

    iget v2, v0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->bsLive:I

    .line 1358
    .local v2, "bsLiveShadow":I
    move-object/from16 v0, p0

    iget v1, v0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->bsBuff:I

    .line 1360
    .local v1, "bsBuffShadow":I
    const/4 v7, 0x0

    .local v7, "gs":I
    :goto_0
    if-ge v7, v11, :cond_2

    .line 1361
    add-int/lit8 v18, v7, 0x32

    add-int/lit8 v18, v18, -0x1

    add-int/lit8 v19, v11, -0x1

    invoke-static/range {v18 .. v19}, Ljava/lang/Math;->min(II)I

    move-result v6

    .line 1362
    .local v6, "ge":I
    aget-byte v18, v14, v13

    move/from16 v0, v18

    and-int/lit16 v15, v0, 0xff

    .line 1363
    .local v15, "selector_selCtr":I
    aget-object v4, v3, v15

    .line 1364
    .local v4, "code_selCtr":[I
    aget-object v9, v8, v15

    .line 1366
    .local v9, "len_selCtr":[B
    :goto_1
    if-gt v7, v6, :cond_1

    .line 1367
    aget-char v17, v16, v7

    .line 1373
    .local v17, "sfmap_i":I
    :goto_2
    const/16 v18, 0x8

    move/from16 v0, v18

    if-lt v2, v0, :cond_0

    .line 1374
    shr-int/lit8 v18, v1, 0x18

    move/from16 v0, v18

    invoke-virtual {v12, v0}, Ljava/io/OutputStream;->write(I)V

    .line 1375
    shl-int/lit8 v1, v1, 0x8

    .line 1376
    add-int/lit8 v2, v2, -0x8

    goto :goto_2

    .line 1378
    :cond_0
    aget-byte v18, v9, v17

    move/from16 v0, v18

    and-int/lit16 v10, v0, 0xff

    .line 1379
    .local v10, "n":I
    aget v18, v4, v17

    rsub-int/lit8 v19, v2, 0x20

    sub-int v19, v19, v10

    shl-int v18, v18, v19

    or-int v1, v1, v18

    .line 1380
    add-int/2addr v2, v10

    .line 1382
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    .line 1385
    .end local v10    # "n":I
    .end local v17    # "sfmap_i":I
    :cond_1
    add-int/lit8 v7, v6, 0x1

    .line 1386
    add-int/lit8 v13, v13, 0x1

    goto :goto_0

    .line 1389
    .end local v4    # "code_selCtr":[I
    .end local v6    # "ge":I
    .end local v9    # "len_selCtr":[B
    .end local v15    # "selector_selCtr":I
    :cond_2
    move-object/from16 v0, p0

    iput v1, v0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->bsBuff:I

    .line 1390
    move-object/from16 v0, p0

    iput v2, v0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->bsLive:I

    .line 1391
    return-void
.end method

.method private static vswap([IIII)V
    .locals 4
    .param p0, "fmap"    # [I
    .param p1, "p1"    # I
    .param p2, "p2"    # I
    .param p3, "n"    # I

    .prologue
    .line 1594
    add-int/2addr p3, p1

    move v1, p2

    .end local p2    # "p2":I
    .local v1, "p2":I
    move v0, p1

    .line 1595
    .end local p1    # "p1":I
    .local v0, "p1":I
    :goto_0
    if-ge v0, p3, :cond_0

    .line 1596
    aget v2, p0, v0

    .line 1597
    .local v2, "t":I
    add-int/lit8 p1, v0, 0x1

    .end local v0    # "p1":I
    .restart local p1    # "p1":I
    aget v3, p0, v1

    aput v3, p0, v0

    .line 1598
    add-int/lit8 p2, v1, 0x1

    .end local v1    # "p2":I
    .restart local p2    # "p2":I
    aput v2, p0, v1

    move v1, p2

    .end local p2    # "p2":I
    .restart local v1    # "p2":I
    move v0, p1

    .end local p1    # "p1":I
    .restart local v0    # "p1":I
    goto :goto_0

    .line 1600
    .end local v2    # "t":I
    :cond_0
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

    .line 883
    iget v0, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->currentChar:I

    if-eq v0, v2, :cond_2

    .line 884
    and-int/lit16 p1, p1, 0xff

    .line 885
    iget v0, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->currentChar:I

    if-ne v0, p1, :cond_1

    .line 886
    iget v0, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->runLength:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->runLength:I

    const/16 v1, 0xfe

    if-le v0, v1, :cond_0

    .line 887
    invoke-direct {p0}, Lorg/apache/tools/bzip2/CBZip2OutputStream;->writeRun()V

    .line 888
    iput v2, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->currentChar:I

    .line 889
    const/4 v0, 0x0

    iput v0, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->runLength:I

    .line 901
    :cond_0
    :goto_0
    return-void

    .line 893
    :cond_1
    invoke-direct {p0}, Lorg/apache/tools/bzip2/CBZip2OutputStream;->writeRun()V

    .line 894
    const/4 v0, 0x1

    iput v0, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->runLength:I

    .line 895
    iput p1, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->currentChar:I

    goto :goto_0

    .line 898
    :cond_2
    and-int/lit16 v0, p1, 0xff

    iput v0, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->currentChar:I

    .line 899
    iget v0, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->runLength:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->runLength:I

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

    .line 664
    iget v4, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->last:I

    .line 666
    .local v4, "lastShadow":I
    iget v6, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->allowableBlockSize:I

    if-ge v4, v6, :cond_0

    .line 667
    iget v2, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->currentChar:I

    .line 668
    .local v2, "currentCharShadow":I
    iget-object v3, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->data:Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;

    .line 669
    .local v3, "dataShadow":Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;
    iget-object v6, v3, Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;->inUse:[Z

    aput-boolean v7, v6, v2

    .line 670
    int-to-byte v1, v2

    .line 672
    .local v1, "ch":B
    iget v5, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->runLength:I

    .line 673
    .local v5, "runLengthShadow":I
    iget-object v6, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->crc:Lorg/apache/tools/bzip2/CRC;

    invoke-virtual {v6, v2, v5}, Lorg/apache/tools/bzip2/CRC;->updateCRC(II)V

    .line 675
    packed-switch v5, :pswitch_data_0

    .line 697
    add-int/lit8 v5, v5, -0x4

    .line 698
    iget-object v6, v3, Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;->inUse:[Z

    aput-boolean v7, v6, v5

    .line 699
    iget-object v0, v3, Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;->block:[B

    .line 700
    .local v0, "block":[B
    add-int/lit8 v6, v4, 0x2

    aput-byte v1, v0, v6

    .line 701
    add-int/lit8 v6, v4, 0x3

    aput-byte v1, v0, v6

    .line 702
    add-int/lit8 v6, v4, 0x4

    aput-byte v1, v0, v6

    .line 703
    add-int/lit8 v6, v4, 0x5

    aput-byte v1, v0, v6

    .line 704
    add-int/lit8 v6, v4, 0x6

    int-to-byte v7, v5

    aput-byte v7, v0, v6

    .line 705
    add-int/lit8 v6, v4, 0x5

    iput v6, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->last:I

    .line 715
    .end local v0    # "block":[B
    .end local v1    # "ch":B
    .end local v2    # "currentCharShadow":I
    .end local v3    # "dataShadow":Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;
    .end local v5    # "runLengthShadow":I
    :goto_0
    return-void

    .line 677
    .restart local v1    # "ch":B
    .restart local v2    # "currentCharShadow":I
    .restart local v3    # "dataShadow":Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;
    .restart local v5    # "runLengthShadow":I
    :pswitch_0
    iget-object v6, v3, Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;->block:[B

    add-int/lit8 v7, v4, 0x2

    aput-byte v1, v6, v7

    .line 678
    add-int/lit8 v6, v4, 0x1

    iput v6, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->last:I

    goto :goto_0

    .line 682
    :pswitch_1
    iget-object v6, v3, Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;->block:[B

    add-int/lit8 v7, v4, 0x2

    aput-byte v1, v6, v7

    .line 683
    iget-object v6, v3, Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;->block:[B

    add-int/lit8 v7, v4, 0x3

    aput-byte v1, v6, v7

    .line 684
    add-int/lit8 v6, v4, 0x2

    iput v6, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->last:I

    goto :goto_0

    .line 688
    :pswitch_2
    iget-object v0, v3, Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;->block:[B

    .line 689
    .restart local v0    # "block":[B
    add-int/lit8 v6, v4, 0x2

    aput-byte v1, v0, v6

    .line 690
    add-int/lit8 v6, v4, 0x3

    aput-byte v1, v0, v6

    .line 691
    add-int/lit8 v6, v4, 0x4

    aput-byte v1, v0, v6

    .line 692
    add-int/lit8 v6, v4, 0x3

    iput v6, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->last:I

    goto :goto_0

    .line 711
    .end local v0    # "block":[B
    .end local v1    # "ch":B
    .end local v2    # "currentCharShadow":I
    .end local v3    # "dataShadow":Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;
    .end local v5    # "runLengthShadow":I
    :cond_0
    invoke-direct {p0}, Lorg/apache/tools/bzip2/CBZip2OutputStream;->endBlock()V

    .line 712
    invoke-direct {p0}, Lorg/apache/tools/bzip2/CBZip2OutputStream;->initBlock()V

    .line 713
    invoke-direct {p0}, Lorg/apache/tools/bzip2/CBZip2OutputStream;->writeRun()V

    goto :goto_0

    .line 675
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
    .line 743
    iget-object v1, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->out:Ljava/io/OutputStream;

    if-eqz v1, :cond_0

    .line 744
    iget-object v0, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->out:Ljava/io/OutputStream;

    .line 745
    .local v0, "outShadow":Ljava/io/OutputStream;
    invoke-virtual {p0}, Lorg/apache/tools/bzip2/CBZip2OutputStream;->finish()V

    .line 746
    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V

    .line 748
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
    .line 721
    invoke-virtual {p0}, Lorg/apache/tools/bzip2/CBZip2OutputStream;->finish()V

    .line 722
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    .line 723
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

    .line 727
    iget-object v0, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->out:Ljava/io/OutputStream;

    if-eqz v0, :cond_1

    .line 729
    :try_start_0
    iget v0, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->runLength:I

    if-lez v0, :cond_0

    .line 730
    invoke-direct {p0}, Lorg/apache/tools/bzip2/CBZip2OutputStream;->writeRun()V

    .line 732
    :cond_0
    const/4 v0, -0x1

    iput v0, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->currentChar:I

    .line 733
    invoke-direct {p0}, Lorg/apache/tools/bzip2/CBZip2OutputStream;->endBlock()V

    .line 734
    invoke-direct {p0}, Lorg/apache/tools/bzip2/CBZip2OutputStream;->endCompression()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 736
    iput-object v1, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->out:Ljava/io/OutputStream;

    .line 737
    iput-object v1, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->data:Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;

    .line 740
    :cond_1
    return-void

    .line 736
    :catchall_0
    move-exception v0

    iput-object v1, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->out:Ljava/io/OutputStream;

    .line 737
    iput-object v1, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->data:Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;

    .line 736
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
    .line 751
    iget-object v0, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->out:Ljava/io/OutputStream;

    .line 752
    .local v0, "outShadow":Ljava/io/OutputStream;
    if-eqz v0, :cond_0

    .line 753
    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V

    .line 755
    :cond_0
    return-void
.end method

.method public final getBlockSize()I
    .locals 1

    .prologue
    .line 857
    iget v0, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->blockSize100k:I

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
    .line 656
    iget-object v0, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->out:Ljava/io/OutputStream;

    if-eqz v0, :cond_0

    .line 657
    invoke-direct {p0, p1}, Lorg/apache/tools/bzip2/CBZip2OutputStream;->write0(I)V

    .line 661
    return-void

    .line 659
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
    .line 862
    if-gez p2, :cond_0

    .line 863
    new-instance v2, Ljava/lang/IndexOutOfBoundsException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "offs("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, ") < 0."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 865
    :cond_0
    if-gez p3, :cond_1

    .line 866
    new-instance v2, Ljava/lang/IndexOutOfBoundsException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "len("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p3}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, ") < 0."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 868
    :cond_1
    add-int v2, p2, p3

    array-length v3, p1

    if-le v2, v3, :cond_2

    .line 869
    new-instance v2, Ljava/lang/IndexOutOfBoundsException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "offs("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, ") + len("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p3}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, ") > buf.length("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    array-length v4, p1

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, ")."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 873
    :cond_2
    iget-object v2, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream;->out:Ljava/io/OutputStream;

    if-nez v2, :cond_3

    .line 874
    new-instance v2, Ljava/io/IOException;

    const-string/jumbo v3, "stream closed"

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 877
    :cond_3
    add-int v0, p2, p3

    .local v0, "hi":I
    move v1, p2

    .end local p2    # "offs":I
    .local v1, "offs":I
    :goto_0
    if-ge v1, v0, :cond_4

    .line 878
    add-int/lit8 p2, v1, 0x1

    .end local v1    # "offs":I
    .restart local p2    # "offs":I
    aget-byte v2, p1, v1

    invoke-direct {p0, v2}, Lorg/apache/tools/bzip2/CBZip2OutputStream;->write0(I)V

    move v1, p2

    .end local p2    # "offs":I
    .restart local v1    # "offs":I
    goto :goto_0

    .line 880
    :cond_4
    return-void
.end method
