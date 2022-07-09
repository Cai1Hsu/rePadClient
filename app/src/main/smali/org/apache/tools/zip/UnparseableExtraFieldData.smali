.class public final Lorg/apache/tools/zip/UnparseableExtraFieldData;
.super Ljava/lang/Object;
.source "UnparseableExtraFieldData.java"

# interfaces
.implements Lorg/apache/tools/zip/CentralDirectoryParsingZipExtraField;


# static fields
.field private static final HEADER_ID:Lorg/apache/tools/zip/ZipShort;


# instance fields
.field private centralDirectoryData:[B

.field private localFileData:[B


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 35
    new-instance v0, Lorg/apache/tools/zip/ZipShort;

    const v1, 0xacc1

    invoke-direct {v0, v1}, Lorg/apache/tools/zip/ZipShort;-><init>(I)V

    sput-object v0, Lorg/apache/tools/zip/UnparseableExtraFieldData;->HEADER_ID:Lorg/apache/tools/zip/ZipShort;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getCentralDirectoryData()[B
    .locals 1

    .prologue
    .line 84
    iget-object v0, p0, Lorg/apache/tools/zip/UnparseableExtraFieldData;->centralDirectoryData:[B

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lorg/apache/tools/zip/UnparseableExtraFieldData;->getLocalFileDataData()[B

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lorg/apache/tools/zip/UnparseableExtraFieldData;->centralDirectoryData:[B

    invoke-static {v0}, Lorg/apache/tools/zip/ZipUtil;->copy([B)[B

    move-result-object v0

    goto :goto_0
.end method

.method public getCentralDirectoryLength()Lorg/apache/tools/zip/ZipShort;
    .locals 2

    .prologue
    .line 64
    iget-object v0, p0, Lorg/apache/tools/zip/UnparseableExtraFieldData;->centralDirectoryData:[B

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lorg/apache/tools/zip/UnparseableExtraFieldData;->getLocalFileDataLength()Lorg/apache/tools/zip/ZipShort;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Lorg/apache/tools/zip/ZipShort;

    iget-object v1, p0, Lorg/apache/tools/zip/UnparseableExtraFieldData;->centralDirectoryData:[B

    array-length v1, v1

    invoke-direct {v0, v1}, Lorg/apache/tools/zip/ZipShort;-><init>(I)V

    goto :goto_0
.end method

.method public getHeaderId()Lorg/apache/tools/zip/ZipShort;
    .locals 1

    .prologue
    .line 46
    sget-object v0, Lorg/apache/tools/zip/UnparseableExtraFieldData;->HEADER_ID:Lorg/apache/tools/zip/ZipShort;

    return-object v0
.end method

.method public getLocalFileDataData()[B
    .locals 1

    .prologue
    .line 75
    iget-object v0, p0, Lorg/apache/tools/zip/UnparseableExtraFieldData;->localFileData:[B

    invoke-static {v0}, Lorg/apache/tools/zip/ZipUtil;->copy([B)[B

    move-result-object v0

    return-object v0
.end method

.method public getLocalFileDataLength()Lorg/apache/tools/zip/ZipShort;
    .locals 2

    .prologue
    .line 55
    new-instance v1, Lorg/apache/tools/zip/ZipShort;

    iget-object v0, p0, Lorg/apache/tools/zip/UnparseableExtraFieldData;->localFileData:[B

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    invoke-direct {v1, v0}, Lorg/apache/tools/zip/ZipShort;-><init>(I)V

    return-object v1

    :cond_0
    iget-object v0, p0, Lorg/apache/tools/zip/UnparseableExtraFieldData;->localFileData:[B

    array-length v0, v0

    goto :goto_0
.end method

.method public parseFromCentralDirectoryData([BII)V
    .locals 2
    .param p1, "buffer"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I

    .prologue
    .line 110
    new-array v0, p3, [B

    iput-object v0, p0, Lorg/apache/tools/zip/UnparseableExtraFieldData;->centralDirectoryData:[B

    .line 111
    iget-object v0, p0, Lorg/apache/tools/zip/UnparseableExtraFieldData;->centralDirectoryData:[B

    const/4 v1, 0x0

    invoke-static {p1, p2, v0, v1, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 112
    iget-object v0, p0, Lorg/apache/tools/zip/UnparseableExtraFieldData;->localFileData:[B

    if-nez v0, :cond_0

    .line 113
    invoke-virtual {p0, p1, p2, p3}, Lorg/apache/tools/zip/UnparseableExtraFieldData;->parseFromLocalFileData([BII)V

    .line 115
    :cond_0
    return-void
.end method

.method public parseFromLocalFileData([BII)V
    .locals 2
    .param p1, "buffer"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I

    .prologue
    .line 96
    new-array v0, p3, [B

    iput-object v0, p0, Lorg/apache/tools/zip/UnparseableExtraFieldData;->localFileData:[B

    .line 97
    iget-object v0, p0, Lorg/apache/tools/zip/UnparseableExtraFieldData;->localFileData:[B

    const/4 v1, 0x0

    invoke-static {p1, p2, v0, v1, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 98
    return-void
.end method
