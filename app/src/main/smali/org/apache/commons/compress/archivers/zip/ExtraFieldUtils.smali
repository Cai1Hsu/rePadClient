.class public Lorg/apache/commons/compress/archivers/zip/ExtraFieldUtils;
.super Ljava/lang/Object;
.source "ExtraFieldUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/commons/compress/archivers/zip/ExtraFieldUtils$UnparseableExtraField;
    }
.end annotation


# static fields
.field private static final WORD:I = 0x4

.field private static final implementations:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lorg/apache/commons/compress/archivers/zip/ZipShort;",
            "Ljava/lang/Class",
            "<*>;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 41
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lorg/apache/commons/compress/archivers/zip/ExtraFieldUtils;->implementations:Ljava/util/Map;

    .line 42
    const-class v0, Lorg/apache/commons/compress/archivers/zip/AsiExtraField;

    invoke-static {v0}, Lorg/apache/commons/compress/archivers/zip/ExtraFieldUtils;->register(Ljava/lang/Class;)V

    .line 43
    const-class v0, Lorg/apache/commons/compress/archivers/zip/JarMarker;

    invoke-static {v0}, Lorg/apache/commons/compress/archivers/zip/ExtraFieldUtils;->register(Ljava/lang/Class;)V

    .line 44
    const-class v0, Lorg/apache/commons/compress/archivers/zip/UnicodePathExtraField;

    invoke-static {v0}, Lorg/apache/commons/compress/archivers/zip/ExtraFieldUtils;->register(Ljava/lang/Class;)V

    .line 45
    const-class v0, Lorg/apache/commons/compress/archivers/zip/UnicodeCommentExtraField;

    invoke-static {v0}, Lorg/apache/commons/compress/archivers/zip/ExtraFieldUtils;->register(Ljava/lang/Class;)V

    .line 46
    const-class v0, Lorg/apache/commons/compress/archivers/zip/Zip64ExtendedInformationExtraField;

    invoke-static {v0}, Lorg/apache/commons/compress/archivers/zip/ExtraFieldUtils;->register(Ljava/lang/Class;)V

    .line 47
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 261
    return-void
.end method

