.class public Lorg/apache/tools/zip/ZipFile;
.super Ljava/lang/Object;
.source "ZipFile.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/zip/ZipFile$NameAndComment;,
        Lorg/apache/tools/zip/ZipFile$BoundedInputStream;,
        Lorg/apache/tools/zip/ZipFile$OffsetEntry;
    }
.end annotation


# static fields
.field private static final BYTE_SHIFT:I = 0x8

.field private static final CFD_LOCATOR_OFFSET:I = 0x10

.field private static final CFH_LEN:I = 0x2a

.field private static final HASH_SIZE:I = 0x1fd

.field private static final LFH_OFFSET_FOR_FILENAME_LENGTH:J = 0x1aL

.field private static final MAX_EOCD_SIZE:I = 0x10015

.field private static final MIN_EOCD_SIZE:I = 0x16

.field private static final NIBLET_MASK:I = 0xf

.field private static final POS_0:I = 0x0

.field private static final POS_1:I = 0x1

.field private static final POS_2:I = 0x2

.field private static final POS_3:I = 0x3

.field private static final SHORT:I = 0x2

.field private static final WORD:I = 0x4


# instance fields
.field private archive:Ljava/io/RandomAccessFile;

.field private encoding:Ljava/lang/String;

.field private final entries:Ljava/util/Map;

.field private final nameMap:Ljava/util/Map;

.field private final useUnicodeExtraFields:Z

.field private final zipEncoding:Lorg/apache/tools/zip/ZipEncoding;


# direct methods
.method public constructor <init>(Ljava/io/File;)V
    .locals 1
    .param p1, "f"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 124
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/apache/tools/zip/ZipFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 125
    return-void
.end method

.method public constructor <init>(Ljava/io/File;Ljava/lang/String;)V
    .locals 1
    .param p1, "f"    # Ljava/io/File;
    .param p2, "encoding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 163
    const/4 v0, 0x1

    invoke-direct {p0, p1, p2, v0}, Lorg/apache/tools/zip/ZipFile;-><init>(Ljava/io/File;Ljava/lang/String;Z)V

    .line 164
    return-void
.end method

