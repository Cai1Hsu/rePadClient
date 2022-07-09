.class public abstract Lcom/cloudclientsetting/until/BZip2Utils;
.super Ljava/lang/Object;
.source "BZip2Utils.java"


# static fields
.field public static final BUFFER:I = 0x400

.field public static final EXT:Ljava/lang/CharSequence;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 27
    const-string/jumbo v0, ".bz2"

    sput-object v0, Lcom/cloudclientsetting/until/BZip2Utils;->EXT:Ljava/lang/CharSequence;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static Base64DecodeToBitmap(Ljava/lang/String;)Landroid/graphics/Bitmap;
    .locals 7
    .param p0, "base64"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    .line 81
    invoke-static {p0, v6}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v1

    .line 82
    .local v1, "bb":[B
    invoke-static {v1}, Lcom/cloudclientsetting/until/BZip2Utils;->decompress([B)[B

    move-result-object v0

    .line 83
    .local v0, "aa":[B
    new-instance v4, Ljava/lang/String;

    invoke-direct {v4, v0}, Ljava/lang/String;-><init>([B)V

    .line 84
    .local v4, "decodeStr":Ljava/lang/String;
    invoke-static {v4}, Lcom/cloudclientsetting/until/BZip2Utils;->hexStringToBytes(Ljava/lang/String;)[B

    move-result-object v3

    .line 85
    .local v3, "cc":[B
    array-length v5, v3

    invoke-static {v3, v6, v5}, Landroid/graphics/BitmapFactory;->decodeByteArray([BII)Landroid/graphics/Bitmap;

    move-result-object v2

    .line 86
    .local v2, "bitmap":Landroid/graphics/Bitmap;
    return-object v2
.end method

.method public static Base64DecodeToString(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p0, "base64"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 59
    const/4 v3, 0x0

    invoke-static {p0, v3}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v1

    .line 60
    .local v1, "bb":[B
    invoke-static {v1}, Lcom/cloudclientsetting/until/BZip2Utils;->decompress([B)[B

    move-result-object v0

    .line 61
    .local v0, "aa":[B
    new-instance v2, Ljava/lang/String;

    const-string/jumbo v3, "GBK"

    invoke-direct {v2, v0, v3}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    .line 62
    .local v2, "decodeStr":Ljava/lang/String;
    return-object v2
.end method

.method public static BitmapEncodeToBase64(Landroid/graphics/Bitmap;)Ljava/lang/String;
    .locals 6
    .param p0, "bitmap"    # Landroid/graphics/Bitmap;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 66
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 67
    .local v1, "baos":Ljava/io/ByteArrayOutputStream;
    sget-object v3, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v4, 0x64

    invoke-virtual {p0, v3, v4, v1}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 68
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v0

    .line 74
    .local v0, "b":[B
    const/4 v3, 0x0

    invoke-static {v0, v3}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object v2

    .line 75
    .local v2, "encodeStr":Ljava/lang/String;
    const-string/jumbo v3, "main"

    invoke-static {v3, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 77
    const-string/jumbo v3, "\r\n"

    const-string/jumbo v4, ""

    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "\r"

    const-string/jumbo v5, ""

    invoke-virtual {v3, v4, v5}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "\n"

    const-string/jumbo v5, ""

    invoke-virtual {v3, v4, v5}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method public static StringEncodeToBase64(Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .param p0, "str"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 50
    if-nez p0, :cond_0

    const-string/jumbo v2, ""

    .line 55
    :goto_0
    return-object v2

    .line 51
    :cond_0
    const-string/jumbo v3, "GBK"

    invoke-virtual {p0, v3}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v1

    .line 52
    .local v1, "b":[B
    invoke-static {v1}, Lcom/cloudclientsetting/until/BZip2Utils;->compress([B)[B

    move-result-object v0

    .line 53
    .local v0, "a":[B
    const/4 v3, 0x2

    invoke-static {v0, v3}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object v2

    .line 54
    .local v2, "encodeStr":Ljava/lang/String;
    const-string/jumbo v3, "StringEncodeToBase64"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string/jumbo v5, "encodeStr ="

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private static charToByte(C)B
    .locals 1
    .param p0, "c"    # C

    .prologue
    .line 129
    const-string/jumbo v0, "0123456789ABCDEF"

    invoke-virtual {v0, p0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    int-to-byte v0, v0

    return v0
.end method

.method public static compress(Ljava/io/File;)V
    .locals 1
    .param p0, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 163
    const/4 v0, 0x1

    invoke-static {p0, v0}, Lcom/cloudclientsetting/until/BZip2Utils;->compress(Ljava/io/File;Z)V

    .line 164
    return-void
.end method

.method public static compress(Ljava/io/File;Z)V
    .locals 4
    .param p0, "file"    # Ljava/io/File;
    .param p1, "delete"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 175
    new-instance v0, Ljava/io/FileInputStream;

    invoke-direct {v0, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 176
    .local v0, "fis":Ljava/io/FileInputStream;
    new-instance v1, Ljava/io/FileOutputStream;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v3, Lcom/cloudclientsetting/until/BZip2Utils;->EXT:Ljava/lang/CharSequence;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    .line 178
    .local v1, "fos":Ljava/io/FileOutputStream;
    invoke-static {v0, v1}, Lcom/cloudclientsetting/until/BZip2Utils;->compress(Ljava/io/InputStream;Ljava/io/OutputStream;)V

    .line 180
    invoke-virtual {v0}, Ljava/io/FileInputStream;->close()V

    .line 181
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->flush()V

    .line 182
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V

    .line 184
    if-eqz p1, :cond_0

    .line 185
    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    .line 187
    :cond_0
    return-void
.end method

.method public static compress(Ljava/io/InputStream;Ljava/io/OutputStream;)V
    .locals 5
    .param p0, "is"    # Ljava/io/InputStream;
    .param p1, "os"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 199
    :try_start_0
    new-instance v2, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;

    invoke-direct {v2, p1}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 201
    .local v2, "gos":Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;
    const/16 v3, 0x400

    new-array v1, v3, [B

    .line 202
    .local v1, "data":[B
    :goto_0
    const/4 v3, 0x0

    const/16 v4, 0x400

    invoke-virtual {p0, v1, v3, v4}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    .local v0, "count":I
    const/4 v3, -0x1

    if-ne v0, v3, :cond_0

    .line 206
    invoke-virtual {v2}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->finish()V

    .line 208
    invoke-virtual {v2}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->flush()V

    .line 209
    invoke-virtual {v2}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->close()V

    .line 213
    .end local v0    # "count":I
    .end local v1    # "data":[B
    .end local v2    # "gos":Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;
    :goto_1
    return-void

    .line 203
    .restart local v0    # "count":I
    .restart local v1    # "data":[B
    .restart local v2    # "gos":Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;
    :cond_0
    const/4 v3, 0x0

    invoke-virtual {v2, v1, v3, v0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->write([BII)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 210
    .end local v0    # "count":I
    .end local v1    # "data":[B
    .end local v2    # "gos":Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;
    :catch_0
    move-exception v3

    goto :goto_1
.end method

.method public static compress(Ljava/lang/String;)V
    .locals 1
    .param p0, "path"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 222
    const/4 v0, 0x1

    invoke-static {p0, v0}, Lcom/cloudclientsetting/until/BZip2Utils;->compress(Ljava/lang/String;Z)V

    .line 223
    return-void
.end method

.method public static compress(Ljava/lang/String;Z)V
    .locals 1
    .param p0, "path"    # Ljava/lang/String;
    .param p1, "delete"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 234
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 235
    .local v0, "file":Ljava/io/File;
    invoke-static {v0, p1}, Lcom/cloudclientsetting/until/BZip2Utils;->compress(Ljava/io/File;Z)V

    .line 236
    return-void
.end method

.method public static compress([B)[B
    .locals 3
    .param p0, "data"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 140
    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 141
    .local v0, "bais":Ljava/io/ByteArrayInputStream;
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 144
    .local v1, "baos":Ljava/io/ByteArrayOutputStream;
    invoke-static {v0, v1}, Lcom/cloudclientsetting/until/BZip2Utils;->compress(Ljava/io/InputStream;Ljava/io/OutputStream;)V

    .line 146
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v2

    .line 148
    .local v2, "output":[B
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->flush()V

    .line 149
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->close()V

    .line 151
    invoke-virtual {v0}, Ljava/io/ByteArrayInputStream;->close()V

    .line 153
    return-object v2
.end method

.method public static decompress(Ljava/io/File;)V
    .locals 1
    .param p0, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 270
    const/4 v0, 0x1

    invoke-static {p0, v0}, Lcom/cloudclientsetting/until/BZip2Utils;->decompress(Ljava/io/File;Z)V

    .line 271
    return-void
.end method

.method public static decompress(Ljava/io/File;Z)V
    .locals 5
    .param p0, "file"    # Ljava/io/File;
    .param p1, "delete"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 282
    new-instance v0, Ljava/io/FileInputStream;

    invoke-direct {v0, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 283
    .local v0, "fis":Ljava/io/FileInputStream;
    new-instance v1, Ljava/io/FileOutputStream;

    invoke-virtual {p0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v2

    sget-object v3, Lcom/cloudclientsetting/until/BZip2Utils;->EXT:Ljava/lang/CharSequence;

    const-string/jumbo v4, ""

    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    .line 284
    .local v1, "fos":Ljava/io/FileOutputStream;
    invoke-static {v0, v1}, Lcom/cloudclientsetting/until/BZip2Utils;->decompress(Ljava/io/InputStream;Ljava/io/OutputStream;)V

    .line 285
    invoke-virtual {v0}, Ljava/io/FileInputStream;->close()V

    .line 286
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->flush()V

    .line 287
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V

    .line 289
    if-eqz p1, :cond_0

    .line 290
    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    .line 292
    :cond_0
    return-void
.end method

.method public static decompress(Ljava/io/InputStream;Ljava/io/OutputStream;)V
    .locals 6
    .param p0, "is"    # Ljava/io/InputStream;
    .param p1, "os"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/16 v5, 0x400

    const/4 v4, 0x0

    .line 303
    new-instance v2, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;

    invoke-direct {v2, p0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;-><init>(Ljava/io/InputStream;)V

    .line 306
    .local v2, "gis":Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;
    new-array v1, v5, [B

    .line 307
    .local v1, "data":[B
    :goto_0
    invoke-virtual {v2, v1, v4, v5}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->read([BII)I

    move-result v0

    .local v0, "count":I
    const/4 v3, -0x1

    if-ne v0, v3, :cond_0

    .line 311
    invoke-virtual {v2}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->close()V

    .line 312
    return-void

    .line 308
    :cond_0
    invoke-virtual {p1, v1, v4, v0}, Ljava/io/OutputStream;->write([BII)V

    goto :goto_0
.end method

.method public static decompress(Ljava/lang/String;)V
    .locals 1
    .param p0, "path"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 321
    const/4 v0, 0x1

    invoke-static {p0, v0}, Lcom/cloudclientsetting/until/BZip2Utils;->decompress(Ljava/lang/String;Z)V

    .line 322
    return-void
.end method

.method public static decompress(Ljava/lang/String;Z)V
    .locals 1
    .param p0, "path"    # Ljava/lang/String;
    .param p1, "delete"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 333
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 334
    .local v0, "file":Ljava/io/File;
    invoke-static {v0, p1}, Lcom/cloudclientsetting/until/BZip2Utils;->decompress(Ljava/io/File;Z)V

    .line 335
    return-void
.end method

.method public static decompress([B)[B
    .locals 2
    .param p0, "data"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 246
    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 247
    .local v0, "bais":Ljava/io/ByteArrayInputStream;
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 251
    .local v1, "baos":Ljava/io/ByteArrayOutputStream;
    invoke-static {v0, v1}, Lcom/cloudclientsetting/until/BZip2Utils;->decompress(Ljava/io/InputStream;Ljava/io/OutputStream;)V

    .line 253
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object p0

    .line 255
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->flush()V

    .line 256
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->close()V

    .line 258
    invoke-virtual {v0}, Ljava/io/ByteArrayInputStream;->close()V

    .line 260
    return-object p0
.end method

.method public static hexStringToBytes(Ljava/lang/String;)[B
    .locals 7
    .param p0, "hexString"    # Ljava/lang/String;

    .prologue
    .line 108
    if-eqz p0, :cond_0

    const-string/jumbo v5, ""

    invoke-virtual {p0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 109
    :cond_0
    const/4 v0, 0x0

    .line 119
    :cond_1
    return-object v0

    .line 111
    :cond_2
    invoke-virtual {p0}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object p0

    .line 112
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    div-int/lit8 v3, v5, 0x2

    .line 113
    .local v3, "length":I
    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v1

    .line 114
    .local v1, "hexChars":[C
    new-array v0, v3, [B

    .line 115
    .local v0, "d":[B
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v3, :cond_1

    .line 116
    mul-int/lit8 v4, v2, 0x2

    .line 117
    .local v4, "pos":I
    aget-char v5, v1, v4

    invoke-static {v5}, Lcom/cloudclientsetting/until/BZip2Utils;->charToByte(C)B

    move-result v5

    shl-int/lit8 v5, v5, 0x4

    add-int/lit8 v6, v4, 0x1

    aget-char v6, v1, v6

    invoke-static {v6}, Lcom/cloudclientsetting/until/BZip2Utils;->charToByte(C)B

    move-result v6

    or-int/2addr v5, v6

    int-to-byte v5, v5

    aput-byte v5, v0, v2

    .line 115
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method public static main([Ljava/lang/String;)V
    .locals 9
    .param p0, "args"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v8, 0x0

    .line 30
    const-string/jumbo v6, ""

    .line 31
    .local v6, "str":Ljava/lang/String;
    const-string/jumbo v6, "0"

    .line 32
    const-string/jumbo v6, "\u4e2d\u56fd,A\u4e86\u3002"

    .line 33
    const-string/jumbo v6, "\u4e2d\u56fd"

    .line 34
    const-string/jumbo v7, "GBK"

    invoke-virtual {v6, v7}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v2

    .line 35
    .local v2, "b":[B
    invoke-static {v2}, Lcom/cloudclientsetting/until/BZip2Utils;->compress([B)[B

    move-result-object v0

    .line 36
    .local v0, "a":[B
    invoke-static {v0, v8}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object v5

    .line 37
    .local v5, "encodeStr":Ljava/lang/String;
    const-string/jumbo v7, "main"

    invoke-static {v7, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 43
    invoke-static {v5, v8}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v3

    .line 44
    .local v3, "bb":[B
    invoke-static {v3}, Lcom/cloudclientsetting/until/BZip2Utils;->decompress([B)[B

    move-result-object v1

    .line 45
    .local v1, "aa":[B
    new-instance v4, Ljava/lang/String;

    const-string/jumbo v7, "GBK"

    invoke-direct {v4, v1, v7}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    .line 46
    .local v4, "decodeStr":Ljava/lang/String;
    const-string/jumbo v7, "main"

    invoke-static {v7, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 47
    return-void
.end method

.method public static printHexString([B)Ljava/lang/String;
    .locals 5
    .param p0, "b"    # [B

    .prologue
    .line 93
    const-string/jumbo v2, ""

    .line 94
    .local v2, "result":Ljava/lang/String;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v3, p0

    if-lt v1, v3, :cond_0

    .line 101
    return-object v2

    .line 95
    :cond_0
    aget-byte v3, p0, v1

    and-int/lit16 v3, v3, 0xff

    invoke-static {v3}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v0

    .line 96
    .local v0, "hex":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    const/4 v4, 0x1

    if-ne v3, v4, :cond_1

    .line 97
    new-instance v3, Ljava/lang/StringBuilder;

    const/16 v4, 0x30

    invoke-static {v4}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 99
    :cond_1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 94
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method
