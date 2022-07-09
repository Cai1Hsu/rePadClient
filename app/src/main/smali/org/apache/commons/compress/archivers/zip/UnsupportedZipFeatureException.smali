.class public Lorg/apache/commons/compress/archivers/zip/UnsupportedZipFeatureException;
.super Ljava/util/zip/ZipException;
.source "UnsupportedZipFeatureException.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/commons/compress/archivers/zip/UnsupportedZipFeatureException$Feature;
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x3d7c6036c47a9c0dL


# instance fields
.field private final entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

.field private final reason:Lorg/apache/commons/compress/archivers/zip/UnsupportedZipFeatureException$Feature;


# direct methods
.method public constructor <init>(Lorg/apache/commons/compress/archivers/zip/UnsupportedZipFeatureException$Feature;Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;)V
    .locals 2
    .param p1, "reason"    # Lorg/apache/commons/compress/archivers/zip/UnsupportedZipFeatureException$Feature;
    .param p2, "entry"    # Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    .prologue
    .line 41
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "unsupported feature "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, " used in entry "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p2}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/util/zip/ZipException;-><init>(Ljava/lang/String;)V

    .line 43
    iput-object p1, p0, Lorg/apache/commons/compress/archivers/zip/UnsupportedZipFeatureException;->reason:Lorg/apache/commons/compress/archivers/zip/UnsupportedZipFeatureException$Feature;

    .line 44
    iput-object p2, p0, Lorg/apache/commons/compress/archivers/zip/UnsupportedZipFeatureException;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    .line 45
    return-void
.end method


# virtual methods
.method public getEntry()Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    .locals 1

    .prologue
    .line 58
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/UnsupportedZipFeatureException;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    return-object v0
.end method

.method public getFeature()Lorg/apache/commons/compress/archivers/zip/UnsupportedZipFeatureException$Feature;
    .locals 1

    .prologue
    .line 51
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/UnsupportedZipFeatureException;->reason:Lorg/apache/commons/compress/archivers/zip/UnsupportedZipFeatureException$Feature;

    return-object v0
.end method
