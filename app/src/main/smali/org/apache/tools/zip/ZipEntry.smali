.class public Lorg/apache/tools/zip/ZipEntry;
.super Ljava/util/zip/ZipEntry;
.source "ZipEntry.java"

# interfaces
.implements Ljava/lang/Cloneable;


# static fields
.field public static final PLATFORM_FAT:I = 0x0

.field public static final PLATFORM_UNIX:I = 0x3

.field private static final SHORT_MASK:I = 0xffff

.field private static final SHORT_SHIFT:I = 0x10


# instance fields
.field private externalAttributes:J

.field private extraFields:Ljava/util/LinkedHashMap;

.field private internalAttributes:I

.field private name:Ljava/lang/String;

.field private platform:I

.field private unparseableExtra:Lorg/apache/tools/zip/UnparseableExtraFieldData;


# direct methods
.method protected constructor <init>()V
    .locals 3

    .prologue
    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 107
    const-string/jumbo v0, ""

    invoke-direct {p0, v0}, Ljava/util/zip/ZipEntry;-><init>(Ljava/lang/String;)V

    .line 55
    iput v1, p0, Lorg/apache/tools/zip/ZipEntry;->internalAttributes:I

    .line 56
    iput v1, p0, Lorg/apache/tools/zip/ZipEntry;->platform:I

    .line 57
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lorg/apache/tools/zip/ZipEntry;->externalAttributes:J

    .line 58
    iput-object v2, p0, Lorg/apache/tools/zip/ZipEntry;->extraFields:Ljava/util/LinkedHashMap;

    .line 59
    iput-object v2, p0, Lorg/apache/tools/zip/ZipEntry;->unparseableExtra:Lorg/apache/tools/zip/UnparseableExtraFieldData;

    .line 60
    iput-object v2, p0, Lorg/apache/tools/zip/ZipEntry;->name:Ljava/lang/String;

    .line 108
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    const/4 v2, 0x0

    .line 68
    invoke-direct {p0, p1}, Ljava/util/zip/ZipEntry;-><init>(Ljava/lang/String;)V

    .line 55
    iput v0, p0, Lorg/apache/tools/zip/ZipEntry;->internalAttributes:I

    .line 56
    iput v0, p0, Lorg/apache/tools/zip/ZipEntry;->platform:I

    .line 57
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lorg/apache/tools/zip/ZipEntry;->externalAttributes:J

    .line 58
    iput-object v2, p0, Lorg/apache/tools/zip/ZipEntry;->extraFields:Ljava/util/LinkedHashMap;

    .line 59
    iput-object v2, p0, Lorg/apache/tools/zip/ZipEntry;->unparseableExtra:Lorg/apache/tools/zip/UnparseableExtraFieldData;

    .line 60
    iput-object v2, p0, Lorg/apache/tools/zip/ZipEntry;->name:Ljava/lang/String;

    .line 69
    return-void
.end method

