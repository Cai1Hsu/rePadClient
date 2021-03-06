.class public abstract Lorg/apache/commons/compress/archivers/zip/ZipUtil;
.super Ljava/lang/Object;
.source "ZipUtil.java"


# static fields
.field private static final DOS_TIME_MIN:[B


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 34
    const-wide/16 v0, 0x2100

    invoke-static {v0, v1}, Lorg/apache/commons/compress/archivers/zip/ZipLong;->getBytes(J)[B

    move-result-object v0

    sput-object v0, Lorg/apache/commons/compress/archivers/zip/ZipUtil;->DOS_TIME_MIN:[B

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static adjustToLong(I)J
    .locals 4
    .param p0, "i"    # I

    .prologue
    .line 81
    if-gez p0, :cond_0

    .line 82
    const-wide v0, 0x100000000L

    int-to-long v2, p0

    add-long/2addr v0, v2

    .line 84
    :goto_0
    return-wide v0

    :cond_0
    int-to-long v0, p0

    goto :goto_0
.end method

.method static canHandleEntryData(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;)Z
    .locals 1
    .param p0, "entry"    # Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    .prologue
    .line 192
    invoke-static {p0}, Lorg/apache/commons/compress/archivers/zip/ZipUtil;->supportsEncryptionOf(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {p0}, Lorg/apache/commons/compress/archivers/zip/ZipUtil;->supportsMethodOf(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method static checkRequestedFeatures(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;)V
    .locals 2
    .param p0, "ze"    # Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/compress/archivers/zip/UnsupportedZipFeatureException;
        }
    .end annotation

    .prologue
    .line 222
    invoke-static {p0}, Lorg/apache/commons/compress/archivers/zip/ZipUtil;->supportsEncryptionOf(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 223
    new-instance v0, Lorg/apache/commons/compress/archivers/zip/UnsupportedZipFeatureException;

    sget-object v1, Lorg/apache/commons/compress/archivers/zip/UnsupportedZipFeatureException$Feature;->ENCRYPTION:Lorg/apache/commons/compress/archivers/zip/UnsupportedZipFeatureException$Feature;

    invoke-direct {v0, v1, p0}, Lorg/apache/commons/compress/archivers/zip/UnsupportedZipFeatureException;-><init>(Lorg/apache/commons/compress/archivers/zip/UnsupportedZipFeatureException$Feature;Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;)V

    throw v0

    .line 227
    :cond_0
    invoke-static {p0}, Lorg/apache/commons/compress/archivers/zip/ZipUtil;->supportsMethodOf(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 228
    new-instance v0, Lorg/apache/commons/compress/archivers/zip/UnsupportedZipFeatureException;

    sget-object v1, Lorg/apache/commons/compress/archivers/zip/UnsupportedZipFeatureException$Feature;->METHOD:Lorg/apache/commons/compress/archivers/zip/UnsupportedZipFeatureException$Feature;

    invoke-direct {v0, v1, p0}, Lorg/apache/commons/compress/archivers/zip/UnsupportedZipFeatureException;-><init>(Lorg/apache/commons/compress/archivers/zip/UnsupportedZipFeatureException$Feature;Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;)V

    throw v0

    .line 232
    :cond_1
    return-void
.end method

.method static copy([B)[B
    .locals 3
    .param p0, "from"    # [B

    .prologue
    const/4 v2, 0x0

    .line 180
    if-eqz p0, :cond_0

    .line 181
    array-length v1, p0

    new-array v0, v1, [B

    .line 182
    .local v0, "to":[B
    array-length v1, v0

    invoke-static {p0, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 185
    .end local v0    # "to":[B
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static dosToJavaTime(J)J
    .locals 10
    .param p0, "dosTime"    # J

    .prologue
    const/16 v8, 0xb

    const/4 v7, 0x5

    const/4 v6, 0x1

    .line 104
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 106
    .local v0, "cal":Ljava/util/Calendar;
    const/16 v1, 0x19

    shr-long v2, p0, v1

    const-wide/16 v4, 0x7f

    and-long/2addr v2, v4

    long-to-int v1, v2

    add-int/lit16 v1, v1, 0x7bc

    invoke-virtual {v0, v6, v1}, Ljava/util/Calendar;->set(II)V

    .line 107
    const/4 v1, 0x2

    const/16 v2, 0x15

    shr-long v2, p0, v2

    const-wide/16 v4, 0xf

    and-long/2addr v2, v4

    long-to-int v2, v2

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->set(II)V

    .line 108
    const/16 v1, 0x10

    shr-long v2, p0, v1

    long-to-int v1, v2

    and-int/lit8 v1, v1, 0x1f

    invoke-virtual {v0, v7, v1}, Ljava/util/Calendar;->set(II)V

    .line 109
    shr-long v2, p0, v8

    long-to-int v1, v2

    and-int/lit8 v1, v1, 0x1f

    invoke-virtual {v0, v8, v1}, Ljava/util/Calendar;->set(II)V

    .line 110
    const/16 v1, 0xc

    shr-long v2, p0, v7

    long-to-int v2, v2

    and-int/lit8 v2, v2, 0x3f

    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->set(II)V

    .line 111
    const/16 v1, 0xd

    shl-long v2, p0, v6

    long-to-int v2, v2

    and-int/lit8 v2, v2, 0x3e

    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->set(II)V

    .line 113
    invoke-virtual {v0}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/Date;->getTime()J

    move-result-wide v2

    return-wide v2
.end method

.method public static fromDosTime(Lorg/apache/commons/compress/archivers/zip/ZipLong;)Ljava/util/Date;
    .locals 6
    .param p0, "zipDosTime"    # Lorg/apache/commons/compress/archivers/zip/ZipLong;

    .prologue
    .line 95
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/zip/ZipLong;->getValue()J

    move-result-wide v0

    .line 96
    .local v0, "dosTime":J
    new-instance v2, Ljava/util/Date;

    invoke-static {v0, v1}, Lorg/apache/commons/compress/archivers/zip/ZipUtil;->dosToJavaTime(J)J

    move-result-wide v4

    invoke-direct {v2, v4, v5}, Ljava/util/Date;-><init>(J)V

    return-object v2
.end method

.method private static getUnicodeStringIfOriginalMatches(Lorg/apache/commons/compress/archivers/zip/AbstractUnicodeExtraField;[B)Ljava/lang/String;
    .locals 8
    .param p0, "f"    # Lorg/apache/commons/compress/archivers/zip/AbstractUnicodeExtraField;
    .param p1, "orig"    # [B

    .prologue
    const/4 v4, 0x0

    .line 154
    if-eqz p0, :cond_0

    .line 155
    new-instance v0, Ljava/util/zip/CRC32;

    invoke-direct {v0}, Ljava/util/zip/CRC32;-><init>()V

    .line 156
    .local v0, "crc32":Ljava/util/zip/CRC32;
    invoke-virtual {v0, p1}, Ljava/util/zip/CRC32;->update([B)V

    .line 157
    invoke-virtual {v0}, Ljava/util/zip/CRC32;->getValue()J

    move-result-wide v2

    .line 159
    .local v2, "origCRC32":J
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/zip/AbstractUnicodeExtraField;->getNameCRC32()J

    move-result-wide v6

    cmp-long v5, v2, v6

    if-nez v5, :cond_0

    .line 161
    :try_start_0
    sget-object v5, Lorg/apache/commons/compress/archivers/zip/ZipEncodingHelper;->UTF8_ZIP_ENCODING:Lorg/apache/commons/compress/archivers/zip/ZipEncoding;

    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/zip/AbstractUnicodeExtraField;->getUnicodeName()[B

    move-result-object v6

    invoke-interface {v5, v6}, Lorg/apache/commons/compress/archivers/zip/ZipEncoding;->decode([B)Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v4

    .line 172
    .end local v0    # "crc32":Ljava/util/zip/CRC32;
    .end local v2    # "origCRC32":J
    :cond_0
    :goto_0
    return-object v4

    .line 163
    .restart local v0    # "crc32":Ljava/util/zip/CRC32;
    .restart local v2    # "origCRC32":J
    :catch_0
    move-exception v1

    .line 168
    .local v1, "ex":Ljava/io/IOException;
    goto :goto_0
.end method

.method static setNameAndCommentFromExtraFields(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;[B[B)V
    .locals 6
    .param p0, "ze"    # Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    .param p1, "originalNameBytes"    # [B
    .param p2, "commentBytes"    # [B

    .prologue
    .line 124
    sget-object v5, Lorg/apache/commons/compress/archivers/zip/UnicodePathExtraField;->UPATH_ID:Lorg/apache/commons/compress/archivers/zip/ZipShort;

    invoke-virtual {p0, v5}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getExtraField(Lorg/apache/commons/compress/archivers/zip/ZipShort;)Lorg/apache/commons/compress/archivers/zip/ZipExtraField;

    move-result-object v1

    check-cast v1, Lorg/apache/commons/compress/archivers/zip/UnicodePathExtraField;

    .line 126
    .local v1, "name":Lorg/apache/commons/compress/archivers/zip/UnicodePathExtraField;
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getName()Ljava/lang/String;

    move-result-object v4

    .line 127
    .local v4, "originalName":Ljava/lang/String;
    invoke-static {v1, p1}, Lorg/apache/commons/compress/archivers/zip/ZipUtil;->getUnicodeStringIfOriginalMatches(Lorg/apache/commons/compress/archivers/zip/AbstractUnicodeExtraField;[B)Ljava/lang/String;

    move-result-object v3

    .line 129
    .local v3, "newName":Ljava/lang/String;
    if-eqz v3, :cond_0

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 130
    invoke-virtual {p0, v3}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->setName(Ljava/lang/String;)V

    .line 133
    :cond_0
    if-eqz p2, :cond_1

    array-length v5, p2

    if-lez v5, :cond_1

    .line 134
    sget-object v5, Lorg/apache/commons/compress/archivers/zip/UnicodeCommentExtraField;->UCOM_ID:Lorg/apache/commons/compress/archivers/zip/ZipShort;

    invoke-virtual {p0, v5}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getExtraField(Lorg/apache/commons/compress/archivers/zip/ZipShort;)Lorg/apache/commons/compress/archivers/zip/ZipExtraField;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/compress/archivers/zip/UnicodeCommentExtraField;

    .line 136
    .local v0, "cmt":Lorg/apache/commons/compress/archivers/zip/UnicodeCommentExtraField;
    invoke-static {v0, p2}, Lorg/apache/commons/compress/archivers/zip/ZipUtil;->getUnicodeStringIfOriginalMatches(Lorg/apache/commons/compress/archivers/zip/AbstractUnicodeExtraField;[B)Ljava/lang/String;

    move-result-object v2

    .line 138
    .local v2, "newComment":Ljava/lang/String;
    if-eqz v2, :cond_1

    .line 139
    invoke-virtual {p0, v2}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->setComment(Ljava/lang/String;)V

    .line 142
    .end local v0    # "cmt":Lorg/apache/commons/compress/archivers/zip/UnicodeCommentExtraField;
    .end local v2    # "newComment":Ljava/lang/String;
    :cond_1
    return-void
.end method

.method private static supportsEncryptionOf(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;)Z
    .locals 1
    .param p0, "entry"    # Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    .prologue
    .line 202
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getGeneralPurposeBit()Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;->usesEncryption()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static supportsMethodOf(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;)Z
    .locals 2
    .param p0, "entry"    # Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    .prologue
    .line 212
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getMethod()I

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getMethod()I

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

.method public static toDosTime(Ljava/util/Date;)Lorg/apache/commons/compress/archivers/zip/ZipLong;
    .locals 4
    .param p0, "time"    # Ljava/util/Date;

    .prologue
    .line 42
    new-instance v0, Lorg/apache/commons/compress/archivers/zip/ZipLong;

    invoke-virtual {p0}, Ljava/util/Date;->getTime()J

    move-result-wide v2

    invoke-static {v2, v3}, Lorg/apache/commons/compress/archivers/zip/ZipUtil;->toDosTime(J)[B

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/commons/compress/archivers/zip/ZipLong;-><init>([B)V

    return-object v0
.end method

.method public static toDosTime(J)[B
    .locals 8
    .param p0, "t"    # J

    .prologue
    .line 53
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 54
    .local v0, "c":Ljava/util/Calendar;
    invoke-virtual {v0, p0, p1}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 56
    const/4 v5, 0x1

    invoke-virtual {v0, v5}, Ljava/util/Calendar;->get(I)I

    move-result v4

    .line 57
    .local v4, "year":I
    const/16 v5, 0x7bc

    if-ge v4, v5, :cond_0

    .line 58
    sget-object v5, Lorg/apache/commons/compress/archivers/zip/ZipUtil;->DOS_TIME_MIN:[B

    invoke-static {v5}, Lorg/apache/commons/compress/archivers/zip/ZipUtil;->copy([B)[B

    move-result-object v5

    .line 67
    :goto_0
    return-object v5

    .line 60
    :cond_0
    const/4 v5, 0x2

    invoke-virtual {v0, v5}, Ljava/util/Calendar;->get(I)I

    move-result v5

    add-int/lit8 v1, v5, 0x1

    .line 61
    .local v1, "month":I
    add-int/lit16 v5, v4, -0x7bc

    shl-int/lit8 v5, v5, 0x19

    shl-int/lit8 v6, v1, 0x15

    or-int/2addr v5, v6

    const/4 v6, 0x5

    invoke-virtual {v0, v6}, Ljava/util/Calendar;->get(I)I

    move-result v6

    shl-int/lit8 v6, v6, 0x10

    or-int/2addr v5, v6

    const/16 v6, 0xb

    invoke-virtual {v0, v6}, Ljava/util/Calendar;->get(I)I

    move-result v6

    shl-int/lit8 v6, v6, 0xb

    or-int/2addr v5, v6

    const/16 v6, 0xc

    invoke-virtual {v0, v6}, Ljava/util/Calendar;->get(I)I

    move-result v6

    shl-int/lit8 v6, v6, 0x5

    or-int/2addr v5, v6

    const/16 v6, 0xd

    invoke-virtual {v0, v6}, Ljava/util/Calendar;->get(I)I

    move-result v6

    shr-int/lit8 v6, v6, 0x1

    or-int/2addr v5, v6

    int-to-long v2, v5

    .line 67
    .local v2, "value":J
    invoke-static {v2, v3}, Lorg/apache/commons/compress/archivers/zip/ZipLong;->getBytes(J)[B

    move-result-object v5

    goto :goto_0
.end method
