.class public Lorg/apache/commons/net/ntp/NtpV3Impl;
.super Ljava/lang/Object;
.source "NtpV3Impl.java"

# interfaces
.implements Lorg/apache/commons/net/ntp/NtpV3Packet;


# static fields
.field private static final LI_INDEX:I = 0x0

.field private static final LI_SHIFT:I = 0x6

.field private static final MODE_INDEX:I = 0x0

.field private static final MODE_SHIFT:I = 0x0

.field private static final ORIGINATE_TIMESTAMP_INDEX:I = 0x18

.field private static final POLL_INDEX:I = 0x2

.field private static final PRECISION_INDEX:I = 0x3

.field private static final RECEIVE_TIMESTAMP_INDEX:I = 0x20

.field private static final REFERENCE_ID_INDEX:I = 0xc

.field private static final REFERENCE_TIMESTAMP_INDEX:I = 0x10

.field private static final ROOT_DELAY_INDEX:I = 0x4

.field private static final ROOT_DISPERSION_INDEX:I = 0x8

.field private static final STRATUM_INDEX:I = 0x1

.field private static final TRANSMIT_TIMESTAMP_INDEX:I = 0x28

.field private static final VERSION_INDEX:I = 0x0

.field private static final VERSION_SHIFT:I = 0x3