.method public constructor <init>(Ljava/util/zip/ZipEntry;)V
    .locals 4
    .param p1, "entry"    # Ljava/util/zip/ZipEntry;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/zip/ZipException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 78
    invoke-direct {p0, p1}, Ljava/util/zip/ZipEntry;-><init>(Ljava/util/zip/ZipEntry;)V

    .line 55
    iput v2, p0, Lorg/apache/tools/zip/ZipEntry;->internalAttributes:I

    .line 56
    iput v2, p0, Lorg/apache/tools/zip/ZipEntry;->platform:I

    .line 57
    const-wide/16 v2, 0x0

    iput-wide v2, p0, Lorg/apache/tools/zip/ZipEntry;->externalAttributes:J

    .line 58
    iput-object v1, p0, Lorg/apache/tools/zip/ZipEntry;->extraFields:Ljava/util/LinkedHashMap;

    .line 59
    iput-object v1, p0, Lorg/apache/tools/zip/ZipEntry;->unparseableExtra:Lorg/apache/tools/zip/UnparseableExtraFieldData;

    .line 60
    iput-object v1, p0, Lorg/apache/tools/zip/ZipEntry;->name:Ljava/lang/String;

    .line 79
    invoke-virtual {p1}, Ljava/util/zip/ZipEntry;->getExtra()[B

    move-result-object v0

    .line 80
    .local v0, "extra":[B
    if-eqz v0, :cond_0

    .line 81
    const/4 v1, 0x1

    sget-object v2, Lorg/apache/tools/zip/ExtraFieldUtils$UnparseableExtraField;->READ:Lorg/apache/tools/zip/ExtraFieldUtils$UnparseableExtraField;

    invoke-static {v0, v1, v2}, Lorg/apache/tools/zip/ExtraFieldUtils;->parse([BZLorg/apache/tools/zip/ExtraFieldUtils$UnparseableExtraField;)[Lorg/apache/tools/zip/ZipExtraField;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/apache/tools/zip/ZipEntry;->setExtraFields([Lorg/apache/tools/zip/ZipExtraField;)V

    .line 88
    :goto_0
    return-void

    .line 86
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/zip/ZipEntry;->setExtra()V

    goto :goto_0
.end method

.method public constructor <init>(Lorg/apache/tools/zip/ZipEntry;)V
    .locals 2
    .param p1, "entry"    # Lorg/apache/tools/zip/ZipEntry;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/zip/ZipException;
        }
    .end annotation

    .prologue
    .line 97
    invoke-direct {p0, p1}, Lorg/apache/tools/zip/ZipEntry;-><init>(Ljava/util/zip/ZipEntry;)V

    .line 98
    invoke-virtual {p1}, Lorg/apache/tools/zip/ZipEntry;->getInternalAttributes()I

    move-result v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/zip/ZipEntry;->setInternalAttributes(I)V

    .line 99
    invoke-virtual {p1}, Lorg/apache/tools/zip/ZipEntry;->getExternalAttributes()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lorg/apache/tools/zip/ZipEntry;->setExternalAttributes(J)V

    .line 100
    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lorg/apache/tools/zip/ZipEntry;->getExtraFields(Z)[Lorg/apache/tools/zip/ZipExtraField;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/zip/ZipEntry;->setExtraFields([Lorg/apache/tools/zip/ZipExtraField;)V

    .line 101
    return-void
.end method

.method private mergeExtraFields([Lorg/apache/tools/zip/ZipExtraField;Z)V
    .locals 5
    .param p1, "f"    # [Lorg/apache/tools/zip/ZipExtraField;
    .param p2, "local"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/zip/ZipException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 489
    iget-object v3, p0, Lorg/apache/tools/zip/ZipEntry;->extraFields:Ljava/util/LinkedHashMap;

    if-nez v3, :cond_0

    .line 490
    invoke-virtual {p0, p1}, Lorg/apache/tools/zip/ZipEntry;->setExtraFields([Lorg/apache/tools/zip/ZipExtraField;)V

    .line 516
    :goto_0
    return-void

    .line 492
    :cond_0
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    array-length v3, p1

    if-ge v2, v3, :cond_5

    .line 494
    aget-object v3, p1, v2

    instance-of v3, v3, Lorg/apache/tools/zip/UnparseableExtraFieldData;

    if-eqz v3, :cond_1

    .line 495
    iget-object v1, p0, Lorg/apache/tools/zip/ZipEntry;->unparseableExtra:Lorg/apache/tools/zip/UnparseableExtraFieldData;

    .line 499
    .local v1, "existing":Lorg/apache/tools/zip/ZipExtraField;
    :goto_2
    if-nez v1, :cond_2

    .line 500
    aget-object v3, p1, v2

    invoke-virtual {p0, v3}, Lorg/apache/tools/zip/ZipEntry;->addExtraField(Lorg/apache/tools/zip/ZipExtraField;)V

    .line 492
    .end local v1    # "existing":Lorg/apache/tools/zip/ZipExtraField;
    :goto_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 497
    :cond_1
    aget-object v3, p1, v2

    invoke-interface {v3}, Lorg/apache/tools/zip/ZipExtraField;->getHeaderId()Lorg/apache/tools/zip/ZipShort;

    move-result-object v3

    invoke-virtual {p0, v3}, Lorg/apache/tools/zip/ZipEntry;->getExtraField(Lorg/apache/tools/zip/ZipShort;)Lorg/apache/tools/zip/ZipExtraField;

    move-result-object v1

    .restart local v1    # "existing":Lorg/apache/tools/zip/ZipExtraField;
    goto :goto_2

    .line 502
    :cond_2
    if-nez p2, :cond_3

    instance-of v3, v1, Lorg/apache/tools/zip/CentralDirectoryParsingZipExtraField;

    if-nez v3, :cond_4

    .line 505
    :cond_3
    aget-object v3, p1, v2

    invoke-interface {v3}, Lorg/apache/tools/zip/ZipExtraField;->getLocalFileDataData()[B

    move-result-object v0

    .line 506
    .local v0, "b":[B
    array-length v3, v0

    invoke-interface {v1, v0, v4, v3}, Lorg/apache/tools/zip/ZipExtraField;->parseFromLocalFileData([BII)V

    goto :goto_3

    .line 508
    .end local v0    # "b":[B
    :cond_4
    aget-object v3, p1, v2

    invoke-interface {v3}, Lorg/apache/tools/zip/ZipExtraField;->getCentralDirectoryData()[B

    move-result-object v0

    .line 509
    .restart local v0    # "b":[B
    check-cast v1, Lorg/apache/tools/zip/CentralDirectoryParsingZipExtraField;

    .end local v1    # "existing":Lorg/apache/tools/zip/ZipExtraField;
    array-length v3, v0

    invoke-interface {v1, v0, v4, v3}, Lorg/apache/tools/zip/CentralDirectoryParsingZipExtraField;->parseFromCentralDirectoryData([BII)V

    goto :goto_3

    .line 514
    .end local v0    # "b":[B
    :cond_5
    invoke-virtual {p0}, Lorg/apache/tools/zip/ZipEntry;->setExtra()V

    goto :goto_0
.end method


# virtual methods
.method public addAsFirstExtraField(Lorg/apache/tools/zip/ZipExtraField;)V
    .locals 3
    .param p1, "ze"    # Lorg/apache/tools/zip/ZipExtraField;

    .prologue
    .line 286
    instance-of v1, p1, Lorg/apache/tools/zip/UnparseableExtraFieldData;

    if-eqz v1, :cond_1

    .line 287
    check-cast p1, Lorg/apache/tools/zip/UnparseableExtraFieldData;

    .end local p1    # "ze":Lorg/apache/tools/zip/ZipExtraField;
    iput-object p1, p0, Lorg/apache/tools/zip/ZipEntry;->unparseableExtra:Lorg/apache/tools/zip/UnparseableExtraFieldData;

    .line 297
    :cond_0
    :goto_0
    invoke-virtual {p0}, Lorg/apache/tools/zip/ZipEntry;->setExtra()V

    .line 298
    return-void

    .line 289
    .restart local p1    # "ze":Lorg/apache/tools/zip/ZipExtraField;
    :cond_1
    iget-object v0, p0, Lorg/apache/tools/zip/ZipEntry;->extraFields:Ljava/util/LinkedHashMap;

    .line 290
    .local v0, "copy":Ljava/util/LinkedHashMap;
    new-instance v1, Ljava/util/LinkedHashMap;

    invoke-direct {v1}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v1, p0, Lorg/apache/tools/zip/ZipEntry;->extraFields:Ljava/util/LinkedHashMap;

    .line 291
    iget-object v1, p0, Lorg/apache/tools/zip/ZipEntry;->extraFields:Ljava/util/LinkedHashMap;

    invoke-interface {p1}, Lorg/apache/tools/zip/ZipExtraField;->getHeaderId()Lorg/apache/tools/zip/ZipShort;

    move-result-object v2

    invoke-virtual {v1, v2, p1}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 292
    if-eqz v0, :cond_0

    .line 293
    invoke-interface {p1}, Lorg/apache/tools/zip/ZipExtraField;->getHeaderId()Lorg/apache/tools/zip/ZipShort;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/LinkedHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 294
    iget-object v1, p0, Lorg/apache/tools/zip/ZipEntry;->extraFields:Ljava/util/LinkedHashMap;

    invoke-virtual {v1, v0}, Ljava/util/LinkedHashMap;->putAll(Ljava/util/Map;)V

    goto :goto_0
.end method

.method public addExtraField(Lorg/apache/tools/zip/ZipExtraField;)V
    .locals 2
    .param p1, "ze"    # Lorg/apache/tools/zip/ZipExtraField;

    .prologue
    .line 266
    instance-of v0, p1, Lorg/apache/tools/zip/UnparseableExtraFieldData;

    if-eqz v0, :cond_0

    .line 267
    check-cast p1, Lorg/apache/tools/zip/UnparseableExtraFieldData;

    .end local p1    # "ze":Lorg/apache/tools/zip/ZipExtraField;
    iput-object p1, p0, Lorg/apache/tools/zip/ZipEntry;->unparseableExtra:Lorg/apache/tools/zip/UnparseableExtraFieldData;

    .line 274
    :goto_0
    invoke-virtual {p0}, Lorg/apache/tools/zip/ZipEntry;->setExtra()V

    .line 275
    return-void

    .line 269
    .restart local p1    # "ze":Lorg/apache/tools/zip/ZipExtraField;
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/zip/ZipEntry;->extraFields:Ljava/util/LinkedHashMap;

    if-nez v0, :cond_1

    .line 270
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/zip/ZipEntry;->extraFields:Ljava/util/LinkedHashMap;

    .line 272
    :cond_1
    iget-object v0, p0, Lorg/apache/tools/zip/ZipEntry;->extraFields:Ljava/util/LinkedHashMap;

    invoke-interface {p1}, Lorg/apache/tools/zip/ZipExtraField;->getHeaderId()Lorg/apache/tools/zip/ZipShort;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method

.method public clone()Ljava/lang/Object;
    .locals 4

    .prologue
    .line 116
    invoke-super {p0}, Ljava/util/zip/ZipEntry;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/zip/ZipEntry;

    .line 118
    .local v0, "e":Lorg/apache/tools/zip/ZipEntry;
    invoke-virtual {p0}, Lorg/apache/tools/zip/ZipEntry;->getInternalAttributes()I

    move-result v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/zip/ZipEntry;->setInternalAttributes(I)V

    .line 119
    invoke-virtual {p0}, Lorg/apache/tools/zip/ZipEntry;->getExternalAttributes()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Lorg/apache/tools/zip/ZipEntry;->setExternalAttributes(J)V

    .line 120
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lorg/apache/tools/zip/ZipEntry;->getExtraFields(Z)[Lorg/apache/tools/zip/ZipExtraField;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/zip/ZipEntry;->setExtraFields([Lorg/apache/tools/zip/ZipExtraField;)V

    .line 121
    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 476
    if-ne p0, p1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getCentralDirectoryExtra()[B
    .locals 1

    .prologue
    .line 411
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lorg/apache/tools/zip/ZipEntry;->getExtraFields(Z)[Lorg/apache/tools/zip/ZipExtraField;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/tools/zip/ExtraFieldUtils;->mergeCentralDirectoryData([Lorg/apache/tools/zip/ZipExtraField;)[B

    move-result-object v0

    return-object v0
.end method

.method public getExternalAttributes()J
    .locals 2

    .prologue
    .line 149
    iget-wide v0, p0, Lorg/apache/tools/zip/ZipEntry;->externalAttributes:J

    return-wide v0
.end method

.method public getExtraField(Lorg/apache/tools/zip/ZipShort;)Lorg/apache/tools/zip/ZipExtraField;
    .locals 1
    .param p1, "type"    # Lorg/apache/tools/zip/ZipShort;

    .prologue
    .line 332
    iget-object v0, p0, Lorg/apache/tools/zip/ZipEntry;->extraFields:Ljava/util/LinkedHashMap;

    if-eqz v0, :cond_0

    .line 333
    iget-object v0, p0, Lorg/apache/tools/zip/ZipEntry;->extraFields:Ljava/util/LinkedHashMap;

    invoke-virtual {v0, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/zip/ZipExtraField;

    .line 335
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getExtraFields()[Lorg/apache/tools/zip/ZipExtraField;
    .locals 1

    .prologue
    .line 232
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/apache/tools/zip/ZipEntry;->getExtraFields(Z)[Lorg/apache/tools/zip/ZipExtraField;

    move-result-object v0

    return-object v0
.end method

.method public getExtraFields(Z)[Lorg/apache/tools/zip/ZipExtraField;
    .locals 4
    .param p1, "includeUnparseable"    # Z

    .prologue
    const/4 v3, 0x0

    .line 244
    iget-object v1, p0, Lorg/apache/tools/zip/ZipEntry;->extraFields:Ljava/util/LinkedHashMap;

    if-nez v1, :cond_2

    .line 245
    if-eqz p1, :cond_0

    iget-object v1, p0, Lorg/apache/tools/zip/ZipEntry;->unparseableExtra:Lorg/apache/tools/zip/UnparseableExtraFieldData;

    if-nez v1, :cond_1

    :cond_0
    new-array v1, v3, [Lorg/apache/tools/zip/ZipExtraField;

    .line 253
    :goto_0
    return-object v1

    .line 245
    :cond_1
    const/4 v1, 0x1

    new-array v1, v1, [Lorg/apache/tools/zip/ZipExtraField;

    iget-object v2, p0, Lorg/apache/tools/zip/ZipEntry;->unparseableExtra:Lorg/apache/tools/zip/UnparseableExtraFieldData;

    aput-object v2, v1, v3

    goto :goto_0

    .line 249
    :cond_2
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lorg/apache/tools/zip/ZipEntry;->extraFields:Ljava/util/LinkedHashMap;

    invoke-virtual {v1}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 250
    .local v0, "result":Ljava/util/List;
    if-eqz p1, :cond_3

    iget-object v1, p0, Lorg/apache/tools/zip/ZipEntry;->unparseableExtra:Lorg/apache/tools/zip/UnparseableExtraFieldData;

    if-eqz v1, :cond_3

    .line 251
    iget-object v1, p0, Lorg/apache/tools/zip/ZipEntry;->unparseableExtra:Lorg/apache/tools/zip/UnparseableExtraFieldData;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 253
    :cond_3
    new-array v1, v3, [Lorg/apache/tools/zip/ZipExtraField;

    invoke-interface {v0, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Lorg/apache/tools/zip/ZipExtraField;

    goto :goto_0
.end method

.method public getInternalAttributes()I
    .locals 1

    .prologue
    .line 131
    iget v0, p0, Lorg/apache/tools/zip/ZipEntry;->internalAttributes:I

    return v0
.end method

.method public getLocalFileDataExtra()[B
    .locals 2

    .prologue
    .line 401
    invoke-virtual {p0}, Lorg/apache/tools/zip/ZipEntry;->getExtra()[B

    move-result-object v0

    .line 402
    .local v0, "extra":[B
    if-eqz v0, :cond_0

    .end local v0    # "extra":[B
    :goto_0
    return-object v0

    .restart local v0    # "extra":[B
    :cond_0
    const/4 v1, 0x0

    new-array v0, v1, [B

    goto :goto_0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 434
    iget-object v0, p0, Lorg/apache/tools/zip/ZipEntry;->name:Ljava/lang/String;

    if-nez v0, :cond_0

    invoke-super {p0}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lorg/apache/tools/zip/ZipEntry;->name:Ljava/lang/String;

    goto :goto_0
.end method

.method public getPlatform()I
    .locals 1

    .prologue
    .line 198
    iget v0, p0, Lorg/apache/tools/zip/ZipEntry;->platform:I

    return v0
.end method

.method public getUnixMode()I
    .locals 4

    .prologue
    .line 184
    iget v0, p0, Lorg/apache/tools/zip/ZipEntry;->platform:I

    const/4 v1, 0x3

    if-eq v0, v1, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/zip/ZipEntry;->getExternalAttributes()J

    move-result-wide v0

    const/16 v2, 0x10

    shr-long/2addr v0, v2

    const-wide/32 v2, 0xffff

    and-long/2addr v0, v2

    long-to-int v0, v0

    goto :goto_0
.end method

.method public getUnparseableExtraFieldData()Lorg/apache/tools/zip/UnparseableExtraFieldData;
    .locals 1

    .prologue
    .line 344
    iget-object v0, p0, Lorg/apache/tools/zip/ZipEntry;->unparseableExtra:Lorg/apache/tools/zip/UnparseableExtraFieldData;

    return-object v0
.end method

.method public hashCode()I
    .locals 1

    .prologue
    .line 465
    invoke-virtual {p0}, Lorg/apache/tools/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    return v0
.end method

.method public isDirectory()Z
    .locals 2

    .prologue
    .line 443
    invoke-virtual {p0}, Lorg/apache/tools/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public removeExtraField(Lorg/apache/tools/zip/ZipShort;)V
    .locals 1
    .param p1, "type"    # Lorg/apache/tools/zip/ZipShort;

    .prologue
    .line 306
    iget-object v0, p0, Lorg/apache/tools/zip/ZipEntry;->extraFields:Ljava/util/LinkedHashMap;

    if-nez v0, :cond_0

    .line 307
    new-instance v0, Ljava/util/NoSuchElementException;

    invoke-direct {v0}, Ljava/util/NoSuchElementException;-><init>()V

    throw v0

    .line 309
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/zip/ZipEntry;->extraFields:Ljava/util/LinkedHashMap;

    invoke-virtual {v0, p1}, Ljava/util/LinkedHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_1

    .line 310
    new-instance v0, Ljava/util/NoSuchElementException;

    invoke-direct {v0}, Ljava/util/NoSuchElementException;-><init>()V

    throw v0

    .line 312
    :cond_1
    invoke-virtual {p0}, Lorg/apache/tools/zip/ZipEntry;->setExtra()V

    .line 313
    return-void
.end method

.method public removeUnparseableExtraFieldData()V
    .locals 1

    .prologue
    .line 319
    iget-object v0, p0, Lorg/apache/tools/zip/ZipEntry;->unparseableExtra:Lorg/apache/tools/zip/UnparseableExtraFieldData;

    if-nez v0, :cond_0

    .line 320
    new-instance v0, Ljava/util/NoSuchElementException;

    invoke-direct {v0}, Ljava/util/NoSuchElementException;-><init>()V

    throw v0

    .line 322
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/zip/ZipEntry;->unparseableExtra:Lorg/apache/tools/zip/UnparseableExtraFieldData;

    .line 323
    invoke-virtual {p0}, Lorg/apache/tools/zip/ZipEntry;->setExtra()V

    .line 324
    return-void
.end method

.method public setCentralDirectoryExtra([B)V
    .locals 4
    .param p1, "b"    # [B

    .prologue
    .line 386
    const/4 v2, 0x0

    :try_start_0
    sget-object v3, Lorg/apache/tools/zip/ExtraFieldUtils$UnparseableExtraField;->READ:Lorg/apache/tools/zip/ExtraFieldUtils$UnparseableExtraField;

    invoke-static {p1, v2, v3}, Lorg/apache/tools/zip/ExtraFieldUtils;->parse([BZLorg/apache/tools/zip/ExtraFieldUtils$UnparseableExtraField;)[Lorg/apache/tools/zip/ZipExtraField;

    move-result-object v0

    .line 389
    .local v0, "central":[Lorg/apache/tools/zip/ZipExtraField;
    const/4 v2, 0x0

    invoke-direct {p0, v0, v2}, Lorg/apache/tools/zip/ZipEntry;->mergeExtraFields([Lorg/apache/tools/zip/ZipExtraField;Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 393
    return-void

    .line 390
    .end local v0    # "central":[Lorg/apache/tools/zip/ZipExtraField;
    :catch_0
    move-exception v1

    .line 391
    .local v1, "e":Ljava/lang/Exception;
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method

.method public setComprSize(J)V
    .locals 1
    .param p1, "size"    # J

    .prologue
    .line 425
    invoke-virtual {p0, p1, p2}, Lorg/apache/tools/zip/ZipEntry;->setCompressedSize(J)V

    .line 426
    return-void
.end method

.method public setExternalAttributes(J)V
    .locals 1
    .param p1, "value"    # J

    .prologue
    .line 158
    iput-wide p1, p0, Lorg/apache/tools/zip/ZipEntry;->externalAttributes:J

    .line 159
    return-void
.end method

.method protected setExtra()V
    .locals 1

    .prologue
    .line 378
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lorg/apache/tools/zip/ZipEntry;->getExtraFields(Z)[Lorg/apache/tools/zip/ZipExtraField;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/tools/zip/ExtraFieldUtils;->mergeLocalFileDataData([Lorg/apache/tools/zip/ZipExtraField;)[B

    move-result-object v0

    invoke-super {p0, v0}, Ljava/util/zip/ZipEntry;->setExtra([B)V

    .line 379
    return-void
.end method

.method public setExtra([B)V
    .locals 5
    .param p1, "extra"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/RuntimeException;
        }
    .end annotation

    .prologue
    .line 358
    const/4 v2, 0x1

    :try_start_0
    sget-object v3, Lorg/apache/tools/zip/ExtraFieldUtils$UnparseableExtraField;->READ:Lorg/apache/tools/zip/ExtraFieldUtils$UnparseableExtraField;

    invoke-static {p1, v2, v3}, Lorg/apache/tools/zip/ExtraFieldUtils;->parse([BZLorg/apache/tools/zip/ExtraFieldUtils$UnparseableExtraField;)[Lorg/apache/tools/zip/ZipExtraField;

    move-result-object v1

    .line 361
    .local v1, "local":[Lorg/apache/tools/zip/ZipExtraField;
    const/4 v2, 0x1

    invoke-direct {p0, v1, v2}, Lorg/apache/tools/zip/ZipEntry;->mergeExtraFields([Lorg/apache/tools/zip/ZipExtraField;Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 367
    return-void

    .line 362
    .end local v1    # "local":[Lorg/apache/tools/zip/ZipExtraField;
    :catch_0
    move-exception v0

    .line 364
    .local v0, "e":Ljava/lang/Exception;
    new-instance v2, Ljava/lang/RuntimeException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "Error parsing extra fields for entry: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {p0}, Lorg/apache/tools/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, " - "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method

.method public setExtraFields([Lorg/apache/tools/zip/ZipExtraField;)V
    .locals 4
    .param p1, "fields"    # [Lorg/apache/tools/zip/ZipExtraField;

    .prologue
    .line 216
    new-instance v1, Ljava/util/LinkedHashMap;

    invoke-direct {v1}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v1, p0, Lorg/apache/tools/zip/ZipEntry;->extraFields:Ljava/util/LinkedHashMap;

    .line 217
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v1, p1

    if-ge v0, v1, :cond_1

    .line 218
    aget-object v1, p1, v0

    instance-of v1, v1, Lorg/apache/tools/zip/UnparseableExtraFieldData;

    if-eqz v1, :cond_0

    .line 219
    aget-object v1, p1, v0

    check-cast v1, Lorg/apache/tools/zip/UnparseableExtraFieldData;

    iput-object v1, p0, Lorg/apache/tools/zip/ZipEntry;->unparseableExtra:Lorg/apache/tools/zip/UnparseableExtraFieldData;

    .line 217
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 221
    :cond_0
    iget-object v1, p0, Lorg/apache/tools/zip/ZipEntry;->extraFields:Ljava/util/LinkedHashMap;

    aget-object v2, p1, v0

    invoke-interface {v2}, Lorg/apache/tools/zip/ZipExtraField;->getHeaderId()Lorg/apache/tools/zip/ZipShort;

    move-result-object v2

    aget-object v3, p1, v0

    invoke-virtual {v1, v2, v3}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 224
    :cond_1
    invoke-virtual {p0}, Lorg/apache/tools/zip/ZipEntry;->setExtra()V

    .line 225
    return-void
.end method

.method public setInternalAttributes(I)V
    .locals 0
    .param p1, "value"    # I

    .prologue
    .line 140
    iput p1, p0, Lorg/apache/tools/zip/ZipEntry;->internalAttributes:I

    .line 141
    return-void
.end method

.method protected setName(Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 451
    iput-object p1, p0, Lorg/apache/tools/zip/ZipEntry;->name:Ljava/lang/String;

    .line 452
    return-void
.end method

.method protected setPlatform(I)V
    .locals 0
    .param p1, "platform"    # I

    .prologue
    .line 207
    iput p1, p0, Lorg/apache/tools/zip/ZipEntry;->platform:I

    .line 208
    return-void
.end method

.method public setUnixMode(I)V
    .locals 3
    .param p1, "mode"    # I

    .prologue
    const/4 v1, 0x0

    .line 169
    shl-int/lit8 v2, p1, 0x10

    and-int/lit16 v0, p1, 0x80

    if-nez v0, :cond_1

    const/4 v0, 0x1

    :goto_0
    or-int/2addr v0, v2

    invoke-virtual {p0}, Lorg/apache/tools/zip/ZipEntry;->isDirectory()Z

    move-result v2

    if-eqz v2, :cond_0

    const/16 v1, 0x10

    :cond_0
    or-int/2addr v0, v1

    int-to-long v0, v0

    invoke-virtual {p0, v0, v1}, Lorg/apache/tools/zip/ZipEntry;->setExternalAttributes(J)V

    .line 175
    const/4 v0, 0x3

    iput v0, p0, Lorg/apache/tools/zip/ZipEntry;->platform:I

    .line 176
    return-void

    :cond_1
    move v0, v1

    .line 169
    goto :goto_0
.end method
