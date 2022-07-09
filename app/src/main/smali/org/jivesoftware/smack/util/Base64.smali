.class public Lorg/jivesoftware/smack/util/Base64;
.super Ljava/lang/Object;
.source "Base64.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jivesoftware/smack/util/Base64$OutputStream;,
        Lorg/jivesoftware/smack/util/Base64$InputStream;
    }
.end annotation


# static fields
.field public static final DECODE:I = 0x0

.field public static final DONT_BREAK_LINES:I = 0x8

.field public static final ENCODE:I = 0x1

.field private static final EQUALS_SIGN:B = 0x3dt

.field private static final EQUALS_SIGN_ENC:B = -0x1t

.field public static final GZIP:I = 0x2

.field private static final MAX_LINE_LENGTH:I = 0x4c

.field private static final NEW_LINE:B = 0xat

.field public static final NO_OPTIONS:I = 0x0

.field public static final ORDERED:I = 0x20

.field private static final PREFERRED_ENCODING:Ljava/lang/String; = "UTF-8"

.field public static final URL_SAFE:I = 0x10

.field private static final WHITE_SPACE_ENC:B = -0x5t

.field private static final _ORDERED_ALPHABET:[B

.field private static final _ORDERED_DECODABET:[B

.field private static final _STANDARD_ALPHABET:[B

.field private static final _STANDARD_DECODABET:[B

.field private static final _URL_SAFE_ALPHABET:[B

.field private static final _URL_SAFE_DECODABET:[B


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    const/16 v2, 0x7f

    const/16 v1, 0x40

    .line 90
    new-array v0, v1, [B

    fill-array-data v0, :array_0

    sput-object v0, Lorg/jivesoftware/smack/util/Base64;->_STANDARD_ALPHABET:[B

    .line 109
    new-array v0, v2, [B

    fill-array-data v0, :array_1

    sput-object v0, Lorg/jivesoftware/smack/util/Base64;->_STANDARD_DECODABET:[B

    .line 152
    new-array v0, v1, [B

    fill-array-data v0, :array_2

    sput-object v0, Lorg/jivesoftware/smack/util/Base64;->_URL_SAFE_ALPHABET:[B

    .line 169
    new-array v0, v2, [B

    fill-array-data v0, :array_3

    sput-object v0, Lorg/jivesoftware/smack/util/Base64;->_URL_SAFE_DECODABET:[B

    .line 216
    new-array v0, v1, [B

    fill-array-data v0, :array_4

    sput-object v0, Lorg/jivesoftware/smack/util/Base64;->_ORDERED_ALPHABET:[B

    .line 235
    new-array v0, v2, [B

    fill-array-data v0, :array_5

    sput-object v0, Lorg/jivesoftware/smack/util/Base64;->_ORDERED_DECODABET:[B

    return-void

    .line 90
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

    .line 109
    :array_1
    .array-data 1
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x5t
        -0x5t
        -0x9t
        -0x9t
        -0x5t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x5t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        0x3et
        -0x9t
        -0x9t
        -0x9t
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
        -0x9t
        -0x9t
        -0x9t
        -0x1t
        -0x9t
        -0x9t
        -0x9t
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
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
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
        -0x9t
        -0x9t
        -0x9t
        -0x9t
    .end array-data

    .line 152
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

    .line 169
    :array_3
    .array-data 1
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x5t
        -0x5t
        -0x9t
        -0x9t
        -0x5t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x5t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        0x3et
        -0x9t
        -0x9t
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
        -0x9t
        -0x9t
        -0x9t
        -0x1t
        -0x9t
        -0x9t
        -0x9t
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
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        0x3ft
        -0x9t
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
        -0x9t
        -0x9t
        -0x9t
        -0x9t
    .end array-data

    .line 216
    :array_4
    .array-data 1
        0x2dt
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
        0x5ft
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
    .end array-data

    .line 235
    :array_5
    .array-data 1
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x5t
        -0x5t
        -0x9t
        -0x9t
        -0x5t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x5t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        0x0t
        -0x9t
        -0x9t
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
        -0x9t
        -0x9t
        -0x9t
        -0x1t
        -0x9t
        -0x9t
        -0x9t
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
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        0x25t
        -0x9t
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
        0x3et
        0x3ft
        -0x9t
        -0x9t
        -0x9t
        -0x9t
    .end array-data
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 312
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(I)[B
    .locals 1
    .param p0, "x0"    # I

    .prologue
    .line 18
    invoke-static {p0}, Lorg/jivesoftware/smack/util/Base64;->getAlphabet(I)[B

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$100(I)[B
    .locals 1
    .param p0, "x0"    # I

    .prologue
    .line 18
    invoke-static {p0}, Lorg/jivesoftware/smack/util/Base64;->getDecodabet(I)[B

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$200([BII[BII)[B
    .locals 1
    .param p0, "x0"    # [B
    .param p1, "x1"    # I
    .param p2, "x2"    # I
    .param p3, "x3"    # [B
    .param p4, "x4"    # I
    .param p5, "x5"    # I

    .prologue
    .line 18
    invoke-static/range {p0 .. p5}, Lorg/jivesoftware/smack/util/Base64;->encode3to4([BII[BII)[B

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$300([BI[BII)I
    .locals 1
    .param p0, "x0"    # [B
    .param p1, "x1"    # I
    .param p2, "x2"    # [B
    .param p3, "x3"    # I
    .param p4, "x4"    # I

    .prologue
    .line 18
    invoke-static {p0, p1, p2, p3, p4}, Lorg/jivesoftware/smack/util/Base64;->decode4to3([BI[BII)I

    move-result v0

    return v0
.end method

.method static synthetic access$400([B[BII)[B
    .locals 1
    .param p0, "x0"    # [B
    .param p1, "x1"    # [B
    .param p2, "x2"    # I
    .param p3, "x3"    # I

    .prologue
    .line 18
    invoke-static {p0, p1, p2, p3}, Lorg/jivesoftware/smack/util/Base64;->encode3to4([B[BII)[B

    move-result-object v0

    return-object v0
.end method

.method public static decode(Ljava/lang/String;)[B
    .locals 1
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    .line 865
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/jivesoftware/smack/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v0

    return-object v0
.end method

.method public static decode(Ljava/lang/String;I)[B
    .locals 14
    .param p0, "s"    # Ljava/lang/String;
    .param p1, "options"    # I

    .prologue
    const/4 v13, 0x0

    .line 883
    :try_start_0
    const-string/jumbo v11, "UTF-8"

    invoke-virtual {p0, v11}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v5

    .line 892
    .local v5, "bytes":[B
    :goto_0
    array-length v11, v5

    invoke-static {v5, v13, v11, p1}, Lorg/jivesoftware/smack/util/Base64;->decode([BIII)[B

    move-result-object v5

    .line 897
    if-eqz v5, :cond_0

    array-length v11, v5

    const/4 v12, 0x4

    if-lt v11, v12, :cond_0

    .line 900
    aget-byte v11, v5, v13

    and-int/lit16 v11, v11, 0xff

    const/4 v12, 0x1

    aget-byte v12, v5, v12

    shl-int/lit8 v12, v12, 0x8

    const v13, 0xff00

    and-int/2addr v12, v13

    or-int v8, v11, v12

    .line 901
    .local v8, "head":I
    const v11, 0x8b1f

    if-ne v11, v8, :cond_0

    .line 903
    const/4 v0, 0x0

    .line 904
    .local v0, "bais":Ljava/io/ByteArrayInputStream;
    const/4 v6, 0x0

    .line 905
    .local v6, "gzis":Ljava/util/zip/GZIPInputStream;
    const/4 v2, 0x0

    .line 906
    .local v2, "baos":Ljava/io/ByteArrayOutputStream;
    const/16 v11, 0x800

    new-array v4, v11, [B

    .line 907
    .local v4, "buffer":[B
    const/4 v9, 0x0

    .line 911
    .local v9, "length":I
    :try_start_1
    new-instance v3, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v3}, Ljava/io/ByteArrayOutputStream;-><init>()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_b
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 912
    .end local v2    # "baos":Ljava/io/ByteArrayOutputStream;
    .local v3, "baos":Ljava/io/ByteArrayOutputStream;
    :try_start_2
    new-instance v1, Ljava/io/ByteArrayInputStream;

    invoke-direct {v1, v5}, Ljava/io/ByteArrayInputStream;-><init>([B)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_c
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 913
    .end local v0    # "bais":Ljava/io/ByteArrayInputStream;
    .local v1, "bais":Ljava/io/ByteArrayInputStream;
    :try_start_3
    new-instance v7, Ljava/util/zip/GZIPInputStream;

    invoke-direct {v7, v1}, Ljava/util/zip/GZIPInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_d
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 915
    .end local v6    # "gzis":Ljava/util/zip/GZIPInputStream;
    .local v7, "gzis":Ljava/util/zip/GZIPInputStream;
    :goto_1
    :try_start_4
    invoke-virtual {v7, v4}, Ljava/util/zip/GZIPInputStream;->read([B)I

    move-result v9

    if-ltz v9, :cond_1

    .line 917
    const/4 v11, 0x0

    invoke-virtual {v3, v4, v11, v9}, Ljava/io/ByteArrayOutputStream;->write([BII)V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_3

    goto :goto_1

    .line 924
    :catch_0
    move-exception v11

    move-object v2, v3

    .end local v3    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v2    # "baos":Ljava/io/ByteArrayOutputStream;
    move-object v6, v7

    .end local v7    # "gzis":Ljava/util/zip/GZIPInputStream;
    .restart local v6    # "gzis":Ljava/util/zip/GZIPInputStream;
    move-object v0, v1

    .line 930
    .end local v1    # "bais":Ljava/io/ByteArrayInputStream;
    .restart local v0    # "bais":Ljava/io/ByteArrayInputStream;
    :goto_2
    :try_start_5
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_5

    .line 931
    :goto_3
    :try_start_6
    invoke-virtual {v6}, Ljava/util/zip/GZIPInputStream;->close()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_6

    .line 932
    :goto_4
    :try_start_7
    invoke-virtual {v0}, Ljava/io/ByteArrayInputStream;->close()V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_7

    .line 938
    .end local v0    # "bais":Ljava/io/ByteArrayInputStream;
    .end local v2    # "baos":Ljava/io/ByteArrayOutputStream;
    .end local v4    # "buffer":[B
    .end local v6    # "gzis":Ljava/util/zip/GZIPInputStream;
    .end local v8    # "head":I
    .end local v9    # "length":I
    :cond_0
    :goto_5
    return-object v5

    .line 885
    .end local v5    # "bytes":[B
    :catch_1
    move-exception v10

    .line 887
    .local v10, "uee":Ljava/io/UnsupportedEncodingException;
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object v5

    .restart local v5    # "bytes":[B
    goto :goto_0

    .line 921
    .end local v10    # "uee":Ljava/io/UnsupportedEncodingException;
    .restart local v1    # "bais":Ljava/io/ByteArrayInputStream;
    .restart local v3    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v4    # "buffer":[B
    .restart local v7    # "gzis":Ljava/util/zip/GZIPInputStream;
    .restart local v8    # "head":I
    .restart local v9    # "length":I
    :cond_1
    :try_start_8
    invoke-virtual {v3}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_0
    .catchall {:try_start_8 .. :try_end_8} :catchall_3

    move-result-object v5

    .line 930
    :try_start_9
    invoke-virtual {v3}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_3

    .line 931
    :goto_6
    :try_start_a
    invoke-virtual {v7}, Ljava/util/zip/GZIPInputStream;->close()V
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_4

    .line 932
    :goto_7
    :try_start_b
    invoke-virtual {v1}, Ljava/io/ByteArrayInputStream;->close()V
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_2

    goto :goto_5

    :catch_2
    move-exception v11

    goto :goto_5

    .line 930
    .end local v1    # "bais":Ljava/io/ByteArrayInputStream;
    .end local v3    # "baos":Ljava/io/ByteArrayOutputStream;
    .end local v7    # "gzis":Ljava/util/zip/GZIPInputStream;
    .restart local v0    # "bais":Ljava/io/ByteArrayInputStream;
    .restart local v2    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v6    # "gzis":Ljava/util/zip/GZIPInputStream;
    :catchall_0
    move-exception v11

    :goto_8
    :try_start_c
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_8

    .line 931
    :goto_9
    :try_start_d
    invoke-virtual {v6}, Ljava/util/zip/GZIPInputStream;->close()V
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_d} :catch_9

    .line 932
    :goto_a
    :try_start_e
    invoke-virtual {v0}, Ljava/io/ByteArrayInputStream;->close()V
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_e} :catch_a

    :goto_b
    throw v11

    .line 930
    .end local v0    # "bais":Ljava/io/ByteArrayInputStream;
    .end local v2    # "baos":Ljava/io/ByteArrayOutputStream;
    .end local v6    # "gzis":Ljava/util/zip/GZIPInputStream;
    .restart local v1    # "bais":Ljava/io/ByteArrayInputStream;
    .restart local v3    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v7    # "gzis":Ljava/util/zip/GZIPInputStream;
    :catch_3
    move-exception v11

    goto :goto_6

    .line 931
    :catch_4
    move-exception v11

    goto :goto_7

    .line 930
    .end local v1    # "bais":Ljava/io/ByteArrayInputStream;
    .end local v3    # "baos":Ljava/io/ByteArrayOutputStream;
    .end local v7    # "gzis":Ljava/util/zip/GZIPInputStream;
    .restart local v0    # "bais":Ljava/io/ByteArrayInputStream;
    .restart local v2    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v6    # "gzis":Ljava/util/zip/GZIPInputStream;
    :catch_5
    move-exception v11

    goto :goto_3

    .line 931
    :catch_6
    move-exception v11

    goto :goto_4

    .line 932
    :catch_7
    move-exception v11

    goto :goto_5

    .line 930
    :catch_8
    move-exception v12

    goto :goto_9

    .line 931
    :catch_9
    move-exception v12

    goto :goto_a

    .line 932
    :catch_a
    move-exception v12

    goto :goto_b

    .line 930
    .end local v2    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v3    # "baos":Ljava/io/ByteArrayOutputStream;
    :catchall_1
    move-exception v11

    move-object v2, v3

    .end local v3    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v2    # "baos":Ljava/io/ByteArrayOutputStream;
    goto :goto_8

    .end local v0    # "bais":Ljava/io/ByteArrayInputStream;
    .end local v2    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v1    # "bais":Ljava/io/ByteArrayInputStream;
    .restart local v3    # "baos":Ljava/io/ByteArrayOutputStream;
    :catchall_2
    move-exception v11

    move-object v2, v3

    .end local v3    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v2    # "baos":Ljava/io/ByteArrayOutputStream;
    move-object v0, v1

    .end local v1    # "bais":Ljava/io/ByteArrayInputStream;
    .restart local v0    # "bais":Ljava/io/ByteArrayInputStream;
    goto :goto_8

    .end local v0    # "bais":Ljava/io/ByteArrayInputStream;
    .end local v2    # "baos":Ljava/io/ByteArrayOutputStream;
    .end local v6    # "gzis":Ljava/util/zip/GZIPInputStream;
    .restart local v1    # "bais":Ljava/io/ByteArrayInputStream;
    .restart local v3    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v7    # "gzis":Ljava/util/zip/GZIPInputStream;
    :catchall_3
    move-exception v11

    move-object v2, v3

    .end local v3    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v2    # "baos":Ljava/io/ByteArrayOutputStream;
    move-object v6, v7

    .end local v7    # "gzis":Ljava/util/zip/GZIPInputStream;
    .restart local v6    # "gzis":Ljava/util/zip/GZIPInputStream;
    move-object v0, v1

    .end local v1    # "bais":Ljava/io/ByteArrayInputStream;
    .restart local v0    # "bais":Ljava/io/ByteArrayInputStream;
    goto :goto_8

    .line 924
    :catch_b
    move-exception v11

    goto :goto_2

    .end local v2    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v3    # "baos":Ljava/io/ByteArrayOutputStream;
    :catch_c
    move-exception v11

    move-object v2, v3

    .end local v3    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v2    # "baos":Ljava/io/ByteArrayOutputStream;
    goto :goto_2

    .end local v0    # "bais":Ljava/io/ByteArrayInputStream;
    .end local v2    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v1    # "bais":Ljava/io/ByteArrayInputStream;
    .restart local v3    # "baos":Ljava/io/ByteArrayOutputStream;
    :catch_d
    move-exception v11

    move-object v2, v3

    .end local v3    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v2    # "baos":Ljava/io/ByteArrayOutputStream;
    move-object v0, v1

    .end local v1    # "bais":Ljava/io/ByteArrayInputStream;
    .restart local v0    # "bais":Ljava/io/ByteArrayInputStream;
    goto :goto_2
.end method

.method public static decode([BIII)[B
    .locals 15
    .param p0, "source"    # [B
    .param p1, "off"    # I
    .param p2, "len"    # I
    .param p3, "options"    # I

    .prologue
    .line 806
    invoke-static/range {p3 .. p3}, Lorg/jivesoftware/smack/util/Base64;->getDecodabet(I)[B

    move-result-object v1

    .line 808
    .local v1, "DECODABET":[B
    mul-int/lit8 v12, p2, 0x3

    div-int/lit8 v6, v12, 0x4

    .line 809
    .local v6, "len34":I
    new-array v8, v6, [B

    .line 810
    .local v8, "outBuff":[B
    const/4 v9, 0x0

    .line 812
    .local v9, "outBuffPosn":I
    const/4 v12, 0x4

    new-array v2, v12, [B

    .line 813
    .local v2, "b4":[B
    const/4 v3, 0x0

    .line 814
    .local v3, "b4Posn":I
    const/4 v5, 0x0

    .line 815
    .local v5, "i":I
    const/4 v10, 0x0

    .line 816
    .local v10, "sbiCrop":B
    const/4 v11, 0x0

    .line 817
    .local v11, "sbiDecode":B
    move/from16 v5, p1

    move v4, v3

    .end local v3    # "b4Posn":I
    .local v4, "b4Posn":I
    :goto_0
    add-int v12, p1, p2

    if-ge v5, v12, :cond_3

    .line 819
    aget-byte v12, p0, v5

    and-int/lit8 v12, v12, 0x7f

    int-to-byte v10, v12

    .line 820
    aget-byte v11, v1, v10

    .line 822
    const/4 v12, -0x5

    if-lt v11, v12, :cond_0

    .line 824
    const/4 v12, -0x1

    if-lt v11, v12, :cond_1

    .line 826
    add-int/lit8 v3, v4, 0x1

    .end local v4    # "b4Posn":I
    .restart local v3    # "b4Posn":I
    aput-byte v10, v2, v4

    .line 827
    const/4 v12, 0x3

    if-le v3, v12, :cond_2

    .line 829
    const/4 v12, 0x0

    move/from16 v0, p3

    invoke-static {v2, v12, v8, v9, v0}, Lorg/jivesoftware/smack/util/Base64;->decode4to3([BI[BII)I

    move-result v12

    add-int/2addr v9, v12

    .line 830
    const/4 v3, 0x0

    .line 833
    const/16 v12, 0x3d

    if-ne v10, v12, :cond_2

    .line 847
    :goto_1
    new-array v7, v9, [B

    .line 848
    .local v7, "out":[B
    const/4 v12, 0x0

    const/4 v13, 0x0

    invoke-static {v8, v12, v7, v13, v9}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 849
    .end local v7    # "out":[B
    :goto_2
    return-object v7

    .line 842
    .end local v3    # "b4Posn":I
    .restart local v4    # "b4Posn":I
    :cond_0
    sget-object v12, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v14, "Bad Base64 input character at "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string/jumbo v14, ": "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    aget-byte v14, p0, v5

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string/jumbo v14, "(decimal)"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 843
    const/4 v7, 0x0

    move v3, v4

    .end local v4    # "b4Posn":I
    .restart local v3    # "b4Posn":I
    goto :goto_2

    .end local v3    # "b4Posn":I
    .restart local v4    # "b4Posn":I
    :cond_1
    move v3, v4

    .line 817
    .end local v4    # "b4Posn":I
    .restart local v3    # "b4Posn":I
    :cond_2
    add-int/lit8 v5, v5, 0x1

    move v4, v3

    .end local v3    # "b4Posn":I
    .restart local v4    # "b4Posn":I
    goto :goto_0

    :cond_3
    move v3, v4

    .end local v4    # "b4Posn":I
    .restart local v3    # "b4Posn":I
    goto :goto_1
.end method

.method private static decode4to3([BI[BII)I
    .locals 6
    .param p0, "source"    # [B
    .param p1, "srcOffset"    # I
    .param p2, "destination"    # [B
    .param p3, "destOffset"    # I
    .param p4, "options"    # I

    .prologue
    const/16 v4, 0x3d

    .line 729
    invoke-static {p4}, Lorg/jivesoftware/smack/util/Base64;->getDecodabet(I)[B

    move-result-object v0

    .line 732
    .local v0, "DECODABET":[B
    add-int/lit8 v3, p1, 0x2

    aget-byte v3, p0, v3

    if-ne v3, v4, :cond_0

    .line 737
    aget-byte v3, p0, p1

    aget-byte v3, v0, v3

    and-int/lit16 v3, v3, 0xff

    shl-int/lit8 v3, v3, 0x12

    add-int/lit8 v4, p1, 0x1

    aget-byte v4, p0, v4

    aget-byte v4, v0, v4

    and-int/lit16 v4, v4, 0xff

    shl-int/lit8 v4, v4, 0xc

    or-int v2, v3, v4

    .line 740
    .local v2, "outBuff":I
    ushr-int/lit8 v3, v2, 0x10

    int-to-byte v3, v3

    aput-byte v3, p2, p3

    .line 741
    const/4 v3, 0x1

    .line 785
    .end local v2    # "outBuff":I
    :goto_0
    return v3

    .line 745
    :cond_0
    add-int/lit8 v3, p1, 0x3

    aget-byte v3, p0, v3

    if-ne v3, v4, :cond_1

    .line 751
    aget-byte v3, p0, p1

    aget-byte v3, v0, v3

    and-int/lit16 v3, v3, 0xff

    shl-int/lit8 v3, v3, 0x12

    add-int/lit8 v4, p1, 0x1

    aget-byte v4, p0, v4

    aget-byte v4, v0, v4

    and-int/lit16 v4, v4, 0xff

    shl-int/lit8 v4, v4, 0xc

    or-int/2addr v3, v4

    add-int/lit8 v4, p1, 0x2

    aget-byte v4, p0, v4

    aget-byte v4, v0, v4

    and-int/lit16 v4, v4, 0xff

    shl-int/lit8 v4, v4, 0x6

    or-int v2, v3, v4

    .line 755
    .restart local v2    # "outBuff":I
    ushr-int/lit8 v3, v2, 0x10

    int-to-byte v3, v3

    aput-byte v3, p2, p3

    .line 756
    add-int/lit8 v3, p3, 0x1

    ushr-int/lit8 v4, v2, 0x8

    int-to-byte v4, v4

    aput-byte v4, p2, v3

    .line 757
    const/4 v3, 0x2

    goto :goto_0

    .line 769
    .end local v2    # "outBuff":I
    :cond_1
    :try_start_0
    aget-byte v3, p0, p1

    aget-byte v3, v0, v3

    and-int/lit16 v3, v3, 0xff

    shl-int/lit8 v3, v3, 0x12

    add-int/lit8 v4, p1, 0x1

    aget-byte v4, p0, v4

    aget-byte v4, v0, v4

    and-int/lit16 v4, v4, 0xff

    shl-int/lit8 v4, v4, 0xc

    or-int/2addr v3, v4

    add-int/lit8 v4, p1, 0x2

    aget-byte v4, p0, v4

    aget-byte v4, v0, v4

    and-int/lit16 v4, v4, 0xff

    shl-int/lit8 v4, v4, 0x6

    or-int/2addr v3, v4

    add-int/lit8 v4, p1, 0x3

    aget-byte v4, p0, v4

    aget-byte v4, v0, v4

    and-int/lit16 v4, v4, 0xff

    or-int v2, v3, v4

    .line 775
    .restart local v2    # "outBuff":I
    shr-int/lit8 v3, v2, 0x10

    int-to-byte v3, v3

    aput-byte v3, p2, p3

    .line 776
    add-int/lit8 v3, p3, 0x1

    shr-int/lit8 v4, v2, 0x8

    int-to-byte v4, v4

    aput-byte v4, p2, v3

    .line 777
    add-int/lit8 v3, p3, 0x2

    int-to-byte v4, v2

    aput-byte v4, p2, v3
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 779
    const/4 v3, 0x3

    goto :goto_0

    .line 780
    .end local v2    # "outBuff":I
    :catch_0
    move-exception v1

    .line 781
    .local v1, "e":Ljava/lang/Exception;
    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, ""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    aget-byte v5, p0, p1

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, ": "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    aget-byte v5, p0, p1

    aget-byte v5, v0, v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 782
    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, ""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    add-int/lit8 v5, p1, 0x1

    aget-byte v5, p0, v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, ": "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    add-int/lit8 v5, p1, 0x1

    aget-byte v5, p0, v5

    aget-byte v5, v0, v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 783
    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, ""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    add-int/lit8 v5, p1, 0x2

    aget-byte v5, p0, v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, ": "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    add-int/lit8 v5, p1, 0x2

    aget-byte v5, p0, v5

    aget-byte v5, v0, v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 784
    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, ""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    add-int/lit8 v5, p1, 0x3

    aget-byte v5, p0, v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, ": "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    add-int/lit8 v5, p1, 0x3

    aget-byte v5, p0, v5

    aget-byte v5, v0, v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 785
    const/4 v3, -0x1

    goto/16 :goto_0
.end method

.method public static decodeFileToFile(Ljava/lang/String;Ljava/lang/String;)V
    .locals 6
    .param p0, "infile"    # Ljava/lang/String;
    .param p1, "outfile"    # Ljava/lang/String;

    .prologue
    .line 1196
    invoke-static {p0}, Lorg/jivesoftware/smack/util/Base64;->decodeFromFile(Ljava/lang/String;)[B

    move-result-object v0

    .line 1197
    .local v0, "decoded":[B
    const/4 v2, 0x0

    .line 1199
    .local v2, "out":Ljava/io/OutputStream;
    :try_start_0
    new-instance v3, Ljava/io/BufferedOutputStream;

    new-instance v4, Ljava/io/FileOutputStream;

    invoke-direct {v4, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    invoke-direct {v3, v4}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1201
    .end local v2    # "out":Ljava/io/OutputStream;
    .local v3, "out":Ljava/io/OutputStream;
    :try_start_1
    invoke-virtual {v3, v0}, Ljava/io/OutputStream;->write([B)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_4
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 1207
    :try_start_2
    invoke-virtual {v3}, Ljava/io/OutputStream;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    move-object v2, v3

    .line 1210
    .end local v3    # "out":Ljava/io/OutputStream;
    .restart local v2    # "out":Ljava/io/OutputStream;
    :goto_0
    return-void

    .line 1208
    .end local v2    # "out":Ljava/io/OutputStream;
    .restart local v3    # "out":Ljava/io/OutputStream;
    :catch_0
    move-exception v4

    move-object v2, v3

    .line 1209
    .end local v3    # "out":Ljava/io/OutputStream;
    .restart local v2    # "out":Ljava/io/OutputStream;
    goto :goto_0

    .line 1203
    :catch_1
    move-exception v1

    .line 1204
    .local v1, "ex":Ljava/io/IOException;
    :goto_1
    :try_start_3
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 1207
    :try_start_4
    invoke-virtual {v2}, Ljava/io/OutputStream;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2

    goto :goto_0

    .line 1208
    :catch_2
    move-exception v4

    goto :goto_0

    .line 1207
    .end local v1    # "ex":Ljava/io/IOException;
    :catchall_0
    move-exception v4

    :goto_2
    :try_start_5
    invoke-virtual {v2}, Ljava/io/OutputStream;->close()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_3

    .line 1208
    :goto_3
    throw v4

    :catch_3
    move-exception v5

    goto :goto_3

    .line 1207
    .end local v2    # "out":Ljava/io/OutputStream;
    .restart local v3    # "out":Ljava/io/OutputStream;
    :catchall_1
    move-exception v4

    move-object v2, v3

    .end local v3    # "out":Ljava/io/OutputStream;
    .restart local v2    # "out":Ljava/io/OutputStream;
    goto :goto_2

    .line 1203
    .end local v2    # "out":Ljava/io/OutputStream;
    .restart local v3    # "out":Ljava/io/OutputStream;
    :catch_4
    move-exception v1

    move-object v2, v3

    .end local v3    # "out":Ljava/io/OutputStream;
    .restart local v2    # "out":Ljava/io/OutputStream;
    goto :goto_1
.end method

.method public static decodeFromFile(Ljava/lang/String;)[B
    .locals 12
    .param p0, "filename"    # Ljava/lang/String;

    .prologue
    .line 1069
    const/4 v3, 0x0

    .line 1070
    .local v3, "decodedData":[B
    const/4 v0, 0x0

    .line 1074
    .local v0, "bis":Lorg/jivesoftware/smack/util/Base64$InputStream;
    :try_start_0
    new-instance v5, Ljava/io/File;

    invoke-direct {v5, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 1075
    .local v5, "file":Ljava/io/File;
    const/4 v2, 0x0

    .line 1076
    .local v2, "buffer":[B
    const/4 v6, 0x0

    .line 1077
    .local v6, "length":I
    const/4 v7, 0x0

    .line 1080
    .local v7, "numBytes":I
    invoke-virtual {v5}, Ljava/io/File;->length()J

    move-result-wide v8

    const-wide/32 v10, 0x7fffffff

    cmp-long v8, v8, v10

    if-lez v8, :cond_0

    .line 1082
    sget-object v8, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v10, "File is too big for this convenience method ("

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v5}, Ljava/io/File;->length()J

    move-result-wide v10

    invoke-virtual {v9, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string/jumbo v10, " bytes)."

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1083
    const/4 v8, 0x0

    .line 1107
    :try_start_1
    invoke-virtual {v0}, Lorg/jivesoftware/smack/util/Base64$InputStream;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_3

    .line 1110
    .end local v2    # "buffer":[B
    .end local v5    # "file":Ljava/io/File;
    .end local v6    # "length":I
    .end local v7    # "numBytes":I
    :goto_0
    return-object v8

    .line 1085
    .restart local v2    # "buffer":[B
    .restart local v5    # "file":Ljava/io/File;
    .restart local v6    # "length":I
    .restart local v7    # "numBytes":I
    :cond_0
    :try_start_2
    invoke-virtual {v5}, Ljava/io/File;->length()J

    move-result-wide v8

    long-to-int v8, v8

    new-array v2, v8, [B

    .line 1088
    new-instance v1, Lorg/jivesoftware/smack/util/Base64$InputStream;

    new-instance v8, Ljava/io/BufferedInputStream;

    new-instance v9, Ljava/io/FileInputStream;

    invoke-direct {v9, v5}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v8, v9}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    const/4 v9, 0x0

    invoke-direct {v1, v8, v9}, Lorg/jivesoftware/smack/util/Base64$InputStream;-><init>(Ljava/io/InputStream;I)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 1093
    .end local v0    # "bis":Lorg/jivesoftware/smack/util/Base64$InputStream;
    .local v1, "bis":Lorg/jivesoftware/smack/util/Base64$InputStream;
    :goto_1
    const/16 v8, 0x1000

    :try_start_3
    invoke-virtual {v1, v2, v6, v8}, Lorg/jivesoftware/smack/util/Base64$InputStream;->read([BII)I

    move-result v7

    if-ltz v7, :cond_1

    .line 1094
    add-int/2addr v6, v7

    goto :goto_1

    .line 1097
    :cond_1
    new-array v3, v6, [B

    .line 1098
    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-static {v2, v8, v3, v9, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_5
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 1107
    :try_start_4
    invoke-virtual {v1}, Lorg/jivesoftware/smack/util/Base64$InputStream;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    move-object v0, v1

    .end local v1    # "bis":Lorg/jivesoftware/smack/util/Base64$InputStream;
    .end local v2    # "buffer":[B
    .end local v5    # "file":Ljava/io/File;
    .end local v6    # "length":I
    .end local v7    # "numBytes":I
    .restart local v0    # "bis":Lorg/jivesoftware/smack/util/Base64$InputStream;
    :goto_2
    move-object v8, v3

    .line 1110
    goto :goto_0

    .line 1107
    .end local v0    # "bis":Lorg/jivesoftware/smack/util/Base64$InputStream;
    .restart local v1    # "bis":Lorg/jivesoftware/smack/util/Base64$InputStream;
    .restart local v2    # "buffer":[B
    .restart local v5    # "file":Ljava/io/File;
    .restart local v6    # "length":I
    .restart local v7    # "numBytes":I
    :catch_0
    move-exception v8

    move-object v0, v1

    .line 1108
    .end local v1    # "bis":Lorg/jivesoftware/smack/util/Base64$InputStream;
    .restart local v0    # "bis":Lorg/jivesoftware/smack/util/Base64$InputStream;
    goto :goto_2

    .line 1101
    .end local v2    # "buffer":[B
    .end local v5    # "file":Ljava/io/File;
    .end local v6    # "length":I
    .end local v7    # "numBytes":I
    :catch_1
    move-exception v4

    .line 1103
    .local v4, "e":Ljava/io/IOException;
    :goto_3
    :try_start_5
    sget-object v8, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v10, "Error decoding from file "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 1107
    :try_start_6
    invoke-virtual {v0}, Lorg/jivesoftware/smack/util/Base64$InputStream;->close()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_2

    goto :goto_2

    :catch_2
    move-exception v8

    goto :goto_2

    .end local v4    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v8

    :goto_4
    :try_start_7
    invoke-virtual {v0}, Lorg/jivesoftware/smack/util/Base64$InputStream;->close()V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_4

    :goto_5
    throw v8

    .restart local v2    # "buffer":[B
    .restart local v5    # "file":Ljava/io/File;
    .restart local v6    # "length":I
    .restart local v7    # "numBytes":I
    :catch_3
    move-exception v9

    goto :goto_0

    .end local v2    # "buffer":[B
    .end local v5    # "file":Ljava/io/File;
    .end local v6    # "length":I
    .end local v7    # "numBytes":I
    :catch_4
    move-exception v9

    goto :goto_5

    .end local v0    # "bis":Lorg/jivesoftware/smack/util/Base64$InputStream;
    .restart local v1    # "bis":Lorg/jivesoftware/smack/util/Base64$InputStream;
    .restart local v2    # "buffer":[B
    .restart local v5    # "file":Ljava/io/File;
    .restart local v6    # "length":I
    .restart local v7    # "numBytes":I
    :catchall_1
    move-exception v8

    move-object v0, v1

    .end local v1    # "bis":Lorg/jivesoftware/smack/util/Base64$InputStream;
    .restart local v0    # "bis":Lorg/jivesoftware/smack/util/Base64$InputStream;
    goto :goto_4

    .line 1101
    .end local v0    # "bis":Lorg/jivesoftware/smack/util/Base64$InputStream;
    .restart local v1    # "bis":Lorg/jivesoftware/smack/util/Base64$InputStream;
    :catch_5
    move-exception v4

    move-object v0, v1

    .end local v1    # "bis":Lorg/jivesoftware/smack/util/Base64$InputStream;
    .restart local v0    # "bis":Lorg/jivesoftware/smack/util/Base64$InputStream;
    goto :goto_3
.end method

.method public static decodeToFile(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 6
    .param p0, "dataToDecode"    # Ljava/lang/String;
    .param p1, "filename"    # Ljava/lang/String;

    .prologue
    .line 1034
    const/4 v3, 0x0

    .line 1035
    .local v3, "success":Z
    const/4 v0, 0x0

    .line 1038
    .local v0, "bos":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    :try_start_0
    new-instance v1, Lorg/jivesoftware/smack/util/Base64$OutputStream;

    new-instance v4, Ljava/io/FileOutputStream;

    invoke-direct {v4, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    const/4 v5, 0x0

    invoke-direct {v1, v4, v5}, Lorg/jivesoftware/smack/util/Base64$OutputStream;-><init>(Ljava/io/OutputStream;I)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1040
    .end local v0    # "bos":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    .local v1, "bos":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    :try_start_1
    const-string/jumbo v4, "UTF-8"

    invoke-virtual {p0, v4}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v4

    invoke-virtual {v1, v4}, Lorg/jivesoftware/smack/util/Base64$OutputStream;->write([B)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_4
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 1041
    const/4 v3, 0x1

    .line 1049
    :try_start_2
    invoke-virtual {v1}, Lorg/jivesoftware/smack/util/Base64$OutputStream;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    move-object v0, v1

    .line 1052
    .end local v1    # "bos":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    .restart local v0    # "bos":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    :goto_0
    return v3

    .line 1049
    .end local v0    # "bos":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    .restart local v1    # "bos":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    :catch_0
    move-exception v4

    move-object v0, v1

    .line 1050
    .end local v1    # "bos":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    .restart local v0    # "bos":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    goto :goto_0

    .line 1043
    :catch_1
    move-exception v2

    .line 1045
    .local v2, "e":Ljava/io/IOException;
    :goto_1
    const/4 v3, 0x0

    .line 1049
    :try_start_3
    invoke-virtual {v0}, Lorg/jivesoftware/smack/util/Base64$OutputStream;->close()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    goto :goto_0

    :catch_2
    move-exception v4

    goto :goto_0

    .end local v2    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v4

    :goto_2
    :try_start_4
    invoke-virtual {v0}, Lorg/jivesoftware/smack/util/Base64$OutputStream;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3

    :goto_3
    throw v4

    :catch_3
    move-exception v5

    goto :goto_3

    .end local v0    # "bos":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    .restart local v1    # "bos":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    :catchall_1
    move-exception v4

    move-object v0, v1

    .end local v1    # "bos":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    .restart local v0    # "bos":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    goto :goto_2

    .line 1043
    .end local v0    # "bos":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    .restart local v1    # "bos":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    :catch_4
    move-exception v2

    move-object v0, v1

    .end local v1    # "bos":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    .restart local v0    # "bos":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    goto :goto_1
.end method

.method public static decodeToObject(Ljava/lang/String;)Ljava/lang/Object;
    .locals 9
    .param p0, "encodedObject"    # Ljava/lang/String;

    .prologue
    .line 955
    invoke-static {p0}, Lorg/jivesoftware/smack/util/Base64;->decode(Ljava/lang/String;)[B

    move-result-object v4

    .line 957
    .local v4, "objBytes":[B
    const/4 v0, 0x0

    .line 958
    .local v0, "bais":Ljava/io/ByteArrayInputStream;
    const/4 v5, 0x0

    .line 959
    .local v5, "ois":Ljava/io/ObjectInputStream;
    const/4 v3, 0x0

    .line 963
    .local v3, "obj":Ljava/lang/Object;
    :try_start_0
    new-instance v1, Ljava/io/ByteArrayInputStream;

    invoke-direct {v1, v4}, Ljava/io/ByteArrayInputStream;-><init>([B)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_3
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 964
    .end local v0    # "bais":Ljava/io/ByteArrayInputStream;
    .local v1, "bais":Ljava/io/ByteArrayInputStream;
    :try_start_1
    new-instance v6, Ljava/io/ObjectInputStream;

    invoke-direct {v6, v1}, Ljava/io/ObjectInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_c
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1 .. :try_end_1} :catch_a
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 966
    .end local v5    # "ois":Ljava/io/ObjectInputStream;
    .local v6, "ois":Ljava/io/ObjectInputStream;
    :try_start_2
    invoke-virtual {v6}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_d
    .catch Ljava/lang/ClassNotFoundException; {:try_start_2 .. :try_end_2} :catch_b
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    move-result-object v3

    .line 980
    :try_start_3
    invoke-virtual {v1}, Ljava/io/ByteArrayInputStream;->close()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_5

    .line 981
    :goto_0
    :try_start_4
    invoke-virtual {v6}, Ljava/io/ObjectInputStream;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    move-object v5, v6

    .end local v6    # "ois":Ljava/io/ObjectInputStream;
    .restart local v5    # "ois":Ljava/io/ObjectInputStream;
    move-object v0, v1

    .line 984
    .end local v1    # "bais":Ljava/io/ByteArrayInputStream;
    .end local v3    # "obj":Ljava/lang/Object;
    .restart local v0    # "bais":Ljava/io/ByteArrayInputStream;
    :goto_1
    return-object v3

    .line 981
    .end local v0    # "bais":Ljava/io/ByteArrayInputStream;
    .end local v5    # "ois":Ljava/io/ObjectInputStream;
    .restart local v1    # "bais":Ljava/io/ByteArrayInputStream;
    .restart local v3    # "obj":Ljava/lang/Object;
    .restart local v6    # "ois":Ljava/io/ObjectInputStream;
    :catch_0
    move-exception v7

    move-object v5, v6

    .end local v6    # "ois":Ljava/io/ObjectInputStream;
    .restart local v5    # "ois":Ljava/io/ObjectInputStream;
    move-object v0, v1

    .line 982
    .end local v1    # "bais":Ljava/io/ByteArrayInputStream;
    .restart local v0    # "bais":Ljava/io/ByteArrayInputStream;
    goto :goto_1

    .line 968
    :catch_1
    move-exception v2

    .line 970
    .local v2, "e":Ljava/io/IOException;
    :goto_2
    :try_start_5
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 971
    const/4 v3, 0x0

    .line 980
    :try_start_6
    invoke-virtual {v0}, Ljava/io/ByteArrayInputStream;->close()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_6

    .line 981
    :goto_3
    :try_start_7
    invoke-virtual {v5}, Ljava/io/ObjectInputStream;->close()V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_2

    goto :goto_1

    :catch_2
    move-exception v7

    goto :goto_1

    .line 973
    .end local v2    # "e":Ljava/io/IOException;
    :catch_3
    move-exception v2

    .line 975
    .local v2, "e":Ljava/lang/ClassNotFoundException;
    :goto_4
    :try_start_8
    invoke-virtual {v2}, Ljava/lang/ClassNotFoundException;->printStackTrace()V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 976
    const/4 v3, 0x0

    .line 980
    :try_start_9
    invoke-virtual {v0}, Ljava/io/ByteArrayInputStream;->close()V
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_7

    .line 981
    :goto_5
    :try_start_a
    invoke-virtual {v5}, Ljava/io/ObjectInputStream;->close()V
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_4

    goto :goto_1

    :catch_4
    move-exception v7

    goto :goto_1

    .line 980
    .end local v2    # "e":Ljava/lang/ClassNotFoundException;
    :catchall_0
    move-exception v7

    :goto_6
    :try_start_b
    invoke-virtual {v0}, Ljava/io/ByteArrayInputStream;->close()V
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_8

    .line 981
    :goto_7
    :try_start_c
    invoke-virtual {v5}, Ljava/io/ObjectInputStream;->close()V
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_9

    :goto_8
    throw v7

    .line 980
    .end local v0    # "bais":Ljava/io/ByteArrayInputStream;
    .end local v5    # "ois":Ljava/io/ObjectInputStream;
    .restart local v1    # "bais":Ljava/io/ByteArrayInputStream;
    .restart local v6    # "ois":Ljava/io/ObjectInputStream;
    :catch_5
    move-exception v7

    goto :goto_0

    .end local v1    # "bais":Ljava/io/ByteArrayInputStream;
    .end local v6    # "ois":Ljava/io/ObjectInputStream;
    .restart local v0    # "bais":Ljava/io/ByteArrayInputStream;
    .local v2, "e":Ljava/io/IOException;
    .restart local v5    # "ois":Ljava/io/ObjectInputStream;
    :catch_6
    move-exception v7

    goto :goto_3

    .local v2, "e":Ljava/lang/ClassNotFoundException;
    :catch_7
    move-exception v7

    goto :goto_5

    .end local v2    # "e":Ljava/lang/ClassNotFoundException;
    :catch_8
    move-exception v8

    goto :goto_7

    .line 981
    :catch_9
    move-exception v8

    goto :goto_8

    .line 980
    .end local v0    # "bais":Ljava/io/ByteArrayInputStream;
    .restart local v1    # "bais":Ljava/io/ByteArrayInputStream;
    :catchall_1
    move-exception v7

    move-object v0, v1

    .end local v1    # "bais":Ljava/io/ByteArrayInputStream;
    .restart local v0    # "bais":Ljava/io/ByteArrayInputStream;
    goto :goto_6

    .end local v0    # "bais":Ljava/io/ByteArrayInputStream;
    .end local v5    # "ois":Ljava/io/ObjectInputStream;
    .restart local v1    # "bais":Ljava/io/ByteArrayInputStream;
    .restart local v6    # "ois":Ljava/io/ObjectInputStream;
    :catchall_2
    move-exception v7

    move-object v5, v6

    .end local v6    # "ois":Ljava/io/ObjectInputStream;
    .restart local v5    # "ois":Ljava/io/ObjectInputStream;
    move-object v0, v1

    .end local v1    # "bais":Ljava/io/ByteArrayInputStream;
    .restart local v0    # "bais":Ljava/io/ByteArrayInputStream;
    goto :goto_6

    .line 973
    .end local v0    # "bais":Ljava/io/ByteArrayInputStream;
    .restart local v1    # "bais":Ljava/io/ByteArrayInputStream;
    :catch_a
    move-exception v2

    move-object v0, v1

    .end local v1    # "bais":Ljava/io/ByteArrayInputStream;
    .restart local v0    # "bais":Ljava/io/ByteArrayInputStream;
    goto :goto_4

    .end local v0    # "bais":Ljava/io/ByteArrayInputStream;
    .end local v5    # "ois":Ljava/io/ObjectInputStream;
    .restart local v1    # "bais":Ljava/io/ByteArrayInputStream;
    .restart local v6    # "ois":Ljava/io/ObjectInputStream;
    :catch_b
    move-exception v2

    move-object v5, v6

    .end local v6    # "ois":Ljava/io/ObjectInputStream;
    .restart local v5    # "ois":Ljava/io/ObjectInputStream;
    move-object v0, v1

    .end local v1    # "bais":Ljava/io/ByteArrayInputStream;
    .restart local v0    # "bais":Ljava/io/ByteArrayInputStream;
    goto :goto_4

    .line 968
    .end local v0    # "bais":Ljava/io/ByteArrayInputStream;
    .restart local v1    # "bais":Ljava/io/ByteArrayInputStream;
    :catch_c
    move-exception v2

    move-object v0, v1

    .end local v1    # "bais":Ljava/io/ByteArrayInputStream;
    .restart local v0    # "bais":Ljava/io/ByteArrayInputStream;
    goto :goto_2

    .end local v0    # "bais":Ljava/io/ByteArrayInputStream;
    .end local v5    # "ois":Ljava/io/ObjectInputStream;
    .restart local v1    # "bais":Ljava/io/ByteArrayInputStream;
    .restart local v6    # "ois":Ljava/io/ObjectInputStream;
    :catch_d
    move-exception v2

    move-object v5, v6

    .end local v6    # "ois":Ljava/io/ObjectInputStream;
    .restart local v5    # "ois":Ljava/io/ObjectInputStream;
    move-object v0, v1

    .end local v1    # "bais":Ljava/io/ByteArrayInputStream;
    .restart local v0    # "bais":Ljava/io/ByteArrayInputStream;
    goto :goto_2
.end method

.method private static encode3to4([BII[BII)[B
    .locals 6
    .param p0, "source"    # [B
    .param p1, "srcOffset"    # I
    .param p2, "numSigBytes"    # I
    .param p3, "destination"    # [B
    .param p4, "destOffset"    # I
    .param p5, "options"    # I

    .prologue
    const/16 v5, 0x3d

    const/4 v2, 0x0

    .line 378
    invoke-static {p5}, Lorg/jivesoftware/smack/util/Base64;->getAlphabet(I)[B

    move-result-object v0

    .line 391
    .local v0, "ALPHABET":[B
    if-lez p2, :cond_1

    aget-byte v3, p0, p1

    shl-int/lit8 v3, v3, 0x18

    ushr-int/lit8 v3, v3, 0x8

    move v4, v3

    :goto_0
    const/4 v3, 0x1

    if-le p2, v3, :cond_2

    add-int/lit8 v3, p1, 0x1

    aget-byte v3, p0, v3

    shl-int/lit8 v3, v3, 0x18

    ushr-int/lit8 v3, v3, 0x10

    :goto_1
    or-int/2addr v3, v4

    const/4 v4, 0x2

    if-le p2, v4, :cond_0

    add-int/lit8 v2, p1, 0x2

    aget-byte v2, p0, v2

    shl-int/lit8 v2, v2, 0x18

    ushr-int/lit8 v2, v2, 0x18

    :cond_0
    or-int v1, v3, v2

    .line 395
    .local v1, "inBuff":I
    packed-switch p2, :pswitch_data_0

    .line 419
    :goto_2
    return-object p3

    .end local v1    # "inBuff":I
    :cond_1
    move v4, v2

    .line 391
    goto :goto_0

    :cond_2
    move v3, v2

    goto :goto_1

    .line 398
    .restart local v1    # "inBuff":I
    :pswitch_0
    ushr-int/lit8 v2, v1, 0x12

    aget-byte v2, v0, v2

    aput-byte v2, p3, p4

    .line 399
    add-int/lit8 v2, p4, 0x1

    ushr-int/lit8 v3, v1, 0xc

    and-int/lit8 v3, v3, 0x3f

    aget-byte v3, v0, v3

    aput-byte v3, p3, v2

    .line 400
    add-int/lit8 v2, p4, 0x2

    ushr-int/lit8 v3, v1, 0x6

    and-int/lit8 v3, v3, 0x3f

    aget-byte v3, v0, v3

    aput-byte v3, p3, v2

    .line 401
    add-int/lit8 v2, p4, 0x3

    and-int/lit8 v3, v1, 0x3f

    aget-byte v3, v0, v3

    aput-byte v3, p3, v2

    goto :goto_2

    .line 405
    :pswitch_1
    ushr-int/lit8 v2, v1, 0x12

    aget-byte v2, v0, v2

    aput-byte v2, p3, p4

    .line 406
    add-int/lit8 v2, p4, 0x1

    ushr-int/lit8 v3, v1, 0xc

    and-int/lit8 v3, v3, 0x3f

    aget-byte v3, v0, v3

    aput-byte v3, p3, v2

    .line 407
    add-int/lit8 v2, p4, 0x2

    ushr-int/lit8 v3, v1, 0x6

    and-int/lit8 v3, v3, 0x3f

    aget-byte v3, v0, v3

    aput-byte v3, p3, v2

    .line 408
    add-int/lit8 v2, p4, 0x3

    aput-byte v5, p3, v2

    goto :goto_2

    .line 412
    :pswitch_2
    ushr-int/lit8 v2, v1, 0x12

    aget-byte v2, v0, v2

    aput-byte v2, p3, p4

    .line 413
    add-int/lit8 v2, p4, 0x1

    ushr-int/lit8 v3, v1, 0xc

    and-int/lit8 v3, v3, 0x3f

    aget-byte v3, v0, v3

    aput-byte v3, p3, v2

    .line 414
    add-int/lit8 v2, p4, 0x2

    aput-byte v5, p3, v2

    .line 415
    add-int/lit8 v2, p4, 0x3

    aput-byte v5, p3, v2

    goto :goto_2

    .line 395
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static encode3to4([B[BII)[B
    .locals 6
    .param p0, "b4"    # [B
    .param p1, "threeBytes"    # [B
    .param p2, "numSigBytes"    # I
    .param p3, "options"    # I

    .prologue
    const/4 v1, 0x0

    .line 346
    move-object v0, p1

    move v2, p2

    move-object v3, p0

    move v4, v1

    move v5, p3

    invoke-static/range {v0 .. v5}, Lorg/jivesoftware/smack/util/Base64;->encode3to4([BII[BII)[B

    .line 347
    return-object p0
.end method

.method public static encodeBytes([B)Ljava/lang/String;
    .locals 2
    .param p0, "source"    # [B

    .prologue
    const/4 v1, 0x0

    .line 531
    array-length v0, p0

    invoke-static {p0, v1, v0, v1}, Lorg/jivesoftware/smack/util/Base64;->encodeBytes([BIII)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static encodeBytes([BI)Ljava/lang/String;
    .locals 2
    .param p0, "source"    # [B
    .param p1, "options"    # I

    .prologue
    .line 558
    const/4 v0, 0x0

    array-length v1, p0

    invoke-static {p0, v0, v1, p1}, Lorg/jivesoftware/smack/util/Base64;->encodeBytes([BIII)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static encodeBytes([BII)Ljava/lang/String;
    .locals 1
    .param p0, "source"    # [B
    .param p1, "off"    # I
    .param p2, "len"    # I

    .prologue
    .line 573
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0}, Lorg/jivesoftware/smack/util/Base64;->encodeBytes([BIII)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static encodeBytes([BIII)Ljava/lang/String;
    .locals 24
    .param p0, "source"    # [B
    .param p1, "off"    # I
    .param p2, "len"    # I
    .param p3, "options"    # I

    .prologue
    .line 603
    and-int/lit8 v16, p3, 0x8

    .line 604
    .local v16, "dontBreakLines":I
    and-int/lit8 v17, p3, 0x2

    .line 607
    .local v17, "gzip":I
    const/4 v4, 0x2

    move/from16 v0, v17

    if-ne v0, v4, :cond_0

    .line 609
    const/4 v12, 0x0

    .line 610
    .local v12, "baos":Ljava/io/ByteArrayOutputStream;
    const/16 v18, 0x0

    .line 611
    .local v18, "gzos":Ljava/util/zip/GZIPOutputStream;
    const/4 v10, 0x0

    .line 617
    .local v10, "b64os":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    :try_start_0
    new-instance v13, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v13}, Ljava/io/ByteArrayOutputStream;-><init>()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 618
    .end local v12    # "baos":Ljava/io/ByteArrayOutputStream;
    .local v13, "baos":Ljava/io/ByteArrayOutputStream;
    :try_start_1
    new-instance v11, Lorg/jivesoftware/smack/util/Base64$OutputStream;

    or-int/lit8 v4, p3, 0x1

    invoke-direct {v11, v13, v4}, Lorg/jivesoftware/smack/util/Base64$OutputStream;-><init>(Ljava/io/OutputStream;I)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_c
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 619
    .end local v10    # "b64os":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    .local v11, "b64os":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    :try_start_2
    new-instance v19, Ljava/util/zip/GZIPOutputStream;

    move-object/from16 v0, v19

    invoke-direct {v0, v11}, Ljava/util/zip/GZIPOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_d
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 621
    .end local v18    # "gzos":Ljava/util/zip/GZIPOutputStream;
    .local v19, "gzos":Ljava/util/zip/GZIPOutputStream;
    :try_start_3
    move-object/from16 v0, v19

    move-object/from16 v1, p0

    move/from16 v2, p1

    move/from16 v3, p2

    invoke-virtual {v0, v1, v2, v3}, Ljava/util/zip/GZIPOutputStream;->write([BII)V

    .line 622
    invoke-virtual/range {v19 .. v19}, Ljava/util/zip/GZIPOutputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_e
    .catchall {:try_start_3 .. :try_end_3} :catchall_3

    .line 631
    :try_start_4
    invoke-virtual/range {v19 .. v19}, Ljava/util/zip/GZIPOutputStream;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_4

    .line 632
    :goto_0
    :try_start_5
    invoke-virtual {v11}, Lorg/jivesoftware/smack/util/Base64$OutputStream;->close()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_5

    .line 633
    :goto_1
    :try_start_6
    invoke-virtual {v13}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_6

    .line 639
    :goto_2
    :try_start_7
    new-instance v4, Ljava/lang/String;

    invoke-virtual {v13}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v5

    const-string/jumbo v6, "UTF-8"

    invoke-direct {v4, v5, v6}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_7
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_7 .. :try_end_7} :catch_2

    .line 688
    .end local v11    # "b64os":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    .end local v13    # "baos":Ljava/io/ByteArrayOutputStream;
    .end local v19    # "gzos":Ljava/util/zip/GZIPOutputStream;
    :goto_3
    return-object v4

    .line 624
    .restart local v10    # "b64os":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    .restart local v12    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v18    # "gzos":Ljava/util/zip/GZIPOutputStream;
    :catch_0
    move-exception v8

    .line 626
    .local v8, "e":Ljava/io/IOException;
    :goto_4
    :try_start_8
    invoke-virtual {v8}, Ljava/io/IOException;->printStackTrace()V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 627
    const/4 v4, 0x0

    .line 631
    :try_start_9
    invoke-virtual/range {v18 .. v18}, Ljava/util/zip/GZIPOutputStream;->close()V
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_7

    .line 632
    :goto_5
    :try_start_a
    invoke-virtual {v10}, Lorg/jivesoftware/smack/util/Base64$OutputStream;->close()V
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_8

    .line 633
    :goto_6
    :try_start_b
    invoke-virtual {v12}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_1

    goto :goto_3

    :catch_1
    move-exception v5

    goto :goto_3

    .line 631
    .end local v8    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v4

    :goto_7
    :try_start_c
    invoke-virtual/range {v18 .. v18}, Ljava/util/zip/GZIPOutputStream;->close()V
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_9

    .line 632
    :goto_8
    :try_start_d
    invoke-virtual {v10}, Lorg/jivesoftware/smack/util/Base64$OutputStream;->close()V
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_d} :catch_a

    .line 633
    :goto_9
    :try_start_e
    invoke-virtual {v12}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_e} :catch_b

    :goto_a
    throw v4

    .line 641
    .end local v10    # "b64os":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    .end local v12    # "baos":Ljava/io/ByteArrayOutputStream;
    .end local v18    # "gzos":Ljava/util/zip/GZIPOutputStream;
    .restart local v11    # "b64os":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    .restart local v13    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v19    # "gzos":Ljava/util/zip/GZIPOutputStream;
    :catch_2
    move-exception v23

    .line 643
    .local v23, "uue":Ljava/io/UnsupportedEncodingException;
    new-instance v4, Ljava/lang/String;

    invoke-virtual {v13}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/String;-><init>([B)V

    goto :goto_3

    .line 651
    .end local v11    # "b64os":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    .end local v13    # "baos":Ljava/io/ByteArrayOutputStream;
    .end local v19    # "gzos":Ljava/util/zip/GZIPOutputStream;
    .end local v23    # "uue":Ljava/io/UnsupportedEncodingException;
    :cond_0
    if-nez v16, :cond_2

    const/4 v14, 0x1

    .line 653
    .local v14, "breakLines":Z
    :goto_b
    mul-int/lit8 v4, p2, 0x4

    div-int/lit8 v21, v4, 0x3

    .line 654
    .local v21, "len43":I
    rem-int/lit8 v4, p2, 0x3

    if-lez v4, :cond_3

    const/4 v4, 0x4

    :goto_c
    add-int v5, v21, v4

    if-eqz v14, :cond_4

    div-int/lit8 v4, v21, 0x4c

    :goto_d
    add-int/2addr v4, v5

    new-array v7, v4, [B

    .line 657
    .local v7, "outBuff":[B
    const/4 v15, 0x0

    .line 658
    .local v15, "d":I
    const/4 v8, 0x0

    .line 659
    .local v8, "e":I
    add-int/lit8 v20, p2, -0x2

    .line 660
    .local v20, "len2":I
    const/16 v22, 0x0

    .line 661
    .local v22, "lineLength":I
    :goto_e
    move/from16 v0, v20

    if-ge v15, v0, :cond_5

    .line 663
    add-int v5, v15, p1

    const/4 v6, 0x3

    move-object/from16 v4, p0

    move/from16 v9, p3

    invoke-static/range {v4 .. v9}, Lorg/jivesoftware/smack/util/Base64;->encode3to4([BII[BII)[B

    .line 665
    add-int/lit8 v22, v22, 0x4

    .line 666
    if-eqz v14, :cond_1

    const/16 v4, 0x4c

    move/from16 v0, v22

    if-ne v0, v4, :cond_1

    .line 668
    add-int/lit8 v4, v8, 0x4

    const/16 v5, 0xa

    aput-byte v5, v7, v4

    .line 669
    add-int/lit8 v8, v8, 0x1

    .line 670
    const/16 v22, 0x0

    .line 661
    :cond_1
    add-int/lit8 v15, v15, 0x3

    add-int/lit8 v8, v8, 0x4

    goto :goto_e

    .line 651
    .end local v7    # "outBuff":[B
    .end local v8    # "e":I
    .end local v14    # "breakLines":Z
    .end local v15    # "d":I
    .end local v20    # "len2":I
    .end local v21    # "len43":I
    .end local v22    # "lineLength":I
    :cond_2
    const/4 v14, 0x0

    goto :goto_b

    .line 654
    .restart local v14    # "breakLines":Z
    .restart local v21    # "len43":I
    :cond_3
    const/4 v4, 0x0

    goto :goto_c

    :cond_4
    const/4 v4, 0x0

    goto :goto_d

    .line 674
    .restart local v7    # "outBuff":[B
    .restart local v8    # "e":I
    .restart local v15    # "d":I
    .restart local v20    # "len2":I
    .restart local v22    # "lineLength":I
    :cond_5
    move/from16 v0, p2

    if-ge v15, v0, :cond_6

    .line 676
    add-int v5, v15, p1

    sub-int v6, p2, v15

    move-object/from16 v4, p0

    move/from16 v9, p3

    invoke-static/range {v4 .. v9}, Lorg/jivesoftware/smack/util/Base64;->encode3to4([BII[BII)[B

    .line 677
    add-int/lit8 v8, v8, 0x4

    .line 684
    :cond_6
    :try_start_f
    new-instance v4, Ljava/lang/String;

    const/4 v5, 0x0

    const-string/jumbo v6, "UTF-8"

    invoke-direct {v4, v7, v5, v8, v6}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V
    :try_end_f
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_f .. :try_end_f} :catch_3

    goto/16 :goto_3

    .line 686
    :catch_3
    move-exception v23

    .line 688
    .restart local v23    # "uue":Ljava/io/UnsupportedEncodingException;
    new-instance v4, Ljava/lang/String;

    const/4 v5, 0x0

    invoke-direct {v4, v7, v5, v8}, Ljava/lang/String;-><init>([BII)V

    goto/16 :goto_3

    .line 631
    .end local v7    # "outBuff":[B
    .end local v8    # "e":I
    .end local v14    # "breakLines":Z
    .end local v15    # "d":I
    .end local v20    # "len2":I
    .end local v21    # "len43":I
    .end local v22    # "lineLength":I
    .end local v23    # "uue":Ljava/io/UnsupportedEncodingException;
    .restart local v11    # "b64os":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    .restart local v13    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v19    # "gzos":Ljava/util/zip/GZIPOutputStream;
    :catch_4
    move-exception v4

    goto/16 :goto_0

    .line 632
    :catch_5
    move-exception v4

    goto/16 :goto_1

    .line 633
    :catch_6
    move-exception v4

    goto/16 :goto_2

    .line 631
    .end local v11    # "b64os":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    .end local v13    # "baos":Ljava/io/ByteArrayOutputStream;
    .end local v19    # "gzos":Ljava/util/zip/GZIPOutputStream;
    .local v8, "e":Ljava/io/IOException;
    .restart local v10    # "b64os":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    .restart local v12    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v18    # "gzos":Ljava/util/zip/GZIPOutputStream;
    :catch_7
    move-exception v5

    goto/16 :goto_5

    .line 632
    :catch_8
    move-exception v5

    goto/16 :goto_6

    .line 631
    .end local v8    # "e":Ljava/io/IOException;
    :catch_9
    move-exception v5

    goto/16 :goto_8

    .line 632
    :catch_a
    move-exception v5

    goto/16 :goto_9

    .line 633
    :catch_b
    move-exception v5

    goto/16 :goto_a

    .line 631
    .end local v12    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v13    # "baos":Ljava/io/ByteArrayOutputStream;
    :catchall_1
    move-exception v4

    move-object v12, v13

    .end local v13    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v12    # "baos":Ljava/io/ByteArrayOutputStream;
    goto/16 :goto_7

    .end local v10    # "b64os":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    .end local v12    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v11    # "b64os":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    .restart local v13    # "baos":Ljava/io/ByteArrayOutputStream;
    :catchall_2
    move-exception v4

    move-object v10, v11

    .end local v11    # "b64os":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    .restart local v10    # "b64os":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    move-object v12, v13

    .end local v13    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v12    # "baos":Ljava/io/ByteArrayOutputStream;
    goto/16 :goto_7

    .end local v10    # "b64os":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    .end local v12    # "baos":Ljava/io/ByteArrayOutputStream;
    .end local v18    # "gzos":Ljava/util/zip/GZIPOutputStream;
    .restart local v11    # "b64os":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    .restart local v13    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v19    # "gzos":Ljava/util/zip/GZIPOutputStream;
    :catchall_3
    move-exception v4

    move-object v10, v11

    .end local v11    # "b64os":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    .restart local v10    # "b64os":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    move-object/from16 v18, v19

    .end local v19    # "gzos":Ljava/util/zip/GZIPOutputStream;
    .restart local v18    # "gzos":Ljava/util/zip/GZIPOutputStream;
    move-object v12, v13

    .end local v13    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v12    # "baos":Ljava/io/ByteArrayOutputStream;
    goto/16 :goto_7

    .line 624
    .end local v12    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v13    # "baos":Ljava/io/ByteArrayOutputStream;
    :catch_c
    move-exception v8

    move-object v12, v13

    .end local v13    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v12    # "baos":Ljava/io/ByteArrayOutputStream;
    goto/16 :goto_4

    .end local v10    # "b64os":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    .end local v12    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v11    # "b64os":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    .restart local v13    # "baos":Ljava/io/ByteArrayOutputStream;
    :catch_d
    move-exception v8

    move-object v10, v11

    .end local v11    # "b64os":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    .restart local v10    # "b64os":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    move-object v12, v13

    .end local v13    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v12    # "baos":Ljava/io/ByteArrayOutputStream;
    goto/16 :goto_4

    .end local v10    # "b64os":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    .end local v12    # "baos":Ljava/io/ByteArrayOutputStream;
    .end local v18    # "gzos":Ljava/util/zip/GZIPOutputStream;
    .restart local v11    # "b64os":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    .restart local v13    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v19    # "gzos":Ljava/util/zip/GZIPOutputStream;
    :catch_e
    move-exception v8

    move-object v10, v11

    .end local v11    # "b64os":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    .restart local v10    # "b64os":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    move-object/from16 v18, v19

    .end local v19    # "gzos":Ljava/util/zip/GZIPOutputStream;
    .restart local v18    # "gzos":Ljava/util/zip/GZIPOutputStream;
    move-object v12, v13

    .end local v13    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v12    # "baos":Ljava/io/ByteArrayOutputStream;
    goto/16 :goto_4
.end method

.method public static encodeFileToFile(Ljava/lang/String;Ljava/lang/String;)V
    .locals 6
    .param p0, "infile"    # Ljava/lang/String;
    .param p1, "outfile"    # Ljava/lang/String;

    .prologue
    .line 1170
    invoke-static {p0}, Lorg/jivesoftware/smack/util/Base64;->encodeFromFile(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1171
    .local v0, "encoded":Ljava/lang/String;
    const/4 v2, 0x0

    .line 1173
    .local v2, "out":Ljava/io/OutputStream;
    :try_start_0
    new-instance v3, Ljava/io/BufferedOutputStream;

    new-instance v4, Ljava/io/FileOutputStream;

    invoke-direct {v4, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    invoke-direct {v3, v4}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1175
    .end local v2    # "out":Ljava/io/OutputStream;
    .local v3, "out":Ljava/io/OutputStream;
    :try_start_1
    const-string/jumbo v4, "US-ASCII"

    invoke-virtual {v0, v4}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/OutputStream;->write([B)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_4
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 1181
    :try_start_2
    invoke-virtual {v3}, Ljava/io/OutputStream;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    move-object v2, v3

    .line 1184
    .end local v3    # "out":Ljava/io/OutputStream;
    .restart local v2    # "out":Ljava/io/OutputStream;
    :goto_0
    return-void

    .line 1182
    .end local v2    # "out":Ljava/io/OutputStream;
    .restart local v3    # "out":Ljava/io/OutputStream;
    :catch_0
    move-exception v4

    move-object v2, v3

    .line 1183
    .end local v3    # "out":Ljava/io/OutputStream;
    .restart local v2    # "out":Ljava/io/OutputStream;
    goto :goto_0

    .line 1177
    :catch_1
    move-exception v1

    .line 1178
    .local v1, "ex":Ljava/io/IOException;
    :goto_1
    :try_start_3
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 1181
    :try_start_4
    invoke-virtual {v2}, Ljava/io/OutputStream;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2

    goto :goto_0

    .line 1182
    :catch_2
    move-exception v4

    goto :goto_0

    .line 1181
    .end local v1    # "ex":Ljava/io/IOException;
    :catchall_0
    move-exception v4

    :goto_2
    :try_start_5
    invoke-virtual {v2}, Ljava/io/OutputStream;->close()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_3

    .line 1182
    :goto_3
    throw v4

    :catch_3
    move-exception v5

    goto :goto_3

    .line 1181
    .end local v2    # "out":Ljava/io/OutputStream;
    .restart local v3    # "out":Ljava/io/OutputStream;
    :catchall_1
    move-exception v4

    move-object v2, v3

    .end local v3    # "out":Ljava/io/OutputStream;
    .restart local v2    # "out":Ljava/io/OutputStream;
    goto :goto_2

    .line 1177
    .end local v2    # "out":Ljava/io/OutputStream;
    .restart local v3    # "out":Ljava/io/OutputStream;
    :catch_4
    move-exception v1

    move-object v2, v3

    .end local v3    # "out":Ljava/io/OutputStream;
    .restart local v2    # "out":Ljava/io/OutputStream;
    goto :goto_1
.end method

.method public static encodeFromFile(Ljava/lang/String;)Ljava/lang/String;
    .locals 14
    .param p0, "filename"    # Ljava/lang/String;

    .prologue
    .line 1126
    const/4 v4, 0x0

    .line 1127
    .local v4, "encodedData":Ljava/lang/String;
    const/4 v0, 0x0

    .line 1131
    .local v0, "bis":Lorg/jivesoftware/smack/util/Base64$InputStream;
    :try_start_0
    new-instance v6, Ljava/io/File;

    invoke-direct {v6, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 1132
    .local v6, "file":Ljava/io/File;
    invoke-virtual {v6}, Ljava/io/File;->length()J

    move-result-wide v10

    long-to-double v10, v10

    const-wide v12, 0x3ff6666666666666L    # 1.4

    mul-double/2addr v10, v12

    double-to-int v9, v10

    const/16 v10, 0x28

    invoke-static {v9, v10}, Ljava/lang/Math;->max(II)I

    move-result v9

    new-array v2, v9, [B

    .line 1133
    .local v2, "buffer":[B
    const/4 v7, 0x0

    .line 1134
    .local v7, "length":I
    const/4 v8, 0x0

    .line 1137
    .local v8, "numBytes":I
    new-instance v1, Lorg/jivesoftware/smack/util/Base64$InputStream;

    new-instance v9, Ljava/io/BufferedInputStream;

    new-instance v10, Ljava/io/FileInputStream;

    invoke-direct {v10, v6}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v9, v10}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    const/4 v10, 0x1

    invoke-direct {v1, v9, v10}, Lorg/jivesoftware/smack/util/Base64$InputStream;-><init>(Ljava/io/InputStream;I)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1142
    .end local v0    # "bis":Lorg/jivesoftware/smack/util/Base64$InputStream;
    .local v1, "bis":Lorg/jivesoftware/smack/util/Base64$InputStream;
    :goto_0
    const/16 v9, 0x1000

    :try_start_1
    invoke-virtual {v1, v2, v7, v9}, Lorg/jivesoftware/smack/util/Base64$InputStream;->read([BII)I

    move-result v8

    if-ltz v8, :cond_0

    .line 1143
    add-int/2addr v7, v8

    goto :goto_0

    .line 1146
    :cond_0
    new-instance v5, Ljava/lang/String;

    const/4 v9, 0x0

    const-string/jumbo v10, "UTF-8"

    invoke-direct {v5, v2, v9, v7, v10}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_4
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 1155
    .end local v4    # "encodedData":Ljava/lang/String;
    .local v5, "encodedData":Ljava/lang/String;
    :try_start_2
    invoke-virtual {v1}, Lorg/jivesoftware/smack/util/Base64$InputStream;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    move-object v0, v1

    .end local v1    # "bis":Lorg/jivesoftware/smack/util/Base64$InputStream;
    .restart local v0    # "bis":Lorg/jivesoftware/smack/util/Base64$InputStream;
    move-object v4, v5

    .line 1158
    .end local v2    # "buffer":[B
    .end local v5    # "encodedData":Ljava/lang/String;
    .end local v6    # "file":Ljava/io/File;
    .end local v7    # "length":I
    .end local v8    # "numBytes":I
    .restart local v4    # "encodedData":Ljava/lang/String;
    :goto_1
    return-object v4

    .line 1155
    .end local v0    # "bis":Lorg/jivesoftware/smack/util/Base64$InputStream;
    .end local v4    # "encodedData":Ljava/lang/String;
    .restart local v1    # "bis":Lorg/jivesoftware/smack/util/Base64$InputStream;
    .restart local v2    # "buffer":[B
    .restart local v5    # "encodedData":Ljava/lang/String;
    .restart local v6    # "file":Ljava/io/File;
    .restart local v7    # "length":I
    .restart local v8    # "numBytes":I
    :catch_0
    move-exception v9

    move-object v0, v1

    .end local v1    # "bis":Lorg/jivesoftware/smack/util/Base64$InputStream;
    .restart local v0    # "bis":Lorg/jivesoftware/smack/util/Base64$InputStream;
    move-object v4, v5

    .line 1156
    .end local v5    # "encodedData":Ljava/lang/String;
    .restart local v4    # "encodedData":Ljava/lang/String;
    goto :goto_1

    .line 1149
    .end local v2    # "buffer":[B
    .end local v6    # "file":Ljava/io/File;
    .end local v7    # "length":I
    .end local v8    # "numBytes":I
    :catch_1
    move-exception v3

    .line 1151
    .local v3, "e":Ljava/io/IOException;
    :goto_2
    :try_start_3
    sget-object v9, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v11, "Error encoding from file "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 1155
    :try_start_4
    invoke-virtual {v0}, Lorg/jivesoftware/smack/util/Base64$InputStream;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2

    goto :goto_1

    :catch_2
    move-exception v9

    goto :goto_1

    .end local v3    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v9

    :goto_3
    :try_start_5
    invoke-virtual {v0}, Lorg/jivesoftware/smack/util/Base64$InputStream;->close()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_3

    :goto_4
    throw v9

    :catch_3
    move-exception v10

    goto :goto_4

    .end local v0    # "bis":Lorg/jivesoftware/smack/util/Base64$InputStream;
    .restart local v1    # "bis":Lorg/jivesoftware/smack/util/Base64$InputStream;
    .restart local v2    # "buffer":[B
    .restart local v6    # "file":Ljava/io/File;
    .restart local v7    # "length":I
    .restart local v8    # "numBytes":I
    :catchall_1
    move-exception v9

    move-object v0, v1

    .end local v1    # "bis":Lorg/jivesoftware/smack/util/Base64$InputStream;
    .restart local v0    # "bis":Lorg/jivesoftware/smack/util/Base64$InputStream;
    goto :goto_3

    .line 1149
    .end local v0    # "bis":Lorg/jivesoftware/smack/util/Base64$InputStream;
    .restart local v1    # "bis":Lorg/jivesoftware/smack/util/Base64$InputStream;
    :catch_4
    move-exception v3

    move-object v0, v1

    .end local v1    # "bis":Lorg/jivesoftware/smack/util/Base64$InputStream;
    .restart local v0    # "bis":Lorg/jivesoftware/smack/util/Base64$InputStream;
    goto :goto_2
.end method

.method public static encodeObject(Ljava/io/Serializable;)Ljava/lang/String;
    .locals 1
    .param p0, "serializableObject"    # Ljava/io/Serializable;

    .prologue
    .line 438
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/jivesoftware/smack/util/Base64;->encodeObject(Ljava/io/Serializable;I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static encodeObject(Ljava/io/Serializable;I)Ljava/lang/String;
    .locals 15
    .param p0, "serializableObject"    # Ljava/io/Serializable;
    .param p1, "options"    # I

    .prologue
    .line 469
    const/4 v2, 0x0

    .line 470
    .local v2, "baos":Ljava/io/ByteArrayOutputStream;
    const/4 v0, 0x0

    .line 471
    .local v0, "b64os":Ljava/io/OutputStream;
    const/4 v9, 0x0

    .line 472
    .local v9, "oos":Ljava/io/ObjectOutputStream;
    const/4 v7, 0x0

    .line 475
    .local v7, "gzos":Ljava/util/zip/GZIPOutputStream;
    and-int/lit8 v6, p1, 0x2

    .line 476
    .local v6, "gzip":I
    and-int/lit8 v4, p1, 0x8

    .line 481
    .local v4, "dontBreakLines":I
    :try_start_0
    new-instance v3, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v3}, Ljava/io/ByteArrayOutputStream;-><init>()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 482
    .end local v2    # "baos":Ljava/io/ByteArrayOutputStream;
    .local v3, "baos":Ljava/io/ByteArrayOutputStream;
    :try_start_1
    new-instance v1, Lorg/jivesoftware/smack/util/Base64$OutputStream;

    or-int/lit8 v12, p1, 0x1

    invoke-direct {v1, v3, v12}, Lorg/jivesoftware/smack/util/Base64$OutputStream;-><init>(Ljava/io/OutputStream;I)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_e
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 485
    .end local v0    # "b64os":Ljava/io/OutputStream;
    .local v1, "b64os":Ljava/io/OutputStream;
    const/4 v12, 0x2

    if-ne v6, v12, :cond_0

    .line 487
    :try_start_2
    new-instance v8, Ljava/util/zip/GZIPOutputStream;

    invoke-direct {v8, v1}, Ljava/util/zip/GZIPOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_f
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 488
    .end local v7    # "gzos":Ljava/util/zip/GZIPOutputStream;
    .local v8, "gzos":Ljava/util/zip/GZIPOutputStream;
    :try_start_3
    new-instance v10, Ljava/io/ObjectOutputStream;

    invoke-direct {v10, v8}, Ljava/io/ObjectOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_10
    .catchall {:try_start_3 .. :try_end_3} :catchall_3

    .end local v9    # "oos":Ljava/io/ObjectOutputStream;
    .local v10, "oos":Ljava/io/ObjectOutputStream;
    move-object v7, v8

    .end local v8    # "gzos":Ljava/util/zip/GZIPOutputStream;
    .restart local v7    # "gzos":Ljava/util/zip/GZIPOutputStream;
    move-object v9, v10

    .line 493
    .end local v10    # "oos":Ljava/io/ObjectOutputStream;
    .restart local v9    # "oos":Ljava/io/ObjectOutputStream;
    :goto_0
    :try_start_4
    invoke-virtual {v9, p0}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_f
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 502
    :try_start_5
    invoke-virtual {v9}, Ljava/io/ObjectOutputStream;->close()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_3

    .line 503
    :goto_1
    :try_start_6
    invoke-virtual {v7}, Ljava/util/zip/GZIPOutputStream;->close()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_4

    .line 504
    :goto_2
    :try_start_7
    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_5

    .line 505
    :goto_3
    :try_start_8
    invoke-virtual {v3}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_6

    .line 511
    :goto_4
    :try_start_9
    new-instance v12, Ljava/lang/String;

    invoke-virtual {v3}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v13

    const-string/jumbo v14, "UTF-8"

    invoke-direct {v12, v13, v14}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_9
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_9 .. :try_end_9} :catch_2

    move-object v0, v1

    .end local v1    # "b64os":Ljava/io/OutputStream;
    .restart local v0    # "b64os":Ljava/io/OutputStream;
    move-object v2, v3

    .line 515
    .end local v3    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v2    # "baos":Ljava/io/ByteArrayOutputStream;
    :goto_5
    return-object v12

    .line 491
    .end local v0    # "b64os":Ljava/io/OutputStream;
    .end local v2    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v1    # "b64os":Ljava/io/OutputStream;
    .restart local v3    # "baos":Ljava/io/ByteArrayOutputStream;
    :cond_0
    :try_start_a
    new-instance v10, Ljava/io/ObjectOutputStream;

    invoke-direct {v10, v1}, Ljava/io/ObjectOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_a
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_f
    .catchall {:try_start_a .. :try_end_a} :catchall_2

    .end local v9    # "oos":Ljava/io/ObjectOutputStream;
    .restart local v10    # "oos":Ljava/io/ObjectOutputStream;
    move-object v9, v10

    .end local v10    # "oos":Ljava/io/ObjectOutputStream;
    .restart local v9    # "oos":Ljava/io/ObjectOutputStream;
    goto :goto_0

    .line 495
    .end local v1    # "b64os":Ljava/io/OutputStream;
    .end local v3    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v0    # "b64os":Ljava/io/OutputStream;
    .restart local v2    # "baos":Ljava/io/ByteArrayOutputStream;
    :catch_0
    move-exception v5

    .line 497
    .local v5, "e":Ljava/io/IOException;
    :goto_6
    :try_start_b
    invoke-virtual {v5}, Ljava/io/IOException;->printStackTrace()V
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_0

    .line 498
    const/4 v12, 0x0

    .line 502
    :try_start_c
    invoke-virtual {v9}, Ljava/io/ObjectOutputStream;->close()V
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_7

    .line 503
    :goto_7
    :try_start_d
    invoke-virtual {v7}, Ljava/util/zip/GZIPOutputStream;->close()V
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_d} :catch_8

    .line 504
    :goto_8
    :try_start_e
    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_e} :catch_9

    .line 505
    :goto_9
    :try_start_f
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_f
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_f} :catch_1

    goto :goto_5

    :catch_1
    move-exception v13

    goto :goto_5

    .line 502
    .end local v5    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v12

    :goto_a
    :try_start_10
    invoke-virtual {v9}, Ljava/io/ObjectOutputStream;->close()V
    :try_end_10
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_10} :catch_a

    .line 503
    :goto_b
    :try_start_11
    invoke-virtual {v7}, Ljava/util/zip/GZIPOutputStream;->close()V
    :try_end_11
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_11} :catch_b

    .line 504
    :goto_c
    :try_start_12
    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V
    :try_end_12
    .catch Ljava/lang/Exception; {:try_start_12 .. :try_end_12} :catch_c

    .line 505
    :goto_d
    :try_start_13
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_13
    .catch Ljava/lang/Exception; {:try_start_13 .. :try_end_13} :catch_d

    :goto_e
    throw v12

    .line 513
    .end local v0    # "b64os":Ljava/io/OutputStream;
    .end local v2    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v1    # "b64os":Ljava/io/OutputStream;
    .restart local v3    # "baos":Ljava/io/ByteArrayOutputStream;
    :catch_2
    move-exception v11

    .line 515
    .local v11, "uue":Ljava/io/UnsupportedEncodingException;
    new-instance v12, Ljava/lang/String;

    invoke-virtual {v3}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v13

    invoke-direct {v12, v13}, Ljava/lang/String;-><init>([B)V

    move-object v0, v1

    .end local v1    # "b64os":Ljava/io/OutputStream;
    .restart local v0    # "b64os":Ljava/io/OutputStream;
    move-object v2, v3

    .end local v3    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v2    # "baos":Ljava/io/ByteArrayOutputStream;
    goto :goto_5

    .line 502
    .end local v0    # "b64os":Ljava/io/OutputStream;
    .end local v2    # "baos":Ljava/io/ByteArrayOutputStream;
    .end local v11    # "uue":Ljava/io/UnsupportedEncodingException;
    .restart local v1    # "b64os":Ljava/io/OutputStream;
    .restart local v3    # "baos":Ljava/io/ByteArrayOutputStream;
    :catch_3
    move-exception v12

    goto :goto_1

    .line 503
    :catch_4
    move-exception v12

    goto :goto_2

    .line 504
    :catch_5
    move-exception v12

    goto :goto_3

    .line 505
    :catch_6
    move-exception v12

    goto :goto_4

    .line 502
    .end local v1    # "b64os":Ljava/io/OutputStream;
    .end local v3    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v0    # "b64os":Ljava/io/OutputStream;
    .restart local v2    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v5    # "e":Ljava/io/IOException;
    :catch_7
    move-exception v13

    goto :goto_7

    .line 503
    :catch_8
    move-exception v13

    goto :goto_8

    .line 504
    :catch_9
    move-exception v13

    goto :goto_9

    .line 502
    .end local v5    # "e":Ljava/io/IOException;
    :catch_a
    move-exception v13

    goto :goto_b

    .line 503
    :catch_b
    move-exception v13

    goto :goto_c

    .line 504
    :catch_c
    move-exception v13

    goto :goto_d

    .line 505
    :catch_d
    move-exception v13

    goto :goto_e

    .line 502
    .end local v2    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v3    # "baos":Ljava/io/ByteArrayOutputStream;
    :catchall_1
    move-exception v12

    move-object v2, v3

    .end local v3    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v2    # "baos":Ljava/io/ByteArrayOutputStream;
    goto :goto_a

    .end local v0    # "b64os":Ljava/io/OutputStream;
    .end local v2    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v1    # "b64os":Ljava/io/OutputStream;
    .restart local v3    # "baos":Ljava/io/ByteArrayOutputStream;
    :catchall_2
    move-exception v12

    move-object v0, v1

    .end local v1    # "b64os":Ljava/io/OutputStream;
    .restart local v0    # "b64os":Ljava/io/OutputStream;
    move-object v2, v3

    .end local v3    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v2    # "baos":Ljava/io/ByteArrayOutputStream;
    goto :goto_a

    .end local v0    # "b64os":Ljava/io/OutputStream;
    .end local v2    # "baos":Ljava/io/ByteArrayOutputStream;
    .end local v7    # "gzos":Ljava/util/zip/GZIPOutputStream;
    .restart local v1    # "b64os":Ljava/io/OutputStream;
    .restart local v3    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v8    # "gzos":Ljava/util/zip/GZIPOutputStream;
    :catchall_3
    move-exception v12

    move-object v7, v8

    .end local v8    # "gzos":Ljava/util/zip/GZIPOutputStream;
    .restart local v7    # "gzos":Ljava/util/zip/GZIPOutputStream;
    move-object v0, v1

    .end local v1    # "b64os":Ljava/io/OutputStream;
    .restart local v0    # "b64os":Ljava/io/OutputStream;
    move-object v2, v3

    .end local v3    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v2    # "baos":Ljava/io/ByteArrayOutputStream;
    goto :goto_a

    .line 495
    .end local v2    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v3    # "baos":Ljava/io/ByteArrayOutputStream;
    :catch_e
    move-exception v5

    move-object v2, v3

    .end local v3    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v2    # "baos":Ljava/io/ByteArrayOutputStream;
    goto :goto_6

    .end local v0    # "b64os":Ljava/io/OutputStream;
    .end local v2    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v1    # "b64os":Ljava/io/OutputStream;
    .restart local v3    # "baos":Ljava/io/ByteArrayOutputStream;
    :catch_f
    move-exception v5

    move-object v0, v1

    .end local v1    # "b64os":Ljava/io/OutputStream;
    .restart local v0    # "b64os":Ljava/io/OutputStream;
    move-object v2, v3

    .end local v3    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v2    # "baos":Ljava/io/ByteArrayOutputStream;
    goto :goto_6

    .end local v0    # "b64os":Ljava/io/OutputStream;
    .end local v2    # "baos":Ljava/io/ByteArrayOutputStream;
    .end local v7    # "gzos":Ljava/util/zip/GZIPOutputStream;
    .restart local v1    # "b64os":Ljava/io/OutputStream;
    .restart local v3    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v8    # "gzos":Ljava/util/zip/GZIPOutputStream;
    :catch_10
    move-exception v5

    move-object v7, v8

    .end local v8    # "gzos":Ljava/util/zip/GZIPOutputStream;
    .restart local v7    # "gzos":Ljava/util/zip/GZIPOutputStream;
    move-object v0, v1

    .end local v1    # "b64os":Ljava/io/OutputStream;
    .restart local v0    # "b64os":Ljava/io/OutputStream;
    move-object v2, v3

    .end local v3    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v2    # "baos":Ljava/io/ByteArrayOutputStream;
    goto :goto_6
.end method

.method public static encodeToFile([BLjava/lang/String;)Z
    .locals 6
    .param p0, "dataToEncode"    # [B
    .param p1, "filename"    # Ljava/lang/String;

    .prologue
    .line 1000
    const/4 v3, 0x0

    .line 1001
    .local v3, "success":Z
    const/4 v0, 0x0

    .line 1004
    .local v0, "bos":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    :try_start_0
    new-instance v1, Lorg/jivesoftware/smack/util/Base64$OutputStream;

    new-instance v4, Ljava/io/FileOutputStream;

    invoke-direct {v4, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    const/4 v5, 0x1

    invoke-direct {v1, v4, v5}, Lorg/jivesoftware/smack/util/Base64$OutputStream;-><init>(Ljava/io/OutputStream;I)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1006
    .end local v0    # "bos":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    .local v1, "bos":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    :try_start_1
    invoke-virtual {v1, p0}, Lorg/jivesoftware/smack/util/Base64$OutputStream;->write([B)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_4
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 1007
    const/4 v3, 0x1

    .line 1016
    :try_start_2
    invoke-virtual {v1}, Lorg/jivesoftware/smack/util/Base64$OutputStream;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    move-object v0, v1

    .line 1019
    .end local v1    # "bos":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    .restart local v0    # "bos":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    :goto_0
    return v3

    .line 1016
    .end local v0    # "bos":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    .restart local v1    # "bos":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    :catch_0
    move-exception v4

    move-object v0, v1

    .line 1017
    .end local v1    # "bos":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    .restart local v0    # "bos":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    goto :goto_0

    .line 1009
    :catch_1
    move-exception v2

    .line 1012
    .local v2, "e":Ljava/io/IOException;
    :goto_1
    const/4 v3, 0x0

    .line 1016
    :try_start_3
    invoke-virtual {v0}, Lorg/jivesoftware/smack/util/Base64$OutputStream;->close()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    goto :goto_0

    :catch_2
    move-exception v4

    goto :goto_0

    .end local v2    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v4

    :goto_2
    :try_start_4
    invoke-virtual {v0}, Lorg/jivesoftware/smack/util/Base64$OutputStream;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3

    :goto_3
    throw v4

    :catch_3
    move-exception v5

    goto :goto_3

    .end local v0    # "bos":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    .restart local v1    # "bos":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    :catchall_1
    move-exception v4

    move-object v0, v1

    .end local v1    # "bos":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    .restart local v0    # "bos":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    goto :goto_2

    .line 1009
    .end local v0    # "bos":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    .restart local v1    # "bos":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    :catch_4
    move-exception v2

    move-object v0, v1

    .end local v1    # "bos":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    .restart local v0    # "bos":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    goto :goto_1
.end method

.method private static final getAlphabet(I)[B
    .locals 2
    .param p0, "options"    # I

    .prologue
    .line 287
    and-int/lit8 v0, p0, 0x10

    const/16 v1, 0x10

    if-ne v0, v1, :cond_0

    sget-object v0, Lorg/jivesoftware/smack/util/Base64;->_URL_SAFE_ALPHABET:[B

    .line 289
    :goto_0
    return-object v0

    .line 288
    :cond_0
    and-int/lit8 v0, p0, 0x20

    const/16 v1, 0x20

    if-ne v0, v1, :cond_1

    sget-object v0, Lorg/jivesoftware/smack/util/Base64;->_ORDERED_ALPHABET:[B

    goto :goto_0

    .line 289
    :cond_1
    sget-object v0, Lorg/jivesoftware/smack/util/Base64;->_STANDARD_ALPHABET:[B

    goto :goto_0
.end method

.method private static final getDecodabet(I)[B
    .locals 2
    .param p0, "options"    # I

    .prologue
    .line 303
    and-int/lit8 v0, p0, 0x10

    const/16 v1, 0x10

    if-ne v0, v1, :cond_0

    sget-object v0, Lorg/jivesoftware/smack/util/Base64;->_URL_SAFE_DECODABET:[B

    .line 305
    :goto_0
    return-object v0

    .line 304
    :cond_0
    and-int/lit8 v0, p0, 0x20

    const/16 v1, 0x20

    if-ne v0, v1, :cond_1

    sget-object v0, Lorg/jivesoftware/smack/util/Base64;->_ORDERED_DECODABET:[B

    goto :goto_0

    .line 305
    :cond_1
    sget-object v0, Lorg/jivesoftware/smack/util/Base64;->_STANDARD_DECODABET:[B

    goto :goto_0
.end method

.method private static final usage(Ljava/lang/String;)V
    .locals 2
    .param p0, "msg"    # Ljava/lang/String;

    .prologue
    .line 321
    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {v0, p0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 322
    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string/jumbo v1, "Usage: java Base64 -e|-d inputfile outputfile"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 323
    return-void
.end method
