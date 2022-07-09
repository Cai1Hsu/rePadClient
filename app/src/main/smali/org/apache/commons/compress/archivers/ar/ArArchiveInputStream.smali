.class public Lorg/apache/commons/compress/archivers/ar/ArArchiveInputStream;
.super Lorg/apache/commons/compress/archivers/ArchiveInputStream;
.source "ArArchiveInputStream.java"


# static fields
.field private static final BSD_LONGNAME_PATTERN:Ljava/lang/String; = "^#1/\\d+"

.field static final BSD_LONGNAME_PREFIX:Ljava/lang/String; = "#1/"

.field private static final BSD_LONGNAME_PREFIX_LEN:I

.field private static final GNU_LONGNAME_PATTERN:Ljava/lang/String; = "^/\\d+"

.field private static final GNU_STRING_TABLE_NAME:Ljava/lang/String; = "//"


# instance fields
.field private closed:Z

.field private currentEntry:Lorg/apache/commons/compress/archivers/ar/ArArchiveEntry;

.field private entryOffset:J

.field private final input:Ljava/io/InputStream;

.field private namebuffer:[B

.field private offset:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 308
    const-string/jumbo v0, "#1/"

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    sput v0, Lorg/apache/commons/compress/archivers/ar/ArArchiveInputStream;->BSD_LONGNAME_PREFIX_LEN:I

    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;)V
    .locals 3
    .param p1, "pInput"    # Ljava/io/InputStream;

    .prologue
    const/4 v2, 0x0

    .line 62
    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/ArchiveInputStream;-><init>()V

    .line 38
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lorg/apache/commons/compress/archivers/ar/ArArchiveInputStream;->offset:J

    .line 45
    iput-object v2, p0, Lorg/apache/commons/compress/archivers/ar/ArArchiveInputStream;->currentEntry:Lorg/apache/commons/compress/archivers/ar/ArArchiveEntry;

    .line 48
    iput-object v2, p0, Lorg/apache/commons/compress/archivers/ar/ArArchiveInputStream;->namebuffer:[B

    .line 54
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lorg/apache/commons/compress/archivers/ar/ArArchiveInputStream;->entryOffset:J

    .line 63
    iput-object p1, p0, Lorg/apache/commons/compress/archivers/ar/ArArchiveInputStream;->input:Ljava/io/InputStream;

    .line 64
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/commons/compress/archivers/ar/ArArchiveInputStream;->closed:Z

    .line 65
    return-void
.end method

.method private asInt([B)I
    .locals 2
    .param p1, "input"    # [B

    .prologue
    .line 197
    const/16 v0, 0xa

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Lorg/apache/commons/compress/archivers/ar/ArArchiveInputStream;->asInt([BIZ)I

    move-result v0

    return v0
.end method

.method private asInt([BI)I
    .locals 1
    .param p1, "input"    # [B
    .param p2, "base"    # I

    .prologue
    .line 205
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lorg/apache/commons/compress/archivers/ar/ArArchiveInputStream;->asInt([BIZ)I

    move-result v0

    return v0
.end method

.method private asInt([BIZ)I
    .locals 2
    .param p1, "input"    # [B
    .param p2, "base"    # I
    .param p3, "treatBlankAsZero"    # Z

    .prologue
    .line 209
    invoke-static {p1}, Lorg/apache/commons/compress/utils/ArchiveUtils;->toAsciiString([B)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 210
    .local v0, "string":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_0

    if-eqz p3, :cond_0

    .line 211
    const/4 v1, 0x0

    .line 213
    :goto_0
    return v1

    :cond_0
    invoke-static {v0, p2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v1

    goto :goto_0
.end method

.method private asInt([BZ)I
    .locals 1
    .param p1, "input"    # [B
    .param p2, "treatBlankAsZero"    # Z

    .prologue
    .line 201
    const/16 v0, 0xa

    invoke-direct {p0, p1, v0, p2}, Lorg/apache/commons/compress/archivers/ar/ArArchiveInputStream;->asInt([BIZ)I

    move-result v0

    return v0
.end method

.method private asLong([B)J
    .locals 2
    .param p1, "input"    # [B

    .prologue
    .line 193
    invoke-static {p1}, Lorg/apache/commons/compress/utils/ArchiveUtils;->toAsciiString([B)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v0

    return-wide v0
.end method

.method private getBSDLongName(Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .param p1, "bsdLongName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 348
    sget v4, Lorg/apache/commons/compress/archivers/ar/ArArchiveInputStream;->BSD_LONGNAME_PREFIX_LEN:I

    invoke-virtual {p1, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    .line 350
    .local v1, "nameLen":I
    new-array v0, v1, [B

    .line 351
    .local v0, "name":[B
    const/4 v2, 0x0

    .local v2, "read":I
    const/4 v3, 0x0

    .line 352
    .local v3, "readNow":I
    :cond_0
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/ar/ArArchiveInputStream;->input:Ljava/io/InputStream;

    sub-int v5, v1, v2

    invoke-virtual {v4, v0, v2, v5}, Ljava/io/InputStream;->read([BII)I

    move-result v3

    if-ltz v3, :cond_1

    .line 353
    add-int/2addr v2, v3

    .line 354
    invoke-virtual {p0, v3}, Lorg/apache/commons/compress/archivers/ar/ArArchiveInputStream;->count(I)V

    .line 355
    if-ne v2, v1, :cond_0

    .line 359
    :cond_1
    if-eq v2, v1, :cond_2

    .line 360
    new-instance v4, Ljava/io/EOFException;

    invoke-direct {v4}, Ljava/io/EOFException;-><init>()V

    throw v4

    .line 362
    :cond_2
    invoke-static {v0}, Lorg/apache/commons/compress/utils/ArchiveUtils;->toAsciiString([B)Ljava/lang/String;

    move-result-object v4

    return-object v4
.end method

.method private getExtendedName(I)Ljava/lang/String;
    .locals 4
    .param p1, "offset"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 179
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/ar/ArArchiveInputStream;->namebuffer:[B

    if-nez v1, :cond_0

    .line 180
    new-instance v1, Ljava/io/IOException;

    const-string/jumbo v2, "Cannot process GNU long filename as no // record was found"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 182
    :cond_0
    move v0, p1

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/ar/ArArchiveInputStream;->namebuffer:[B

    array-length v1, v1

    if-ge v0, v1, :cond_3

    .line 183
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/ar/ArArchiveInputStream;->namebuffer:[B

    aget-byte v1, v1, v0

    const/16 v2, 0xa

    if-ne v1, v2, :cond_2

    .line 184
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/ar/ArArchiveInputStream;->namebuffer:[B

    add-int/lit8 v2, v0, -0x1

    aget-byte v1, v1, v2

    const/16 v2, 0x2f

    if-ne v1, v2, :cond_1

    .line 185
    add-int/lit8 v0, v0, -0x1

    .line 187
    :cond_1
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/ar/ArArchiveInputStream;->namebuffer:[B

    sub-int v2, v0, p1

    invoke-static {v1, p1, v2}, Lorg/apache/commons/compress/utils/ArchiveUtils;->toAsciiString([BII)Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 182
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 190
    :cond_3
    new-instance v1, Ljava/io/IOException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Failed to read entry: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private static isBSDLongName(Ljava/lang/String;)Z
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 336
    if-eqz p0, :cond_0

    const-string/jumbo v0, "^#1/\\d+"

    invoke-virtual {p0, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private isGNULongName(Ljava/lang/String;)Z
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 413
    if-eqz p1, :cond_0

    const-string/jumbo v0, "^/\\d+"

    invoke-virtual {p1, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static isGNUStringTable(Ljava/lang/String;)Z
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 385
    const-string/jumbo v0, "//"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public static matches([BI)Z
    .locals 4
    .param p0, "signature"    # [B
    .param p1, "length"    # I

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 276
    const/16 v2, 0x8

    if-ge p1, v2, :cond_1

    .line 304
    :cond_0
    :goto_0
    return v0

    .line 279
    :cond_1
    aget-byte v2, p0, v0

    const/16 v3, 0x21

    if-ne v2, v3, :cond_0

    .line 282
    aget-byte v2, p0, v1

    const/16 v3, 0x3c

    if-ne v2, v3, :cond_0

    .line 285
    const/4 v2, 0x2

    aget-byte v2, p0, v2

    const/16 v3, 0x61

    if-ne v2, v3, :cond_0

    .line 288
    const/4 v2, 0x3

    aget-byte v2, p0, v2

    const/16 v3, 0x72

    if-ne v2, v3, :cond_0

    .line 291
    const/4 v2, 0x4

    aget-byte v2, p0, v2

    const/16 v3, 0x63

    if-ne v2, v3, :cond_0

    .line 294
    const/4 v2, 0x5

    aget-byte v2, p0, v2

    const/16 v3, 0x68

    if-ne v2, v3, :cond_0

    .line 297
    const/4 v2, 0x6

    aget-byte v2, p0, v2

    const/16 v3, 0x3e

    if-ne v2, v3, :cond_0

    .line 300
    const/4 v2, 0x7

    aget-byte v2, p0, v2

    const/16 v3, 0xa

    if-ne v2, v3, :cond_0

    move v0, v1

    .line 304
    goto :goto_0
.end method

.method private readGNUStringTable([B)Lorg/apache/commons/compress/archivers/ar/ArArchiveEntry;
    .locals 6
    .param p1, "length"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 394
    invoke-direct {p0, p1}, Lorg/apache/commons/compress/archivers/ar/ArArchiveInputStream;->asInt([B)I

    move-result v0

    .line 395
    .local v0, "bufflen":I
    new-array v2, v0, [B

    iput-object v2, p0, Lorg/apache/commons/compress/archivers/ar/ArArchiveInputStream;->namebuffer:[B

    .line 396
    iget-object v2, p0, Lorg/apache/commons/compress/archivers/ar/ArArchiveInputStream;->namebuffer:[B

    const/4 v3, 0x0

    invoke-virtual {p0, v2, v3, v0}, Lorg/apache/commons/compress/archivers/ar/ArArchiveInputStream;->read([BII)I

    move-result v1

    .line 397
    .local v1, "read":I
    if-eq v1, v0, :cond_0

    .line 398
    new-instance v2, Ljava/io/IOException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "Failed to read complete // record: expected="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, " read="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 401
    :cond_0
    new-instance v2, Lorg/apache/commons/compress/archivers/ar/ArArchiveEntry;

    const-string/jumbo v3, "//"

    int-to-long v4, v0

    invoke-direct {v2, v3, v4, v5}, Lorg/apache/commons/compress/archivers/ar/ArArchiveEntry;-><init>(Ljava/lang/String;J)V

    return-object v2
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
    .line 234
    iget-boolean v0, p0, Lorg/apache/commons/compress/archivers/ar/ArArchiveInputStream;->closed:Z

    if-nez v0, :cond_0

    .line 235
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/commons/compress/archivers/ar/ArArchiveInputStream;->closed:Z

    .line 236
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/ar/ArArchiveInputStream;->input:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 238
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/ar/ArArchiveInputStream;->currentEntry:Lorg/apache/commons/compress/archivers/ar/ArArchiveEntry;

    .line 239
    return-void
.end method

.method public getNextArEntry()Lorg/apache/commons/compress/archivers/ar/ArArchiveEntry;
    .locals 26
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 75
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/apache/commons/compress/archivers/ar/ArArchiveInputStream;->currentEntry:Lorg/apache/commons/compress/archivers/ar/ArArchiveEntry;

    if-eqz v2, :cond_2

    .line 76
    move-object/from16 v0, p0

    iget-wide v6, v0, Lorg/apache/commons/compress/archivers/ar/ArArchiveInputStream;->entryOffset:J

    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/apache/commons/compress/archivers/ar/ArArchiveInputStream;->currentEntry:Lorg/apache/commons/compress/archivers/ar/ArArchiveEntry;

    invoke-virtual {v2}, Lorg/apache/commons/compress/archivers/ar/ArArchiveEntry;->getLength()J

    move-result-wide v8

    add-long v12, v6, v8

    .line 77
    .local v12, "entryEnd":J
    :cond_0
    move-object/from16 v0, p0

    iget-wide v6, v0, Lorg/apache/commons/compress/archivers/ar/ArArchiveInputStream;->offset:J

    cmp-long v2, v6, v12

    if-gez v2, :cond_1

    .line 78
    invoke-virtual/range {p0 .. p0}, Lorg/apache/commons/compress/archivers/ar/ArArchiveInputStream;->read()I

    move-result v25

    .line 79
    .local v25, "x":I
    const/4 v2, -0x1

    move/from16 v0, v25

    if-ne v0, v2, :cond_0

    .line 82
    const/4 v2, 0x0

    .line 168
    .end local v12    # "entryEnd":J
    .end local v25    # "x":I
    :goto_0
    return-object v2

    .line 85
    .restart local v12    # "entryEnd":J
    :cond_1
    const/4 v2, 0x0

    move-object/from16 v0, p0

    iput-object v2, v0, Lorg/apache/commons/compress/archivers/ar/ArArchiveInputStream;->currentEntry:Lorg/apache/commons/compress/archivers/ar/ArArchiveEntry;

    .line 88
    .end local v12    # "entryEnd":J
    :cond_2
    move-object/from16 v0, p0

    iget-wide v6, v0, Lorg/apache/commons/compress/archivers/ar/ArArchiveInputStream;->offset:J

    const-wide/16 v8, 0x0

    cmp-long v2, v6, v8

    if-nez v2, :cond_5

    .line 89
    const-string/jumbo v2, "!<arch>\n"

    invoke-static {v2}, Lorg/apache/commons/compress/utils/ArchiveUtils;->toAsciiBytes(Ljava/lang/String;)[B

    move-result-object v11

    .line 90
    .local v11, "expected":[B
    array-length v2, v11

    new-array v0, v2, [B

    move-object/from16 v23, v0

    .line 91
    .local v23, "realized":[B
    move-object/from16 v0, p0

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Lorg/apache/commons/compress/archivers/ar/ArArchiveInputStream;->read([B)I

    move-result v22

    .line 92
    .local v22, "read":I
    array-length v2, v11

    move/from16 v0, v22

    if-eq v0, v2, :cond_3

    .line 93
    new-instance v2, Ljava/io/IOException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "failed to read header. Occured at byte: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual/range {p0 .. p0}, Lorg/apache/commons/compress/archivers/ar/ArArchiveInputStream;->getBytesRead()J

    move-result-wide v8

    invoke-virtual {v6, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v2, v6}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 95
    :cond_3
    const/16 v16, 0x0

    .local v16, "i":I
    :goto_1
    array-length v2, v11

    move/from16 v0, v16

    if-ge v0, v2, :cond_5

    .line 96
    aget-byte v2, v11, v16

    aget-byte v6, v23, v16

    if-eq v2, v6, :cond_4

    .line 97
    new-instance v2, Ljava/io/IOException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "invalid header "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-static/range {v23 .. v23}, Lorg/apache/commons/compress/utils/ArchiveUtils;->toAsciiString([B)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v2, v6}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 95
    :cond_4
    add-int/lit8 v16, v16, 0x1

    goto :goto_1

    .line 102
    .end local v11    # "expected":[B
    .end local v16    # "i":I
    .end local v22    # "read":I
    .end local v23    # "realized":[B
    :cond_5
    move-object/from16 v0, p0

    iget-wide v6, v0, Lorg/apache/commons/compress/archivers/ar/ArArchiveInputStream;->offset:J

    const-wide/16 v8, 0x2

    rem-long/2addr v6, v8

    const-wide/16 v8, 0x0

    cmp-long v2, v6, v8

    if-eqz v2, :cond_6

    invoke-virtual/range {p0 .. p0}, Lorg/apache/commons/compress/archivers/ar/ArArchiveInputStream;->read()I

    move-result v2

    if-gez v2, :cond_6

    .line 104
    const/4 v2, 0x0

    goto/16 :goto_0

    .line 107
    :cond_6
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/apache/commons/compress/archivers/ar/ArArchiveInputStream;->input:Ljava/io/InputStream;

    invoke-virtual {v2}, Ljava/io/InputStream;->available()I

    move-result v2

    if-nez v2, :cond_7

    .line 108
    const/4 v2, 0x0

    goto/16 :goto_0

    .line 111
    :cond_7
    const/16 v2, 0x10

    new-array v0, v2, [B

    move-object/from16 v19, v0

    .line 112
    .local v19, "name":[B
    const/16 v2, 0xc

    new-array v0, v2, [B

    move-object/from16 v17, v0

    .line 113
    .local v17, "lastmodified":[B
    const/4 v2, 0x6

    new-array v0, v2, [B

    move-object/from16 v24, v0

    .line 114
    .local v24, "userid":[B
    const/4 v2, 0x6

    new-array v15, v2, [B

    .line 115
    .local v15, "groupid":[B
    const/16 v2, 0x8

    new-array v14, v2, [B

    .line 116
    .local v14, "filemode":[B
    const/16 v2, 0xa

    new-array v0, v2, [B

    move-object/from16 v18, v0

    .line 118
    .local v18, "length":[B
    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lorg/apache/commons/compress/archivers/ar/ArArchiveInputStream;->read([B)I

    .line 119
    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lorg/apache/commons/compress/archivers/ar/ArArchiveInputStream;->read([B)I

    .line 120
    move-object/from16 v0, p0

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Lorg/apache/commons/compress/archivers/ar/ArArchiveInputStream;->read([B)I

    .line 121
    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Lorg/apache/commons/compress/archivers/ar/ArArchiveInputStream;->read([B)I

    .line 122
    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lorg/apache/commons/compress/archivers/ar/ArArchiveInputStream;->read([B)I

    .line 123
    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lorg/apache/commons/compress/archivers/ar/ArArchiveInputStream;->read([B)I

    .line 126
    const-string/jumbo v2, "`\n"

    invoke-static {v2}, Lorg/apache/commons/compress/utils/ArchiveUtils;->toAsciiBytes(Ljava/lang/String;)[B

    move-result-object v11

    .line 127
    .restart local v11    # "expected":[B
    array-length v2, v11

    new-array v0, v2, [B

    move-object/from16 v23, v0

    .line 128
    .restart local v23    # "realized":[B
    move-object/from16 v0, p0

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Lorg/apache/commons/compress/archivers/ar/ArArchiveInputStream;->read([B)I

    move-result v22

    .line 129
    .restart local v22    # "read":I
    array-length v2, v11

    move/from16 v0, v22

    if-eq v0, v2, :cond_8

    .line 130
    new-instance v2, Ljava/io/IOException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "failed to read entry trailer. Occured at byte: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual/range {p0 .. p0}, Lorg/apache/commons/compress/archivers/ar/ArArchiveInputStream;->getBytesRead()J

    move-result-wide v8

    invoke-virtual {v6, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v2, v6}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 132
    :cond_8
    const/16 v16, 0x0

    .restart local v16    # "i":I
    :goto_2
    array-length v2, v11

    move/from16 v0, v16

    if-ge v0, v2, :cond_a

    .line 133
    aget-byte v2, v11, v16

    aget-byte v6, v23, v16

    if-eq v2, v6, :cond_9

    .line 134
    new-instance v2, Ljava/io/IOException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "invalid entry trailer. not read the content? Occured at byte: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual/range {p0 .. p0}, Lorg/apache/commons/compress/archivers/ar/ArArchiveInputStream;->getBytesRead()J

    move-result-wide v8

    invoke-virtual {v6, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v2, v6}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 132
    :cond_9
    add-int/lit8 v16, v16, 0x1

    goto :goto_2

    .line 139
    :cond_a
    move-object/from16 v0, p0

    iget-wide v6, v0, Lorg/apache/commons/compress/archivers/ar/ArArchiveInputStream;->offset:J

    move-object/from16 v0, p0

    iput-wide v6, v0, Lorg/apache/commons/compress/archivers/ar/ArArchiveInputStream;->entryOffset:J

    .line 144
    invoke-static/range {v19 .. v19}, Lorg/apache/commons/compress/utils/ArchiveUtils;->toAsciiString([B)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    .line 145
    .local v3, "temp":Ljava/lang/String;
    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-direct {v0, v1}, Lorg/apache/commons/compress/archivers/ar/ArArchiveInputStream;->asLong([B)J

    move-result-wide v4

    .line 147
    .local v4, "len":J
    invoke-static {v3}, Lorg/apache/commons/compress/archivers/ar/ArArchiveInputStream;->isGNUStringTable(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_b

    .line 148
    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-direct {v0, v1}, Lorg/apache/commons/compress/archivers/ar/ArArchiveInputStream;->readGNUStringTable([B)Lorg/apache/commons/compress/archivers/ar/ArArchiveEntry;

    move-result-object v2

    move-object/from16 v0, p0

    iput-object v2, v0, Lorg/apache/commons/compress/archivers/ar/ArArchiveInputStream;->currentEntry:Lorg/apache/commons/compress/archivers/ar/ArArchiveEntry;

    .line 149
    invoke-virtual/range {p0 .. p0}, Lorg/apache/commons/compress/archivers/ar/ArArchiveInputStream;->getNextArEntry()Lorg/apache/commons/compress/archivers/ar/ArArchiveEntry;

    move-result-object v2

    goto/16 :goto_0

    .line 150
    :cond_b
    const-string/jumbo v2, "/"

    invoke-virtual {v3, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_d

    .line 151
    const/4 v2, 0x0

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v6

    add-int/lit8 v6, v6, -0x1

    invoke-virtual {v3, v2, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    .line 165
    :cond_c
    :goto_3
    new-instance v2, Lorg/apache/commons/compress/archivers/ar/ArArchiveEntry;

    const/4 v6, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, v24

    invoke-direct {v0, v1, v6}, Lorg/apache/commons/compress/archivers/ar/ArArchiveInputStream;->asInt([BZ)I

    move-result v6

    const/4 v7, 0x1

    move-object/from16 v0, p0

    invoke-direct {v0, v15, v7}, Lorg/apache/commons/compress/archivers/ar/ArArchiveInputStream;->asInt([BZ)I

    move-result v7

    const/16 v8, 0x8

    move-object/from16 v0, p0

    invoke-direct {v0, v14, v8}, Lorg/apache/commons/compress/archivers/ar/ArArchiveInputStream;->asInt([BI)I

    move-result v8

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-direct {v0, v1}, Lorg/apache/commons/compress/archivers/ar/ArArchiveInputStream;->asLong([B)J

    move-result-wide v9

    invoke-direct/range {v2 .. v10}, Lorg/apache/commons/compress/archivers/ar/ArArchiveEntry;-><init>(Ljava/lang/String;JIIIJ)V

    move-object/from16 v0, p0

    iput-object v2, v0, Lorg/apache/commons/compress/archivers/ar/ArArchiveInputStream;->currentEntry:Lorg/apache/commons/compress/archivers/ar/ArArchiveEntry;

    .line 168
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/apache/commons/compress/archivers/ar/ArArchiveInputStream;->currentEntry:Lorg/apache/commons/compress/archivers/ar/ArArchiveEntry;

    goto/16 :goto_0

    .line 152
    :cond_d
    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lorg/apache/commons/compress/archivers/ar/ArArchiveInputStream;->isGNULongName(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_e

    .line 153
    const/4 v2, 0x1

    invoke-virtual {v3, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v21

    .line 154
    .local v21, "offset":I
    move-object/from16 v0, p0

    move/from16 v1, v21

    invoke-direct {v0, v1}, Lorg/apache/commons/compress/archivers/ar/ArArchiveInputStream;->getExtendedName(I)Ljava/lang/String;

    move-result-object v3

    .line 155
    goto :goto_3

    .end local v21    # "offset":I
    :cond_e
    invoke-static {v3}, Lorg/apache/commons/compress/archivers/ar/ArArchiveInputStream;->isBSDLongName(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_c

    .line 156
    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lorg/apache/commons/compress/archivers/ar/ArArchiveInputStream;->getBSDLongName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 160
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v20

    .line 161
    .local v20, "nameLen":I
    move/from16 v0, v20

    int-to-long v6, v0

    sub-long/2addr v4, v6

    .line 162
    move-object/from16 v0, p0

    iget-wide v6, v0, Lorg/apache/commons/compress/archivers/ar/ArArchiveInputStream;->entryOffset:J

    move/from16 v0, v20

    int-to-long v8, v0

    add-long/2addr v6, v8

    move-object/from16 v0, p0

    iput-wide v6, v0, Lorg/apache/commons/compress/archivers/ar/ArArchiveInputStream;->entryOffset:J

    goto :goto_3
.end method

.method public getNextEntry()Lorg/apache/commons/compress/archivers/ArchiveEntry;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 224
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/ar/ArArchiveInputStream;->getNextArEntry()Lorg/apache/commons/compress/archivers/ar/ArArchiveEntry;

    move-result-object v0

    return-object v0
.end method

.method public read([BII)I
    .locals 8
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 248
    move v3, p3

    .line 249
    .local v3, "toRead":I
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/ar/ArArchiveInputStream;->currentEntry:Lorg/apache/commons/compress/archivers/ar/ArArchiveEntry;

    if-eqz v4, :cond_0

    .line 250
    iget-wide v4, p0, Lorg/apache/commons/compress/archivers/ar/ArArchiveInputStream;->entryOffset:J

    iget-object v6, p0, Lorg/apache/commons/compress/archivers/ar/ArArchiveInputStream;->currentEntry:Lorg/apache/commons/compress/archivers/ar/ArArchiveEntry;

    invoke-virtual {v6}, Lorg/apache/commons/compress/archivers/ar/ArArchiveEntry;->getLength()J

    move-result-wide v6

    add-long v0, v4, v6

    .line 251
    .local v0, "entryEnd":J
    if-lez p3, :cond_1

    iget-wide v4, p0, Lorg/apache/commons/compress/archivers/ar/ArArchiveInputStream;->offset:J

    cmp-long v4, v0, v4

    if-lez v4, :cond_1

    .line 252
    int-to-long v4, p3

    iget-wide v6, p0, Lorg/apache/commons/compress/archivers/ar/ArArchiveInputStream;->offset:J

    sub-long v6, v0, v6

    invoke-static {v4, v5, v6, v7}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v4

    long-to-int v3, v4

    .line 257
    .end local v0    # "entryEnd":J
    :cond_0
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/ar/ArArchiveInputStream;->input:Ljava/io/InputStream;

    invoke-virtual {v4, p1, p2, v3}, Ljava/io/InputStream;->read([BII)I

    move-result v2

    .line 258
    .local v2, "ret":I
    invoke-virtual {p0, v2}, Lorg/apache/commons/compress/archivers/ar/ArArchiveInputStream;->count(I)V

    .line 259
    iget-wide v6, p0, Lorg/apache/commons/compress/archivers/ar/ArArchiveInputStream;->offset:J

    if-lez v2, :cond_2

    move v4, v2

    :goto_0
    int-to-long v4, v4

    add-long/2addr v4, v6

    iput-wide v4, p0, Lorg/apache/commons/compress/archivers/ar/ArArchiveInputStream;->offset:J

    .line 260
    .end local v2    # "ret":I
    :goto_1
    return v2

    .line 254
    .restart local v0    # "entryEnd":J
    :cond_1
    const/4 v2, -0x1

    goto :goto_1

    .line 259
    .end local v0    # "entryEnd":J
    .restart local v2    # "ret":I
    :cond_2
    const/4 v4, 0x0

    goto :goto_0
.end method
