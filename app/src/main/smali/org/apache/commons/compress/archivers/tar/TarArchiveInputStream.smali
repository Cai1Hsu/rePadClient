.class public Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;
.super Lorg/apache/commons/compress/archivers/ArchiveInputStream;
.source "TarArchiveInputStream.java"


# static fields
.field private static final BUFFER_SIZE:I = 0x2000

.field private static final SMALL_BUFFER_SIZE:I = 0x100


# instance fields
.field protected final buffer:Lorg/apache/commons/compress/archivers/tar/TarBuffer;

.field private currEntry:Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;

.field private final encoding:Lorg/apache/commons/compress/archivers/zip/ZipEncoding;

.field private entryOffset:J

.field private entrySize:J

.field private hasHitEOF:Z

.field private readBuf:[B


# direct methods
.method public constructor <init>(Ljava/io/InputStream;)V
    .locals 2
    .param p1, "is"    # Ljava/io/InputStream;

    .prologue
    .line 64
    const/16 v0, 0x2800

    const/16 v1, 0x200

    invoke-direct {p0, p1, v0, v1}, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;-><init>(Ljava/io/InputStream;II)V

    .line 65
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;I)V
    .locals 1
    .param p1, "is"    # Ljava/io/InputStream;
    .param p2, "blockSize"    # I

    .prologue
    .line 83
    const/16 v0, 0x200

    invoke-direct {p0, p1, p2, v0}, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;-><init>(Ljava/io/InputStream;II)V

    .line 84
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;II)V
    .locals 1
    .param p1, "is"    # Ljava/io/InputStream;
    .param p2, "blockSize"    # I
    .param p3, "recordSize"    # I

    .prologue
    .line 105
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;-><init>(Ljava/io/InputStream;IILjava/lang/String;)V

    .line 106
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;IILjava/lang/String;)V
    .locals 1
    .param p1, "is"    # Ljava/io/InputStream;
    .param p2, "blockSize"    # I
    .param p3, "recordSize"    # I
    .param p4, "encoding"    # Ljava/lang/String;

    .prologue
    .line 117
    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/ArchiveInputStream;-><init>()V

    .line 118
    new-instance v0, Lorg/apache/commons/compress/archivers/tar/TarBuffer;

    invoke-direct {v0, p1, p2, p3}, Lorg/apache/commons/compress/archivers/tar/TarBuffer;-><init>(Ljava/io/InputStream;II)V

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->buffer:Lorg/apache/commons/compress/archivers/tar/TarBuffer;

    .line 119
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->readBuf:[B

    .line 120
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->hasHitEOF:Z

    .line 121
    invoke-static {p4}, Lorg/apache/commons/compress/archivers/zip/ZipEncodingHelper;->getZipEncoding(Ljava/lang/String;)Lorg/apache/commons/compress/archivers/zip/ZipEncoding;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->encoding:Lorg/apache/commons/compress/archivers/zip/ZipEncoding;

    .line 122
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;ILjava/lang/String;)V
    .locals 1
    .param p1, "is"    # Ljava/io/InputStream;
    .param p2, "blockSize"    # I
    .param p3, "encoding"    # Ljava/lang/String;

    .prologue
    .line 95
    const/16 v0, 0x200

    invoke-direct {p0, p1, p2, v0, p3}, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;-><init>(Ljava/io/InputStream;IILjava/lang/String;)V

    .line 96
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;Ljava/lang/String;)V
    .locals 2
    .param p1, "is"    # Ljava/io/InputStream;
    .param p2, "encoding"    # Ljava/lang/String;

    .prologue
    .line 74
    const/16 v0, 0x2800

    const/16 v1, 0x200

    invoke-direct {p0, p1, v0, v1, p2}, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;-><init>(Ljava/io/InputStream;IILjava/lang/String;)V

    .line 75
    return-void
.end method

