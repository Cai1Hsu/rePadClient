.class public Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;
.super Lorg/apache/commons/compress/archivers/ArchiveInputStream;
.source "DumpArchiveInputStream.java"


# instance fields
.field private active:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;

.field private blockBuffer:[B

.field private entryOffset:J

.field private entrySize:J

.field private filepos:J

.field private hasHitEOF:Z

.field private isClosed:Z

.field private names:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Integer;",
            "Lorg/apache/commons/compress/archivers/dump/Dirent;",
            ">;"
        }
    .end annotation
.end field

.field private pending:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Integer;",
            "Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;",
            ">;"
        }
    .end annotation
.end field

.field private queue:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue",
            "<",
            "Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;",
            ">;"
        }
    .end annotation
.end field

.field protected raw:Lorg/apache/commons/compress/archivers/dump/TapeInputStream;

.field private readBuf:[B

.field private readIdx:I

.field private recordOffset:I

.field private summary:Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;


# direct methods
.method public constructor <init>(Ljava/io/InputStream;)V
    .locals 7
    .param p1, "is"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/compress/archivers/ArchiveException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x2

    .line 73
    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/ArchiveInputStream;-><init>()V

    .line 52
    const/16 v3, 0x400

    new-array v3, v3, [B

    iput-object v3, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->readBuf:[B

    .line 59
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    iput-object v3, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->names:Ljava/util/Map;

    .line 62
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    iput-object v3, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->pending:Ljava/util/Map;

    .line 74
    new-instance v3, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;

    invoke-direct {v3, p1}, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;-><init>(Ljava/io/InputStream;)V

    iput-object v3, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->raw:Lorg/apache/commons/compress/archivers/dump/TapeInputStream;

    .line 75
    const/4 v3, 0x0

    iput-boolean v3, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->hasHitEOF:Z

    .line 79
    :try_start_0
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->raw:Lorg/apache/commons/compress/archivers/dump/TapeInputStream;

    invoke-virtual {v3}, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->readRecord()[B

    move-result-object v1

    .line 81
    .local v1, "headerBytes":[B
    invoke-static {v1}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveUtil;->verify([B)Z

    move-result v3

    if-nez v3, :cond_0

    .line 82
    new-instance v3, Lorg/apache/commons/compress/archivers/dump/UnrecognizedFormatException;

    invoke-direct {v3}, Lorg/apache/commons/compress/archivers/dump/UnrecognizedFormatException;-><init>()V

    throw v3
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 97
    .end local v1    # "headerBytes":[B
    :catch_0
    move-exception v0

    .line 98
    .local v0, "ex":Ljava/io/IOException;
    new-instance v3, Lorg/apache/commons/compress/archivers/ArchiveException;

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v0}, Lorg/apache/commons/compress/archivers/ArchiveException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v3

    .line 86
    .end local v0    # "ex":Ljava/io/IOException;
    .restart local v1    # "headerBytes":[B
    :cond_0
    :try_start_1
    new-instance v3, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;

    invoke-direct {v3, v1}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;-><init>([B)V

    iput-object v3, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->summary:Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;

    .line 89
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->raw:Lorg/apache/commons/compress/archivers/dump/TapeInputStream;

    iget-object v4, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->summary:Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;

    invoke-virtual {v4}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->getNTRec()I

    move-result v4

    iget-object v5, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->summary:Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;

    invoke-virtual {v5}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->isCompressed()Z

    move-result v5

    invoke-virtual {v3, v4, v5}, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->resetBlockSize(IZ)V

    .line 92
    const/16 v3, 0x1000

    new-array v3, v3, [B

    iput-object v3, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->blockBuffer:[B

    .line 95
    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->readCLRI()V

    .line 96
    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->readBITS()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 102
    new-instance v2, Lorg/apache/commons/compress/archivers/dump/Dirent;

    const/4 v3, 0x4

    const-string/jumbo v4, "."

    invoke-direct {v2, v6, v6, v3, v4}, Lorg/apache/commons/compress/archivers/dump/Dirent;-><init>(IIILjava/lang/String;)V

    .line 103
    .local v2, "root":Lorg/apache/commons/compress/archivers/dump/Dirent;
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->names:Ljava/util/Map;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v3, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 107
    new-instance v3, Ljava/util/PriorityQueue;

    const/16 v4, 0xa

    new-instance v5, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream$1;

    invoke-direct {v5, p0}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream$1;-><init>(Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;)V

    invoke-direct {v3, v4, v5}, Ljava/util/PriorityQueue;-><init>(ILjava/util/Comparator;)V

    iput-object v3, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->queue:Ljava/util/Queue;

    .line 117
    return-void
.end method

.method private getPath(Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;)Ljava/lang/String;
    .locals 6
    .param p1, "entry"    # Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;

    .prologue
    .line 387
    new-instance v1, Ljava/util/Stack;

    invoke-direct {v1}, Ljava/util/Stack;-><init>()V

    .line 388
    .local v1, "elements":Ljava/util/Stack;, "Ljava/util/Stack<Ljava/lang/String;>;"
    const/4 v0, 0x0

    .line 390
    .local v0, "dirent":Lorg/apache/commons/compress/archivers/dump/Dirent;
    invoke-virtual {p1}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->getIno()I

    move-result v2

    .line 391
    .local v2, "i":I
    :goto_0
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->names:Ljava/util/Map;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 392
    invoke-virtual {v1}, Ljava/util/Stack;->clear()V

    .line 405
    :cond_0
    invoke-virtual {v1}, Ljava/util/Stack;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 406
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->pending:Ljava/util/Map;

    invoke-virtual {p1}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->getIno()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v4, v5, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 408
    const/4 v4, 0x0

    .line 419
    :goto_1
    return-object v4

    .line 396
    :cond_1
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->names:Ljava/util/Map;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "dirent":Lorg/apache/commons/compress/archivers/dump/Dirent;
    check-cast v0, Lorg/apache/commons/compress/archivers/dump/Dirent;

    .line 397
    .restart local v0    # "dirent":Lorg/apache/commons/compress/archivers/dump/Dirent;
    invoke-virtual {v0}, Lorg/apache/commons/compress/archivers/dump/Dirent;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    .line 399
    invoke-virtual {v0}, Lorg/apache/commons/compress/archivers/dump/Dirent;->getIno()I

    move-result v4

    invoke-virtual {v0}, Lorg/apache/commons/compress/archivers/dump/Dirent;->getParentIno()I

    move-result v5

    if-eq v4, v5, :cond_0

    .line 390
    invoke-virtual {v0}, Lorg/apache/commons/compress/archivers/dump/Dirent;->getParentIno()I

    move-result v2

    goto :goto_0

    .line 412
    :cond_2
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 414
    .local v3, "sb":Ljava/lang/StringBuilder;
    :goto_2
    invoke-virtual {v1}, Ljava/util/Stack;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_3

    .line 415
    const/16 v4, 0x2f

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 416
    invoke-virtual {v1}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 419
    :cond_3
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_1
.end method

.method public static matches([BI)Z
    .locals 3
    .param p0, "buffer"    # [B
    .param p1, "length"    # I

    .prologue
    const/4 v0, 0x0

    .line 509
    const/16 v1, 0x20

    if-ge p1, v1, :cond_1

    .line 519
    :cond_0
    :goto_0
    return v0

    .line 514
    :cond_1
    const/16 v1, 0x400

    if-lt p1, v1, :cond_2

    .line 515
    invoke-static {p0}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveUtil;->verify([B)Z

    move-result v0

    goto :goto_0

    .line 519
    :cond_2
    const v1, 0xea6c

    const/16 v2, 0x18

    invoke-static {p0, v2}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveUtil;->convert32([BI)I

    move-result v2

    if-ne v1, v2, :cond_0

    const/4 v0, 0x1

    goto :goto_0
.end method

.method private readBITS()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 165
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->raw:Lorg/apache/commons/compress/archivers/dump/TapeInputStream;

    invoke-virtual {v1}, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->readRecord()[B

    move-result-object v0

    .line 167
    .local v0, "readBuf":[B
    invoke-static {v0}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveUtil;->verify([B)Z

    move-result v1

    if-nez v1, :cond_0

    .line 168
    new-instance v1, Lorg/apache/commons/compress/archivers/dump/InvalidFormatException;

    invoke-direct {v1}, Lorg/apache/commons/compress/archivers/dump/InvalidFormatException;-><init>()V

    throw v1

    .line 171
    :cond_0
    invoke-static {v0}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->parse([B)Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->active:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;

    .line 173
    sget-object v1, Lorg/apache/commons/compress/archivers/dump/DumpArchiveConstants$SEGMENT_TYPE;->BITS:Lorg/apache/commons/compress/archivers/dump/DumpArchiveConstants$SEGMENT_TYPE;

    iget-object v2, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->active:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;

    invoke-virtual {v2}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->getHeaderType()Lorg/apache/commons/compress/archivers/dump/DumpArchiveConstants$SEGMENT_TYPE;

    move-result-object v2

    if-eq v1, v2, :cond_1

    .line 174
    new-instance v1, Lorg/apache/commons/compress/archivers/dump/InvalidFormatException;

    invoke-direct {v1}, Lorg/apache/commons/compress/archivers/dump/InvalidFormatException;-><init>()V

    throw v1

    .line 178
    :cond_1
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->raw:Lorg/apache/commons/compress/archivers/dump/TapeInputStream;

    iget-object v2, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->active:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;

    invoke-virtual {v2}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->getHeaderCount()I

    move-result v2

    mul-int/lit16 v2, v2, 0x400

    int-to-long v2, v2

    invoke-virtual {v1, v2, v3}, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->skip(J)J

    move-result-wide v2

    const-wide/16 v4, -0x1

    cmp-long v1, v2, v4

    if-nez v1, :cond_2

    .line 180
    new-instance v1, Ljava/io/EOFException;

    invoke-direct {v1}, Ljava/io/EOFException;-><init>()V

    throw v1

    .line 182
    :cond_2
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->active:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;

    invoke-virtual {v1}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->getHeaderCount()I

    move-result v1

    iput v1, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->readIdx:I

    .line 183
    return-void
.end method

.method private readCLRI()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 141
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->raw:Lorg/apache/commons/compress/archivers/dump/TapeInputStream;

    invoke-virtual {v1}, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->readRecord()[B

    move-result-object v0

    .line 143
    .local v0, "readBuf":[B
    invoke-static {v0}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveUtil;->verify([B)Z

    move-result v1

    if-nez v1, :cond_0

    .line 144
    new-instance v1, Lorg/apache/commons/compress/archivers/dump/InvalidFormatException;

    invoke-direct {v1}, Lorg/apache/commons/compress/archivers/dump/InvalidFormatException;-><init>()V

    throw v1

    .line 147
    :cond_0
    invoke-static {v0}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->parse([B)Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->active:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;

    .line 149
    sget-object v1, Lorg/apache/commons/compress/archivers/dump/DumpArchiveConstants$SEGMENT_TYPE;->CLRI:Lorg/apache/commons/compress/archivers/dump/DumpArchiveConstants$SEGMENT_TYPE;

    iget-object v2, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->active:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;

    invoke-virtual {v2}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->getHeaderType()Lorg/apache/commons/compress/archivers/dump/DumpArchiveConstants$SEGMENT_TYPE;

    move-result-object v2

    if-eq v1, v2, :cond_1

    .line 150
    new-instance v1, Lorg/apache/commons/compress/archivers/dump/InvalidFormatException;

    invoke-direct {v1}, Lorg/apache/commons/compress/archivers/dump/InvalidFormatException;-><init>()V

    throw v1

    .line 154
    :cond_1
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->raw:Lorg/apache/commons/compress/archivers/dump/TapeInputStream;

    iget-object v2, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->active:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;

    invoke-virtual {v2}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->getHeaderCount()I

    move-result v2

    mul-int/lit16 v2, v2, 0x400

    int-to-long v2, v2

    invoke-virtual {v1, v2, v3}, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->skip(J)J

    move-result-wide v2

    const-wide/16 v4, -0x1

    cmp-long v1, v2, v4

    if-nez v1, :cond_2

    .line 156
    new-instance v1, Ljava/io/EOFException;

    invoke-direct {v1}, Ljava/io/EOFException;-><init>()V

    throw v1

    .line 158
    :cond_2
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->active:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;

    invoke-virtual {v1}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->getHeaderCount()I

    move-result v1

    iput v1, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->readIdx:I

    .line 159
    return-void
.end method

.method private readDirectoryEntry(Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;)V
    .locals 24
    .param p1, "entry"    # Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 295
    invoke-virtual/range {p1 .. p1}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->getEntrySize()J

    move-result-wide v16

    .line 296
    .local v16, "size":J
    const/4 v8, 0x1

    .line 298
    .local v8, "first":Z
    :goto_0
    if-nez v8, :cond_0

    sget-object v19, Lorg/apache/commons/compress/archivers/dump/DumpArchiveConstants$SEGMENT_TYPE;->ADDR:Lorg/apache/commons/compress/archivers/dump/DumpArchiveConstants$SEGMENT_TYPE;

    invoke-virtual/range {p1 .. p1}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->getHeaderType()Lorg/apache/commons/compress/archivers/dump/DumpArchiveConstants$SEGMENT_TYPE;

    move-result-object v20

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    if-ne v0, v1, :cond_b

    .line 301
    :cond_0
    if-nez v8, :cond_1

    .line 302
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->raw:Lorg/apache/commons/compress/archivers/dump/TapeInputStream;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->readRecord()[B

    .line 305
    :cond_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->names:Ljava/util/Map;

    move-object/from16 v19, v0

    invoke-virtual/range {p1 .. p1}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->getIno()I

    move-result v20

    invoke-static/range {v20 .. v20}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v20

    invoke-interface/range {v19 .. v20}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v19

    if-nez v19, :cond_2

    sget-object v19, Lorg/apache/commons/compress/archivers/dump/DumpArchiveConstants$SEGMENT_TYPE;->INODE:Lorg/apache/commons/compress/archivers/dump/DumpArchiveConstants$SEGMENT_TYPE;

    invoke-virtual/range {p1 .. p1}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->getHeaderType()Lorg/apache/commons/compress/archivers/dump/DumpArchiveConstants$SEGMENT_TYPE;

    move-result-object v20

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    if-ne v0, v1, :cond_2

    .line 307
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->pending:Ljava/util/Map;

    move-object/from16 v19, v0

    invoke-virtual/range {p1 .. p1}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->getIno()I

    move-result v20

    invoke-static/range {v20 .. v20}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v20

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    move-object/from16 v2, p1

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 310
    :cond_2
    invoke-virtual/range {p1 .. p1}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->getHeaderCount()I

    move-result v19

    move/from16 v0, v19

    mul-int/lit16 v5, v0, 0x400

    .line 312
    .local v5, "datalen":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->blockBuffer:[B

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    array-length v0, v0

    move/from16 v19, v0

    move/from16 v0, v19

    if-ge v0, v5, :cond_3

    .line 313
    new-array v0, v5, [B

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->blockBuffer:[B

    .line 316
    :cond_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->raw:Lorg/apache/commons/compress/archivers/dump/TapeInputStream;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->blockBuffer:[B

    move-object/from16 v20, v0

    const/16 v21, 0x0

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    move/from16 v2, v21

    invoke-virtual {v0, v1, v2, v5}, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->read([BII)I

    move-result v19

    move/from16 v0, v19

    if-eq v0, v5, :cond_4

    .line 317
    new-instance v19, Ljava/io/EOFException;

    invoke-direct/range {v19 .. v19}, Ljava/io/EOFException;-><init>()V

    throw v19

    .line 320
    :cond_4
    const/4 v15, 0x0

    .line 322
    .local v15, "reclen":I
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_1
    add-int/lit8 v19, v5, -0x8

    move/from16 v0, v19

    if-ge v9, v0, :cond_9

    int-to-long v0, v9

    move-wide/from16 v20, v0

    const-wide/16 v22, 0x8

    sub-long v22, v16, v22

    cmp-long v19, v20, v22

    if-gez v19, :cond_9

    .line 324
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->blockBuffer:[B

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-static {v0, v9}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveUtil;->convert32([BI)I

    move-result v11

    .line 325
    .local v11, "ino":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->blockBuffer:[B

    move-object/from16 v19, v0

    add-int/lit8 v20, v9, 0x4

    invoke-static/range {v19 .. v20}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveUtil;->convert16([BI)I

    move-result v15

    .line 327
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->blockBuffer:[B

    move-object/from16 v19, v0

    add-int/lit8 v20, v9, 0x6

    aget-byte v18, v19, v20

    .line 329
    .local v18, "type":B
    new-instance v12, Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->blockBuffer:[B

    move-object/from16 v19, v0

    add-int/lit8 v20, v9, 0x8

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->blockBuffer:[B

    move-object/from16 v21, v0

    add-int/lit8 v22, v9, 0x7

    aget-byte v21, v21, v22

    move-object/from16 v0, v19

    move/from16 v1, v20

    move/from16 v2, v21

    invoke-direct {v12, v0, v1, v2}, Ljava/lang/String;-><init>([BII)V

    .line 331
    .local v12, "name":Ljava/lang/String;
    const-string/jumbo v19, "."

    move-object/from16 v0, v19

    invoke-virtual {v0, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-nez v19, :cond_5

    const-string/jumbo v19, ".."

    move-object/from16 v0, v19

    invoke-virtual {v0, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_6

    .line 323
    :cond_5
    add-int/2addr v9, v15

    goto :goto_1

    .line 336
    :cond_6
    new-instance v4, Lorg/apache/commons/compress/archivers/dump/Dirent;

    invoke-virtual/range {p1 .. p1}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->getIno()I

    move-result v19

    move/from16 v0, v19

    move/from16 v1, v18

    invoke-direct {v4, v11, v0, v1, v12}, Lorg/apache/commons/compress/archivers/dump/Dirent;-><init>(IIILjava/lang/String;)V

    .line 345
    .local v4, "d":Lorg/apache/commons/compress/archivers/dump/Dirent;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->names:Ljava/util/Map;

    move-object/from16 v19, v0

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v20

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-interface {v0, v1, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 348
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->pending:Ljava/util/Map;

    move-object/from16 v19, v0

    invoke-interface/range {v19 .. v19}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v19

    invoke-interface/range {v19 .. v19}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v10

    .local v10, "i$":Ljava/util/Iterator;
    :cond_7
    :goto_2
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v19

    if-eqz v19, :cond_8

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/Map$Entry;

    .line 349
    .local v7, "e":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Integer;Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;>;"
    invoke-interface {v7}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v1}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->getPath(Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;)Ljava/lang/String;

    move-result-object v13

    .line 351
    .local v13, "path":Ljava/lang/String;
    if-eqz v13, :cond_7

    .line 352
    invoke-interface {v7}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;

    move-object/from16 v0, v19

    invoke-virtual {v0, v13}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->setName(Ljava/lang/String;)V

    .line 353
    invoke-interface {v7}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->names:Ljava/util/Map;

    move-object/from16 v20, v0

    invoke-interface {v7}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v21

    invoke-interface/range {v20 .. v21}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Lorg/apache/commons/compress/archivers/dump/Dirent;

    invoke-virtual/range {v20 .. v20}, Lorg/apache/commons/compress/archivers/dump/Dirent;->getName()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->setSimpleName(Ljava/lang/String;)V

    .line 355
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->queue:Ljava/util/Queue;

    move-object/from16 v19, v0

    invoke-interface {v7}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v20

    invoke-interface/range {v19 .. v20}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 361
    .end local v7    # "e":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Integer;Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;>;"
    .end local v13    # "path":Ljava/lang/String;
    :cond_8
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->queue:Ljava/util/Queue;

    move-object/from16 v19, v0

    invoke-interface/range {v19 .. v19}, Ljava/util/Queue;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :goto_3
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v19

    if-eqz v19, :cond_5

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;

    .line 362
    .local v6, "e":Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->pending:Ljava/util/Map;

    move-object/from16 v19, v0

    invoke-virtual {v6}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->getIno()I

    move-result v20

    invoke-static/range {v20 .. v20}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v20

    invoke-interface/range {v19 .. v20}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_3

    .line 366
    .end local v4    # "d":Lorg/apache/commons/compress/archivers/dump/Dirent;
    .end local v6    # "e":Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;
    .end local v10    # "i$":Ljava/util/Iterator;
    .end local v11    # "ino":I
    .end local v12    # "name":Ljava/lang/String;
    .end local v18    # "type":B
    :cond_9
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->raw:Lorg/apache/commons/compress/archivers/dump/TapeInputStream;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->peek()[B

    move-result-object v14

    .line 368
    .local v14, "peekBytes":[B
    invoke-static {v14}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveUtil;->verify([B)Z

    move-result v19

    if-nez v19, :cond_a

    .line 369
    new-instance v19, Lorg/apache/commons/compress/archivers/dump/InvalidFormatException;

    invoke-direct/range {v19 .. v19}, Lorg/apache/commons/compress/archivers/dump/InvalidFormatException;-><init>()V

    throw v19

    .line 372
    :cond_a
    invoke-static {v14}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->parse([B)Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;

    move-result-object p1

    .line 373
    const/4 v8, 0x0

    .line 374
    const-wide/16 v20, 0x400

    sub-long v16, v16, v20

    .line 375
    goto/16 :goto_0

    .line 376
    .end local v5    # "datalen":I
    .end local v9    # "i":I
    .end local v14    # "peekBytes":[B
    .end local v15    # "reclen":I
    :cond_b
    return-void
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
    .line 496
    iget-boolean v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->isClosed:Z

    if-nez v0, :cond_0

    .line 497
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->isClosed:Z

    .line 498
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->raw:Lorg/apache/commons/compress/archivers/dump/TapeInputStream;

    invoke-virtual {v0}, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->close()V

    .line 500
    :cond_0
    return-void
.end method

.method public getBytesRead()J
    .locals 2

    .prologue
    .line 127
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->raw:Lorg/apache/commons/compress/archivers/dump/TapeInputStream;

    invoke-virtual {v0}, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->getBytesRead()J

    move-result-wide v0

    return-wide v0
.end method

.method public getCount()I
    .locals 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 122
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->getBytesRead()J

    move-result-wide v0

    long-to-int v0, v0

    return v0
.end method

.method public getNextDumpEntry()Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 189
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->getNextEntry()Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getNextEntry()Lorg/apache/commons/compress/archivers/ArchiveEntry;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 44
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->getNextEntry()Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;

    move-result-object v0

    return-object v0
.end method

.method public getNextEntry()Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;
    .locals 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/16 v12, -0x1

    const/4 v3, 0x0

    const/4 v11, 0x1

    const/4 v10, 0x0

    const-wide/16 v8, 0x0

    .line 197
    const/4 v0, 0x0

    .line 198
    .local v0, "entry":Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;
    const/4 v2, 0x0

    .line 201
    .local v2, "path":Ljava/lang/String;
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->queue:Ljava/util/Queue;

    invoke-interface {v4}, Ljava/util/Queue;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_2

    .line 202
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->queue:Ljava/util/Queue;

    invoke-interface {v3}, Ljava/util/Queue;->remove()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;

    .line 287
    :cond_0
    :goto_0
    return-object v3

    .line 259
    .local v1, "headerBytes":[B
    :cond_1
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->active:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;

    .line 261
    invoke-virtual {v0}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->isDirectory()Z

    move-result v4

    if-eqz v4, :cond_9

    .line 262
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->active:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;

    invoke-direct {p0, v4}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->readDirectoryEntry(Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;)V

    .line 265
    iput-wide v8, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->entryOffset:J

    .line 266
    iput-wide v8, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->entrySize:J

    .line 267
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->active:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;

    invoke-virtual {v4}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->getHeaderCount()I

    move-result v4

    iput v4, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->readIdx:I

    .line 274
    :goto_1
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->readBuf:[B

    array-length v4, v4

    iput v4, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->recordOffset:I

    .line 276
    invoke-direct {p0, v0}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->getPath(Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;)Ljava/lang/String;

    move-result-object v2

    .line 278
    if-nez v2, :cond_2

    .line 279
    const/4 v0, 0x0

    .line 205
    .end local v1    # "headerBytes":[B
    :cond_2
    if-nez v0, :cond_a

    .line 206
    iget-boolean v4, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->hasHitEOF:Z

    if-nez v4, :cond_0

    .line 214
    :cond_3
    iget v4, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->readIdx:I

    iget-object v5, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->active:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;

    invoke-virtual {v5}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->getHeaderCount()I

    move-result v5

    if-ge v4, v5, :cond_4

    .line 215
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->active:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;

    iget v5, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->readIdx:I

    add-int/lit8 v6, v5, 0x1

    iput v6, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->readIdx:I

    invoke-virtual {v4, v5}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->isSparseRecord(I)Z

    move-result v4

    if-nez v4, :cond_3

    iget-object v4, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->raw:Lorg/apache/commons/compress/archivers/dump/TapeInputStream;

    const-wide/16 v6, 0x400

    invoke-virtual {v4, v6, v7}, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->skip(J)J

    move-result-wide v4

    cmp-long v4, v4, v12

    if-nez v4, :cond_3

    .line 217
    new-instance v3, Ljava/io/EOFException;

    invoke-direct {v3}, Ljava/io/EOFException;-><init>()V

    throw v3

    .line 221
    :cond_4
    iput v10, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->readIdx:I

    .line 222
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->raw:Lorg/apache/commons/compress/archivers/dump/TapeInputStream;

    invoke-virtual {v4}, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->getBytesRead()J

    move-result-wide v4

    iput-wide v4, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->filepos:J

    .line 224
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->raw:Lorg/apache/commons/compress/archivers/dump/TapeInputStream;

    invoke-virtual {v4}, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->readRecord()[B

    move-result-object v1

    .line 226
    .restart local v1    # "headerBytes":[B
    invoke-static {v1}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveUtil;->verify([B)Z

    move-result v4

    if-nez v4, :cond_5

    .line 227
    new-instance v3, Lorg/apache/commons/compress/archivers/dump/InvalidFormatException;

    invoke-direct {v3}, Lorg/apache/commons/compress/archivers/dump/InvalidFormatException;-><init>()V

    throw v3

    .line 230
    :cond_5
    invoke-static {v1}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->parse([B)Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;

    move-result-object v4

    iput-object v4, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->active:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;

    .line 233
    :goto_2
    sget-object v4, Lorg/apache/commons/compress/archivers/dump/DumpArchiveConstants$SEGMENT_TYPE;->ADDR:Lorg/apache/commons/compress/archivers/dump/DumpArchiveConstants$SEGMENT_TYPE;

    iget-object v5, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->active:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;

    invoke-virtual {v5}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->getHeaderType()Lorg/apache/commons/compress/archivers/dump/DumpArchiveConstants$SEGMENT_TYPE;

    move-result-object v5

    if-ne v4, v5, :cond_8

    .line 234
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->raw:Lorg/apache/commons/compress/archivers/dump/TapeInputStream;

    iget-object v5, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->active:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;

    invoke-virtual {v5}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->getHeaderCount()I

    move-result v5

    iget-object v6, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->active:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;

    invoke-virtual {v6}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->getHeaderHoles()I

    move-result v6

    sub-int/2addr v5, v6

    mul-int/lit16 v5, v5, 0x400

    int-to-long v6, v5

    invoke-virtual {v4, v6, v7}, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->skip(J)J

    move-result-wide v4

    cmp-long v4, v4, v12

    if-nez v4, :cond_6

    .line 237
    new-instance v3, Ljava/io/EOFException;

    invoke-direct {v3}, Ljava/io/EOFException;-><init>()V

    throw v3

    .line 240
    :cond_6
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->raw:Lorg/apache/commons/compress/archivers/dump/TapeInputStream;

    invoke-virtual {v4}, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->getBytesRead()J

    move-result-wide v4

    iput-wide v4, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->filepos:J

    .line 241
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->raw:Lorg/apache/commons/compress/archivers/dump/TapeInputStream;

    invoke-virtual {v4}, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->readRecord()[B

    move-result-object v1

    .line 243
    invoke-static {v1}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveUtil;->verify([B)Z

    move-result v4

    if-nez v4, :cond_7

    .line 244
    new-instance v3, Lorg/apache/commons/compress/archivers/dump/InvalidFormatException;

    invoke-direct {v3}, Lorg/apache/commons/compress/archivers/dump/InvalidFormatException;-><init>()V

    throw v3

    .line 247
    :cond_7
    invoke-static {v1}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->parse([B)Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;

    move-result-object v4

    iput-object v4, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->active:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;

    goto :goto_2

    .line 251
    :cond_8
    sget-object v4, Lorg/apache/commons/compress/archivers/dump/DumpArchiveConstants$SEGMENT_TYPE;->END:Lorg/apache/commons/compress/archivers/dump/DumpArchiveConstants$SEGMENT_TYPE;

    iget-object v5, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->active:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;

    invoke-virtual {v5}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->getHeaderType()Lorg/apache/commons/compress/archivers/dump/DumpArchiveConstants$SEGMENT_TYPE;

    move-result-object v5

    if-ne v4, v5, :cond_1

    .line 252
    iput-boolean v11, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->hasHitEOF:Z

    .line 253
    iput-boolean v11, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->isClosed:Z

    .line 254
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->raw:Lorg/apache/commons/compress/archivers/dump/TapeInputStream;

    invoke-virtual {v4}, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->close()V

    goto/16 :goto_0

    .line 269
    :cond_9
    iput-wide v8, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->entryOffset:J

    .line 270
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->active:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;

    invoke-virtual {v4}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->getEntrySize()J

    move-result-wide v4

    iput-wide v4, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->entrySize:J

    .line 271
    iput v10, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->readIdx:I

    goto/16 :goto_1

    .line 283
    .end local v1    # "headerBytes":[B
    :cond_a
    invoke-virtual {v0, v2}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->setName(Ljava/lang/String;)V

    .line 284
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->names:Ljava/util/Map;

    invoke-virtual {v0}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->getIno()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/apache/commons/compress/archivers/dump/Dirent;

    invoke-virtual {v3}, Lorg/apache/commons/compress/archivers/dump/Dirent;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->setSimpleName(Ljava/lang/String;)V

    .line 285
    iget-wide v4, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->filepos:J

    invoke-virtual {v0, v4, v5}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->setOffset(J)V

    move-object v3, v0

    .line 287
    goto/16 :goto_0
.end method

.method public getSummary()Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;
    .locals 1

    .prologue
    .line 134
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->summary:Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;

    return-object v0
.end method

.method public read([BII)I
    .locals 9
    .param p1, "buf"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x0

    .line 437
    const/4 v3, 0x0

    .line 439
    .local v3, "totalRead":I
    iget-boolean v4, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->isClosed:Z

    if-nez v4, :cond_0

    iget-wide v4, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->entryOffset:J

    iget-wide v6, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->entrySize:J

    cmp-long v4, v4, v6

    if-ltz v4, :cond_1

    .line 440
    :cond_0
    const/4 v4, -0x1

    .line 488
    :goto_0
    return v4

    .line 443
    :cond_1
    int-to-long v4, p3

    iget-wide v6, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->entryOffset:J

    add-long/2addr v4, v6

    iget-wide v6, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->entrySize:J

    cmp-long v4, v4, v6

    if-lez v4, :cond_2

    .line 444
    iget-wide v4, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->entrySize:J

    iget-wide v6, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->entryOffset:J

    sub-long/2addr v4, v6

    long-to-int p3, v4

    .line 447
    :cond_2
    :goto_1
    if-lez p3, :cond_9

    .line 448
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->readBuf:[B

    array-length v4, v4

    iget v5, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->recordOffset:I

    sub-int/2addr v4, v5

    if-le p3, v4, :cond_4

    iget-object v4, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->readBuf:[B

    array-length v4, v4

    iget v5, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->recordOffset:I

    sub-int v2, v4, v5

    .line 452
    .local v2, "sz":I
    :goto_2
    iget v4, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->recordOffset:I

    add-int/2addr v4, v2

    iget-object v5, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->readBuf:[B

    array-length v5, v5

    if-gt v4, v5, :cond_3

    .line 453
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->readBuf:[B

    iget v5, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->recordOffset:I

    invoke-static {v4, v5, p1, p2, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 454
    add-int/2addr v3, v2

    .line 455
    iget v4, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->recordOffset:I

    add-int/2addr v4, v2

    iput v4, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->recordOffset:I

    .line 456
    sub-int/2addr p3, v2

    .line 457
    add-int/2addr p2, v2

    .line 461
    :cond_3
    if-lez p3, :cond_2

    .line 462
    iget v4, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->readIdx:I

    const/16 v5, 0x200

    if-lt v4, v5, :cond_6

    .line 463
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->raw:Lorg/apache/commons/compress/archivers/dump/TapeInputStream;

    invoke-virtual {v4}, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->readRecord()[B

    move-result-object v0

    .line 465
    .local v0, "headerBytes":[B
    invoke-static {v0}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveUtil;->verify([B)Z

    move-result v4

    if-nez v4, :cond_5

    .line 466
    new-instance v4, Lorg/apache/commons/compress/archivers/dump/InvalidFormatException;

    invoke-direct {v4}, Lorg/apache/commons/compress/archivers/dump/InvalidFormatException;-><init>()V

    throw v4

    .end local v0    # "headerBytes":[B
    .end local v2    # "sz":I
    :cond_4
    move v2, p3

    .line 448
    goto :goto_2

    .line 469
    .restart local v0    # "headerBytes":[B
    .restart local v2    # "sz":I
    :cond_5
    invoke-static {v0}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->parse([B)Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;

    move-result-object v4

    iput-object v4, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->active:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;

    .line 470
    iput v8, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->readIdx:I

    .line 473
    .end local v0    # "headerBytes":[B
    :cond_6
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->active:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;

    iget v5, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->readIdx:I

    add-int/lit8 v6, v5, 0x1

    iput v6, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->readIdx:I

    invoke-virtual {v4, v5}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->isSparseRecord(I)Z

    move-result v4

    if-nez v4, :cond_7

    .line 474
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->raw:Lorg/apache/commons/compress/archivers/dump/TapeInputStream;

    iget-object v5, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->readBuf:[B

    iget-object v6, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->readBuf:[B

    array-length v6, v6

    invoke-virtual {v4, v5, v8, v6}, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->read([BII)I

    move-result v1

    .line 475
    .local v1, "r":I
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->readBuf:[B

    array-length v4, v4

    if-eq v1, v4, :cond_8

    .line 476
    new-instance v4, Ljava/io/EOFException;

    invoke-direct {v4}, Ljava/io/EOFException;-><init>()V

    throw v4

    .line 479
    .end local v1    # "r":I
    :cond_7
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->readBuf:[B

    invoke-static {v4, v8}, Ljava/util/Arrays;->fill([BB)V

    .line 482
    :cond_8
    iput v8, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->recordOffset:I

    goto :goto_1

    .line 486
    .end local v2    # "sz":I
    :cond_9
    iget-wide v4, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->entryOffset:J

    int-to-long v6, v3

    add-long/2addr v4, v6

    iput-wide v4, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->entryOffset:J

    move v4, v3

    .line 488
    goto/16 :goto_0
.end method
