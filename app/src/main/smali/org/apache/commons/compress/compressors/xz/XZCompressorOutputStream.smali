.class public Lorg/apache/commons/compress/compressors/xz/XZCompressorOutputStream;
.super Lorg/apache/commons/compress/compressors/CompressorOutputStream;
.source "XZCompressorOutputStream.java"


# instance fields
.field private final out:Lorg/tukaani/xz/XZOutputStream;


# direct methods
.method public constructor <init>(Ljava/io/OutputStream;)V
    .locals 2
    .param p1, "outputStream"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 40
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/CompressorOutputStream;-><init>()V

    .line 41
    new-instance v0, Lorg/tukaani/xz/XZOutputStream;

    new-instance v1, Lorg/tukaani/xz/LZMA2Options;

    invoke-direct {v1}, Lorg/tukaani/xz/LZMA2Options;-><init>()V

    invoke-direct {v0, p1, v1}, Lorg/tukaani/xz/XZOutputStream;-><init>(Ljava/io/OutputStream;Lorg/tukaani/xz/FilterOptions;)V

    iput-object v0, p0, Lorg/apache/commons/compress/compressors/xz/XZCompressorOutputStream;->out:Lorg/tukaani/xz/XZOutputStream;

    .line 42
    return-void
.end method

.method public constructor <init>(Ljava/io/OutputStream;I)V
    .locals 2
    .param p1, "outputStream"    # Ljava/io/OutputStream;
    .param p2, "preset"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 58
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/CompressorOutputStream;-><init>()V

    .line 59
    new-instance v0, Lorg/tukaani/xz/XZOutputStream;

    new-instance v1, Lorg/tukaani/xz/LZMA2Options;

    invoke-direct {v1, p2}, Lorg/tukaani/xz/LZMA2Options;-><init>(I)V

    invoke-direct {v0, p1, v1}, Lorg/tukaani/xz/XZOutputStream;-><init>(Ljava/io/OutputStream;Lorg/tukaani/xz/FilterOptions;)V

    iput-object v0, p0, Lorg/apache/commons/compress/compressors/xz/XZCompressorOutputStream;->out:Lorg/tukaani/xz/XZOutputStream;

    .line 60
    return-void
.end method


# virtual methods
.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 96
    iget-object v0, p0, Lorg/apache/commons/compress/compressors/xz/XZCompressorOutputStream;->out:Lorg/tukaani/xz/XZOutputStream;

    invoke-virtual {v0}, Lorg/tukaani/xz/XZOutputStream;->close()V

    .line 97
    return-void
.end method

.method public finish()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 90
    iget-object v0, p0, Lorg/apache/commons/compress/compressors/xz/XZCompressorOutputStream;->out:Lorg/tukaani/xz/XZOutputStream;

    invoke-virtual {v0}, Lorg/tukaani/xz/XZOutputStream;->finish()V

    .line 91
    return-void
.end method

.method public flush()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 82
    iget-object v0, p0, Lorg/apache/commons/compress/compressors/xz/XZCompressorOutputStream;->out:Lorg/tukaani/xz/XZOutputStream;

    invoke-virtual {v0}, Lorg/tukaani/xz/XZOutputStream;->flush()V

    .line 83
    return-void
.end method

.method public write(I)V
    .locals 1
    .param p1, "b"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 65
    iget-object v0, p0, Lorg/apache/commons/compress/compressors/xz/XZCompressorOutputStream;->out:Lorg/tukaani/xz/XZOutputStream;

    invoke-virtual {v0, p1}, Lorg/tukaani/xz/XZOutputStream;->write(I)V

    .line 66
    return-void
.end method

.method public write([BII)V
    .locals 1
    .param p1, "buf"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 71
    iget-object v0, p0, Lorg/apache/commons/compress/compressors/xz/XZCompressorOutputStream;->out:Lorg/tukaani/xz/XZOutputStream;

    invoke-virtual {v0, p1, p2, p3}, Lorg/tukaani/xz/XZOutputStream;->write([BII)V

    .line 72
    return-void
.end method