.method public constructor <init>(Ljava/io/File;Ljava/lang/String;Z)V
    .locals 4
    .param p1, "f"    # Ljava/io/File;
    .param p2, "encoding"    # Ljava/lang/String;
    .param p3, "useUnicodeExtraFields"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v3, 0x1fd

    .line 179
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 79
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2, v3}, Ljava/util/HashMap;-><init>(I)V

    iput-object v2, p0, Lorg/apache/tools/zip/ZipFile;->entries:Ljava/util/Map;

    .line 84
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2, v3}, Ljava/util/HashMap;-><init>(I)V

    iput-object v2, p0, Lorg/apache/tools/zip/ZipFile;->nameMap:Ljava/util/Map;

    .line 98
    const/4 v2, 0x0

    iput-object v2, p0, Lorg/apache/tools/zip/ZipFile;->encoding:Ljava/lang/String;

    .line 180
    iput-object p2, p0, Lorg/apache/tools/zip/ZipFile;->encoding:Ljava/lang/String;

    .line 181
    invoke-static {p2}, Lorg/apache/tools/zip/ZipEncodingHelper;->getZipEncoding(Ljava/lang/String;)Lorg/apache/tools/zip/ZipEncoding;

    move-result-object v2

    iput-object v2, p0, Lorg/apache/tools/zip/ZipFile;->zipEncoding:Lorg/apache/tools/zip/ZipEncoding;

    .line 182
    iput-boolean p3, p0, Lorg/apache/tools/zip/ZipFile;->useUnicodeExtraFields:Z

    .line 183
    new-instance v2, Ljava/io/RandomAccessFile;

    const-string/jumbo v3, "r"

    invoke-direct {v2, p1, v3}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v2, p0, Lorg/apache/tools/zip/ZipFile;->archive:Ljava/io/RandomAccessFile;

    .line 184
    const/4 v1, 0x0

    .line 186
    .local v1, "success":Z
    :try_start_0
    invoke-direct {p0}, Lorg/apache/tools/zip/ZipFile;->populateFromCentralDirectory()Ljava/util/Map;

    move-result-object v0

    .line 187
    .local v0, "entriesWithoutUTF8Flag":Ljava/util/Map;
    invoke-direct {p0, v0}, Lorg/apache/tools/zip/ZipFile;->resolveLocalFileHeaderData(Ljava/util/Map;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 188
    const/4 v1, 0x1

    .line 190
    if-nez v1, :cond_0

    .line 192
    :try_start_1
    iget-object v2, p0, Lorg/apache/tools/zip/ZipFile;->archive:Ljava/io/RandomAccessFile;

    invoke-virtual {v2}, Ljava/io/RandomAccessFile;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 198
    :cond_0
    :goto_0
    return-void

    .line 190
    .end local v0    # "entriesWithoutUTF8Flag":Ljava/util/Map;
    :catchall_0
    move-exception v2

    if-nez v1, :cond_1

    .line 192
    :try_start_2
    iget-object v3, p0, Lorg/apache/tools/zip/ZipFile;->archive:Ljava/io/RandomAccessFile;

    invoke-virtual {v3}, Ljava/io/RandomAccessFile;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 195
    :cond_1
    :goto_1
    throw v2

    .line 193
    :catch_0
    move-exception v3

    goto :goto_1

    .restart local v0    # "entriesWithoutUTF8Flag":Ljava/util/Map;
    :catch_1
    move-exception v2

    goto :goto_0
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 136
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lorg/apache/tools/zip/ZipFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 137
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "encoding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 149
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    const/4 v1, 0x1

    invoke-direct {p0, v0, p2, v1}, Lorg/apache/tools/zip/ZipFile;-><init>(Ljava/io/File;Ljava/lang/String;Z)V

    .line 150
    return-void
.end method

.method static access$600(Lorg/apache/tools/zip/ZipFile;)Ljava/io/RandomAccessFile;
    .locals 1
    .param p0, "x0"    # Lorg/apache/tools/zip/ZipFile;

    .prologue
    .line 64
    iget-object v0, p0, Lorg/apache/tools/zip/ZipFile;->archive:Ljava/io/RandomAccessFile;

    return-object v0
.end method

.method public static closeQuietly(Lorg/apache/tools/zip/ZipFile;)V
    .locals 1
    .param p0, "zipfile"    # Lorg/apache/tools/zip/ZipFile;

    .prologue
    .line 223
    if-eqz p0, :cond_0

    .line 225
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/zip/ZipFile;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 230
    :cond_0
    :goto_0
    return-void

    .line 226
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method private static dosToJavaTime(J)J
    .locals 10
    .param p0, "dosTime"    # J

    .prologue
    const/16 v8, 0xb

    const/4 v7, 0x5

    const/4 v6, 0x1

    .line 571
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 573
    .local v0, "cal":Ljava/util/Calendar;
    const/16 v1, 0x19

    shr-long v2, p0, v1

    const-wide/16 v4, 0x7f

    and-long/2addr v2, v4

    long-to-int v1, v2

    add-int/lit16 v1, v1, 0x7bc

    invoke-virtual {v0, v6, v1}, Ljava/util/Calendar;->set(II)V

    .line 574
    const/4 v1, 0x2

    const/16 v2, 0x15

    shr-long v2, p0, v2

    const-wide/16 v4, 0xf

    and-long/2addr v2, v4

    long-to-int v2, v2

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->set(II)V

    .line 575
    const/16 v1, 0x10

    shr-long v2, p0, v1

    long-to-int v1, v2

    and-int/lit8 v1, v1, 0x1f

    invoke-virtual {v0, v7, v1}, Ljava/util/Calendar;->set(II)V

    .line 576
    shr-long v2, p0, v8

    long-to-int v1, v2

    and-int/lit8 v1, v1, 0x1f

    invoke-virtual {v0, v8, v1}, Ljava/util/Calendar;->set(II)V

    .line 577
    const/16 v1, 0xc

    shr-long v2, p0, v7

    long-to-int v2, v2

    and-int/lit8 v2, v2, 0x3f

    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->set(II)V

    .line 578
    const/16 v1, 0xd

    shl-long v2, p0, v6

    long-to-int v2, v2

    and-int/lit8 v2, v2, 0x3e

    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->set(II)V

    .line 580
    invoke-virtual {v0}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/Date;->getTime()J

    move-result-wide v2

    return-wide v2
.end method

.method protected static fromDosTime(Lorg/apache/tools/zip/ZipLong;)Ljava/util/Date;
    .locals 6
    .param p0, "zipDosTime"    # Lorg/apache/tools/zip/ZipLong;

    .prologue
    .line 563
    invoke-virtual {p0}, Lorg/apache/tools/zip/ZipLong;->getValue()J

    move-result-wide v0

    .line 564
    .local v0, "dosTime":J
    new-instance v2, Ljava/util/Date;

    invoke-static {v0, v1}, Lorg/apache/tools/zip/ZipFile;->dosToJavaTime(J)J

    move-result-wide v4

    invoke-direct {v2, v4, v5}, Ljava/util/Date;-><init>(J)V

    return-object v2
.end method

.method private getUnicodeStringIfOriginalMatches(Lorg/apache/tools/zip/AbstractUnicodeExtraField;[B)Ljava/lang/String;
    .locals 8
    .param p1, "f"    # Lorg/apache/tools/zip/AbstractUnicodeExtraField;
    .param p2, "orig"    # [B

    .prologue
    const/4 v4, 0x0

    .line 653
    if-eqz p1, :cond_0

    .line 654
    new-instance v0, Ljava/util/zip/CRC32;

    invoke-direct {v0}, Ljava/util/zip/CRC32;-><init>()V

    .line 655
    .local v0, "crc32":Ljava/util/zip/CRC32;
    invoke-virtual {v0, p2}, Ljava/util/zip/CRC32;->update([B)V

    .line 656
    invoke-virtual {v0}, Ljava/util/zip/CRC32;->getValue()J

    move-result-wide v2

    .line 658
    .local v2, "origCRC32":J
    invoke-virtual {p1}, Lorg/apache/tools/zip/AbstractUnicodeExtraField;->getNameCRC32()J

    move-result-wide v6

    cmp-long v5, v2, v6

    if-nez v5, :cond_0

    .line 660
    :try_start_0
    sget-object v5, Lorg/apache/tools/zip/ZipEncodingHelper;->UTF8_ZIP_ENCODING:Lorg/apache/tools/zip/ZipEncoding;

    invoke-virtual {p1}, Lorg/apache/tools/zip/AbstractUnicodeExtraField;->getUnicodeName()[B

    move-result-object v6

    invoke-interface {v5, v6}, Lorg/apache/tools/zip/ZipEncoding;->decode([B)Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v4

    .line 671
    .end local v0    # "crc32":Ljava/util/zip/CRC32;
    .end local v2    # "origCRC32":J
    :cond_0
    :goto_0
    return-object v4

    .line 662
    .restart local v0    # "crc32":Ljava/util/zip/CRC32;
    .restart local v2    # "origCRC32":J
    :catch_0
    move-exception v1

    .line 667
    .local v1, "ex":Ljava/io/IOException;
    goto :goto_0
.end method

.method private populateFromCentralDirectory()Ljava/util/Map;
    .locals 28
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 318
    new-instance v16, Ljava/util/HashMap;

    invoke-direct/range {v16 .. v16}, Ljava/util/HashMap;-><init>()V

    .line 320
    .local v16, "noUTF8Flag":Ljava/util/HashMap;
    invoke-direct/range {p0 .. p0}, Lorg/apache/tools/zip/ZipFile;->positionAtCentralDirectory()V

    .line 322
    const/16 v26, 0x2a

    move/from16 v0, v26

    new-array v5, v0, [B

    .line 324
    .local v5, "cfh":[B
    const/16 v26, 0x4

    move/from16 v0, v26

    new-array v0, v0, [B

    move-object/from16 v19, v0

    .line 325
    .local v19, "signatureBytes":[B
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/zip/ZipFile;->archive:Ljava/io/RandomAccessFile;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/io/RandomAccessFile;->readFully([B)V

    .line 326
    invoke-static/range {v19 .. v19}, Lorg/apache/tools/zip/ZipLong;->getValue([B)J

    move-result-wide v20

    .line 327
    .local v20, "sig":J
    sget-object v26, Lorg/apache/tools/zip/ZipOutputStream;->CFH_SIG:[B

    invoke-static/range {v26 .. v26}, Lorg/apache/tools/zip/ZipLong;->getValue([B)J

    move-result-wide v6

    .line 328
    .local v6, "cfhSig":J
    cmp-long v26, v20, v6

    if-eqz v26, :cond_0

    invoke-direct/range {p0 .. p0}, Lorg/apache/tools/zip/ZipFile;->startsWithLocalFileHeader()Z

    move-result v26

    if-eqz v26, :cond_0

    .line 329
    new-instance v26, Ljava/io/IOException;

    const-string/jumbo v27, "central directory is empty, can\'t expand corrupt archive."

    invoke-direct/range {v26 .. v27}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v26

    .line 332
    :cond_0
    :goto_0
    cmp-long v26, v20, v6

    if-nez v26, :cond_3

    .line 333
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/zip/ZipFile;->archive:Ljava/io/RandomAccessFile;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    invoke-virtual {v0, v5}, Ljava/io/RandomAccessFile;->readFully([B)V

    .line 334
    const/16 v17, 0x0

    .line 335
    .local v17, "off":I
    new-instance v25, Lorg/apache/tools/zip/ZipEntry;

    invoke-direct/range {v25 .. v25}, Lorg/apache/tools/zip/ZipEntry;-><init>()V

    .line 337
    .local v25, "ze":Lorg/apache/tools/zip/ZipEntry;
    move/from16 v0, v17

    invoke-static {v5, v0}, Lorg/apache/tools/zip/ZipShort;->getValue([BI)I

    move-result v24

    .line 338
    .local v24, "versionMadeBy":I
    add-int/lit8 v17, v17, 0x2

    .line 339
    shr-int/lit8 v26, v24, 0x8

    and-int/lit8 v26, v26, 0xf

    invoke-virtual/range {v25 .. v26}, Lorg/apache/tools/zip/ZipEntry;->setPlatform(I)V

    .line 341
    add-int/lit8 v17, v17, 0x2

    .line 343
    move/from16 v0, v17

    invoke-static {v5, v0}, Lorg/apache/tools/zip/ZipShort;->getValue([BI)I

    move-result v14

    .line 344
    .local v14, "generalPurposeFlag":I
    and-int/lit16 v0, v14, 0x800

    move/from16 v26, v0

    if-eqz v26, :cond_1

    const/4 v15, 0x1

    .line 346
    .local v15, "hasUTF8Flag":Z
    :goto_1
    if-eqz v15, :cond_2

    sget-object v10, Lorg/apache/tools/zip/ZipEncodingHelper;->UTF8_ZIP_ENCODING:Lorg/apache/tools/zip/ZipEncoding;

    .line 349
    .local v10, "entryEncoding":Lorg/apache/tools/zip/ZipEncoding;
    :goto_2
    add-int/lit8 v17, v17, 0x2

    .line 351
    move/from16 v0, v17

    invoke-static {v5, v0}, Lorg/apache/tools/zip/ZipShort;->getValue([BI)I

    move-result v26

    invoke-virtual/range {v25 .. v26}, Lorg/apache/tools/zip/ZipEntry;->setMethod(I)V

    .line 352
    add-int/lit8 v17, v17, 0x2

    .line 357
    move/from16 v0, v17

    invoke-static {v5, v0}, Lorg/apache/tools/zip/ZipLong;->getValue([BI)J

    move-result-wide v26

    invoke-static/range {v26 .. v27}, Lorg/apache/tools/zip/ZipFile;->dosToJavaTime(J)J

    move-result-wide v22

    .line 358
    .local v22, "time":J
    move-object/from16 v0, v25

    move-wide/from16 v1, v22

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/zip/ZipEntry;->setTime(J)V

    .line 359
    add-int/lit8 v17, v17, 0x4

    .line 361
    move/from16 v0, v17

    invoke-static {v5, v0}, Lorg/apache/tools/zip/ZipLong;->getValue([BI)J

    move-result-wide v26

    invoke-virtual/range {v25 .. v27}, Lorg/apache/tools/zip/ZipEntry;->setCrc(J)V

    .line 362
    add-int/lit8 v17, v17, 0x4

    .line 364
    move/from16 v0, v17

    invoke-static {v5, v0}, Lorg/apache/tools/zip/ZipLong;->getValue([BI)J

    move-result-wide v26

    invoke-virtual/range {v25 .. v27}, Lorg/apache/tools/zip/ZipEntry;->setCompressedSize(J)V

    .line 365
    add-int/lit8 v17, v17, 0x4

    .line 367
    move/from16 v0, v17

    invoke-static {v5, v0}, Lorg/apache/tools/zip/ZipLong;->getValue([BI)J

    move-result-wide v26

    invoke-virtual/range {v25 .. v27}, Lorg/apache/tools/zip/ZipEntry;->setSize(J)V

    .line 368
    add-int/lit8 v17, v17, 0x4

    .line 370
    move/from16 v0, v17

    invoke-static {v5, v0}, Lorg/apache/tools/zip/ZipShort;->getValue([BI)I

    move-result v13

    .line 371
    .local v13, "fileNameLen":I
    add-int/lit8 v17, v17, 0x2

    .line 373
    move/from16 v0, v17

    invoke-static {v5, v0}, Lorg/apache/tools/zip/ZipShort;->getValue([BI)I

    move-result v11

    .line 374
    .local v11, "extraLen":I
    add-int/lit8 v17, v17, 0x2

    .line 376
    move/from16 v0, v17

    invoke-static {v5, v0}, Lorg/apache/tools/zip/ZipShort;->getValue([BI)I

    move-result v9

    .line 377
    .local v9, "commentLen":I
    add-int/lit8 v17, v17, 0x2

    .line 379
    add-int/lit8 v17, v17, 0x2

    .line 381
    move/from16 v0, v17

    invoke-static {v5, v0}, Lorg/apache/tools/zip/ZipShort;->getValue([BI)I

    move-result v26

    invoke-virtual/range {v25 .. v26}, Lorg/apache/tools/zip/ZipEntry;->setInternalAttributes(I)V

    .line 382
    add-int/lit8 v17, v17, 0x2

    .line 384
    move/from16 v0, v17

    invoke-static {v5, v0}, Lorg/apache/tools/zip/ZipLong;->getValue([BI)J

    move-result-wide v26

    invoke-virtual/range {v25 .. v27}, Lorg/apache/tools/zip/ZipEntry;->setExternalAttributes(J)V

    .line 385
    add-int/lit8 v17, v17, 0x4

    .line 387
    new-array v12, v13, [B

    .line 388
    .local v12, "fileName":[B
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/zip/ZipFile;->archive:Ljava/io/RandomAccessFile;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    invoke-virtual {v0, v12}, Ljava/io/RandomAccessFile;->readFully([B)V

    .line 389
    invoke-interface {v10, v12}, Lorg/apache/tools/zip/ZipEncoding;->decode([B)Ljava/lang/String;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Lorg/apache/tools/zip/ZipEntry;->setName(Ljava/lang/String;)V

    .line 392
    new-instance v18, Lorg/apache/tools/zip/ZipFile$OffsetEntry;

    const/16 v26, 0x0

    move-object/from16 v0, v18

    move-object/from16 v1, v26

    invoke-direct {v0, v1}, Lorg/apache/tools/zip/ZipFile$OffsetEntry;-><init>(Lorg/apache/tools/zip/ZipFile$1;)V

    .line 393
    .local v18, "offset":Lorg/apache/tools/zip/ZipFile$OffsetEntry;
    move/from16 v0, v17

    invoke-static {v5, v0}, Lorg/apache/tools/zip/ZipLong;->getValue([BI)J

    move-result-wide v26

    move-object/from16 v0, v18

    move-wide/from16 v1, v26

    invoke-static {v0, v1, v2}, Lorg/apache/tools/zip/ZipFile$OffsetEntry;->access$202(Lorg/apache/tools/zip/ZipFile$OffsetEntry;J)J

    .line 395
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/zip/ZipFile;->entries:Ljava/util/Map;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    move-object/from16 v1, v25

    move-object/from16 v2, v18

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 397
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/zip/ZipFile;->nameMap:Ljava/util/Map;

    move-object/from16 v26, v0

    invoke-virtual/range {v25 .. v25}, Lorg/apache/tools/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v27

    move-object/from16 v0, v26

    move-object/from16 v1, v27

    move-object/from16 v2, v25

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 399
    new-array v4, v11, [B

    .line 400
    .local v4, "cdExtraData":[B
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/zip/ZipFile;->archive:Ljava/io/RandomAccessFile;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    invoke-virtual {v0, v4}, Ljava/io/RandomAccessFile;->readFully([B)V

    .line 401
    move-object/from16 v0, v25

    invoke-virtual {v0, v4}, Lorg/apache/tools/zip/ZipEntry;->setCentralDirectoryExtra([B)V

    .line 403
    new-array v8, v9, [B

    .line 404
    .local v8, "comment":[B
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/zip/ZipFile;->archive:Ljava/io/RandomAccessFile;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    invoke-virtual {v0, v8}, Ljava/io/RandomAccessFile;->readFully([B)V

    .line 405
    invoke-interface {v10, v8}, Lorg/apache/tools/zip/ZipEncoding;->decode([B)Ljava/lang/String;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Lorg/apache/tools/zip/ZipEntry;->setComment(Ljava/lang/String;)V

    .line 407
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/zip/ZipFile;->archive:Ljava/io/RandomAccessFile;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/io/RandomAccessFile;->readFully([B)V

    .line 408
    invoke-static/range {v19 .. v19}, Lorg/apache/tools/zip/ZipLong;->getValue([B)J

    move-result-wide v20

    .line 410
    if-nez v15, :cond_0

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/tools/zip/ZipFile;->useUnicodeExtraFields:Z

    move/from16 v26, v0

    if-eqz v26, :cond_0

    .line 411
    new-instance v26, Lorg/apache/tools/zip/ZipFile$NameAndComment;

    const/16 v27, 0x0

    move-object/from16 v0, v26

    move-object/from16 v1, v27

    invoke-direct {v0, v12, v8, v1}, Lorg/apache/tools/zip/ZipFile$NameAndComment;-><init>([B[BLorg/apache/tools/zip/ZipFile$1;)V

    move-object/from16 v0, v16

    move-object/from16 v1, v25

    move-object/from16 v2, v26

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_0

    .line 344
    .end local v4    # "cdExtraData":[B
    .end local v8    # "comment":[B
    .end local v9    # "commentLen":I
    .end local v10    # "entryEncoding":Lorg/apache/tools/zip/ZipEncoding;
    .end local v11    # "extraLen":I
    .end local v12    # "fileName":[B
    .end local v13    # "fileNameLen":I
    .end local v15    # "hasUTF8Flag":Z
    .end local v18    # "offset":Lorg/apache/tools/zip/ZipFile$OffsetEntry;
    .end local v22    # "time":J
    :cond_1
    const/4 v15, 0x0

    goto/16 :goto_1

    .line 346
    .restart local v15    # "hasUTF8Flag":Z
    :cond_2
    move-object/from16 v0, p0

    iget-object v10, v0, Lorg/apache/tools/zip/ZipFile;->zipEncoding:Lorg/apache/tools/zip/ZipEncoding;

    goto/16 :goto_2

    .line 414
    .end local v14    # "generalPurposeFlag":I
    .end local v15    # "hasUTF8Flag":Z
    .end local v17    # "off":I
    .end local v24    # "versionMadeBy":I
    .end local v25    # "ze":Lorg/apache/tools/zip/ZipEntry;
    :cond_3
    return-object v16
.end method

.method private positionAtCentralDirectory()V
    .locals 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/16 v12, 0x0

    .line 453
    const/4 v2, 0x0

    .line 454
    .local v2, "found":Z
    iget-object v8, p0, Lorg/apache/tools/zip/ZipFile;->archive:Ljava/io/RandomAccessFile;

    invoke-virtual {v8}, Ljava/io/RandomAccessFile;->length()J

    move-result-wide v8

    const-wide/16 v10, 0x16

    sub-long v4, v8, v10

    .line 455
    .local v4, "off":J
    iget-object v8, p0, Lorg/apache/tools/zip/ZipFile;->archive:Ljava/io/RandomAccessFile;

    invoke-virtual {v8}, Ljava/io/RandomAccessFile;->length()J

    move-result-wide v8

    const-wide/32 v10, 0x10015

    sub-long/2addr v8, v10

    invoke-static {v12, v13, v8, v9}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v6

    .line 457
    .local v6, "stopSearching":J
    cmp-long v8, v4, v12

    if-ltz v8, :cond_0

    .line 458
    sget-object v3, Lorg/apache/tools/zip/ZipOutputStream;->EOCD_SIG:[B

    .line 459
    .local v3, "sig":[B
    :goto_0
    cmp-long v8, v4, v6

    if-ltz v8, :cond_0

    .line 460
    iget-object v8, p0, Lorg/apache/tools/zip/ZipFile;->archive:Ljava/io/RandomAccessFile;

    invoke-virtual {v8, v4, v5}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 461
    iget-object v8, p0, Lorg/apache/tools/zip/ZipFile;->archive:Ljava/io/RandomAccessFile;

    invoke-virtual {v8}, Ljava/io/RandomAccessFile;->read()I

    move-result v1

    .line 462
    .local v1, "curr":I
    const/4 v8, -0x1

    if-ne v1, v8, :cond_1

    .line 480
    .end local v1    # "curr":I
    .end local v3    # "sig":[B
    :cond_0
    :goto_1
    if-nez v2, :cond_3

    .line 481
    new-instance v8, Ljava/util/zip/ZipException;

    const-string/jumbo v9, "archive is not a ZIP archive"

    invoke-direct {v8, v9}, Ljava/util/zip/ZipException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 465
    .restart local v1    # "curr":I
    .restart local v3    # "sig":[B
    :cond_1
    const/4 v8, 0x0

    aget-byte v8, v3, v8

    if-ne v1, v8, :cond_2

    .line 466
    iget-object v8, p0, Lorg/apache/tools/zip/ZipFile;->archive:Ljava/io/RandomAccessFile;

    invoke-virtual {v8}, Ljava/io/RandomAccessFile;->read()I

    move-result v1

    .line 467
    const/4 v8, 0x1

    aget-byte v8, v3, v8

    if-ne v1, v8, :cond_2

    .line 468
    iget-object v8, p0, Lorg/apache/tools/zip/ZipFile;->archive:Ljava/io/RandomAccessFile;

    invoke-virtual {v8}, Ljava/io/RandomAccessFile;->read()I

    move-result v1

    .line 469
    const/4 v8, 0x2

    aget-byte v8, v3, v8

    if-ne v1, v8, :cond_2

    .line 470
    iget-object v8, p0, Lorg/apache/tools/zip/ZipFile;->archive:Ljava/io/RandomAccessFile;

    invoke-virtual {v8}, Ljava/io/RandomAccessFile;->read()I

    move-result v1

    .line 471
    const/4 v8, 0x3

    aget-byte v8, v3, v8

    if-ne v1, v8, :cond_2

    .line 472
    const/4 v2, 0x1

    .line 473
    goto :goto_1

    .line 459
    :cond_2
    const-wide/16 v8, 0x1

    sub-long/2addr v4, v8

    goto :goto_0

    .line 483
    .end local v1    # "curr":I
    .end local v3    # "sig":[B
    :cond_3
    iget-object v8, p0, Lorg/apache/tools/zip/ZipFile;->archive:Ljava/io/RandomAccessFile;

    const-wide/16 v10, 0x10

    add-long/2addr v10, v4

    invoke-virtual {v8, v10, v11}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 484
    const/4 v8, 0x4

    new-array v0, v8, [B

    .line 485
    .local v0, "cfdOffset":[B
    iget-object v8, p0, Lorg/apache/tools/zip/ZipFile;->archive:Ljava/io/RandomAccessFile;

    invoke-virtual {v8, v0}, Ljava/io/RandomAccessFile;->readFully([B)V

    .line 486
    iget-object v8, p0, Lorg/apache/tools/zip/ZipFile;->archive:Ljava/io/RandomAccessFile;

    invoke-static {v0}, Lorg/apache/tools/zip/ZipLong;->getValue([B)J

    move-result-wide v10

    invoke-virtual {v8, v10, v11}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 487
    return-void
.end method

.method private resolveLocalFileHeaderData(Ljava/util/Map;)V
    .locals 18
    .param p1, "entriesWithoutUTF8Flag"    # Ljava/util/Map;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 513
    new-instance v13, Ljava/util/HashSet;

    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/apache/tools/zip/ZipFile;->entries:Ljava/util/Map;

    invoke-interface {v14}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v14

    invoke-direct {v13, v14}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    invoke-static {v13}, Ljava/util/Collections;->enumeration(Ljava/util/Collection;)Ljava/util/Enumeration;

    move-result-object v3

    .line 514
    .local v3, "e":Ljava/util/Enumeration;
    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v13

    if-eqz v13, :cond_3

    .line 515
    invoke-interface {v3}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lorg/apache/tools/zip/ZipEntry;

    .line 516
    .local v12, "ze":Lorg/apache/tools/zip/ZipEntry;
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/apache/tools/zip/ZipFile;->entries:Ljava/util/Map;

    invoke-interface {v13, v12}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lorg/apache/tools/zip/ZipFile$OffsetEntry;

    .line 517
    .local v10, "offsetEntry":Lorg/apache/tools/zip/ZipFile$OffsetEntry;
    invoke-static {v10}, Lorg/apache/tools/zip/ZipFile$OffsetEntry;->access$200(Lorg/apache/tools/zip/ZipFile$OffsetEntry;)J

    move-result-wide v8

    .line 518
    .local v8, "offset":J
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/apache/tools/zip/ZipFile;->archive:Ljava/io/RandomAccessFile;

    const-wide/16 v14, 0x1a

    add-long/2addr v14, v8

    invoke-virtual {v13, v14, v15}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 519
    const/4 v13, 0x2

    new-array v2, v13, [B

    .line 520
    .local v2, "b":[B
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/apache/tools/zip/ZipFile;->archive:Ljava/io/RandomAccessFile;

    invoke-virtual {v13, v2}, Ljava/io/RandomAccessFile;->readFully([B)V

    .line 521
    invoke-static {v2}, Lorg/apache/tools/zip/ZipShort;->getValue([B)I

    move-result v5

    .line 522
    .local v5, "fileNameLen":I
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/apache/tools/zip/ZipFile;->archive:Ljava/io/RandomAccessFile;

    invoke-virtual {v13, v2}, Ljava/io/RandomAccessFile;->readFully([B)V

    .line 523
    invoke-static {v2}, Lorg/apache/tools/zip/ZipShort;->getValue([B)I

    move-result v4

    .line 524
    .local v4, "extraFieldLen":I
    move v6, v5

    .line 525
    .local v6, "lenToSkip":I
    :goto_1
    if-lez v6, :cond_2

    .line 526
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/apache/tools/zip/ZipFile;->archive:Ljava/io/RandomAccessFile;

    invoke-virtual {v13, v6}, Ljava/io/RandomAccessFile;->skipBytes(I)I

    move-result v11

    .line 527
    .local v11, "skipped":I
    if-gtz v11, :cond_1

    .line 528
    new-instance v13, Ljava/lang/RuntimeException;

    const-string/jumbo v14, "failed to skip file name in local file header"

    invoke-direct {v13, v14}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v13

    .line 531
    :cond_1
    sub-int/2addr v6, v11

    goto :goto_1

    .line 533
    .end local v11    # "skipped":I
    :cond_2
    new-array v7, v4, [B

    .line 534
    .local v7, "localExtraData":[B
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/apache/tools/zip/ZipFile;->archive:Ljava/io/RandomAccessFile;

    invoke-virtual {v13, v7}, Ljava/io/RandomAccessFile;->readFully([B)V

    .line 535
    invoke-virtual {v12, v7}, Lorg/apache/tools/zip/ZipEntry;->setExtra([B)V

    .line 540
    const-wide/16 v14, 0x1a

    add-long/2addr v14, v8

    const-wide/16 v16, 0x2

    add-long v14, v14, v16

    const-wide/16 v16, 0x2

    add-long v14, v14, v16

    int-to-long v0, v5

    move-wide/from16 v16, v0

    add-long v14, v14, v16

    int-to-long v0, v4

    move-wide/from16 v16, v0

    add-long v14, v14, v16

    invoke-static {v10, v14, v15}, Lorg/apache/tools/zip/ZipFile$OffsetEntry;->access$002(Lorg/apache/tools/zip/ZipFile$OffsetEntry;J)J

    .line 543
    move-object/from16 v0, p1

    invoke-interface {v0, v12}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_0

    .line 547
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/apache/tools/zip/ZipFile;->entries:Ljava/util/Map;

    invoke-interface {v13, v12}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 548
    move-object/from16 v0, p1

    invoke-interface {v0, v12}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lorg/apache/tools/zip/ZipFile$NameAndComment;

    move-object/from16 v0, p0

    invoke-direct {v0, v12, v13}, Lorg/apache/tools/zip/ZipFile;->setNameAndCommentFromExtraFields(Lorg/apache/tools/zip/ZipEntry;Lorg/apache/tools/zip/ZipFile$NameAndComment;)V

    .line 551
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/apache/tools/zip/ZipFile;->entries:Ljava/util/Map;

    invoke-interface {v13, v12, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_0

    .line 554
    .end local v2    # "b":[B
    .end local v4    # "extraFieldLen":I
    .end local v5    # "fileNameLen":I
    .end local v6    # "lenToSkip":I
    .end local v7    # "localExtraData":[B
    .end local v8    # "offset":J
    .end local v10    # "offsetEntry":Lorg/apache/tools/zip/ZipFile$OffsetEntry;
    .end local v12    # "ze":Lorg/apache/tools/zip/ZipEntry;
    :cond_3
    return-void
.end method

.method private setNameAndCommentFromExtraFields(Lorg/apache/tools/zip/ZipEntry;Lorg/apache/tools/zip/ZipFile$NameAndComment;)V
    .locals 6
    .param p1, "ze"    # Lorg/apache/tools/zip/ZipEntry;
    .param p2, "nc"    # Lorg/apache/tools/zip/ZipFile$NameAndComment;

    .prologue
    .line 623
    sget-object v5, Lorg/apache/tools/zip/UnicodePathExtraField;->UPATH_ID:Lorg/apache/tools/zip/ZipShort;

    invoke-virtual {p1, v5}, Lorg/apache/tools/zip/ZipEntry;->getExtraField(Lorg/apache/tools/zip/ZipShort;)Lorg/apache/tools/zip/ZipExtraField;

    move-result-object v1

    check-cast v1, Lorg/apache/tools/zip/UnicodePathExtraField;

    .line 625
    .local v1, "name":Lorg/apache/tools/zip/UnicodePathExtraField;
    invoke-virtual {p1}, Lorg/apache/tools/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v4

    .line 626
    .local v4, "originalName":Ljava/lang/String;
    invoke-static {p2}, Lorg/apache/tools/zip/ZipFile$NameAndComment;->access$400(Lorg/apache/tools/zip/ZipFile$NameAndComment;)[B

    move-result-object v5

    invoke-direct {p0, v1, v5}, Lorg/apache/tools/zip/ZipFile;->getUnicodeStringIfOriginalMatches(Lorg/apache/tools/zip/AbstractUnicodeExtraField;[B)Ljava/lang/String;

    move-result-object v3

    .line 627
    .local v3, "newName":Ljava/lang/String;
    if-eqz v3, :cond_0

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 628
    invoke-virtual {p1, v3}, Lorg/apache/tools/zip/ZipEntry;->setName(Ljava/lang/String;)V

    .line 629
    iget-object v5, p0, Lorg/apache/tools/zip/ZipFile;->nameMap:Ljava/util/Map;

    invoke-interface {v5, v4}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 630
    iget-object v5, p0, Lorg/apache/tools/zip/ZipFile;->nameMap:Ljava/util/Map;

    invoke-interface {v5, v3, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 633
    :cond_0
    invoke-static {p2}, Lorg/apache/tools/zip/ZipFile$NameAndComment;->access$500(Lorg/apache/tools/zip/ZipFile$NameAndComment;)[B

    move-result-object v5

    if-eqz v5, :cond_1

    invoke-static {p2}, Lorg/apache/tools/zip/ZipFile$NameAndComment;->access$500(Lorg/apache/tools/zip/ZipFile$NameAndComment;)[B

    move-result-object v5

    array-length v5, v5

    if-lez v5, :cond_1

    .line 634
    sget-object v5, Lorg/apache/tools/zip/UnicodeCommentExtraField;->UCOM_ID:Lorg/apache/tools/zip/ZipShort;

    invoke-virtual {p1, v5}, Lorg/apache/tools/zip/ZipEntry;->getExtraField(Lorg/apache/tools/zip/ZipShort;)Lorg/apache/tools/zip/ZipExtraField;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/zip/UnicodeCommentExtraField;

    .line 636
    .local v0, "cmt":Lorg/apache/tools/zip/UnicodeCommentExtraField;
    invoke-static {p2}, Lorg/apache/tools/zip/ZipFile$NameAndComment;->access$500(Lorg/apache/tools/zip/ZipFile$NameAndComment;)[B

    move-result-object v5

    invoke-direct {p0, v0, v5}, Lorg/apache/tools/zip/ZipFile;->getUnicodeStringIfOriginalMatches(Lorg/apache/tools/zip/AbstractUnicodeExtraField;[B)Ljava/lang/String;

    move-result-object v2

    .line 638
    .local v2, "newComment":Ljava/lang/String;
    if-eqz v2, :cond_1

    .line 639
    invoke-virtual {p1, v2}, Lorg/apache/tools/zip/ZipEntry;->setComment(Ljava/lang/String;)V

    .line 642
    .end local v0    # "cmt":Lorg/apache/tools/zip/UnicodeCommentExtraField;
    .end local v2    # "newComment":Ljava/lang/String;
    :cond_1
    return-void
.end method

.method private startsWithLocalFileHeader()Z
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 605
    iget-object v2, p0, Lorg/apache/tools/zip/ZipFile;->archive:Ljava/io/RandomAccessFile;

    const-wide/16 v4, 0x0

    invoke-virtual {v2, v4, v5}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 606
    const/4 v2, 0x4

    new-array v1, v2, [B

    .line 607
    .local v1, "start":[B
    iget-object v2, p0, Lorg/apache/tools/zip/ZipFile;->archive:Ljava/io/RandomAccessFile;

    invoke-virtual {v2, v1}, Ljava/io/RandomAccessFile;->readFully([B)V

    .line 608
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v2, v1

    if-ge v0, v2, :cond_1

    .line 609
    aget-byte v2, v1, v0

    sget-object v3, Lorg/apache/tools/zip/ZipOutputStream;->LFH_SIG:[B

    aget-byte v3, v3, v0

    if-eq v2, v3, :cond_0

    .line 610
    const/4 v2, 0x0

    .line 613
    :goto_1
    return v2

    .line 608
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 613
    :cond_1
    const/4 v2, 0x1

    goto :goto_1
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
    .line 214
    iget-object v0, p0, Lorg/apache/tools/zip/ZipFile;->archive:Ljava/io/RandomAccessFile;

    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->close()V

    .line 215
    return-void
.end method

.method public getEncoding()Ljava/lang/String;
    .locals 1

    .prologue
    .line 206
    iget-object v0, p0, Lorg/apache/tools/zip/ZipFile;->encoding:Ljava/lang/String;

    return-object v0
.end method

.method public getEntries()Ljava/util/Enumeration;
    .locals 1

    .prologue
    .line 237
    iget-object v0, p0, Lorg/apache/tools/zip/ZipFile;->entries:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->enumeration(Ljava/util/Collection;)Ljava/util/Enumeration;

    move-result-object v0

    return-object v0
.end method

.method public getEntry(Ljava/lang/String;)Lorg/apache/tools/zip/ZipEntry;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 248
    iget-object v0, p0, Lorg/apache/tools/zip/ZipFile;->nameMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/zip/ZipEntry;

    return-object v0
.end method

.method public getInputStream(Lorg/apache/tools/zip/ZipEntry;)Ljava/io/InputStream;
    .locals 8
    .param p1, "ze"    # Lorg/apache/tools/zip/ZipEntry;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/util/zip/ZipException;
        }
    .end annotation

    .prologue
    .line 261
    iget-object v1, p0, Lorg/apache/tools/zip/ZipFile;->entries:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lorg/apache/tools/zip/ZipFile$OffsetEntry;

    .line 262
    .local v7, "offsetEntry":Lorg/apache/tools/zip/ZipFile$OffsetEntry;
    if-nez v7, :cond_0

    .line 263
    const/4 v0, 0x0

    .line 274
    :goto_0
    :sswitch_0
    return-object v0

    .line 265
    :cond_0
    invoke-static {v7}, Lorg/apache/tools/zip/ZipFile$OffsetEntry;->access$000(Lorg/apache/tools/zip/ZipFile$OffsetEntry;)J

    move-result-wide v2

    .line 266
    .local v2, "start":J
    new-instance v0, Lorg/apache/tools/zip/ZipFile$BoundedInputStream;

    invoke-virtual {p1}, Lorg/apache/tools/zip/ZipEntry;->getCompressedSize()J

    move-result-wide v4

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lorg/apache/tools/zip/ZipFile$BoundedInputStream;-><init>(Lorg/apache/tools/zip/ZipFile;JJ)V

    .line 268
    .local v0, "bis":Lorg/apache/tools/zip/ZipFile$BoundedInputStream;
    invoke-virtual {p1}, Lorg/apache/tools/zip/ZipEntry;->getMethod()I

    move-result v1

    sparse-switch v1, :sswitch_data_0

    .line 281
    new-instance v1, Ljava/util/zip/ZipException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "Found unsupported compression method "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {p1}, Lorg/apache/tools/zip/ZipEntry;->getMethod()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v1, v4}, Ljava/util/zip/ZipException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 272
    :sswitch_1
    invoke-virtual {v0}, Lorg/apache/tools/zip/ZipFile$BoundedInputStream;->addDummy()V

    .line 273
    new-instance v6, Ljava/util/zip/Inflater;

    const/4 v1, 0x1

    invoke-direct {v6, v1}, Ljava/util/zip/Inflater;-><init>(Z)V

    .line 274
    .local v6, "inflater":Ljava/util/zip/Inflater;
    new-instance v1, Lorg/apache/tools/zip/ZipFile$1;

    invoke-direct {v1, p0, v0, v6, v6}, Lorg/apache/tools/zip/ZipFile$1;-><init>(Lorg/apache/tools/zip/ZipFile;Ljava/io/InputStream;Ljava/util/zip/Inflater;Ljava/util/zip/Inflater;)V

    move-object v0, v1

    goto :goto_0

    .line 268
    nop

    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0x8 -> :sswitch_1
    .end sparse-switch
.end method

.method protected getString([B)Ljava/lang/String;
    .locals 4
    .param p1, "bytes"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/zip/ZipException;
        }
    .end annotation

    .prologue
    .line 594
    :try_start_0
    iget-object v1, p0, Lorg/apache/tools/zip/ZipFile;->encoding:Ljava/lang/String;

    invoke-static {v1}, Lorg/apache/tools/zip/ZipEncodingHelper;->getZipEncoding(Ljava/lang/String;)Lorg/apache/tools/zip/ZipEncoding;

    move-result-object v1

    invoke-interface {v1, p1}, Lorg/apache/tools/zip/ZipEncoding;->decode([B)Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    .line 595
    :catch_0
    move-exception v0

    .line 596
    .local v0, "ex":Ljava/io/IOException;
    new-instance v1, Ljava/util/zip/ZipException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "Failed to decode name: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/util/zip/ZipException;-><init>(Ljava/lang/String;)V

    throw v1
.end method
