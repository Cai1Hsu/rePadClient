.class public Lcom/mongodb/util/Base64Codec;
.super Ljava/lang/Object;
.source "Base64Codec.java"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field private static final BYTES_PER_ENCODED_BLOCK:I = 0x4

.field private static final BYTES_PER_UNENCODED_BLOCK:I = 0x3

.field private static final DecodeTable:[I

.field private static final EncodeTable:[B

.field private static final PAD:B = 0x3dt

.field private static final SixBitMask:I = 0x3f


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 53
    const/16 v1, 0x40

    new-array v1, v1, [B

    fill-array-data v1, :array_0

    sput-object v1, Lcom/mongodb/util/Base64Codec;->EncodeTable:[B

    .line 60
    const/16 v1, 0x80

    new-array v1, v1, [I

    sput-object v1, Lcom/mongodb/util/Base64Codec;->DecodeTable:[I

    .line 63
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    sget-object v1, Lcom/mongodb/util/Base64Codec;->EncodeTable:[B

    array-length v1, v1

    if-ge v0, v1, :cond_0

    .line 64
    sget-object v1, Lcom/mongodb/util/Base64Codec;->DecodeTable:[I

    sget-object v2, Lcom/mongodb/util/Base64Codec;->EncodeTable:[B

    aget-byte v2, v2, v0

    aput v0, v1, v2

    .line 63
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 66
    :cond_0
    return-void

    .line 53
    nop

    :array_0
    .array-data 1
        0x41t
        0x42t
        0x43t
        0x44t
        0x45t
        0x46t
        0x47t
        0x48t
        0x49t
        0x4at
        0x4bt
        0x4ct
        0x4dt
        0x4et
        0x4ft
        0x50t
        0x51t
        0x52t
        0x53t
        0x54t
        0x55t
        0x56t
        0x57t
        0x58t
        0x59t
        0x5at
        0x61t
        0x62t
        0x63t
        0x64t
        0x65t
        0x66t
        0x67t
        0x68t
        0x69t
        0x6at
        0x6bt
        0x6ct
        0x6dt
        0x6et
        0x6ft
        0x70t
        0x71t
        0x72t
        0x73t
        0x74t
        0x75t
        0x76t
        0x77t
        0x78t
        0x79t
        0x7at
        0x30t
        0x31t
        0x32t
        0x33t
        0x34t
        0x35t
        0x36t
        0x37t
        0x38t
        0x39t
        0x2bt
        0x2ft
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public decode(Ljava/lang/String;)[B
    .locals 12
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 75
    const-string/jumbo v10, "=="

    invoke-virtual {p1, v10}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_1

    const/4 v5, 0x2

    .line 76
    .local v5, "delta":I
    :goto_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v10

    mul-int/lit8 v10, v10, 0x3

    div-int/lit8 v10, v10, 0x4

    sub-int/2addr v10, v5

    new-array v0, v10, [B

    .line 77
    .local v0, "buffer":[B
    const/16 v7, 0xff

    .line 78
    .local v7, "mask":I
    const/4 v8, 0x0

    .line 79
    .local v8, "pos":I
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v10

    if-ge v6, v10, :cond_0

    .line 80
    sget-object v10, Lcom/mongodb/util/Base64Codec;->DecodeTable:[I

    invoke-virtual {p1, v6}, Ljava/lang/String;->charAt(I)C

    move-result v11

    aget v1, v10, v11

    .line 81
    .local v1, "c0":I
    sget-object v10, Lcom/mongodb/util/Base64Codec;->DecodeTable:[I

    add-int/lit8 v11, v6, 0x1

    invoke-virtual {p1, v11}, Ljava/lang/String;->charAt(I)C

    move-result v11

    aget v2, v10, v11

    .line 82
    .local v2, "c1":I
    add-int/lit8 v9, v8, 0x1

    .end local v8    # "pos":I
    .local v9, "pos":I
    shl-int/lit8 v10, v1, 0x2

    shr-int/lit8 v11, v2, 0x4

    or-int/2addr v10, v11

    and-int/2addr v10, v7

    int-to-byte v10, v10

    aput-byte v10, v0, v8

    .line 83
    array-length v10, v0

    if-lt v9, v10, :cond_3

    move v8, v9

    .line 94
    .end local v1    # "c0":I
    .end local v2    # "c1":I
    .end local v9    # "pos":I
    .restart local v8    # "pos":I
    :cond_0
    return-object v0

    .line 75
    .end local v0    # "buffer":[B
    .end local v5    # "delta":I
    .end local v6    # "i":I
    .end local v7    # "mask":I
    .end local v8    # "pos":I
    :cond_1
    const-string/jumbo v10, "="

    invoke-virtual {p1, v10}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_2

    const/4 v5, 0x1

    goto :goto_0

    :cond_2
    const/4 v5, 0x0

    goto :goto_0

    .line 86
    .restart local v0    # "buffer":[B
    .restart local v1    # "c0":I
    .restart local v2    # "c1":I
    .restart local v5    # "delta":I
    .restart local v6    # "i":I
    .restart local v7    # "mask":I
    .restart local v9    # "pos":I
    :cond_3
    sget-object v10, Lcom/mongodb/util/Base64Codec;->DecodeTable:[I

    add-int/lit8 v11, v6, 0x2

    invoke-virtual {p1, v11}, Ljava/lang/String;->charAt(I)C

    move-result v11

    aget v3, v10, v11

    .line 87
    .local v3, "c2":I
    add-int/lit8 v8, v9, 0x1

    .end local v9    # "pos":I
    .restart local v8    # "pos":I
    shl-int/lit8 v10, v2, 0x4

    shr-int/lit8 v11, v3, 0x2

    or-int/2addr v10, v11

    and-int/2addr v10, v7

    int-to-byte v10, v10

    aput-byte v10, v0, v9

    .line 88
    array-length v10, v0

    if-ge v8, v10, :cond_0

    .line 91
    sget-object v10, Lcom/mongodb/util/Base64Codec;->DecodeTable:[I

    add-int/lit8 v11, v6, 0x3

    invoke-virtual {p1, v11}, Ljava/lang/String;->charAt(I)C

    move-result v11

    aget v4, v10, v11

    .line 92
    .local v4, "c3":I
    add-int/lit8 v9, v8, 0x1

    .end local v8    # "pos":I
    .restart local v9    # "pos":I
    shl-int/lit8 v10, v3, 0x6

    or-int/2addr v10, v4

    and-int/2addr v10, v7

    int-to-byte v10, v10

    aput-byte v10, v0, v8

    .line 79
    add-int/lit8 v6, v6, 0x4

    move v8, v9

    .end local v9    # "pos":I
    .restart local v8    # "pos":I
    goto :goto_1
.end method

.method public encode([B)Ljava/lang/String;
    .locals 13
    .param p1, "in"    # [B

    .prologue
    const/16 v12, 0x3d

    .line 105
    const/4 v6, 0x0

    .line 106
    .local v6, "modulus":I
    const/4 v2, 0x0

    .line 107
    .local v2, "bitWorkArea":I
    array-length v10, p1

    div-int/lit8 v10, v10, 0x3

    mul-int/lit8 v11, v10, 0x4

    array-length v10, p1

    rem-int/lit8 v10, v10, 0x3

    if-nez v10, :cond_2

    const/4 v10, 0x0

    :goto_0
    add-int v7, v11, v10

    .line 110
    .local v7, "numEncodedBytes":I
    new-array v3, v7, [B

    .line 111
    .local v3, "buffer":[B
    const/4 v8, 0x0

    .line 113
    .local v8, "pos":I
    move-object v0, p1

    .local v0, "arr$":[B
    array-length v5, v0

    .local v5, "len$":I
    const/4 v4, 0x0

    .local v4, "i$":I
    move v9, v8

    .end local v8    # "pos":I
    .local v9, "pos":I
    :goto_1
    if-ge v4, v5, :cond_3

    aget-byte v1, v0, v4

    .line 114
    .local v1, "b":I
    add-int/lit8 v10, v6, 0x1

    rem-int/lit8 v6, v10, 0x3

    .line 116
    if-gez v1, :cond_0

    .line 117
    add-int/lit16 v1, v1, 0x100

    .line 119
    :cond_0
    shl-int/lit8 v10, v2, 0x8

    add-int v2, v10, v1

    .line 120
    if-nez v6, :cond_1

    .line 121
    add-int/lit8 v8, v9, 0x1

    .end local v9    # "pos":I
    .restart local v8    # "pos":I
    sget-object v10, Lcom/mongodb/util/Base64Codec;->EncodeTable:[B

    shr-int/lit8 v11, v2, 0x12

    and-int/lit8 v11, v11, 0x3f

    aget-byte v10, v10, v11

    aput-byte v10, v3, v9

    .line 122
    add-int/lit8 v9, v8, 0x1

    .end local v8    # "pos":I
    .restart local v9    # "pos":I
    sget-object v10, Lcom/mongodb/util/Base64Codec;->EncodeTable:[B

    shr-int/lit8 v11, v2, 0xc

    and-int/lit8 v11, v11, 0x3f

    aget-byte v10, v10, v11

    aput-byte v10, v3, v8

    .line 123
    add-int/lit8 v8, v9, 0x1

    .end local v9    # "pos":I
    .restart local v8    # "pos":I
    sget-object v10, Lcom/mongodb/util/Base64Codec;->EncodeTable:[B

    shr-int/lit8 v11, v2, 0x6

    and-int/lit8 v11, v11, 0x3f

    aget-byte v10, v10, v11

    aput-byte v10, v3, v9

    .line 124
    add-int/lit8 v9, v8, 0x1

    .end local v8    # "pos":I
    .restart local v9    # "pos":I
    sget-object v10, Lcom/mongodb/util/Base64Codec;->EncodeTable:[B

    and-int/lit8 v11, v2, 0x3f

    aget-byte v10, v10, v11

    aput-byte v10, v3, v8

    :cond_1
    move v8, v9

    .line 113
    .end local v9    # "pos":I
    .restart local v8    # "pos":I
    add-int/lit8 v4, v4, 0x1

    move v9, v8

    .end local v8    # "pos":I
    .restart local v9    # "pos":I
    goto :goto_1

    .line 107
    .end local v0    # "arr$":[B
    .end local v1    # "b":I
    .end local v3    # "buffer":[B
    .end local v4    # "i$":I
    .end local v5    # "len$":I
    .end local v7    # "numEncodedBytes":I
    .end local v9    # "pos":I
    :cond_2
    const/4 v10, 0x4

    goto :goto_0

    .line 128
    .restart local v0    # "arr$":[B
    .restart local v3    # "buffer":[B
    .restart local v4    # "i$":I
    .restart local v5    # "len$":I
    .restart local v7    # "numEncodedBytes":I
    .restart local v9    # "pos":I
    :cond_3
    packed-switch v6, :pswitch_data_0

    move v8, v9

    .line 144
    .end local v9    # "pos":I
    .restart local v8    # "pos":I
    :goto_2
    new-instance v10, Ljava/lang/String;

    invoke-direct {v10, v3}, Ljava/lang/String;-><init>([B)V

    return-object v10

    .line 130
    .end local v8    # "pos":I
    .restart local v9    # "pos":I
    :pswitch_0
    add-int/lit8 v8, v9, 0x1

    .end local v9    # "pos":I
    .restart local v8    # "pos":I
    sget-object v10, Lcom/mongodb/util/Base64Codec;->EncodeTable:[B

    shr-int/lit8 v11, v2, 0x2

    and-int/lit8 v11, v11, 0x3f

    aget-byte v10, v10, v11

    aput-byte v10, v3, v9

    .line 131
    add-int/lit8 v9, v8, 0x1

    .end local v8    # "pos":I
    .restart local v9    # "pos":I
    sget-object v10, Lcom/mongodb/util/Base64Codec;->EncodeTable:[B

    shl-int/lit8 v11, v2, 0x4

    and-int/lit8 v11, v11, 0x3f

    aget-byte v10, v10, v11

    aput-byte v10, v3, v8

    .line 132
    add-int/lit8 v8, v9, 0x1

    .end local v9    # "pos":I
    .restart local v8    # "pos":I
    aput-byte v12, v3, v9

    .line 133
    aput-byte v12, v3, v8

    goto :goto_2

    .line 137
    .end local v8    # "pos":I
    .restart local v9    # "pos":I
    :pswitch_1
    add-int/lit8 v8, v9, 0x1

    .end local v9    # "pos":I
    .restart local v8    # "pos":I
    sget-object v10, Lcom/mongodb/util/Base64Codec;->EncodeTable:[B

    shr-int/lit8 v11, v2, 0xa

    and-int/lit8 v11, v11, 0x3f

    aget-byte v10, v10, v11

    aput-byte v10, v3, v9

    .line 138
    add-int/lit8 v9, v8, 0x1

    .end local v8    # "pos":I
    .restart local v9    # "pos":I
    sget-object v10, Lcom/mongodb/util/Base64Codec;->EncodeTable:[B

    shr-int/lit8 v11, v2, 0x4

    and-int/lit8 v11, v11, 0x3f

    aget-byte v10, v10, v11

    aput-byte v10, v3, v8

    .line 139
    add-int/lit8 v8, v9, 0x1

    .end local v9    # "pos":I
    .restart local v8    # "pos":I
    sget-object v10, Lcom/mongodb/util/Base64Codec;->EncodeTable:[B

    shl-int/lit8 v11, v2, 0x2

    and-int/lit8 v11, v11, 0x3f

    aget-byte v10, v10, v11

    aput-byte v10, v3, v9

    .line 140
    aput-byte v12, v3, v8

    goto :goto_2

    .line 128
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
