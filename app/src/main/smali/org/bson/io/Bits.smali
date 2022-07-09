.class public Lorg/bson/io/Bits;
.super Ljava/lang/Object;
.source "Bits.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static readFully(Ljava/io/InputStream;[B)V
    .locals 1
    .param p0, "in"    # Ljava/io/InputStream;
    .param p1, "b"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 30
    array-length v0, p1

    invoke-static {p0, p1, v0}, Lorg/bson/io/Bits;->readFully(Ljava/io/InputStream;[BI)V

    .line 31
    return-void
.end method

.method public static readFully(Ljava/io/InputStream;[BI)V
    .locals 1
    .param p0, "in"    # Ljava/io/InputStream;
    .param p1, "b"    # [B
    .param p2, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 35
    const/4 v0, 0x0

    invoke-static {p0, p1, v0, p2}, Lorg/bson/io/Bits;->readFully(Ljava/io/InputStream;[BII)V

    .line 36
    return-void
.end method

.method public static readFully(Ljava/io/InputStream;[BII)V
    .locals 5
    .param p0, "in"    # Ljava/io/InputStream;
    .param p1, "b"    # [B
    .param p2, "startOffset"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 41
    array-length v3, p1

    add-int v4, p3, p2

    if-ge v3, v4, :cond_0

    .line 42
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v4, "Buffer is too small"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 45
    :cond_0
    move v1, p2

    .line 46
    .local v1, "offset":I
    move v2, p3

    .line 47
    .local v2, "toRead":I
    :goto_0
    if-lez v2, :cond_2

    .line 48
    invoke-virtual {p0, p1, v1, v2}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    .line 49
    .local v0, "bytesRead":I
    if-gez v0, :cond_1

    .line 50
    new-instance v3, Ljava/io/EOFException;

    invoke-direct {v3}, Ljava/io/EOFException;-><init>()V

    throw v3

    .line 51
    :cond_1
    sub-int/2addr v2, v0

    .line 52
    add-int/2addr v1, v0

    .line 53
    goto :goto_0

    .line 54
    .end local v0    # "bytesRead":I
    :cond_2
    return-void
.end method

.method public static readInt(Ljava/io/InputStream;)I
    .locals 1
    .param p0, "in"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 58
    const/4 v0, 0x4

    new-array v0, v0, [B

    invoke-static {p0, v0}, Lorg/bson/io/Bits;->readInt(Ljava/io/InputStream;[B)I

    move-result v0

    return v0
.end method

.method public static readInt(Ljava/io/InputStream;[B)I
    .locals 1
    .param p0, "in"    # Ljava/io/InputStream;
    .param p1, "data"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 63
    const/4 v0, 0x4

    invoke-static {p0, p1, v0}, Lorg/bson/io/Bits;->readFully(Ljava/io/InputStream;[BI)V

    .line 64
    invoke-static {p1}, Lorg/bson/io/Bits;->readInt([B)I

    move-result v0

    return v0
.end method

.method public static readInt([B)I
    .locals 1
    .param p0, "data"    # [B

    .prologue
    .line 68
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/bson/io/Bits;->readInt([BI)I

    move-result v0

    return v0
.end method

.method public static readInt([BI)I
    .locals 2
    .param p0, "data"    # [B
    .param p1, "offset"    # I

    .prologue
    .line 72
    const/4 v0, 0x0

    .line 73
    .local v0, "x":I
    add-int/lit8 v1, p1, 0x0

    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x0

    or-int/2addr v0, v1

    .line 74
    add-int/lit8 v1, p1, 0x1

    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x8

    or-int/2addr v0, v1

    .line 75
    add-int/lit8 v1, p1, 0x2

    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x10

    or-int/2addr v0, v1

    .line 76
    add-int/lit8 v1, p1, 0x3

    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x18

    or-int/2addr v0, v1

    .line 77
    return v0
.end method

.method public static readIntBE([BI)I
    .locals 2
    .param p0, "data"    # [B
    .param p1, "offset"    # I

    .prologue
    .line 81
    const/4 v0, 0x0

    .line 82
    .local v0, "x":I
    add-int/lit8 v1, p1, 0x0

    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x18

    or-int/2addr v0, v1

    .line 83
    add-int/lit8 v1, p1, 0x1

    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x10

    or-int/2addr v0, v1

    .line 84
    add-int/lit8 v1, p1, 0x2

    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x8

    or-int/2addr v0, v1

    .line 85
    add-int/lit8 v1, p1, 0x3

    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x0

    or-int/2addr v0, v1

    .line 86
    return v0
.end method

.method public static readLong(Ljava/io/InputStream;)J
    .locals 2
    .param p0, "in"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 91
    const/16 v0, 0x8

    new-array v0, v0, [B

    invoke-static {p0, v0}, Lorg/bson/io/Bits;->readLong(Ljava/io/InputStream;[B)J

    move-result-wide v0

    return-wide v0
.end method

.method public static readLong(Ljava/io/InputStream;[B)J
    .locals 2
    .param p0, "in"    # Ljava/io/InputStream;
    .param p1, "data"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 97
    const/16 v0, 0x8

    invoke-static {p0, p1, v0}, Lorg/bson/io/Bits;->readFully(Ljava/io/InputStream;[BI)V

    .line 98
    invoke-static {p1}, Lorg/bson/io/Bits;->readLong([B)J

    move-result-wide v0

    return-wide v0
.end method

.method public static readLong([B)J
    .locals 2
    .param p0, "data"    # [B

    .prologue
    .line 102
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/bson/io/Bits;->readLong([BI)J

    move-result-wide v0

    return-wide v0
.end method

.method public static readLong([BI)J
    .locals 8
    .param p0, "data"    # [B
    .param p1, "offset"    # I

    .prologue
    const-wide/16 v6, 0xff

    .line 106
    const-wide/16 v0, 0x0

    .line 107
    .local v0, "x":J
    add-int/lit8 v2, p1, 0x0

    aget-byte v2, p0, v2

    int-to-long v2, v2

    and-long/2addr v2, v6

    const/4 v4, 0x0

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    .line 108
    add-int/lit8 v2, p1, 0x1

    aget-byte v2, p0, v2

    int-to-long v2, v2

    and-long/2addr v2, v6

    const/16 v4, 0x8

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    .line 109
    add-int/lit8 v2, p1, 0x2

    aget-byte v2, p0, v2

    int-to-long v2, v2

    and-long/2addr v2, v6

    const/16 v4, 0x10

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    .line 110
    add-int/lit8 v2, p1, 0x3

    aget-byte v2, p0, v2

    int-to-long v2, v2

    and-long/2addr v2, v6

    const/16 v4, 0x18

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    .line 111
    add-int/lit8 v2, p1, 0x4

    aget-byte v2, p0, v2

    int-to-long v2, v2

    and-long/2addr v2, v6

    const/16 v4, 0x20

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    .line 112
    add-int/lit8 v2, p1, 0x5

    aget-byte v2, p0, v2

    int-to-long v2, v2

    and-long/2addr v2, v6

    const/16 v4, 0x28

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    .line 113
    add-int/lit8 v2, p1, 0x6

    aget-byte v2, p0, v2

    int-to-long v2, v2

    and-long/2addr v2, v6

    const/16 v4, 0x30

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    .line 114
    add-int/lit8 v2, p1, 0x7

    aget-byte v2, p0, v2

    int-to-long v2, v2

    and-long/2addr v2, v6

    const/16 v4, 0x38

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    .line 115
    return-wide v0
.end method
