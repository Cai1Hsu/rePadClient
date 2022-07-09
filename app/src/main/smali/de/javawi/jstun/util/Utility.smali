.class public Lde/javawi/jstun/util/Utility;
.super Ljava/lang/Object;
.source "Utility.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static final fourBytesToLong([B)J
    .locals 8
    .param p0, "value"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lde/javawi/jstun/util/UtilityException;
        }
    .end annotation

    .prologue
    .line 59
    array-length v4, p0

    const/4 v5, 0x4

    if-ge v4, v5, :cond_0

    .line 60
    new-instance v4, Lde/javawi/jstun/util/UtilityException;

    const-string/jumbo v5, "Byte array too short!"

    invoke-direct {v4, v5}, Lde/javawi/jstun/util/UtilityException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 62
    :cond_0
    const/4 v4, 0x0

    aget-byte v4, p0, v4

    and-int/lit16 v0, v4, 0xff

    .line 63
    .local v0, "temp0":I
    const/4 v4, 0x1

    aget-byte v4, p0, v4

    and-int/lit16 v1, v4, 0xff

    .line 64
    .local v1, "temp1":I
    const/4 v4, 0x2

    aget-byte v4, p0, v4

    and-int/lit16 v2, v4, 0xff

    .line 65
    .local v2, "temp2":I
    const/4 v4, 0x3

    aget-byte v4, p0, v4

    and-int/lit16 v3, v4, 0xff

    .line 66
    .local v3, "temp3":I
    int-to-long v4, v0

    const/16 v6, 0x18

    shl-long/2addr v4, v6

    shl-int/lit8 v6, v1, 0x10

    int-to-long v6, v6

    add-long/2addr v4, v6

    shl-int/lit8 v6, v2, 0x8

    int-to-long v6, v6

    add-long/2addr v4, v6

    int-to-long v6, v3

    add-long/2addr v4, v6

    return-wide v4
.end method

.method public static final integerToFourBytes(I)[B
    .locals 8
    .param p0, "value"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lde/javawi/jstun/util/UtilityException;
        }
    .end annotation

    .prologue
    .line 34
    const/4 v1, 0x4

    new-array v0, v1, [B

    .line 35
    .local v0, "result":[B
    int-to-double v2, p0

    const-wide/high16 v4, 0x4000000000000000L    # 2.0

    const-wide v6, 0x404f800000000000L    # 63.0

    invoke-static {v4, v5, v6, v7}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v4

    cmpl-double v1, v2, v4

    if-gtz v1, :cond_0

    if-gez p0, :cond_1

    .line 36
    :cond_0
    new-instance v1, Lde/javawi/jstun/util/UtilityException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Integer value "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, " is larger than 2^63"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lde/javawi/jstun/util/UtilityException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 38
    :cond_1
    const/4 v1, 0x0

    ushr-int/lit8 v2, p0, 0x18

    and-int/lit16 v2, v2, 0xff

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 39
    const/4 v1, 0x1

    ushr-int/lit8 v2, p0, 0x10

    and-int/lit16 v2, v2, 0xff

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 40
    const/4 v1, 0x2

    ushr-int/lit8 v2, p0, 0x8

    and-int/lit16 v2, v2, 0xff

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 41
    const/4 v1, 0x3

    and-int/lit16 v2, p0, 0xff

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 42
    return-object v0
.end method

.method public static final integerToOneByte(I)B
    .locals 6
    .param p0, "value"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lde/javawi/jstun/util/UtilityException;
        }
    .end annotation

    .prologue
    .line 17
    int-to-double v0, p0

    const-wide/high16 v2, 0x4000000000000000L    # 2.0

    const-wide/high16 v4, 0x402e000000000000L    # 15.0

    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v2

    cmpl-double v0, v0, v2

    if-gtz v0, :cond_0

    if-gez p0, :cond_1

    .line 18
    :cond_0
    new-instance v0, Lde/javawi/jstun/util/UtilityException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Integer value "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " is larger than 2^15"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lde/javawi/jstun/util/UtilityException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 20
    :cond_1
    and-int/lit16 v0, p0, 0xff

    int-to-byte v0, v0

    return v0
.end method

.method public static final integerToTwoBytes(I)[B
    .locals 8
    .param p0, "value"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lde/javawi/jstun/util/UtilityException;
        }
    .end annotation

    .prologue
    .line 24
    const/4 v1, 0x2

    new-array v0, v1, [B

    .line 25
    .local v0, "result":[B
    int-to-double v2, p0

    const-wide/high16 v4, 0x4000000000000000L    # 2.0

    const-wide/high16 v6, 0x403f000000000000L    # 31.0

    invoke-static {v4, v5, v6, v7}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v4

    cmpl-double v1, v2, v4

    if-gtz v1, :cond_0

    if-gez p0, :cond_1

    .line 26
    :cond_0
    new-instance v1, Lde/javawi/jstun/util/UtilityException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Integer value "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, " is larger than 2^31"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lde/javawi/jstun/util/UtilityException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 28
    :cond_1
    const/4 v1, 0x0

    ushr-int/lit8 v2, p0, 0x8

    and-int/lit16 v2, v2, 0xff

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 29
    const/4 v1, 0x1

    and-int/lit16 v2, p0, 0xff

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 30
    return-object v0
.end method

.method public static final oneByteToInteger(B)I
    .locals 1
    .param p0, "value"    # B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lde/javawi/jstun/util/UtilityException;
        }
    .end annotation

    .prologue
    .line 46
    and-int/lit16 v0, p0, 0xff

    return v0
.end method

.method public static final twoBytesToInteger([B)I
    .locals 4
    .param p0, "value"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lde/javawi/jstun/util/UtilityException;
        }
    .end annotation

    .prologue
    .line 50
    array-length v2, p0

    const/4 v3, 0x2

    if-ge v2, v3, :cond_0

    .line 51
    new-instance v2, Lde/javawi/jstun/util/UtilityException;

    const-string/jumbo v3, "Byte array too short!"

    invoke-direct {v2, v3}, Lde/javawi/jstun/util/UtilityException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 53
    :cond_0
    const/4 v2, 0x0

    aget-byte v2, p0, v2

    and-int/lit16 v0, v2, 0xff

    .line 54
    .local v0, "temp0":I
    const/4 v2, 0x1

    aget-byte v2, p0, v2

    and-int/lit16 v1, v2, 0xff

    .line 55
    .local v1, "temp1":I
    shl-int/lit8 v2, v0, 0x8

    add-int/2addr v2, v1

    return v2
.end method
