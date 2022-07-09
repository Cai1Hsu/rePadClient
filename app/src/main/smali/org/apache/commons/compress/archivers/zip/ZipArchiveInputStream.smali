.class public Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;
.super Lorg/apache/commons/compress/archivers/ArchiveInputStream;
.source "ZipArchiveInputStream.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$1;,
        Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;,
        Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;
    }
.end annotation


# static fields
.field private static final CFH:[B

.field private static final DD:[B

.field private static final LFH:[B

.field private static final LFH_LEN:I = 0x1e

.field private static final TWO_EXP_32:J = 0x100000000L


# instance fields
.field private allowStoredEntriesWithDataDescriptor:Z

.field private final buf:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;

.field private closed:Z

.field private final crc:Ljava/util/zip/CRC32;

.field private current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

.field private hitCentralDirectory:Z

.field private final in:Ljava/io/InputStream;

.field private final inf:Ljava/util/zip/Inflater;

.field private lastStoredEntry:Ljava/io/ByteArrayInputStream;

.field private final useUnicodeExtraFields:Z

.field private final zipEncoding:Lorg/apache/commons/compress/archivers/zip/ZipEncoding;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 691
    sget-object v0, Lorg/apache/commons/compress/archivers/zip/ZipLong;->LFH_SIG:Lorg/apache/commons/compress/archivers/zip/ZipLong;

    invoke-virtual {v0}, Lorg/apache/commons/compress/archivers/zip/ZipLong;->getBytes()[B

    move-result-object v0

    sput-object v0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->LFH:[B

    .line 692
    sget-object v0, Lorg/apache/commons/compress/archivers/zip/ZipLong;->CFH_SIG:Lorg/apache/commons/compress/archivers/zip/ZipLong;

    invoke-virtual {v0}, Lorg/apache/commons/compress/archivers/zip/ZipLong;->getBytes()[B

    move-result-object v0

    sput-object v0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->CFH:[B

    .line 693
    sget-object v0, Lorg/apache/commons/compress/archivers/zip/ZipLong;->DD_SIG:Lorg/apache/commons/compress/archivers/zip/ZipLong;

    invoke-virtual {v0}, Lorg/apache/commons/compress/archivers/zip/ZipLong;->getBytes()[B

    move-result-object v0

    sput-object v0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->DD:[B

    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;)V
    .locals 2
    .param p1, "inputStream"    # Ljava/io/InputStream;

    .prologue
    .line 132
    const-string/jumbo v0, "UTF8"

    const/4 v1, 0x1

    invoke-direct {p0, p1, v0, v1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;-><init>(Ljava/io/InputStream;Ljava/lang/String;Z)V

    .line 133
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;Ljava/lang/String;Z)V
    .locals 1
    .param p1, "inputStream"    # Ljava/io/InputStream;
    .param p2, "encoding"    # Ljava/lang/String;
    .param p3, "useUnicodeExtraFields"    # Z

    .prologue
    .line 144
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;-><init>(Ljava/io/InputStream;Ljava/lang/String;ZZ)V

    .line 145
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;Ljava/lang/String;ZZ)V
    .locals 4
    .param p1, "inputStream"    # Ljava/io/InputStream;
    .param p2, "encoding"    # Ljava/lang/String;
    .param p3, "useUnicodeExtraFields"    # Z
    .param p4, "allowStoredEntriesWithDataDescriptor"    # Z

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 159
    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/ArchiveInputStream;-><init>()V

    .line 77
    new-instance v0, Ljava/util/zip/Inflater;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/zip/Inflater;-><init>(Z)V

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->inf:Ljava/util/zip/Inflater;

    .line 82
    new-instance v0, Ljava/util/zip/CRC32;

    invoke-direct {v0}, Ljava/util/zip/CRC32;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->crc:Ljava/util/zip/CRC32;

    .line 87
    new-instance v0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;

    invoke-direct {v0, v3}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;-><init>(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$1;)V

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->buf:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;

    .line 91
    iput-object v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    .line 95
    iput-boolean v2, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->closed:Z

    .line 100
    iput-boolean v2, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->hitCentralDirectory:Z

    .line 106
    iput-object v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->lastStoredEntry:Ljava/io/ByteArrayInputStream;

    .line 112
    iput-boolean v2, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->allowStoredEntriesWithDataDescriptor:Z

    .line 160
    invoke-static {p2}, Lorg/apache/commons/compress/archivers/zip/ZipEncodingHelper;->getZipEncoding(Ljava/lang/String;)Lorg/apache/commons/compress/archivers/zip/ZipEncoding;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->zipEncoding:Lorg/apache/commons/compress/archivers/zip/ZipEncoding;

    .line 161
    iput-boolean p3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->useUnicodeExtraFields:Z

    .line 162
    new-instance v0, Ljava/io/PushbackInputStream;

    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->buf:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;

    invoke-static {v1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;->access$100(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;)[B

    move-result-object v1

    array-length v1, v1

    invoke-direct {v0, p1, v1}, Ljava/io/PushbackInputStream;-><init>(Ljava/io/InputStream;I)V

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->in:Ljava/io/InputStream;

    .line 163
    iput-boolean p4, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->allowStoredEntriesWithDataDescriptor:Z

    .line 165
    return-void
.end method

.method private bufferContainsSignature(Ljava/io/ByteArrayOutputStream;III)Z
    .locals 9
    .param p1, "bos"    # Ljava/io/ByteArrayOutputStream;
    .param p2, "offset"    # I
    .param p3, "lastRead"    # I
    .param p4, "expectedDDLen"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x0

    const/4 v7, 0x3

    const/4 v6, 0x2

    .line 707
    const/4 v0, 0x0

    .line 708
    .local v0, "done":Z
    const/4 v2, 0x0

    .line 709
    .local v2, "readTooMuch":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-nez v0, :cond_5

    add-int/lit8 v3, p3, -0x4

    if-ge v1, v3, :cond_5

    .line 710
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->buf:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;

    invoke-static {v3}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;->access$100(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;)[B

    move-result-object v3

    aget-byte v3, v3, v1

    sget-object v4, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->LFH:[B

    aget-byte v4, v4, v8

    if-ne v3, v4, :cond_3

    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->buf:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;

    invoke-static {v3}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;->access$100(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;)[B

    move-result-object v3

    add-int/lit8 v4, v1, 0x1

    aget-byte v3, v3, v4

    sget-object v4, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->LFH:[B

    const/4 v5, 0x1

    aget-byte v4, v4, v5

    if-ne v3, v4, :cond_3

    .line 711
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->buf:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;

    invoke-static {v3}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;->access$100(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;)[B

    move-result-object v3

    add-int/lit8 v4, v1, 0x2

    aget-byte v3, v3, v4

    sget-object v4, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->LFH:[B

    aget-byte v4, v4, v6

    if-ne v3, v4, :cond_0

    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->buf:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;

    invoke-static {v3}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;->access$100(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;)[B

    move-result-object v3

    add-int/lit8 v4, v1, 0x3

    aget-byte v3, v3, v4

    sget-object v4, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->LFH:[B

    aget-byte v4, v4, v7

    if-eq v3, v4, :cond_1

    :cond_0
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->buf:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;

    invoke-static {v3}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;->access$100(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;)[B

    move-result-object v3

    aget-byte v3, v3, v1

    sget-object v4, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->CFH:[B

    aget-byte v4, v4, v6

    if-ne v3, v4, :cond_4

    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->buf:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;

    invoke-static {v3}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;->access$100(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;)[B

    move-result-object v3

    add-int/lit8 v4, v1, 0x3

    aget-byte v3, v3, v4

    sget-object v4, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->CFH:[B

    aget-byte v4, v4, v7

    if-ne v3, v4, :cond_4

    .line 714
    :cond_1
    add-int v3, p2, p3

    sub-int/2addr v3, v1

    sub-int v2, v3, p4

    .line 715
    const/4 v0, 0x1

    .line 722
    :cond_2
    :goto_1
    if-eqz v0, :cond_3

    .line 727
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->buf:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;

    invoke-static {v3}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;->access$100(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;)[B

    move-result-object v3

    add-int v4, p2, p3

    sub-int/2addr v4, v2

    invoke-direct {p0, v3, v4, v2}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->pushback([BII)V

    .line 729
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->buf:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;

    invoke-static {v3}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;->access$100(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;)[B

    move-result-object v3

    invoke-virtual {p1, v3, v8, v1}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    .line 730
    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->readDataDescriptor()V

    .line 709
    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_0

    .line 717
    :cond_4
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->buf:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;

    invoke-static {v3}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;->access$100(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;)[B

    move-result-object v3

    add-int/lit8 v4, v1, 0x2

    aget-byte v3, v3, v4

    sget-object v4, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->DD:[B

    aget-byte v4, v4, v6

    if-ne v3, v4, :cond_2

    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->buf:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;

    invoke-static {v3}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;->access$100(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;)[B

    move-result-object v3

    add-int/lit8 v4, v1, 0x3

    aget-byte v3, v3, v4

    sget-object v4, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->DD:[B

    aget-byte v4, v4, v7

    if-ne v3, v4, :cond_2

    .line 719
    add-int v3, p2, p3

    sub-int v2, v3, v1

    .line 720
    const/4 v0, 0x1

    goto :goto_1

    .line 734
    :cond_5
    return v0
.end method

.method private cacheBytesRead(Ljava/io/ByteArrayOutputStream;III)I
    .locals 5
    .param p1, "bos"    # Ljava/io/ByteArrayOutputStream;
    .param p2, "offset"    # I
    .param p3, "lastRead"    # I
    .param p4, "expecteDDLen"    # I

    .prologue
    const/4 v4, 0x0

    .line 748
    add-int v1, p2, p3

    sub-int/2addr v1, p4

    add-int/lit8 v0, v1, -0x3

    .line 749
    .local v0, "cacheable":I
    if-lez v0, :cond_0

    .line 750
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->buf:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;

    invoke-static {v1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;->access$100(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;)[B

    move-result-object v1

    invoke-virtual {p1, v1, v4, v0}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    .line 751
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->buf:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;

    invoke-static {v1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;->access$100(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;)[B

    move-result-object v1

    iget-object v2, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->buf:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;

    invoke-static {v2}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;->access$100(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;)[B

    move-result-object v2

    add-int/lit8 v3, p4, 0x3

    invoke-static {v1, v0, v2, v4, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 753
    add-int/lit8 p2, p4, 0x3

    .line 757
    :goto_0
    return p2

    .line 755
    :cond_0
    add-int/2addr p2, p3

    goto :goto_0
.end method

.method private static checksig([B[B)Z
    .locals 3
    .param p0, "signature"    # [B
    .param p1, "expected"    # [B

    .prologue
    .line 460
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v1, p1

    if-ge v0, v1, :cond_1

    .line 461
    aget-byte v1, p0, v0

    aget-byte v2, p1, v0

    if-eq v1, v2, :cond_0

    .line 462
    const/4 v1, 0x0

    .line 465
    :goto_1
    return v1

    .line 460
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 465
    :cond_1
    const/4 v1, 0x1

    goto :goto_1
.end method

.method private closeEntry()V
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x0

    .line 487
    iget-boolean v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->closed:Z

    if-eqz v1, :cond_0

    .line 488
    new-instance v1, Ljava/io/IOException;

    const-string/jumbo v4, "The stream is closed"

    invoke-direct {v1, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 490
    :cond_0
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    if-nez v1, :cond_1

    .line 524
    :goto_0
    return-void

    .line 495
    :cond_1
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    invoke-static {v1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$900(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)J

    move-result-wide v4

    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    invoke-static {v1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$300(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v1

    invoke-virtual {v1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getCompressedSize()J

    move-result-wide v6

    cmp-long v1, v4, v6

    if-gtz v1, :cond_4

    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    invoke-static {v1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$400(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Z

    move-result v1

    if-nez v1, :cond_4

    .line 497
    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->drainCurrentEntryData()V

    .line 515
    :cond_2
    :goto_1
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->lastStoredEntry:Ljava/io/ByteArrayInputStream;

    if-nez v1, :cond_3

    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    invoke-static {v1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$400(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 516
    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->readDataDescriptor()V

    .line 519
    :cond_3
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->inf:Ljava/util/zip/Inflater;

    invoke-virtual {v1}, Ljava/util/zip/Inflater;->reset()V

    .line 520
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->buf:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;

    invoke-static {v1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;->access$1000(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;)V

    .line 521
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->crc:Ljava/util/zip/CRC32;

    invoke-virtual {v1}, Ljava/util/zip/CRC32;->reset()V

    .line 522
    iput-object v8, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    .line 523
    iput-object v8, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->lastStoredEntry:Ljava/io/ByteArrayInputStream;

    goto :goto_0

    .line 499
    :cond_4
    const-wide v4, 0x7fffffffffffffffL

    invoke-virtual {p0, v4, v5}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->skip(J)J

    .line 501
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    invoke-static {v1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$300(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v1

    invoke-virtual {v1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getMethod()I

    move-result v1

    const/16 v4, 0x8

    if-ne v1, v4, :cond_5

    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->getBytesInflated()J

    move-result-wide v2

    .line 507
    .local v2, "inB":J
    :goto_2
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    invoke-static {v1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$900(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)J

    move-result-wide v4

    sub-long/2addr v4, v2

    long-to-int v0, v4

    .line 510
    .local v0, "diff":I
    if-lez v0, :cond_2

    .line 511
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->buf:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;

    invoke-static {v1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;->access$100(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;)[B

    move-result-object v1

    iget-object v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->buf:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;

    invoke-static {v4}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;->access$800(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;)I

    move-result v4

    sub-int/2addr v4, v0

    invoke-direct {p0, v1, v4, v0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->pushback([BII)V

    goto :goto_1

    .line 501
    .end local v0    # "diff":I
    .end local v2    # "inB":J
    :cond_5
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    invoke-static {v1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$600(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)J

    move-result-wide v2

    goto :goto_2
.end method

.method private drainCurrentEntryData()V
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/16 v10, 0x0

    .line 531
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    invoke-static {v4}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$300(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v4

    invoke-virtual {v4}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getCompressedSize()J

    move-result-wide v4

    iget-object v6, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    invoke-static {v6}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$900(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)J

    move-result-wide v6

    sub-long v2, v4, v6

    .line 533
    .local v2, "remaining":J
    :goto_0
    cmp-long v4, v2, v10

    if-lez v4, :cond_1

    .line 534
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->in:Ljava/io/InputStream;

    iget-object v5, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->buf:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;

    invoke-static {v5}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;->access$100(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;)[B

    move-result-object v5

    const/4 v6, 0x0

    iget-object v7, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->buf:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;

    invoke-static {v7}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;->access$100(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;)[B

    move-result-object v7

    array-length v7, v7

    int-to-long v8, v7

    invoke-static {v8, v9, v2, v3}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v8

    long-to-int v7, v8

    invoke-virtual {v4, v5, v6, v7}, Ljava/io/InputStream;->read([BII)I

    move-result v4

    int-to-long v0, v4

    .line 536
    .local v0, "n":J
    cmp-long v4, v0, v10

    if-gez v4, :cond_0

    .line 537
    new-instance v4, Ljava/io/EOFException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "Truncated ZIP entry: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    invoke-static {v6}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$300(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v6

    invoke-virtual {v6}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 540
    :cond_0
    invoke-virtual {p0, v0, v1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->count(J)V

    .line 541
    sub-long/2addr v2, v0

    .line 543
    goto :goto_0

    .line 544
    .end local v0    # "n":J
    :cond_1
    return-void
.end method

.method private fill()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 572
    iget-boolean v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->closed:Z

    if-eqz v0, :cond_0

    .line 573
    new-instance v0, Ljava/io/IOException;

    const-string/jumbo v1, "The stream is closed"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 575
    :cond_0
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->buf:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;

    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->in:Ljava/io/InputStream;

    iget-object v2, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->buf:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;

    invoke-static {v2}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;->access$100(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;)[B

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/InputStream;->read([B)I

    move-result v1

    invoke-static {v0, v1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;->access$802(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;I)I

    move-result v0

    if-lez v0, :cond_1

    .line 576
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->buf:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;

    invoke-static {v0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;->access$800(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;)I

    move-result v0

    invoke-virtual {p0, v0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->count(I)V

    .line 577
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->inf:Ljava/util/zip/Inflater;

    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->buf:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;

    invoke-static {v1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;->access$100(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;)[B

    move-result-object v1

    const/4 v2, 0x0

    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->buf:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;

    invoke-static {v3}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;->access$800(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;)I

    move-result v3

    invoke-virtual {v0, v1, v2, v3}, Ljava/util/zip/Inflater;->setInput([BII)V

    .line 579
    :cond_1
    return-void
.end method

.method private getBytesInflated()J
    .locals 8

    .prologue
    const-wide v6, 0x100000000L

    .line 562
    iget-object v2, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->inf:Ljava/util/zip/Inflater;

    invoke-virtual {v2}, Ljava/util/zip/Inflater;->getBytesRead()J

    move-result-wide v0

    .line 563
    .local v0, "inB":J
    iget-object v2, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    invoke-static {v2}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$900(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)J

    move-result-wide v2

    cmp-long v2, v2, v6

    if-ltz v2, :cond_0

    .line 564
    :goto_0
    add-long v2, v0, v6

    iget-object v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    invoke-static {v4}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$900(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)J

    move-result-wide v4

    cmp-long v2, v2, v4

    if-gtz v2, :cond_0

    .line 565
    add-long/2addr v0, v6

    goto :goto_0

    .line 568
    :cond_0
    return-wide v0
.end method

.method public static matches([BI)Z
    .locals 2
    .param p0, "signature"    # [B
    .param p1, "length"    # I

    .prologue
    const/4 v0, 0x0

    .line 451
    sget-object v1, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->LFH_SIG:[B

    array-length v1, v1

    if-ge p1, v1, :cond_1

    .line 455
    :cond_0
    :goto_0
    return v0

    :cond_1
    sget-object v1, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->LFH_SIG:[B

    invoke-static {p0, v1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->checksig([B[B)Z

    move-result v1

    if-nez v1, :cond_2

    sget-object v1, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->EOCD_SIG:[B

    invoke-static {p0, v1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->checksig([B[B)Z

    move-result v1

    if-eqz v1, :cond_0

    :cond_2
    const/4 v0, 0x1

    goto :goto_0
.end method

.method private processZip64Extra(Lorg/apache/commons/compress/archivers/zip/ZipLong;Lorg/apache/commons/compress/archivers/zip/ZipLong;)V
    .locals 4
    .param p1, "size"    # Lorg/apache/commons/compress/archivers/zip/ZipLong;
    .param p2, "cSize"    # Lorg/apache/commons/compress/archivers/zip/ZipLong;

    .prologue
    .line 257
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    invoke-static {v1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$300(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v1

    sget-object v2, Lorg/apache/commons/compress/archivers/zip/Zip64ExtendedInformationExtraField;->HEADER_ID:Lorg/apache/commons/compress/archivers/zip/ZipShort;

    invoke-virtual {v1, v2}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getExtraField(Lorg/apache/commons/compress/archivers/zip/ZipShort;)Lorg/apache/commons/compress/archivers/zip/ZipExtraField;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/compress/archivers/zip/Zip64ExtendedInformationExtraField;

    .line 261
    .local v0, "z64":Lorg/apache/commons/compress/archivers/zip/Zip64ExtendedInformationExtraField;
    iget-object v2, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    if-eqz v0, :cond_2

    const/4 v1, 0x1

    :goto_0
    invoke-static {v2, v1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$502(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;Z)Z

    .line 262
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    invoke-static {v1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$400(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 263
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    invoke-static {v1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$500(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Z

    move-result v1

    if-eqz v1, :cond_3

    sget-object v1, Lorg/apache/commons/compress/archivers/zip/ZipLong;->ZIP64_MAGIC:Lorg/apache/commons/compress/archivers/zip/ZipLong;

    invoke-virtual {p2, v1}, Lorg/apache/commons/compress/archivers/zip/ZipLong;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    sget-object v1, Lorg/apache/commons/compress/archivers/zip/ZipLong;->ZIP64_MAGIC:Lorg/apache/commons/compress/archivers/zip/ZipLong;

    invoke-virtual {p1, v1}, Lorg/apache/commons/compress/archivers/zip/ZipLong;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 266
    :cond_0
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    invoke-static {v1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$300(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v1

    invoke-virtual {v0}, Lorg/apache/commons/compress/archivers/zip/Zip64ExtendedInformationExtraField;->getCompressedSize()Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;

    move-result-object v2

    invoke-virtual {v2}, Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;->getLongValue()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->setCompressedSize(J)V

    .line 268
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    invoke-static {v1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$300(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v1

    invoke-virtual {v0}, Lorg/apache/commons/compress/archivers/zip/Zip64ExtendedInformationExtraField;->getSize()Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;

    move-result-object v2

    invoke-virtual {v2}, Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;->getLongValue()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->setSize(J)V

    .line 274
    :cond_1
    :goto_1
    return-void

    .line 261
    :cond_2
    const/4 v1, 0x0

    goto :goto_0

    .line 270
    :cond_3
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    invoke-static {v1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$300(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v1

    invoke-virtual {p2}, Lorg/apache/commons/compress/archivers/zip/ZipLong;->getValue()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->setCompressedSize(J)V

    .line 271
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    invoke-static {v1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$300(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v1

    invoke-virtual {p1}, Lorg/apache/commons/compress/archivers/zip/ZipLong;->getValue()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->setSize(J)V

    goto :goto_1
.end method

.method private pushback([BII)V
    .locals 2
    .param p1, "buf"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 762
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->in:Ljava/io/InputStream;

    check-cast v0, Ljava/io/PushbackInputStream;

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/PushbackInputStream;->unread([BII)V

    .line 763
    int-to-long v0, p3

    invoke-virtual {p0, v0, v1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->pushedBackBytes(J)V

    .line 764
    return-void
.end method

.method private readDataDescriptor()V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x4

    const/16 v6, 0x8

    .line 593
    new-array v0, v7, [B

    .line 594
    .local v0, "b":[B
    invoke-direct {p0, v0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->readFully([B)V

    .line 595
    new-instance v2, Lorg/apache/commons/compress/archivers/zip/ZipLong;

    invoke-direct {v2, v0}, Lorg/apache/commons/compress/archivers/zip/ZipLong;-><init>([B)V

    .line 596
    .local v2, "val":Lorg/apache/commons/compress/archivers/zip/ZipLong;
    sget-object v3, Lorg/apache/commons/compress/archivers/zip/ZipLong;->DD_SIG:Lorg/apache/commons/compress/archivers/zip/ZipLong;

    invoke-virtual {v3, v2}, Lorg/apache/commons/compress/archivers/zip/ZipLong;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 598
    invoke-direct {p0, v0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->readFully([B)V

    .line 599
    new-instance v2, Lorg/apache/commons/compress/archivers/zip/ZipLong;

    .end local v2    # "val":Lorg/apache/commons/compress/archivers/zip/ZipLong;
    invoke-direct {v2, v0}, Lorg/apache/commons/compress/archivers/zip/ZipLong;-><init>([B)V

    .line 601
    .restart local v2    # "val":Lorg/apache/commons/compress/archivers/zip/ZipLong;
    :cond_0
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    invoke-static {v3}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$300(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v3

    invoke-virtual {v2}, Lorg/apache/commons/compress/archivers/zip/ZipLong;->getValue()J

    move-result-wide v4

    invoke-virtual {v3, v4, v5}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->setCrc(J)V

    .line 614
    const/16 v3, 0x10

    new-array v0, v3, [B

    .line 615
    invoke-direct {p0, v0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->readFully([B)V

    .line 616
    new-instance v1, Lorg/apache/commons/compress/archivers/zip/ZipLong;

    invoke-direct {v1, v0, v6}, Lorg/apache/commons/compress/archivers/zip/ZipLong;-><init>([BI)V

    .line 617
    .local v1, "potentialSig":Lorg/apache/commons/compress/archivers/zip/ZipLong;
    sget-object v3, Lorg/apache/commons/compress/archivers/zip/ZipLong;->CFH_SIG:Lorg/apache/commons/compress/archivers/zip/ZipLong;

    invoke-virtual {v1, v3}, Lorg/apache/commons/compress/archivers/zip/ZipLong;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    sget-object v3, Lorg/apache/commons/compress/archivers/zip/ZipLong;->LFH_SIG:Lorg/apache/commons/compress/archivers/zip/ZipLong;

    invoke-virtual {v1, v3}, Lorg/apache/commons/compress/archivers/zip/ZipLong;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 619
    :cond_1
    invoke-direct {p0, v0, v6, v6}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->pushback([BII)V

    .line 620
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    invoke-static {v3}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$300(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v3

    invoke-static {v0}, Lorg/apache/commons/compress/archivers/zip/ZipLong;->getValue([B)J

    move-result-wide v4

    invoke-virtual {v3, v4, v5}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->setCompressedSize(J)V

    .line 621
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    invoke-static {v3}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$300(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v3

    invoke-static {v0, v7}, Lorg/apache/commons/compress/archivers/zip/ZipLong;->getValue([BI)J

    move-result-wide v4

    invoke-virtual {v3, v4, v5}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->setSize(J)V

    .line 627
    :goto_0
    return-void

    .line 623
    :cond_2
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    invoke-static {v3}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$300(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v3

    invoke-static {v0}, Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;->getLongValue([B)J

    move-result-wide v4

    invoke-virtual {v3, v4, v5}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->setCompressedSize(J)V

    .line 625
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    invoke-static {v3}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$300(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v3

    invoke-static {v0, v6}, Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;->getLongValue([BI)J

    move-result-wide v4

    invoke-virtual {v3, v4, v5}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->setSize(J)V

    goto :goto_0
.end method

.method private readDeflated([BII)I
    .locals 6
    .param p1, "buffer"    # [B
    .param p2, "start"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, -0x1

    .line 374
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->inf:Ljava/util/zip/Inflater;

    invoke-virtual {v3}, Ljava/util/zip/Inflater;->needsInput()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 375
    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->fill()V

    .line 376
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->buf:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;

    invoke-static {v3}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;->access$800(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;)I

    move-result v3

    if-lez v3, :cond_0

    .line 377
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    iget-object v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->buf:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;

    invoke-static {v4}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;->access$800(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;)I

    move-result v4

    int-to-long v4, v4

    invoke-static {v3, v4, v5}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$914(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;J)J

    .line 380
    :cond_0
    const/4 v1, 0x0

    .line 382
    .local v1, "read":I
    :try_start_0
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->inf:Ljava/util/zip/Inflater;

    invoke-virtual {v3, p1, p2, p3}, Ljava/util/zip/Inflater;->inflate([BII)I
    :try_end_0
    .catch Ljava/util/zip/DataFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 386
    if-nez v1, :cond_2

    .line 387
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->inf:Ljava/util/zip/Inflater;

    invoke-virtual {v3}, Ljava/util/zip/Inflater;->finished()Z

    move-result v3

    if-eqz v3, :cond_1

    move v1, v2

    .line 394
    .end local v1    # "read":I
    :goto_0
    return v1

    .line 383
    .restart local v1    # "read":I
    :catch_0
    move-exception v0

    .line 384
    .local v0, "e":Ljava/util/zip/DataFormatException;
    new-instance v2, Ljava/util/zip/ZipException;

    invoke-virtual {v0}, Ljava/util/zip/DataFormatException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/util/zip/ZipException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 389
    .end local v0    # "e":Ljava/util/zip/DataFormatException;
    :cond_1
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->buf:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;

    invoke-static {v3}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;->access$800(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;)I

    move-result v3

    if-ne v3, v2, :cond_2

    .line 390
    new-instance v2, Ljava/io/IOException;

    const-string/jumbo v3, "Truncated ZIP file"

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 393
    :cond_2
    iget-object v2, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->crc:Ljava/util/zip/CRC32;

    invoke-virtual {v2, p1, p2, v1}, Ljava/util/zip/CRC32;->update([BII)V

    goto :goto_0
.end method

.method private readFully([B)V
    .locals 4
    .param p1, "b"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 582
    const/4 v0, 0x0

    .local v0, "count":I
    const/4 v1, 0x0

    .line 583
    .local v1, "x":I
    :goto_0
    array-length v2, p1

    if-eq v0, v2, :cond_1

    .line 584
    iget-object v2, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->in:Ljava/io/InputStream;

    array-length v3, p1

    sub-int/2addr v3, v0

    invoke-virtual {v2, p1, v0, v3}, Ljava/io/InputStream;->read([BII)I

    move-result v1

    add-int/2addr v0, v1

    .line 585
    const/4 v2, -0x1

    if-ne v1, v2, :cond_0

    .line 586
    new-instance v2, Ljava/io/EOFException;

    invoke-direct {v2}, Ljava/io/EOFException;-><init>()V

    throw v2

    .line 588
    :cond_0
    invoke-virtual {p0, v1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->count(I)V

    goto :goto_0

    .line 590
    :cond_1
    return-void
.end method

.method private readStored([BII)I
    .locals 8
    .param p1, "buffer"    # [B
    .param p2, "start"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, -0x1

    .line 334
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    invoke-static {v3}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$400(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 335
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->lastStoredEntry:Ljava/io/ByteArrayInputStream;

    if-nez v3, :cond_0

    .line 336
    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->readStoredEntry()V

    .line 338
    :cond_0
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->lastStoredEntry:Ljava/io/ByteArrayInputStream;

    invoke-virtual {v3, p1, p2, p3}, Ljava/io/ByteArrayInputStream;->read([BII)I

    move-result v2

    .line 366
    :cond_1
    :goto_0
    return v2

    .line 341
    :cond_2
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    invoke-static {v3}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$300(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v3

    invoke-virtual {v3}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getSize()J

    move-result-wide v0

    .line 342
    .local v0, "csize":J
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    invoke-static {v3}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$600(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)J

    move-result-wide v4

    cmp-long v3, v4, v0

    if-gez v3, :cond_1

    .line 346
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->buf:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;

    invoke-static {v3}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;->access$700(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;)I

    move-result v3

    iget-object v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->buf:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;

    invoke-static {v4}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;->access$800(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;)I

    move-result v4

    if-lt v3, v4, :cond_3

    .line 347
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->buf:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;

    const/4 v4, 0x0

    invoke-static {v3, v4}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;->access$702(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;I)I

    .line 348
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->buf:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;

    iget-object v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->in:Ljava/io/InputStream;

    iget-object v5, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->buf:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;

    invoke-static {v5}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;->access$100(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;)[B

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/io/InputStream;->read([B)I

    move-result v4

    invoke-static {v3, v4}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;->access$802(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;I)I

    move-result v3

    if-eq v3, v2, :cond_1

    .line 351
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->buf:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;

    invoke-static {v3}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;->access$800(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;)I

    move-result v3

    invoke-virtual {p0, v3}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->count(I)V

    .line 352
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    iget-object v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->buf:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;

    invoke-static {v4}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;->access$800(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;)I

    move-result v4

    int-to-long v4, v4

    invoke-static {v3, v4, v5}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$914(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;J)J

    .line 355
    :cond_3
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->buf:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;

    invoke-static {v3}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;->access$800(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;)I

    move-result v3

    if-le p3, v3, :cond_5

    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->buf:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;

    invoke-static {v3}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;->access$800(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;)I

    move-result v3

    iget-object v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->buf:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;

    invoke-static {v4}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;->access$700(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;)I

    move-result v4

    sub-int v2, v3, v4

    .line 358
    .local v2, "toRead":I
    :goto_1
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    invoke-static {v3}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$600(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)J

    move-result-wide v4

    sub-long v4, v0, v4

    int-to-long v6, v2

    cmp-long v3, v4, v6

    if-gez v3, :cond_4

    .line 360
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    invoke-static {v3}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$600(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)J

    move-result-wide v4

    sub-long v4, v0, v4

    long-to-int v2, v4

    .line 362
    :cond_4
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->buf:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;

    invoke-static {v3}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;->access$100(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;)[B

    move-result-object v3

    iget-object v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->buf:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;

    invoke-static {v4}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;->access$700(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;)I

    move-result v4

    invoke-static {v3, v4, p1, p2, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 363
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->buf:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;

    invoke-static {v3, v2}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;->access$712(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;I)I

    .line 364
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    int-to-long v4, v2

    invoke-static {v3, v4, v5}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$614(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;J)J

    .line 365
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->crc:Ljava/util/zip/CRC32;

    invoke-virtual {v3, p1, p2, v2}, Ljava/util/zip/CRC32;->update([BII)V

    goto/16 :goto_0

    .end local v2    # "toRead":I
    :cond_5
    move v2, p3

    .line 355
    goto :goto_1
.end method

.method private readStoredEntry()V
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 660
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 661
    .local v1, "bos":Ljava/io/ByteArrayOutputStream;
    const/4 v4, 0x0

    .line 662
    .local v4, "off":I
    const/4 v3, 0x0

    .line 665
    .local v3, "done":Z
    iget-object v6, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    invoke-static {v6}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$500(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Z

    move-result v6

    if-eqz v6, :cond_1

    const/16 v2, 0x14

    .line 667
    .local v2, "ddLen":I
    :cond_0
    :goto_0
    if-nez v3, :cond_4

    .line 668
    iget-object v6, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->in:Ljava/io/InputStream;

    iget-object v7, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->buf:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;

    invoke-static {v7}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;->access$100(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;)[B

    move-result-object v7

    rsub-int v8, v4, 0x200

    invoke-virtual {v6, v7, v4, v8}, Ljava/io/InputStream;->read([BII)I

    move-result v5

    .line 670
    .local v5, "r":I
    if-gtz v5, :cond_2

    .line 673
    new-instance v6, Ljava/io/IOException;

    const-string/jumbo v7, "Truncated ZIP file"

    invoke-direct {v6, v7}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 665
    .end local v2    # "ddLen":I
    .end local v5    # "r":I
    :cond_1
    const/16 v2, 0xc

    goto :goto_0

    .line 675
    .restart local v2    # "ddLen":I
    .restart local v5    # "r":I
    :cond_2
    add-int v6, v5, v4

    const/4 v7, 0x4

    if-ge v6, v7, :cond_3

    .line 677
    add-int/2addr v4, v5

    .line 678
    goto :goto_0

    .line 681
    :cond_3
    invoke-direct {p0, v1, v4, v5, v2}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->bufferContainsSignature(Ljava/io/ByteArrayOutputStream;III)Z

    move-result v3

    .line 682
    if-nez v3, :cond_0

    .line 683
    invoke-direct {p0, v1, v4, v5, v2}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->cacheBytesRead(Ljava/io/ByteArrayOutputStream;III)I

    move-result v4

    goto :goto_0

    .line 687
    .end local v5    # "r":I
    :cond_4
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v0

    .line 688
    .local v0, "b":[B
    new-instance v6, Ljava/io/ByteArrayInputStream;

    invoke-direct {v6, v0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    iput-object v6, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->lastStoredEntry:Ljava/io/ByteArrayInputStream;

    .line 689
    return-void
.end method

.method private supportsDataDescriptorFor(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;)Z
    .locals 2
    .param p1, "entry"    # Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    .prologue
    .line 637
    iget-boolean v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->allowStoredEntriesWithDataDescriptor:Z

    if-nez v0, :cond_0

    invoke-virtual {p1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getGeneralPurposeBit()Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;->usesDataDescriptor()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getMethod()I

    move-result v0

    const/16 v1, 0x8

    if-ne v0, v1, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public canReadEntryData(Lorg/apache/commons/compress/archivers/ArchiveEntry;)Z
    .locals 3
    .param p1, "ae"    # Lorg/apache/commons/compress/archivers/ArchiveEntry;

    .prologue
    const/4 v1, 0x0

    .line 291
    instance-of v2, p1, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    if-eqz v2, :cond_0

    move-object v0, p1

    .line 292
    check-cast v0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    .line 293
    .local v0, "ze":Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    invoke-static {v0}, Lorg/apache/commons/compress/archivers/zip/ZipUtil;->canHandleEntryData(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;)Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-direct {p0, v0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->supportsDataDescriptorFor(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v1, 0x1

    .line 297
    .end local v0    # "ze":Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    :cond_0
    return v1
.end method

.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 399
    iget-boolean v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->closed:Z

    if-nez v0, :cond_0

    .line 400
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->closed:Z

    .line 401
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 402
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->inf:Ljava/util/zip/Inflater;

    invoke-virtual {v0}, Ljava/util/zip/Inflater;->end()V

    .line 404
    :cond_0
    return-void
.end method

.method public getNextEntry()Lorg/apache/commons/compress/archivers/ArchiveEntry;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 279
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->getNextZipEntry()Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v0

    return-object v0
.end method

.method public getNextZipEntry()Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    .locals 24
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 168
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->closed:Z

    move/from16 v20, v0

    if-nez v20, :cond_0

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->hitCentralDirectory:Z

    move/from16 v20, v0

    if-eqz v20, :cond_1

    .line 169
    :cond_0
    const/16 v20, 0x0

    .line 248
    :goto_0
    return-object v20

    .line 171
    :cond_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    move-object/from16 v20, v0

    if-eqz v20, :cond_2

    .line 172
    invoke-direct/range {p0 .. p0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->closeEntry()V

    .line 174
    :cond_2
    const/16 v20, 0x1e

    move/from16 v0, v20

    new-array v13, v0, [B

    .line 176
    .local v13, "lfh":[B
    :try_start_0
    move-object/from16 v0, p0

    invoke-direct {v0, v13}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->readFully([B)V
    :try_end_0
    .catch Ljava/io/EOFException; {:try_start_0 .. :try_end_0} :catch_0

    .line 180
    new-instance v15, Lorg/apache/commons/compress/archivers/zip/ZipLong;

    invoke-direct {v15, v13}, Lorg/apache/commons/compress/archivers/zip/ZipLong;-><init>([B)V

    .line 181
    .local v15, "sig":Lorg/apache/commons/compress/archivers/zip/ZipLong;
    sget-object v20, Lorg/apache/commons/compress/archivers/zip/ZipLong;->CFH_SIG:Lorg/apache/commons/compress/archivers/zip/ZipLong;

    move-object/from16 v0, v20

    invoke-virtual {v15, v0}, Lorg/apache/commons/compress/archivers/zip/ZipLong;->equals(Ljava/lang/Object;)Z

    move-result v20

    if-eqz v20, :cond_3

    .line 182
    const/16 v20, 0x1

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->hitCentralDirectory:Z

    .line 183
    const/16 v20, 0x0

    goto :goto_0

    .line 177
    .end local v15    # "sig":Lorg/apache/commons/compress/archivers/zip/ZipLong;
    :catch_0
    move-exception v5

    .line 178
    .local v5, "e":Ljava/io/EOFException;
    const/16 v20, 0x0

    goto :goto_0

    .line 185
    .end local v5    # "e":Ljava/io/EOFException;
    .restart local v15    # "sig":Lorg/apache/commons/compress/archivers/zip/ZipLong;
    :cond_3
    sget-object v20, Lorg/apache/commons/compress/archivers/zip/ZipLong;->LFH_SIG:Lorg/apache/commons/compress/archivers/zip/ZipLong;

    move-object/from16 v0, v20

    invoke-virtual {v15, v0}, Lorg/apache/commons/compress/archivers/zip/ZipLong;->equals(Ljava/lang/Object;)Z

    move-result v20

    if-nez v20, :cond_4

    .line 186
    const/16 v20, 0x0

    goto :goto_0

    .line 189
    :cond_4
    const/4 v14, 0x4

    .line 190
    .local v14, "off":I
    new-instance v20, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    const/16 v21, 0x0

    invoke-direct/range {v20 .. v21}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;-><init>(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$1;)V

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    .line 192
    invoke-static {v13, v14}, Lorg/apache/commons/compress/archivers/zip/ZipShort;->getValue([BI)I

    move-result v17

    .line 193
    .local v17, "versionMadeBy":I
    add-int/lit8 v14, v14, 0x2

    .line 194
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    move-object/from16 v20, v0

    invoke-static/range {v20 .. v20}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$300(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v20

    shr-int/lit8 v21, v17, 0x8

    and-int/lit8 v21, v21, 0xf

    invoke-virtual/range {v20 .. v21}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->setPlatform(I)V

    .line 197
    invoke-static {v13, v14}, Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;->parse([BI)Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;

    move-result-object v11

    .line 198
    .local v11, "gpFlag":Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;
    invoke-virtual {v11}, Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;->usesUTF8ForNames()Z

    move-result v12

    .line 199
    .local v12, "hasUTF8Flag":Z
    if-eqz v12, :cond_6

    sget-object v6, Lorg/apache/commons/compress/archivers/zip/ZipEncodingHelper;->UTF8_ZIP_ENCODING:Lorg/apache/commons/compress/archivers/zip/ZipEncoding;

    .line 201
    .local v6, "entryEncoding":Lorg/apache/commons/compress/archivers/zip/ZipEncoding;
    :goto_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    move-object/from16 v20, v0

    invoke-virtual {v11}, Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;->usesDataDescriptor()Z

    move-result v21

    invoke-static/range {v20 .. v21}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$402(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;Z)Z

    .line 202
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    move-object/from16 v20, v0

    invoke-static/range {v20 .. v20}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$300(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v0, v11}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->setGeneralPurposeBit(Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;)V

    .line 204
    add-int/lit8 v14, v14, 0x2

    .line 206
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    move-object/from16 v20, v0

    invoke-static/range {v20 .. v20}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$300(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v20

    invoke-static {v13, v14}, Lorg/apache/commons/compress/archivers/zip/ZipShort;->getValue([BI)I

    move-result v21

    invoke-virtual/range {v20 .. v21}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->setMethod(I)V

    .line 207
    add-int/lit8 v14, v14, 0x2

    .line 209
    invoke-static {v13, v14}, Lorg/apache/commons/compress/archivers/zip/ZipLong;->getValue([BI)J

    move-result-wide v20

    invoke-static/range {v20 .. v21}, Lorg/apache/commons/compress/archivers/zip/ZipUtil;->dosToJavaTime(J)J

    move-result-wide v18

    .line 210
    .local v18, "time":J
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    move-object/from16 v20, v0

    invoke-static/range {v20 .. v20}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$300(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v20

    move-object/from16 v0, v20

    move-wide/from16 v1, v18

    invoke-virtual {v0, v1, v2}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->setTime(J)V

    .line 211
    add-int/lit8 v14, v14, 0x4

    .line 213
    const/16 v16, 0x0

    .local v16, "size":Lorg/apache/commons/compress/archivers/zip/ZipLong;
    const/4 v4, 0x0

    .line 214
    .local v4, "cSize":Lorg/apache/commons/compress/archivers/zip/ZipLong;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    move-object/from16 v20, v0

    invoke-static/range {v20 .. v20}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$400(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Z

    move-result v20

    if-nez v20, :cond_7

    .line 215
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    move-object/from16 v20, v0

    invoke-static/range {v20 .. v20}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$300(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v20

    invoke-static {v13, v14}, Lorg/apache/commons/compress/archivers/zip/ZipLong;->getValue([BI)J

    move-result-wide v22

    move-object/from16 v0, v20

    move-wide/from16 v1, v22

    invoke-virtual {v0, v1, v2}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->setCrc(J)V

    .line 216
    add-int/lit8 v14, v14, 0x4

    .line 218
    new-instance v4, Lorg/apache/commons/compress/archivers/zip/ZipLong;

    .end local v4    # "cSize":Lorg/apache/commons/compress/archivers/zip/ZipLong;
    invoke-direct {v4, v13, v14}, Lorg/apache/commons/compress/archivers/zip/ZipLong;-><init>([BI)V

    .line 219
    .restart local v4    # "cSize":Lorg/apache/commons/compress/archivers/zip/ZipLong;
    add-int/lit8 v14, v14, 0x4

    .line 221
    new-instance v16, Lorg/apache/commons/compress/archivers/zip/ZipLong;

    .end local v16    # "size":Lorg/apache/commons/compress/archivers/zip/ZipLong;
    move-object/from16 v0, v16

    invoke-direct {v0, v13, v14}, Lorg/apache/commons/compress/archivers/zip/ZipLong;-><init>([BI)V

    .line 222
    .restart local v16    # "size":Lorg/apache/commons/compress/archivers/zip/ZipLong;
    add-int/lit8 v14, v14, 0x4

    .line 227
    :goto_2
    invoke-static {v13, v14}, Lorg/apache/commons/compress/archivers/zip/ZipShort;->getValue([BI)I

    move-result v10

    .line 229
    .local v10, "fileNameLen":I
    add-int/lit8 v14, v14, 0x2

    .line 231
    invoke-static {v13, v14}, Lorg/apache/commons/compress/archivers/zip/ZipShort;->getValue([BI)I

    move-result v8

    .line 232
    .local v8, "extraLen":I
    add-int/lit8 v14, v14, 0x2

    .line 234
    new-array v9, v10, [B

    .line 235
    .local v9, "fileName":[B
    move-object/from16 v0, p0

    invoke-direct {v0, v9}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->readFully([B)V

    .line 236
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    move-object/from16 v20, v0

    invoke-static/range {v20 .. v20}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$300(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v20

    invoke-interface {v6, v9}, Lorg/apache/commons/compress/archivers/zip/ZipEncoding;->decode([B)Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-virtual {v0, v1, v9}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->setName(Ljava/lang/String;[B)V

    .line 238
    new-array v7, v8, [B

    .line 239
    .local v7, "extraData":[B
    move-object/from16 v0, p0

    invoke-direct {v0, v7}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->readFully([B)V

    .line 240
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    move-object/from16 v20, v0

    invoke-static/range {v20 .. v20}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$300(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v0, v7}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->setExtra([B)V

    .line 242
    if-nez v12, :cond_5

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->useUnicodeExtraFields:Z

    move/from16 v20, v0

    if-eqz v20, :cond_5

    .line 243
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    move-object/from16 v20, v0

    invoke-static/range {v20 .. v20}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$300(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v20

    const/16 v21, 0x0

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-static {v0, v9, v1}, Lorg/apache/commons/compress/archivers/zip/ZipUtil;->setNameAndCommentFromExtraFields(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;[B[B)V

    .line 247
    :cond_5
    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v0, v1, v4}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->processZip64Extra(Lorg/apache/commons/compress/archivers/zip/ZipLong;Lorg/apache/commons/compress/archivers/zip/ZipLong;)V

    .line 248
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    move-object/from16 v20, v0

    invoke-static/range {v20 .. v20}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$300(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v20

    goto/16 :goto_0

    .line 199
    .end local v4    # "cSize":Lorg/apache/commons/compress/archivers/zip/ZipLong;
    .end local v6    # "entryEncoding":Lorg/apache/commons/compress/archivers/zip/ZipEncoding;
    .end local v7    # "extraData":[B
    .end local v8    # "extraLen":I
    .end local v9    # "fileName":[B
    .end local v10    # "fileNameLen":I
    .end local v16    # "size":Lorg/apache/commons/compress/archivers/zip/ZipLong;
    .end local v18    # "time":J
    :cond_6
    move-object/from16 v0, p0

    iget-object v6, v0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->zipEncoding:Lorg/apache/commons/compress/archivers/zip/ZipEncoding;

    goto/16 :goto_1

    .line 224
    .restart local v4    # "cSize":Lorg/apache/commons/compress/archivers/zip/ZipLong;
    .restart local v6    # "entryEncoding":Lorg/apache/commons/compress/archivers/zip/ZipEncoding;
    .restart local v16    # "size":Lorg/apache/commons/compress/archivers/zip/ZipLong;
    .restart local v18    # "time":J
    :cond_7
    add-int/lit8 v14, v14, 0xc

    goto :goto_2
.end method

.method public read([BII)I
    .locals 3
    .param p1, "buffer"    # [B
    .param p2, "start"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 302
    iget-boolean v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->closed:Z

    if-eqz v0, :cond_0

    .line 303
    new-instance v0, Ljava/io/IOException;

    const-string/jumbo v1, "The stream is closed"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 305
    :cond_0
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->inf:Ljava/util/zip/Inflater;

    invoke-virtual {v0}, Ljava/util/zip/Inflater;->finished()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    if-nez v0, :cond_2

    .line 306
    :cond_1
    const/4 v0, -0x1

    .line 323
    :goto_0
    return v0

    .line 310
    :cond_2
    array-length v0, p1

    if-gt p2, v0, :cond_5

    if-ltz p3, :cond_5

    if-ltz p2, :cond_5

    array-length v0, p1

    sub-int/2addr v0, p2

    if-lt v0, p3, :cond_5

    .line 312
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    invoke-static {v0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$300(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/compress/archivers/zip/ZipUtil;->checkRequestedFeatures(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;)V

    .line 313
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    invoke-static {v0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$300(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->supportsDataDescriptorFor(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;)Z

    move-result v0

    if-nez v0, :cond_3

    .line 314
    new-instance v0, Lorg/apache/commons/compress/archivers/zip/UnsupportedZipFeatureException;

    sget-object v1, Lorg/apache/commons/compress/archivers/zip/UnsupportedZipFeatureException$Feature;->DATA_DESCRIPTOR:Lorg/apache/commons/compress/archivers/zip/UnsupportedZipFeatureException$Feature;

    iget-object v2, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    invoke-static {v2}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$300(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/commons/compress/archivers/zip/UnsupportedZipFeatureException;-><init>(Lorg/apache/commons/compress/archivers/zip/UnsupportedZipFeatureException$Feature;Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;)V

    throw v0

    .line 320
    :cond_3
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    invoke-static {v0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$300(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getMethod()I

    move-result v0

    if-nez v0, :cond_4

    .line 321
    invoke-direct {p0, p1, p2, p3}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->readStored([BII)I

    move-result v0

    goto :goto_0

    .line 323
    :cond_4
    invoke-direct {p0, p1, p2, p3}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->readDeflated([BII)I

    move-result v0

    goto :goto_0

    .line 325
    :cond_5
    new-instance v0, Ljava/lang/ArrayIndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>()V

    throw v0
.end method

.method public skip(J)J
    .locals 11
    .param p1, "value"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 423
    const-wide/16 v6, 0x0

    cmp-long v6, p1, v6

    if-ltz v6, :cond_3

    .line 424
    const-wide/16 v4, 0x0

    .line 425
    .local v4, "skipped":J
    const/16 v6, 0x400

    new-array v0, v6, [B

    .line 426
    .local v0, "b":[B
    :goto_0
    cmp-long v6, v4, p1

    if-gez v6, :cond_0

    .line 427
    sub-long v2, p1, v4

    .line 428
    .local v2, "rem":J
    const/4 v6, 0x0

    array-length v7, v0

    int-to-long v8, v7

    cmp-long v7, v8, v2

    if-lez v7, :cond_1

    .end local v2    # "rem":J
    :goto_1
    long-to-int v7, v2

    invoke-virtual {p0, v0, v6, v7}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->read([BII)I

    move-result v1

    .line 429
    .local v1, "x":I
    const/4 v6, -0x1

    if-ne v1, v6, :cond_2

    .line 434
    .end local v1    # "x":I
    :cond_0
    return-wide v4

    .line 428
    .restart local v2    # "rem":J
    :cond_1
    array-length v7, v0

    int-to-long v2, v7

    goto :goto_1

    .line 432
    .end local v2    # "rem":J
    .restart local v1    # "x":I
    :cond_2
    int-to-long v6, v1

    add-long/2addr v4, v6

    .line 433
    goto :goto_0

    .line 436
    .end local v0    # "b":[B
    .end local v1    # "x":I
    .end local v4    # "skipped":J
    :cond_3
    new-instance v6, Ljava/lang/IllegalArgumentException;

    invoke-direct {v6}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v6
.end method