.method public static createExtraField(Lorg/apache/commons/compress/archivers/zip/ZipShort;)Lorg/apache/commons/compress/archivers/zip/ZipExtraField;
    .locals 3
    .param p0, "headerId"    # Lorg/apache/commons/compress/archivers/zip/ZipShort;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InstantiationException;,
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .prologue
    .line 79
    sget-object v2, Lorg/apache/commons/compress/archivers/zip/ExtraFieldUtils;->implementations:Ljava/util/Map;

    invoke-interface {v2, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Class;

    .line 80
    .local v0, "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-eqz v0, :cond_0

    .line 81
    invoke-virtual {v0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/commons/compress/archivers/zip/ZipExtraField;

    .line 85
    :goto_0
    return-object v2

    .line 83
    :cond_0
    new-instance v1, Lorg/apache/commons/compress/archivers/zip/UnrecognizedExtraField;

    invoke-direct {v1}, Lorg/apache/commons/compress/archivers/zip/UnrecognizedExtraField;-><init>()V

    .line 84
    .local v1, "u":Lorg/apache/commons/compress/archivers/zip/UnrecognizedExtraField;
    invoke-virtual {v1, p0}, Lorg/apache/commons/compress/archivers/zip/UnrecognizedExtraField;->setHeaderId(Lorg/apache/commons/compress/archivers/zip/ZipShort;)V

    move-object v2, v1

    .line 85
    goto :goto_0
.end method

.method public static mergeCentralDirectoryData([Lorg/apache/commons/compress/archivers/zip/ZipExtraField;)[B
    .locals 15
    .param p0, "data"    # [Lorg/apache/commons/compress/archivers/zip/ZipExtraField;

    .prologue
    const/4 v14, 0x2

    const/4 v11, 0x0

    .line 228
    array-length v12, p0

    if-lez v12, :cond_0

    array-length v12, p0

    add-int/lit8 v12, v12, -0x1

    aget-object v12, p0, v12

    instance-of v12, v12, Lorg/apache/commons/compress/archivers/zip/UnparseableExtraFieldData;

    if-eqz v12, :cond_0

    const/4 v4, 0x1

    .line 230
    .local v4, "lastIsUnparseableHolder":Z
    :goto_0
    if-eqz v4, :cond_1

    array-length v12, p0

    add-int/lit8 v7, v12, -0x1

    .line 233
    .local v7, "regularExtraFieldCount":I
    :goto_1
    mul-int/lit8 v10, v7, 0x4

    .line 234
    .local v10, "sum":I
    move-object v0, p0

    .local v0, "arr$":[Lorg/apache/commons/compress/archivers/zip/ZipExtraField;
    array-length v5, v0

    .local v5, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_2
    if-ge v3, v5, :cond_2

    aget-object v1, v0, v3

    .line 235
    .local v1, "element":Lorg/apache/commons/compress/archivers/zip/ZipExtraField;
    invoke-interface {v1}, Lorg/apache/commons/compress/archivers/zip/ZipExtraField;->getCentralDirectoryLength()Lorg/apache/commons/compress/archivers/zip/ZipShort;

    move-result-object v12

    invoke-virtual {v12}, Lorg/apache/commons/compress/archivers/zip/ZipShort;->getValue()I

    move-result v12

    add-int/2addr v10, v12

    .line 234
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .end local v0    # "arr$":[Lorg/apache/commons/compress/archivers/zip/ZipExtraField;
    .end local v1    # "element":Lorg/apache/commons/compress/archivers/zip/ZipExtraField;
    .end local v3    # "i$":I
    .end local v4    # "lastIsUnparseableHolder":Z
    .end local v5    # "len$":I
    .end local v7    # "regularExtraFieldCount":I
    .end local v10    # "sum":I
    :cond_0
    move v4, v11

    .line 228
    goto :goto_0

    .line 230
    .restart local v4    # "lastIsUnparseableHolder":Z
    :cond_1
    array-length v7, p0

    goto :goto_1

    .line 237
    .restart local v0    # "arr$":[Lorg/apache/commons/compress/archivers/zip/ZipExtraField;
    .restart local v3    # "i$":I
    .restart local v5    # "len$":I
    .restart local v7    # "regularExtraFieldCount":I
    .restart local v10    # "sum":I
    :cond_2
    new-array v8, v10, [B

    .line 238
    .local v8, "result":[B
    const/4 v9, 0x0

    .line 239
    .local v9, "start":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_3
    if-ge v2, v7, :cond_3

    .line 240
    aget-object v12, p0, v2

    invoke-interface {v12}, Lorg/apache/commons/compress/archivers/zip/ZipExtraField;->getHeaderId()Lorg/apache/commons/compress/archivers/zip/ZipShort;

    move-result-object v12

    invoke-virtual {v12}, Lorg/apache/commons/compress/archivers/zip/ZipShort;->getBytes()[B

    move-result-object v12

    invoke-static {v12, v11, v8, v9, v14}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 242
    aget-object v12, p0, v2

    invoke-interface {v12}, Lorg/apache/commons/compress/archivers/zip/ZipExtraField;->getCentralDirectoryLength()Lorg/apache/commons/compress/archivers/zip/ZipShort;

    move-result-object v12

    invoke-virtual {v12}, Lorg/apache/commons/compress/archivers/zip/ZipShort;->getBytes()[B

    move-result-object v12

    add-int/lit8 v13, v9, 0x2

    invoke-static {v12, v11, v8, v13, v14}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 244
    aget-object v12, p0, v2

    invoke-interface {v12}, Lorg/apache/commons/compress/archivers/zip/ZipExtraField;->getCentralDirectoryData()[B

    move-result-object v6

    .line 245
    .local v6, "local":[B
    add-int/lit8 v12, v9, 0x4

    array-length v13, v6

    invoke-static {v6, v11, v8, v12, v13}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 246
    array-length v12, v6

    add-int/lit8 v12, v12, 0x4

    add-int/2addr v9, v12

    .line 239
    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    .line 248
    .end local v6    # "local":[B
    :cond_3
    if-eqz v4, :cond_4

    .line 249
    array-length v12, p0

    add-int/lit8 v12, v12, -0x1

    aget-object v12, p0, v12

    invoke-interface {v12}, Lorg/apache/commons/compress/archivers/zip/ZipExtraField;->getCentralDirectoryData()[B

    move-result-object v6

    .line 250
    .restart local v6    # "local":[B
    array-length v12, v6

    invoke-static {v6, v11, v8, v9, v12}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 252
    .end local v6    # "local":[B
    :cond_4
    return-object v8
.end method

.method public static mergeLocalFileDataData([Lorg/apache/commons/compress/archivers/zip/ZipExtraField;)[B
    .locals 15
    .param p0, "data"    # [Lorg/apache/commons/compress/archivers/zip/ZipExtraField;

    .prologue
    const/4 v14, 0x2

    const/4 v11, 0x0

    .line 194
    array-length v12, p0

    if-lez v12, :cond_0

    array-length v12, p0

    add-int/lit8 v12, v12, -0x1

    aget-object v12, p0, v12

    instance-of v12, v12, Lorg/apache/commons/compress/archivers/zip/UnparseableExtraFieldData;

    if-eqz v12, :cond_0

    const/4 v4, 0x1

    .line 196
    .local v4, "lastIsUnparseableHolder":Z
    :goto_0
    if-eqz v4, :cond_1

    array-length v12, p0

    add-int/lit8 v7, v12, -0x1

    .line 199
    .local v7, "regularExtraFieldCount":I
    :goto_1
    mul-int/lit8 v10, v7, 0x4

    .line 200
    .local v10, "sum":I
    move-object v0, p0

    .local v0, "arr$":[Lorg/apache/commons/compress/archivers/zip/ZipExtraField;
    array-length v5, v0

    .local v5, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_2
    if-ge v3, v5, :cond_2

    aget-object v1, v0, v3

    .line 201
    .local v1, "element":Lorg/apache/commons/compress/archivers/zip/ZipExtraField;
    invoke-interface {v1}, Lorg/apache/commons/compress/archivers/zip/ZipExtraField;->getLocalFileDataLength()Lorg/apache/commons/compress/archivers/zip/ZipShort;

    move-result-object v12

    invoke-virtual {v12}, Lorg/apache/commons/compress/archivers/zip/ZipShort;->getValue()I

    move-result v12

    add-int/2addr v10, v12

    .line 200
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .end local v0    # "arr$":[Lorg/apache/commons/compress/archivers/zip/ZipExtraField;
    .end local v1    # "element":Lorg/apache/commons/compress/archivers/zip/ZipExtraField;
    .end local v3    # "i$":I
    .end local v4    # "lastIsUnparseableHolder":Z
    .end local v5    # "len$":I
    .end local v7    # "regularExtraFieldCount":I
    .end local v10    # "sum":I
    :cond_0
    move v4, v11

    .line 194
    goto :goto_0

    .line 196
    .restart local v4    # "lastIsUnparseableHolder":Z
    :cond_1
    array-length v7, p0

    goto :goto_1

    .line 204
    .restart local v0    # "arr$":[Lorg/apache/commons/compress/archivers/zip/ZipExtraField;
    .restart local v3    # "i$":I
    .restart local v5    # "len$":I
    .restart local v7    # "regularExtraFieldCount":I
    .restart local v10    # "sum":I
    :cond_2
    new-array v8, v10, [B

    .line 205
    .local v8, "result":[B
    const/4 v9, 0x0

    .line 206
    .local v9, "start":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_3
    if-ge v2, v7, :cond_3

    .line 207
    aget-object v12, p0, v2

    invoke-interface {v12}, Lorg/apache/commons/compress/archivers/zip/ZipExtraField;->getHeaderId()Lorg/apache/commons/compress/archivers/zip/ZipShort;

    move-result-object v12

    invoke-virtual {v12}, Lorg/apache/commons/compress/archivers/zip/ZipShort;->getBytes()[B

    move-result-object v12

    invoke-static {v12, v11, v8, v9, v14}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 209
    aget-object v12, p0, v2

    invoke-interface {v12}, Lorg/apache/commons/compress/archivers/zip/ZipExtraField;->getLocalFileDataLength()Lorg/apache/commons/compress/archivers/zip/ZipShort;

    move-result-object v12

    invoke-virtual {v12}, Lorg/apache/commons/compress/archivers/zip/ZipShort;->getBytes()[B

    move-result-object v12

    add-int/lit8 v13, v9, 0x2

    invoke-static {v12, v11, v8, v13, v14}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 211
    aget-object v12, p0, v2

    invoke-interface {v12}, Lorg/apache/commons/compress/archivers/zip/ZipExtraField;->getLocalFileDataData()[B

    move-result-object v6

    .line 212
    .local v6, "local":[B
    add-int/lit8 v12, v9, 0x4

    array-length v13, v6

    invoke-static {v6, v11, v8, v12, v13}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 213
    array-length v12, v6

    add-int/lit8 v12, v12, 0x4

    add-int/2addr v9, v12

    .line 206
    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    .line 215
    .end local v6    # "local":[B
    :cond_3
    if-eqz v4, :cond_4

    .line 216
    array-length v12, p0

    add-int/lit8 v12, v12, -0x1

    aget-object v12, p0, v12

    invoke-interface {v12}, Lorg/apache/commons/compress/archivers/zip/ZipExtraField;->getLocalFileDataData()[B

    move-result-object v6

    .line 217
    .restart local v6    # "local":[B
    array-length v12, v6

    invoke-static {v6, v11, v8, v9, v12}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 219
    .end local v6    # "local":[B
    :cond_4
    return-object v8
.end method

.method public static parse([B)[Lorg/apache/commons/compress/archivers/zip/ZipExtraField;
    .locals 2
    .param p0, "data"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/zip/ZipException;
        }
    .end annotation

    .prologue
    .line 97
    const/4 v0, 0x1

    sget-object v1, Lorg/apache/commons/compress/archivers/zip/ExtraFieldUtils$UnparseableExtraField;->THROW:Lorg/apache/commons/compress/archivers/zip/ExtraFieldUtils$UnparseableExtraField;

    invoke-static {p0, v0, v1}, Lorg/apache/commons/compress/archivers/zip/ExtraFieldUtils;->parse([BZLorg/apache/commons/compress/archivers/zip/ExtraFieldUtils$UnparseableExtraField;)[Lorg/apache/commons/compress/archivers/zip/ZipExtraField;

    move-result-object v0

    return-object v0
.end method

.method public static parse([BZ)[Lorg/apache/commons/compress/archivers/zip/ZipExtraField;
    .locals 1
    .param p0, "data"    # [B
    .param p1, "local"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/zip/ZipException;
        }
    .end annotation

    .prologue
    .line 111
    sget-object v0, Lorg/apache/commons/compress/archivers/zip/ExtraFieldUtils$UnparseableExtraField;->THROW:Lorg/apache/commons/compress/archivers/zip/ExtraFieldUtils$UnparseableExtraField;

    invoke-static {p0, p1, v0}, Lorg/apache/commons/compress/archivers/zip/ExtraFieldUtils;->parse([BZLorg/apache/commons/compress/archivers/zip/ExtraFieldUtils$UnparseableExtraField;)[Lorg/apache/commons/compress/archivers/zip/ZipExtraField;

    move-result-object v0

    return-object v0
.end method

.method public static parse([BZLorg/apache/commons/compress/archivers/zip/ExtraFieldUtils$UnparseableExtraField;)[Lorg/apache/commons/compress/archivers/zip/ZipExtraField;
    .locals 12
    .param p0, "data"    # [B
    .param p1, "local"    # Z
    .param p2, "onUnparseableData"    # Lorg/apache/commons/compress/archivers/zip/ExtraFieldUtils$UnparseableExtraField;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/zip/ZipException;
        }
    .end annotation

    .prologue
    .line 130
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 131
    .local v7, "v":Ljava/util/List;, "Ljava/util/List<Lorg/apache/commons/compress/archivers/zip/ZipExtraField;>;"
    const/4 v6, 0x0

    .line 133
    .local v6, "start":I
    :goto_0
    array-length v9, p0

    add-int/lit8 v9, v9, -0x4

    if-gt v6, v9, :cond_0

    .line 134
    new-instance v1, Lorg/apache/commons/compress/archivers/zip/ZipShort;

    invoke-direct {v1, p0, v6}, Lorg/apache/commons/compress/archivers/zip/ZipShort;-><init>([BI)V

    .line 135
    .local v1, "headerId":Lorg/apache/commons/compress/archivers/zip/ZipShort;
    new-instance v9, Lorg/apache/commons/compress/archivers/zip/ZipShort;

    add-int/lit8 v10, v6, 0x2

    invoke-direct {v9, p0, v10}, Lorg/apache/commons/compress/archivers/zip/ZipShort;-><init>([BI)V

    invoke-virtual {v9}, Lorg/apache/commons/compress/archivers/zip/ZipShort;->getValue()I

    move-result v4

    .line 136
    .local v4, "length":I
    add-int/lit8 v9, v6, 0x4

    add-int/2addr v9, v4

    array-length v10, p0

    if-le v9, v10, :cond_2

    .line 137
    invoke-virtual {p2}, Lorg/apache/commons/compress/archivers/zip/ExtraFieldUtils$UnparseableExtraField;->getKey()I

    move-result v9

    packed-switch v9, :pswitch_data_0

    .line 163
    new-instance v9, Ljava/util/zip/ZipException;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v11, "unknown UnparseableExtraField key: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {p2}, Lorg/apache/commons/compress/archivers/zip/ExtraFieldUtils$UnparseableExtraField;->getKey()I

    move-result v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/util/zip/ZipException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 139
    :pswitch_0
    new-instance v9, Ljava/util/zip/ZipException;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v11, "bad extra field starting at "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string/jumbo v11, ".  Block length of "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string/jumbo v11, " bytes exceeds remaining"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string/jumbo v11, " data of "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    array-length v11, p0

    sub-int/2addr v11, v6

    add-int/lit8 v11, v11, -0x4

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string/jumbo v11, " bytes."

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/util/zip/ZipException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 146
    :pswitch_1
    new-instance v0, Lorg/apache/commons/compress/archivers/zip/UnparseableExtraFieldData;

    invoke-direct {v0}, Lorg/apache/commons/compress/archivers/zip/UnparseableExtraFieldData;-><init>()V

    .line 148
    .local v0, "field":Lorg/apache/commons/compress/archivers/zip/UnparseableExtraFieldData;
    if-eqz p1, :cond_1

    .line 149
    array-length v9, p0

    sub-int/2addr v9, v6

    invoke-virtual {v0, p0, v6, v9}, Lorg/apache/commons/compress/archivers/zip/UnparseableExtraFieldData;->parseFromLocalFileData([BII)V

    .line 155
    :goto_1
    invoke-interface {v7, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 184
    .end local v0    # "field":Lorg/apache/commons/compress/archivers/zip/UnparseableExtraFieldData;
    .end local v1    # "headerId":Lorg/apache/commons/compress/archivers/zip/ZipShort;
    .end local v4    # "length":I
    :cond_0
    :pswitch_2
    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v9

    new-array v5, v9, [Lorg/apache/commons/compress/archivers/zip/ZipExtraField;

    .line 185
    .local v5, "result":[Lorg/apache/commons/compress/archivers/zip/ZipExtraField;
    invoke-interface {v7, v5}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v9

    check-cast v9, [Lorg/apache/commons/compress/archivers/zip/ZipExtraField;

    return-object v9

    .line 152
    .end local v5    # "result":[Lorg/apache/commons/compress/archivers/zip/ZipExtraField;
    .restart local v0    # "field":Lorg/apache/commons/compress/archivers/zip/UnparseableExtraFieldData;
    .restart local v1    # "headerId":Lorg/apache/commons/compress/archivers/zip/ZipShort;
    .restart local v4    # "length":I
    :cond_1
    array-length v9, p0

    sub-int/2addr v9, v6

    invoke-virtual {v0, p0, v6, v9}, Lorg/apache/commons/compress/archivers/zip/UnparseableExtraFieldData;->parseFromCentralDirectoryData([BII)V

    goto :goto_1

    .line 168
    .end local v0    # "field":Lorg/apache/commons/compress/archivers/zip/UnparseableExtraFieldData;
    :cond_2
    :try_start_0
    invoke-static {v1}, Lorg/apache/commons/compress/archivers/zip/ExtraFieldUtils;->createExtraField(Lorg/apache/commons/compress/archivers/zip/ZipShort;)Lorg/apache/commons/compress/archivers/zip/ZipExtraField;

    move-result-object v8

    .line 169
    .local v8, "ze":Lorg/apache/commons/compress/archivers/zip/ZipExtraField;
    if-eqz p1, :cond_3

    .line 170
    add-int/lit8 v9, v6, 0x4

    invoke-interface {v8, p0, v9, v4}, Lorg/apache/commons/compress/archivers/zip/ZipExtraField;->parseFromLocalFileData([BII)V

    .line 175
    :goto_2
    invoke-interface {v7, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 181
    add-int/lit8 v9, v4, 0x4

    add-int/2addr v6, v9

    .line 182
    goto/16 :goto_0

    .line 172
    :cond_3
    add-int/lit8 v9, v6, 0x4

    invoke-interface {v8, p0, v9, v4}, Lorg/apache/commons/compress/archivers/zip/ZipExtraField;->parseFromCentralDirectoryData([BII)V
    :try_end_0
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_2

    .line 176
    .end local v8    # "ze":Lorg/apache/commons/compress/archivers/zip/ZipExtraField;
    :catch_0
    move-exception v3

    .line 177
    .local v3, "ie":Ljava/lang/InstantiationException;
    new-instance v9, Ljava/util/zip/ZipException;

    invoke-virtual {v3}, Ljava/lang/InstantiationException;->getMessage()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/util/zip/ZipException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 178
    .end local v3    # "ie":Ljava/lang/InstantiationException;
    :catch_1
    move-exception v2

    .line 179
    .local v2, "iae":Ljava/lang/IllegalAccessException;
    new-instance v9, Ljava/util/zip/ZipException;

    invoke-virtual {v2}, Ljava/lang/IllegalAccessException;->getMessage()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/util/zip/ZipException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 137
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method public static register(Ljava/lang/Class;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 58
    .local p0, "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/commons/compress/archivers/zip/ZipExtraField;

    .line 59
    .local v2, "ze":Lorg/apache/commons/compress/archivers/zip/ZipExtraField;
    sget-object v3, Lorg/apache/commons/compress/archivers/zip/ExtraFieldUtils;->implementations:Ljava/util/Map;

    invoke-interface {v2}, Lorg/apache/commons/compress/archivers/zip/ZipExtraField;->getHeaderId()Lorg/apache/commons/compress/archivers/zip/ZipShort;

    move-result-object v4

    invoke-interface {v3, v4, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_2

    .line 67
    return-void

    .line 60
    .end local v2    # "ze":Lorg/apache/commons/compress/archivers/zip/ZipExtraField;
    :catch_0
    move-exception v0

    .line 61
    .local v0, "cc":Ljava/lang/ClassCastException;
    new-instance v3, Ljava/lang/RuntimeException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, " doesn\'t implement ZipExtraField"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 62
    .end local v0    # "cc":Ljava/lang/ClassCastException;
    :catch_1
    move-exception v1

    .line 63
    .local v1, "ie":Ljava/lang/InstantiationException;
    new-instance v3, Ljava/lang/RuntimeException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, " is not a concrete class"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 64
    .end local v1    # "ie":Ljava/lang/InstantiationException;
    :catch_2
    move-exception v1

    .line 65
    .local v1, "ie":Ljava/lang/IllegalAccessException;
    new-instance v3, Ljava/lang/RuntimeException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "\'s no-arg constructor is not public"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v3
.end method
