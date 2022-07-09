.class public abstract Lcom/edutech/appmanage/utils/BZip2Utils;
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

    sput-object v0, Lcom/edutech/appmanage/utils/BZip2Utils;->EXT:Ljava/lang/CharSequence;

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

    .line 92
    invoke-static {p0, v6}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v1

    .line 94
    .local v1, "bb":[B
    invoke-static {v1}, Lcom/edutech/appmanage/utils/BZip2Utils;->decompress([B)[B

    move-result-object v0

    .line 95
    .local v0, "aa":[B
    new-instance v4, Ljava/lang/String;

    invoke-direct {v4, v0}, Ljava/lang/String;-><init>([B)V

    .line 96
    .local v4, "decodeStr":Ljava/lang/String;
    invoke-static {v4}, Lcom/edutech/appmanage/utils/BZip2Utils;->hexStringToBytes(Ljava/lang/String;)[B

    move-result-object v3

    .line 97
    .local v3, "cc":[B
    array-length v5, v3

    invoke-static {v3, v6, v5}, Landroid/graphics/BitmapFactory;->decodeByteArray([BII)Landroid/graphics/Bitmap;

    move-result-object v2

    .line 98
    .local v2, "bitmap":Landroid/graphics/Bitmap;
    return-object v2
.end method

.method public static Base64DecodeToString(Ljava/lang/String;)Ljava/lang/String;
    .locals 8
    .param p0, "base64"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 61
    const-string/jumbo v5, "INFO"

    new-instance v6, Ljava/lang/StringBuilder;

    const-string/jumbo v7, "base64:"

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 63
    const/4 v5, 0x0

    .line 62
    invoke-static {p0, v5}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v1

    .line 64
    .local v1, "bb":[B
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    .line 65
    .local v4, "sb":Ljava/lang/StringBuffer;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    array-length v5, v1

    if-lt v3, v5, :cond_0

    .line 68
    const-string/jumbo v5, "INFO"

    new-instance v6, Ljava/lang/StringBuilder;

    const-string/jumbo v7, "bb:"

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 69
    invoke-static {v1}, Lcom/edutech/appmanage/utils/BZip2Utils;->decompress([B)[B

    move-result-object v0

    .line 70
    .local v0, "aa":[B
    new-instance v2, Ljava/lang/String;

    const-string/jumbo v5, "GBK"

    invoke-direct {v2, v0, v5}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    .line 71
    .local v2, "decodeStr":Ljava/lang/String;
    return-object v2

    .line 66
    .end local v0    # "aa":[B
    .end local v2    # "decodeStr":Ljava/lang/String;
    :cond_0
    aget-byte v5, v1, v3

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    .line 65
    add-int/lit8 v3, v3, 0x1

    goto :goto_0
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
    .line 75
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 76
    .local v1, "baos":Ljava/io/ByteArrayOutputStream;
    sget-object v3, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v4, 0x64

    invoke-virtual {p0, v3, v4, v1}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 77
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v0

    .line 84
    .local v0, "b":[B
    const/4 v3, 0x0

    .line 83
    invoke-static {v0, v3}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object v2

    .line 85
    .local v2, "encodeStr":Ljava/lang/String;
    const-string/jumbo v3, "main"

    invoke-static {v3, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 87
    const-string/jumbo v3, "\r\n"

    const-string/jumbo v4, ""

    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "\r"

    const-string/jumbo v5, ""

    invoke-virtual {v3, v4, v5}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 88
    const-string/jumbo v4, "\n"

    const-string/jumbo v5, ""

    invoke-virtual {v3, v4, v5}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 87
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
    .line 52
    const-string/jumbo v3, "GBK"

    invoke-virtual {p0, v3}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v1

    .line 53
    .local v1, "b":[B
    invoke-static {v1}, Lcom/edutech/appmanage/utils/BZip2Utils;->compress([B)[B

    move-result-object v0

    .line 55
    .local v0, "a":[B
    const/4 v3, 0x0

    .line 54
    invoke-static {v0, v3}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object v2

    .line 56
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

    .line 57
    return-object v2
.end method

.method private static charToByte(C)B
    .locals 1
    .param p0, "c"    # C

    .prologue
    .line 141
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
    .line 175
    const/4 v0, 0x1

    invoke-static {p0, v0}, Lcom/edutech/appmanage/utils/BZip2Utils;->compress(Ljava/io/File;Z)V

    .line 176
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
    .line 187
    new-instance v0, Ljava/io/FileInputStream;

    invoke-direct {v0, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 188
    .local v0, "fis":Ljava/io/FileInputStream;
    new-instance v1, Ljava/io/FileOutputStream;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v3, Lcom/edutech/appmanage/utils/BZip2Utils;->EXT:Ljava/lang/CharSequence;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    .line 190
    .local v1, "fos":Ljava/io/FileOutputStream;
    invoke-static {v0, v1}, Lcom/edutech/appmanage/utils/BZip2Utils;->compress(Ljava/io/InputStream;Ljava/io/OutputStream;)V

    .line 192
    invoke-virtual {v0}, Ljava/io/FileInputStream;->close()V

    .line 193
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->flush()V

    .line 194
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V

    .line 196
    if-eqz p1, :cond_0

    .line 197
    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    .line 199
    :cond_0
    return-void
.end method

.method public static compress(Ljava/io/InputStream;Ljava/io/OutputStream;)V
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

    .line 211
    new-instance v2, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;

    invoke-direct {v2, p1}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 214
    .local v2, "gos":Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;
    new-array v1, v5, [B

    .line 215
    .local v1, "data":[B
    :goto_0
    invoke-virtual {p0, v1, v4, v5}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    .local v0, "count":I
    const/4 v3, -0x1

    if-ne v0, v3, :cond_0

    .line 219
    invoke-virtual {v2}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->finish()V

    .line 221
    invoke-virtual {v2}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->flush()V

    .line 222
    invoke-virtual {v2}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->close()V

    .line 223
    return-void

    .line 216
    :cond_0
    invoke-virtual {v2, v1, v4, v0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;->write([BII)V

    goto :goto_0
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
    .line 232
    const/4 v0, 0x1

    invoke-static {p0, v0}, Lcom/edutech/appmanage/utils/BZip2Utils;->compress(Ljava/lang/String;Z)V

    .line 233
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
    .line 244
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 245
    .local v0, "file":Ljava/io/File;
    invoke-static {v0, p1}, Lcom/edutech/appmanage/utils/BZip2Utils;->compress(Ljava/io/File;Z)V

    .line 246
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
    .line 152
    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 153
    .local v0, "bais":Ljava/io/ByteArrayInputStream;
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 156
    .local v1, "baos":Ljava/io/ByteArrayOutputStream;
    invoke-static {v0, v1}, Lcom/edutech/appmanage/utils/BZip2Utils;->compress(Ljava/io/InputStream;Ljava/io/OutputStream;)V

    .line 158
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v2

    .line 160
    .local v2, "output":[B
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->flush()V

    .line 161
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->close()V

    .line 163
    invoke-virtual {v0}, Ljava/io/ByteArrayInputStream;->close()V

    .line 165
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
    .line 280
    const/4 v0, 0x1

    invoke-static {p0, v0}, Lcom/edutech/appmanage/utils/BZip2Utils;->decompress(Ljava/io/File;Z)V

    .line 281
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
    .line 292
    new-instance v0, Ljava/io/FileInputStream;

    invoke-direct {v0, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 293
    .local v0, "fis":Ljava/io/FileInputStream;
    new-instance v1, Ljava/io/FileOutputStream;

    invoke-virtual {p0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v2

    sget-object v3, Lcom/edutech/appmanage/utils/BZip2Utils;->EXT:Ljava/lang/CharSequence;

    .line 294
    const-string/jumbo v4, ""

    .line 293
    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    .line 295
    .local v1, "fos":Ljava/io/FileOutputStream;
    invoke-static {v0, v1}, Lcom/edutech/appmanage/utils/BZip2Utils;->decompress(Ljava/io/InputStream;Ljava/io/OutputStream;)V

    .line 296
    invoke-virtual {v0}, Ljava/io/FileInputStream;->close()V

    .line 297
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->flush()V

    .line 298
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V

    .line 300
    if-eqz p1, :cond_0

    .line 301
    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    .line 303
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

    .line 315
    new-instance v2, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;

    invoke-direct {v2, p0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;-><init>(Ljava/io/InputStream;)V

    .line 318
    .local v2, "gis":Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;
    new-array v1, v5, [B

    .line 319
    .local v1, "data":[B
    :goto_0
    invoke-virtual {v2, v1, v4, v5}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->read([BII)I

    move-result v0

    .local v0, "count":I
    const/4 v3, -0x1

    if-ne v0, v3, :cond_0

    .line 323
    invoke-virtual {v2}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->close()V

    .line 324
    return-void

    .line 320
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
    .line 333
    const/4 v0, 0x1

    invoke-static {p0, v0}, Lcom/edutech/appmanage/utils/BZip2Utils;->decompress(Ljava/lang/String;Z)V

    .line 334
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
    .line 345
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 346
    .local v0, "file":Ljava/io/File;
    invoke-static {v0, p1}, Lcom/edutech/appmanage/utils/BZip2Utils;->decompress(Ljava/io/File;Z)V

    .line 347
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
    .line 256
    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 257
    .local v0, "bais":Ljava/io/ByteArrayInputStream;
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 261
    .local v1, "baos":Ljava/io/ByteArrayOutputStream;
    invoke-static {v0, v1}, Lcom/edutech/appmanage/utils/BZip2Utils;->decompress(Ljava/io/InputStream;Ljava/io/OutputStream;)V

    .line 263
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object p0

    .line 265
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->flush()V

    .line 266
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->close()V

    .line 268
    invoke-virtual {v0}, Ljava/io/ByteArrayInputStream;->close()V

    .line 270
    return-object p0
.end method

.method public static hexStringToBytes(Ljava/lang/String;)[B
    .locals 7
    .param p0, "hexString"    # Ljava/lang/String;

    .prologue
    .line 120
    if-eqz p0, :cond_0

    const-string/jumbo v5, ""

    invoke-virtual {p0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 121
    :cond_0
    const/4 v0, 0x0

    .line 131
    :cond_1
    return-object v0

    .line 123
    :cond_2
    invoke-virtual {p0}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object p0

    .line 124
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    div-int/lit8 v3, v5, 0x2

    .line 125
    .local v3, "length":I
    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v1

    .line 126
    .local v1, "hexChars":[C
    new-array v0, v3, [B

    .line 127
    .local v0, "d":[B
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v3, :cond_1

    .line 128
    mul-int/lit8 v4, v2, 0x2

    .line 129
    .local v4, "pos":I
    aget-char v5, v1, v4

    invoke-static {v5}, Lcom/edutech/appmanage/utils/BZip2Utils;->charToByte(C)B

    move-result v5

    shl-int/lit8 v5, v5, 0x4

    add-int/lit8 v6, v4, 0x1

    aget-char v6, v1, v6

    invoke-static {v6}, Lcom/edutech/appmanage/utils/BZip2Utils;->charToByte(C)B

    move-result v6

    or-int/2addr v5, v6

    int-to-byte v5, v5

    aput-byte v5, v0, v2

    .line 127
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
    invoke-static {v2}, Lcom/edutech/appmanage/utils/BZip2Utils;->compress([B)[B

    move-result-object v0

    .line 36
    .local v0, "a":[B
    invoke-static {v0, v8}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object v5

    .line 38
    .local v5, "encodeStr":Ljava/lang/String;
    const-string/jumbo v7, "main"

    invoke-static {v7, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 44
    invoke-static {v5, v8}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v3

    .line 46
    .local v3, "bb":[B
    invoke-static {v3}, Lcom/edutech/appmanage/utils/BZip2Utils;->decompress([B)[B

    move-result-object v1

    .line 47
    .local v1, "aa":[B
    new-instance v4, Ljava/lang/String;

    const-string/jumbo v7, "GBK"

    invoke-direct {v4, v1, v7}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    .line 48
    .local v4, "decodeStr":Ljava/lang/String;
    const-string/jumbo v7, "main"

    invoke-static {v7, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 49
    return-void
.end method

.method public static printHexString([B)Ljava/lang/String;
    .locals 5
    .param p0, "b"    # [B

    .prologue
    .line 105
    const-string/jumbo v2, ""

    .line 106
    .local v2, "result":Ljava/lang/String;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v3, p0

    if-lt v1, v3, :cond_0

    .line 113
    return-object v2

    .line 107
    :cond_0
    aget-byte v3, p0, v1

    and-int/lit16 v3, v3, 0xff

    invoke-static {v3}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v0

    .line 108
    .local v0, "hex":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    const/4 v4, 0x1

    if-ne v3, v4, :cond_1

    .line 109
    new-instance v3, Ljava/lang/StringBuilder;

    const/16 v4, 0x30

    invoke-static {v4}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 111
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

    .line 106
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method
