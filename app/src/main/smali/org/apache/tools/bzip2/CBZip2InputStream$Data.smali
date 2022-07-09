.class final Lorg/apache/tools/bzip2/CBZip2InputStream$Data;
.super Ljava/lang/Object;
.source "CBZip2InputStream.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/bzip2/CBZip2InputStream;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Data"
.end annotation


# instance fields
.field final base:[[I

.field final cftab:[I

.field final getAndMoveToFrontDecode_yy:[C

.field final inUse:[Z

.field final limit:[[I

.field ll8:[B

.field final minLens:[I

.field final perm:[[I

.field final recvDecodingTables_pos:[B

.field final selector:[B

.field final selectorMtf:[B

.field final seqToUnseq:[B

.field final temp_charArray2d:[[C

.field tt:[I

.field final unzftab:[I


# direct methods
.method constructor <init>(I)V
    .locals 5
    .param p1, "blockSize100k"    # I

    .prologue
    const/16 v1, 0x4652

    const/16 v4, 0x102

    const/16 v3, 0x100

    const/4 v2, 0x6

    .line 953
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 922
    new-array v0, v3, [Z

    iput-object v0, p0, Lorg/apache/tools/bzip2/CBZip2InputStream$Data;->inUse:[Z

    .line 924
    new-array v0, v3, [B

    iput-object v0, p0, Lorg/apache/tools/bzip2/CBZip2InputStream$Data;->seqToUnseq:[B

    .line 925
    new-array v0, v1, [B

    iput-object v0, p0, Lorg/apache/tools/bzip2/CBZip2InputStream$Data;->selector:[B

    .line 926
    new-array v0, v1, [B

    iput-object v0, p0, Lorg/apache/tools/bzip2/CBZip2InputStream$Data;->selectorMtf:[B

    .line 932
    new-array v0, v3, [I

    iput-object v0, p0, Lorg/apache/tools/bzip2/CBZip2InputStream$Data;->unzftab:[I

    .line 934
    filled-new-array {v2, v4}, [I

    move-result-object v0

    sget-object v1, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    invoke-static {v1, v0}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [[I

    iput-object v0, p0, Lorg/apache/tools/bzip2/CBZip2InputStream$Data;->limit:[[I

    .line 935
    filled-new-array {v2, v4}, [I

    move-result-object v0

    sget-object v1, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    invoke-static {v1, v0}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [[I

    iput-object v0, p0, Lorg/apache/tools/bzip2/CBZip2InputStream$Data;->base:[[I

    .line 936
    filled-new-array {v2, v4}, [I

    move-result-object v0

    sget-object v1, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    invoke-static {v1, v0}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [[I

    iput-object v0, p0, Lorg/apache/tools/bzip2/CBZip2InputStream$Data;->perm:[[I

    .line 937
    new-array v0, v2, [I

    iput-object v0, p0, Lorg/apache/tools/bzip2/CBZip2InputStream$Data;->minLens:[I

    .line 939
    const/16 v0, 0x101

    new-array v0, v0, [I

    iput-object v0, p0, Lorg/apache/tools/bzip2/CBZip2InputStream$Data;->cftab:[I

    .line 940
    new-array v0, v3, [C

    iput-object v0, p0, Lorg/apache/tools/bzip2/CBZip2InputStream$Data;->getAndMoveToFrontDecode_yy:[C

    .line 941
    filled-new-array {v2, v4}, [I

    move-result-object v0

    sget-object v1, Ljava/lang/Character;->TYPE:Ljava/lang/Class;

    invoke-static {v1, v0}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [[C

    iput-object v0, p0, Lorg/apache/tools/bzip2/CBZip2InputStream$Data;->temp_charArray2d:[[C

    .line 942
    new-array v0, v2, [B

    iput-object v0, p0, Lorg/apache/tools/bzip2/CBZip2InputStream$Data;->recvDecodingTables_pos:[B

    .line 955
    const v0, 0x186a0

    mul-int/2addr v0, p1

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/apache/tools/bzip2/CBZip2InputStream$Data;->ll8:[B

    .line 956
    return-void
.end method


# virtual methods
.method final initTT(I)[I
    .locals 2
    .param p1, "length"    # I

    .prologue
    .line 967
    iget-object v0, p0, Lorg/apache/tools/bzip2/CBZip2InputStream$Data;->tt:[I

    .line 973
    .local v0, "ttShadow":[I
    if-eqz v0, :cond_0

    array-length v1, v0

    if-ge v1, p1, :cond_1

    .line 974
    :cond_0
    new-array v0, p1, [I

    iput-object v0, p0, Lorg/apache/tools/bzip2/CBZip2InputStream$Data;->tt:[I

    .line 977
    :cond_1
    return-object v0
.end method
