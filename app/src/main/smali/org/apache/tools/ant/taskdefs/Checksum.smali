.class public Lorg/apache/tools/ant/taskdefs/Checksum;
.super Lorg/apache/tools/ant/taskdefs/MatchingTask;
.source "Checksum.java"

# interfaces
.implements Lorg/apache/tools/ant/taskdefs/condition/Condition;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/taskdefs/Checksum$FormatElement;,
        Lorg/apache/tools/ant/taskdefs/Checksum$FileUnion;
    }
.end annotation


# static fields
.field private static final BUFFER_SIZE:I = 0x2000

.field private static final BYTE_MASK:I = 0xff

.field private static final FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

.field private static final NIBBLE:I = 0x4

.field private static final WORD:I = 0x10

.field static class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;


# instance fields
.field private algorithm:Ljava/lang/String;

.field private allDigests:Ljava/util/Map;

.field private file:Ljava/io/File;

.field private fileext:Ljava/lang/String;

.field private forceOverwrite:Z

.field private format:Ljava/text/MessageFormat;

.field private includeFileMap:Ljava/util/Hashtable;

.field private isCondition:Z

.field private messageDigest:Ljava/security/MessageDigest;

.field private property:Ljava/lang/String;

.field private provider:Ljava/lang/String;

.field private readBufferSize:I

.field private relativeFilePaths:Ljava/util/Map;

.field private resources:Lorg/apache/tools/ant/taskdefs/Checksum$FileUnion;

.field private todir:Ljava/io/File;

.field private totalproperty:Ljava/lang/String;

.field private verifyProperty:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 64
    invoke-static {}, Lorg/apache/tools/ant/util/FileUtils;->getFileUtils()Lorg/apache/tools/ant/util/FileUtils;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/taskdefs/Checksum;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 62
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/MatchingTask;-><init>()V

    .line 85
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/Checksum;->file:Ljava/io/File;

    .line 97
    const-string/jumbo v0, "MD5"

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Checksum;->algorithm:Ljava/lang/String;

    .line 101
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/Checksum;->provider:Ljava/lang/String;

    .line 116
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Checksum;->allDigests:Ljava/util/Map;

    .line 123
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Checksum;->relativeFilePaths:Ljava/util/Map;

    .line 140
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/Checksum;->resources:Lorg/apache/tools/ant/taskdefs/Checksum$FileUnion;

    .line 144
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Checksum;->includeFileMap:Ljava/util/Hashtable;

    .line 156
    const/16 v0, 0x2000

    iput v0, p0, Lorg/apache/tools/ant/taskdefs/Checksum;->readBufferSize:I

    .line 161
    invoke-static {}, Lorg/apache/tools/ant/taskdefs/Checksum$FormatElement;->getDefault()Lorg/apache/tools/ant/taskdefs/Checksum$FormatElement;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/Checksum$FormatElement;->getFormat()Ljava/text/MessageFormat;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Checksum;->format:Ljava/text/MessageFormat;

    .line 679
    return-void
.end method

