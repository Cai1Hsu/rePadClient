.class Lorg/apache/commons/compress/archivers/dump/DumpArchiveUtil;
.super Ljava/lang/Object;
.source "DumpArchiveUtil.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    return-void
.end method

.method public static calculateChecksum([B)I
    .locals 4
    .param p0, "buffer"    # [B

    .prologue
    .line 39
    const/4 v0, 0x0

    .line 41
    .local v0, "calc":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    const/16 v2, 0x100

    if-ge v1, v2, :cond_0

    .line 42
    mul-int/lit8 v2, v1, 0x4

    invoke-static {p0, v2}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveUtil;->convert32([BI)I

    move-result v2

    add-int/2addr v0, v2

    .line 41
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 45
    :cond_0
    const v2, 0x149de

    const/16 v3, 0x1c

    invoke-static {p0, v3}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveUtil;->convert32([BI)I

    move-result v3

    sub-int v3, v0, v3

    sub-int/2addr v2, v3

    return v2
.end method

.method public static final convert16([BI)I
    .locals 3
    .param p0, "buffer"    # [B
    .param p1, "offset"    # I

    .prologue
    .line 127
    const/4 v0, 0x0

    .line 128
    .local v0, "i":I
    add-int/lit8 v1, p1, 0x1

    aget-byte v1, p0, v1

    shl-int/lit8 v1, v1, 0x8

    const v2, 0xff00

    and-int/2addr v1, v2

    add-int/2addr v0, v1

    .line 129
    aget-byte v1, p0, p1

    and-int/lit16 v1, v1, 0xff

    add-int/2addr v0, v1

    .line 131
    return v0
.end method

.method public static final convert32([BI)I
    .locals 3
    .param p0, "buffer"    # [B
    .param p1, "offset"    # I

    .prologue
    .line 110
    const/4 v0, 0x0

    .line 111
    .local v0, "i":I
    add-int/lit8 v1, p1, 0x3

    aget-byte v1, p0, v1

    shl-int/lit8 v0, v1, 0x18

    .line 112
    add-int/lit8 v1, p1, 0x2

    aget-byte v1, p0, v1

    shl-int/lit8 v1, v1, 0x10

    const/high16 v2, 0xff0000

    and-int/2addr v1, v2

    add-int/2addr v0, v1

    .line 113
    add-int/lit8 v1, p1, 0x1

    aget-byte v1, p0, v1

    shl-int/lit8 v1, v1, 0x8

    const v2, 0xff00

    and-int/2addr v1, v2

    add-int/2addr v0, v1

    .line 114
    aget-byte v1, p0, p1

    and-int/lit16 v1, v1, 0xff

    add-int/2addr v0, v1

    .line 116
    return v0
.end method

.method public static final convert64([BI)J
    .locals 6
    .param p0, "buffer"    # [B
    .param p1, "offset"    # I

    .prologue
    .line 89
    const-wide/16 v0, 0x0

    .line 90
    .local v0, "i":J
    add-int/lit8 v2, p1, 0x7

    aget-byte v2, p0, v2

    int-to-long v2, v2

    const/16 v4, 0x38

    shl-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 91
    add-int/lit8 v2, p1, 0x6

    aget-byte v2, p0, v2

    int-to-long v2, v2

    const/16 v4, 0x30

    shl-long/2addr v2, v4

    const-wide/high16 v4, 0xff000000000000L

    and-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 92
    add-int/lit8 v2, p1, 0x5

    aget-byte v2, p0, v2

    int-to-long v2, v2

    const/16 v4, 0x28

    shl-long/2addr v2, v4

    const-wide v4, 0xff0000000000L

    and-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 93
    add-int/lit8 v2, p1, 0x4

    aget-byte v2, p0, v2

    int-to-long v2, v2

    const/16 v4, 0x20

    shl-long/2addr v2, v4

    const-wide v4, 0xff00000000L

    and-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 94
    add-int/lit8 v2, p1, 0x3

    aget-byte v2, p0, v2

    int-to-long v2, v2

    const/16 v4, 0x18

    shl-long/2addr v2, v4

    const-wide v4, 0xff000000L

    and-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 95
    add-int/lit8 v2, p1, 0x2

    aget-byte v2, p0, v2

    int-to-long v2, v2

    const/16 v4, 0x10

    shl-long/2addr v2, v4

    const-wide/32 v4, 0xff0000

    and-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 96
    add-int/lit8 v2, p1, 0x1

    aget-byte v2, p0, v2

    int-to-long v2, v2

    const/16 v4, 0x8

    shl-long/2addr v2, v4

    const-wide/32 v4, 0xff00

    and-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 97
    aget-byte v2, p0, p1

    int-to-long v2, v2

    const-wide/16 v4, 0xff

    and-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 99
    return-wide v0
.end method

.method public static final getIno([B)I
    .locals 1
    .param p0, "buffer"    # [B

    .prologue
    .line 78
    const/16 v0, 0x14

    invoke-static {p0, v0}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveUtil;->convert32([BI)I

    move-result v0

    return v0
.end method

.method public static final verify([B)Z
    .locals 4
    .param p0, "buffer"    # [B

    .prologue
    const/4 v2, 0x0

    .line 56
    const/16 v3, 0x18

    invoke-static {p0, v3}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveUtil;->convert32([BI)I

    move-result v1

    .line 58
    .local v1, "magic":I
    const v3, 0xea6c

    if-eq v1, v3, :cond_1

    .line 69
    :cond_0
    :goto_0
    return v2

    .line 63
    :cond_1
    const/16 v3, 0x1c

    invoke-static {p0, v3}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveUtil;->convert32([BI)I

    move-result v0

    .line 65
    .local v0, "checksum":I
    invoke-static {p0}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveUtil;->calculateChecksum([B)I

    move-result v3

    if-ne v0, v3, :cond_0

    .line 69
    const/4 v2, 0x1

    goto :goto_0
.end method
