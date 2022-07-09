.class public Lorg/apache/tools/zip/AsiExtraField;
.super Ljava/lang/Object;
.source "AsiExtraField.java"

# interfaces
.implements Lorg/apache/tools/zip/ZipExtraField;
.implements Lorg/apache/tools/zip/UnixStat;
.implements Ljava/lang/Cloneable;


# static fields
.field private static final HEADER_ID:Lorg/apache/tools/zip/ZipShort;

.field private static final WORD:I = 0x4


# instance fields
.field private crc:Ljava/util/zip/CRC32;

.field private dirFlag:Z

.field private gid:I

.field private link:Ljava/lang/String;

.field private mode:I

.field private uid:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 51
    new-instance v0, Lorg/apache/tools/zip/ZipShort;

    const/16 v1, 0x756e

    invoke-direct {v0, v1}, Lorg/apache/tools/zip/ZipShort;-><init>(I)V

    sput-object v0, Lorg/apache/tools/zip/AsiExtraField;->HEADER_ID:Lorg/apache/tools/zip/ZipShort;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 94
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 58
    iput v1, p0, Lorg/apache/tools/zip/AsiExtraField;->mode:I

    .line 64
    iput v1, p0, Lorg/apache/tools/zip/AsiExtraField;->uid:I

    .line 70
    iput v1, p0, Lorg/apache/tools/zip/AsiExtraField;->gid:I

    .line 78
    const-string/jumbo v0, ""

    iput-object v0, p0, Lorg/apache/tools/zip/AsiExtraField;->link:Ljava/lang/String;

    .line 84
    iput-boolean v1, p0, Lorg/apache/tools/zip/AsiExtraField;->dirFlag:Z

    .line 91
    new-instance v0, Ljava/util/zip/CRC32;

    invoke-direct {v0}, Ljava/util/zip/CRC32;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/zip/AsiExtraField;->crc:Ljava/util/zip/CRC32;

    .line 95
    return-void
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .locals 3

    .prologue
    .line 339
    :try_start_0
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/zip/AsiExtraField;

    .line 340
    .local v0, "cloned":Lorg/apache/tools/zip/AsiExtraField;
    new-instance v2, Ljava/util/zip/CRC32;

    invoke-direct {v2}, Ljava/util/zip/CRC32;-><init>()V

    iput-object v2, v0, Lorg/apache/tools/zip/AsiExtraField;->crc:Ljava/util/zip/CRC32;
    :try_end_0
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 341
    return-object v0

    .line 342
    .end local v0    # "cloned":Lorg/apache/tools/zip/AsiExtraField;
    :catch_0
    move-exception v1

    .line 344
    .local v1, "cnfe":Ljava/lang/CloneNotSupportedException;
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method public getCentralDirectoryData()[B
    .locals 1

    .prologue
    .line 170
    invoke-virtual {p0}, Lorg/apache/tools/zip/AsiExtraField;->getLocalFileDataData()[B

    move-result-object v0

    return-object v0
.end method

.method public getCentralDirectoryLength()Lorg/apache/tools/zip/ZipShort;
    .locals 1

    .prologue
    .line 127
    invoke-virtual {p0}, Lorg/apache/tools/zip/AsiExtraField;->getLocalFileDataLength()Lorg/apache/tools/zip/ZipShort;

    move-result-object v0

    return-object v0
.end method

.method public getGroupId()I
    .locals 1

    .prologue
    .line 206
    iget v0, p0, Lorg/apache/tools/zip/AsiExtraField;->gid:I

    return v0
.end method

.method public getHeaderId()Lorg/apache/tools/zip/ZipShort;
    .locals 1

    .prologue
    .line 103
    sget-object v0, Lorg/apache/tools/zip/AsiExtraField;->HEADER_ID:Lorg/apache/tools/zip/ZipShort;

    return-object v0
.end method

.method public getLinkedFile()Ljava/lang/String;
    .locals 1

    .prologue
    .line 231
    iget-object v0, p0, Lorg/apache/tools/zip/AsiExtraField;->link:Ljava/lang/String;

    return-object v0
.end method

.method public getLocalFileDataData()[B
    .locals 11

    .prologue
    const/4 v10, 0x4

    const/4 v9, 0x2

    const/4 v8, 0x0

    .line 138
    invoke-virtual {p0}, Lorg/apache/tools/zip/AsiExtraField;->getLocalFileDataLength()Lorg/apache/tools/zip/ZipShort;

    move-result-object v5

    invoke-virtual {v5}, Lorg/apache/tools/zip/ZipShort;->getValue()I

    move-result v5

    add-int/lit8 v5, v5, -0x4

    new-array v2, v5, [B

    .line 139
    .local v2, "data":[B
    invoke-virtual {p0}, Lorg/apache/tools/zip/AsiExtraField;->getMode()I

    move-result v5

    invoke-static {v5}, Lorg/apache/tools/zip/ZipShort;->getBytes(I)[B

    move-result-object v5

    invoke-static {v5, v8, v2, v8, v9}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 141
    invoke-virtual {p0}, Lorg/apache/tools/zip/AsiExtraField;->getLinkedFile()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->getBytes()[B

    move-result-object v3

    .line 143
    .local v3, "linkArray":[B
    array-length v5, v3

    int-to-long v6, v5

    invoke-static {v6, v7}, Lorg/apache/tools/zip/ZipLong;->getBytes(J)[B

    move-result-object v5

    invoke-static {v5, v8, v2, v9, v10}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 146
    invoke-virtual {p0}, Lorg/apache/tools/zip/AsiExtraField;->getUserId()I

    move-result v5

    invoke-static {v5}, Lorg/apache/tools/zip/ZipShort;->getBytes(I)[B

    move-result-object v5

    const/4 v6, 0x6

    invoke-static {v5, v8, v2, v6, v9}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 148
    invoke-virtual {p0}, Lorg/apache/tools/zip/AsiExtraField;->getGroupId()I

    move-result v5

    invoke-static {v5}, Lorg/apache/tools/zip/ZipShort;->getBytes(I)[B

    move-result-object v5

    const/16 v6, 0x8

    invoke-static {v5, v8, v2, v6, v9}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 151
    const/16 v5, 0xa

    array-length v6, v3

    invoke-static {v3, v8, v2, v5, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 154
    iget-object v5, p0, Lorg/apache/tools/zip/AsiExtraField;->crc:Ljava/util/zip/CRC32;

    invoke-virtual {v5}, Ljava/util/zip/CRC32;->reset()V

    .line 155
    iget-object v5, p0, Lorg/apache/tools/zip/AsiExtraField;->crc:Ljava/util/zip/CRC32;

    invoke-virtual {v5, v2}, Ljava/util/zip/CRC32;->update([B)V

    .line 156
    iget-object v5, p0, Lorg/apache/tools/zip/AsiExtraField;->crc:Ljava/util/zip/CRC32;

    invoke-virtual {v5}, Ljava/util/zip/CRC32;->getValue()J

    move-result-wide v0

    .line 158
    .local v0, "checksum":J
    array-length v5, v2

    add-int/lit8 v5, v5, 0x4

    new-array v4, v5, [B

    .line 159
    .local v4, "result":[B
    invoke-static {v0, v1}, Lorg/apache/tools/zip/ZipLong;->getBytes(J)[B

    move-result-object v5

    invoke-static {v5, v8, v4, v8, v10}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 160
    array-length v5, v2

    invoke-static {v2, v8, v4, v10, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 161
    return-object v4
.end method

.method public getLocalFileDataLength()Lorg/apache/tools/zip/ZipShort;
    .locals 2

    .prologue
    .line 113
    new-instance v0, Lorg/apache/tools/zip/ZipShort;

    invoke-virtual {p0}, Lorg/apache/tools/zip/AsiExtraField;->getLinkedFile()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    array-length v1, v1

    add-int/lit8 v1, v1, 0xe

    invoke-direct {v0, v1}, Lorg/apache/tools/zip/ZipShort;-><init>(I)V

    return-object v0
.end method

.method public getMode()I
    .locals 1

    .prologue
    .line 258
    iget v0, p0, Lorg/apache/tools/zip/AsiExtraField;->mode:I

    return v0
.end method

.method protected getMode(I)I
    .locals 2
    .param p1, "mode"    # I

    .prologue
    .line 328
    const v0, 0x8000

    .line 329
    .local v0, "type":I
    invoke-virtual {p0}, Lorg/apache/tools/zip/AsiExtraField;->isLink()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 330
    const v0, 0xa000

    .line 334
    :cond_0
    :goto_0
    and-int/lit16 v1, p1, 0xfff

    or-int/2addr v1, v0

    return v1

    .line 331
    :cond_1
    invoke-virtual {p0}, Lorg/apache/tools/zip/AsiExtraField;->isDirectory()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 332
    const/16 v0, 0x4000

    goto :goto_0
.end method

.method public getUserId()I
    .locals 1

    .prologue
    .line 188
    iget v0, p0, Lorg/apache/tools/zip/AsiExtraField;->uid:I

    return v0
.end method

.method public isDirectory()Z
    .locals 1

    .prologue
    .line 277
    iget-boolean v0, p0, Lorg/apache/tools/zip/AsiExtraField;->dirFlag:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lorg/apache/tools/zip/AsiExtraField;->isLink()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isLink()Z
    .locals 1

    .prologue
    .line 240
    invoke-virtual {p0}, Lorg/apache/tools/zip/AsiExtraField;->getLinkedFile()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public parseFromLocalFileData([BII)V
    .locals 10
    .param p1, "data"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/zip/ZipException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x0

    .line 291
    invoke-static {p1, p2}, Lorg/apache/tools/zip/ZipLong;->getValue([BI)J

    move-result-wide v0

    .line 292
    .local v0, "givenChecksum":J
    add-int/lit8 v8, p3, -0x4

    new-array v6, v8, [B

    .line 293
    .local v6, "tmp":[B
    add-int/lit8 v8, p2, 0x4

    add-int/lit8 v9, p3, -0x4

    invoke-static {p1, v8, v6, v7, v9}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 294
    iget-object v8, p0, Lorg/apache/tools/zip/AsiExtraField;->crc:Ljava/util/zip/CRC32;

    invoke-virtual {v8}, Ljava/util/zip/CRC32;->reset()V

    .line 295
    iget-object v8, p0, Lorg/apache/tools/zip/AsiExtraField;->crc:Ljava/util/zip/CRC32;

    invoke-virtual {v8, v6}, Ljava/util/zip/CRC32;->update([B)V

    .line 296
    iget-object v8, p0, Lorg/apache/tools/zip/AsiExtraField;->crc:Ljava/util/zip/CRC32;

    invoke-virtual {v8}, Ljava/util/zip/CRC32;->getValue()J

    move-result-wide v4

    .line 297
    .local v4, "realChecksum":J
    cmp-long v8, v0, v4

    if-eqz v8, :cond_0

    .line 298
    new-instance v7, Ljava/util/zip/ZipException;

    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v9, "bad CRC checksum "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-static {v0, v1}, Ljava/lang/Long;->toHexString(J)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    const-string/jumbo v9, " instead of "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-static {v4, v5}, Ljava/lang/Long;->toHexString(J)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/util/zip/ZipException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 304
    :cond_0
    invoke-static {v6, v7}, Lorg/apache/tools/zip/ZipShort;->getValue([BI)I

    move-result v3

    .line 306
    .local v3, "newMode":I
    const/4 v8, 0x2

    invoke-static {v6, v8}, Lorg/apache/tools/zip/ZipLong;->getValue([BI)J

    move-result-wide v8

    long-to-int v8, v8

    new-array v2, v8, [B

    .line 307
    .local v2, "linkArray":[B
    const/4 v8, 0x6

    invoke-static {v6, v8}, Lorg/apache/tools/zip/ZipShort;->getValue([BI)I

    move-result v8

    iput v8, p0, Lorg/apache/tools/zip/AsiExtraField;->uid:I

    .line 308
    const/16 v8, 0x8

    invoke-static {v6, v8}, Lorg/apache/tools/zip/ZipShort;->getValue([BI)I

    move-result v8

    iput v8, p0, Lorg/apache/tools/zip/AsiExtraField;->gid:I

    .line 310
    array-length v8, v2

    if-nez v8, :cond_2

    .line 311
    const-string/jumbo v8, ""

    iput-object v8, p0, Lorg/apache/tools/zip/AsiExtraField;->link:Ljava/lang/String;

    .line 317
    :goto_0
    and-int/lit16 v8, v3, 0x4000

    if-eqz v8, :cond_1

    const/4 v7, 0x1

    :cond_1
    invoke-virtual {p0, v7}, Lorg/apache/tools/zip/AsiExtraField;->setDirectory(Z)V

    .line 318
    invoke-virtual {p0, v3}, Lorg/apache/tools/zip/AsiExtraField;->setMode(I)V

    .line 319
    return-void

    .line 313
    :cond_2
    const/16 v8, 0xa

    array-length v9, v2

    invoke-static {v6, v8, v2, v7, v9}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 314
    new-instance v8, Ljava/lang/String;

    invoke-direct {v8, v2}, Ljava/lang/String;-><init>([B)V

    iput-object v8, p0, Lorg/apache/tools/zip/AsiExtraField;->link:Ljava/lang/String;

    goto :goto_0
.end method

.method public setDirectory(Z)V
    .locals 1
    .param p1, "dirFlag"    # Z

    .prologue
    .line 267
    iput-boolean p1, p0, Lorg/apache/tools/zip/AsiExtraField;->dirFlag:Z

    .line 268
    iget v0, p0, Lorg/apache/tools/zip/AsiExtraField;->mode:I

    invoke-virtual {p0, v0}, Lorg/apache/tools/zip/AsiExtraField;->getMode(I)I

    move-result v0

    iput v0, p0, Lorg/apache/tools/zip/AsiExtraField;->mode:I

    .line 269
    return-void
.end method

.method public setGroupId(I)V
    .locals 0
    .param p1, "gid"    # I

    .prologue
    .line 197
    iput p1, p0, Lorg/apache/tools/zip/AsiExtraField;->gid:I

    .line 198
    return-void
.end method

.method public setLinkedFile(Ljava/lang/String;)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 218
    iput-object p1, p0, Lorg/apache/tools/zip/AsiExtraField;->link:Ljava/lang/String;

    .line 219
    iget v0, p0, Lorg/apache/tools/zip/AsiExtraField;->mode:I

    invoke-virtual {p0, v0}, Lorg/apache/tools/zip/AsiExtraField;->getMode(I)I

    move-result v0

    iput v0, p0, Lorg/apache/tools/zip/AsiExtraField;->mode:I

    .line 220
    return-void
.end method

.method public setMode(I)V
    .locals 1
    .param p1, "mode"    # I

    .prologue
    .line 249
    invoke-virtual {p0, p1}, Lorg/apache/tools/zip/AsiExtraField;->getMode(I)I

    move-result v0

    iput v0, p0, Lorg/apache/tools/zip/AsiExtraField;->mode:I

    .line 250
    return-void
.end method

.method public setUserId(I)V
    .locals 0
    .param p1, "uid"    # I

    .prologue
    .line 179
    iput p1, p0, Lorg/apache/tools/zip/AsiExtraField;->uid:I

    .line 180
    return-void
.end method
