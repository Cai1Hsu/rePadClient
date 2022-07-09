.class public Lorg/apache/tools/zip/UnrecognizedExtraField;
.super Ljava/lang/Object;
.source "UnrecognizedExtraField.java"

# interfaces
.implements Lorg/apache/tools/zip/CentralDirectoryParsingZipExtraField;


# instance fields
.field private centralData:[B

.field private headerId:Lorg/apache/tools/zip/ZipShort;

.field private localData:[B


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getCentralDirectoryData()[B
    .locals 1

    .prologue
    .line 121
    iget-object v0, p0, Lorg/apache/tools/zip/UnrecognizedExtraField;->centralData:[B

    if-eqz v0, :cond_0

    .line 122
    iget-object v0, p0, Lorg/apache/tools/zip/UnrecognizedExtraField;->centralData:[B

    invoke-static {v0}, Lorg/apache/tools/zip/ZipUtil;->copy([B)[B

    move-result-object v0

    .line 124
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/zip/UnrecognizedExtraField;->getLocalFileDataData()[B

    move-result-object v0

    goto :goto_0
.end method

.method public getCentralDirectoryLength()Lorg/apache/tools/zip/ZipShort;
    .locals 2

    .prologue
    .line 110
    iget-object v0, p0, Lorg/apache/tools/zip/UnrecognizedExtraField;->centralData:[B

    if-eqz v0, :cond_0

    .line 111
    new-instance v0, Lorg/apache/tools/zip/ZipShort;

    iget-object v1, p0, Lorg/apache/tools/zip/UnrecognizedExtraField;->centralData:[B

    array-length v1, v1

    invoke-direct {v0, v1}, Lorg/apache/tools/zip/ZipShort;-><init>(I)V

    .line 113
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/zip/UnrecognizedExtraField;->getLocalFileDataLength()Lorg/apache/tools/zip/ZipShort;

    move-result-object v0

    goto :goto_0
.end method

.method public getHeaderId()Lorg/apache/tools/zip/ZipShort;
    .locals 1

    .prologue
    .line 52
    iget-object v0, p0, Lorg/apache/tools/zip/UnrecognizedExtraField;->headerId:Lorg/apache/tools/zip/ZipShort;

    return-object v0
.end method

.method public getLocalFileDataData()[B
    .locals 1

    .prologue
    .line 85
    iget-object v0, p0, Lorg/apache/tools/zip/UnrecognizedExtraField;->localData:[B

    invoke-static {v0}, Lorg/apache/tools/zip/ZipUtil;->copy([B)[B

    move-result-object v0

    return-object v0
.end method

.method public getLocalFileDataLength()Lorg/apache/tools/zip/ZipShort;
    .locals 2

    .prologue
    .line 77
    new-instance v0, Lorg/apache/tools/zip/ZipShort;

    iget-object v1, p0, Lorg/apache/tools/zip/UnrecognizedExtraField;->localData:[B

    array-length v1, v1

    invoke-direct {v0, v1}, Lorg/apache/tools/zip/ZipShort;-><init>(I)V

    return-object v0
.end method

.method public parseFromCentralDirectoryData([BII)V
    .locals 2
    .param p1, "data"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I

    .prologue
    .line 146
    new-array v0, p3, [B

    .line 147
    .local v0, "tmp":[B
    const/4 v1, 0x0

    invoke-static {p1, p2, v0, v1, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 148
    invoke-virtual {p0, v0}, Lorg/apache/tools/zip/UnrecognizedExtraField;->setCentralDirectoryData([B)V

    .line 149
    iget-object v1, p0, Lorg/apache/tools/zip/UnrecognizedExtraField;->localData:[B

    if-nez v1, :cond_0

    .line 150
    invoke-virtual {p0, v0}, Lorg/apache/tools/zip/UnrecognizedExtraField;->setLocalFileDataData([B)V

    .line 152
    :cond_0
    return-void
.end method

.method public parseFromLocalFileData([BII)V
    .locals 2
    .param p1, "data"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I

    .prologue
    .line 134
    new-array v0, p3, [B

    .line 135
    .local v0, "tmp":[B
    const/4 v1, 0x0

    invoke-static {p1, p2, v0, v1, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 136
    invoke-virtual {p0, v0}, Lorg/apache/tools/zip/UnrecognizedExtraField;->setLocalFileDataData([B)V

    .line 137
    return-void
.end method

.method public setCentralDirectoryData([B)V
    .locals 1
    .param p1, "data"    # [B

    .prologue
    .line 101
    invoke-static {p1}, Lorg/apache/tools/zip/ZipUtil;->copy([B)[B

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/zip/UnrecognizedExtraField;->centralData:[B

    .line 102
    return-void
.end method

.method public setHeaderId(Lorg/apache/tools/zip/ZipShort;)V
    .locals 0
    .param p1, "headerId"    # Lorg/apache/tools/zip/ZipShort;

    .prologue
    .line 44
    iput-object p1, p0, Lorg/apache/tools/zip/UnrecognizedExtraField;->headerId:Lorg/apache/tools/zip/ZipShort;

    .line 45
    return-void
.end method

.method public setLocalFileDataData([B)V
    .locals 1
    .param p1, "data"    # [B

    .prologue
    .line 69
    invoke-static {p1}, Lorg/apache/tools/zip/ZipUtil;->copy([B)[B

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/zip/UnrecognizedExtraField;->localData:[B

    .line 70
    return-void
.end method
