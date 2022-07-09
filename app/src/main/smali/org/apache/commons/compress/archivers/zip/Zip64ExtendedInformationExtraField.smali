.class public Lorg/apache/commons/compress/archivers/zip/Zip64ExtendedInformationExtraField;
.super Ljava/lang/Object;
.source "Zip64ExtendedInformationExtraField.java"

# interfaces
.implements Lorg/apache/commons/compress/archivers/zip/ZipExtraField;


# static fields
.field static final HEADER_ID:Lorg/apache/commons/compress/archivers/zip/ZipShort;

.field private static final LFH_MUST_HAVE_BOTH_SIZES_MSG:Ljava/lang/String; = "Zip64 extended information must contain both size values in the local file header."


# instance fields
.field private compressedSize:Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;

.field private diskStart:Lorg/apache/commons/compress/archivers/zip/ZipLong;

.field private rawCentralDirectoryData:[B

.field private relativeHeaderOffset:Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;

.field private size:Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 78
    new-instance v0, Lorg/apache/commons/compress/archivers/zip/ZipShort;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lorg/apache/commons/compress/archivers/zip/ZipShort;-><init>(I)V

    sput-object v0, Lorg/apache/commons/compress/archivers/zip/Zip64ExtendedInformationExtraField;->HEADER_ID:Lorg/apache/commons/compress/archivers/zip/ZipShort;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 103
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;)V
    .locals 1
    .param p1, "size"    # Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;
    .param p2, "compressedSize"    # Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;

    .prologue
    const/4 v0, 0x0

    .line 115
    invoke-direct {p0, p1, p2, v0, v0}, Lorg/apache/commons/compress/archivers/zip/Zip64ExtendedInformationExtraField;-><init>(Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;Lorg/apache/commons/compress/archivers/zip/ZipLong;)V

    .line 116
    return-void
.end method

.method public constructor <init>(Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;Lorg/apache/commons/compress/archivers/zip/ZipLong;)V
    .locals 0
    .param p1, "size"    # Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;
    .param p2, "compressedSize"    # Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;
    .param p3, "relativeHeaderOffset"    # Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;
    .param p4, "diskStart"    # Lorg/apache/commons/compress/archivers/zip/ZipLong;

    .prologue
    .line 129
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 130
    iput-object p1, p0, Lorg/apache/commons/compress/archivers/zip/Zip64ExtendedInformationExtraField;->size:Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;

    .line 131
    iput-object p2, p0, Lorg/apache/commons/compress/archivers/zip/Zip64ExtendedInformationExtraField;->compressedSize:Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;

    .line 132
    iput-object p3, p0, Lorg/apache/commons/compress/archivers/zip/Zip64ExtendedInformationExtraField;->relativeHeaderOffset:Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;

    .line 133
    iput-object p4, p0, Lorg/apache/commons/compress/archivers/zip/Zip64ExtendedInformationExtraField;->diskStart:Lorg/apache/commons/compress/archivers/zip/ZipLong;

    .line 134
    return-void
.end method

