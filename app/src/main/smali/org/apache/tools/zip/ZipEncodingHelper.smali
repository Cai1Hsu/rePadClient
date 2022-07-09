.class abstract Lorg/apache/tools/zip/ZipEncodingHelper;
.super Ljava/lang/Object;
.source "ZipEncodingHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/zip/ZipEncodingHelper$SimpleEncodingHolder;
    }
.end annotation


# static fields
.field private static final HEX_DIGITS:[B

.field static final UTF8:Ljava/lang/String; = "UTF8"

.field static final UTF8_ZIP_ENCODING:Lorg/apache/tools/zip/ZipEncoding;

.field private static final UTF_DASH_8:Ljava/lang/String; = "utf-8"

.field private static final simpleEncodings:Ljava/util/Map;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .prologue
    const/16 v6, 0x80

    .line 68
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    sput-object v4, Lorg/apache/tools/zip/ZipEncodingHelper;->simpleEncodings:Ljava/util/Map;

    .line 70
    new-array v1, v6, [C

    fill-array-data v1, :array_0

    .line 94
    .local v1, "cp437_high_chars":[C
    new-instance v0, Lorg/apache/tools/zip/ZipEncodingHelper$SimpleEncodingHolder;

    invoke-direct {v0, v1}, Lorg/apache/tools/zip/ZipEncodingHelper$SimpleEncodingHolder;-><init>([C)V

    .line 96
    .local v0, "cp437":Lorg/apache/tools/zip/ZipEncodingHelper$SimpleEncodingHolder;
    sget-object v4, Lorg/apache/tools/zip/ZipEncodingHelper;->simpleEncodings:Ljava/util/Map;

    const-string/jumbo v5, "CP437"

    invoke-interface {v4, v5, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 97
    sget-object v4, Lorg/apache/tools/zip/ZipEncodingHelper;->simpleEncodings:Ljava/util/Map;

    const-string/jumbo v5, "Cp437"

    invoke-interface {v4, v5, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 98
    sget-object v4, Lorg/apache/tools/zip/ZipEncodingHelper;->simpleEncodings:Ljava/util/Map;

    const-string/jumbo v5, "cp437"

    invoke-interface {v4, v5, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 99
    sget-object v4, Lorg/apache/tools/zip/ZipEncodingHelper;->simpleEncodings:Ljava/util/Map;

    const-string/jumbo v5, "IBM437"

    invoke-interface {v4, v5, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 100
    sget-object v4, Lorg/apache/tools/zip/ZipEncodingHelper;->simpleEncodings:Ljava/util/Map;

    const-string/jumbo v5, "ibm437"

    invoke-interface {v4, v5, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 102
    new-array v3, v6, [C

    fill-array-data v3, :array_1

    .line 126
    .local v3, "cp850_high_chars":[C
    new-instance v2, Lorg/apache/tools/zip/ZipEncodingHelper$SimpleEncodingHolder;

    invoke-direct {v2, v3}, Lorg/apache/tools/zip/ZipEncodingHelper$SimpleEncodingHolder;-><init>([C)V

    .line 128
    .local v2, "cp850":Lorg/apache/tools/zip/ZipEncodingHelper$SimpleEncodingHolder;
    sget-object v4, Lorg/apache/tools/zip/ZipEncodingHelper;->simpleEncodings:Ljava/util/Map;

    const-string/jumbo v5, "CP850"

    invoke-interface {v4, v5, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 129
    sget-object v4, Lorg/apache/tools/zip/ZipEncodingHelper;->simpleEncodings:Ljava/util/Map;

    const-string/jumbo v5, "Cp850"

    invoke-interface {v4, v5, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 130
    sget-object v4, Lorg/apache/tools/zip/ZipEncodingHelper;->simpleEncodings:Ljava/util/Map;

    const-string/jumbo v5, "cp850"

    invoke-interface {v4, v5, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 131
    sget-object v4, Lorg/apache/tools/zip/ZipEncodingHelper;->simpleEncodings:Ljava/util/Map;

    const-string/jumbo v5, "IBM850"

    invoke-interface {v4, v5, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 132
    sget-object v4, Lorg/apache/tools/zip/ZipEncodingHelper;->simpleEncodings:Ljava/util/Map;

    const-string/jumbo v5, "ibm850"

    invoke-interface {v4, v5, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 163
    const/16 v4, 0x10

    new-array v4, v4, [B

    fill-array-data v4, :array_2

    sput-object v4, Lorg/apache/tools/zip/ZipEncodingHelper;->HEX_DIGITS:[B

    .line 201
    new-instance v4, Lorg/apache/tools/zip/FallbackZipEncoding;

    const-string/jumbo v5, "UTF8"

    invoke-direct {v4, v5}, Lorg/apache/tools/zip/FallbackZipEncoding;-><init>(Ljava/lang/String;)V

    sput-object v4, Lorg/apache/tools/zip/ZipEncodingHelper;->UTF8_ZIP_ENCODING:Lorg/apache/tools/zip/ZipEncoding;

    return-void

    .line 70
    nop

    :array_0
    .array-data 2
        0xc7s
        0xfcs
        0xe9s
        0xe2s
        0xe4s
        0xe0s
        0xe5s
        0xe7s
        0xeas
        0xebs
        0xe8s
        0xefs
        0xees
        0xecs
        0xc4s
        0xc5s
        0xc9s
        0xe6s
        0xc6s
        0xf4s
        0xf6s
        0xf2s
        0xfbs
        0xf9s
        0xffs
        0xd6s
        0xdcs
        0xa2s
        0xa3s
        0xa5s
        0x20a7s
        0x192s
        0xe1s
        0xeds
        0xf3s
        0xfas
        0xf1s
        0xd1s
        0xaas
        0xbas
        0xbfs
        0x2310s
        0xacs
        0xbds
        0xbcs
        0xa1s
        0xabs
        0xbbs
        0x2591s
        0x2592s
        0x2593s
        0x2502s
        0x2524s
        0x2561s
        0x2562s
        0x2556s
        0x2555s
        0x2563s
        0x2551s
        0x2557s
        0x255ds
        0x255cs
        0x255bs
        0x2510s
        0x2514s
        0x2534s
        0x252cs
        0x251cs
        0x2500s
        0x253cs
        0x255es
        0x255fs
        0x255as
        0x2554s
        0x2569s
        0x2566s
        0x2560s
        0x2550s
        0x256cs
        0x2567s
        0x2568s
        0x2564s
        0x2565s
        0x2559s
        0x2558s
        0x2552s
        0x2553s
        0x256bs
        0x256as
        0x2518s
        0x250cs
        0x2588s
        0x2584s
        0x258cs
        0x2590s
        0x2580s
        0x3b1s
        0xdfs
        0x393s
        0x3c0s
        0x3a3s
        0x3c3s
        0xb5s
        0x3c4s
        0x3a6s
        0x398s
        0x3a9s
        0x3b4s
        0x221es
        0x3c6s
        0x3b5s
        0x2229s
        0x2261s
        0xb1s
        0x2265s
        0x2264s
        0x2320s
        0x2321s
        0xf7s
        0x2248s
        0xb0s
        0x2219s
        0xb7s
        0x221as
        0x207fs
        0xb2s
        0x25a0s
        0xa0s
    .end array-data

    .line 102
    :array_1
    .array-data 2
        0xc7s
        0xfcs
        0xe9s
        0xe2s
        0xe4s
        0xe0s
        0xe5s
        0xe7s
        0xeas
        0xebs
        0xe8s
        0xefs
        0xees
        0xecs
        0xc4s
        0xc5s
        0xc9s
        0xe6s
        0xc6s
        0xf4s
        0xf6s
        0xf2s
        0xfbs
        0xf9s
        0xffs
        0xd6s
        0xdcs
        0xf8s
        0xa3s
        0xd8s
        0xd7s
        0x192s
        0xe1s
        0xeds
        0xf3s
        0xfas
        0xf1s
        0xd1s
        0xaas
        0xbas
        0xbfs
        0xaes
        0xacs
        0xbds
        0xbcs
        0xa1s
        0xabs
        0xbbs
        0x2591s
        0x2592s
        0x2593s
        0x2502s
        0x2524s
        0xc1s
        0xc2s
        0xc0s
        0xa9s
        0x2563s
        0x2551s
        0x2557s
        0x255ds
        0xa2s
        0xa5s
        0x2510s
        0x2514s
        0x2534s
        0x252cs
        0x251cs
        0x2500s
        0x253cs
        0xe3s
        0xc3s
        0x255as
        0x2554s
        0x2569s
        0x2566s
        0x2560s
        0x2550s
        0x256cs
        0xa4s
        0xf0s
        0xd0s
        0xcas
        0xcbs
        0xc8s
        0x131s
        0xcds
        0xces
        0xcfs
        0x2518s
        0x250cs
        0x2588s
        0x2584s
        0xa6s
        0xccs
        0x2580s
        0xd3s
        0xdfs
        0xd4s
        0xd2s
        0xf5s
        0xd5s
        0xb5s
        0xfes
        0xdes
        0xdas
        0xdbs
        0xd9s
        0xfds
        0xdds
        0xafs
        0xb4s
        0xads
        0xb1s
        0x2017s
        0xbes
        0xb6s
        0xa7s
        0xf7s
        0xb8s
        0xb0s
        0xa8s
        0xb7s
        0xb9s
        0xb3s
        0xb2s
        0x25a0s
        0xa0s
    .end array-data

    .line 163
    :array_2
    .array-data 1
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
    .end array-data
.end method

.method constructor <init>()V
    .locals 0

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    return-void
.end method

.method static appendSurrogate(Ljava/nio/ByteBuffer;C)V
    .locals 2
    .param p0, "bb"    # Ljava/nio/ByteBuffer;
    .param p1, "c"    # C

    .prologue
    .line 178
    const/16 v0, 0x25

    invoke-virtual {p0, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 179
    const/16 v0, 0x55

    invoke-virtual {p0, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 181
    sget-object v0, Lorg/apache/tools/zip/ZipEncodingHelper;->HEX_DIGITS:[B

    shr-int/lit8 v1, p1, 0xc

    and-int/lit8 v1, v1, 0xf

    aget-byte v0, v0, v1

    invoke-virtual {p0, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 182
    sget-object v0, Lorg/apache/tools/zip/ZipEncodingHelper;->HEX_DIGITS:[B

    shr-int/lit8 v1, p1, 0x8

    and-int/lit8 v1, v1, 0xf

    aget-byte v0, v0, v1

    invoke-virtual {p0, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 183
    sget-object v0, Lorg/apache/tools/zip/ZipEncodingHelper;->HEX_DIGITS:[B

    shr-int/lit8 v1, p1, 0x4

    and-int/lit8 v1, v1, 0xf

    aget-byte v0, v0, v1

    invoke-virtual {p0, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 184
    sget-object v0, Lorg/apache/tools/zip/ZipEncodingHelper;->HEX_DIGITS:[B

    and-int/lit8 v1, p1, 0xf

    aget-byte v0, v0, v1

    invoke-virtual {p0, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 185
    return-void
.end method

.method static getZipEncoding(Ljava/lang/String;)Lorg/apache/tools/zip/ZipEncoding;
    .locals 4
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 213
    invoke-static {p0}, Lorg/apache/tools/zip/ZipEncodingHelper;->isUTF8(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 214
    sget-object v3, Lorg/apache/tools/zip/ZipEncodingHelper;->UTF8_ZIP_ENCODING:Lorg/apache/tools/zip/ZipEncoding;

    .line 234
    :goto_0
    return-object v3

    .line 217
    :cond_0
    if-nez p0, :cond_1

    .line 218
    new-instance v3, Lorg/apache/tools/zip/FallbackZipEncoding;

    invoke-direct {v3}, Lorg/apache/tools/zip/FallbackZipEncoding;-><init>()V

    goto :goto_0

    .line 221
    :cond_1
    sget-object v3, Lorg/apache/tools/zip/ZipEncodingHelper;->simpleEncodings:Ljava/util/Map;

    invoke-interface {v3, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/tools/zip/ZipEncodingHelper$SimpleEncodingHolder;

    .line 224
    .local v2, "h":Lorg/apache/tools/zip/ZipEncodingHelper$SimpleEncodingHolder;
    if-eqz v2, :cond_2

    .line 225
    invoke-virtual {v2}, Lorg/apache/tools/zip/ZipEncodingHelper$SimpleEncodingHolder;->getEncoding()Lorg/apache/tools/zip/Simple8BitZipEncoding;

    move-result-object v3

    goto :goto_0

    .line 230
    :cond_2
    :try_start_0
    invoke-static {p0}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v0

    .line 231
    .local v0, "cs":Ljava/nio/charset/Charset;
    new-instance v3, Lorg/apache/tools/zip/NioZipEncoding;

    invoke-direct {v3, v0}, Lorg/apache/tools/zip/NioZipEncoding;-><init>(Ljava/nio/charset/Charset;)V
    :try_end_0
    .catch Ljava/nio/charset/UnsupportedCharsetException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 233
    .end local v0    # "cs":Ljava/nio/charset/Charset;
    :catch_0
    move-exception v1

    .line 234
    .local v1, "e":Ljava/nio/charset/UnsupportedCharsetException;
    new-instance v3, Lorg/apache/tools/zip/FallbackZipEncoding;

    invoke-direct {v3, p0}, Lorg/apache/tools/zip/FallbackZipEncoding;-><init>(Ljava/lang/String;)V

    goto :goto_0
.end method

.method static growBuffer(Ljava/nio/ByteBuffer;I)Ljava/nio/ByteBuffer;
    .locals 3
    .param p0, "b"    # Ljava/nio/ByteBuffer;
    .param p1, "newCapacity"    # I

    .prologue
    .line 148
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->position()I

    move-result v2

    invoke-virtual {p0, v2}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 149
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 151
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v2

    mul-int/lit8 v0, v2, 0x2

    .line 152
    .local v0, "c2":I
    if-ge v0, p1, :cond_0

    .end local p1    # "newCapacity":I
    :goto_0
    invoke-static {p1}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v1

    .line 154
    .local v1, "on":Ljava/nio/ByteBuffer;
    invoke-virtual {v1, p0}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 155
    return-object v1

    .end local v1    # "on":Ljava/nio/ByteBuffer;
    .restart local p1    # "newCapacity":I
    :cond_0
    move p1, v0

    .line 152
    goto :goto_0
.end method

.method static isUTF8(Ljava/lang/String;)Z
    .locals 1
    .param p0, "encoding"    # Ljava/lang/String;

    .prologue
    .line 243
    if-nez p0, :cond_0

    .line 245
    const-string/jumbo v0, "file.encoding"

    invoke-static {v0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 247
    :cond_0
    const-string/jumbo v0, "UTF8"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string/jumbo v0, "utf-8"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    :cond_1
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method
