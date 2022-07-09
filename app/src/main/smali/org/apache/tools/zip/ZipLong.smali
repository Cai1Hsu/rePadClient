.class public final Lorg/apache/tools/zip/ZipLong;
.super Ljava/lang/Object;
.source "ZipLong.java"

# interfaces
.implements Ljava/lang/Cloneable;


# static fields
.field private static final BYTE_1:I = 0x1

.field private static final BYTE_1_MASK:I = 0xff00

.field private static final BYTE_1_SHIFT:I = 0x8

.field private static final BYTE_2:I = 0x2

.field private static final BYTE_2_MASK:I = 0xff0000

.field private static final BYTE_2_SHIFT:I = 0x10

.field private static final BYTE_3:I = 0x3

.field private static final BYTE_3_MASK:J = 0xff000000L

.field private static final BYTE_3_SHIFT:I = 0x18

.field private static final BYTE_MASK:I = 0xff

.field private static final WORD:I = 0x4


# instance fields
.field private value:J


# direct methods
.method public constructor <init>(J)V
    .locals 1
    .param p1, "value"    # J

    .prologue
    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    iput-wide p1, p0, Lorg/apache/tools/zip/ZipLong;->value:J

    .line 52
    return-void
.end method

.method public constructor <init>([B)V
    .locals 1
    .param p1, "bytes"    # [B

    .prologue
    .line 60
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/apache/tools/zip/ZipLong;-><init>([BI)V

    .line 61
    return-void
.end method

.method public constructor <init>([BI)V
    .locals 2
    .param p1, "bytes"    # [B
    .param p2, "offset"    # I

    .prologue
    .line 69
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 70
    invoke-static {p1, p2}, Lorg/apache/tools/zip/ZipLong;->getValue([BI)J

    move-result-wide v0

    iput-wide v0, p0, Lorg/apache/tools/zip/ZipLong;->value:J

    .line 71
    return-void
.end method

.method public static getBytes(J)[B
    .locals 6
    .param p0, "value"    # J

    .prologue
    .line 97
    const/4 v1, 0x4

    new-array v0, v1, [B

    .line 98
    .local v0, "result":[B
    const/4 v1, 0x0

    const-wide/16 v2, 0xff

    and-long/2addr v2, p0

    long-to-int v2, v2

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 99
    const/4 v1, 0x1

    const-wide/32 v2, 0xff00

    and-long/2addr v2, p0

    const/16 v4, 0x8

    shr-long/2addr v2, v4

    long-to-int v2, v2

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 100
    const/4 v1, 0x2

    const-wide/32 v2, 0xff0000

    and-long/2addr v2, p0

    const/16 v4, 0x10

    shr-long/2addr v2, v4

    long-to-int v2, v2

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 101
    const/4 v1, 0x3

    const-wide v2, 0xff000000L

    and-long/2addr v2, p0

    const/16 v4, 0x18

    shr-long/2addr v2, v4

    long-to-int v2, v2

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 102
    return-object v0
.end method

.method public static getValue([B)J
    .locals 2
    .param p0, "bytes"    # [B

    .prologue
    .line 125
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/apache/tools/zip/ZipLong;->getValue([BI)J

    move-result-wide v0

    return-wide v0
.end method

.method public static getValue([BI)J
    .locals 6
    .param p0, "bytes"    # [B
    .param p1, "offset"    # I

    .prologue
    .line 112
    add-int/lit8 v2, p1, 0x3

    aget-byte v2, p0, v2

    shl-int/lit8 v2, v2, 0x18

    int-to-long v2, v2

    const-wide v4, 0xff000000L

    and-long v0, v2, v4

    .line 113
    .local v0, "value":J
    add-int/lit8 v2, p1, 0x2

    aget-byte v2, p0, v2

    shl-int/lit8 v2, v2, 0x10

    const/high16 v3, 0xff0000

    and-int/2addr v2, v3

    int-to-long v2, v2

    add-long/2addr v0, v2

    .line 114
    add-int/lit8 v2, p1, 0x1

    aget-byte v2, p0, v2

    shl-int/lit8 v2, v2, 0x8

    const v3, 0xff00

    and-int/2addr v2, v3

    int-to-long v2, v2

    add-long/2addr v0, v2

    .line 115
    aget-byte v2, p0, p1

    and-int/lit16 v2, v2, 0xff

    int-to-long v2, v2

    add-long/2addr v0, v2

    .line 116
    return-wide v0
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .locals 2

    .prologue
    .line 152
    :try_start_0
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    .line 153
    :catch_0
    move-exception v0

    .line 155
    .local v0, "cnfe":Ljava/lang/CloneNotSupportedException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 6
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v0, 0x0

    .line 135
    if-eqz p1, :cond_0

    instance-of v1, p1, Lorg/apache/tools/zip/ZipLong;

    if-nez v1, :cond_1

    .line 138
    .end local p1    # "o":Ljava/lang/Object;
    :cond_0
    :goto_0
    return v0

    .restart local p1    # "o":Ljava/lang/Object;
    :cond_1
    iget-wide v2, p0, Lorg/apache/tools/zip/ZipLong;->value:J

    check-cast p1, Lorg/apache/tools/zip/ZipLong;

    .end local p1    # "o":Ljava/lang/Object;
    invoke-virtual {p1}, Lorg/apache/tools/zip/ZipLong;->getValue()J

    move-result-wide v4

    cmp-long v1, v2, v4

    if-nez v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0
.end method

.method public getBytes()[B
    .locals 2

    .prologue
    .line 79
    iget-wide v0, p0, Lorg/apache/tools/zip/ZipLong;->value:J

    invoke-static {v0, v1}, Lorg/apache/tools/zip/ZipLong;->getBytes(J)[B

    move-result-object v0

    return-object v0
.end method

.method public getValue()J
    .locals 2

    .prologue
    .line 88
    iget-wide v0, p0, Lorg/apache/tools/zip/ZipLong;->value:J

    return-wide v0
.end method

.method public hashCode()I
    .locals 2

    .prologue
    .line 147
    iget-wide v0, p0, Lorg/apache/tools/zip/ZipLong;->value:J

    long-to-int v0, v0

    return v0
.end method
