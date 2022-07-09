.class public Lorg/apache/commons/net/util/Base64;
.super Ljava/lang/Object;
.source "Base64.java"


# static fields
.field static final CHUNK_SEPARATOR:[B

.field static final CHUNK_SIZE:I = 0x4c

.field private static final DECODE_TABLE:[B

.field private static final DEFAULT_BUFFER_RESIZE_FACTOR:I = 0x2

.field private static final DEFAULT_BUFFER_SIZE:I = 0x2000

.field private static final MASK_6BITS:I = 0x3f

.field private static final MASK_8BITS:I = 0xff

.field private static final PAD:B = 0x3dt

.field private static final STANDARD_ENCODE_TABLE:[B

.field private static final URL_SAFE_ENCODE_TABLE:[B


# instance fields
.field private buffer:[B

.field private currentLinePos:I

.field private final decodeSize:I

.field private final encodeSize:I

.field private final encodeTable:[B

.field private eof:Z

.field private final lineLength:I

.field private final lineSeparator:[B

.field private modulus:I

.field private pos:I

.field private readPos:I

.field private x:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/16 v1, 0x40

    .line 77
    const/4 v0, 0x2

    new-array v0, v0, [B

    fill-array-data v0, :array_0

    sput-object v0, Lorg/apache/commons/net/util/Base64;->CHUNK_SEPARATOR:[B

    .line 86
    new-array v0, v1, [B

    fill-array-data v0, :array_1

    sput-object v0, Lorg/apache/commons/net/util/Base64;->STANDARD_ENCODE_TABLE:[B

    .line 99
    new-array v0, v1, [B

    fill-array-data v0, :array_2

    sput-object v0, Lorg/apache/commons/net/util/Base64;->URL_SAFE_ENCODE_TABLE:[B

    .line 123
    const/16 v0, 0x7b

    new-array v0, v0, [B

    fill-array-data v0, :array_3

    sput-object v0, Lorg/apache/commons/net/util/Base64;->DECODE_TABLE:[B

    return-void

    .line 77
    :array_0
    .array-data 1
        0xdt
        0xat
    .end array-data

    .line 86
    nop

    :array_1
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

    .line 99
    :array_2
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
        0x2dt
        0x5ft
    .end array-data

    .line 123
    :array_3
    .array-data 1
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        0x3et
        -0x1t
        0x3et
        -0x1t
        0x3ft
        0x34t
        0x35t
        0x36t
        0x37t
        0x38t
        0x39t
        0x3at
        0x3bt
        0x3ct
        0x3dt
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        0x0t
        0x1t
        0x2t
        0x3t
        0x4t
        0x5t
        0x6t
        0x7t
        0x8t
        0x9t
        0xat
        0xbt
        0xct
        0xdt
        0xet
        0xft
        0x10t
        0x11t
        0x12t
        0x13t
        0x14t
        0x15t
        0x16t
        0x17t
        0x18t
        0x19t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        0x3ft
        -0x1t
        0x1at
        0x1bt
        0x1ct
        0x1dt
        0x1et
        0x1ft
        0x20t
        0x21t
        0x22t
        0x23t
        0x24t
        0x25t
        0x26t
        0x27t
        0x28t
        0x29t
        0x2at
        0x2bt
        0x2ct
        0x2dt
        0x2et
        0x2ft
        0x30t
        0x31t
        0x32t
        0x33t
    .end array-data
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 223
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/apache/commons/net/util/Base64;-><init>(Z)V

    .line 224
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .param p1, "lineLength"    # I

    .prologue
    .line 264
    sget-object v0, Lorg/apache/commons/net/util/Base64;->CHUNK_SEPARATOR:[B

    invoke-direct {p0, p1, v0}, Lorg/apache/commons/net/util/Base64;-><init>(I[B)V

    .line 265
    return-void
.end method

.method public constructor <init>(I[B)V
    .locals 1
    .param p1, "lineLength"    # I
    .param p2, "lineSeparator"    # [B

    .prologue
    .line 290
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lorg/apache/commons/net/util/Base64;-><init>(I[BZ)V

    .line 291
    return-void
.end method

.method public constructor <init>(I[BZ)V
    .locals 4
    .param p1, "lineLength"    # I
    .param p2, "lineSeparator"    # [B
    .param p3, "urlSafe"    # Z

    .prologue
    const/4 v2, 0x0

    .line 318
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 319
    if-nez p2, :cond_0

    .line 320
    const/4 p1, 0x0

    .line 321
    sget-object p2, Lorg/apache/commons/net/util/Base64;->CHUNK_SEPARATOR:[B

    .line 323
    :cond_0
    if-lez p1, :cond_1

    div-int/lit8 v1, p1, 0x4

    mul-int/lit8 v1, v1, 0x4

    :goto_0
    iput v1, p0, Lorg/apache/commons/net/util/Base64;->lineLength:I

    .line 324
    array-length v1, p2

    new-array v1, v1, [B

    iput-object v1, p0, Lorg/apache/commons/net/util/Base64;->lineSeparator:[B

    .line 325
    iget-object v1, p0, Lorg/apache/commons/net/util/Base64;->lineSeparator:[B

    array-length v3, p2

    invoke-static {p2, v2, v1, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 326
    if-lez p1, :cond_2

    .line 327
    array-length v1, p2

    add-int/lit8 v1, v1, 0x4

    iput v1, p0, Lorg/apache/commons/net/util/Base64;->encodeSize:I

    .line 331
    :goto_1
    iget v1, p0, Lorg/apache/commons/net/util/Base64;->encodeSize:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lorg/apache/commons/net/util/Base64;->decodeSize:I

    .line 332
    invoke-static {p2}, Lorg/apache/commons/net/util/Base64;->containsBase64Byte([B)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 333
    invoke-static {p2}, Lorg/apache/commons/net/util/Base64;->newStringUtf8([B)Ljava/lang/String;

    move-result-object v0

    .line 334
    .local v0, "sep":Ljava/lang/String;
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "lineSeperator must not contain base64 characters: ["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "]"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .end local v0    # "sep":Ljava/lang/String;
    :cond_1
    move v1, v2

    .line 323
    goto :goto_0

    .line 329
    :cond_2
    const/4 v1, 0x4

    iput v1, p0, Lorg/apache/commons/net/util/Base64;->encodeSize:I

    goto :goto_1

    .line 336
    :cond_3
    if-eqz p3, :cond_4

    sget-object v1, Lorg/apache/commons/net/util/Base64;->URL_SAFE_ENCODE_TABLE:[B

    :goto_2
    iput-object v1, p0, Lorg/apache/commons/net/util/Base64;->encodeTable:[B

    .line 337
    return-void

    .line 336
    :cond_4
    sget-object v1, Lorg/apache/commons/net/util/Base64;->STANDARD_ENCODE_TABLE:[B

    goto :goto_2
.end method

.method public constructor <init>(Z)V
    .locals 2
    .param p1, "urlSafe"    # Z

    .prologue
    .line 242
    const/16 v0, 0x4c

    sget-object v1, Lorg/apache/commons/net/util/Base64;->CHUNK_SEPARATOR:[B

    invoke-direct {p0, v0, v1, p1}, Lorg/apache/commons/net/util/Base64;-><init>(I[BZ)V

    .line 243
    return-void
.end method

.method private static containsBase64Byte([B)Z
    .locals 2
    .param p0, "arrayOctet"    # [B

    .prologue
    .line 624
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v1, p0

    if-ge v0, v1, :cond_1

    .line 625
    aget-byte v1, p0, v0

    invoke-static {v1}, Lorg/apache/commons/net/util/Base64;->isBase64(B)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 626
    const/4 v1, 0x1

    .line 629
    :goto_1
    return v1

    .line 624
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 629
    :cond_1
    const/4 v1, 0x0

    goto :goto_1
.end method

.method public static decodeBase64(Ljava/lang/String;)[B
    .locals 1
    .param p0, "base64String"    # Ljava/lang/String;

    .prologue
    .line 836
    new-instance v0, Lorg/apache/commons/net/util/Base64;

    invoke-direct {v0}, Lorg/apache/commons/net/util/Base64;-><init>()V

    invoke-virtual {v0, p0}, Lorg/apache/commons/net/util/Base64;->decode(Ljava/lang/String;)[B

    move-result-object v0

    return-object v0
.end method

.method public static decodeBase64([B)[B
    .locals 1
    .param p0, "base64Data"    # [B

    .prologue
    .line 847
    new-instance v0, Lorg/apache/commons/net/util/Base64;

    invoke-direct {v0}, Lorg/apache/commons/net/util/Base64;-><init>()V

    invoke-virtual {v0, p0}, Lorg/apache/commons/net/util/Base64;->decode([B)[B

    move-result-object v0

    return-object v0
.end method

.method public static decodeInteger([B)Ljava/math/BigInteger;
    .locals 3
    .param p0, "pArray"    # [B

    .prologue
    .line 983
    new-instance v0, Ljava/math/BigInteger;

    const/4 v1, 0x1

    invoke-static {p0}, Lorg/apache/commons/net/util/Base64;->decodeBase64([B)[B

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/math/BigInteger;-><init>(I[B)V

    return-object v0
.end method

.method public static encodeBase64([B)[B
    .locals 1
    .param p0, "binaryData"    # [B

    .prologue
    .line 640
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/apache/commons/net/util/Base64;->encodeBase64([BZ)[B

    move-result-object v0

    return-object v0
.end method

.method public static encodeBase64([BZ)[B
    .locals 1
    .param p0, "binaryData"    # [B
    .param p1, "isChunked"    # Z

    .prologue
    .line 773
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lorg/apache/commons/net/util/Base64;->encodeBase64([BZZ)[B

    move-result-object v0

    return-object v0
.end method

.method public static encodeBase64([BZZ)[B
    .locals 1
    .param p0, "binaryData"    # [B
    .param p1, "isChunked"    # Z
    .param p2, "urlSafe"    # Z

    .prologue
    .line 791
    const v0, 0x7fffffff

    invoke-static {p0, p1, p2, v0}, Lorg/apache/commons/net/util/Base64;->encodeBase64([BZZI)[B

    move-result-object v0

    return-object v0
.end method

.method public static encodeBase64([BZZI)[B
    .locals 6
    .param p0, "binaryData"    # [B
    .param p1, "isChunked"    # Z
    .param p2, "urlSafe"    # Z
    .param p3, "maxResultSize"    # I

    .prologue
    .line 811
    if-eqz p0, :cond_0

    array-length v1, p0

    if-nez v1, :cond_1

    .line 824
    .end local p0    # "binaryData":[B
    :cond_0
    :goto_0
    return-object p0

    .line 815
    .restart local p0    # "binaryData":[B
    :cond_1
    const/16 v1, 0x4c

    sget-object v4, Lorg/apache/commons/net/util/Base64;->CHUNK_SEPARATOR:[B

    invoke-static {p0, v1, v4}, Lorg/apache/commons/net/util/Base64;->getEncodeLength([BI[B)J

    move-result-wide v2

    .line 816
    .local v2, "len":J
    int-to-long v4, p3

    cmp-long v1, v2, v4

    if-lez v1, :cond_2

    .line 817
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "Input array too big, the output array would be bigger ("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, ") than the specified maxium size of "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v1, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 823
    :cond_2
    if-eqz p1, :cond_3

    new-instance v0, Lorg/apache/commons/net/util/Base64;

    invoke-direct {v0, p2}, Lorg/apache/commons/net/util/Base64;-><init>(Z)V

    .line 824
    .local v0, "b64":Lorg/apache/commons/net/util/Base64;
    :goto_1
    invoke-virtual {v0, p0}, Lorg/apache/commons/net/util/Base64;->encode([B)[B

    move-result-object p0

    goto :goto_0

    .line 823
    .end local v0    # "b64":Lorg/apache/commons/net/util/Base64;
    :cond_3
    new-instance v0, Lorg/apache/commons/net/util/Base64;

    const/4 v1, 0x0

    sget-object v4, Lorg/apache/commons/net/util/Base64;->CHUNK_SEPARATOR:[B

    invoke-direct {v0, v1, v4, p2}, Lorg/apache/commons/net/util/Base64;-><init>(I[BZ)V

    goto :goto_1
.end method

.method public static encodeBase64Chunked([B)[B
    .locals 1
    .param p0, "binaryData"    # [B

    .prologue
    .line 689
    const/4 v0, 0x1

    invoke-static {p0, v0}, Lorg/apache/commons/net/util/Base64;->encodeBase64([BZ)[B

    move-result-object v0

    return-object v0
.end method

.method public static encodeBase64String([B)Ljava/lang/String;
    .locals 1
    .param p0, "binaryData"    # [B

    .prologue
    .line 652
    const/4 v0, 0x1

    invoke-static {p0, v0}, Lorg/apache/commons/net/util/Base64;->encodeBase64([BZ)[B

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/net/util/Base64;->newStringUtf8([B)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static encodeBase64URLSafe([B)[B
    .locals 2
    .param p0, "binaryData"    # [B

    .prologue
    .line 665
    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Lorg/apache/commons/net/util/Base64;->encodeBase64([BZZ)[B

    move-result-object v0

    return-object v0
.end method

.method public static encodeBase64URLSafeString([B)Ljava/lang/String;
    .locals 2
    .param p0, "binaryData"    # [B

    .prologue
    .line 678
    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Lorg/apache/commons/net/util/Base64;->encodeBase64([BZZ)[B

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/net/util/Base64;->newStringUtf8([B)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static encodeInteger(Ljava/math/BigInteger;)[B
    .locals 2
    .param p0, "bigInt"    # Ljava/math/BigInteger;

    .prologue
    .line 997
    if-nez p0, :cond_0

    .line 998
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "encodeInteger called with null parameter"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1000
    :cond_0
    invoke-static {p0}, Lorg/apache/commons/net/util/Base64;->toIntegerBytes(Ljava/math/BigInteger;)[B

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lorg/apache/commons/net/util/Base64;->encodeBase64([BZ)[B

    move-result-object v0

    return-object v0
.end method

.method private getBytesUtf8(Ljava/lang/String;)[B
    .locals 2
    .param p1, "pArray"    # Ljava/lang/String;

    .prologue
    .line 726
    :try_start_0
    const-string/jumbo v1, "UTF8"

    invoke-virtual {p1, v1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    .line 727
    :catch_0
    move-exception v0

    .line 728
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method private static getEncodeLength([BI[B)J
    .locals 10
    .param p0, "pArray"    # [B
    .param p1, "chunkSize"    # I
    .param p2, "chunkSeparator"    # [B

    .prologue
    const-wide/16 v6, 0x4

    const-wide/16 v8, 0x0

    .line 956
    div-int/lit8 v3, p1, 0x4

    mul-int/lit8 p1, v3, 0x4

    .line 958
    array-length v3, p0

    mul-int/lit8 v3, v3, 0x4

    div-int/lit8 v3, v3, 0x3

    int-to-long v0, v3

    .line 959
    .local v0, "len":J
    rem-long v4, v0, v6

    .line 960
    .local v4, "mod":J
    cmp-long v3, v4, v8

    if-eqz v3, :cond_0

    .line 961
    sub-long/2addr v6, v4

    add-long/2addr v0, v6

    .line 963
    :cond_0
    if-lez p1, :cond_1

    .line 964
    int-to-long v6, p1

    rem-long v6, v0, v6

    cmp-long v3, v6, v8

    if-nez v3, :cond_2

    const/4 v2, 0x1

    .line 965
    .local v2, "lenChunksPerfectly":Z
    :goto_0
    int-to-long v6, p1

    div-long v6, v0, v6

    array-length v3, p2

    int-to-long v8, v3

    mul-long/2addr v6, v8

    add-long/2addr v0, v6

    .line 966
    if-nez v2, :cond_1

    .line 967
    array-length v3, p2

    int-to-long v6, v3

    add-long/2addr v0, v6

    .line 970
    .end local v2    # "lenChunksPerfectly":Z
    :cond_1
    return-wide v0

    .line 964
    :cond_2
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public static isArrayByteBase64([B)Z
    .locals 2
    .param p0, "arrayOctet"    # [B

    .prologue
    .line 608
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v1, p0

    if-ge v0, v1, :cond_1

    .line 609
    aget-byte v1, p0, v0

    invoke-static {v1}, Lorg/apache/commons/net/util/Base64;->isBase64(B)Z

    move-result v1

    if-nez v1, :cond_0

    aget-byte v1, p0, v0

    invoke-static {v1}, Lorg/apache/commons/net/util/Base64;->isWhiteSpace(B)Z

    move-result v1

    if-nez v1, :cond_0

    .line 610
    const/4 v1, 0x0

    .line 613
    :goto_1
    return v1

    .line 608
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 613
    :cond_1
    const/4 v1, 0x1

    goto :goto_1
.end method

.method public static isBase64(B)Z
    .locals 2
    .param p0, "octet"    # B

    .prologue
    .line 595
    const/16 v0, 0x3d

    if-eq p0, v0, :cond_0

    if-ltz p0, :cond_1

    sget-object v0, Lorg/apache/commons/net/util/Base64;->DECODE_TABLE:[B

    array-length v0, v0

    if-ge p0, v0, :cond_1

    sget-object v0, Lorg/apache/commons/net/util/Base64;->DECODE_TABLE:[B

    aget-byte v0, v0, p0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static isWhiteSpace(B)Z
    .locals 1
    .param p0, "byteToCheck"    # B

    .prologue
    .line 860
    sparse-switch p0, :sswitch_data_0

    .line 867
    const/4 v0, 0x0

    :goto_0
    return v0

    .line 865
    :sswitch_0
    const/4 v0, 0x1

    goto :goto_0

    .line 860
    nop

    :sswitch_data_0
    .sparse-switch
        0x9 -> :sswitch_0
        0xa -> :sswitch_0
        0xd -> :sswitch_0
        0x20 -> :sswitch_0
    .end sparse-switch
.end method

.method private static newStringUtf8([B)Ljava/lang/String;
    .locals 3
    .param p0, "encode"    # [B

    .prologue
    .line 903
    const/4 v0, 0x0

    .line 905
    .local v0, "str":Ljava/lang/String;
    :try_start_0
    new-instance v0, Ljava/lang/String;

    .end local v0    # "str":Ljava/lang/String;
    const-string/jumbo v2, "UTF8"

    invoke-direct {v0, p0, v2}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 909
    .restart local v0    # "str":Ljava/lang/String;
    return-object v0

    .line 906
    .end local v0    # "str":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 907
    .local v1, "ue":Ljava/io/UnsupportedEncodingException;
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method private reset()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 1038
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/commons/net/util/Base64;->buffer:[B

    .line 1039
    iput v1, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    .line 1040
    iput v1, p0, Lorg/apache/commons/net/util/Base64;->readPos:I

    .line 1041
    iput v1, p0, Lorg/apache/commons/net/util/Base64;->currentLinePos:I

    .line 1042
    iput v1, p0, Lorg/apache/commons/net/util/Base64;->modulus:I

    .line 1043
    iput-boolean v1, p0, Lorg/apache/commons/net/util/Base64;->eof:Z

    .line 1044
    return-void
.end method

.method private resizeBuffer()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 369
    iget-object v1, p0, Lorg/apache/commons/net/util/Base64;->buffer:[B

    if-nez v1, :cond_0

    .line 370
    const/16 v1, 0x2000

    new-array v1, v1, [B

    iput-object v1, p0, Lorg/apache/commons/net/util/Base64;->buffer:[B

    .line 371
    iput v3, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    .line 372
    iput v3, p0, Lorg/apache/commons/net/util/Base64;->readPos:I

    .line 378
    :goto_0
    return-void

    .line 374
    :cond_0
    iget-object v1, p0, Lorg/apache/commons/net/util/Base64;->buffer:[B

    array-length v1, v1

    mul-int/lit8 v1, v1, 0x2

    new-array v0, v1, [B

    .line 375
    .local v0, "b":[B
    iget-object v1, p0, Lorg/apache/commons/net/util/Base64;->buffer:[B

    iget-object v2, p0, Lorg/apache/commons/net/util/Base64;->buffer:[B

    array-length v2, v2

    invoke-static {v1, v3, v0, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 376
    iput-object v0, p0, Lorg/apache/commons/net/util/Base64;->buffer:[B

    goto :goto_0
.end method

.method static toIntegerBytes(Ljava/math/BigInteger;)[B
    .locals 8
    .param p0, "bigInt"    # Ljava/math/BigInteger;

    .prologue
    .line 1011
    invoke-virtual {p0}, Ljava/math/BigInteger;->bitLength()I

    move-result v1

    .line 1013
    .local v1, "bitlen":I
    add-int/lit8 v6, v1, 0x7

    shr-int/lit8 v6, v6, 0x3

    shl-int/lit8 v1, v6, 0x3

    .line 1014
    invoke-virtual {p0}, Ljava/math/BigInteger;->toByteArray()[B

    move-result-object v0

    .line 1016
    .local v0, "bigBytes":[B
    invoke-virtual {p0}, Ljava/math/BigInteger;->bitLength()I

    move-result v6

    rem-int/lit8 v6, v6, 0x8

    if-eqz v6, :cond_0

    invoke-virtual {p0}, Ljava/math/BigInteger;->bitLength()I

    move-result v6

    div-int/lit8 v6, v6, 0x8

    add-int/lit8 v6, v6, 0x1

    div-int/lit8 v7, v1, 0x8

    if-ne v6, v7, :cond_0

    .line 1031
    .end local v0    # "bigBytes":[B
    :goto_0
    return-object v0

    .line 1020
    .restart local v0    # "bigBytes":[B
    :cond_0
    const/4 v5, 0x0

    .line 1021
    .local v5, "startSrc":I
    array-length v2, v0

    .line 1024
    .local v2, "len":I
    invoke-virtual {p0}, Ljava/math/BigInteger;->bitLength()I

    move-result v6

    rem-int/lit8 v6, v6, 0x8

    if-nez v6, :cond_1

    .line 1025
    const/4 v5, 0x1

    .line 1026
    add-int/lit8 v2, v2, -0x1

    .line 1028
    :cond_1
    div-int/lit8 v6, v1, 0x8

    sub-int v4, v6, v2

    .line 1029
    .local v4, "startDst":I
    div-int/lit8 v6, v1, 0x8

    new-array v3, v6, [B

    .line 1030
    .local v3, "resizedBytes":[B
    invoke-static {v0, v5, v3, v4, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    move-object v0, v3

    .line 1031
    goto :goto_0
.end method


# virtual methods
.method avail()I
    .locals 2

    .prologue
    .line 364
    iget-object v0, p0, Lorg/apache/commons/net/util/Base64;->buffer:[B

    if-eqz v0, :cond_0

    iget v0, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    iget v1, p0, Lorg/apache/commons/net/util/Base64;->readPos:I

    sub-int/2addr v0, v1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public decode(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .param p1, "pObject"    # Ljava/lang/Object;

    .prologue
    .line 703
    instance-of v0, p1, [B

    if-eqz v0, :cond_0

    .line 704
    check-cast p1, [B

    .end local p1    # "pObject":Ljava/lang/Object;
    check-cast p1, [B

    invoke-virtual {p0, p1}, Lorg/apache/commons/net/util/Base64;->decode([B)[B

    move-result-object v0

    .line 706
    :goto_0
    return-object v0

    .line 705
    .restart local p1    # "pObject":Ljava/lang/Object;
    :cond_0
    instance-of v0, p1, Ljava/lang/String;

    if-eqz v0, :cond_1

    .line 706
    check-cast p1, Ljava/lang/String;

    .end local p1    # "pObject":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/util/Base64;->decode(Ljava/lang/String;)[B

    move-result-object v0

    goto :goto_0

    .line 708
    .restart local p1    # "pObject":Ljava/lang/Object;
    :cond_1
    new-instance v0, Ljava/lang/RuntimeException;

    const-string/jumbo v1, "Parameter supplied to Base64 decode is not a byte[] or a String"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method decode([BII)V
    .locals 8
    .param p1, "in"    # [B
    .param p2, "inPos"    # I
    .param p3, "inAvail"    # I

    .prologue
    const/4 v7, 0x1

    .line 537
    iget-boolean v4, p0, Lorg/apache/commons/net/util/Base64;->eof:Z

    if-eqz v4, :cond_1

    .line 584
    :cond_0
    :goto_0
    return-void

    .line 540
    :cond_1
    if-gez p3, :cond_2

    .line 541
    iput-boolean v7, p0, Lorg/apache/commons/net/util/Base64;->eof:Z

    .line 543
    :cond_2
    const/4 v1, 0x0

    .local v1, "i":I
    move v2, p2

    .end local p2    # "inPos":I
    .local v2, "inPos":I
    :goto_1
    if-ge v1, p3, :cond_7

    .line 544
    iget-object v4, p0, Lorg/apache/commons/net/util/Base64;->buffer:[B

    if-eqz v4, :cond_3

    iget-object v4, p0, Lorg/apache/commons/net/util/Base64;->buffer:[B

    array-length v4, v4

    iget v5, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    sub-int/2addr v4, v5

    iget v5, p0, Lorg/apache/commons/net/util/Base64;->decodeSize:I

    if-ge v4, v5, :cond_4

    .line 545
    :cond_3
    invoke-direct {p0}, Lorg/apache/commons/net/util/Base64;->resizeBuffer()V

    .line 547
    :cond_4
    add-int/lit8 p2, v2, 0x1

    .end local v2    # "inPos":I
    .restart local p2    # "inPos":I
    aget-byte v0, p1, v2

    .line 548
    .local v0, "b":B
    const/16 v4, 0x3d

    if-ne v0, v4, :cond_5

    .line 550
    iput-boolean v7, p0, Lorg/apache/commons/net/util/Base64;->eof:Z

    .line 571
    .end local v0    # "b":B
    :goto_2
    iget-boolean v4, p0, Lorg/apache/commons/net/util/Base64;->eof:Z

    if-eqz v4, :cond_0

    iget v4, p0, Lorg/apache/commons/net/util/Base64;->modulus:I

    if-eqz v4, :cond_0

    .line 572
    iget v4, p0, Lorg/apache/commons/net/util/Base64;->x:I

    shl-int/lit8 v4, v4, 0x6

    iput v4, p0, Lorg/apache/commons/net/util/Base64;->x:I

    .line 573
    iget v4, p0, Lorg/apache/commons/net/util/Base64;->modulus:I

    packed-switch v4, :pswitch_data_0

    goto :goto_0

    .line 575
    :pswitch_0
    iget v4, p0, Lorg/apache/commons/net/util/Base64;->x:I

    shl-int/lit8 v4, v4, 0x6

    iput v4, p0, Lorg/apache/commons/net/util/Base64;->x:I

    .line 576
    iget-object v4, p0, Lorg/apache/commons/net/util/Base64;->buffer:[B

    iget v5, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    add-int/lit8 v6, v5, 0x1

    iput v6, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    iget v6, p0, Lorg/apache/commons/net/util/Base64;->x:I

    shr-int/lit8 v6, v6, 0x10

    and-int/lit16 v6, v6, 0xff

    int-to-byte v6, v6

    aput-byte v6, v4, v5

    goto :goto_0

    .line 553
    .restart local v0    # "b":B
    :cond_5
    if-ltz v0, :cond_6

    sget-object v4, Lorg/apache/commons/net/util/Base64;->DECODE_TABLE:[B

    array-length v4, v4

    if-ge v0, v4, :cond_6

    .line 554
    sget-object v4, Lorg/apache/commons/net/util/Base64;->DECODE_TABLE:[B

    aget-byte v3, v4, v0

    .line 555
    .local v3, "result":I
    if-ltz v3, :cond_6

    .line 556
    iget v4, p0, Lorg/apache/commons/net/util/Base64;->modulus:I

    add-int/lit8 v4, v4, 0x1

    iput v4, p0, Lorg/apache/commons/net/util/Base64;->modulus:I

    rem-int/lit8 v4, v4, 0x4

    iput v4, p0, Lorg/apache/commons/net/util/Base64;->modulus:I

    .line 557
    iget v4, p0, Lorg/apache/commons/net/util/Base64;->x:I

    shl-int/lit8 v4, v4, 0x6

    add-int/2addr v4, v3

    iput v4, p0, Lorg/apache/commons/net/util/Base64;->x:I

    .line 558
    iget v4, p0, Lorg/apache/commons/net/util/Base64;->modulus:I

    if-nez v4, :cond_6

    .line 559
    iget-object v4, p0, Lorg/apache/commons/net/util/Base64;->buffer:[B

    iget v5, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    add-int/lit8 v6, v5, 0x1

    iput v6, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    iget v6, p0, Lorg/apache/commons/net/util/Base64;->x:I

    shr-int/lit8 v6, v6, 0x10

    and-int/lit16 v6, v6, 0xff

    int-to-byte v6, v6

    aput-byte v6, v4, v5

    .line 560
    iget-object v4, p0, Lorg/apache/commons/net/util/Base64;->buffer:[B

    iget v5, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    add-int/lit8 v6, v5, 0x1

    iput v6, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    iget v6, p0, Lorg/apache/commons/net/util/Base64;->x:I

    shr-int/lit8 v6, v6, 0x8

    and-int/lit16 v6, v6, 0xff

    int-to-byte v6, v6

    aput-byte v6, v4, v5

    .line 561
    iget-object v4, p0, Lorg/apache/commons/net/util/Base64;->buffer:[B

    iget v5, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    add-int/lit8 v6, v5, 0x1

    iput v6, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    iget v6, p0, Lorg/apache/commons/net/util/Base64;->x:I

    and-int/lit16 v6, v6, 0xff

    int-to-byte v6, v6

    aput-byte v6, v4, v5

    .line 543
    .end local v3    # "result":I
    :cond_6
    add-int/lit8 v1, v1, 0x1

    move v2, p2

    .end local p2    # "inPos":I
    .restart local v2    # "inPos":I
    goto/16 :goto_1

    .line 579
    .end local v0    # "b":B
    .end local v2    # "inPos":I
    .restart local p2    # "inPos":I
    :pswitch_1
    iget-object v4, p0, Lorg/apache/commons/net/util/Base64;->buffer:[B

    iget v5, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    add-int/lit8 v6, v5, 0x1

    iput v6, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    iget v6, p0, Lorg/apache/commons/net/util/Base64;->x:I

    shr-int/lit8 v6, v6, 0x10

    and-int/lit16 v6, v6, 0xff

    int-to-byte v6, v6

    aput-byte v6, v4, v5

    .line 580
    iget-object v4, p0, Lorg/apache/commons/net/util/Base64;->buffer:[B

    iget v5, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    add-int/lit8 v6, v5, 0x1

    iput v6, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    iget v6, p0, Lorg/apache/commons/net/util/Base64;->x:I

    shr-int/lit8 v6, v6, 0x8

    and-int/lit16 v6, v6, 0xff

    int-to-byte v6, v6

    aput-byte v6, v4, v5

    goto/16 :goto_0

    .end local p2    # "inPos":I
    .restart local v2    # "inPos":I
    :cond_7
    move p2, v2

    .end local v2    # "inPos":I
    .restart local p2    # "inPos":I
    goto/16 :goto_2

    .line 573
    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public decode(Ljava/lang/String;)[B
    .locals 1
    .param p1, "pArray"    # Ljava/lang/String;

    .prologue
    .line 721
    invoke-direct {p0, p1}, Lorg/apache/commons/net/util/Base64;->getBytesUtf8(Ljava/lang/String;)[B

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/commons/net/util/Base64;->decode([B)[B

    move-result-object v0

    return-object v0
.end method

.method public decode([B)[B
    .locals 6
    .param p1, "pArray"    # [B

    .prologue
    const/4 v5, 0x0

    .line 740
    invoke-direct {p0}, Lorg/apache/commons/net/util/Base64;->reset()V

    .line 741
    if-eqz p1, :cond_0

    array-length v4, p1

    if-nez v4, :cond_1

    :cond_0
    move-object v1, p1

    .line 758
    :goto_0
    return-object v1

    .line 744
    :cond_1
    array-length v4, p1

    mul-int/lit8 v4, v4, 0x3

    div-int/lit8 v4, v4, 0x4

    int-to-long v2, v4

    .line 745
    .local v2, "len":J
    long-to-int v4, v2

    new-array v0, v4, [B

    .line 746
    .local v0, "buf":[B
    array-length v4, v0

    invoke-virtual {p0, v0, v5, v4}, Lorg/apache/commons/net/util/Base64;->setInitialBuffer([BII)V

    .line 747
    array-length v4, p1

    invoke-virtual {p0, p1, v5, v4}, Lorg/apache/commons/net/util/Base64;->decode([BII)V

    .line 748
    const/4 v4, -0x1

    invoke-virtual {p0, p1, v5, v4}, Lorg/apache/commons/net/util/Base64;->decode([BII)V

    .line 756
    iget v4, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    new-array v1, v4, [B

    .line 757
    .local v1, "result":[B
    array-length v4, v1

    invoke-virtual {p0, v1, v5, v4}, Lorg/apache/commons/net/util/Base64;->readResults([BII)I

    goto :goto_0
.end method

.method public encode(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .param p1, "pObject"    # Ljava/lang/Object;

    .prologue
    .line 884
    instance-of v0, p1, [B

    if-nez v0, :cond_0

    .line 885
    new-instance v0, Ljava/lang/RuntimeException;

    const-string/jumbo v1, "Parameter supplied to Base64 encode is not a byte[]"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 887
    :cond_0
    check-cast p1, [B

    .end local p1    # "pObject":Ljava/lang/Object;
    check-cast p1, [B

    invoke-virtual {p0, p1}, Lorg/apache/commons/net/util/Base64;->encode([B)[B

    move-result-object v0

    return-object v0
.end method

.method encode([BII)V
    .locals 9
    .param p1, "in"    # [B
    .param p2, "inPos"    # I
    .param p3, "inAvail"    # I

    .prologue
    const/16 v8, 0x3d

    const/4 v7, 0x0

    .line 451
    iget-boolean v3, p0, Lorg/apache/commons/net/util/Base64;->eof:Z

    if-eqz v3, :cond_1

    .line 511
    :cond_0
    :goto_0
    return-void

    .line 456
    :cond_1
    if-gez p3, :cond_5

    .line 457
    const/4 v3, 0x1

    iput-boolean v3, p0, Lorg/apache/commons/net/util/Base64;->eof:Z

    .line 458
    iget-object v3, p0, Lorg/apache/commons/net/util/Base64;->buffer:[B

    if-eqz v3, :cond_2

    iget-object v3, p0, Lorg/apache/commons/net/util/Base64;->buffer:[B

    array-length v3, v3

    iget v4, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    sub-int/2addr v3, v4

    iget v4, p0, Lorg/apache/commons/net/util/Base64;->encodeSize:I

    if-ge v3, v4, :cond_3

    .line 459
    :cond_2
    invoke-direct {p0}, Lorg/apache/commons/net/util/Base64;->resizeBuffer()V

    .line 461
    :cond_3
    iget v3, p0, Lorg/apache/commons/net/util/Base64;->modulus:I

    packed-switch v3, :pswitch_data_0

    .line 482
    :cond_4
    :goto_1
    iget v3, p0, Lorg/apache/commons/net/util/Base64;->lineLength:I

    if-lez v3, :cond_0

    iget v3, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    if-lez v3, :cond_0

    .line 483
    iget-object v3, p0, Lorg/apache/commons/net/util/Base64;->lineSeparator:[B

    iget-object v4, p0, Lorg/apache/commons/net/util/Base64;->buffer:[B

    iget v5, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    iget-object v6, p0, Lorg/apache/commons/net/util/Base64;->lineSeparator:[B

    array-length v6, v6

    invoke-static {v3, v7, v4, v5, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 484
    iget v3, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    iget-object v4, p0, Lorg/apache/commons/net/util/Base64;->lineSeparator:[B

    array-length v4, v4

    add-int/2addr v3, v4

    iput v3, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    goto :goto_0

    .line 463
    :pswitch_0
    iget-object v3, p0, Lorg/apache/commons/net/util/Base64;->buffer:[B

    iget v4, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    add-int/lit8 v5, v4, 0x1

    iput v5, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    iget-object v5, p0, Lorg/apache/commons/net/util/Base64;->encodeTable:[B

    iget v6, p0, Lorg/apache/commons/net/util/Base64;->x:I

    shr-int/lit8 v6, v6, 0x2

    and-int/lit8 v6, v6, 0x3f

    aget-byte v5, v5, v6

    aput-byte v5, v3, v4

    .line 464
    iget-object v3, p0, Lorg/apache/commons/net/util/Base64;->buffer:[B

    iget v4, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    add-int/lit8 v5, v4, 0x1

    iput v5, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    iget-object v5, p0, Lorg/apache/commons/net/util/Base64;->encodeTable:[B

    iget v6, p0, Lorg/apache/commons/net/util/Base64;->x:I

    shl-int/lit8 v6, v6, 0x4

    and-int/lit8 v6, v6, 0x3f

    aget-byte v5, v5, v6

    aput-byte v5, v3, v4

    .line 466
    iget-object v3, p0, Lorg/apache/commons/net/util/Base64;->encodeTable:[B

    sget-object v4, Lorg/apache/commons/net/util/Base64;->STANDARD_ENCODE_TABLE:[B

    if-ne v3, v4, :cond_4

    .line 467
    iget-object v3, p0, Lorg/apache/commons/net/util/Base64;->buffer:[B

    iget v4, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    add-int/lit8 v5, v4, 0x1

    iput v5, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    aput-byte v8, v3, v4

    .line 468
    iget-object v3, p0, Lorg/apache/commons/net/util/Base64;->buffer:[B

    iget v4, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    add-int/lit8 v5, v4, 0x1

    iput v5, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    aput-byte v8, v3, v4

    goto :goto_1

    .line 473
    :pswitch_1
    iget-object v3, p0, Lorg/apache/commons/net/util/Base64;->buffer:[B

    iget v4, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    add-int/lit8 v5, v4, 0x1

    iput v5, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    iget-object v5, p0, Lorg/apache/commons/net/util/Base64;->encodeTable:[B

    iget v6, p0, Lorg/apache/commons/net/util/Base64;->x:I

    shr-int/lit8 v6, v6, 0xa

    and-int/lit8 v6, v6, 0x3f

    aget-byte v5, v5, v6

    aput-byte v5, v3, v4

    .line 474
    iget-object v3, p0, Lorg/apache/commons/net/util/Base64;->buffer:[B

    iget v4, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    add-int/lit8 v5, v4, 0x1

    iput v5, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    iget-object v5, p0, Lorg/apache/commons/net/util/Base64;->encodeTable:[B

    iget v6, p0, Lorg/apache/commons/net/util/Base64;->x:I

    shr-int/lit8 v6, v6, 0x4

    and-int/lit8 v6, v6, 0x3f

    aget-byte v5, v5, v6

    aput-byte v5, v3, v4

    .line 475
    iget-object v3, p0, Lorg/apache/commons/net/util/Base64;->buffer:[B

    iget v4, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    add-int/lit8 v5, v4, 0x1

    iput v5, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    iget-object v5, p0, Lorg/apache/commons/net/util/Base64;->encodeTable:[B

    iget v6, p0, Lorg/apache/commons/net/util/Base64;->x:I

    shl-int/lit8 v6, v6, 0x2

    and-int/lit8 v6, v6, 0x3f

    aget-byte v5, v5, v6

    aput-byte v5, v3, v4

    .line 477
    iget-object v3, p0, Lorg/apache/commons/net/util/Base64;->encodeTable:[B

    sget-object v4, Lorg/apache/commons/net/util/Base64;->STANDARD_ENCODE_TABLE:[B

    if-ne v3, v4, :cond_4

    .line 478
    iget-object v3, p0, Lorg/apache/commons/net/util/Base64;->buffer:[B

    iget v4, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    add-int/lit8 v5, v4, 0x1

    iput v5, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    aput-byte v8, v3, v4

    goto/16 :goto_1

    .line 487
    :cond_5
    const/4 v1, 0x0

    .local v1, "i":I
    move v2, p2

    .end local p2    # "inPos":I
    .local v2, "inPos":I
    :goto_2
    if-ge v1, p3, :cond_a

    .line 488
    iget-object v3, p0, Lorg/apache/commons/net/util/Base64;->buffer:[B

    if-eqz v3, :cond_6

    iget-object v3, p0, Lorg/apache/commons/net/util/Base64;->buffer:[B

    array-length v3, v3

    iget v4, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    sub-int/2addr v3, v4

    iget v4, p0, Lorg/apache/commons/net/util/Base64;->encodeSize:I

    if-ge v3, v4, :cond_7

    .line 489
    :cond_6
    invoke-direct {p0}, Lorg/apache/commons/net/util/Base64;->resizeBuffer()V

    .line 491
    :cond_7
    iget v3, p0, Lorg/apache/commons/net/util/Base64;->modulus:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lorg/apache/commons/net/util/Base64;->modulus:I

    rem-int/lit8 v3, v3, 0x3

    iput v3, p0, Lorg/apache/commons/net/util/Base64;->modulus:I

    .line 492
    add-int/lit8 p2, v2, 0x1

    .end local v2    # "inPos":I
    .restart local p2    # "inPos":I
    aget-byte v0, p1, v2

    .line 493
    .local v0, "b":I
    if-gez v0, :cond_8

    .line 494
    add-int/lit16 v0, v0, 0x100

    .line 496
    :cond_8
    iget v3, p0, Lorg/apache/commons/net/util/Base64;->x:I

    shl-int/lit8 v3, v3, 0x8

    add-int/2addr v3, v0

    iput v3, p0, Lorg/apache/commons/net/util/Base64;->x:I

    .line 497
    iget v3, p0, Lorg/apache/commons/net/util/Base64;->modulus:I

    if-nez v3, :cond_9

    .line 498
    iget-object v3, p0, Lorg/apache/commons/net/util/Base64;->buffer:[B

    iget v4, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    add-int/lit8 v5, v4, 0x1

    iput v5, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    iget-object v5, p0, Lorg/apache/commons/net/util/Base64;->encodeTable:[B

    iget v6, p0, Lorg/apache/commons/net/util/Base64;->x:I

    shr-int/lit8 v6, v6, 0x12

    and-int/lit8 v6, v6, 0x3f

    aget-byte v5, v5, v6

    aput-byte v5, v3, v4

    .line 499
    iget-object v3, p0, Lorg/apache/commons/net/util/Base64;->buffer:[B

    iget v4, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    add-int/lit8 v5, v4, 0x1

    iput v5, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    iget-object v5, p0, Lorg/apache/commons/net/util/Base64;->encodeTable:[B

    iget v6, p0, Lorg/apache/commons/net/util/Base64;->x:I

    shr-int/lit8 v6, v6, 0xc

    and-int/lit8 v6, v6, 0x3f

    aget-byte v5, v5, v6

    aput-byte v5, v3, v4

    .line 500
    iget-object v3, p0, Lorg/apache/commons/net/util/Base64;->buffer:[B

    iget v4, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    add-int/lit8 v5, v4, 0x1

    iput v5, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    iget-object v5, p0, Lorg/apache/commons/net/util/Base64;->encodeTable:[B

    iget v6, p0, Lorg/apache/commons/net/util/Base64;->x:I

    shr-int/lit8 v6, v6, 0x6

    and-int/lit8 v6, v6, 0x3f

    aget-byte v5, v5, v6

    aput-byte v5, v3, v4

    .line 501
    iget-object v3, p0, Lorg/apache/commons/net/util/Base64;->buffer:[B

    iget v4, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    add-int/lit8 v5, v4, 0x1

    iput v5, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    iget-object v5, p0, Lorg/apache/commons/net/util/Base64;->encodeTable:[B

    iget v6, p0, Lorg/apache/commons/net/util/Base64;->x:I

    and-int/lit8 v6, v6, 0x3f

    aget-byte v5, v5, v6

    aput-byte v5, v3, v4

    .line 502
    iget v3, p0, Lorg/apache/commons/net/util/Base64;->currentLinePos:I

    add-int/lit8 v3, v3, 0x4

    iput v3, p0, Lorg/apache/commons/net/util/Base64;->currentLinePos:I

    .line 503
    iget v3, p0, Lorg/apache/commons/net/util/Base64;->lineLength:I

    if-lez v3, :cond_9

    iget v3, p0, Lorg/apache/commons/net/util/Base64;->lineLength:I

    iget v4, p0, Lorg/apache/commons/net/util/Base64;->currentLinePos:I

    if-gt v3, v4, :cond_9

    .line 504
    iget-object v3, p0, Lorg/apache/commons/net/util/Base64;->lineSeparator:[B

    iget-object v4, p0, Lorg/apache/commons/net/util/Base64;->buffer:[B

    iget v5, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    iget-object v6, p0, Lorg/apache/commons/net/util/Base64;->lineSeparator:[B

    array-length v6, v6

    invoke-static {v3, v7, v4, v5, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 505
    iget v3, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    iget-object v4, p0, Lorg/apache/commons/net/util/Base64;->lineSeparator:[B

    array-length v4, v4

    add-int/2addr v3, v4

    iput v3, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    .line 506
    iput v7, p0, Lorg/apache/commons/net/util/Base64;->currentLinePos:I

    .line 487
    :cond_9
    add-int/lit8 v1, v1, 0x1

    move v2, p2

    .end local p2    # "inPos":I
    .restart local v2    # "inPos":I
    goto/16 :goto_2

    .end local v0    # "b":I
    :cond_a
    move p2, v2

    .end local v2    # "inPos":I
    .restart local p2    # "inPos":I
    goto/16 :goto_0

    .line 461
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public encode([B)[B
    .locals 7
    .param p1, "pArray"    # [B

    .prologue
    const/4 v6, 0x0

    .line 920
    invoke-direct {p0}, Lorg/apache/commons/net/util/Base64;->reset()V

    .line 921
    if-eqz p1, :cond_0

    array-length v4, p1

    if-nez v4, :cond_2

    :cond_0
    move-object v0, p1

    .line 940
    :cond_1
    :goto_0
    return-object v0

    .line 924
    :cond_2
    iget v4, p0, Lorg/apache/commons/net/util/Base64;->lineLength:I

    iget-object v5, p0, Lorg/apache/commons/net/util/Base64;->lineSeparator:[B

    invoke-static {p1, v4, v5}, Lorg/apache/commons/net/util/Base64;->getEncodeLength([BI[B)J

    move-result-wide v2

    .line 925
    .local v2, "len":J
    long-to-int v4, v2

    new-array v0, v4, [B

    .line 926
    .local v0, "buf":[B
    array-length v4, v0

    invoke-virtual {p0, v0, v6, v4}, Lorg/apache/commons/net/util/Base64;->setInitialBuffer([BII)V

    .line 927
    array-length v4, p1

    invoke-virtual {p0, p1, v6, v4}, Lorg/apache/commons/net/util/Base64;->encode([BII)V

    .line 928
    const/4 v4, -0x1

    invoke-virtual {p0, p1, v6, v4}, Lorg/apache/commons/net/util/Base64;->encode([BII)V

    .line 930
    iget-object v4, p0, Lorg/apache/commons/net/util/Base64;->buffer:[B

    if-eq v4, v0, :cond_3

    .line 931
    array-length v4, v0

    invoke-virtual {p0, v0, v6, v4}, Lorg/apache/commons/net/util/Base64;->readResults([BII)I

    .line 935
    :cond_3
    invoke-virtual {p0}, Lorg/apache/commons/net/util/Base64;->isUrlSafe()Z

    move-result v4

    if-eqz v4, :cond_1

    iget v4, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    array-length v5, v0

    if-ge v4, v5, :cond_1

    .line 936
    iget v4, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    new-array v1, v4, [B

    .line 937
    .local v1, "smallerBuf":[B
    iget v4, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    invoke-static {v0, v6, v1, v6, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 938
    move-object v0, v1

    goto :goto_0
.end method

.method public encodeToString([B)Ljava/lang/String;
    .locals 1
    .param p1, "pArray"    # [B

    .prologue
    .line 899
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/util/Base64;->encode([B)[B

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/net/util/Base64;->newStringUtf8([B)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method hasData()Z
    .locals 1

    .prologue
    .line 355
    iget-object v0, p0, Lorg/apache/commons/net/util/Base64;->buffer:[B

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isUrlSafe()Z
    .locals 2

    .prologue
    .line 346
    iget-object v0, p0, Lorg/apache/commons/net/util/Base64;->encodeTable:[B

    sget-object v1, Lorg/apache/commons/net/util/Base64;->URL_SAFE_ENCODE_TABLE:[B

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method readResults([BII)I
    .locals 4
    .param p1, "b"    # [B
    .param p2, "bPos"    # I
    .param p3, "bAvail"    # I

    .prologue
    const/4 v3, 0x0

    .line 393
    iget-object v1, p0, Lorg/apache/commons/net/util/Base64;->buffer:[B

    if-eqz v1, :cond_2

    .line 394
    invoke-virtual {p0}, Lorg/apache/commons/net/util/Base64;->avail()I

    move-result v1

    invoke-static {v1, p3}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 395
    .local v0, "len":I
    iget-object v1, p0, Lorg/apache/commons/net/util/Base64;->buffer:[B

    if-eq v1, p1, :cond_1

    .line 396
    iget-object v1, p0, Lorg/apache/commons/net/util/Base64;->buffer:[B

    iget v2, p0, Lorg/apache/commons/net/util/Base64;->readPos:I

    invoke-static {v1, v2, p1, p2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 397
    iget v1, p0, Lorg/apache/commons/net/util/Base64;->readPos:I

    add-int/2addr v1, v0

    iput v1, p0, Lorg/apache/commons/net/util/Base64;->readPos:I

    .line 398
    iget v1, p0, Lorg/apache/commons/net/util/Base64;->readPos:I

    iget v2, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    if-lt v1, v2, :cond_0

    .line 399
    iput-object v3, p0, Lorg/apache/commons/net/util/Base64;->buffer:[B

    .line 408
    .end local v0    # "len":I
    :cond_0
    :goto_0
    return v0

    .line 404
    .restart local v0    # "len":I
    :cond_1
    iput-object v3, p0, Lorg/apache/commons/net/util/Base64;->buffer:[B

    goto :goto_0

    .line 408
    .end local v0    # "len":I
    :cond_2
    iget-boolean v1, p0, Lorg/apache/commons/net/util/Base64;->eof:Z

    if-eqz v1, :cond_3

    const/4 v1, -0x1

    :goto_1
    move v0, v1

    goto :goto_0

    :cond_3
    const/4 v1, 0x0

    goto :goto_1
.end method

.method setInitialBuffer([BII)V
    .locals 1
    .param p1, "out"    # [B
    .param p2, "outPos"    # I
    .param p3, "outAvail"    # I

    .prologue
    .line 425
    if-eqz p1, :cond_0

    array-length v0, p1

    if-ne v0, p3, :cond_0

    .line 426
    iput-object p1, p0, Lorg/apache/commons/net/util/Base64;->buffer:[B

    .line 427
    iput p2, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    .line 428
    iput p2, p0, Lorg/apache/commons/net/util/Base64;->readPos:I

    .line 430
    :cond_0
    return-void
.end method
