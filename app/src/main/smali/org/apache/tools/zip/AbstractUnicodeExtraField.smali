.class public abstract Lorg/apache/tools/zip/AbstractUnicodeExtraField;
.super Ljava/lang/Object;
.source "AbstractUnicodeExtraField.java"

# interfaces
.implements Lorg/apache/tools/zip/ZipExtraField;


# instance fields
.field private data:[B

.field private nameCRC32:J

.field private unicodeName:[B


# direct methods
.method protected constructor <init>()V
    .locals 0

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    return-void
.end method

.method protected constructor <init>(Ljava/lang/String;[B)V
    .locals 2
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "bytes"    # [B

    .prologue
    .line 72
    const/4 v0, 0x0

    array-length v1, p2

    invoke-direct {p0, p1, p2, v0, v1}, Lorg/apache/tools/zip/AbstractUnicodeExtraField;-><init>(Ljava/lang/String;[BII)V

    .line 73
    return-void
.end method

.method protected constructor <init>(Ljava/lang/String;[BII)V
    .locals 4
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "bytes"    # [B
    .param p3, "off"    # I
    .param p4, "len"    # I

    .prologue
    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    new-instance v0, Ljava/util/zip/CRC32;

    invoke-direct {v0}, Ljava/util/zip/CRC32;-><init>()V

    .line 51
    .local v0, "crc32":Ljava/util/zip/CRC32;
    invoke-virtual {v0, p2, p3, p4}, Ljava/util/zip/CRC32;->update([BII)V

    .line 52
    invoke-virtual {v0}, Ljava/util/zip/CRC32;->getValue()J

    move-result-wide v2

    iput-wide v2, p0, Lorg/apache/tools/zip/AbstractUnicodeExtraField;->nameCRC32:J

    .line 55
    :try_start_0
    const-string/jumbo v2, "UTF-8"

    invoke-virtual {p1, v2}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v2

    iput-object v2, p0, Lorg/apache/tools/zip/AbstractUnicodeExtraField;->unicodeName:[B
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 60
    return-void

    .line 56
    :catch_0
    move-exception v1

    .line 57
    .local v1, "e":Ljava/io/UnsupportedEncodingException;
    new-instance v2, Ljava/lang/RuntimeException;

    const-string/jumbo v3, "FATAL: UTF-8 encoding not supported."

    invoke-direct {v2, v3, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method

.method private assembleData()V
    .locals 5

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 76
    iget-object v0, p0, Lorg/apache/tools/zip/AbstractUnicodeExtraField;->unicodeName:[B

    if-nez v0, :cond_0

    .line 85
    :goto_0
    return-void

    .line 80
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/zip/AbstractUnicodeExtraField;->unicodeName:[B

    array-length v0, v0

    add-int/lit8 v0, v0, 0x5

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/apache/tools/zip/AbstractUnicodeExtraField;->data:[B

    .line 82
    iget-object v0, p0, Lorg/apache/tools/zip/AbstractUnicodeExtraField;->data:[B

    aput-byte v3, v0, v4

    .line 83
    iget-wide v0, p0, Lorg/apache/tools/zip/AbstractUnicodeExtraField;->nameCRC32:J

    invoke-static {v0, v1}, Lorg/apache/tools/zip/ZipLong;->getBytes(J)[B

    move-result-object v0

    iget-object v1, p0, Lorg/apache/tools/zip/AbstractUnicodeExtraField;->data:[B

    const/4 v2, 0x4

    invoke-static {v0, v4, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 84
    iget-object v0, p0, Lorg/apache/tools/zip/AbstractUnicodeExtraField;->unicodeName:[B

    iget-object v1, p0, Lorg/apache/tools/zip/AbstractUnicodeExtraField;->data:[B

    const/4 v2, 0x5

    iget-object v3, p0, Lorg/apache/tools/zip/AbstractUnicodeExtraField;->unicodeName:[B

    array-length v3, v3

    invoke-static {v0, v4, v1, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_0
.end method


# virtual methods
.method public getCentralDirectoryData()[B
    .locals 1

    .prologue
    .line 120
    iget-object v0, p0, Lorg/apache/tools/zip/AbstractUnicodeExtraField;->data:[B

    if-nez v0, :cond_0

    .line 121
    invoke-direct {p0}, Lorg/apache/tools/zip/AbstractUnicodeExtraField;->assembleData()V

    .line 123
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/zip/AbstractUnicodeExtraField;->data:[B

    return-object v0
.end method

.method public getCentralDirectoryLength()Lorg/apache/tools/zip/ZipShort;
    .locals 2

    .prologue
    .line 127
    iget-object v0, p0, Lorg/apache/tools/zip/AbstractUnicodeExtraField;->data:[B

    if-nez v0, :cond_0

    .line 128
    invoke-direct {p0}, Lorg/apache/tools/zip/AbstractUnicodeExtraField;->assembleData()V

    .line 130
    :cond_0
    new-instance v0, Lorg/apache/tools/zip/ZipShort;

    iget-object v1, p0, Lorg/apache/tools/zip/AbstractUnicodeExtraField;->data:[B

    array-length v1, v1

    invoke-direct {v0, v1}, Lorg/apache/tools/zip/ZipShort;-><init>(I)V

    return-object v0
.end method

.method public getLocalFileDataData()[B
    .locals 1

    .prologue
    .line 134
    invoke-virtual {p0}, Lorg/apache/tools/zip/AbstractUnicodeExtraField;->getCentralDirectoryData()[B

    move-result-object v0

    return-object v0
.end method

.method public getLocalFileDataLength()Lorg/apache/tools/zip/ZipShort;
    .locals 1

    .prologue
    .line 138
    invoke-virtual {p0}, Lorg/apache/tools/zip/AbstractUnicodeExtraField;->getCentralDirectoryLength()Lorg/apache/tools/zip/ZipShort;

    move-result-object v0

    return-object v0
.end method

.method public getNameCRC32()J
    .locals 2

    .prologue
    .line 92
    iget-wide v0, p0, Lorg/apache/tools/zip/AbstractUnicodeExtraField;->nameCRC32:J

    return-wide v0
.end method

.method public getUnicodeName()[B
    .locals 1

    .prologue
    .line 108
    iget-object v0, p0, Lorg/apache/tools/zip/AbstractUnicodeExtraField;->unicodeName:[B

    return-object v0
.end method

.method public parseFromLocalFileData([BII)V
    .locals 5
    .param p1, "buffer"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/zip/ZipException;
        }
    .end annotation

    .prologue
    .line 144
    const/4 v1, 0x5

    if-ge p3, v1, :cond_0

    .line 145
    new-instance v1, Ljava/util/zip/ZipException;

    const-string/jumbo v2, "UniCode path extra data must have at least 5 bytes."

    invoke-direct {v1, v2}, Ljava/util/zip/ZipException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 149
    :cond_0
    aget-byte v0, p1, p2

    .line 151
    .local v0, "version":I
    const/4 v1, 0x1

    if-eq v0, v1, :cond_1

    .line 152
    new-instance v1, Ljava/util/zip/ZipException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "Unsupported version ["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, "] for UniCode path extra data."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/util/zip/ZipException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 156
    :cond_1
    add-int/lit8 v1, p2, 0x1

    invoke-static {p1, v1}, Lorg/apache/tools/zip/ZipLong;->getValue([BI)J

    move-result-wide v2

    iput-wide v2, p0, Lorg/apache/tools/zip/AbstractUnicodeExtraField;->nameCRC32:J

    .line 157
    add-int/lit8 v1, p3, -0x5

    new-array v1, v1, [B

    iput-object v1, p0, Lorg/apache/tools/zip/AbstractUnicodeExtraField;->unicodeName:[B

    .line 158
    add-int/lit8 v1, p2, 0x5

    iget-object v2, p0, Lorg/apache/tools/zip/AbstractUnicodeExtraField;->unicodeName:[B

    const/4 v3, 0x0

    add-int/lit8 v4, p3, -0x5

    invoke-static {p1, v1, v2, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 159
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/apache/tools/zip/AbstractUnicodeExtraField;->data:[B

    .line 160
    return-void
.end method

.method public setNameCRC32(J)V
    .locals 1
    .param p1, "nameCRC32"    # J

    .prologue
    .line 100
    iput-wide p1, p0, Lorg/apache/tools/zip/AbstractUnicodeExtraField;->nameCRC32:J

    .line 101
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/zip/AbstractUnicodeExtraField;->data:[B

    .line 102
    return-void
.end method

.method public setUnicodeName([B)V
    .locals 1
    .param p1, "unicodeName"    # [B

    .prologue
    .line 115
    iput-object p1, p0, Lorg/apache/tools/zip/AbstractUnicodeExtraField;->unicodeName:[B

    .line 116
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/zip/AbstractUnicodeExtraField;->data:[B

    .line 117
    return-void
.end method
