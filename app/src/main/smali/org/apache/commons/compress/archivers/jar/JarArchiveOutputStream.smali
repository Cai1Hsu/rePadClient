.class public Lorg/apache/commons/compress/archivers/jar/JarArchiveOutputStream;
.super Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;
.source "JarArchiveOutputStream.java"


# instance fields
.field private jarMarkerAdded:Z


# direct methods
.method public constructor <init>(Ljava/io/OutputStream;)V
    .locals 1
    .param p1, "out"    # Ljava/io/OutputStream;

    .prologue
    .line 41
    invoke-direct {p0, p1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 38
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/commons/compress/archivers/jar/JarArchiveOutputStream;->jarMarkerAdded:Z

    .line 42
    return-void
.end method


# virtual methods
.method public putArchiveEntry(Lorg/apache/commons/compress/archivers/ArchiveEntry;)V
    .locals 2
    .param p1, "ze"    # Lorg/apache/commons/compress/archivers/ArchiveEntry;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 47
    iget-boolean v0, p0, Lorg/apache/commons/compress/archivers/jar/JarArchiveOutputStream;->jarMarkerAdded:Z

    if-nez v0, :cond_0

    move-object v0, p1

    .line 48
    check-cast v0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    invoke-static {}, Lorg/apache/commons/compress/archivers/zip/JarMarker;->getInstance()Lorg/apache/commons/compress/archivers/zip/JarMarker;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->addAsFirstExtraField(Lorg/apache/commons/compress/archivers/zip/ZipExtraField;)V

    .line 49
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/commons/compress/archivers/jar/JarArchiveOutputStream;->jarMarkerAdded:Z

    .line 51
    :cond_0
    invoke-super {p0, p1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->putArchiveEntry(Lorg/apache/commons/compress/archivers/ArchiveEntry;)V

    .line 52
    return-void
.end method