.method private applyPaxHeadersToCurrentEntry(Ljava/util/Map;)V
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 377
    .local p1, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_a

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 378
    .local v0, "ent":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 379
    .local v2, "key":Ljava/lang/String;
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 380
    .local v3, "val":Ljava/lang/String;
    const-string/jumbo v4, "path"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 381
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->currEntry:Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;

    invoke-virtual {v4, v3}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->setName(Ljava/lang/String;)V

    goto :goto_0

    .line 382
    :cond_1
    const-string/jumbo v4, "linkpath"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 383
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->currEntry:Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;

    invoke-virtual {v4, v3}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->setLinkName(Ljava/lang/String;)V

    goto :goto_0

    .line 384
    :cond_2
    const-string/jumbo v4, "gid"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 385
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->currEntry:Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    invoke-virtual {v4, v5}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->setGroupId(I)V

    goto :goto_0

    .line 386
    :cond_3
    const-string/jumbo v4, "gname"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 387
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->currEntry:Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;

    invoke-virtual {v4, v3}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->setGroupName(Ljava/lang/String;)V

    goto :goto_0

    .line 388
    :cond_4
    const-string/jumbo v4, "uid"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_5

    .line 389
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->currEntry:Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    invoke-virtual {v4, v5}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->setUserId(I)V

    goto :goto_0

    .line 390
    :cond_5
    const-string/jumbo v4, "uname"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 391
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->currEntry:Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;

    invoke-virtual {v4, v3}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->setUserName(Ljava/lang/String;)V

    goto :goto_0

    .line 392
    :cond_6
    const-string/jumbo v4, "size"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_7

    .line 393
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->currEntry:Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;

    invoke-static {v3}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v6

    invoke-virtual {v4, v6, v7}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->setSize(J)V

    goto/16 :goto_0

    .line 394
    :cond_7
    const-string/jumbo v4, "mtime"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_8

    .line 395
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->currEntry:Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;

    invoke-static {v3}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v6

    const-wide v8, 0x408f400000000000L    # 1000.0

    mul-double/2addr v6, v8

    double-to-long v6, v6

    invoke-virtual {v4, v6, v7}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->setModTime(J)V

    goto/16 :goto_0

    .line 396
    :cond_8
    const-string/jumbo v4, "SCHILY.devminor"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_9

    .line 397
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->currEntry:Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    invoke-virtual {v4, v5}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->setDevMinor(I)V

    goto/16 :goto_0

    .line 398
    :cond_9
    const-string/jumbo v4, "SCHILY.devmajor"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 399
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->currEntry:Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    invoke-virtual {v4, v5}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->setDevMajor(I)V

    goto/16 :goto_0

    .line 402
    .end local v0    # "ent":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v2    # "key":Ljava/lang/String;
    .end local v3    # "val":Ljava/lang/String;
    :cond_a
    return-void
.end method