.method private addSizes([B)I
    .locals 4
    .param p1, "data"    # [B

    .prologue
    const/16 v3, 0x8

    const/4 v2, 0x0

    .line 345
    const/4 v0, 0x0

    .line 346
    .local v0, "off":I
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/Zip64ExtendedInformationExtraField;->size:Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;

    if-eqz v1, :cond_0

    .line 347
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/Zip64ExtendedInformationExtraField;->size:Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;

    invoke-virtual {v1}, Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;->getBytes()[B

    move-result-object v1

    invoke-static {v1, v2, p1, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 348
    add-int/lit8 v0, v0, 0x8

    .line 350
    :cond_0
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/Zip64ExtendedInformationExtraField;->compressedSize:Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;

    if-eqz v1, :cond_1

    .line 351
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/Zip64ExtendedInformationExtraField;->compressedSize:Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;

    invoke-virtual {v1}, Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;->getBytes()[B

    move-result-object v1

    invoke-static {v1, v2, p1, v0, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 352
    add-int/lit8 v0, v0, 0x8

    .line 354
    :cond_1
    return v0
.end method


# virtual methods
.method public getCentralDirectoryData()[B
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 169
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/zip/Zip64ExtendedInformationExtraField;->getCentralDirectoryLength()Lorg/apache/commons/compress/archivers/zip/ZipShort;

    move-result-object v2

    invoke-virtual {v2}, Lorg/apache/commons/compress/archivers/zip/ZipShort;->getValue()I

    move-result v2

    new-array v0, v2, [B

    .line 170
    .local v0, "data":[B
    invoke-direct {p0, v0}, Lorg/apache/commons/compress/archivers/zip/Zip64ExtendedInformationExtraField;->addSizes([B)I

    move-result v1

    .line 171
    .local v1, "off":I
    iget-object v2, p0, Lorg/apache/commons/compress/archivers/zip/Zip64ExtendedInformationExtraField;->relativeHeaderOffset:Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;

    if-eqz v2, :cond_0

    .line 172
    iget-object v2, p0, Lorg/apache/commons/compress/archivers/zip/Zip64ExtendedInformationExtraField;->relativeHeaderOffset:Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;

    invoke-virtual {v2}, Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;->getBytes()[B

    move-result-object v2

    const/16 v3, 0x8

    invoke-static {v2, v4, v0, v1, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 173
    add-int/lit8 v1, v1, 0x8

    .line 175
    :cond_0
    iget-object v2, p0, Lorg/apache/commons/compress/archivers/zip/Zip64ExtendedInformationExtraField;->diskStart:Lorg/apache/commons/compress/archivers/zip/ZipLong;

    if-eqz v2, :cond_1

    .line 176
    iget-object v2, p0, Lorg/apache/commons/compress/archivers/zip/Zip64ExtendedInformationExtraField;->diskStart:Lorg/apache/commons/compress/archivers/zip/ZipLong;

    invoke-virtual {v2}, Lorg/apache/commons/compress/archivers/zip/ZipLong;->getBytes()[B

    move-result-object v2

    const/4 v3, 0x4

    invoke-static {v2, v4, v0, v1, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 177
    add-int/lit8 v1, v1, 0x4

    .line 179
    :cond_1
    return-object v0
.end method

.method public getCentralDirectoryLength()Lorg/apache/commons/compress/archivers/zip/ZipShort;
    .locals 5

    .prologue
    const/16 v1, 0x8

    const/4 v2, 0x0

    .line 148
    new-instance v4, Lorg/apache/commons/compress/archivers/zip/ZipShort;

    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/Zip64ExtendedInformationExtraField;->size:Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;

    if-eqz v0, :cond_1

    move v0, v1

    :goto_0
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/Zip64ExtendedInformationExtraField;->compressedSize:Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;

    if-eqz v3, :cond_2

    move v3, v1

    :goto_1
    add-int/2addr v0, v3

    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/Zip64ExtendedInformationExtraField;->relativeHeaderOffset:Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;

    if-eqz v3, :cond_3

    :goto_2
    add-int/2addr v0, v1

    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/Zip64ExtendedInformationExtraField;->diskStart:Lorg/apache/commons/compress/archivers/zip/ZipLong;

    if-eqz v1, :cond_0

    const/4 v2, 0x4

    :cond_0
    add-int/2addr v0, v2

    invoke-direct {v4, v0}, Lorg/apache/commons/compress/archivers/zip/ZipShort;-><init>(I)V

    return-object v4

    :cond_1
    move v0, v2

    goto :goto_0

    :cond_2
    move v3, v2

    goto :goto_1

    :cond_3
    move v1, v2

    goto :goto_2
.end method

.method public getCompressedSize()Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;
    .locals 1

    .prologue
    .line 306
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/Zip64ExtendedInformationExtraField;->compressedSize:Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;

    return-object v0
.end method

.method public getDiskStartNumber()Lorg/apache/commons/compress/archivers/zip/ZipLong;
    .locals 1

    .prologue
    .line 334
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/Zip64ExtendedInformationExtraField;->diskStart:Lorg/apache/commons/compress/archivers/zip/ZipLong;

    return-object v0
.end method

.method public getHeaderId()Lorg/apache/commons/compress/archivers/zip/ZipShort;
    .locals 1

    .prologue
    .line 138
    sget-object v0, Lorg/apache/commons/compress/archivers/zip/Zip64ExtendedInformationExtraField;->HEADER_ID:Lorg/apache/commons/compress/archivers/zip/ZipShort;

    return-object v0
.end method

.method public getLocalFileDataData()[B
    .locals 3

    .prologue
    .line 156
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/Zip64ExtendedInformationExtraField;->size:Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;

    if-nez v1, :cond_0

    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/Zip64ExtendedInformationExtraField;->compressedSize:Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;

    if-eqz v1, :cond_3

    .line 157
    :cond_0
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/Zip64ExtendedInformationExtraField;->size:Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/Zip64ExtendedInformationExtraField;->compressedSize:Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;

    if-nez v1, :cond_2

    .line 158
    :cond_1
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v2, "Zip64 extended information must contain both size values in the local file header."

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 160
    :cond_2
    const/16 v1, 0x10

    new-array v0, v1, [B

    .line 161
    .local v0, "data":[B
    invoke-direct {p0, v0}, Lorg/apache/commons/compress/archivers/zip/Zip64ExtendedInformationExtraField;->addSizes([B)I

    .line 164
    .end local v0    # "data":[B
    :goto_0
    return-object v0

    :cond_3
    const/4 v1, 0x0

    new-array v0, v1, [B

    goto :goto_0
.end method

.method public getLocalFileDataLength()Lorg/apache/commons/compress/archivers/zip/ZipShort;
    .locals 2

    .prologue
    .line 143
    new-instance v1, Lorg/apache/commons/compress/archivers/zip/ZipShort;

    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/Zip64ExtendedInformationExtraField;->size:Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;

    if-eqz v0, :cond_0

    const/16 v0, 0x10

    :goto_0
    invoke-direct {v1, v0}, Lorg/apache/commons/compress/archivers/zip/ZipShort;-><init>(I)V

    return-object v1

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getRelativeHeaderOffset()Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;
    .locals 1

    .prologue
    .line 320
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/Zip64ExtendedInformationExtraField;->relativeHeaderOffset:Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;

    return-object v0
.end method

.method public getSize()Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;
    .locals 1

    .prologue
    .line 292
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/Zip64ExtendedInformationExtraField;->size:Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;

    return-object v0
.end method

.method public parseFromCentralDirectoryData([BII)V
    .locals 2
    .param p1, "buffer"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/zip/ZipException;
        }
    .end annotation

    .prologue
    .line 217
    new-array v0, p3, [B

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/zip/Zip64ExtendedInformationExtraField;->rawCentralDirectoryData:[B

    .line 218
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/Zip64ExtendedInformationExtraField;->rawCentralDirectoryData:[B

    const/4 v1, 0x0

    invoke-static {p1, p2, v0, v1, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 226
    const/16 v0, 0x1c

    if-lt p3, v0, :cond_1

    .line 227
    invoke-virtual {p0, p1, p2, p3}, Lorg/apache/commons/compress/archivers/zip/Zip64ExtendedInformationExtraField;->parseFromLocalFileData([BII)V

    .line 237
    :cond_0
    :goto_0
    return-void

    .line 228
    :cond_1
    const/16 v0, 0x18

    if-ne p3, v0, :cond_2

    .line 229
    new-instance v0, Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;

    invoke-direct {v0, p1, p2}, Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;-><init>([BI)V

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/zip/Zip64ExtendedInformationExtraField;->size:Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;

    .line 230
    add-int/lit8 p2, p2, 0x8

    .line 231
    new-instance v0, Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;

    invoke-direct {v0, p1, p2}, Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;-><init>([BI)V

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/zip/Zip64ExtendedInformationExtraField;->compressedSize:Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;

    .line 232
    add-int/lit8 p2, p2, 0x8

    .line 233
    new-instance v0, Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;

    invoke-direct {v0, p1, p2}, Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;-><init>([BI)V

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/zip/Zip64ExtendedInformationExtraField;->relativeHeaderOffset:Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;

    goto :goto_0

    .line 234
    :cond_2
    rem-int/lit8 v0, p3, 0x8

    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    .line 235
    new-instance v0, Lorg/apache/commons/compress/archivers/zip/ZipLong;

    add-int v1, p2, p3

    add-int/lit8 v1, v1, -0x4

    invoke-direct {v0, p1, v1}, Lorg/apache/commons/compress/archivers/zip/ZipLong;-><init>([BI)V

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/zip/Zip64ExtendedInformationExtraField;->diskStart:Lorg/apache/commons/compress/archivers/zip/ZipLong;

    goto :goto_0
.end method

.method public parseFromLocalFileData([BII)V
    .locals 3
    .param p1, "buffer"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/zip/ZipException;
        }
    .end annotation

    .prologue
    .line 185
    if-nez p3, :cond_1

    .line 210
    :cond_0
    :goto_0
    return-void

    .line 192
    :cond_1
    const/16 v1, 0x10

    if-ge p3, v1, :cond_2

    .line 193
    new-instance v1, Ljava/util/zip/ZipException;

    const-string/jumbo v2, "Zip64 extended information must contain both size values in the local file header."

    invoke-direct {v1, v2}, Ljava/util/zip/ZipException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 195
    :cond_2
    new-instance v1, Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;

    invoke-direct {v1, p1, p2}, Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;-><init>([BI)V

    iput-object v1, p0, Lorg/apache/commons/compress/archivers/zip/Zip64ExtendedInformationExtraField;->size:Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;

    .line 196
    add-int/lit8 p2, p2, 0x8

    .line 197
    new-instance v1, Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;

    invoke-direct {v1, p1, p2}, Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;-><init>([BI)V

    iput-object v1, p0, Lorg/apache/commons/compress/archivers/zip/Zip64ExtendedInformationExtraField;->compressedSize:Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;

    .line 198
    add-int/lit8 p2, p2, 0x8

    .line 199
    add-int/lit8 v0, p3, -0x10

    .line 200
    .local v0, "remaining":I
    const/16 v1, 0x8

    if-lt v0, v1, :cond_3

    .line 201
    new-instance v1, Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;

    invoke-direct {v1, p1, p2}, Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;-><init>([BI)V

    iput-object v1, p0, Lorg/apache/commons/compress/archivers/zip/Zip64ExtendedInformationExtraField;->relativeHeaderOffset:Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;

    .line 202
    add-int/lit8 p2, p2, 0x8

    .line 203
    add-int/lit8 v0, v0, -0x8

    .line 205
    :cond_3
    const/4 v1, 0x4

    if-lt v0, v1, :cond_0

    .line 206
    new-instance v1, Lorg/apache/commons/compress/archivers/zip/ZipLong;

    invoke-direct {v1, p1, p2}, Lorg/apache/commons/compress/archivers/zip/ZipLong;-><init>([BI)V

    iput-object v1, p0, Lorg/apache/commons/compress/archivers/zip/Zip64ExtendedInformationExtraField;->diskStart:Lorg/apache/commons/compress/archivers/zip/ZipLong;

    .line 207
    add-int/lit8 p2, p2, 0x4

    .line 208
    add-int/lit8 v0, v0, -0x4

    goto :goto_0
.end method

.method public reparseCentralDirectoryData(ZZZZ)V
    .locals 6
    .param p1, "hasUncompressedSize"    # Z
    .param p2, "hasCompressedSize"    # Z
    .param p3, "hasRelativeHeaderOffset"    # Z
    .param p4, "hasDiskStart"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/zip/ZipException;
        }
    .end annotation

    .prologue
    const/16 v3, 0x8

    const/4 v2, 0x0

    .line 253
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/zip/Zip64ExtendedInformationExtraField;->rawCentralDirectoryData:[B

    if-eqz v4, :cond_8

    .line 254
    if-eqz p1, :cond_1

    move v5, v3

    :goto_0
    if-eqz p2, :cond_2

    move v4, v3

    :goto_1
    add-int/2addr v4, v5

    if-eqz p3, :cond_3

    :goto_2
    add-int/2addr v3, v4

    if-eqz p4, :cond_0

    const/4 v2, 0x4

    :cond_0
    add-int v0, v3, v2

    .line 258
    .local v0, "expectedLength":I
    iget-object v2, p0, Lorg/apache/commons/compress/archivers/zip/Zip64ExtendedInformationExtraField;->rawCentralDirectoryData:[B

    array-length v2, v2

    if-eq v2, v0, :cond_4

    .line 259
    new-instance v2, Ljava/util/zip/ZipException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "central directory zip64 extended information extra field\'s length doesn\'t match central directory data.  Expected length "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, " but is "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lorg/apache/commons/compress/archivers/zip/Zip64ExtendedInformationExtraField;->rawCentralDirectoryData:[B

    array-length v4, v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/util/zip/ZipException;-><init>(Ljava/lang/String;)V

    throw v2

    .end local v0    # "expectedLength":I
    :cond_1
    move v5, v2

    .line 254
    goto :goto_0

    :cond_2
    move v4, v2

    goto :goto_1

    :cond_3
    move v3, v2

    goto :goto_2

    .line 266
    .restart local v0    # "expectedLength":I
    :cond_4
    const/4 v1, 0x0

    .line 267
    .local v1, "offset":I
    if-eqz p1, :cond_5

    .line 268
    new-instance v2, Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;

    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/Zip64ExtendedInformationExtraField;->rawCentralDirectoryData:[B

    invoke-direct {v2, v3, v1}, Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;-><init>([BI)V

    iput-object v2, p0, Lorg/apache/commons/compress/archivers/zip/Zip64ExtendedInformationExtraField;->size:Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;

    .line 269
    add-int/lit8 v1, v1, 0x8

    .line 271
    :cond_5
    if-eqz p2, :cond_6

    .line 272
    new-instance v2, Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;

    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/Zip64ExtendedInformationExtraField;->rawCentralDirectoryData:[B

    invoke-direct {v2, v3, v1}, Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;-><init>([BI)V

    iput-object v2, p0, Lorg/apache/commons/compress/archivers/zip/Zip64ExtendedInformationExtraField;->compressedSize:Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;

    .line 274
    add-int/lit8 v1, v1, 0x8

    .line 276
    :cond_6
    if-eqz p3, :cond_7

    .line 277
    new-instance v2, Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;

    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/Zip64ExtendedInformationExtraField;->rawCentralDirectoryData:[B

    invoke-direct {v2, v3, v1}, Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;-><init>([BI)V

    iput-object v2, p0, Lorg/apache/commons/compress/archivers/zip/Zip64ExtendedInformationExtraField;->relativeHeaderOffset:Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;

    .line 279
    add-int/lit8 v1, v1, 0x8

    .line 281
    :cond_7
    if-eqz p4, :cond_8

    .line 282
    new-instance v2, Lorg/apache/commons/compress/archivers/zip/ZipLong;

    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/Zip64ExtendedInformationExtraField;->rawCentralDirectoryData:[B

    invoke-direct {v2, v3, v1}, Lorg/apache/commons/compress/archivers/zip/ZipLong;-><init>([BI)V

    iput-object v2, p0, Lorg/apache/commons/compress/archivers/zip/Zip64ExtendedInformationExtraField;->diskStart:Lorg/apache/commons/compress/archivers/zip/ZipLong;

    .line 283
    add-int/lit8 v1, v1, 0x4

    .line 286
    .end local v0    # "expectedLength":I
    .end local v1    # "offset":I
    :cond_8
    return-void
.end method

.method public setCompressedSize(Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;)V
    .locals 0
    .param p1, "compressedSize"    # Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;

    .prologue
    .line 313
    iput-object p1, p0, Lorg/apache/commons/compress/archivers/zip/Zip64ExtendedInformationExtraField;->compressedSize:Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;

    .line 314
    return-void
.end method

.method public setDiskStartNumber(Lorg/apache/commons/compress/archivers/zip/ZipLong;)V
    .locals 0
    .param p1, "ds"    # Lorg/apache/commons/compress/archivers/zip/ZipLong;

    .prologue
    .line 341
    iput-object p1, p0, Lorg/apache/commons/compress/archivers/zip/Zip64ExtendedInformationExtraField;->diskStart:Lorg/apache/commons/compress/archivers/zip/ZipLong;

    .line 342
    return-void
.end method

.method public setRelativeHeaderOffset(Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;)V
    .locals 0
    .param p1, "rho"    # Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;

    .prologue
    .line 327
    iput-object p1, p0, Lorg/apache/commons/compress/archivers/zip/Zip64ExtendedInformationExtraField;->relativeHeaderOffset:Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;

    .line 328
    return-void
.end method

.method public setSize(Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;)V
    .locals 0
    .param p1, "size"    # Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;

    .prologue
    .line 299
    iput-object p1, p0, Lorg/apache/commons/compress/archivers/zip/Zip64ExtendedInformationExtraField;->size:Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;

    .line 300
    return-void
.end method