.method static access$000(Lorg/apache/tools/ant/taskdefs/Checksum;Ljava/io/File;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lorg/apache/tools/ant/taskdefs/Checksum;
    .param p1, "x1"    # Ljava/io/File;

    .prologue
    .line 62
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/taskdefs/Checksum;->getRelativeFilePath(Ljava/io/File;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private addToIncludeFileMap(Ljava/io/File;)V
    .locals 8
    .param p1, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 429
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v4

    if-eqz v4, :cond_4

    .line 430
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Checksum;->property:Ljava/lang/String;

    if-nez v4, :cond_3

    .line 431
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/taskdefs/Checksum;->getChecksumFile(Ljava/io/File;)Ljava/io/File;

    move-result-object v1

    .line 432
    .local v1, "checksumFile":Ljava/io/File;
    iget-boolean v4, p0, Lorg/apache/tools/ant/taskdefs/Checksum;->forceOverwrite:Z

    if-nez v4, :cond_0

    iget-boolean v4, p0, Lorg/apache/tools/ant/taskdefs/Checksum;->isCondition:Z

    if-nez v4, :cond_0

    invoke-virtual {p1}, Ljava/io/File;->lastModified()J

    move-result-wide v4

    invoke-virtual {v1}, Ljava/io/File;->lastModified()J

    move-result-wide v6

    cmp-long v4, v4, v6

    if-lez v4, :cond_2

    .line 434
    :cond_0
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Checksum;->includeFileMap:Ljava/util/Hashtable;

    invoke-virtual {v4, p1, v1}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 455
    .end local v1    # "checksumFile":Ljava/io/File;
    :cond_1
    :goto_0
    return-void

    .line 436
    .restart local v1    # "checksumFile":Ljava/io/File;
    :cond_2
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, " omitted as "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, " is up to date."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x3

    invoke-virtual {p0, v4, v5}, Lorg/apache/tools/ant/taskdefs/Checksum;->log(Ljava/lang/String;I)V

    .line 438
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Checksum;->totalproperty:Ljava/lang/String;

    if-eqz v4, :cond_1

    .line 440
    invoke-direct {p0, v1}, Lorg/apache/tools/ant/taskdefs/Checksum;->readChecksum(Ljava/io/File;)Ljava/lang/String;

    move-result-object v0

    .line 441
    .local v0, "checksum":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v4

    invoke-static {v4}, Lorg/apache/tools/ant/taskdefs/Checksum;->decodeHex([C)[B

    move-result-object v2

    .line 442
    .local v2, "digest":[B
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Checksum;->allDigests:Ljava/util/Map;

    invoke-interface {v4, p1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 446
    .end local v0    # "checksum":Ljava/lang/String;
    .end local v1    # "checksumFile":Ljava/io/File;
    .end local v2    # "digest":[B
    :cond_3
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Checksum;->includeFileMap:Ljava/util/Hashtable;

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Checksum;->property:Ljava/lang/String;

    invoke-virtual {v4, p1, v5}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 449
    :cond_4
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "Could not find file "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, " to generate checksum for."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    .line 452
    .local v3, "message":Ljava/lang/String;
    invoke-virtual {p0, v3}, Lorg/apache/tools/ant/taskdefs/Checksum;->log(Ljava/lang/String;)V

    .line 453
    new-instance v4, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Checksum;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v5

    invoke-direct {v4, v3, v5}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v4
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 399
    :try_start_0
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    :catch_0
    move-exception v0

    .local v0, "x1":Ljava/lang/ClassNotFoundException;
    new-instance v1, Ljava/lang/NoClassDefFoundError;

    invoke-direct {v1}, Ljava/lang/NoClassDefFoundError;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/NoClassDefFoundError;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    move-result-object v1

    throw v1
.end method

.method private createDigestString([B)Ljava/lang/String;
    .locals 5
    .param p1, "fileDigest"    # [B

    .prologue
    .line 594
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 595
    .local v0, "checksumSb":Ljava/lang/StringBuffer;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v3, p1

    if-ge v2, v3, :cond_1

    .line 596
    aget-byte v3, p1, v2

    and-int/lit16 v3, v3, 0xff

    invoke-static {v3}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    .line 597
    .local v1, "hexStr":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    const/4 v4, 0x2

    if-ge v3, v4, :cond_0

    .line 598
    const-string/jumbo v3, "0"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 600
    :cond_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 595
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 602
    .end local v1    # "hexStr":Ljava/lang/String;
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method public static decodeHex([C)[B
    .locals 8
    .param p0, "data"    # [C
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    const/16 v7, 0x10

    .line 618
    array-length v4, p0

    .line 620
    .local v4, "l":I
    and-int/lit8 v6, v4, 0x1

    if-eqz v6, :cond_0

    .line 621
    new-instance v6, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v7, "odd number of characters."

    invoke-direct {v6, v7}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 624
    :cond_0
    shr-int/lit8 v6, v4, 0x1

    new-array v5, v6, [B

    .line 627
    .local v5, "out":[B
    const/4 v1, 0x0

    .local v1, "i":I
    const/4 v2, 0x0

    .local v2, "j":I
    move v3, v2

    .end local v2    # "j":I
    .local v3, "j":I
    :goto_0
    if-ge v3, v4, :cond_1

    .line 628
    add-int/lit8 v2, v3, 0x1

    .end local v3    # "j":I
    .restart local v2    # "j":I
    aget-char v6, p0, v3

    invoke-static {v6, v7}, Ljava/lang/Character;->digit(CI)I

    move-result v6

    shl-int/lit8 v0, v6, 0x4

    .line 629
    .local v0, "f":I
    add-int/lit8 v3, v2, 0x1

    .end local v2    # "j":I
    .restart local v3    # "j":I
    aget-char v6, p0, v2

    invoke-static {v6, v7}, Ljava/lang/Character;->digit(CI)I

    move-result v6

    or-int/2addr v0, v6

    .line 630
    and-int/lit16 v6, v0, 0xff

    int-to-byte v6, v6

    aput-byte v6, v5, v1

    .line 627
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 633
    .end local v0    # "f":I
    :cond_1
    return-object v5
.end method

.method private generateChecksums()Z
    .locals 30
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 478
    const/4 v6, 0x1

    .line 479
    .local v6, "checksumMatches":Z
    const/4 v15, 0x0

    .line 480
    .local v15, "fis":Ljava/io/FileInputStream;
    const/16 v17, 0x0

    .line 481
    .local v17, "fos":Ljava/io/FileOutputStream;
    move-object/from16 v0, p0

    iget v0, v0, Lorg/apache/tools/ant/taskdefs/Checksum;->readBufferSize:I

    move/from16 v26, v0

    move/from16 v0, v26

    new-array v4, v0, [B

    .line 483
    .local v4, "buf":[B
    :try_start_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Checksum;->includeFileMap:Ljava/util/Hashtable;

    move-object/from16 v26, v0

    invoke-virtual/range {v26 .. v26}, Ljava/util/Hashtable;->keys()Ljava/util/Enumeration;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v11

    .local v11, "e":Ljava/util/Enumeration;
    move-object/from16 v18, v17

    .local v18, "fos":Ljava/lang/Object;
    move-object/from16 v16, v15

    .end local v15    # "fis":Ljava/io/FileInputStream;
    .end local v17    # "fos":Ljava/io/FileOutputStream;
    .local v16, "fis":Ljava/lang/Object;
    :goto_0
    :try_start_1
    invoke-interface {v11}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v26

    if-eqz v26, :cond_9

    .line 484
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Checksum;->messageDigest:Ljava/security/MessageDigest;

    move-object/from16 v26, v0

    invoke-virtual/range {v26 .. v26}, Ljava/security/MessageDigest;->reset()V

    .line 485
    invoke-interface {v11}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v23

    check-cast v23, Ljava/io/File;

    .line 486
    .local v23, "src":Ljava/io/File;
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/tools/ant/taskdefs/Checksum;->isCondition:Z

    move/from16 v26, v0

    if-nez v26, :cond_0

    .line 487
    new-instance v26, Ljava/lang/StringBuffer;

    invoke-direct/range {v26 .. v26}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v27, "Calculating "

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v26

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Checksum;->algorithm:Ljava/lang/String;

    move-object/from16 v27, v0

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v26

    const-string/jumbo v27, " checksum for "

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v26

    move-object/from16 v0, v26

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v26

    const/16 v27, 0x3

    move-object/from16 v0, p0

    move-object/from16 v1, v26

    move/from16 v2, v27

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/taskdefs/Checksum;->log(Ljava/lang/String;I)V

    .line 489
    :cond_0
    new-instance v15, Ljava/io/FileInputStream;

    move-object/from16 v0, v23

    invoke-direct {v15, v0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_3
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 490
    .restart local v15    # "fis":Ljava/io/FileInputStream;
    :try_start_2
    new-instance v10, Ljava/security/DigestInputStream;

    .end local v16    # "fis":Ljava/lang/Object;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Checksum;->messageDigest:Ljava/security/MessageDigest;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    invoke-direct {v10, v15, v0}, Ljava/security/DigestInputStream;-><init>(Ljava/io/InputStream;Ljava/security/MessageDigest;)V

    .line 492
    .local v10, "dis":Ljava/security/DigestInputStream;
    :cond_1
    const/16 v26, 0x0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/apache/tools/ant/taskdefs/Checksum;->readBufferSize:I

    move/from16 v27, v0

    move/from16 v0, v26

    move/from16 v1, v27

    invoke-virtual {v10, v4, v0, v1}, Ljava/security/DigestInputStream;->read([BII)I

    move-result v26

    const/16 v27, -0x1

    move/from16 v0, v26

    move/from16 v1, v27

    if-ne v0, v1, :cond_1

    .line 495
    invoke-virtual {v10}, Ljava/security/DigestInputStream;->close()V

    .line 496
    invoke-virtual {v15}, Ljava/io/FileInputStream;->close()V

    .line 497
    const/4 v15, 0x0

    .line 498
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Checksum;->messageDigest:Ljava/security/MessageDigest;

    move-object/from16 v26, v0

    invoke-virtual/range {v26 .. v26}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v13

    .line 499
    .local v13, "fileDigest":[B
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Checksum;->totalproperty:Ljava/lang/String;

    move-object/from16 v26, v0

    if-eqz v26, :cond_2

    .line 500
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Checksum;->allDigests:Ljava/util/Map;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    move-object/from16 v1, v23

    invoke-interface {v0, v1, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 502
    :cond_2
    move-object/from16 v0, p0

    invoke-direct {v0, v13}, Lorg/apache/tools/ant/taskdefs/Checksum;->createDigestString([B)Ljava/lang/String;

    move-result-object v5

    .line 504
    .local v5, "checksum":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Checksum;->includeFileMap:Ljava/util/Hashtable;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    .line 505
    .local v8, "destination":Ljava/lang/Object;
    instance-of v0, v8, Ljava/lang/String;

    move/from16 v26, v0

    if-eqz v26, :cond_5

    .line 506
    move-object v0, v8

    check-cast v0, Ljava/lang/String;

    move-object/from16 v22, v0

    .line 507
    .local v22, "prop":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/tools/ant/taskdefs/Checksum;->isCondition:Z

    move/from16 v26, v0

    if-eqz v26, :cond_4

    .line 508
    if-eqz v6, :cond_3

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Checksum;->property:Ljava/lang/String;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v26

    if-eqz v26, :cond_3

    const/4 v6, 0x1

    :goto_1
    move-object/from16 v17, v18

    .end local v18    # "fos":Ljava/lang/Object;
    .end local v22    # "prop":Ljava/lang/String;
    :goto_2
    move-object/from16 v18, v17

    .restart local v18    # "fos":Ljava/lang/Object;
    move-object/from16 v16, v15

    .line 547
    .restart local v16    # "fis":Ljava/lang/Object;
    goto/16 :goto_0

    .line 508
    .end local v16    # "fis":Ljava/lang/Object;
    .restart local v22    # "prop":Ljava/lang/String;
    :cond_3
    const/4 v6, 0x0

    goto :goto_1

    .line 511
    :cond_4
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Checksum;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v26

    move-object/from16 v0, v26

    move-object/from16 v1, v22

    invoke-virtual {v0, v1, v5}, Lorg/apache/tools/ant/Project;->setNewProperty(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    goto :goto_1

    .line 584
    .end local v5    # "checksum":Ljava/lang/String;
    .end local v8    # "destination":Ljava/lang/Object;
    .end local v10    # "dis":Ljava/security/DigestInputStream;
    .end local v13    # "fileDigest":[B
    .end local v22    # "prop":Ljava/lang/String;
    :catch_0
    move-exception v11

    move-object/from16 v17, v18

    .line 585
    .end local v18    # "fos":Ljava/lang/Object;
    .end local v23    # "src":Ljava/io/File;
    .local v11, "e":Ljava/lang/Exception;
    .restart local v17    # "fos":Ljava/io/FileOutputStream;
    :goto_3
    :try_start_3
    new-instance v26, Lorg/apache/tools/ant/BuildException;

    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Checksum;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v27

    move-object/from16 v0, v26

    move-object/from16 v1, v27

    invoke-direct {v0, v11, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v26
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 587
    .end local v11    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v26

    :goto_4
    invoke-static {v15}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    .line 588
    invoke-static/range {v17 .. v17}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/OutputStream;)V

    throw v26

    .line 513
    .end local v17    # "fos":Ljava/io/FileOutputStream;
    .restart local v5    # "checksum":Ljava/lang/String;
    .restart local v8    # "destination":Ljava/lang/Object;
    .restart local v10    # "dis":Ljava/security/DigestInputStream;
    .local v11, "e":Ljava/util/Enumeration;
    .restart local v13    # "fileDigest":[B
    .restart local v18    # "fos":Ljava/lang/Object;
    .restart local v23    # "src":Ljava/io/File;
    :cond_5
    :try_start_4
    instance-of v0, v8, Ljava/io/File;

    move/from16 v26, v0

    if-eqz v26, :cond_c

    .line 514
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/tools/ant/taskdefs/Checksum;->isCondition:Z

    move/from16 v26, v0

    if-eqz v26, :cond_8

    .line 515
    move-object v0, v8

    check-cast v0, Ljava/io/File;

    move-object v12, v0

    .line 516
    .local v12, "existingFile":Ljava/io/File;
    invoke-virtual {v12}, Ljava/io/File;->exists()Z
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    move-result v26

    if-eqz v26, :cond_7

    .line 518
    :try_start_5
    move-object/from16 v0, p0

    invoke-direct {v0, v12}, Lorg/apache/tools/ant/taskdefs/Checksum;->readChecksum(Ljava/io/File;)Ljava/lang/String;

    move-result-object v24

    .line 520
    .local v24, "suppliedChecksum":Ljava/lang/String;
    if-eqz v6, :cond_6

    move-object/from16 v0, v24

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_5
    .catch Lorg/apache/tools/ant/BuildException; {:try_start_5 .. :try_end_5} :catch_1
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    move-result v26

    if-eqz v26, :cond_6

    const/4 v6, 0x1

    .end local v24    # "suppliedChecksum":Ljava/lang/String;
    :goto_5
    move-object/from16 v17, v18

    .line 527
    .end local v18    # "fos":Ljava/lang/Object;
    .local v17, "fos":Ljava/lang/Object;
    goto :goto_2

    .line 520
    .end local v17    # "fos":Ljava/lang/Object;
    .restart local v18    # "fos":Ljava/lang/Object;
    .restart local v24    # "suppliedChecksum":Ljava/lang/String;
    :cond_6
    const/4 v6, 0x0

    goto :goto_5

    .line 522
    .end local v24    # "suppliedChecksum":Ljava/lang/String;
    :catch_1
    move-exception v3

    .line 524
    .local v3, "be":Lorg/apache/tools/ant/BuildException;
    const/4 v6, 0x0

    .line 525
    goto :goto_5

    .line 527
    .end local v3    # "be":Lorg/apache/tools/ant/BuildException;
    :cond_7
    const/4 v6, 0x0

    goto :goto_5

    .line 530
    .end local v12    # "existingFile":Ljava/io/File;
    :cond_8
    :try_start_6
    move-object v0, v8

    check-cast v0, Ljava/io/File;

    move-object v7, v0

    .line 531
    .local v7, "dest":Ljava/io/File;
    new-instance v17, Ljava/io/FileOutputStream;

    move-object/from16 v0, v17

    invoke-direct {v0, v7}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_0
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 532
    .local v17, "fos":Ljava/io/FileOutputStream;
    :try_start_7
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Checksum;->format:Ljava/text/MessageFormat;

    move-object/from16 v26, v0

    .end local v18    # "fos":Ljava/lang/Object;
    const/16 v27, 0x5

    move/from16 v0, v27

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v27, v0

    const/16 v28, 0x0

    aput-object v5, v27, v28

    const/16 v28, 0x1

    invoke-virtual/range {v23 .. v23}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v29

    aput-object v29, v27, v28

    const/16 v28, 0x2

    invoke-virtual {v7}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v29

    move-object/from16 v0, v29

    move-object/from16 v1, v23

    invoke-static {v0, v1}, Lorg/apache/tools/ant/util/FileUtils;->getRelativePath(Ljava/io/File;Ljava/io/File;)Ljava/lang/String;

    move-result-object v29

    aput-object v29, v27, v28

    const/16 v28, 0x3

    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Checksum;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v29

    invoke-virtual/range {v29 .. v29}, Lorg/apache/tools/ant/Project;->getBaseDir()Ljava/io/File;

    move-result-object v29

    move-object/from16 v0, v29

    move-object/from16 v1, v23

    invoke-static {v0, v1}, Lorg/apache/tools/ant/util/FileUtils;->getRelativePath(Ljava/io/File;Ljava/io/File;)Ljava/lang/String;

    move-result-object v29

    aput-object v29, v27, v28

    const/16 v28, 0x4

    invoke-virtual/range {v23 .. v23}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v29

    aput-object v29, v27, v28

    invoke-virtual/range {v26 .. v27}, Ljava/text/MessageFormat;->format(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/String;->getBytes()[B

    move-result-object v26

    move-object/from16 v0, v17

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Ljava/io/FileOutputStream;->write([B)V

    .line 545
    sget-object v26, Lorg/apache/tools/ant/util/StringUtils;->LINE_SEP:Ljava/lang/String;

    invoke-virtual/range {v26 .. v26}, Ljava/lang/String;->getBytes()[B

    move-result-object v26

    move-object/from16 v0, v17

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Ljava/io/FileOutputStream;->write([B)V

    .line 546
    invoke-virtual/range {v17 .. v17}, Ljava/io/FileOutputStream;->close()V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_2
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 547
    const/16 v17, 0x0

    goto/16 :goto_2

    .line 551
    .end local v5    # "checksum":Ljava/lang/String;
    .end local v7    # "dest":Ljava/io/File;
    .end local v8    # "destination":Ljava/lang/Object;
    .end local v10    # "dis":Ljava/security/DigestInputStream;
    .end local v13    # "fileDigest":[B
    .end local v15    # "fis":Ljava/io/FileInputStream;
    .end local v17    # "fos":Ljava/io/FileOutputStream;
    .end local v23    # "src":Ljava/io/File;
    .restart local v16    # "fis":Ljava/lang/Object;
    .restart local v18    # "fos":Ljava/lang/Object;
    :cond_9
    :try_start_8
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Checksum;->totalproperty:Ljava/lang/String;

    move-object/from16 v26, v0

    if-eqz v26, :cond_b

    .line 554
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Checksum;->allDigests:Ljava/util/Map;

    move-object/from16 v26, v0

    invoke-interface/range {v26 .. v26}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v21

    .line 555
    .local v21, "keys":Ljava/util/Set;
    invoke-interface/range {v21 .. v21}, Ljava/util/Set;->toArray()[Ljava/lang/Object;

    move-result-object v20

    .line 558
    .local v20, "keyArray":[Ljava/lang/Object;
    new-instance v26, Lorg/apache/tools/ant/taskdefs/Checksum$1;

    move-object/from16 v0, v26

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/taskdefs/Checksum$1;-><init>(Lorg/apache/tools/ant/taskdefs/Checksum;)V

    move-object/from16 v0, v20

    move-object/from16 v1, v26

    invoke-static {v0, v1}, Ljava/util/Arrays;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V

    .line 569
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Checksum;->messageDigest:Ljava/security/MessageDigest;

    move-object/from16 v26, v0

    invoke-virtual/range {v26 .. v26}, Ljava/security/MessageDigest;->reset()V

    .line 570
    const/16 v19, 0x0

    .local v19, "i":I
    :goto_6
    move-object/from16 v0, v20

    array-length v0, v0

    move/from16 v26, v0

    move/from16 v0, v19

    move/from16 v1, v26

    if-ge v0, v1, :cond_a

    .line 571
    aget-object v23, v20, v19

    check-cast v23, Ljava/io/File;

    .line 574
    .restart local v23    # "src":Ljava/io/File;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Checksum;->allDigests:Ljava/util/Map;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    move-object/from16 v1, v23

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, [B

    .line 575
    .local v9, "digest":[B
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Checksum;->messageDigest:Ljava/security/MessageDigest;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    invoke-virtual {v0, v9}, Ljava/security/MessageDigest;->update([B)V

    .line 578
    move-object/from16 v0, p0

    move-object/from16 v1, v23

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/taskdefs/Checksum;->getRelativeFilePath(Ljava/io/File;)Ljava/lang/String;

    move-result-object v14

    .line 579
    .local v14, "fileName":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Checksum;->messageDigest:Ljava/security/MessageDigest;

    move-object/from16 v26, v0

    invoke-virtual {v14}, Ljava/lang/String;->getBytes()[B

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Ljava/security/MessageDigest;->update([B)V

    .line 570
    add-int/lit8 v19, v19, 0x1

    goto :goto_6

    .line 581
    .end local v9    # "digest":[B
    .end local v14    # "fileName":Ljava/lang/String;
    .end local v23    # "src":Ljava/io/File;
    :cond_a
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Checksum;->messageDigest:Ljava/security/MessageDigest;

    move-object/from16 v26, v0

    invoke-virtual/range {v26 .. v26}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v26

    move-object/from16 v0, p0

    move-object/from16 v1, v26

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/taskdefs/Checksum;->createDigestString([B)Ljava/lang/String;

    move-result-object v25

    .line 582
    .local v25, "totalChecksum":Ljava/lang/String;
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Checksum;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v26

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Checksum;->totalproperty:Ljava/lang/String;

    move-object/from16 v27, v0

    move-object/from16 v0, v26

    move-object/from16 v1, v27

    move-object/from16 v2, v25

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/Project;->setNewProperty(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_3
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    .line 587
    .end local v19    # "i":I
    .end local v20    # "keyArray":[Ljava/lang/Object;
    .end local v21    # "keys":Ljava/util/Set;
    .end local v25    # "totalChecksum":Ljava/lang/String;
    :cond_b
    invoke-static/range {v16 .. v16}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    .line 588
    invoke-static/range {v18 .. v18}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/OutputStream;)V

    .line 590
    return v6

    .line 587
    :catchall_1
    move-exception v26

    move-object/from16 v17, v18

    .restart local v17    # "fos":Ljava/io/FileOutputStream;
    move-object/from16 v15, v16

    .restart local v15    # "fis":Ljava/io/FileInputStream;
    goto/16 :goto_4

    .end local v16    # "fis":Ljava/lang/Object;
    .end local v17    # "fos":Ljava/io/FileOutputStream;
    .restart local v23    # "src":Ljava/io/File;
    :catchall_2
    move-exception v26

    move-object/from16 v17, v18

    .restart local v17    # "fos":Ljava/io/FileOutputStream;
    goto/16 :goto_4

    .line 584
    .end local v11    # "e":Ljava/util/Enumeration;
    .end local v18    # "fos":Ljava/lang/Object;
    .end local v23    # "src":Ljava/io/File;
    :catch_2
    move-exception v11

    goto/16 :goto_3

    .end local v15    # "fis":Ljava/io/FileInputStream;
    .end local v17    # "fos":Ljava/io/FileOutputStream;
    .restart local v11    # "e":Ljava/util/Enumeration;
    .restart local v16    # "fis":Ljava/lang/Object;
    .restart local v18    # "fos":Ljava/lang/Object;
    :catch_3
    move-exception v11

    move-object/from16 v17, v18

    .restart local v17    # "fos":Ljava/io/FileOutputStream;
    move-object/from16 v15, v16

    .restart local v15    # "fis":Ljava/io/FileInputStream;
    goto/16 :goto_3

    .end local v16    # "fis":Ljava/lang/Object;
    .end local v17    # "fos":Ljava/io/FileOutputStream;
    .restart local v5    # "checksum":Ljava/lang/String;
    .restart local v8    # "destination":Ljava/lang/Object;
    .restart local v10    # "dis":Ljava/security/DigestInputStream;
    .restart local v13    # "fileDigest":[B
    .restart local v23    # "src":Ljava/io/File;
    :cond_c
    move-object/from16 v17, v18

    .end local v18    # "fos":Ljava/lang/Object;
    .local v17, "fos":Ljava/lang/Object;
    goto/16 :goto_2
.end method

.method private getChecksumFile(Ljava/io/File;)Ljava/io/File;
    .locals 5
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 459
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Checksum;->todir:Ljava/io/File;

    if-eqz v3, :cond_0

    .line 461
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/taskdefs/Checksum;->getRelativeFilePath(Ljava/io/File;)Ljava/lang/String;

    move-result-object v2

    .line 462
    .local v2, "path":Ljava/lang/String;
    new-instance v3, Ljava/io/File;

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Checksum;->todir:Ljava/io/File;

    invoke-direct {v3, v4, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v1

    .line 464
    .local v1, "directory":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->mkdirs()Z

    .line 470
    .end local v2    # "path":Ljava/lang/String;
    :goto_0
    new-instance v0, Ljava/io/File;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {p1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Checksum;->fileext:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v1, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 471
    .local v0, "checksumFile":Ljava/io/File;
    return-object v0

    .line 468
    .end local v0    # "checksumFile":Ljava/io/File;
    .end local v1    # "directory":Ljava/io/File;
    :cond_0
    invoke-virtual {p1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v1

    .restart local v1    # "directory":Ljava/io/File;
    goto :goto_0
.end method

.method private getRelativeFilePath(Ljava/io/File;)Ljava/lang/String;
    .locals 4
    .param p1, "f"    # Ljava/io/File;

    .prologue
    .line 663
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Checksum;->relativeFilePaths:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 664
    .local v0, "path":Ljava/lang/String;
    if-nez v0, :cond_0

    .line 666
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "Internal error: relativeFilePaths could not match file "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, "\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, "please file a bug report on this"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 671
    :cond_0
    return-object v0
.end method

.method private readChecksum(Ljava/io/File;)Ljava/lang/String;
    .locals 7
    .param p1, "f"    # Ljava/io/File;

    .prologue
    .line 642
    const/4 v0, 0x0

    .line 644
    .local v0, "diskChecksumReader":Ljava/io/BufferedReader;
    :try_start_0
    new-instance v1, Ljava/io/BufferedReader;

    new-instance v4, Ljava/io/FileReader;

    invoke-direct {v4, p1}, Ljava/io/FileReader;-><init>(Ljava/io/File;)V

    invoke-direct {v1, v4}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 645
    .end local v0    # "diskChecksumReader":Ljava/io/BufferedReader;
    .local v1, "diskChecksumReader":Ljava/io/BufferedReader;
    :try_start_1
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Checksum;->format:Ljava/text/MessageFormat;

    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/text/MessageFormat;->parse(Ljava/lang/String;)[Ljava/lang/Object;

    move-result-object v3

    .line 646
    .local v3, "result":[Ljava/lang/Object;
    if-eqz v3, :cond_0

    array-length v4, v3

    if-eqz v4, :cond_0

    const/4 v4, 0x0

    aget-object v4, v3, v4

    if-nez v4, :cond_1

    .line 647
    :cond_0
    new-instance v4, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v5, "failed to find a checksum"

    invoke-direct {v4, v5}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v4
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/text/ParseException; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 650
    .end local v3    # "result":[Ljava/lang/Object;
    :catch_0
    move-exception v2

    move-object v0, v1

    .line 651
    .end local v1    # "diskChecksumReader":Ljava/io/BufferedReader;
    .restart local v0    # "diskChecksumReader":Ljava/io/BufferedReader;
    .local v2, "e":Ljava/io/IOException;
    :goto_0
    :try_start_2
    new-instance v4, Lorg/apache/tools/ant/BuildException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "Couldn\'t read checksum file "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 655
    .end local v2    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v4

    :goto_1
    invoke-static {v0}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/Reader;)V

    throw v4

    .line 649
    .end local v0    # "diskChecksumReader":Ljava/io/BufferedReader;
    .restart local v1    # "diskChecksumReader":Ljava/io/BufferedReader;
    .restart local v3    # "result":[Ljava/lang/Object;
    :cond_1
    const/4 v4, 0x0

    :try_start_3
    aget-object v4, v3, v4

    check-cast v4, Ljava/lang/String;
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Ljava/text/ParseException; {:try_start_3 .. :try_end_3} :catch_2
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 655
    invoke-static {v1}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/Reader;)V

    return-object v4

    .line 652
    .end local v1    # "diskChecksumReader":Ljava/io/BufferedReader;
    .end local v3    # "result":[Ljava/lang/Object;
    .restart local v0    # "diskChecksumReader":Ljava/io/BufferedReader;
    :catch_1
    move-exception v2

    .line 653
    .local v2, "e":Ljava/text/ParseException;
    :goto_2
    :try_start_4
    new-instance v4, Lorg/apache/tools/ant/BuildException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "Couldn\'t read checksum file "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 655
    .end local v0    # "diskChecksumReader":Ljava/io/BufferedReader;
    .end local v2    # "e":Ljava/text/ParseException;
    .restart local v1    # "diskChecksumReader":Ljava/io/BufferedReader;
    :catchall_1
    move-exception v4

    move-object v0, v1

    .end local v1    # "diskChecksumReader":Ljava/io/BufferedReader;
    .restart local v0    # "diskChecksumReader":Ljava/io/BufferedReader;
    goto :goto_1

    .line 652
    .end local v0    # "diskChecksumReader":Ljava/io/BufferedReader;
    .restart local v1    # "diskChecksumReader":Ljava/io/BufferedReader;
    :catch_2
    move-exception v2

    move-object v0, v1

    .end local v1    # "diskChecksumReader":Ljava/io/BufferedReader;
    .restart local v0    # "diskChecksumReader":Ljava/io/BufferedReader;
    goto :goto_2

    .line 650
    :catch_3
    move-exception v2

    goto :goto_0
.end method

.method private validateAndExecute()Z
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x1

    .line 326
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Checksum;->fileext:Ljava/lang/String;

    .line 328
    .local v5, "savedFileExt":Ljava/lang/String;
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/Checksum;->file:Ljava/io/File;

    if-nez v7, :cond_1

    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/Checksum;->resources:Lorg/apache/tools/ant/taskdefs/Checksum$FileUnion;

    if-eqz v7, :cond_0

    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/Checksum;->resources:Lorg/apache/tools/ant/taskdefs/Checksum$FileUnion;

    invoke-virtual {v7}, Lorg/apache/tools/ant/taskdefs/Checksum$FileUnion;->size()I

    move-result v7

    if-nez v7, :cond_1

    .line 329
    :cond_0
    new-instance v7, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v8, "Specify at least one source - a file or a resource collection."

    invoke-direct {v7, v8}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 332
    :cond_1
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/Checksum;->resources:Lorg/apache/tools/ant/taskdefs/Checksum$FileUnion;

    if-eqz v7, :cond_2

    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/Checksum;->resources:Lorg/apache/tools/ant/taskdefs/Checksum$FileUnion;

    invoke-virtual {v7}, Lorg/apache/tools/ant/taskdefs/Checksum$FileUnion;->isFilesystemOnly()Z

    move-result v7

    if-nez v7, :cond_2

    .line 333
    new-instance v7, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v8, "Can only calculate checksums for file-based resources."

    invoke-direct {v7, v8}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 335
    :cond_2
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/Checksum;->file:Ljava/io/File;

    if-eqz v7, :cond_3

    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/Checksum;->file:Ljava/io/File;

    invoke-virtual {v7}, Ljava/io/File;->exists()Z

    move-result v7

    if-eqz v7, :cond_3

    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/Checksum;->file:Ljava/io/File;

    invoke-virtual {v7}, Ljava/io/File;->isDirectory()Z

    move-result v7

    if-eqz v7, :cond_3

    .line 336
    new-instance v7, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v8, "Checksum cannot be generated for directories"

    invoke-direct {v7, v8}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 338
    :cond_3
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/Checksum;->file:Ljava/io/File;

    if-eqz v7, :cond_4

    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/Checksum;->totalproperty:Ljava/lang/String;

    if-eqz v7, :cond_4

    .line 339
    new-instance v7, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v8, "File and Totalproperty cannot co-exist."

    invoke-direct {v7, v8}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 341
    :cond_4
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/Checksum;->property:Ljava/lang/String;

    if-eqz v7, :cond_5

    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/Checksum;->fileext:Ljava/lang/String;

    if-eqz v7, :cond_5

    .line 342
    new-instance v7, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v8, "Property and FileExt cannot co-exist."

    invoke-direct {v7, v8}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 344
    :cond_5
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/Checksum;->property:Ljava/lang/String;

    if-eqz v7, :cond_9

    .line 345
    iget-boolean v7, p0, Lorg/apache/tools/ant/taskdefs/Checksum;->forceOverwrite:Z

    if-eqz v7, :cond_6

    .line 346
    new-instance v7, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v8, "ForceOverwrite cannot be used when Property is specified"

    invoke-direct {v7, v8}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 349
    :cond_6
    const/4 v0, 0x0

    .line 350
    .local v0, "ct":I
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/Checksum;->resources:Lorg/apache/tools/ant/taskdefs/Checksum$FileUnion;

    if-eqz v7, :cond_7

    .line 351
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/Checksum;->resources:Lorg/apache/tools/ant/taskdefs/Checksum$FileUnion;

    invoke-virtual {v7}, Lorg/apache/tools/ant/taskdefs/Checksum$FileUnion;->size()I

    move-result v7

    add-int/2addr v0, v7

    .line 353
    :cond_7
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/Checksum;->file:Ljava/io/File;

    if-eqz v7, :cond_8

    .line 354
    add-int/lit8 v0, v0, 0x1

    .line 356
    :cond_8
    if-le v0, v8, :cond_9

    .line 357
    new-instance v7, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v8, "Multiple files cannot be used when Property is specified"

    invoke-direct {v7, v8}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 361
    .end local v0    # "ct":I
    :cond_9
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/Checksum;->verifyProperty:Ljava/lang/String;

    if-eqz v7, :cond_a

    .line 362
    iput-boolean v8, p0, Lorg/apache/tools/ant/taskdefs/Checksum;->isCondition:Z

    .line 364
    :cond_a
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/Checksum;->verifyProperty:Ljava/lang/String;

    if-eqz v7, :cond_b

    iget-boolean v7, p0, Lorg/apache/tools/ant/taskdefs/Checksum;->forceOverwrite:Z

    if-eqz v7, :cond_b

    .line 365
    new-instance v7, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v8, "VerifyProperty and ForceOverwrite cannot co-exist."

    invoke-direct {v7, v8}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 367
    :cond_b
    iget-boolean v7, p0, Lorg/apache/tools/ant/taskdefs/Checksum;->isCondition:Z

    if-eqz v7, :cond_c

    iget-boolean v7, p0, Lorg/apache/tools/ant/taskdefs/Checksum;->forceOverwrite:Z

    if-eqz v7, :cond_c

    .line 368
    new-instance v7, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v8, "ForceOverwrite cannot be used when conditions are being used."

    invoke-direct {v7, v8}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 371
    :cond_c
    const/4 v7, 0x0

    iput-object v7, p0, Lorg/apache/tools/ant/taskdefs/Checksum;->messageDigest:Ljava/security/MessageDigest;

    .line 372
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/Checksum;->provider:Ljava/lang/String;

    if-eqz v7, :cond_d

    .line 374
    :try_start_0
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/Checksum;->algorithm:Ljava/lang/String;

    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/Checksum;->provider:Ljava/lang/String;

    invoke-static {v7, v8}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v7

    iput-object v7, p0, Lorg/apache/tools/ant/taskdefs/Checksum;->messageDigest:Ljava/security/MessageDigest;
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/security/NoSuchProviderException; {:try_start_0 .. :try_end_0} :catch_1

    .line 387
    :goto_0
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/Checksum;->messageDigest:Ljava/security/MessageDigest;

    if-nez v7, :cond_e

    .line 388
    new-instance v7, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v8, "Unable to create Message Digest"

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Checksum;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v9

    invoke-direct {v7, v8, v9}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v7

    .line 375
    :catch_0
    move-exception v2

    .line 376
    .local v2, "noalgo":Ljava/security/NoSuchAlgorithmException;
    new-instance v7, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Checksum;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v8

    invoke-direct {v7, v2, v8}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v7

    .line 377
    .end local v2    # "noalgo":Ljava/security/NoSuchAlgorithmException;
    :catch_1
    move-exception v3

    .line 378
    .local v3, "noprovider":Ljava/security/NoSuchProviderException;
    new-instance v7, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Checksum;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v8

    invoke-direct {v7, v3, v8}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v7

    .line 382
    .end local v3    # "noprovider":Ljava/security/NoSuchProviderException;
    :cond_d
    :try_start_1
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/Checksum;->algorithm:Ljava/lang/String;

    invoke-static {v7}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v7

    iput-object v7, p0, Lorg/apache/tools/ant/taskdefs/Checksum;->messageDigest:Ljava/security/MessageDigest;
    :try_end_1
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_1 .. :try_end_1} :catch_2

    goto :goto_0

    .line 383
    :catch_2
    move-exception v2

    .line 384
    .restart local v2    # "noalgo":Ljava/security/NoSuchAlgorithmException;
    new-instance v7, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Checksum;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v8

    invoke-direct {v7, v2, v8}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v7

    .line 390
    .end local v2    # "noalgo":Ljava/security/NoSuchAlgorithmException;
    :cond_e
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/Checksum;->fileext:Ljava/lang/String;

    if-nez v7, :cond_12

    .line 391
    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v8, "."

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/Checksum;->algorithm:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lorg/apache/tools/ant/taskdefs/Checksum;->fileext:Ljava/lang/String;

    .line 396
    :cond_f
    :try_start_2
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/Checksum;->resources:Lorg/apache/tools/ant/taskdefs/Checksum$FileUnion;

    if-eqz v7, :cond_14

    .line 397
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/Checksum;->resources:Lorg/apache/tools/ant/taskdefs/Checksum$FileUnion;

    invoke-virtual {v7}, Lorg/apache/tools/ant/taskdefs/Checksum$FileUnion;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_14

    .line 398
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/apache/tools/ant/types/Resource;

    .line 399
    .local v4, "r":Lorg/apache/tools/ant/types/Resource;
    sget-object v7, Lorg/apache/tools/ant/taskdefs/Checksum;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    if-nez v7, :cond_13

    const-string/jumbo v7, "org.apache.tools.ant.types.resources.FileProvider"

    invoke-static {v7}, Lorg/apache/tools/ant/taskdefs/Checksum;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v7

    sput-object v7, Lorg/apache/tools/ant/taskdefs/Checksum;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    :goto_2
    invoke-virtual {v4, v7}, Lorg/apache/tools/ant/types/Resource;->as(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lorg/apache/tools/ant/types/resources/FileProvider;

    invoke-interface {v7}, Lorg/apache/tools/ant/types/resources/FileProvider;->getFile()Ljava/io/File;

    move-result-object v6

    .line 401
    .local v6, "src":Ljava/io/File;
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/Checksum;->totalproperty:Ljava/lang/String;

    if-nez v7, :cond_10

    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/Checksum;->todir:Ljava/io/File;

    if-eqz v7, :cond_11

    .line 405
    :cond_10
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/Checksum;->relativeFilePaths:Ljava/util/Map;

    invoke-virtual {v4}, Lorg/apache/tools/ant/types/Resource;->getName()Ljava/lang/String;

    move-result-object v8

    sget-char v9, Ljava/io/File;->separatorChar:C

    const/16 v10, 0x2f

    invoke-virtual {v8, v9, v10}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v8

    invoke-interface {v7, v6, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 407
    :cond_11
    invoke-direct {p0, v6}, Lorg/apache/tools/ant/taskdefs/Checksum;->addToIncludeFileMap(Ljava/io/File;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1

    .line 419
    .end local v1    # "i":Ljava/util/Iterator;
    .end local v4    # "r":Lorg/apache/tools/ant/types/Resource;
    .end local v6    # "src":Ljava/io/File;
    :catchall_0
    move-exception v7

    iput-object v5, p0, Lorg/apache/tools/ant/taskdefs/Checksum;->fileext:Ljava/lang/String;

    .line 420
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/Checksum;->includeFileMap:Ljava/util/Hashtable;

    invoke-virtual {v8}, Ljava/util/Hashtable;->clear()V

    throw v7

    .line 392
    :cond_12
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/Checksum;->fileext:Ljava/lang/String;

    invoke-virtual {v7}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v7

    if-nez v7, :cond_f

    .line 393
    new-instance v7, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v8, "File extension when specified must not be an empty string"

    invoke-direct {v7, v8}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 399
    .restart local v1    # "i":Ljava/util/Iterator;
    .restart local v4    # "r":Lorg/apache/tools/ant/types/Resource;
    :cond_13
    :try_start_3
    sget-object v7, Lorg/apache/tools/ant/taskdefs/Checksum;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    goto :goto_2

    .line 410
    .end local v1    # "i":Ljava/util/Iterator;
    .end local v4    # "r":Lorg/apache/tools/ant/types/Resource;
    :cond_14
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/Checksum;->file:Ljava/io/File;

    if-eqz v7, :cond_17

    .line 411
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/Checksum;->totalproperty:Ljava/lang/String;

    if-nez v7, :cond_15

    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/Checksum;->todir:Ljava/io/File;

    if-eqz v7, :cond_16

    .line 412
    :cond_15
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/Checksum;->relativeFilePaths:Ljava/util/Map;

    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/Checksum;->file:Ljava/io/File;

    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/Checksum;->file:Ljava/io/File;

    invoke-virtual {v9}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v9

    sget-char v10, Ljava/io/File;->separatorChar:C

    const/16 v11, 0x2f

    invoke-virtual {v9, v10, v11}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v9

    invoke-interface {v7, v8, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 415
    :cond_16
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/Checksum;->file:Ljava/io/File;

    invoke-direct {p0, v7}, Lorg/apache/tools/ant/taskdefs/Checksum;->addToIncludeFileMap(Ljava/io/File;)V

    .line 417
    :cond_17
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/Checksum;->generateChecksums()Z
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    move-result v7

    .line 419
    iput-object v5, p0, Lorg/apache/tools/ant/taskdefs/Checksum;->fileext:Ljava/lang/String;

    .line 420
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/Checksum;->includeFileMap:Ljava/util/Hashtable;

    invoke-virtual {v8}, Ljava/util/Hashtable;->clear()V

    return v7
.end method


# virtual methods
.method public add(Lorg/apache/tools/ant/types/ResourceCollection;)V
    .locals 1
    .param p1, "rc"    # Lorg/apache/tools/ant/types/ResourceCollection;

    .prologue
    .line 289
    if-nez p1, :cond_0

    .line 294
    :goto_0
    return-void

    .line 292
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Checksum;->resources:Lorg/apache/tools/ant/taskdefs/Checksum$FileUnion;

    if-nez v0, :cond_1

    new-instance v0, Lorg/apache/tools/ant/taskdefs/Checksum$FileUnion;

    invoke-direct {v0}, Lorg/apache/tools/ant/taskdefs/Checksum$FileUnion;-><init>()V

    :goto_1
    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Checksum;->resources:Lorg/apache/tools/ant/taskdefs/Checksum$FileUnion;

    .line 293
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Checksum;->resources:Lorg/apache/tools/ant/taskdefs/Checksum$FileUnion;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/taskdefs/Checksum$FileUnion;->add(Lorg/apache/tools/ant/types/ResourceCollection;)V

    goto :goto_0

    .line 292
    :cond_1
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Checksum;->resources:Lorg/apache/tools/ant/taskdefs/Checksum$FileUnion;

    goto :goto_1
.end method

.method public addFileset(Lorg/apache/tools/ant/types/FileSet;)V
    .locals 0
    .param p1, "set"    # Lorg/apache/tools/ant/types/FileSet;

    .prologue
    .line 281
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/taskdefs/Checksum;->add(Lorg/apache/tools/ant/types/ResourceCollection;)V

    .line 282
    return-void
.end method

.method public eval()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 318
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Checksum;->isCondition:Z

    .line 319
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/Checksum;->validateAndExecute()Z

    move-result v0

    return v0
.end method

.method public execute()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 301
    const/4 v1, 0x0

    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/Checksum;->isCondition:Z

    .line 302
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/Checksum;->validateAndExecute()Z

    move-result v0

    .line 303
    .local v0, "value":Z
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Checksum;->verifyProperty:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 304
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Checksum;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Checksum;->verifyProperty:Ljava/lang/String;

    if-eqz v0, :cond_1

    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->toString()Ljava/lang/String;

    move-result-object v1

    :goto_0
    invoke-virtual {v2, v3, v1}, Lorg/apache/tools/ant/Project;->setNewProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 308
    :cond_0
    return-void

    .line 304
    :cond_1
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method public setAlgorithm(Ljava/lang/String;)V
    .locals 0
    .param p1, "algorithm"    # Ljava/lang/String;

    .prologue
    .line 187
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Checksum;->algorithm:Ljava/lang/String;

    .line 188
    return-void
.end method

.method public setFile(Ljava/io/File;)V
    .locals 0
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 168
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Checksum;->file:Ljava/io/File;

    .line 169
    return-void
.end method

.method public setFileext(Ljava/lang/String;)V
    .locals 0
    .param p1, "fileext"    # Ljava/lang/String;

    .prologue
    .line 205
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Checksum;->fileext:Ljava/lang/String;

    .line 206
    return-void
.end method

.method public setForceOverwrite(Z)V
    .locals 0
    .param p1, "forceOverwrite"    # Z

    .prologue
    .line 243
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Checksum;->forceOverwrite:Z

    .line 244
    return-void
.end method

.method public setFormat(Lorg/apache/tools/ant/taskdefs/Checksum$FormatElement;)V
    .locals 1
    .param p1, "e"    # Lorg/apache/tools/ant/taskdefs/Checksum$FormatElement;

    .prologue
    .line 261
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/Checksum$FormatElement;->getFormat()Ljava/text/MessageFormat;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Checksum;->format:Ljava/text/MessageFormat;

    .line 262
    return-void
.end method

.method public setPattern(Ljava/lang/String;)V
    .locals 1
    .param p1, "p"    # Ljava/lang/String;

    .prologue
    .line 273
    new-instance v0, Ljava/text/MessageFormat;

    invoke-direct {v0, p1}, Ljava/text/MessageFormat;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Checksum;->format:Ljava/text/MessageFormat;

    .line 274
    return-void
.end method

.method public setProperty(Ljava/lang/String;)V
    .locals 0
    .param p1, "property"    # Ljava/lang/String;

    .prologue
    .line 213
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Checksum;->property:Ljava/lang/String;

    .line 214
    return-void
.end method

.method public setProvider(Ljava/lang/String;)V
    .locals 0
    .param p1, "provider"    # Ljava/lang/String;

    .prologue
    .line 196
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Checksum;->provider:Ljava/lang/String;

    .line 197
    return-void
.end method

.method public setReadBufferSize(I)V
    .locals 0
    .param p1, "size"    # I

    .prologue
    .line 251
    iput p1, p0, Lorg/apache/tools/ant/taskdefs/Checksum;->readBufferSize:I

    .line 252
    return-void
.end method

.method public setTodir(Ljava/io/File;)V
    .locals 0
    .param p1, "todir"    # Ljava/io/File;

    .prologue
    .line 178
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Checksum;->todir:Ljava/io/File;

    .line 179
    return-void
.end method

.method public setTotalproperty(Ljava/lang/String;)V
    .locals 0
    .param p1, "totalproperty"    # Ljava/lang/String;

    .prologue
    .line 224
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Checksum;->totalproperty:Ljava/lang/String;

    .line 225
    return-void
.end method

.method public setVerifyproperty(Ljava/lang/String;)V
    .locals 0
    .param p1, "verifyProperty"    # Ljava/lang/String;

    .prologue
    .line 233
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Checksum;->verifyProperty:Ljava/lang/String;

    .line 234
    return-void
.end method