.method private getRecord()[B
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    const/4 v3, 0x1

    .line 298
    iget-boolean v2, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->hasHitEOF:Z

    if-eqz v2, :cond_0

    .line 310
    :goto_0
    return-object v1

    .line 302
    :cond_0
    iget-object v2, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->buffer:Lorg/apache/commons/compress/archivers/tar/TarBuffer;

    invoke-virtual {v2}, Lorg/apache/commons/compress/archivers/tar/TarBuffer;->readRecord()[B

    move-result-object v0

    .line 304
    .local v0, "headerBuf":[B
    if-nez v0, :cond_3

    .line 305
    iput-boolean v3, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->hasHitEOF:Z

    .line 310
    :cond_1
    :goto_1
    iget-boolean v2, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->hasHitEOF:Z

    if-eqz v2, :cond_2

    move-object v0, v1

    .end local v0    # "headerBuf":[B
    :cond_2
    move-object v1, v0

    goto :goto_0

    .line 306
    .restart local v0    # "headerBuf":[B
    :cond_3
    iget-object v2, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->buffer:Lorg/apache/commons/compress/archivers/tar/TarBuffer;

    invoke-virtual {v2, v0}, Lorg/apache/commons/compress/archivers/tar/TarBuffer;->isEOFRecord([B)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 307
    iput-boolean v3, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->hasHitEOF:Z

    goto :goto_1
.end method

.method public static matches([BI)Z
    .locals 6
    .param p0, "signature"    # [B
    .param p1, "length"    # I

    .prologue
    const/16 v5, 0x101

    const/4 v4, 0x6

    const/4 v0, 0x1

    const/16 v3, 0x107

    const/4 v2, 0x2

    .line 559
    const/16 v1, 0x109

    if-ge p1, v1, :cond_1

    .line 560
    const/4 v0, 0x0

    .line 593
    :cond_0
    :goto_0
    return v0

    .line 563
    :cond_1
    const-string/jumbo v1, "ustar\u0000"

    invoke-static {v1, p0, v5, v4}, Lorg/apache/commons/compress/utils/ArchiveUtils;->matchAsciiBuffer(Ljava/lang/String;[BII)Z

    move-result v1

    if-eqz v1, :cond_2

    const-string/jumbo v1, "00"

    invoke-static {v1, p0, v3, v2}, Lorg/apache/commons/compress/utils/ArchiveUtils;->matchAsciiBuffer(Ljava/lang/String;[BII)Z

    move-result v1

    if-nez v1, :cond_0

    .line 571
    :cond_2
    const-string/jumbo v1, "ustar "

    invoke-static {v1, p0, v5, v4}, Lorg/apache/commons/compress/utils/ArchiveUtils;->matchAsciiBuffer(Ljava/lang/String;[BII)Z

    move-result v1

    if-eqz v1, :cond_3

    const-string/jumbo v1, " \u0000"

    invoke-static {v1, p0, v3, v2}, Lorg/apache/commons/compress/utils/ArchiveUtils;->matchAsciiBuffer(Ljava/lang/String;[BII)Z

    move-result v1

    if-nez v1, :cond_0

    const-string/jumbo v1, "0\u0000"

    invoke-static {v1, p0, v3, v2}, Lorg/apache/commons/compress/utils/ArchiveUtils;->matchAsciiBuffer(Ljava/lang/String;[BII)Z

    move-result v1

    if-nez v1, :cond_0

    .line 585
    :cond_3
    const-string/jumbo v1, "ustar\u0000"

    invoke-static {v1, p0, v5, v4}, Lorg/apache/commons/compress/utils/ArchiveUtils;->matchAsciiBuffer(Ljava/lang/String;[BII)Z

    move-result v1

    if-eqz v1, :cond_4

    const-string/jumbo v1, "\u0000\u0000"

    invoke-static {v1, p0, v3, v2}, Lorg/apache/commons/compress/utils/ArchiveUtils;->matchAsciiBuffer(Ljava/lang/String;[BII)Z

    move-result v1

    if-nez v1, :cond_0

    .line 593
    :cond_4
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private paxHeaders()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 314
    invoke-virtual {p0, p0}, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->parsePaxHeaders(Ljava/io/InputStream;)Ljava/util/Map;

    move-result-object v0

    .line 315
    .local v0, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->getNextEntry()Lorg/apache/commons/compress/archivers/ArchiveEntry;

    .line 316
    invoke-direct {p0, v0}, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->applyPaxHeadersToCurrentEntry(Ljava/util/Map;)V

    .line 317
    return-void
.end method

.method private readGNUSparse()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 417
    iget-object v2, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->currEntry:Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;

    invoke-virtual {v2}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->isExtended()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 420
    :cond_0
    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->getRecord()[B

    move-result-object v1

    .line 421
    .local v1, "headerBuf":[B
    iget-boolean v2, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->hasHitEOF:Z

    if-eqz v2, :cond_2

    .line 422
    const/4 v2, 0x0

    iput-object v2, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->currEntry:Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;

    .line 431
    .end local v1    # "headerBuf":[B
    :cond_1
    :goto_0
    return-void

    .line 425
    .restart local v1    # "headerBuf":[B
    :cond_2
    new-instance v0, Lorg/apache/commons/compress/archivers/tar/TarArchiveSparseEntry;

    invoke-direct {v0, v1}, Lorg/apache/commons/compress/archivers/tar/TarArchiveSparseEntry;-><init>([B)V

    .line 429
    .local v0, "entry":Lorg/apache/commons/compress/archivers/tar/TarArchiveSparseEntry;
    invoke-virtual {v0}, Lorg/apache/commons/compress/archivers/tar/TarArchiveSparseEntry;->isExtended()Z

    move-result v2

    if-nez v2, :cond_0

    goto :goto_0
.end method


# virtual methods
.method public available()I
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 156
    iget-wide v0, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->entrySize:J

    iget-wide v2, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->entryOffset:J

    sub-long/2addr v0, v2

    const-wide/32 v2, 0x7fffffff

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    .line 157
    const v0, 0x7fffffff

    .line 159
    :goto_0
    return v0

    :cond_0
    iget-wide v0, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->entrySize:J

    iget-wide v2, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->entryOffset:J

    sub-long/2addr v0, v2

    long-to-int v0, v0

    goto :goto_0
.end method

.method public canReadEntryData(Lorg/apache/commons/compress/archivers/ArchiveEntry;)Z
    .locals 3
    .param p1, "ae"    # Lorg/apache/commons/compress/archivers/ArchiveEntry;

    .prologue
    const/4 v1, 0x0

    .line 526
    instance-of v2, p1, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;

    if-eqz v2, :cond_0

    move-object v0, p1

    .line 527
    check-cast v0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;

    .line 528
    .local v0, "te":Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;
    invoke-virtual {v0}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->isGNUSparse()Z

    move-result v2

    if-nez v2, :cond_0

    const/4 v1, 0x1

    .line 530
    .end local v0    # "te":Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;
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
    .line 130
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->buffer:Lorg/apache/commons/compress/archivers/tar/TarBuffer;

    invoke-virtual {v0}, Lorg/apache/commons/compress/archivers/tar/TarBuffer;->close()V

    .line 131
    return-void
.end method

.method protected final getCurrentEntry()Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;
    .locals 1

    .prologue
    .line 534
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->currEntry:Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;

    return-object v0
.end method

.method public getNextEntry()Lorg/apache/commons/compress/archivers/ArchiveEntry;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 435
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->getNextTarEntry()Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;

    move-result-object v0

    return-object v0
.end method

.method public getNextTarEntry()Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;
    .locals 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 212
    iget-boolean v10, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->hasHitEOF:Z

    if-eqz v10, :cond_0

    .line 213
    const/4 v10, 0x0

    .line 282
    :goto_0
    return-object v10

    .line 216
    :cond_0
    iget-object v10, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->currEntry:Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;

    if-eqz v10, :cond_3

    .line 217
    iget-wide v10, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->entrySize:J

    iget-wide v12, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->entryOffset:J

    sub-long v6, v10, v12

    .line 219
    .local v6, "numToSkip":J
    :goto_1
    const-wide/16 v10, 0x0

    cmp-long v10, v6, v10

    if-lez v10, :cond_2

    .line 220
    invoke-virtual {p0, v6, v7}, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->skip(J)J

    move-result-wide v8

    .line 221
    .local v8, "skipped":J
    const-wide/16 v10, 0x0

    cmp-long v10, v8, v10

    if-gtz v10, :cond_1

    .line 222
    new-instance v10, Ljava/lang/RuntimeException;

    const-string/jumbo v11, "failed to skip current tar entry"

    invoke-direct {v10, v11}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 224
    :cond_1
    sub-long/2addr v6, v8

    .line 225
    goto :goto_1

    .line 227
    .end local v8    # "skipped":J
    :cond_2
    const/4 v10, 0x0

    iput-object v10, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->readBuf:[B

    .line 230
    .end local v6    # "numToSkip":J
    :cond_3
    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->getRecord()[B

    move-result-object v2

    .line 232
    .local v2, "headerBuf":[B
    iget-boolean v10, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->hasHitEOF:Z

    if-eqz v10, :cond_4

    .line 233
    const/4 v10, 0x0

    iput-object v10, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->currEntry:Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;

    .line 234
    const/4 v10, 0x0

    goto :goto_0

    .line 238
    :cond_4
    :try_start_0
    new-instance v10, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;

    iget-object v11, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->encoding:Lorg/apache/commons/compress/archivers/zip/ZipEncoding;

    invoke-direct {v10, v2, v11}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;-><init>([BLorg/apache/commons/compress/archivers/zip/ZipEncoding;)V

    iput-object v10, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->currEntry:Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 244
    const-wide/16 v10, 0x0

    iput-wide v10, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->entryOffset:J

    .line 245
    iget-object v10, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->currEntry:Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;

    invoke-virtual {v10}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->getSize()J

    move-result-wide v10

    iput-wide v10, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->entrySize:J

    .line 247
    iget-object v10, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->currEntry:Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;

    invoke-virtual {v10}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->isGNULongNameEntry()Z

    move-result v10

    if-eqz v10, :cond_8

    .line 249
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    .line 250
    .local v5, "longName":Ljava/lang/StringBuffer;
    const/16 v10, 0x100

    new-array v0, v10, [B

    .line 251
    .local v0, "buf":[B
    const/4 v4, 0x0

    .line 252
    .local v4, "length":I
    :goto_2
    invoke-virtual {p0, v0}, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->read([B)I

    move-result v4

    if-ltz v4, :cond_5

    .line 253
    new-instance v10, Ljava/lang/String;

    const/4 v11, 0x0

    invoke-direct {v10, v0, v11, v4}, Ljava/lang/String;-><init>([BII)V

    invoke-virtual {v5, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_2

    .line 239
    .end local v0    # "buf":[B
    .end local v4    # "length":I
    .end local v5    # "longName":Ljava/lang/StringBuffer;
    :catch_0
    move-exception v1

    .line 240
    .local v1, "e":Ljava/lang/IllegalArgumentException;
    new-instance v3, Ljava/io/IOException;

    const-string/jumbo v10, "Error detected parsing the header"

    invoke-direct {v3, v10}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 241
    .local v3, "ioe":Ljava/io/IOException;
    invoke-virtual {v3, v1}, Ljava/io/IOException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 242
    throw v3

    .line 255
    .end local v1    # "e":Ljava/lang/IllegalArgumentException;
    .end local v3    # "ioe":Ljava/io/IOException;
    .restart local v0    # "buf":[B
    .restart local v4    # "length":I
    .restart local v5    # "longName":Ljava/lang/StringBuffer;
    :cond_5
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->getNextEntry()Lorg/apache/commons/compress/archivers/ArchiveEntry;

    .line 256
    iget-object v10, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->currEntry:Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;

    if-nez v10, :cond_6

    .line 259
    const/4 v10, 0x0

    goto/16 :goto_0

    .line 262
    :cond_6
    invoke-virtual {v5}, Ljava/lang/StringBuffer;->length()I

    move-result v10

    if-lez v10, :cond_7

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->length()I

    move-result v10

    add-int/lit8 v10, v10, -0x1

    invoke-virtual {v5, v10}, Ljava/lang/StringBuffer;->charAt(I)C

    move-result v10

    if-nez v10, :cond_7

    .line 264
    invoke-virtual {v5}, Ljava/lang/StringBuffer;->length()I

    move-result v10

    add-int/lit8 v10, v10, -0x1

    invoke-virtual {v5, v10}, Ljava/lang/StringBuffer;->deleteCharAt(I)Ljava/lang/StringBuffer;

    .line 266
    :cond_7
    iget-object v10, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->currEntry:Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->setName(Ljava/lang/String;)V

    .line 269
    .end local v0    # "buf":[B
    .end local v4    # "length":I
    .end local v5    # "longName":Ljava/lang/StringBuffer;
    :cond_8
    iget-object v10, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->currEntry:Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;

    invoke-virtual {v10}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->isPaxHeader()Z

    move-result v10

    if-eqz v10, :cond_9

    .line 270
    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->paxHeaders()V

    .line 273
    :cond_9
    iget-object v10, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->currEntry:Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;

    invoke-virtual {v10}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->isGNUSparse()Z

    move-result v10

    if-eqz v10, :cond_a

    .line 274
    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->readGNUSparse()V

    .line 281
    :cond_a
    iget-object v10, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->currEntry:Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;

    invoke-virtual {v10}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->getSize()J

    move-result-wide v10

    iput-wide v10, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->entrySize:J

    .line 282
    iget-object v10, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->currEntry:Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;

    goto/16 :goto_0
.end method

.method public getRecordSize()I
    .locals 1

    .prologue
    .line 139
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->buffer:Lorg/apache/commons/compress/archivers/tar/TarBuffer;

    invoke-virtual {v0}, Lorg/apache/commons/compress/archivers/tar/TarBuffer;->getRecordSize()I

    move-result v0

    return v0
.end method

.method protected final isAtEOF()Z
    .locals 1

    .prologue
    .line 542
    iget-boolean v0, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->hasHitEOF:Z

    return v0
.end method

.method parsePaxHeaders(Ljava/io/InputStream;)Ljava/util/Map;
    .locals 13
    .param p1, "i"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/InputStream;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v12, -0x1

    .line 320
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 324
    .local v3, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_0
    const/4 v5, 0x0

    .line 325
    .local v5, "len":I
    const/4 v6, 0x0

    .line 326
    .local v6, "read":I
    :goto_0
    invoke-virtual {p1}, Ljava/io/InputStream;->read()I

    move-result v0

    .local v0, "ch":I
    if-eq v0, v12, :cond_2

    .line 327
    add-int/lit8 v6, v6, 0x1

    .line 328
    const/16 v9, 0x20

    if-ne v0, v9, :cond_4

    .line 330
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 331
    .local v1, "coll":Ljava/io/ByteArrayOutputStream;
    :goto_1
    invoke-virtual {p1}, Ljava/io/InputStream;->read()I

    move-result v0

    if-eq v0, v12, :cond_2

    .line 332
    add-int/lit8 v6, v6, 0x1

    .line 333
    const/16 v9, 0x3d

    if-ne v0, v9, :cond_3

    .line 334
    const-string/jumbo v9, "UTF-8"

    invoke-virtual {v1, v9}, Ljava/io/ByteArrayOutputStream;->toString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 336
    .local v4, "keyword":Ljava/lang/String;
    sub-int v9, v5, v6

    new-array v7, v9, [B

    .line 337
    .local v7, "rest":[B
    invoke-virtual {p1, v7}, Ljava/io/InputStream;->read([B)I

    move-result v2

    .line 338
    .local v2, "got":I
    sub-int v9, v5, v6

    if-eq v2, v9, :cond_1

    .line 339
    new-instance v9, Ljava/io/IOException;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v11, "Failed to read Paxheader. Expected "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    sub-int v11, v5, v6

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string/jumbo v11, " bytes, read "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 346
    :cond_1
    new-instance v8, Ljava/lang/String;

    const/4 v9, 0x0

    sub-int v10, v5, v6

    add-int/lit8 v10, v10, -0x1

    const-string/jumbo v11, "UTF-8"

    invoke-direct {v8, v7, v9, v10, v11}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V

    .line 348
    .local v8, "value":Ljava/lang/String;
    invoke-interface {v3, v4, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 358
    .end local v1    # "coll":Ljava/io/ByteArrayOutputStream;
    .end local v2    # "got":I
    .end local v4    # "keyword":Ljava/lang/String;
    .end local v7    # "rest":[B
    .end local v8    # "value":Ljava/lang/String;
    :cond_2
    if-ne v0, v12, :cond_0

    .line 362
    return-object v3

    .line 351
    .restart local v1    # "coll":Ljava/io/ByteArrayOutputStream;
    :cond_3
    int-to-byte v9, v0

    invoke-virtual {v1, v9}, Ljava/io/ByteArrayOutputStream;->write(I)V

    goto :goto_1

    .line 355
    .end local v1    # "coll":Ljava/io/ByteArrayOutputStream;
    :cond_4
    mul-int/lit8 v5, v5, 0xa

    .line 356
    add-int/lit8 v9, v0, -0x30

    add-int/2addr v5, v9

    goto :goto_0
.end method

.method public read([BII)I
    .locals 11
    .param p1, "buf"    # [B
    .param p2, "offset"    # I
    .param p3, "numToRead"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v10, 0x0

    .line 453
    const/4 v5, 0x0

    .line 455
    .local v5, "totalRead":I
    iget-wide v6, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->entryOffset:J

    iget-wide v8, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->entrySize:J

    cmp-long v6, v6, v8

    if-ltz v6, :cond_0

    .line 456
    const/4 v6, -0x1

    .line 516
    :goto_0
    return v6

    .line 459
    :cond_0
    int-to-long v6, p3

    iget-wide v8, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->entryOffset:J

    add-long/2addr v6, v8

    iget-wide v8, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->entrySize:J

    cmp-long v6, v6, v8

    if-lez v6, :cond_1

    .line 460
    iget-wide v6, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->entrySize:J

    iget-wide v8, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->entryOffset:J

    sub-long/2addr v6, v8

    long-to-int p3, v6

    .line 463
    :cond_1
    iget-object v6, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->readBuf:[B

    if-eqz v6, :cond_2

    .line 464
    iget-object v6, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->readBuf:[B

    array-length v6, v6

    if-le p3, v6, :cond_3

    iget-object v6, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->readBuf:[B

    array-length v4, v6

    .line 467
    .local v4, "sz":I
    :goto_1
    iget-object v6, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->readBuf:[B

    invoke-static {v6, v10, p1, p2, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 469
    iget-object v6, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->readBuf:[B

    array-length v6, v6

    if-lt v4, v6, :cond_4

    .line 470
    const/4 v6, 0x0

    iput-object v6, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->readBuf:[B

    .line 480
    :goto_2
    add-int/2addr v5, v4

    .line 481
    sub-int/2addr p3, v4

    .line 482
    add-int/2addr p2, v4

    .line 485
    .end local v4    # "sz":I
    :cond_2
    :goto_3
    if-lez p3, :cond_7

    .line 486
    iget-object v6, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->buffer:Lorg/apache/commons/compress/archivers/tar/TarBuffer;

    invoke-virtual {v6}, Lorg/apache/commons/compress/archivers/tar/TarBuffer;->readRecord()[B

    move-result-object v2

    .line 488
    .local v2, "rec":[B
    if-nez v2, :cond_5

    .line 490
    new-instance v6, Ljava/io/IOException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "unexpected EOF with "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v8, " bytes unread. Occured at byte: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->getBytesRead()J

    move-result-wide v8

    invoke-virtual {v7, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v6

    .end local v2    # "rec":[B
    :cond_3
    move v4, p3

    .line 464
    goto :goto_1

    .line 472
    .restart local v4    # "sz":I
    :cond_4
    iget-object v6, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->readBuf:[B

    array-length v6, v6

    sub-int v1, v6, v4

    .line 473
    .local v1, "newLen":I
    new-array v0, v1, [B

    .line 475
    .local v0, "newBuf":[B
    iget-object v6, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->readBuf:[B

    invoke-static {v6, v4, v0, v10, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 477
    iput-object v0, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->readBuf:[B

    goto :goto_2

    .line 493
    .end local v0    # "newBuf":[B
    .end local v1    # "newLen":I
    .end local v4    # "sz":I
    .restart local v2    # "rec":[B
    :cond_5
    array-length v6, v2

    invoke-virtual {p0, v6}, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->count(I)V

    .line 494
    move v4, p3

    .line 495
    .restart local v4    # "sz":I
    array-length v3, v2

    .line 497
    .local v3, "recLen":I
    if-le v3, v4, :cond_6

    .line 498
    invoke-static {v2, v10, p1, p2, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 500
    sub-int v6, v3, v4

    new-array v6, v6, [B

    iput-object v6, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->readBuf:[B

    .line 502
    iget-object v6, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->readBuf:[B

    sub-int v7, v3, v4

    invoke-static {v2, v4, v6, v10, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 509
    :goto_4
    add-int/2addr v5, v4

    .line 510
    sub-int/2addr p3, v4

    .line 511
    add-int/2addr p2, v4

    .line 512
    goto :goto_3

    .line 504
    :cond_6
    move v4, v3

    .line 506
    invoke-static {v2, v10, p1, p2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_4

    .line 514
    .end local v2    # "rec":[B
    .end local v3    # "recLen":I
    .end local v4    # "sz":I
    :cond_7
    iget-wide v6, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->entryOffset:J

    int-to-long v8, v5

    add-long/2addr v6, v8

    iput-wide v6, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->entryOffset:J

    move v6, v5

    .line 516
    goto/16 :goto_0
.end method

.method public declared-synchronized reset()V
    .locals 0

    .prologue
    .line 196
    monitor-enter p0

    monitor-exit p0

    return-void
.end method

.method protected final setAtEOF(Z)V
    .locals 0
    .param p1, "b"    # Z

    .prologue
    .line 546
    iput-boolean p1, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->hasHitEOF:Z

    .line 547
    return-void
.end method

.method protected final setCurrentEntry(Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;)V
    .locals 0
    .param p1, "e"    # Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;

    .prologue
    .line 538
    iput-object p1, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->currEntry:Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;

    .line 539
    return-void
.end method

.method public skip(J)J
    .locals 9
    .param p1, "numToSkip"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 178
    const/16 v5, 0x2000

    new-array v4, v5, [B

    .line 179
    .local v4, "skipBuf":[B
    move-wide v2, p1

    .line 180
    .local v2, "skip":J
    :goto_0
    const-wide/16 v6, 0x0

    cmp-long v5, v2, v6

    if-lez v5, :cond_0

    .line 181
    array-length v5, v4

    int-to-long v6, v5

    cmp-long v5, v2, v6

    if-lez v5, :cond_1

    array-length v5, v4

    int-to-long v6, v5

    :goto_1
    long-to-int v1, v6

    .line 182
    .local v1, "realSkip":I
    const/4 v5, 0x0

    invoke-virtual {p0, v4, v5, v1}, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->read([BII)I

    move-result v0

    .line 183
    .local v0, "numRead":I
    const/4 v5, -0x1

    if-ne v0, v5, :cond_2

    .line 188
    .end local v0    # "numRead":I
    .end local v1    # "realSkip":I
    :cond_0
    sub-long v6, p1, v2

    return-wide v6

    :cond_1
    move-wide v6, v2

    .line 181
    goto :goto_1

    .line 186
    .restart local v0    # "numRead":I
    .restart local v1    # "realSkip":I
    :cond_2
    int-to-long v6, v0

    sub-long/2addr v2, v6

    .line 187
    goto :goto_0
.end method
