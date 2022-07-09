.class public Lorg/apache/commons/compress/archivers/tar/TarArchiveSparseEntry;
.super Ljava/lang/Object;
.source "TarArchiveSparseEntry.java"

# interfaces
.implements Lorg/apache/commons/compress/archivers/tar/TarConstants;


# instance fields
.field private isExtended:Z


# direct methods
.method public constructor <init>([B)V
    .locals 2
    .param p1, "headerBuf"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    const/4 v0, 0x0

    .line 56
    .local v0, "offset":I
    add-int/lit16 v0, v0, 0x1f8

    .line 57
    invoke-static {p1, v0}, Lorg/apache/commons/compress/archivers/tar/TarUtils;->parseBoolean([BI)Z

    move-result v1

    iput-boolean v1, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveSparseEntry;->isExtended:Z

    .line 58
    return-void
.end method


# virtual methods
.method public isExtended()Z
    .locals 1

    .prologue
    .line 61
    iget-boolean v0, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveSparseEntry;->isExtended:Z

    return v0
.end method
