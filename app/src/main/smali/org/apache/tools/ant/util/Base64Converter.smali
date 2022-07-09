.class public Lorg/apache/tools/ant/util/Base64Converter;
.super Ljava/lang/Object;
.source "Base64Converter.java"


# static fields
.field private static final ALPHABET:[C

.field private static final BYTE:I = 0x8

.field private static final BYTE_MASK:I = 0xff

.field private static final POS_0_MASK:I = 0x3f

.field private static final POS_1_MASK:I = 0xfc0

.field private static final POS_1_SHIFT:I = 0x6

.field private static final POS_2_MASK:I = 0x3f000

.field private static final POS_2_SHIFT:I = 0xc

.field private static final POS_3_MASK:I = 0xfc0000

.field private static final POS_3_SHIFT:I = 0x12

.field private static final WORD:I = 0x10

.field public static final alphabet:[C


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 40
    const/16 v0, 0x40

    new-array v0, v0, [C

    fill-array-data v0, :array_0

    sput-object v0, Lorg/apache/tools/ant/util/Base64Converter;->ALPHABET:[C

    .line 52
    sget-object v0, Lorg/apache/tools/ant/util/Base64Converter;->ALPHABET:[C

    sput-object v0, Lorg/apache/tools/ant/util/Base64Converter;->alphabet:[C

    return-void

    .line 40
    :array_0
    .array-data 2
        0x41s
        0x42s
        0x43s
        0x44s
        0x45s
        0x46s
        0x47s
        0x48s
        0x49s
        0x4as
        0x4bs
        0x4cs
        0x4ds
        0x4es
        0x4fs
        0x50s
        0x51s
        0x52s
        0x53s
        0x54s
        0x55s
        0x56s
        0x57s
        0x58s
        0x59s
        0x5as
        0x61s
        0x62s
        0x63s
        0x64s
        0x65s
        0x66s
        0x67s
        0x68s
        0x69s
        0x6as
        0x6bs
        0x6cs
        0x6ds
        0x6es
        0x6fs
        0x70s
        0x71s
        0x72s
        0x73s
        0x74s
        0x75s
        0x76s
        0x77s
        0x78s
        0x79s
        0x7as
        0x30s
        0x31s
        0x32s
        0x33s
        0x34s
        0x35s
        0x36s
        0x37s
        0x38s
        0x39s
        0x2bs
        0x2fs
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public encode(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 62
    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/util/Base64Converter;->encode([B)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public encode([B)Ljava/lang/String;
    .locals 12
    .param p1, "octetString"    # [B

    .prologue
    const/high16 v11, 0xfc0000

    const v10, 0x3f000

    const/16 v9, 0x3d

    .line 75
    array-length v7, p1

    add-int/lit8 v7, v7, -0x1

    div-int/lit8 v7, v7, 0x3

    add-int/lit8 v7, v7, 0x1

    mul-int/lit8 v7, v7, 0x4

    new-array v4, v7, [C

    .line 77
    .local v4, "out":[C
    const/4 v5, 0x0

    .line 78
    .local v5, "outIndex":I
    const/4 v2, 0x0

    .line 81
    .local v2, "i":I
    :goto_0
    add-int/lit8 v7, v2, 0x3

    array-length v8, p1

    if-gt v7, v8, :cond_0

    .line 84
    add-int/lit8 v3, v2, 0x1

    .end local v2    # "i":I
    .local v3, "i":I
    aget-byte v7, p1, v2

    and-int/lit16 v7, v7, 0xff

    shl-int/lit8 v0, v7, 0x10

    .line 85
    .local v0, "bits24":I
    add-int/lit8 v2, v3, 0x1

    .end local v3    # "i":I
    .restart local v2    # "i":I
    aget-byte v7, p1, v3

    and-int/lit16 v7, v7, 0xff

    shl-int/lit8 v7, v7, 0x8

    or-int/2addr v0, v7

    .line 86
    add-int/lit8 v3, v2, 0x1

    .end local v2    # "i":I
    .restart local v3    # "i":I
    aget-byte v7, p1, v2

    or-int/2addr v0, v7

    .line 88
    and-int v7, v0, v11

    shr-int/lit8 v1, v7, 0x12

    .line 89
    .local v1, "bits6":I
    add-int/lit8 v6, v5, 0x1

    .end local v5    # "outIndex":I
    .local v6, "outIndex":I
    sget-object v7, Lorg/apache/tools/ant/util/Base64Converter;->ALPHABET:[C

    aget-char v7, v7, v1

    aput-char v7, v4, v5

    .line 90
    and-int v7, v0, v10

    shr-int/lit8 v1, v7, 0xc

    .line 91
    add-int/lit8 v5, v6, 0x1

    .end local v6    # "outIndex":I
    .restart local v5    # "outIndex":I
    sget-object v7, Lorg/apache/tools/ant/util/Base64Converter;->ALPHABET:[C

    aget-char v7, v7, v1

    aput-char v7, v4, v6

    .line 92
    and-int/lit16 v7, v0, 0xfc0

    shr-int/lit8 v1, v7, 0x6

    .line 93
    add-int/lit8 v6, v5, 0x1

    .end local v5    # "outIndex":I
    .restart local v6    # "outIndex":I
    sget-object v7, Lorg/apache/tools/ant/util/Base64Converter;->ALPHABET:[C

    aget-char v7, v7, v1

    aput-char v7, v4, v5

    .line 94
    and-int/lit8 v1, v0, 0x3f

    .line 95
    add-int/lit8 v5, v6, 0x1

    .end local v6    # "outIndex":I
    .restart local v5    # "outIndex":I
    sget-object v7, Lorg/apache/tools/ant/util/Base64Converter;->ALPHABET:[C

    aget-char v7, v7, v1

    aput-char v7, v4, v6

    move v2, v3

    .end local v3    # "i":I
    .restart local v2    # "i":I
    goto :goto_0

    .line 97
    .end local v0    # "bits24":I
    .end local v1    # "bits6":I
    :cond_0
    array-length v7, p1

    sub-int/2addr v7, v2

    const/4 v8, 0x2

    if-ne v7, v8, :cond_2

    .line 99
    aget-byte v7, p1, v2

    and-int/lit16 v7, v7, 0xff

    shl-int/lit8 v0, v7, 0x10

    .line 100
    .restart local v0    # "bits24":I
    add-int/lit8 v7, v2, 0x1

    aget-byte v7, p1, v7

    and-int/lit16 v7, v7, 0xff

    shl-int/lit8 v7, v7, 0x8

    or-int/2addr v0, v7

    .line 101
    and-int v7, v0, v11

    shr-int/lit8 v1, v7, 0x12

    .line 102
    .restart local v1    # "bits6":I
    add-int/lit8 v6, v5, 0x1

    .end local v5    # "outIndex":I
    .restart local v6    # "outIndex":I
    sget-object v7, Lorg/apache/tools/ant/util/Base64Converter;->ALPHABET:[C

    aget-char v7, v7, v1

    aput-char v7, v4, v5

    .line 103
    and-int v7, v0, v10

    shr-int/lit8 v1, v7, 0xc

    .line 104
    add-int/lit8 v5, v6, 0x1

    .end local v6    # "outIndex":I
    .restart local v5    # "outIndex":I
    sget-object v7, Lorg/apache/tools/ant/util/Base64Converter;->ALPHABET:[C

    aget-char v7, v7, v1

    aput-char v7, v4, v6

    .line 105
    and-int/lit16 v7, v0, 0xfc0

    shr-int/lit8 v1, v7, 0x6

    .line 106
    add-int/lit8 v6, v5, 0x1

    .end local v5    # "outIndex":I
    .restart local v6    # "outIndex":I
    sget-object v7, Lorg/apache/tools/ant/util/Base64Converter;->ALPHABET:[C

    aget-char v7, v7, v1

    aput-char v7, v4, v5

    .line 109
    add-int/lit8 v5, v6, 0x1

    .end local v6    # "outIndex":I
    .restart local v5    # "outIndex":I
    aput-char v9, v4, v6

    .line 122
    .end local v0    # "bits24":I
    .end local v1    # "bits6":I
    :cond_1
    :goto_1
    new-instance v7, Ljava/lang/String;

    invoke-direct {v7, v4}, Ljava/lang/String;-><init>([C)V

    return-object v7

    .line 110
    :cond_2
    array-length v7, p1

    sub-int/2addr v7, v2

    const/4 v8, 0x1

    if-ne v7, v8, :cond_1

    .line 112
    aget-byte v7, p1, v2

    and-int/lit16 v7, v7, 0xff

    shl-int/lit8 v0, v7, 0x10

    .line 113
    .restart local v0    # "bits24":I
    and-int v7, v0, v11

    shr-int/lit8 v1, v7, 0x12

    .line 114
    .restart local v1    # "bits6":I
    add-int/lit8 v6, v5, 0x1

    .end local v5    # "outIndex":I
    .restart local v6    # "outIndex":I
    sget-object v7, Lorg/apache/tools/ant/util/Base64Converter;->ALPHABET:[C

    aget-char v7, v7, v1

    aput-char v7, v4, v5

    .line 115
    and-int v7, v0, v10

    shr-int/lit8 v1, v7, 0xc

    .line 116
    add-int/lit8 v5, v6, 0x1

    .end local v6    # "outIndex":I
    .restart local v5    # "outIndex":I
    sget-object v7, Lorg/apache/tools/ant/util/Base64Converter;->ALPHABET:[C

    aget-char v7, v7, v1

    aput-char v7, v4, v6

    .line 119
    add-int/lit8 v6, v5, 0x1

    .end local v5    # "outIndex":I
    .restart local v6    # "outIndex":I
    aput-char v9, v4, v5

    .line 120
    add-int/lit8 v5, v6, 0x1

    .end local v6    # "outIndex":I
    .restart local v5    # "outIndex":I
    aput-char v9, v4, v6

    goto :goto_1
.end method
