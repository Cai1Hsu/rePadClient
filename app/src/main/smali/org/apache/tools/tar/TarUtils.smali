.class public Lorg/apache/tools/tar/TarUtils;
.super Ljava/lang/Object;
.source "TarUtils.java"


# static fields
.field private static final BYTE_MASK:I = 0xff


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static computeCheckSum([B)J
    .locals 6
    .param p0, "buf"    # [B

    .prologue
    .line 198
    const-wide/16 v2, 0x0

    .line 200
    .local v2, "sum":J
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v1, p0

    if-ge v0, v1, :cond_0

    .line 201
    aget-byte v1, p0, v0

    and-int/lit16 v1, v1, 0xff

    int-to-long v4, v1

    add-long/2addr v2, v4

    .line 200
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 204
    :cond_0
    return-wide v2
.end method

.method public static getCheckSumOctalBytes(J[BII)I
    .locals 2
    .param p0, "value"    # J
    .param p2, "buf"    # [B
    .param p3, "offset"    # I
    .param p4, "length"    # I

    .prologue
    .line 183
    invoke-static {p0, p1, p2, p3, p4}, Lorg/apache/tools/tar/TarUtils;->getOctalBytes(J[BII)I

    .line 185
    add-int v0, p3, p4

    add-int/lit8 v0, v0, -0x1

    const/16 v1, 0x20

    aput-byte v1, p2, v0

    .line 186
    add-int v0, p3, p4

    add-int/lit8 v0, v0, -0x2

    const/4 v1, 0x0

    aput-byte v1, p2, v0

    .line 188
    add-int v0, p3, p4

    return v0
.end method

.method public static getLongOctalBytes(J[BII)I
    .locals 4
    .param p0, "value"    # J
    .param p2, "buf"    # [B
    .param p3, "offset"    # I
    .param p4, "length"    # I

    .prologue
    const/4 v2, 0x0

    .line 165
    add-int/lit8 v1, p4, 0x1

    new-array v0, v1, [B

    .line 167
    .local v0, "temp":[B
    add-int/lit8 v1, p4, 0x1

    invoke-static {p0, p1, v0, v2, v1}, Lorg/apache/tools/tar/TarUtils;->getOctalBytes(J[BII)I

    .line 168
    invoke-static {v0, v2, p2, p3, p4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 170
    add-int v1, p3, p4

    return v1
.end method

.method public static getNameBytes(Ljava/lang/StringBuffer;[BII)I
    .locals 3
    .param p0, "name"    # Ljava/lang/StringBuffer;
    .param p1, "buf"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I

    .prologue
    .line 108
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, p3, :cond_0

    invoke-virtual {p0}, Ljava/lang/StringBuffer;->length()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 109
    add-int v1, p2, v0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuffer;->charAt(I)C

    move-result v2

    int-to-byte v2, v2

    aput-byte v2, p1, v1

    .line 108
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 112
    :cond_0
    :goto_1
    if-ge v0, p3, :cond_1

    .line 113
    add-int v1, p2, v0

    const/4 v2, 0x0

    aput-byte v2, p1, v1

    .line 112
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 116
    :cond_1
    add-int v1, p2, p3

    return v1
.end method

.method public static getOctalBytes(J[BII)I
    .locals 10
    .param p0, "value"    # J
    .param p2, "buf"    # [B
    .param p3, "offset"    # I
    .param p4, "length"    # I

    .prologue
    const-wide/16 v8, 0x0

    const/16 v6, 0x20

    .line 129
    add-int/lit8 v0, p4, -0x1

    .line 131
    .local v0, "idx":I
    add-int v1, p3, v0

    const/4 v4, 0x0

    aput-byte v4, p2, v1

    .line 132
    add-int/lit8 v0, v0, -0x1

    .line 133
    add-int v1, p3, v0

    aput-byte v6, p2, v1

    .line 134
    add-int/lit8 v0, v0, -0x1

    .line 136
    cmp-long v1, p0, v8

    if-nez v1, :cond_1

    .line 137
    add-int v1, p3, v0

    const/16 v4, 0x30

    aput-byte v4, p2, v1

    .line 138
    add-int/lit8 v0, v0, -0x1

    .line 148
    :cond_0
    :goto_0
    if-ltz v0, :cond_2

    .line 149
    add-int v1, p3, v0

    aput-byte v6, p2, v1

    .line 148
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 140
    :cond_1
    move-wide v2, p0

    .local v2, "val":J
    :goto_1
    if-ltz v0, :cond_0

    cmp-long v1, v2, v8

    if-lez v1, :cond_0

    .line 142
    add-int v1, p3, v0

    const-wide/16 v4, 0x7

    and-long/2addr v4, v2

    long-to-int v4, v4

    int-to-byte v4, v4

    add-int/lit8 v4, v4, 0x30

    int-to-byte v4, v4

    aput-byte v4, p2, v1

    .line 143
    const/4 v1, 0x3

    shr-long/2addr v2, v1

    .line 140
    add-int/lit8 v0, v0, -0x1

    goto :goto_1

    .line 152
    .end local v2    # "val":J
    :cond_2
    add-int v1, p3, p4

    return v1
.end method

.method public static parseName([BII)Ljava/lang/StringBuffer;
    .locals 4
    .param p0, "header"    # [B
    .param p1, "offset"    # I
    .param p2, "length"    # I

    .prologue
    .line 82
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2, p2}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 83
    .local v2, "result":Ljava/lang/StringBuffer;
    add-int v0, p1, p2

    .line 85
    .local v0, "end":I
    move v1, p1

    .local v1, "i":I
    :goto_0
    if-ge v1, v0, :cond_0

    .line 86
    aget-byte v3, p0, v1

    if-nez v3, :cond_1

    .line 93
    :cond_0
    return-object v2

    .line 90
    :cond_1
    aget-byte v3, p0, v1

    int-to-char v3, v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 85
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method public static parseOctal([BII)J
    .locals 11
    .param p0, "header"    # [B
    .param p1, "offset"    # I
    .param p2, "length"    # I

    .prologue
    const/16 v10, 0x20

    .line 45
    const-wide/16 v2, 0x0

    .line 46
    .local v2, "result":J
    const/4 v4, 0x1

    .line 47
    .local v4, "stillPadding":Z
    add-int v0, p1, p2

    .line 49
    .local v0, "end":I
    move v1, p1

    .local v1, "i":I
    :goto_0
    if-ge v1, v0, :cond_0

    .line 50
    aget-byte v5, p0, v1

    if-nez v5, :cond_1

    .line 70
    :cond_0
    return-wide v2

    .line 54
    :cond_1
    aget-byte v5, p0, v1

    if-eq v5, v10, :cond_2

    aget-byte v5, p0, v1

    const/16 v6, 0x30

    if-ne v5, v6, :cond_4

    .line 55
    :cond_2
    if-eqz v4, :cond_3

    .line 49
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 59
    :cond_3
    aget-byte v5, p0, v1

    if-eq v5, v10, :cond_0

    .line 64
    :cond_4
    const/4 v4, 0x0

    .line 66
    const/4 v5, 0x3

    shl-long v6, v2, v5

    aget-byte v5, p0, v1

    add-int/lit8 v5, v5, -0x30

    int-to-long v8, v5

    add-long v2, v6, v8

    goto :goto_1
.end method
