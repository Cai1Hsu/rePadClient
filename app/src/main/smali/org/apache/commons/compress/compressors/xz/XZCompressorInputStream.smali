.class public Lorg/apache/commons/compress/compressors/xz/XZCompressorInputStream;
.super Lorg/apache/commons/compress/compressors/CompressorInputStream;
.source "XZCompressorInputStream.java"


# instance fields
.field private final in:Ljava/io/InputStream;


# direct methods
.method public constructor <init>(Ljava/io/InputStream;)V
    .locals 1
    .param p1, "inputStream"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 72
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/apache/commons/compress/compressors/xz/XZCompressorInputStream;-><init>(Ljava/io/InputStream;Z)V

    .line 73
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;Z)V
    .locals 1
    .param p1, "inputStream"    # Ljava/io/InputStream;
    .param p2, "decompressConcatenated"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 94
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/CompressorInputStream;-><init>()V

    .line 95
    if-eqz p2, :cond_0

    .line 96
    new-instance v0, Lorg/tukaani/xz/XZInputStream;

    invoke-direct {v0, p1}, Lorg/tukaani/xz/XZInputStream;-><init>(Ljava/io/InputStream;)V

    iput-object v0, p0, Lorg/apache/commons/compress/compressors/xz/XZCompressorInputStream;->in:Ljava/io/InputStream;

    .line 100
    :goto_0
    return-void

    .line 98
    :cond_0
    new-instance v0, Lorg/tukaani/xz/SingleXZInputStream;

    invoke-direct {v0, p1}, Lorg/tukaani/xz/SingleXZInputStream;-><init>(Ljava/io/InputStream;)V

    iput-object v0, p0, Lorg/apache/commons/compress/compressors/xz/XZCompressorInputStream;->in:Ljava/io/InputStream;

    goto :goto_0
.end method

.method public static matches([BI)Z
    .locals 4
    .param p0, "signature"    # [B
    .param p1, "length"    # I

    .prologue
    const/4 v1, 0x0

    .line 44
    sget-object v2, Lorg/tukaani/xz/XZ;->HEADER_MAGIC:[B

    array-length v2, v2

    if-ge p1, v2, :cond_1

    .line 54
    :cond_0
    :goto_0
    return v1

    .line 48
    :cond_1
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    sget-object v2, Lorg/tukaani/xz/XZ;->HEADER_MAGIC:[B

    array-length v2, v2

    if-ge v0, v2, :cond_2

    .line 49
    aget-byte v2, p0, v0

    sget-object v3, Lorg/tukaani/xz/XZ;->HEADER_MAGIC:[B

    aget-byte v3, v3, v0

    if-ne v2, v3, :cond_0

    .line 48
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 54
    :cond_2
    const/4 v1, 0x1

    goto :goto_0
.end method


# virtual methods
.method public available()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 127
    iget-object v0, p0, Lorg/apache/commons/compress/compressors/xz/XZCompressorInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->available()I

    move-result v0

    return v0
.end method

.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 133
    iget-object v0, p0, Lorg/apache/commons/compress/compressors/xz/XZCompressorInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 134
    return-void
.end method

.method public read()I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, -0x1

    .line 105
    iget-object v2, p0, Lorg/apache/commons/compress/compressors/xz/XZCompressorInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v2}, Ljava/io/InputStream;->read()I

    move-result v0

    .line 106
    .local v0, "ret":I
    if-ne v0, v1, :cond_0

    :goto_0
    invoke-virtual {p0, v1}, Lorg/apache/commons/compress/compressors/xz/XZCompressorInputStream;->count(I)V

    .line 107
    return v0

    .line 106
    :cond_0
    const/4 v1, 0x1

    goto :goto_0
.end method

.method public read([BII)I
    .locals 2
    .param p1, "buf"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 113
    iget-object v1, p0, Lorg/apache/commons/compress/compressors/xz/XZCompressorInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v1, p1, p2, p3}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    .line 114
    .local v0, "ret":I
    invoke-virtual {p0, v0}, Lorg/apache/commons/compress/compressors/xz/XZCompressorInputStream;->count(I)V

    .line 115
    return v0
.end method

.method public skip(J)J
    .locals 3
    .param p1, "n"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 121
    iget-object v0, p0, Lorg/apache/commons/compress/compressors/xz/XZCompressorInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v0, p1, p2}, Ljava/io/InputStream;->skip(J)J

    move-result-wide v0

    return-wide v0
.end method