# instance fields
.field private final buf:[B

.field private volatile dp:Ljava/net/DatagramPacket;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 64
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 58
    const/16 v0, 0x30

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/apache/commons/net/ntp/NtpV3Impl;->buf:[B

    .line 65
    return-void
.end method

.method private getInt(I)I
    .locals 4
    .param p1, "index"    # I

    .prologue
    .line 454
    iget-object v1, p0, Lorg/apache/commons/net/ntp/NtpV3Impl;->buf:[B

    aget-byte v1, v1, p1

    invoke-static {v1}, Lorg/apache/commons/net/ntp/NtpV3Impl;->ui(B)I

    move-result v1

    shl-int/lit8 v1, v1, 0x18

    iget-object v2, p0, Lorg/apache/commons/net/ntp/NtpV3Impl;->buf:[B

    add-int/lit8 v3, p1, 0x1

    aget-byte v2, v2, v3

    invoke-static {v2}, Lorg/apache/commons/net/ntp/NtpV3Impl;->ui(B)I

    move-result v2

    shl-int/lit8 v2, v2, 0x10

    or-int/2addr v1, v2

    iget-object v2, p0, Lorg/apache/commons/net/ntp/NtpV3Impl;->buf:[B

    add-int/lit8 v3, p1, 0x2

    aget-byte v2, v2, v3

    invoke-static {v2}, Lorg/apache/commons/net/ntp/NtpV3Impl;->ui(B)I

    move-result v2

    shl-int/lit8 v2, v2, 0x8

    or-int/2addr v1, v2

    iget-object v2, p0, Lorg/apache/commons/net/ntp/NtpV3Impl;->buf:[B

    add-int/lit8 v3, p1, 0x3

    aget-byte v2, v2, v3

    invoke-static {v2}, Lorg/apache/commons/net/ntp/NtpV3Impl;->ui(B)I

    move-result v2

    or-int v0, v1, v2

    .line 459
    .local v0, "i":I
    return v0
.end method

.method private getLong(I)J
    .locals 7
    .param p1, "index"    # I

    .prologue
    .line 480
    iget-object v2, p0, Lorg/apache/commons/net/ntp/NtpV3Impl;->buf:[B

    aget-byte v2, v2, p1

    invoke-static {v2}, Lorg/apache/commons/net/ntp/NtpV3Impl;->ul(B)J

    move-result-wide v2

    const/16 v4, 0x38

    shl-long/2addr v2, v4

    iget-object v4, p0, Lorg/apache/commons/net/ntp/NtpV3Impl;->buf:[B

    add-int/lit8 v5, p1, 0x1

    aget-byte v4, v4, v5

    invoke-static {v4}, Lorg/apache/commons/net/ntp/NtpV3Impl;->ul(B)J

    move-result-wide v4

    const/16 v6, 0x30

    shl-long/2addr v4, v6

    or-long/2addr v2, v4

    iget-object v4, p0, Lorg/apache/commons/net/ntp/NtpV3Impl;->buf:[B

    add-int/lit8 v5, p1, 0x2

    aget-byte v4, v4, v5

    invoke-static {v4}, Lorg/apache/commons/net/ntp/NtpV3Impl;->ul(B)J

    move-result-wide v4

    const/16 v6, 0x28

    shl-long/2addr v4, v6

    or-long/2addr v2, v4

    iget-object v4, p0, Lorg/apache/commons/net/ntp/NtpV3Impl;->buf:[B

    add-int/lit8 v5, p1, 0x3

    aget-byte v4, v4, v5

    invoke-static {v4}, Lorg/apache/commons/net/ntp/NtpV3Impl;->ul(B)J

    move-result-wide v4

    const/16 v6, 0x20

    shl-long/2addr v4, v6

    or-long/2addr v2, v4

    iget-object v4, p0, Lorg/apache/commons/net/ntp/NtpV3Impl;->buf:[B

    add-int/lit8 v5, p1, 0x4

    aget-byte v4, v4, v5

    invoke-static {v4}, Lorg/apache/commons/net/ntp/NtpV3Impl;->ul(B)J

    move-result-wide v4

    const/16 v6, 0x18

    shl-long/2addr v4, v6

    or-long/2addr v2, v4

    iget-object v4, p0, Lorg/apache/commons/net/ntp/NtpV3Impl;->buf:[B

    add-int/lit8 v5, p1, 0x5

    aget-byte v4, v4, v5

    invoke-static {v4}, Lorg/apache/commons/net/ntp/NtpV3Impl;->ul(B)J

    move-result-wide v4

    const/16 v6, 0x10

    shl-long/2addr v4, v6

    or-long/2addr v2, v4

    iget-object v4, p0, Lorg/apache/commons/net/ntp/NtpV3Impl;->buf:[B

    add-int/lit8 v5, p1, 0x6

    aget-byte v4, v4, v5

    invoke-static {v4}, Lorg/apache/commons/net/ntp/NtpV3Impl;->ul(B)J

    move-result-wide v4

    const/16 v6, 0x8

    shl-long/2addr v4, v6

    or-long/2addr v2, v4

    iget-object v4, p0, Lorg/apache/commons/net/ntp/NtpV3Impl;->buf:[B

    add-int/lit8 v5, p1, 0x7

    aget-byte v4, v4, v5

    invoke-static {v4}, Lorg/apache/commons/net/ntp/NtpV3Impl;->ul(B)J

    move-result-wide v4

    or-long v0, v2, v4

    .line 488
    .local v0, "i":J
    return-wide v0
.end method

.method private getTimestamp(I)Lorg/apache/commons/net/ntp/TimeStamp;
    .locals 4
    .param p1, "index"    # I

    .prologue
    .line 470
    new-instance v0, Lorg/apache/commons/net/ntp/TimeStamp;

    invoke-direct {p0, p1}, Lorg/apache/commons/net/ntp/NtpV3Impl;->getLong(I)J

    move-result-wide v2

    invoke-direct {v0, v2, v3}, Lorg/apache/commons/net/ntp/TimeStamp;-><init>(J)V

    return-object v0
.end method

.method private idAsHex()Ljava/lang/String;
    .locals 1

    .prologue
    .line 347
    invoke-virtual {p0}, Lorg/apache/commons/net/ntp/NtpV3Impl;->getReferenceId()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private idAsIPAddress()Ljava/lang/String;
    .locals 3

    .prologue
    .line 326
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lorg/apache/commons/net/ntp/NtpV3Impl;->buf:[B

    const/16 v2, 0xc

    aget-byte v1, v1, v2

    invoke-static {v1}, Lorg/apache/commons/net/ntp/NtpV3Impl;->ui(B)I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/commons/net/ntp/NtpV3Impl;->buf:[B

    const/16 v2, 0xd

    aget-byte v1, v1, v2

    invoke-static {v1}, Lorg/apache/commons/net/ntp/NtpV3Impl;->ui(B)I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/commons/net/ntp/NtpV3Impl;->buf:[B

    const/16 v2, 0xe

    aget-byte v1, v1, v2

    invoke-static {v1}, Lorg/apache/commons/net/ntp/NtpV3Impl;->ui(B)I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/commons/net/ntp/NtpV3Impl;->buf:[B

    const/16 v2, 0xf

    aget-byte v1, v1, v2

    invoke-static {v1}, Lorg/apache/commons/net/ntp/NtpV3Impl;->ui(B)I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private idAsString()Ljava/lang/String;
    .locals 5

    .prologue
    .line 334
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 335
    .local v2, "id":Ljava/lang/StringBuilder;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    const/4 v3, 0x3

    if-gt v1, v3, :cond_0

    .line 336
    iget-object v3, p0, Lorg/apache/commons/net/ntp/NtpV3Impl;->buf:[B

    add-int/lit8 v4, v1, 0xc

    aget-byte v3, v3, v4

    int-to-char v0, v3

    .line 337
    .local v0, "c":C
    if-nez v0, :cond_1

    .line 342
    .end local v0    # "c":C
    :cond_0
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3

    .line 340
    .restart local v0    # "c":C
    :cond_1
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 335
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method private setTimestamp(ILorg/apache/commons/net/ntp/TimeStamp;)V
    .locals 8
    .param p1, "index"    # I
    .param p2, "t"    # Lorg/apache/commons/net/ntp/TimeStamp;

    .prologue
    .line 499
    if-nez p2, :cond_0

    const-wide/16 v2, 0x0

    .line 502
    .local v2, "ntpTime":J
    :goto_0
    const/4 v0, 0x7

    .local v0, "i":I
    :goto_1
    if-ltz v0, :cond_1

    .line 503
    iget-object v1, p0, Lorg/apache/commons/net/ntp/NtpV3Impl;->buf:[B

    add-int v4, p1, v0

    const-wide/16 v6, 0xff

    and-long/2addr v6, v2

    long-to-int v5, v6

    int-to-byte v5, v5

    aput-byte v5, v1, v4

    .line 504
    const/16 v1, 0x8

    ushr-long/2addr v2, v1

    .line 502
    add-int/lit8 v0, v0, -0x1

    goto :goto_1

    .line 499
    .end local v0    # "i":I
    .end local v2    # "ntpTime":J
    :cond_0
    invoke-virtual {p2}, Lorg/apache/commons/net/ntp/TimeStamp;->ntpValue()J

    move-result-wide v2

    goto :goto_0

    .line 507
    .restart local v0    # "i":I
    .restart local v2    # "ntpTime":J
    :cond_1
    return-void
.end method

.method protected static final ui(B)I
    .locals 1
    .param p0, "b"    # B

    .prologue
    .line 549
    and-int/lit16 v0, p0, 0xff

    .line 550
    .local v0, "i":I
    return v0
.end method

.method protected static final ul(B)J
    .locals 3
    .param p0, "b"    # B

    .prologue
    .line 563
    and-int/lit16 v2, p0, 0xff

    int-to-long v0, v2

    .line 564
    .local v0, "i":J
    return-wide v0
.end method


# virtual methods
.method public declared-synchronized getDatagramPacket()Ljava/net/DatagramPacket;
    .locals 3

    .prologue
    .line 516
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lorg/apache/commons/net/ntp/NtpV3Impl;->dp:Ljava/net/DatagramPacket;

    if-nez v0, :cond_0

    .line 517
    new-instance v0, Ljava/net/DatagramPacket;

    iget-object v1, p0, Lorg/apache/commons/net/ntp/NtpV3Impl;->buf:[B

    iget-object v2, p0, Lorg/apache/commons/net/ntp/NtpV3Impl;->buf:[B

    array-length v2, v2

    invoke-direct {v0, v1, v2}, Ljava/net/DatagramPacket;-><init>([BI)V

    iput-object v0, p0, Lorg/apache/commons/net/ntp/NtpV3Impl;->dp:Ljava/net/DatagramPacket;

    .line 518
    iget-object v0, p0, Lorg/apache/commons/net/ntp/NtpV3Impl;->dp:Ljava/net/DatagramPacket;

    const/16 v1, 0x7b

    invoke-virtual {v0, v1}, Ljava/net/DatagramPacket;->setPort(I)V

    .line 520
    :cond_0
    iget-object v0, p0, Lorg/apache/commons/net/ntp/NtpV3Impl;->dp:Ljava/net/DatagramPacket;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    .line 516
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getLeapIndicator()I
    .locals 2

    .prologue
    .line 108
    iget-object v0, p0, Lorg/apache/commons/net/ntp/NtpV3Impl;->buf:[B

    const/4 v1, 0x0

    aget-byte v0, v0, v1

    invoke-static {v0}, Lorg/apache/commons/net/ntp/NtpV3Impl;->ui(B)I

    move-result v0

    shr-int/lit8 v0, v0, 0x6

    and-int/lit8 v0, v0, 0x3

    return v0
.end method

.method public getMode()I
    .locals 2

    .prologue
    .line 75
    iget-object v0, p0, Lorg/apache/commons/net/ntp/NtpV3Impl;->buf:[B

    const/4 v1, 0x0

    aget-byte v0, v0, v1

    invoke-static {v0}, Lorg/apache/commons/net/ntp/NtpV3Impl;->ui(B)I

    move-result v0

    shr-int/lit8 v0, v0, 0x0

    and-int/lit8 v0, v0, 0x7

    return v0
.end method

.method public getModeName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 85
    invoke-virtual {p0}, Lorg/apache/commons/net/ntp/NtpV3Impl;->getMode()I

    move-result v0

    invoke-static {v0}, Lorg/apache/commons/net/ntp/NtpUtils;->getModeName(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getOriginateTimeStamp()Lorg/apache/commons/net/ntp/TimeStamp;
    .locals 1

    .prologue
    .line 391
    const/16 v0, 0x18

    invoke-direct {p0, v0}, Lorg/apache/commons/net/ntp/NtpV3Impl;->getTimestamp(I)Lorg/apache/commons/net/ntp/TimeStamp;

    move-result-object v0

    return-object v0
.end method

.method public getPoll()I
    .locals 2

    .prologue
    .line 131
    iget-object v0, p0, Lorg/apache/commons/net/ntp/NtpV3Impl;->buf:[B

    const/4 v1, 0x2

    aget-byte v0, v0, v1

    return v0
.end method

.method public getPrecision()I
    .locals 2

    .prologue
    .line 153
    iget-object v0, p0, Lorg/apache/commons/net/ntp/NtpV3Impl;->buf:[B

    const/4 v1, 0x3

    aget-byte v0, v0, v1

    return v0
.end method

.method public getReceiveTimeStamp()Lorg/apache/commons/net/ntp/TimeStamp;
    .locals 1

    .prologue
    .line 424
    const/16 v0, 0x20

    invoke-direct {p0, v0}, Lorg/apache/commons/net/ntp/NtpV3Impl;->getTimestamp(I)Lorg/apache/commons/net/ntp/TimeStamp;

    move-result-object v0

    return-object v0
.end method

.method public getReferenceId()I
    .locals 1

    .prologue
    .line 287
    const/16 v0, 0xc

    invoke-direct {p0, v0}, Lorg/apache/commons/net/ntp/NtpV3Impl;->getInt(I)I

    move-result v0

    return v0
.end method

.method public getReferenceIdString()Ljava/lang/String;
    .locals 4

    .prologue
    const/4 v3, 0x4

    .line 300
    invoke-virtual {p0}, Lorg/apache/commons/net/ntp/NtpV3Impl;->getVersion()I

    move-result v1

    .line 301
    .local v1, "version":I
    invoke-virtual {p0}, Lorg/apache/commons/net/ntp/NtpV3Impl;->getStratum()I

    move-result v0

    .line 302
    .local v0, "stratum":I
    const/4 v2, 0x3

    if-eq v1, v2, :cond_0

    if-ne v1, v3, :cond_3

    .line 303
    :cond_0
    if-eqz v0, :cond_1

    const/4 v2, 0x1

    if-ne v0, v2, :cond_2

    .line 304
    :cond_1
    invoke-direct {p0}, Lorg/apache/commons/net/ntp/NtpV3Impl;->idAsString()Ljava/lang/String;

    move-result-object v2

    .line 317
    :goto_0
    return-object v2

    .line 307
    :cond_2
    if-ne v1, v3, :cond_3

    .line 308
    invoke-direct {p0}, Lorg/apache/commons/net/ntp/NtpV3Impl;->idAsHex()Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    .line 314
    :cond_3
    const/4 v2, 0x2

    if-lt v0, v2, :cond_4

    .line 315
    invoke-direct {p0}, Lorg/apache/commons/net/ntp/NtpV3Impl;->idAsIPAddress()Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    .line 317
    :cond_4
    invoke-direct {p0}, Lorg/apache/commons/net/ntp/NtpV3Impl;->idAsHex()Ljava/lang/String;

    move-result-object v2

    goto :goto_0
.end method

.method public getReferenceTimeStamp()Lorg/apache/commons/net/ntp/TimeStamp;
    .locals 1

    .prologue
    .line 402
    const/16 v0, 0x10

    invoke-direct {p0, v0}, Lorg/apache/commons/net/ntp/NtpV3Impl;->getTimestamp(I)Lorg/apache/commons/net/ntp/TimeStamp;

    move-result-object v0

    return-object v0
.end method

.method public getRootDelay()I
    .locals 1

    .prologue
    .line 216
    const/4 v0, 0x4

    invoke-direct {p0, v0}, Lorg/apache/commons/net/ntp/NtpV3Impl;->getInt(I)I

    move-result v0

    return v0
.end method

.method public getRootDelayInMillisDouble()D
    .locals 4

    .prologue
    .line 229
    invoke-virtual {p0}, Lorg/apache/commons/net/ntp/NtpV3Impl;->getRootDelay()I

    move-result v2

    int-to-double v0, v2

    .line 230
    .local v0, "l":D
    const-wide v2, 0x4050624dd2f1a9fcL    # 65.536

    div-double v2, v0, v2

    return-wide v2
.end method

.method public getRootDispersion()I
    .locals 1

    .prologue
    .line 239
    const/16 v0, 0x8

    invoke-direct {p0, v0}, Lorg/apache/commons/net/ntp/NtpV3Impl;->getInt(I)I

    move-result v0

    return v0
.end method

.method public getRootDispersionInMillis()J
    .locals 6

    .prologue
    .line 249
    invoke-virtual {p0}, Lorg/apache/commons/net/ntp/NtpV3Impl;->getRootDispersion()I

    move-result v2

    int-to-long v0, v2

    .line 250
    .local v0, "l":J
    const-wide/16 v2, 0x3e8

    mul-long/2addr v2, v0

    const-wide/32 v4, 0x10000

    div-long/2addr v2, v4

    return-wide v2
.end method

.method public getRootDispersionInMillisDouble()D
    .locals 4

    .prologue
    .line 261
    invoke-virtual {p0}, Lorg/apache/commons/net/ntp/NtpV3Impl;->getRootDispersion()I

    move-result v2

    int-to-double v0, v2

    .line 262
    .local v0, "l":D
    const-wide v2, 0x4050624dd2f1a9fcL    # 65.536

    div-double v2, v0, v2

    return-wide v2
.end method

.method public getStratum()I
    .locals 2

    .prologue
    .line 194
    iget-object v0, p0, Lorg/apache/commons/net/ntp/NtpV3Impl;->buf:[B

    const/4 v1, 0x1

    aget-byte v0, v0, v1

    invoke-static {v0}, Lorg/apache/commons/net/ntp/NtpV3Impl;->ui(B)I

    move-result v0

    return v0
.end method

.method public getTransmitTimeStamp()Lorg/apache/commons/net/ntp/TimeStamp;
    .locals 1

    .prologue
    .line 358
    const/16 v0, 0x28

    invoke-direct {p0, v0}, Lorg/apache/commons/net/ntp/NtpV3Impl;->getTimestamp(I)Lorg/apache/commons/net/ntp/TimeStamp;

    move-result-object v0

    return-object v0
.end method

.method public getType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 446
    const-string/jumbo v0, "NTP"

    return-object v0
.end method

.method public getVersion()I
    .locals 2

    .prologue
    .line 172
    iget-object v0, p0, Lorg/apache/commons/net/ntp/NtpV3Impl;->buf:[B

    const/4 v1, 0x0

    aget-byte v0, v0, v1

    invoke-static {v0}, Lorg/apache/commons/net/ntp/NtpV3Impl;->ui(B)I

    move-result v0

    shr-int/lit8 v0, v0, 0x3

    and-int/lit8 v0, v0, 0x7

    return v0
.end method

.method public setDatagramPacket(Ljava/net/DatagramPacket;)V
    .locals 4
    .param p1, "srcDp"    # Ljava/net/DatagramPacket;

    .prologue
    const/4 v3, 0x0

    .line 530
    invoke-virtual {p1}, Ljava/net/DatagramPacket;->getData()[B

    move-result-object v0

    .line 531
    .local v0, "incomingBuf":[B
    invoke-virtual {p1}, Ljava/net/DatagramPacket;->getLength()I

    move-result v1

    .line 532
    .local v1, "len":I
    iget-object v2, p0, Lorg/apache/commons/net/ntp/NtpV3Impl;->buf:[B

    array-length v2, v2

    if-le v1, v2, :cond_0

    .line 533
    iget-object v2, p0, Lorg/apache/commons/net/ntp/NtpV3Impl;->buf:[B

    array-length v1, v2

    .line 536
    :cond_0
    iget-object v2, p0, Lorg/apache/commons/net/ntp/NtpV3Impl;->buf:[B

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 537
    return-void
.end method

.method public setLeapIndicator(I)V
    .locals 4
    .param p1, "li"    # I

    .prologue
    const/4 v3, 0x0

    .line 117
    iget-object v0, p0, Lorg/apache/commons/net/ntp/NtpV3Impl;->buf:[B

    iget-object v1, p0, Lorg/apache/commons/net/ntp/NtpV3Impl;->buf:[B

    aget-byte v1, v1, v3

    and-int/lit8 v1, v1, 0x3f

    and-int/lit8 v2, p1, 0x3

    shl-int/lit8 v2, v2, 0x6

    or-int/2addr v1, v2

    int-to-byte v1, v1

    aput-byte v1, v0, v3

    .line 118
    return-void
.end method

.method public setMode(I)V
    .locals 4
    .param p1, "mode"    # I

    .prologue
    const/4 v3, 0x0

    .line 94
    iget-object v0, p0, Lorg/apache/commons/net/ntp/NtpV3Impl;->buf:[B

    iget-object v1, p0, Lorg/apache/commons/net/ntp/NtpV3Impl;->buf:[B

    aget-byte v1, v1, v3

    and-int/lit16 v1, v1, 0xf8

    and-int/lit8 v2, p1, 0x7

    or-int/2addr v1, v2

    int-to-byte v1, v1

    aput-byte v1, v0, v3

    .line 95
    return-void
.end method

.method public setOriginateTimeStamp(Lorg/apache/commons/net/ntp/TimeStamp;)V
    .locals 1
    .param p1, "ts"    # Lorg/apache/commons/net/ntp/TimeStamp;

    .prologue
    .line 380
    const/16 v0, 0x18

    invoke-direct {p0, v0, p1}, Lorg/apache/commons/net/ntp/NtpV3Impl;->setTimestamp(ILorg/apache/commons/net/ntp/TimeStamp;)V

    .line 381
    return-void
.end method

.method public setPoll(I)V
    .locals 3
    .param p1, "poll"    # I

    .prologue
    .line 141
    iget-object v0, p0, Lorg/apache/commons/net/ntp/NtpV3Impl;->buf:[B

    const/4 v1, 0x2

    and-int/lit16 v2, p1, 0xff

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 142
    return-void
.end method

.method public setPrecision(I)V
    .locals 3
    .param p1, "precision"    # I

    .prologue
    .line 162
    iget-object v0, p0, Lorg/apache/commons/net/ntp/NtpV3Impl;->buf:[B

    const/4 v1, 0x3

    and-int/lit16 v2, p1, 0xff

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 163
    return-void
.end method

.method public setReceiveTimeStamp(Lorg/apache/commons/net/ntp/TimeStamp;)V
    .locals 1
    .param p1, "ts"    # Lorg/apache/commons/net/ntp/TimeStamp;

    .prologue
    .line 435
    const/16 v0, 0x20

    invoke-direct {p0, v0, p1}, Lorg/apache/commons/net/ntp/NtpV3Impl;->setTimestamp(ILorg/apache/commons/net/ntp/TimeStamp;)V

    .line 436
    return-void
.end method

.method public setReferenceId(I)V
    .locals 4
    .param p1, "refId"    # I

    .prologue
    .line 273
    const/4 v0, 0x3

    .local v0, "i":I
    :goto_0
    if-ltz v0, :cond_0

    .line 274
    iget-object v1, p0, Lorg/apache/commons/net/ntp/NtpV3Impl;->buf:[B

    add-int/lit8 v2, v0, 0xc

    and-int/lit16 v3, p1, 0xff

    int-to-byte v3, v3

    aput-byte v3, v1, v2

    .line 275
    ushr-int/lit8 p1, p1, 0x8

    .line 273
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 277
    :cond_0
    return-void
.end method

.method public setReferenceTime(Lorg/apache/commons/net/ntp/TimeStamp;)V
    .locals 1
    .param p1, "ts"    # Lorg/apache/commons/net/ntp/TimeStamp;

    .prologue
    .line 413
    const/16 v0, 0x10

    invoke-direct {p0, v0, p1}, Lorg/apache/commons/net/ntp/NtpV3Impl;->setTimestamp(ILorg/apache/commons/net/ntp/TimeStamp;)V

    .line 414
    return-void
.end method

.method public setStratum(I)V
    .locals 3
    .param p1, "stratum"    # I

    .prologue
    .line 204
    iget-object v0, p0, Lorg/apache/commons/net/ntp/NtpV3Impl;->buf:[B

    const/4 v1, 0x1

    and-int/lit16 v2, p1, 0xff

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 205
    return-void
.end method

.method public setTransmitTime(Lorg/apache/commons/net/ntp/TimeStamp;)V
    .locals 1
    .param p1, "ts"    # Lorg/apache/commons/net/ntp/TimeStamp;

    .prologue
    .line 369
    const/16 v0, 0x28

    invoke-direct {p0, v0, p1}, Lorg/apache/commons/net/ntp/NtpV3Impl;->setTimestamp(ILorg/apache/commons/net/ntp/TimeStamp;)V

    .line 370
    return-void
.end method

.method public setVersion(I)V
    .locals 4
    .param p1, "version"    # I

    .prologue
    const/4 v3, 0x0

    .line 182
    iget-object v0, p0, Lorg/apache/commons/net/ntp/NtpV3Impl;->buf:[B

    iget-object v1, p0, Lorg/apache/commons/net/ntp/NtpV3Impl;->buf:[B

    aget-byte v1, v1, v3

    and-int/lit16 v1, v1, 0xc7

    and-int/lit8 v2, p1, 0x7

    shl-int/lit8 v2, v2, 0x3

    or-int/2addr v1, v2

    int-to-byte v1, v1

    aput-byte v1, v0, v3

    .line 183
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 575
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "[version:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/commons/net/ntp/NtpV3Impl;->getVersion()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", mode:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/commons/net/ntp/NtpV3Impl;->getMode()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", poll:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/commons/net/ntp/NtpV3Impl;->getPoll()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", precision:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/commons/net/ntp/NtpV3Impl;->getPrecision()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", delay:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/commons/net/ntp/NtpV3Impl;->getRootDelay()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", dispersion(ms):"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/commons/net/ntp/NtpV3Impl;->getRootDispersionInMillisDouble()D

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", id:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/commons/net/ntp/NtpV3Impl;->getReferenceIdString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", xmitTime:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/commons/net/ntp/NtpV3Impl;->getTransmitTimeStamp()Lorg/apache/commons/net/ntp/TimeStamp;

    move-result-object v1

    invoke-virtual {v1}, Lorg/apache/commons/net/ntp/TimeStamp;->toDateString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, " ]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
