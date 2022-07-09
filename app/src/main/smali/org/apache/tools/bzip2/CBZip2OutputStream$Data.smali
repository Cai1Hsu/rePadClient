.class final Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;
.super Ljava/lang/Object;
.source "CBZip2OutputStream.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/bzip2/CBZip2OutputStream;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Data"
.end annotation


# instance fields
.field final block:[B

.field final fmap:[I

.field final ftab:[I

.field final generateMTFValues_yy:[B

.field final heap:[I

.field final inUse:[Z

.field final mainSort_bigDone:[Z

.field final mainSort_copy:[I

.field final mainSort_runningOrder:[I

.field final mtfFreq:[I

.field final parent:[I

.field final quadrant:[C

.field final selector:[B

.field final selectorMtf:[B

.field final sendMTFValues2_pos:[B

.field final sendMTFValues_code:[[I

.field final sendMTFValues_cost:[S

.field final sendMTFValues_fave:[I

.field final sendMTFValues_len:[[B

.field final sendMTFValues_rfreq:[[I

.field final sentMTFValues4_inUse16:[Z

.field final sfmap:[C

.field final stack_dd:[I

.field final stack_hh:[I

.field final stack_ll:[I

.field final unseqToSeq:[B

.field final weight:[I


# direct methods
.method constructor <init>(I)V
    .locals 8
    .param p1, "blockSize100k"    # I

    .prologue
    const/16 v7, 0x204

    const/16 v6, 0x3e8

    const/16 v5, 0x102

    const/16 v4, 0x100

    const/4 v3, 0x6

    .line 2088
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2039
    new-array v1, v4, [Z

    iput-object v1, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;->inUse:[Z

    .line 2040
    new-array v1, v4, [B

    iput-object v1, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;->unseqToSeq:[B

    .line 2041
    new-array v1, v5, [I

    iput-object v1, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;->mtfFreq:[I

    .line 2042
    const/16 v1, 0x4652

    new-array v1, v1, [B

    iput-object v1, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;->selector:[B

    .line 2043
    const/16 v1, 0x4652

    new-array v1, v1, [B

    iput-object v1, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;->selectorMtf:[B

    .line 2045
    new-array v1, v4, [B

    iput-object v1, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;->generateMTFValues_yy:[B

    .line 2046
    filled-new-array {v3, v5}, [I

    move-result-object v1

    sget-object v2, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    invoke-static {v2, v1}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [[B

    iput-object v1, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;->sendMTFValues_len:[[B

    .line 2048
    filled-new-array {v3, v5}, [I

    move-result-object v1

    sget-object v2, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    invoke-static {v2, v1}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [[I

    iput-object v1, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;->sendMTFValues_rfreq:[[I

    .line 2050
    new-array v1, v3, [I

    iput-object v1, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;->sendMTFValues_fave:[I

    .line 2051
    new-array v1, v3, [S

    iput-object v1, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;->sendMTFValues_cost:[S

    .line 2052
    filled-new-array {v3, v5}, [I

    move-result-object v1

    sget-object v2, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    invoke-static {v2, v1}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [[I

    iput-object v1, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;->sendMTFValues_code:[[I

    .line 2054
    new-array v1, v3, [B

    iput-object v1, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;->sendMTFValues2_pos:[B

    .line 2055
    const/16 v1, 0x10

    new-array v1, v1, [Z

    iput-object v1, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;->sentMTFValues4_inUse16:[Z

    .line 2057
    new-array v1, v6, [I

    iput-object v1, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;->stack_ll:[I

    .line 2058
    new-array v1, v6, [I

    iput-object v1, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;->stack_hh:[I

    .line 2059
    new-array v1, v6, [I

    iput-object v1, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;->stack_dd:[I

    .line 2061
    new-array v1, v4, [I

    iput-object v1, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;->mainSort_runningOrder:[I

    .line 2062
    new-array v1, v4, [I

    iput-object v1, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;->mainSort_copy:[I

    .line 2063
    new-array v1, v4, [Z

    iput-object v1, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;->mainSort_bigDone:[Z

    .line 2065
    const/16 v1, 0x104

    new-array v1, v1, [I

    iput-object v1, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;->heap:[I

    .line 2066
    new-array v1, v7, [I

    iput-object v1, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;->weight:[I

    .line 2067
    new-array v1, v7, [I

    iput-object v1, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;->parent:[I

    .line 2069
    const v1, 0x10001

    new-array v1, v1, [I

    iput-object v1, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;->ftab:[I

    .line 2090
    const v1, 0x186a0

    mul-int v0, p1, v1

    .line 2091
    .local v0, "n":I
    add-int/lit8 v1, v0, 0x1

    add-int/lit8 v1, v1, 0x14

    new-array v1, v1, [B

    iput-object v1, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;->block:[B

    .line 2092
    new-array v1, v0, [I

    iput-object v1, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;->fmap:[I

    .line 2093
    mul-int/lit8 v1, v0, 0x2

    new-array v1, v1, [C

    iput-object v1, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;->sfmap:[C

    .line 2094
    iget-object v1, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;->sfmap:[C

    iput-object v1, p0, Lorg/apache/tools/bzip2/CBZip2OutputStream$Data;->quadrant:[C

    .line 2095
    return-void
.end method
