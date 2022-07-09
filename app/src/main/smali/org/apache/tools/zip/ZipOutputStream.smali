.class public Lorg/apache/tools/zip/ZipOutputStream;
.super Ljava/io/FilterOutputStream;
.source "ZipOutputStream.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/zip/ZipOutputStream$UnicodeExtraFieldPolicy;
    }
.end annotation


# static fields
.field private static final BUFFER_SIZE:I = 0x200

.field private static final BYTE_MASK:I = 0xff

.field protected static final CFH_SIG:[B

.field protected static final DD_SIG:[B

.field public static final DEFAULT_COMPRESSION:I = -0x1

.field static final DEFAULT_ENCODING:Ljava/lang/String;

.field public static final DEFLATED:I = 0x8

.field private static final DEFLATER_BLOCK_SIZE:I = 0x2000

.field private static final DOS_TIME_MIN:[B

.field public static final EFS_FLAG:I = 0x800

.field protected static final EOCD_SIG:[B

.field protected static final LFH_SIG:[B

.field private static final LZERO:[B

.field private static final SHORT:I = 0x2

.field public static final STORED:I = 0x0

.field public static final UFT8_NAMES_FLAG:I = 0x800

.field private static final WORD:I = 0x4

.field private static final ZERO:[B


# instance fields
.field protected buf:[B

.field private cdLength:J

.field private cdOffset:J

.field private comment:Ljava/lang/String;

.field private final crc:Ljava/util/zip/CRC32;

.field private createUnicodeExtraFields:Lorg/apache/tools/zip/ZipOutputStream$UnicodeExtraFieldPolicy;

.field private dataStart:J

.field protected def:Ljava/util/zip/Deflater;

.field private encoding:Ljava/lang/String;

.field private final entries:Ljava/util/List;

.field private entry:Lorg/apache/tools/zip/ZipEntry;

.field private fallbackToUTF8:Z

.field private hasCompressionLevelChanged:Z

.field private level:I

.field private localDataStart:J

.field private method:I

.field private final offsets:Ljava/util/Map;

.field private raf:Ljava/io/RandomAccessFile;

.field private useUTF8Flag:Z

.field private written:J

.field private zipEncoding:Lorg/apache/tools/zip/ZipEncoding;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 97
    const/4 v0, 0x0

    sput-object v0, Lorg/apache/tools/zip/ZipOutputStream;->DEFAULT_ENCODING:Ljava/lang/String;

    .line 203
    const/4 v0, 0x2

    new-array v0, v0, [B

    fill-array-data v0, :array_0

    sput-object v0, Lorg/apache/tools/zip/ZipOutputStream;->ZERO:[B

    .line 210
    const/4 v0, 0x4

    new-array v0, v0, [B

    fill-array-data v0, :array_1

    sput-object v0, Lorg/apache/tools/zip/ZipOutputStream;->LZERO:[B

    .line 651
    const-wide/32 v0, 0x4034b50

    invoke-static {v0, v1}, Lorg/apache/tools/zip/ZipLong;->getBytes(J)[B

    move-result-object v0

    sput-object v0, Lorg/apache/tools/zip/ZipOutputStream;->LFH_SIG:[B

    .line 657
    const-wide/32 v0, 0x8074b50

    invoke-static {v0, v1}, Lorg/apache/tools/zip/ZipLong;->getBytes(J)[B

    move-result-object v0

    sput-object v0, Lorg/apache/tools/zip/ZipOutputStream;->DD_SIG:[B

    .line 663
    const-wide/32 v0, 0x2014b50    # 1.6619997E-316

    invoke-static {v0, v1}, Lorg/apache/tools/zip/ZipLong;->getBytes(J)[B

    move-result-object v0

    sput-object v0, Lorg/apache/tools/zip/ZipOutputStream;->CFH_SIG:[B

    .line 669
    const-wide/32 v0, 0x6054b50

    invoke-static {v0, v1}, Lorg/apache/tools/zip/ZipLong;->getBytes(J)[B

    move-result-object v0

    sput-object v0, Lorg/apache/tools/zip/ZipOutputStream;->EOCD_SIG:[B

    .line 943
    const-wide/16 v0, 0x2100

    invoke-static {v0, v1}, Lorg/apache/tools/zip/ZipLong;->getBytes(J)[B

    move-result-object v0

    sput-object v0, Lorg/apache/tools/zip/ZipOutputStream;->DOS_TIME_MIN:[B

    return-void

    .line 203
    :array_0
    .array-data 1
        0x0t
        0x0t
    .end array-data

    .line 210
    nop

    :array_1
    .array-data 1
        0x0t
        0x0t
        0x0t
        0x0t
    .end array-data
.end method

.method public constructor <init>(Ljava/io/File;)V
    .locals 7
    .param p1, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    const/4 v4, 0x0

    const-wide/16 v2, 0x0

    .line 308
    invoke-direct {p0, v4}, Ljava/io/FilterOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 124
    const-string/jumbo v1, ""

    iput-object v1, p0, Lorg/apache/tools/zip/ZipOutputStream;->comment:Ljava/lang/String;

    .line 131
    const/4 v1, -0x1

    iput v1, p0, Lorg/apache/tools/zip/ZipOutputStream;->level:I

    .line 139
    iput-boolean v5, p0, Lorg/apache/tools/zip/ZipOutputStream;->hasCompressionLevelChanged:Z

    .line 146
    const/16 v1, 0x8

    iput v1, p0, Lorg/apache/tools/zip/ZipOutputStream;->method:I

    .line 153
    new-instance v1, Ljava/util/LinkedList;

    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    iput-object v1, p0, Lorg/apache/tools/zip/ZipOutputStream;->entries:Ljava/util/List;

    .line 160
    new-instance v1, Ljava/util/zip/CRC32;

    invoke-direct {v1}, Ljava/util/zip/CRC32;-><init>()V

    iput-object v1, p0, Lorg/apache/tools/zip/ZipOutputStream;->crc:Ljava/util/zip/CRC32;

    .line 167
    iput-wide v2, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    .line 174
    iput-wide v2, p0, Lorg/apache/tools/zip/ZipOutputStream;->dataStart:J

    .line 182
    iput-wide v2, p0, Lorg/apache/tools/zip/ZipOutputStream;->localDataStart:J

    .line 189
    iput-wide v2, p0, Lorg/apache/tools/zip/ZipOutputStream;->cdOffset:J

    .line 196
    iput-wide v2, p0, Lorg/apache/tools/zip/ZipOutputStream;->cdLength:J

    .line 217
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Lorg/apache/tools/zip/ZipOutputStream;->offsets:Ljava/util/Map;

    .line 228
    iput-object v4, p0, Lorg/apache/tools/zip/ZipOutputStream;->encoding:Ljava/lang/String;

    .line 236
    sget-object v1, Lorg/apache/tools/zip/ZipOutputStream;->DEFAULT_ENCODING:Ljava/lang/String;

    invoke-static {v1}, Lorg/apache/tools/zip/ZipEncodingHelper;->getZipEncoding(Ljava/lang/String;)Lorg/apache/tools/zip/ZipEncoding;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/tools/zip/ZipOutputStream;->zipEncoding:Lorg/apache/tools/zip/ZipEncoding;

    .line 251
    new-instance v1, Ljava/util/zip/Deflater;

    iget v2, p0, Lorg/apache/tools/zip/ZipOutputStream;->level:I

    invoke-direct {v1, v2, v6}, Ljava/util/zip/Deflater;-><init>(IZ)V

    iput-object v1, p0, Lorg/apache/tools/zip/ZipOutputStream;->def:Ljava/util/zip/Deflater;

    .line 263
    const/16 v1, 0x200

    new-array v1, v1, [B

    iput-object v1, p0, Lorg/apache/tools/zip/ZipOutputStream;->buf:[B

    .line 272
    iput-object v4, p0, Lorg/apache/tools/zip/ZipOutputStream;->raf:Ljava/io/RandomAccessFile;

    .line 278
    iput-boolean v6, p0, Lorg/apache/tools/zip/ZipOutputStream;->useUTF8Flag:Z

    .line 283
    iput-boolean v5, p0, Lorg/apache/tools/zip/ZipOutputStream;->fallbackToUTF8:Z

    .line 288
    sget-object v1, Lorg/apache/tools/zip/ZipOutputStream$UnicodeExtraFieldPolicy;->NEVER:Lorg/apache/tools/zip/ZipOutputStream$UnicodeExtraFieldPolicy;

    iput-object v1, p0, Lorg/apache/tools/zip/ZipOutputStream;->createUnicodeExtraFields:Lorg/apache/tools/zip/ZipOutputStream$UnicodeExtraFieldPolicy;

    .line 311
    :try_start_0
    new-instance v1, Ljava/io/RandomAccessFile;

    const-string/jumbo v2, "rw"

    invoke-direct {v1, p1, v2}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v1, p0, Lorg/apache/tools/zip/ZipOutputStream;->raf:Ljava/io/RandomAccessFile;

    .line 312
    iget-object v1, p0, Lorg/apache/tools/zip/ZipOutputStream;->raf:Ljava/io/RandomAccessFile;

    const-wide/16 v2, 0x0

    invoke-virtual {v1, v2, v3}, Ljava/io/RandomAccessFile;->setLength(J)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 324
    :goto_0
    return-void

    .line 313
    :catch_0
    move-exception v0

    .line 314
    .local v0, "e":Ljava/io/IOException;
    iget-object v1, p0, Lorg/apache/tools/zip/ZipOutputStream;->raf:Ljava/io/RandomAccessFile;

    if-eqz v1, :cond_0

    .line 316
    :try_start_1
    iget-object v1, p0, Lorg/apache/tools/zip/ZipOutputStream;->raf:Ljava/io/RandomAccessFile;

    invoke-virtual {v1}, Ljava/io/RandomAccessFile;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 320
    :goto_1
    iput-object v4, p0, Lorg/apache/tools/zip/ZipOutputStream;->raf:Ljava/io/RandomAccessFile;

    .line 322
    :cond_0
    new-instance v1, Ljava/io/FileOutputStream;

    invoke-direct {v1, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    iput-object v1, p0, Lorg/apache/tools/zip/ZipOutputStream;->out:Ljava/io/OutputStream;

    goto :goto_0

    .line 317
    :catch_1
    move-exception v1

    goto :goto_1
.end method

.method public constructor <init>(Ljava/io/OutputStream;)V
    .locals 7
    .param p1, "out"    # Ljava/io/OutputStream;

    .prologue
    const/4 v6, 0x0

    const/4 v5, 0x1

    const/4 v4, 0x0

    const-wide/16 v2, 0x0

    .line 297
    invoke-direct {p0, p1}, Ljava/io/FilterOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 124
    const-string/jumbo v0, ""

    iput-object v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->comment:Ljava/lang/String;

    .line 131
    const/4 v0, -0x1

    iput v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->level:I

    .line 139
    iput-boolean v4, p0, Lorg/apache/tools/zip/ZipOutputStream;->hasCompressionLevelChanged:Z

    .line 146
    const/16 v0, 0x8

    iput v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->method:I

    .line 153
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->entries:Ljava/util/List;

    .line 160
    new-instance v0, Ljava/util/zip/CRC32;

    invoke-direct {v0}, Ljava/util/zip/CRC32;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->crc:Ljava/util/zip/CRC32;

    .line 167
    iput-wide v2, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    .line 174
    iput-wide v2, p0, Lorg/apache/tools/zip/ZipOutputStream;->dataStart:J

    .line 182
    iput-wide v2, p0, Lorg/apache/tools/zip/ZipOutputStream;->localDataStart:J

    .line 189
    iput-wide v2, p0, Lorg/apache/tools/zip/ZipOutputStream;->cdOffset:J

    .line 196
    iput-wide v2, p0, Lorg/apache/tools/zip/ZipOutputStream;->cdLength:J

    .line 217
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->offsets:Ljava/util/Map;

    .line 228
    iput-object v6, p0, Lorg/apache/tools/zip/ZipOutputStream;->encoding:Ljava/lang/String;

    .line 236
    sget-object v0, Lorg/apache/tools/zip/ZipOutputStream;->DEFAULT_ENCODING:Ljava/lang/String;

    invoke-static {v0}, Lorg/apache/tools/zip/ZipEncodingHelper;->getZipEncoding(Ljava/lang/String;)Lorg/apache/tools/zip/ZipEncoding;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->zipEncoding:Lorg/apache/tools/zip/ZipEncoding;

    .line 251
    new-instance v0, Ljava/util/zip/Deflater;

    iget v1, p0, Lorg/apache/tools/zip/ZipOutputStream;->level:I

    invoke-direct {v0, v1, v5}, Ljava/util/zip/Deflater;-><init>(IZ)V

    iput-object v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->def:Ljava/util/zip/Deflater;

    .line 263
    const/16 v0, 0x200

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->buf:[B

    .line 272
    iput-object v6, p0, Lorg/apache/tools/zip/ZipOutputStream;->raf:Ljava/io/RandomAccessFile;

    .line 278
    iput-boolean v5, p0, Lorg/apache/tools/zip/ZipOutputStream;->useUTF8Flag:Z

    .line 283
    iput-boolean v4, p0, Lorg/apache/tools/zip/ZipOutputStream;->fallbackToUTF8:Z

    .line 288
    sget-object v0, Lorg/apache/tools/zip/ZipOutputStream$UnicodeExtraFieldPolicy;->NEVER:Lorg/apache/tools/zip/ZipOutputStream$UnicodeExtraFieldPolicy;

    iput-object v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->createUnicodeExtraFields:Lorg/apache/tools/zip/ZipOutputStream$UnicodeExtraFieldPolicy;

    .line 298
    return-void
.end method

.method protected static adjustToLong(I)J
    .locals 4
    .param p0, "i"    # I

    .prologue
    .line 1041
    if-gez p0, :cond_0

    .line 1042
    const-wide v0, 0x100000000L

    int-to-long v2, p0

    add-long/2addr v0, v2

    .line 1044
    :goto_0
    return-wide v0

    :cond_0
    int-to-long v0, p0

    goto :goto_0
.end method

.method private deflateUntilInputIsNeeded()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1049
    :goto_0
    iget-object v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->def:Ljava/util/zip/Deflater;

    invoke-virtual {v0}, Ljava/util/zip/Deflater;->needsInput()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1050
    invoke-virtual {p0}, Lorg/apache/tools/zip/ZipOutputStream;->deflate()V

    goto :goto_0

    .line 1052
    :cond_0
    return-void
.end method

.method protected static toDosTime(Ljava/util/Date;)Lorg/apache/tools/zip/ZipLong;
    .locals 4
    .param p0, "time"    # Ljava/util/Date;

    .prologue
    .line 952
    new-instance v0, Lorg/apache/tools/zip/ZipLong;

    invoke-virtual {p0}, Ljava/util/Date;->getTime()J

    move-result-wide v2

    invoke-static {v2, v3}, Lorg/apache/tools/zip/ZipOutputStream;->toDosTime(J)[B

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/zip/ZipLong;-><init>([B)V

    return-object v0
.end method

.method protected static toDosTime(J)[B
    .locals 8
    .param p0, "t"    # J

    .prologue
    .line 964
    new-instance v1, Ljava/util/Date;

    invoke-direct {v1, p0, p1}, Ljava/util/Date;-><init>(J)V

    .line 967
    .local v1, "time":Ljava/util/Date;
    invoke-virtual {v1}, Ljava/util/Date;->getYear()I

    move-result v5

    add-int/lit16 v4, v5, 0x76c

    .line 968
    .local v4, "year":I
    const/16 v5, 0x7bc

    if-ge v4, v5, :cond_0

    .line 969
    sget-object v5, Lorg/apache/tools/zip/ZipOutputStream;->DOS_TIME_MIN:[B

    .line 978
    :goto_0
    return-object v5

    .line 971
    :cond_0
    invoke-virtual {v1}, Ljava/util/Date;->getMonth()I

    move-result v5

    add-int/lit8 v0, v5, 0x1

    .line 972
    .local v0, "month":I
    add-int/lit16 v5, v4, -0x7bc

    shl-int/lit8 v5, v5, 0x19

    shl-int/lit8 v6, v0, 0x15

    or-int/2addr v5, v6

    invoke-virtual {v1}, Ljava/util/Date;->getDate()I

    move-result v6

    shl-int/lit8 v6, v6, 0x10

    or-int/2addr v5, v6

    invoke-virtual {v1}, Ljava/util/Date;->getHours()I

    move-result v6

    shl-int/lit8 v6, v6, 0xb

    or-int/2addr v5, v6

    invoke-virtual {v1}, Ljava/util/Date;->getMinutes()I

    move-result v6

    shl-int/lit8 v6, v6, 0x5

    or-int/2addr v5, v6

    invoke-virtual {v1}, Ljava/util/Date;->getSeconds()I

    move-result v6

    shr-int/lit8 v6, v6, 0x1

    or-int/2addr v5, v6

    int-to-long v2, v5

    .line 978
    .local v2, "value":J
    invoke-static {v2, v3}, Lorg/apache/tools/zip/ZipLong;->getBytes(J)[B

    move-result-object v5

    goto :goto_0
.end method

.method private writeVersionNeededToExtractAndGeneralPurposeBits(IZ)V
    .locals 3
    .param p1, "zipMethod"    # I
    .param p2, "utfFallback"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1061
    const/16 v1, 0xa

    .line 1062
    .local v1, "versionNeededToExtract":I
    iget-boolean v2, p0, Lorg/apache/tools/zip/ZipOutputStream;->useUTF8Flag:Z

    if-nez v2, :cond_0

    if-eqz p2, :cond_2

    :cond_0
    const/16 v0, 0x800

    .line 1063
    .local v0, "generalPurposeFlag":I
    :goto_0
    const/16 v2, 0x8

    if-ne p1, v2, :cond_1

    iget-object v2, p0, Lorg/apache/tools/zip/ZipOutputStream;->raf:Ljava/io/RandomAccessFile;

    if-nez v2, :cond_1

    .line 1066
    const/16 v1, 0x14

    .line 1068
    or-int/lit8 v0, v0, 0x8

    .line 1073
    :cond_1
    invoke-static {v1}, Lorg/apache/tools/zip/ZipShort;->getBytes(I)[B

    move-result-object v2

    invoke-virtual {p0, v2}, Lorg/apache/tools/zip/ZipOutputStream;->writeOut([B)V

    .line 1075
    invoke-static {v0}, Lorg/apache/tools/zip/ZipShort;->getBytes(I)[B

    move-result-object v2

    invoke-virtual {p0, v2}, Lorg/apache/tools/zip/ZipOutputStream;->writeOut([B)V

    .line 1076
    return-void

    .line 1062
    .end local v0    # "generalPurposeFlag":I
    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 620
    invoke-virtual {p0}, Lorg/apache/tools/zip/ZipOutputStream;->finish()V

    .line 622
    iget-object v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->raf:Ljava/io/RandomAccessFile;

    if-eqz v0, :cond_0

    .line 623
    iget-object v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->raf:Ljava/io/RandomAccessFile;

    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->close()V

    .line 625
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->out:Ljava/io/OutputStream;

    if-eqz v0, :cond_1

    .line 626
    iget-object v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V

    .line 628
    :cond_1
    return-void
.end method

.method public closeEntry()V
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 422
    iget-object v6, p0, Lorg/apache/tools/zip/ZipOutputStream;->entry:Lorg/apache/tools/zip/ZipEntry;

    if-nez v6, :cond_0

    .line 480
    :goto_0
    return-void

    .line 426
    :cond_0
    iget-object v6, p0, Lorg/apache/tools/zip/ZipOutputStream;->crc:Ljava/util/zip/CRC32;

    invoke-virtual {v6}, Ljava/util/zip/CRC32;->getValue()J

    move-result-wide v0

    .line 427
    .local v0, "realCrc":J
    iget-object v6, p0, Lorg/apache/tools/zip/ZipOutputStream;->crc:Ljava/util/zip/CRC32;

    invoke-virtual {v6}, Ljava/util/zip/CRC32;->reset()V

    .line 429
    iget-object v6, p0, Lorg/apache/tools/zip/ZipOutputStream;->entry:Lorg/apache/tools/zip/ZipEntry;

    invoke-virtual {v6}, Lorg/apache/tools/zip/ZipEntry;->getMethod()I

    move-result v6

    const/16 v7, 0x8

    if-ne v6, v7, :cond_4

    .line 430
    iget-object v6, p0, Lorg/apache/tools/zip/ZipOutputStream;->def:Ljava/util/zip/Deflater;

    invoke-virtual {v6}, Ljava/util/zip/Deflater;->finish()V

    .line 431
    :goto_1
    iget-object v6, p0, Lorg/apache/tools/zip/ZipOutputStream;->def:Ljava/util/zip/Deflater;

    invoke-virtual {v6}, Ljava/util/zip/Deflater;->finished()Z

    move-result v6

    if-nez v6, :cond_1

    .line 432
    invoke-virtual {p0}, Lorg/apache/tools/zip/ZipOutputStream;->deflate()V

    goto :goto_1

    .line 435
    :cond_1
    iget-object v6, p0, Lorg/apache/tools/zip/ZipOutputStream;->entry:Lorg/apache/tools/zip/ZipEntry;

    iget-object v7, p0, Lorg/apache/tools/zip/ZipOutputStream;->def:Ljava/util/zip/Deflater;

    invoke-virtual {v7}, Ljava/util/zip/Deflater;->getTotalIn()I

    move-result v7

    invoke-static {v7}, Lorg/apache/tools/zip/ZipOutputStream;->adjustToLong(I)J

    move-result-wide v8

    invoke-virtual {v6, v8, v9}, Lorg/apache/tools/zip/ZipEntry;->setSize(J)V

    .line 436
    iget-object v6, p0, Lorg/apache/tools/zip/ZipOutputStream;->entry:Lorg/apache/tools/zip/ZipEntry;

    iget-object v7, p0, Lorg/apache/tools/zip/ZipOutputStream;->def:Ljava/util/zip/Deflater;

    invoke-virtual {v7}, Ljava/util/zip/Deflater;->getTotalOut()I

    move-result v7

    invoke-static {v7}, Lorg/apache/tools/zip/ZipOutputStream;->adjustToLong(I)J

    move-result-wide v8

    invoke-virtual {v6, v8, v9}, Lorg/apache/tools/zip/ZipEntry;->setCompressedSize(J)V

    .line 437
    iget-object v6, p0, Lorg/apache/tools/zip/ZipOutputStream;->entry:Lorg/apache/tools/zip/ZipEntry;

    invoke-virtual {v6, v0, v1}, Lorg/apache/tools/zip/ZipEntry;->setCrc(J)V

    .line 439
    iget-object v6, p0, Lorg/apache/tools/zip/ZipOutputStream;->def:Ljava/util/zip/Deflater;

    invoke-virtual {v6}, Ljava/util/zip/Deflater;->reset()V

    .line 441
    iget-wide v6, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    iget-object v8, p0, Lorg/apache/tools/zip/ZipOutputStream;->entry:Lorg/apache/tools/zip/ZipEntry;

    invoke-virtual {v8}, Lorg/apache/tools/zip/ZipEntry;->getCompressedSize()J

    move-result-wide v8

    add-long/2addr v6, v8

    iput-wide v6, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    .line 468
    :cond_2
    :goto_2
    iget-object v6, p0, Lorg/apache/tools/zip/ZipOutputStream;->raf:Ljava/io/RandomAccessFile;

    if-eqz v6, :cond_3

    .line 469
    iget-object v6, p0, Lorg/apache/tools/zip/ZipOutputStream;->raf:Ljava/io/RandomAccessFile;

    invoke-virtual {v6}, Ljava/io/RandomAccessFile;->getFilePointer()J

    move-result-wide v2

    .line 471
    .local v2, "save":J
    iget-object v6, p0, Lorg/apache/tools/zip/ZipOutputStream;->raf:Ljava/io/RandomAccessFile;

    iget-wide v8, p0, Lorg/apache/tools/zip/ZipOutputStream;->localDataStart:J

    invoke-virtual {v6, v8, v9}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 472
    iget-object v6, p0, Lorg/apache/tools/zip/ZipOutputStream;->entry:Lorg/apache/tools/zip/ZipEntry;

    invoke-virtual {v6}, Lorg/apache/tools/zip/ZipEntry;->getCrc()J

    move-result-wide v6

    invoke-static {v6, v7}, Lorg/apache/tools/zip/ZipLong;->getBytes(J)[B

    move-result-object v6

    invoke-virtual {p0, v6}, Lorg/apache/tools/zip/ZipOutputStream;->writeOut([B)V

    .line 473
    iget-object v6, p0, Lorg/apache/tools/zip/ZipOutputStream;->entry:Lorg/apache/tools/zip/ZipEntry;

    invoke-virtual {v6}, Lorg/apache/tools/zip/ZipEntry;->getCompressedSize()J

    move-result-wide v6

    invoke-static {v6, v7}, Lorg/apache/tools/zip/ZipLong;->getBytes(J)[B

    move-result-object v6

    invoke-virtual {p0, v6}, Lorg/apache/tools/zip/ZipOutputStream;->writeOut([B)V

    .line 474
    iget-object v6, p0, Lorg/apache/tools/zip/ZipOutputStream;->entry:Lorg/apache/tools/zip/ZipEntry;

    invoke-virtual {v6}, Lorg/apache/tools/zip/ZipEntry;->getSize()J

    move-result-wide v6

    invoke-static {v6, v7}, Lorg/apache/tools/zip/ZipLong;->getBytes(J)[B

    move-result-object v6

    invoke-virtual {p0, v6}, Lorg/apache/tools/zip/ZipOutputStream;->writeOut([B)V

    .line 475
    iget-object v6, p0, Lorg/apache/tools/zip/ZipOutputStream;->raf:Ljava/io/RandomAccessFile;

    invoke-virtual {v6, v2, v3}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 478
    .end local v2    # "save":J
    :cond_3
    iget-object v6, p0, Lorg/apache/tools/zip/ZipOutputStream;->entry:Lorg/apache/tools/zip/ZipEntry;

    invoke-virtual {p0, v6}, Lorg/apache/tools/zip/ZipOutputStream;->writeDataDescriptor(Lorg/apache/tools/zip/ZipEntry;)V

    .line 479
    const/4 v6, 0x0

    iput-object v6, p0, Lorg/apache/tools/zip/ZipOutputStream;->entry:Lorg/apache/tools/zip/ZipEntry;

    goto/16 :goto_0

    .line 442
    :cond_4
    iget-object v6, p0, Lorg/apache/tools/zip/ZipOutputStream;->raf:Ljava/io/RandomAccessFile;

    if-nez v6, :cond_6

    .line 443
    iget-object v6, p0, Lorg/apache/tools/zip/ZipOutputStream;->entry:Lorg/apache/tools/zip/ZipEntry;

    invoke-virtual {v6}, Lorg/apache/tools/zip/ZipEntry;->getCrc()J

    move-result-wide v6

    cmp-long v6, v6, v0

    if-eqz v6, :cond_5

    .line 444
    new-instance v6, Ljava/util/zip/ZipException;

    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v8, "bad CRC checksum for entry "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    iget-object v8, p0, Lorg/apache/tools/zip/ZipOutputStream;->entry:Lorg/apache/tools/zip/ZipEntry;

    invoke-virtual {v8}, Lorg/apache/tools/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string/jumbo v8, ": "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    iget-object v8, p0, Lorg/apache/tools/zip/ZipOutputStream;->entry:Lorg/apache/tools/zip/ZipEntry;

    invoke-virtual {v8}, Lorg/apache/tools/zip/ZipEntry;->getCrc()J

    move-result-wide v8

    invoke-static {v8, v9}, Ljava/lang/Long;->toHexString(J)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string/jumbo v8, " instead of "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-static {v0, v1}, Ljava/lang/Long;->toHexString(J)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/util/zip/ZipException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 451
    :cond_5
    iget-object v6, p0, Lorg/apache/tools/zip/ZipOutputStream;->entry:Lorg/apache/tools/zip/ZipEntry;

    invoke-virtual {v6}, Lorg/apache/tools/zip/ZipEntry;->getSize()J

    move-result-wide v6

    iget-wide v8, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    iget-wide v10, p0, Lorg/apache/tools/zip/ZipOutputStream;->dataStart:J

    sub-long/2addr v8, v10

    cmp-long v6, v6, v8

    if-eqz v6, :cond_2

    .line 452
    new-instance v6, Ljava/util/zip/ZipException;

    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v8, "bad size for entry "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    iget-object v8, p0, Lorg/apache/tools/zip/ZipOutputStream;->entry:Lorg/apache/tools/zip/ZipEntry;

    invoke-virtual {v8}, Lorg/apache/tools/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string/jumbo v8, ": "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    iget-object v8, p0, Lorg/apache/tools/zip/ZipOutputStream;->entry:Lorg/apache/tools/zip/ZipEntry;

    invoke-virtual {v8}, Lorg/apache/tools/zip/ZipEntry;->getSize()J

    move-result-wide v8

    invoke-virtual {v7, v8, v9}, Ljava/lang/StringBuffer;->append(J)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string/jumbo v8, " instead of "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    iget-wide v8, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    iget-wide v10, p0, Lorg/apache/tools/zip/ZipOutputStream;->dataStart:J

    sub-long/2addr v8, v10

    invoke-virtual {v7, v8, v9}, Ljava/lang/StringBuffer;->append(J)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/util/zip/ZipException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 459
    :cond_6
    iget-wide v6, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    iget-wide v8, p0, Lorg/apache/tools/zip/ZipOutputStream;->dataStart:J

    sub-long v4, v6, v8

    .line 461
    .local v4, "size":J
    iget-object v6, p0, Lorg/apache/tools/zip/ZipOutputStream;->entry:Lorg/apache/tools/zip/ZipEntry;

    invoke-virtual {v6, v4, v5}, Lorg/apache/tools/zip/ZipEntry;->setSize(J)V

    .line 462
    iget-object v6, p0, Lorg/apache/tools/zip/ZipOutputStream;->entry:Lorg/apache/tools/zip/ZipEntry;

    invoke-virtual {v6, v4, v5}, Lorg/apache/tools/zip/ZipEntry;->setCompressedSize(J)V

    .line 463
    iget-object v6, p0, Lorg/apache/tools/zip/ZipOutputStream;->entry:Lorg/apache/tools/zip/ZipEntry;

    invoke-virtual {v6, v0, v1}, Lorg/apache/tools/zip/ZipEntry;->setCrc(J)V

    goto/16 :goto_2
.end method

.method protected final deflate()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 678
    iget-object v1, p0, Lorg/apache/tools/zip/ZipOutputStream;->def:Ljava/util/zip/Deflater;

    iget-object v2, p0, Lorg/apache/tools/zip/ZipOutputStream;->buf:[B

    iget-object v3, p0, Lorg/apache/tools/zip/ZipOutputStream;->buf:[B

    array-length v3, v3

    invoke-virtual {v1, v2, v4, v3}, Ljava/util/zip/Deflater;->deflate([BII)I

    move-result v0

    .line 679
    .local v0, "len":I
    if-lez v0, :cond_0

    .line 680
    iget-object v1, p0, Lorg/apache/tools/zip/ZipOutputStream;->buf:[B

    invoke-virtual {p0, v1, v4, v0}, Lorg/apache/tools/zip/ZipOutputStream;->writeOut([BII)V

    .line 682
    :cond_0
    return-void
.end method

.method public finish()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 403
    invoke-virtual {p0}, Lorg/apache/tools/zip/ZipOutputStream;->closeEntry()V

    .line 404
    iget-wide v2, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    iput-wide v2, p0, Lorg/apache/tools/zip/ZipOutputStream;->cdOffset:J

    .line 405
    iget-object v1, p0, Lorg/apache/tools/zip/ZipOutputStream;->entries:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 406
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/tools/zip/ZipEntry;

    invoke-virtual {p0, v1}, Lorg/apache/tools/zip/ZipOutputStream;->writeCentralFileHeader(Lorg/apache/tools/zip/ZipEntry;)V

    goto :goto_0

    .line 408
    :cond_0
    iget-wide v2, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    iget-wide v4, p0, Lorg/apache/tools/zip/ZipOutputStream;->cdOffset:J

    sub-long/2addr v2, v4

    iput-wide v2, p0, Lorg/apache/tools/zip/ZipOutputStream;->cdLength:J

    .line 409
    invoke-virtual {p0}, Lorg/apache/tools/zip/ZipOutputStream;->writeCentralDirectoryEnd()V

    .line 410
    iget-object v1, p0, Lorg/apache/tools/zip/ZipOutputStream;->offsets:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->clear()V

    .line 411
    iget-object v1, p0, Lorg/apache/tools/zip/ZipOutputStream;->entries:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 412
    iget-object v1, p0, Lorg/apache/tools/zip/ZipOutputStream;->def:Ljava/util/zip/Deflater;

    invoke-virtual {v1}, Ljava/util/zip/Deflater;->end()V

    .line 413
    return-void
.end method

.method public flush()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 638
    iget-object v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->out:Ljava/io/OutputStream;

    if-eqz v0, :cond_0

    .line 639
    iget-object v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V

    .line 641
    :cond_0
    return-void
.end method

.method protected getBytes(Ljava/lang/String;)[B
    .locals 7
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/zip/ZipException;
        }
    .end annotation

    .prologue
    .line 993
    :try_start_0
    iget-object v3, p0, Lorg/apache/tools/zip/ZipOutputStream;->encoding:Ljava/lang/String;

    invoke-static {v3}, Lorg/apache/tools/zip/ZipEncodingHelper;->getZipEncoding(Ljava/lang/String;)Lorg/apache/tools/zip/ZipEncoding;

    move-result-object v3

    invoke-interface {v3, p1}, Lorg/apache/tools/zip/ZipEncoding;->encode(Ljava/lang/String;)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 995
    .local v0, "b":Ljava/nio/ByteBuffer;
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->limit()I

    move-result v3

    new-array v2, v3, [B

    .line 996
    .local v2, "result":[B
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v3

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->arrayOffset()I

    move-result v4

    const/4 v5, 0x0

    array-length v6, v2

    invoke-static {v3, v4, v2, v5, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 998
    return-object v2

    .line 999
    .end local v0    # "b":Ljava/nio/ByteBuffer;
    .end local v2    # "result":[B
    :catch_0
    move-exception v1

    .line 1000
    .local v1, "ex":Ljava/io/IOException;
    new-instance v3, Ljava/util/zip/ZipException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "Failed to encode name: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/util/zip/ZipException;-><init>(Ljava/lang/String;)V

    throw v3
.end method

.method public getEncoding()Ljava/lang/String;
    .locals 1

    .prologue
    .line 363
    iget-object v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->encoding:Ljava/lang/String;

    return-object v0
.end method

.method public isSeekable()Z
    .locals 1

    .prologue
    .line 337
    iget-object v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->raf:Ljava/io/RandomAccessFile;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public putNextEntry(Lorg/apache/tools/zip/ZipEntry;)V
    .locals 6
    .param p1, "ze"    # Lorg/apache/tools/zip/ZipEntry;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/16 v4, -0x1

    .line 489
    invoke-virtual {p0}, Lorg/apache/tools/zip/ZipOutputStream;->closeEntry()V

    .line 491
    iput-object p1, p0, Lorg/apache/tools/zip/ZipOutputStream;->entry:Lorg/apache/tools/zip/ZipEntry;

    .line 492
    iget-object v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->entries:Ljava/util/List;

    iget-object v1, p0, Lorg/apache/tools/zip/ZipOutputStream;->entry:Lorg/apache/tools/zip/ZipEntry;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 494
    iget-object v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->entry:Lorg/apache/tools/zip/ZipEntry;

    invoke-virtual {v0}, Lorg/apache/tools/zip/ZipEntry;->getMethod()I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 495
    iget-object v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->entry:Lorg/apache/tools/zip/ZipEntry;

    iget v1, p0, Lorg/apache/tools/zip/ZipOutputStream;->method:I

    invoke-virtual {v0, v1}, Lorg/apache/tools/zip/ZipEntry;->setMethod(I)V

    .line 498
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->entry:Lorg/apache/tools/zip/ZipEntry;

    invoke-virtual {v0}, Lorg/apache/tools/zip/ZipEntry;->getTime()J

    move-result-wide v0

    cmp-long v0, v0, v4

    if-nez v0, :cond_1

    .line 499
    iget-object v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->entry:Lorg/apache/tools/zip/ZipEntry;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Lorg/apache/tools/zip/ZipEntry;->setTime(J)V

    .line 503
    :cond_1
    iget-object v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->entry:Lorg/apache/tools/zip/ZipEntry;

    invoke-virtual {v0}, Lorg/apache/tools/zip/ZipEntry;->getMethod()I

    move-result v0

    if-nez v0, :cond_4

    iget-object v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->raf:Ljava/io/RandomAccessFile;

    if-nez v0, :cond_4

    .line 504
    iget-object v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->entry:Lorg/apache/tools/zip/ZipEntry;

    invoke-virtual {v0}, Lorg/apache/tools/zip/ZipEntry;->getSize()J

    move-result-wide v0

    cmp-long v0, v0, v4

    if-nez v0, :cond_2

    .line 505
    new-instance v0, Ljava/util/zip/ZipException;

    const-string/jumbo v1, "uncompressed size is required for STORED method when not writing to a file"

    invoke-direct {v0, v1}, Ljava/util/zip/ZipException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 509
    :cond_2
    iget-object v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->entry:Lorg/apache/tools/zip/ZipEntry;

    invoke-virtual {v0}, Lorg/apache/tools/zip/ZipEntry;->getCrc()J

    move-result-wide v0

    cmp-long v0, v0, v4

    if-nez v0, :cond_3

    .line 510
    new-instance v0, Ljava/util/zip/ZipException;

    const-string/jumbo v1, "crc checksum is required for STORED method when not writing to a file"

    invoke-direct {v0, v1}, Ljava/util/zip/ZipException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 513
    :cond_3
    iget-object v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->entry:Lorg/apache/tools/zip/ZipEntry;

    iget-object v1, p0, Lorg/apache/tools/zip/ZipOutputStream;->entry:Lorg/apache/tools/zip/ZipEntry;

    invoke-virtual {v1}, Lorg/apache/tools/zip/ZipEntry;->getSize()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Lorg/apache/tools/zip/ZipEntry;->setCompressedSize(J)V

    .line 516
    :cond_4
    iget-object v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->entry:Lorg/apache/tools/zip/ZipEntry;

    invoke-virtual {v0}, Lorg/apache/tools/zip/ZipEntry;->getMethod()I

    move-result v0

    const/16 v1, 0x8

    if-ne v0, v1, :cond_5

    iget-boolean v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->hasCompressionLevelChanged:Z

    if-eqz v0, :cond_5

    .line 517
    iget-object v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->def:Ljava/util/zip/Deflater;

    iget v1, p0, Lorg/apache/tools/zip/ZipOutputStream;->level:I

    invoke-virtual {v0, v1}, Ljava/util/zip/Deflater;->setLevel(I)V

    .line 518
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->hasCompressionLevelChanged:Z

    .line 520
    :cond_5
    iget-object v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->entry:Lorg/apache/tools/zip/ZipEntry;

    invoke-virtual {p0, v0}, Lorg/apache/tools/zip/ZipOutputStream;->writeLocalFileHeader(Lorg/apache/tools/zip/ZipEntry;)V

    .line 521
    return-void
.end method

.method public setComment(Ljava/lang/String;)V
    .locals 0
    .param p1, "comment"    # Ljava/lang/String;

    .prologue
    .line 529
    iput-object p1, p0, Lorg/apache/tools/zip/ZipOutputStream;->comment:Ljava/lang/String;

    .line 530
    return-void
.end method

.method public setCreateUnicodeExtraFields(Lorg/apache/tools/zip/ZipOutputStream$UnicodeExtraFieldPolicy;)V
    .locals 0
    .param p1, "b"    # Lorg/apache/tools/zip/ZipOutputStream$UnicodeExtraFieldPolicy;

    .prologue
    .line 382
    iput-object p1, p0, Lorg/apache/tools/zip/ZipOutputStream;->createUnicodeExtraFields:Lorg/apache/tools/zip/ZipOutputStream$UnicodeExtraFieldPolicy;

    .line 383
    return-void
.end method

.method public setEncoding(Ljava/lang/String;)V
    .locals 2
    .param p1, "encoding"    # Ljava/lang/String;

    .prologue
    .line 350
    iput-object p1, p0, Lorg/apache/tools/zip/ZipOutputStream;->encoding:Ljava/lang/String;

    .line 351
    invoke-static {p1}, Lorg/apache/tools/zip/ZipEncodingHelper;->getZipEncoding(Ljava/lang/String;)Lorg/apache/tools/zip/ZipEncoding;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->zipEncoding:Lorg/apache/tools/zip/ZipEncoding;

    .line 352
    iget-boolean v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->useUTF8Flag:Z

    invoke-static {p1}, Lorg/apache/tools/zip/ZipEncodingHelper;->isUTF8(Ljava/lang/String;)Z

    move-result v1

    and-int/2addr v0, v1

    iput-boolean v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->useUTF8Flag:Z

    .line 353
    return-void
.end method

.method public setFallbackToUTF8(Z)V
    .locals 0
    .param p1, "b"    # Z

    .prologue
    .line 392
    iput-boolean p1, p0, Lorg/apache/tools/zip/ZipOutputStream;->fallbackToUTF8:Z

    .line 393
    return-void
.end method

.method public setLevel(I)V
    .locals 3
    .param p1, "level"    # I

    .prologue
    .line 542
    const/4 v0, -0x1

    if-lt p1, v0, :cond_0

    const/16 v0, 0x9

    if-le p1, v0, :cond_1

    .line 544
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "Invalid compression level: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 547
    :cond_1
    iget v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->level:I

    if-eq v0, p1, :cond_2

    const/4 v0, 0x1

    :goto_0
    iput-boolean v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->hasCompressionLevelChanged:Z

    .line 548
    iput p1, p0, Lorg/apache/tools/zip/ZipOutputStream;->level:I

    .line 549
    return-void

    .line 547
    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setMethod(I)V
    .locals 0
    .param p1, "method"    # I

    .prologue
    .line 559
    iput p1, p0, Lorg/apache/tools/zip/ZipOutputStream;->method:I

    .line 560
    return-void
.end method

.method public setUseLanguageEncodingFlag(Z)V
    .locals 1
    .param p1, "b"    # Z

    .prologue
    .line 373
    if-eqz p1, :cond_0

    iget-object v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->encoding:Ljava/lang/String;

    invoke-static {v0}, Lorg/apache/tools/zip/ZipEncodingHelper;->isUTF8(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    iput-boolean v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->useUTF8Flag:Z

    .line 374
    return-void

    .line 373
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public write(I)V
    .locals 4
    .param p1, "b"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 607
    new-array v0, v3, [B

    .line 608
    .local v0, "buff":[B
    and-int/lit16 v1, p1, 0xff

    int-to-byte v1, v1

    aput-byte v1, v0, v2

    .line 609
    invoke-virtual {p0, v0, v2, v3}, Lorg/apache/tools/zip/ZipOutputStream;->write([BII)V

    .line 610
    return-void
.end method

.method public write([BII)V
    .locals 8
    .param p1, "b"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v5, 0x2000

    .line 570
    iget-object v3, p0, Lorg/apache/tools/zip/ZipOutputStream;->entry:Lorg/apache/tools/zip/ZipEntry;

    invoke-virtual {v3}, Lorg/apache/tools/zip/ZipEntry;->getMethod()I

    move-result v3

    const/16 v4, 0x8

    if-ne v3, v4, :cond_3

    .line 571
    if-lez p3, :cond_0

    .line 572
    iget-object v3, p0, Lorg/apache/tools/zip/ZipOutputStream;->def:Ljava/util/zip/Deflater;

    invoke-virtual {v3}, Ljava/util/zip/Deflater;->finished()Z

    move-result v3

    if-nez v3, :cond_0

    .line 573
    if-gt p3, v5, :cond_1

    .line 574
    iget-object v3, p0, Lorg/apache/tools/zip/ZipOutputStream;->def:Ljava/util/zip/Deflater;

    invoke-virtual {v3, p1, p2, p3}, Ljava/util/zip/Deflater;->setInput([BII)V

    .line 575
    invoke-direct {p0}, Lorg/apache/tools/zip/ZipOutputStream;->deflateUntilInputIsNeeded()V

    .line 595
    :cond_0
    :goto_0
    iget-object v3, p0, Lorg/apache/tools/zip/ZipOutputStream;->crc:Ljava/util/zip/CRC32;

    invoke-virtual {v3, p1, p2, p3}, Ljava/util/zip/CRC32;->update([BII)V

    .line 596
    return-void

    .line 577
    :cond_1
    div-int/lit16 v1, p3, 0x2000

    .line 578
    .local v1, "fullblocks":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    if-ge v2, v1, :cond_2

    .line 579
    iget-object v3, p0, Lorg/apache/tools/zip/ZipOutputStream;->def:Ljava/util/zip/Deflater;

    mul-int/lit16 v4, v2, 0x2000

    add-int/2addr v4, p2

    invoke-virtual {v3, p1, v4, v5}, Ljava/util/zip/Deflater;->setInput([BII)V

    .line 581
    invoke-direct {p0}, Lorg/apache/tools/zip/ZipOutputStream;->deflateUntilInputIsNeeded()V

    .line 578
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 583
    :cond_2
    mul-int/lit16 v0, v1, 0x2000

    .line 584
    .local v0, "done":I
    if-ge v0, p3, :cond_0

    .line 585
    iget-object v3, p0, Lorg/apache/tools/zip/ZipOutputStream;->def:Ljava/util/zip/Deflater;

    add-int v4, p2, v0

    sub-int v5, p3, v0

    invoke-virtual {v3, p1, v4, v5}, Ljava/util/zip/Deflater;->setInput([BII)V

    .line 586
    invoke-direct {p0}, Lorg/apache/tools/zip/ZipOutputStream;->deflateUntilInputIsNeeded()V

    goto :goto_0

    .line 592
    .end local v0    # "done":I
    .end local v1    # "fullblocks":I
    .end local v2    # "i":I
    :cond_3
    invoke-virtual {p0, p1, p2, p3}, Lorg/apache/tools/zip/ZipOutputStream;->writeOut([BII)V

    .line 593
    iget-wide v4, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    int-to-long v6, p3

    add-long/2addr v4, v6

    iput-wide v4, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    goto :goto_0
.end method

.method protected writeCentralDirectoryEnd()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 917
    sget-object v2, Lorg/apache/tools/zip/ZipOutputStream;->EOCD_SIG:[B

    invoke-virtual {p0, v2}, Lorg/apache/tools/zip/ZipOutputStream;->writeOut([B)V

    .line 920
    sget-object v2, Lorg/apache/tools/zip/ZipOutputStream;->ZERO:[B

    invoke-virtual {p0, v2}, Lorg/apache/tools/zip/ZipOutputStream;->writeOut([B)V

    .line 921
    sget-object v2, Lorg/apache/tools/zip/ZipOutputStream;->ZERO:[B

    invoke-virtual {p0, v2}, Lorg/apache/tools/zip/ZipOutputStream;->writeOut([B)V

    .line 924
    iget-object v2, p0, Lorg/apache/tools/zip/ZipOutputStream;->entries:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    invoke-static {v2}, Lorg/apache/tools/zip/ZipShort;->getBytes(I)[B

    move-result-object v1

    .line 925
    .local v1, "num":[B
    invoke-virtual {p0, v1}, Lorg/apache/tools/zip/ZipOutputStream;->writeOut([B)V

    .line 926
    invoke-virtual {p0, v1}, Lorg/apache/tools/zip/ZipOutputStream;->writeOut([B)V

    .line 929
    iget-wide v2, p0, Lorg/apache/tools/zip/ZipOutputStream;->cdLength:J

    invoke-static {v2, v3}, Lorg/apache/tools/zip/ZipLong;->getBytes(J)[B

    move-result-object v2

    invoke-virtual {p0, v2}, Lorg/apache/tools/zip/ZipOutputStream;->writeOut([B)V

    .line 930
    iget-wide v2, p0, Lorg/apache/tools/zip/ZipOutputStream;->cdOffset:J

    invoke-static {v2, v3}, Lorg/apache/tools/zip/ZipLong;->getBytes(J)[B

    move-result-object v2

    invoke-virtual {p0, v2}, Lorg/apache/tools/zip/ZipOutputStream;->writeOut([B)V

    .line 933
    iget-object v2, p0, Lorg/apache/tools/zip/ZipOutputStream;->zipEncoding:Lorg/apache/tools/zip/ZipEncoding;

    iget-object v3, p0, Lorg/apache/tools/zip/ZipOutputStream;->comment:Ljava/lang/String;

    invoke-interface {v2, v3}, Lorg/apache/tools/zip/ZipEncoding;->encode(Ljava/lang/String;)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 934
    .local v0, "data":Ljava/nio/ByteBuffer;
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->limit()I

    move-result v2

    invoke-static {v2}, Lorg/apache/tools/zip/ZipShort;->getBytes(I)[B

    move-result-object v2

    invoke-virtual {p0, v2}, Lorg/apache/tools/zip/ZipOutputStream;->writeOut([B)V

    .line 935
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v2

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->arrayOffset()I

    move-result v3

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->limit()I

    move-result v4

    invoke-virtual {p0, v2, v3, v4}, Lorg/apache/tools/zip/ZipOutputStream;->writeOut([BII)V

    .line 936
    return-void
.end method

.method protected writeCentralFileHeader(Lorg/apache/tools/zip/ZipEntry;)V
    .locals 12
    .param p1, "ze"    # Lorg/apache/tools/zip/ZipEntry;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 818
    sget-object v7, Lorg/apache/tools/zip/ZipOutputStream;->CFH_SIG:[B

    invoke-virtual {p0, v7}, Lorg/apache/tools/zip/ZipOutputStream;->writeOut([B)V

    .line 819
    iget-wide v8, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    const-wide/16 v10, 0x4

    add-long/2addr v8, v10

    iput-wide v8, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    .line 823
    invoke-virtual {p1}, Lorg/apache/tools/zip/ZipEntry;->getPlatform()I

    move-result v7

    shl-int/lit8 v7, v7, 0x8

    or-int/lit8 v7, v7, 0x14

    invoke-static {v7}, Lorg/apache/tools/zip/ZipShort;->getBytes(I)[B

    move-result-object v7

    invoke-virtual {p0, v7}, Lorg/apache/tools/zip/ZipOutputStream;->writeOut([B)V

    .line 824
    iget-wide v8, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    const-wide/16 v10, 0x2

    add-long/2addr v8, v10

    iput-wide v8, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    .line 826
    invoke-virtual {p1}, Lorg/apache/tools/zip/ZipEntry;->getMethod()I

    move-result v6

    .line 827
    .local v6, "zipMethod":I
    iget-object v7, p0, Lorg/apache/tools/zip/ZipOutputStream;->zipEncoding:Lorg/apache/tools/zip/ZipEncoding;

    invoke-virtual {p1}, Lorg/apache/tools/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v7, v8}, Lorg/apache/tools/zip/ZipEncoding;->canEncode(Ljava/lang/String;)Z

    move-result v2

    .line 828
    .local v2, "encodable":Z
    if-nez v2, :cond_1

    iget-boolean v7, p0, Lorg/apache/tools/zip/ZipOutputStream;->fallbackToUTF8:Z

    if-eqz v7, :cond_1

    const/4 v7, 0x1

    :goto_0
    invoke-direct {p0, v6, v7}, Lorg/apache/tools/zip/ZipOutputStream;->writeVersionNeededToExtractAndGeneralPurposeBits(IZ)V

    .line 831
    iget-wide v8, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    const-wide/16 v10, 0x4

    add-long/2addr v8, v10

    iput-wide v8, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    .line 834
    invoke-static {v6}, Lorg/apache/tools/zip/ZipShort;->getBytes(I)[B

    move-result-object v7

    invoke-virtual {p0, v7}, Lorg/apache/tools/zip/ZipOutputStream;->writeOut([B)V

    .line 835
    iget-wide v8, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    const-wide/16 v10, 0x2

    add-long/2addr v8, v10

    iput-wide v8, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    .line 838
    invoke-virtual {p1}, Lorg/apache/tools/zip/ZipEntry;->getTime()J

    move-result-wide v8

    invoke-static {v8, v9}, Lorg/apache/tools/zip/ZipOutputStream;->toDosTime(J)[B

    move-result-object v7

    invoke-virtual {p0, v7}, Lorg/apache/tools/zip/ZipOutputStream;->writeOut([B)V

    .line 839
    iget-wide v8, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    const-wide/16 v10, 0x4

    add-long/2addr v8, v10

    iput-wide v8, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    .line 844
    invoke-virtual {p1}, Lorg/apache/tools/zip/ZipEntry;->getCrc()J

    move-result-wide v8

    invoke-static {v8, v9}, Lorg/apache/tools/zip/ZipLong;->getBytes(J)[B

    move-result-object v7

    invoke-virtual {p0, v7}, Lorg/apache/tools/zip/ZipOutputStream;->writeOut([B)V

    .line 845
    invoke-virtual {p1}, Lorg/apache/tools/zip/ZipEntry;->getCompressedSize()J

    move-result-wide v8

    invoke-static {v8, v9}, Lorg/apache/tools/zip/ZipLong;->getBytes(J)[B

    move-result-object v7

    invoke-virtual {p0, v7}, Lorg/apache/tools/zip/ZipOutputStream;->writeOut([B)V

    .line 846
    invoke-virtual {p1}, Lorg/apache/tools/zip/ZipEntry;->getSize()J

    move-result-wide v8

    invoke-static {v8, v9}, Lorg/apache/tools/zip/ZipLong;->getBytes(J)[B

    move-result-object v7

    invoke-virtual {p0, v7}, Lorg/apache/tools/zip/ZipOutputStream;->writeOut([B)V

    .line 848
    iget-wide v8, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    const-wide/16 v10, 0xc

    add-long/2addr v8, v10

    iput-wide v8, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    .line 854
    if-nez v2, :cond_2

    iget-boolean v7, p0, Lorg/apache/tools/zip/ZipOutputStream;->fallbackToUTF8:Z

    if-eqz v7, :cond_2

    .line 855
    sget-object v3, Lorg/apache/tools/zip/ZipEncodingHelper;->UTF8_ZIP_ENCODING:Lorg/apache/tools/zip/ZipEncoding;

    .line 860
    .local v3, "entryEncoding":Lorg/apache/tools/zip/ZipEncoding;
    :goto_1
    invoke-virtual {p1}, Lorg/apache/tools/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v3, v7}, Lorg/apache/tools/zip/ZipEncoding;->encode(Ljava/lang/String;)Ljava/nio/ByteBuffer;

    move-result-object v5

    .line 862
    .local v5, "name":Ljava/nio/ByteBuffer;
    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->limit()I

    move-result v7

    invoke-static {v7}, Lorg/apache/tools/zip/ZipShort;->getBytes(I)[B

    move-result-object v7

    invoke-virtual {p0, v7}, Lorg/apache/tools/zip/ZipOutputStream;->writeOut([B)V

    .line 863
    iget-wide v8, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    const-wide/16 v10, 0x2

    add-long/2addr v8, v10

    iput-wide v8, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    .line 866
    invoke-virtual {p1}, Lorg/apache/tools/zip/ZipEntry;->getCentralDirectoryExtra()[B

    move-result-object v4

    .line 867
    .local v4, "extra":[B
    array-length v7, v4

    invoke-static {v7}, Lorg/apache/tools/zip/ZipShort;->getBytes(I)[B

    move-result-object v7

    invoke-virtual {p0, v7}, Lorg/apache/tools/zip/ZipOutputStream;->writeOut([B)V

    .line 868
    iget-wide v8, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    const-wide/16 v10, 0x2

    add-long/2addr v8, v10

    iput-wide v8, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    .line 871
    invoke-virtual {p1}, Lorg/apache/tools/zip/ZipEntry;->getComment()Ljava/lang/String;

    move-result-object v0

    .line 872
    .local v0, "comm":Ljava/lang/String;
    if-nez v0, :cond_0

    .line 873
    const-string/jumbo v0, ""

    .line 876
    :cond_0
    invoke-interface {v3, v0}, Lorg/apache/tools/zip/ZipEncoding;->encode(Ljava/lang/String;)Ljava/nio/ByteBuffer;

    move-result-object v1

    .line 878
    .local v1, "commentB":Ljava/nio/ByteBuffer;
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->limit()I

    move-result v7

    invoke-static {v7}, Lorg/apache/tools/zip/ZipShort;->getBytes(I)[B

    move-result-object v7

    invoke-virtual {p0, v7}, Lorg/apache/tools/zip/ZipOutputStream;->writeOut([B)V

    .line 879
    iget-wide v8, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    const-wide/16 v10, 0x2

    add-long/2addr v8, v10

    iput-wide v8, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    .line 882
    sget-object v7, Lorg/apache/tools/zip/ZipOutputStream;->ZERO:[B

    invoke-virtual {p0, v7}, Lorg/apache/tools/zip/ZipOutputStream;->writeOut([B)V

    .line 883
    iget-wide v8, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    const-wide/16 v10, 0x2

    add-long/2addr v8, v10

    iput-wide v8, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    .line 886
    invoke-virtual {p1}, Lorg/apache/tools/zip/ZipEntry;->getInternalAttributes()I

    move-result v7

    invoke-static {v7}, Lorg/apache/tools/zip/ZipShort;->getBytes(I)[B

    move-result-object v7

    invoke-virtual {p0, v7}, Lorg/apache/tools/zip/ZipOutputStream;->writeOut([B)V

    .line 887
    iget-wide v8, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    const-wide/16 v10, 0x2

    add-long/2addr v8, v10

    iput-wide v8, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    .line 890
    invoke-virtual {p1}, Lorg/apache/tools/zip/ZipEntry;->getExternalAttributes()J

    move-result-wide v8

    invoke-static {v8, v9}, Lorg/apache/tools/zip/ZipLong;->getBytes(J)[B

    move-result-object v7

    invoke-virtual {p0, v7}, Lorg/apache/tools/zip/ZipOutputStream;->writeOut([B)V

    .line 891
    iget-wide v8, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    const-wide/16 v10, 0x4

    add-long/2addr v8, v10

    iput-wide v8, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    .line 894
    iget-object v7, p0, Lorg/apache/tools/zip/ZipOutputStream;->offsets:Ljava/util/Map;

    invoke-interface {v7, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, [B

    invoke-virtual {p0, v7}, Lorg/apache/tools/zip/ZipOutputStream;->writeOut([B)V

    .line 895
    iget-wide v8, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    const-wide/16 v10, 0x4

    add-long/2addr v8, v10

    iput-wide v8, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    .line 898
    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v7

    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->arrayOffset()I

    move-result v8

    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->limit()I

    move-result v9

    invoke-virtual {p0, v7, v8, v9}, Lorg/apache/tools/zip/ZipOutputStream;->writeOut([BII)V

    .line 899
    iget-wide v8, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->limit()I

    move-result v7

    int-to-long v10, v7

    add-long/2addr v8, v10

    iput-wide v8, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    .line 902
    invoke-virtual {p0, v4}, Lorg/apache/tools/zip/ZipOutputStream;->writeOut([B)V

    .line 903
    iget-wide v8, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    array-length v7, v4

    int-to-long v10, v7

    add-long/2addr v8, v10

    iput-wide v8, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    .line 906
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v7

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->arrayOffset()I

    move-result v8

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->limit()I

    move-result v9

    invoke-virtual {p0, v7, v8, v9}, Lorg/apache/tools/zip/ZipOutputStream;->writeOut([BII)V

    .line 907
    iget-wide v8, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->limit()I

    move-result v7

    int-to-long v10, v7

    add-long/2addr v8, v10

    iput-wide v8, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    .line 908
    return-void

    .line 828
    .end local v0    # "comm":Ljava/lang/String;
    .end local v1    # "commentB":Ljava/nio/ByteBuffer;
    .end local v3    # "entryEncoding":Lorg/apache/tools/zip/ZipEncoding;
    .end local v4    # "extra":[B
    .end local v5    # "name":Ljava/nio/ByteBuffer;
    :cond_1
    const/4 v7, 0x0

    goto/16 :goto_0

    .line 857
    :cond_2
    iget-object v3, p0, Lorg/apache/tools/zip/ZipOutputStream;->zipEncoding:Lorg/apache/tools/zip/ZipEncoding;

    .restart local v3    # "entryEncoding":Lorg/apache/tools/zip/ZipEncoding;
    goto/16 :goto_1
.end method

.method protected writeDataDescriptor(Lorg/apache/tools/zip/ZipEntry;)V
    .locals 4
    .param p1, "ze"    # Lorg/apache/tools/zip/ZipEntry;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 798
    invoke-virtual {p1}, Lorg/apache/tools/zip/ZipEntry;->getMethod()I

    move-result v0

    const/16 v1, 0x8

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->raf:Ljava/io/RandomAccessFile;

    if-eqz v0, :cond_1

    .line 808
    :cond_0
    :goto_0
    return-void

    .line 801
    :cond_1
    sget-object v0, Lorg/apache/tools/zip/ZipOutputStream;->DD_SIG:[B

    invoke-virtual {p0, v0}, Lorg/apache/tools/zip/ZipOutputStream;->writeOut([B)V

    .line 802
    iget-object v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->entry:Lorg/apache/tools/zip/ZipEntry;

    invoke-virtual {v0}, Lorg/apache/tools/zip/ZipEntry;->getCrc()J

    move-result-wide v0

    invoke-static {v0, v1}, Lorg/apache/tools/zip/ZipLong;->getBytes(J)[B

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/zip/ZipOutputStream;->writeOut([B)V

    .line 803
    iget-object v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->entry:Lorg/apache/tools/zip/ZipEntry;

    invoke-virtual {v0}, Lorg/apache/tools/zip/ZipEntry;->getCompressedSize()J

    move-result-wide v0

    invoke-static {v0, v1}, Lorg/apache/tools/zip/ZipLong;->getBytes(J)[B

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/zip/ZipOutputStream;->writeOut([B)V

    .line 804
    iget-object v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->entry:Lorg/apache/tools/zip/ZipEntry;

    invoke-virtual {v0}, Lorg/apache/tools/zip/ZipEntry;->getSize()J

    move-result-wide v0

    invoke-static {v0, v1}, Lorg/apache/tools/zip/ZipLong;->getBytes(J)[B

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/zip/ZipOutputStream;->writeOut([B)V

    .line 806
    iget-wide v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    const-wide/16 v2, 0x10

    add-long/2addr v0, v2

    iput-wide v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    goto :goto_0
.end method

.method protected writeLocalFileHeader(Lorg/apache/tools/zip/ZipEntry;)V
    .locals 13
    .param p1, "ze"    # Lorg/apache/tools/zip/ZipEntry;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 693
    iget-object v8, p0, Lorg/apache/tools/zip/ZipOutputStream;->zipEncoding:Lorg/apache/tools/zip/ZipEncoding;

    invoke-virtual {p1}, Lorg/apache/tools/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-interface {v8, v9}, Lorg/apache/tools/zip/ZipEncoding;->canEncode(Ljava/lang/String;)Z

    move-result v3

    .line 697
    .local v3, "encodable":Z
    if-nez v3, :cond_5

    iget-boolean v8, p0, Lorg/apache/tools/zip/ZipOutputStream;->fallbackToUTF8:Z

    if-eqz v8, :cond_5

    .line 698
    sget-object v4, Lorg/apache/tools/zip/ZipEncodingHelper;->UTF8_ZIP_ENCODING:Lorg/apache/tools/zip/ZipEncoding;

    .line 703
    .local v4, "entryEncoding":Lorg/apache/tools/zip/ZipEncoding;
    :goto_0
    invoke-virtual {p1}, Lorg/apache/tools/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v4, v8}, Lorg/apache/tools/zip/ZipEncoding;->encode(Ljava/lang/String;)Ljava/nio/ByteBuffer;

    move-result-object v6

    .line 705
    .local v6, "name":Ljava/nio/ByteBuffer;
    iget-object v8, p0, Lorg/apache/tools/zip/ZipOutputStream;->createUnicodeExtraFields:Lorg/apache/tools/zip/ZipOutputStream$UnicodeExtraFieldPolicy;

    sget-object v9, Lorg/apache/tools/zip/ZipOutputStream$UnicodeExtraFieldPolicy;->NEVER:Lorg/apache/tools/zip/ZipOutputStream$UnicodeExtraFieldPolicy;

    if-eq v8, v9, :cond_3

    .line 707
    iget-object v8, p0, Lorg/apache/tools/zip/ZipOutputStream;->createUnicodeExtraFields:Lorg/apache/tools/zip/ZipOutputStream$UnicodeExtraFieldPolicy;

    sget-object v9, Lorg/apache/tools/zip/ZipOutputStream$UnicodeExtraFieldPolicy;->ALWAYS:Lorg/apache/tools/zip/ZipOutputStream$UnicodeExtraFieldPolicy;

    if-eq v8, v9, :cond_0

    if-nez v3, :cond_1

    .line 709
    :cond_0
    new-instance v8, Lorg/apache/tools/zip/UnicodePathExtraField;

    invoke-virtual {p1}, Lorg/apache/tools/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v6}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v10

    invoke-virtual {v6}, Ljava/nio/ByteBuffer;->arrayOffset()I

    move-result v11

    invoke-virtual {v6}, Ljava/nio/ByteBuffer;->limit()I

    move-result v12

    invoke-direct {v8, v9, v10, v11, v12}, Lorg/apache/tools/zip/UnicodePathExtraField;-><init>(Ljava/lang/String;[BII)V

    invoke-virtual {p1, v8}, Lorg/apache/tools/zip/ZipEntry;->addExtraField(Lorg/apache/tools/zip/ZipExtraField;)V

    .line 715
    :cond_1
    invoke-virtual {p1}, Lorg/apache/tools/zip/ZipEntry;->getComment()Ljava/lang/String;

    move-result-object v0

    .line 716
    .local v0, "comm":Ljava/lang/String;
    if-eqz v0, :cond_3

    const-string/jumbo v8, ""

    invoke-virtual {v8, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_3

    .line 718
    iget-object v8, p0, Lorg/apache/tools/zip/ZipOutputStream;->zipEncoding:Lorg/apache/tools/zip/ZipEncoding;

    invoke-interface {v8, v0}, Lorg/apache/tools/zip/ZipEncoding;->canEncode(Ljava/lang/String;)Z

    move-result v2

    .line 720
    .local v2, "commentEncodable":Z
    iget-object v8, p0, Lorg/apache/tools/zip/ZipOutputStream;->createUnicodeExtraFields:Lorg/apache/tools/zip/ZipOutputStream$UnicodeExtraFieldPolicy;

    sget-object v9, Lorg/apache/tools/zip/ZipOutputStream$UnicodeExtraFieldPolicy;->ALWAYS:Lorg/apache/tools/zip/ZipOutputStream$UnicodeExtraFieldPolicy;

    if-eq v8, v9, :cond_2

    if-nez v2, :cond_3

    .line 722
    :cond_2
    invoke-interface {v4, v0}, Lorg/apache/tools/zip/ZipEncoding;->encode(Ljava/lang/String;)Ljava/nio/ByteBuffer;

    move-result-object v1

    .line 723
    .local v1, "commentB":Ljava/nio/ByteBuffer;
    new-instance v8, Lorg/apache/tools/zip/UnicodeCommentExtraField;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v9

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->arrayOffset()I

    move-result v10

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->limit()I

    move-result v11

    invoke-direct {v8, v0, v9, v10, v11}, Lorg/apache/tools/zip/UnicodeCommentExtraField;-><init>(Ljava/lang/String;[BII)V

    invoke-virtual {p1, v8}, Lorg/apache/tools/zip/ZipEntry;->addExtraField(Lorg/apache/tools/zip/ZipExtraField;)V

    .line 732
    .end local v0    # "comm":Ljava/lang/String;
    .end local v1    # "commentB":Ljava/nio/ByteBuffer;
    .end local v2    # "commentEncodable":Z
    :cond_3
    iget-object v8, p0, Lorg/apache/tools/zip/ZipOutputStream;->offsets:Ljava/util/Map;

    iget-wide v10, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    invoke-static {v10, v11}, Lorg/apache/tools/zip/ZipLong;->getBytes(J)[B

    move-result-object v9

    invoke-interface {v8, p1, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 734
    sget-object v8, Lorg/apache/tools/zip/ZipOutputStream;->LFH_SIG:[B

    invoke-virtual {p0, v8}, Lorg/apache/tools/zip/ZipOutputStream;->writeOut([B)V

    .line 735
    iget-wide v8, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    const-wide/16 v10, 0x4

    add-long/2addr v8, v10

    iput-wide v8, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    .line 738
    invoke-virtual {p1}, Lorg/apache/tools/zip/ZipEntry;->getMethod()I

    move-result v7

    .line 740
    .local v7, "zipMethod":I
    if-nez v3, :cond_6

    iget-boolean v8, p0, Lorg/apache/tools/zip/ZipOutputStream;->fallbackToUTF8:Z

    if-eqz v8, :cond_6

    const/4 v8, 0x1

    :goto_1
    invoke-direct {p0, v7, v8}, Lorg/apache/tools/zip/ZipOutputStream;->writeVersionNeededToExtractAndGeneralPurposeBits(IZ)V

    .line 743
    iget-wide v8, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    const-wide/16 v10, 0x4

    add-long/2addr v8, v10

    iput-wide v8, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    .line 746
    invoke-static {v7}, Lorg/apache/tools/zip/ZipShort;->getBytes(I)[B

    move-result-object v8

    invoke-virtual {p0, v8}, Lorg/apache/tools/zip/ZipOutputStream;->writeOut([B)V

    .line 747
    iget-wide v8, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    const-wide/16 v10, 0x2

    add-long/2addr v8, v10

    iput-wide v8, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    .line 750
    invoke-virtual {p1}, Lorg/apache/tools/zip/ZipEntry;->getTime()J

    move-result-wide v8

    invoke-static {v8, v9}, Lorg/apache/tools/zip/ZipOutputStream;->toDosTime(J)[B

    move-result-object v8

    invoke-virtual {p0, v8}, Lorg/apache/tools/zip/ZipOutputStream;->writeOut([B)V

    .line 751
    iget-wide v8, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    const-wide/16 v10, 0x4

    add-long/2addr v8, v10

    iput-wide v8, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    .line 756
    iget-wide v8, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    iput-wide v8, p0, Lorg/apache/tools/zip/ZipOutputStream;->localDataStart:J

    .line 757
    const/16 v8, 0x8

    if-eq v7, v8, :cond_4

    iget-object v8, p0, Lorg/apache/tools/zip/ZipOutputStream;->raf:Ljava/io/RandomAccessFile;

    if-eqz v8, :cond_7

    .line 758
    :cond_4
    sget-object v8, Lorg/apache/tools/zip/ZipOutputStream;->LZERO:[B

    invoke-virtual {p0, v8}, Lorg/apache/tools/zip/ZipOutputStream;->writeOut([B)V

    .line 759
    sget-object v8, Lorg/apache/tools/zip/ZipOutputStream;->LZERO:[B

    invoke-virtual {p0, v8}, Lorg/apache/tools/zip/ZipOutputStream;->writeOut([B)V

    .line 760
    sget-object v8, Lorg/apache/tools/zip/ZipOutputStream;->LZERO:[B

    invoke-virtual {p0, v8}, Lorg/apache/tools/zip/ZipOutputStream;->writeOut([B)V

    .line 767
    :goto_2
    iget-wide v8, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    const-wide/16 v10, 0xc

    add-long/2addr v8, v10

    iput-wide v8, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    .line 771
    invoke-virtual {v6}, Ljava/nio/ByteBuffer;->limit()I

    move-result v8

    invoke-static {v8}, Lorg/apache/tools/zip/ZipShort;->getBytes(I)[B

    move-result-object v8

    invoke-virtual {p0, v8}, Lorg/apache/tools/zip/ZipOutputStream;->writeOut([B)V

    .line 772
    iget-wide v8, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    const-wide/16 v10, 0x2

    add-long/2addr v8, v10

    iput-wide v8, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    .line 775
    invoke-virtual {p1}, Lorg/apache/tools/zip/ZipEntry;->getLocalFileDataExtra()[B

    move-result-object v5

    .line 776
    .local v5, "extra":[B
    array-length v8, v5

    invoke-static {v8}, Lorg/apache/tools/zip/ZipShort;->getBytes(I)[B

    move-result-object v8

    invoke-virtual {p0, v8}, Lorg/apache/tools/zip/ZipOutputStream;->writeOut([B)V

    .line 777
    iget-wide v8, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    const-wide/16 v10, 0x2

    add-long/2addr v8, v10

    iput-wide v8, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    .line 780
    invoke-virtual {v6}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v8

    invoke-virtual {v6}, Ljava/nio/ByteBuffer;->arrayOffset()I

    move-result v9

    invoke-virtual {v6}, Ljava/nio/ByteBuffer;->limit()I

    move-result v10

    invoke-virtual {p0, v8, v9, v10}, Lorg/apache/tools/zip/ZipOutputStream;->writeOut([BII)V

    .line 781
    iget-wide v8, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    invoke-virtual {v6}, Ljava/nio/ByteBuffer;->limit()I

    move-result v10

    int-to-long v10, v10

    add-long/2addr v8, v10

    iput-wide v8, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    .line 784
    invoke-virtual {p0, v5}, Lorg/apache/tools/zip/ZipOutputStream;->writeOut([B)V

    .line 785
    iget-wide v8, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    array-length v10, v5

    int-to-long v10, v10

    add-long/2addr v8, v10

    iput-wide v8, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    .line 787
    iget-wide v8, p0, Lorg/apache/tools/zip/ZipOutputStream;->written:J

    iput-wide v8, p0, Lorg/apache/tools/zip/ZipOutputStream;->dataStart:J

    .line 788
    return-void

    .line 700
    .end local v4    # "entryEncoding":Lorg/apache/tools/zip/ZipEncoding;
    .end local v5    # "extra":[B
    .end local v6    # "name":Ljava/nio/ByteBuffer;
    .end local v7    # "zipMethod":I
    :cond_5
    iget-object v4, p0, Lorg/apache/tools/zip/ZipOutputStream;->zipEncoding:Lorg/apache/tools/zip/ZipEncoding;

    .restart local v4    # "entryEncoding":Lorg/apache/tools/zip/ZipEncoding;
    goto/16 :goto_0

    .line 740
    .restart local v6    # "name":Ljava/nio/ByteBuffer;
    .restart local v7    # "zipMethod":I
    :cond_6
    const/4 v8, 0x0

    goto/16 :goto_1

    .line 762
    :cond_7
    invoke-virtual {p1}, Lorg/apache/tools/zip/ZipEntry;->getCrc()J

    move-result-wide v8

    invoke-static {v8, v9}, Lorg/apache/tools/zip/ZipLong;->getBytes(J)[B

    move-result-object v8

    invoke-virtual {p0, v8}, Lorg/apache/tools/zip/ZipOutputStream;->writeOut([B)V

    .line 763
    invoke-virtual {p1}, Lorg/apache/tools/zip/ZipEntry;->getSize()J

    move-result-wide v8

    invoke-static {v8, v9}, Lorg/apache/tools/zip/ZipLong;->getBytes(J)[B

    move-result-object v8

    invoke-virtual {p0, v8}, Lorg/apache/tools/zip/ZipOutputStream;->writeOut([B)V

    .line 764
    invoke-virtual {p1}, Lorg/apache/tools/zip/ZipEntry;->getSize()J

    move-result-wide v8

    invoke-static {v8, v9}, Lorg/apache/tools/zip/ZipLong;->getBytes(J)[B

    move-result-object v8

    invoke-virtual {p0, v8}, Lorg/apache/tools/zip/ZipOutputStream;->writeOut([B)V

    goto :goto_2
.end method

.method protected final writeOut([B)V
    .locals 2
    .param p1, "data"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1012
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lorg/apache/tools/zip/ZipOutputStream;->writeOut([BII)V

    .line 1013
    return-void
.end method

.method protected final writeOut([BII)V
    .locals 1
    .param p1, "data"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1026
    iget-object v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->raf:Ljava/io/RandomAccessFile;

    if-eqz v0, :cond_0

    .line 1027
    iget-object v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->raf:Ljava/io/RandomAccessFile;

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/RandomAccessFile;->write([BII)V

    .line 1031
    :goto_0
    return-void

    .line 1029
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/zip/ZipOutputStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/OutputStream;->write([BII)V

    goto :goto_0
.end method
