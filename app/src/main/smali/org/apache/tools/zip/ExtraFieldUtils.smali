.class public Lorg/apache/tools/zip/ExtraFieldUtils;
.super Ljava/lang/Object;
.source "ExtraFieldUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/zip/ExtraFieldUtils$UnparseableExtraField;
    }
.end annotation


# static fields
.field private static final WORD:I = 0x4

.field static class$org$apache$tools$zip$AsiExtraField:Ljava/lang/Class;

.field static class$org$apache$tools$zip$JarMarker:Ljava/lang/Class;

.field static class$org$apache$tools$zip$UnicodeCommentExtraField:Ljava/lang/Class;

.field static class$org$apache$tools$zip$UnicodePathExtraField:Ljava/lang/Class;

.field private static final implementations:Ljava/util/Map;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 44
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lorg/apache/tools/zip/ExtraFieldUtils;->implementations:Ljava/util/Map;

    .line 45
    sget-object v0, Lorg/apache/tools/zip/ExtraFieldUtils;->class$org$apache$tools$zip$AsiExtraField:Ljava/lang/Class;

    if-nez v0, :cond_0

    const-string/jumbo v0, "org.apache.tools.zip.AsiExtraField"

    invoke-static {v0}, Lorg/apache/tools/zip/ExtraFieldUtils;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/zip/ExtraFieldUtils;->class$org$apache$tools$zip$AsiExtraField:Ljava/lang/Class;

    :goto_0
    invoke-static {v0}, Lorg/apache/tools/zip/ExtraFieldUtils;->register(Ljava/lang/Class;)V

    .line 46
    sget-object v0, Lorg/apache/tools/zip/ExtraFieldUtils;->class$org$apache$tools$zip$JarMarker:Ljava/lang/Class;

    if-nez v0, :cond_1

    const-string/jumbo v0, "org.apache.tools.zip.JarMarker"

    invoke-static {v0}, Lorg/apache/tools/zip/ExtraFieldUtils;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/zip/ExtraFieldUtils;->class$org$apache$tools$zip$JarMarker:Ljava/lang/Class;

    :goto_1
    invoke-static {v0}, Lorg/apache/tools/zip/ExtraFieldUtils;->register(Ljava/lang/Class;)V

    .line 47
    sget-object v0, Lorg/apache/tools/zip/ExtraFieldUtils;->class$org$apache$tools$zip$UnicodePathExtraField:Ljava/lang/Class;

    if-nez v0, :cond_2

    const-string/jumbo v0, "org.apache.tools.zip.UnicodePathExtraField"

    invoke-static {v0}, Lorg/apache/tools/zip/ExtraFieldUtils;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/zip/ExtraFieldUtils;->class$org$apache$tools$zip$UnicodePathExtraField:Ljava/lang/Class;

    :goto_2
    invoke-static {v0}, Lorg/apache/tools/zip/ExtraFieldUtils;->register(Ljava/lang/Class;)V

    .line 48
    sget-object v0, Lorg/apache/tools/zip/ExtraFieldUtils;->class$org$apache$tools$zip$UnicodeCommentExtraField:Ljava/lang/Class;

    if-nez v0, :cond_3

    const-string/jumbo v0, "org.apache.tools.zip.UnicodeCommentExtraField"

    invoke-static {v0}, Lorg/apache/tools/zip/ExtraFieldUtils;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/zip/ExtraFieldUtils;->class$org$apache$tools$zip$UnicodeCommentExtraField:Ljava/lang/Class;

    :goto_3
    invoke-static {v0}, Lorg/apache/tools/zip/ExtraFieldUtils;->register(Ljava/lang/Class;)V

    .line 49
    return-void

    .line 45
    :cond_0
    sget-object v0, Lorg/apache/tools/zip/ExtraFieldUtils;->class$org$apache$tools$zip$AsiExtraField:Ljava/lang/Class;

    goto :goto_0

    .line 46
    :cond_1
    sget-object v0, Lorg/apache/tools/zip/ExtraFieldUtils;->class$org$apache$tools$zip$JarMarker:Ljava/lang/Class;

    goto :goto_1

    .line 47
    :cond_2
    sget-object v0, Lorg/apache/tools/zip/ExtraFieldUtils;->class$org$apache$tools$zip$UnicodePathExtraField:Ljava/lang/Class;

    goto :goto_2

    .line 48
    :cond_3
    sget-object v0, Lorg/apache/tools/zip/ExtraFieldUtils;->class$org$apache$tools$zip$UnicodeCommentExtraField:Ljava/lang/Class;

    goto :goto_3
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 268
    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 45
    :try_start_0
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    :catch_0
    move-exception v0

    .local v0, "x1":Ljava/lang/ClassNotFoundException;
    new-instance v1, Ljava/lang/NoClassDefFoundError;

    invoke-direct {v1}, Ljava/lang/NoClassDefFoundError;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/NoClassDefFoundError;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    move-result-object v1

    throw v1
.end method

.method public static createExtraField(Lorg/apache/tools/zip/ZipShort;)Lorg/apache/tools/zip/ZipExtraField;
    .locals 3
    .param p0, "headerId"    # Lorg/apache/tools/zip/ZipShort;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InstantiationException;,
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .prologue
    .line 84
    sget-object v2, Lorg/apache/tools/zip/ExtraFieldUtils;->implementations:Ljava/util/Map;

    invoke-interface {v2, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Class;

    .line 85
    .local v0, "c":Ljava/lang/Class;
    if-eqz v0, :cond_0

    .line 86
    invoke-virtual {v0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/tools/zip/ZipExtraField;

    .line 90
    :goto_0
    return-object v2

    .line 88
    :cond_0
    new-instance v1, Lorg/apache/tools/zip/UnrecognizedExtraField;

    invoke-direct {v1}, Lorg/apache/tools/zip/UnrecognizedExtraField;-><init>()V

    .line 89
    .local v1, "u":Lorg/apache/tools/zip/UnrecognizedExtraField;
    invoke-virtual {v1, p0}, Lorg/apache/tools/zip/UnrecognizedExtraField;->setHeaderId(Lorg/apache/tools/zip/ZipShort;)V

    move-object v2, v1

    .line 90
    goto :goto_0
.end method

.method public static mergeCentralDirectoryData([Lorg/apache/tools/zip/ZipExtraField;)[B
    .locals 11
    .param p0, "data"    # [Lorg/apache/tools/zip/ZipExtraField;

    .prologue
    const/4 v10, 0x2

    const/4 v7, 0x0

    .line 237
    array-length v8, p0

    if-lez v8, :cond_0

    array-length v8, p0

    add-int/lit8 v8, v8, -0x1

    aget-object v8, p0, v8

    instance-of v8, v8, Lorg/apache/tools/zip/UnparseableExtraFieldData;

    if-eqz v8, :cond_0

    const/4 v1, 0x1

    .line 239
    .local v1, "lastIsUnparseableHolder":Z
    :goto_0
    if-eqz v1, :cond_1

    array-length v8, p0

    add-int/lit8 v3, v8, -0x1

    .line 242
    .local v3, "regularExtraFieldCount":I
    :goto_1
    mul-int/lit8 v6, v3, 0x4

    .line 243
    .local v6, "sum":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_2
    array-length v8, p0

    if-ge v0, v8, :cond_2

    .line 244
    aget-object v8, p0, v0

    invoke-interface {v8}, Lorg/apache/tools/zip/ZipExtraField;->getCentralDirectoryLength()Lorg/apache/tools/zip/ZipShort;

    move-result-object v8

    invoke-virtual {v8}, Lorg/apache/tools/zip/ZipShort;->getValue()I

    move-result v8

    add-int/2addr v6, v8

    .line 243
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .end local v0    # "i":I
    .end local v1    # "lastIsUnparseableHolder":Z
    .end local v3    # "regularExtraFieldCount":I
    .end local v6    # "sum":I
    :cond_0
    move v1, v7

    .line 237
    goto :goto_0

    .line 239
    .restart local v1    # "lastIsUnparseableHolder":Z
    :cond_1
    array-length v3, p0

    goto :goto_1

    .line 246
    .restart local v0    # "i":I
    .restart local v3    # "regularExtraFieldCount":I
    .restart local v6    # "sum":I
    :cond_2
    new-array v4, v6, [B

    .line 247
    .local v4, "result":[B
    const/4 v5, 0x0

    .line 248
    .local v5, "start":I
    const/4 v0, 0x0

    :goto_3
    if-ge v0, v3, :cond_3

    .line 249
    aget-object v8, p0, v0

    invoke-interface {v8}, Lorg/apache/tools/zip/ZipExtraField;->getHeaderId()Lorg/apache/tools/zip/ZipShort;

    move-result-object v8

    invoke-virtual {v8}, Lorg/apache/tools/zip/ZipShort;->getBytes()[B

    move-result-object v8

    invoke-static {v8, v7, v4, v5, v10}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 251
    aget-object v8, p0, v0

    invoke-interface {v8}, Lorg/apache/tools/zip/ZipExtraField;->getCentralDirectoryLength()Lorg/apache/tools/zip/ZipShort;

    move-result-object v8

    invoke-virtual {v8}, Lorg/apache/tools/zip/ZipShort;->getBytes()[B

    move-result-object v8

    add-int/lit8 v9, v5, 0x2

    invoke-static {v8, v7, v4, v9, v10}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 253
    aget-object v8, p0, v0

    invoke-interface {v8}, Lorg/apache/tools/zip/ZipExtraField;->getCentralDirectoryData()[B

    move-result-object v2

    .line 254
    .local v2, "local":[B
    add-int/lit8 v8, v5, 0x4

    array-length v9, v2

    invoke-static {v2, v7, v4, v8, v9}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 255
    array-length v8, v2

    add-int/lit8 v8, v8, 0x4

    add-int/2addr v5, v8

    .line 248
    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    .line 257
    .end local v2    # "local":[B
    :cond_3
    if-eqz v1, :cond_4

    .line 258
    array-length v8, p0

    add-int/lit8 v8, v8, -0x1

    aget-object v8, p0, v8

    invoke-interface {v8}, Lorg/apache/tools/zip/ZipExtraField;->getCentralDirectoryData()[B

    move-result-object v2

    .line 259
    .restart local v2    # "local":[B
    array-length v8, v2

    invoke-static {v2, v7, v4, v5, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 261
    .end local v2    # "local":[B
    :cond_4
    return-object v4
.end method

.method public static mergeLocalFileDataData([Lorg/apache/tools/zip/ZipExtraField;)[B
    .locals 11
    .param p0, "data"    # [Lorg/apache/tools/zip/ZipExtraField;

    .prologue
    const/4 v10, 0x2

    const/4 v7, 0x0

    .line 202
    array-length v8, p0

    if-lez v8, :cond_0

    array-length v8, p0

    add-int/lit8 v8, v8, -0x1

    aget-object v8, p0, v8

    instance-of v8, v8, Lorg/apache/tools/zip/UnparseableExtraFieldData;

    if-eqz v8, :cond_0

    const/4 v1, 0x1

    .line 204
    .local v1, "lastIsUnparseableHolder":Z
    :goto_0
    if-eqz v1, :cond_1

    array-length v8, p0

    add-int/lit8 v3, v8, -0x1

    .line 207
    .local v3, "regularExtraFieldCount":I
    :goto_1
    mul-int/lit8 v6, v3, 0x4

    .line 208
    .local v6, "sum":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_2
    array-length v8, p0

    if-ge v0, v8, :cond_2

    .line 209
    aget-object v8, p0, v0

    invoke-interface {v8}, Lorg/apache/tools/zip/ZipExtraField;->getLocalFileDataLength()Lorg/apache/tools/zip/ZipShort;

    move-result-object v8

    invoke-virtual {v8}, Lorg/apache/tools/zip/ZipShort;->getValue()I

    move-result v8

    add-int/2addr v6, v8

    .line 208
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .end local v0    # "i":I
    .end local v1    # "lastIsUnparseableHolder":Z
    .end local v3    # "regularExtraFieldCount":I
    .end local v6    # "sum":I
    :cond_0
    move v1, v7

    .line 202
    goto :goto_0

    .line 204
    .restart local v1    # "lastIsUnparseableHolder":Z
    :cond_1
    array-length v3, p0

    goto :goto_1

    .line 212
    .restart local v0    # "i":I
    .restart local v3    # "regularExtraFieldCount":I
    .restart local v6    # "sum":I
    :cond_2
    new-array v4, v6, [B

    .line 213
    .local v4, "result":[B
    const/4 v5, 0x0

    .line 214
    .local v5, "start":I
    const/4 v0, 0x0

    :goto_3
    if-ge v0, v3, :cond_3

    .line 215
    aget-object v8, p0, v0

    invoke-interface {v8}, Lorg/apache/tools/zip/ZipExtraField;->getHeaderId()Lorg/apache/tools/zip/ZipShort;

    move-result-object v8

    invoke-virtual {v8}, Lorg/apache/tools/zip/ZipShort;->getBytes()[B

    move-result-object v8

    invoke-static {v8, v7, v4, v5, v10}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 217
    aget-object v8, p0, v0

    invoke-interface {v8}, Lorg/apache/tools/zip/ZipExtraField;->getLocalFileDataLength()Lorg/apache/tools/zip/ZipShort;

    move-result-object v8

    invoke-virtual {v8}, Lorg/apache/tools/zip/ZipShort;->getBytes()[B

    move-result-object v8

    add-int/lit8 v9, v5, 0x2

    invoke-static {v8, v7, v4, v9, v10}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 219
    aget-object v8, p0, v0

    invoke-interface {v8}, Lorg/apache/tools/zip/ZipExtraField;->getLocalFileDataData()[B

    move-result-object v2

    .line 220
    .local v2, "local":[B
    add-int/lit8 v8, v5, 0x4

    array-length v9, v2

    invoke-static {v2, v7, v4, v8, v9}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 221
    array-length v8, v2

    add-int/lit8 v8, v8, 0x4

    add-int/2addr v5, v8

    .line 214
    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    .line 223
    .end local v2    # "local":[B
    :cond_3
    if-eqz v1, :cond_4

    .line 224
    array-length v8, p0

    add-int/lit8 v8, v8, -0x1

    aget-object v8, p0, v8

    invoke-interface {v8}, Lorg/apache/tools/zip/ZipExtraField;->getLocalFileDataData()[B

    move-result-object v2

    .line 225
    .restart local v2    # "local":[B
    array-length v8, v2

    invoke-static {v2, v7, v4, v5, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 227
    .end local v2    # "local":[B
    :cond_4
    return-object v4
.end method

.method public static parse([B)[Lorg/apache/tools/zip/ZipExtraField;
    .locals 2
    .param p0, "data"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/zip/ZipException;
        }
    .end annotation

    .prologue
    .line 102
    const/4 v0, 0x1

    sget-object v1, Lorg/apache/tools/zip/ExtraFieldUtils$UnparseableExtraField;->THROW:Lorg/apache/tools/zip/ExtraFieldUtils$UnparseableExtraField;

    invoke-static {p0, v0, v1}, Lorg/apache/tools/zip/ExtraFieldUtils;->parse([BZLorg/apache/tools/zip/ExtraFieldUtils$UnparseableExtraField;)[Lorg/apache/tools/zip/ZipExtraField;

    move-result-object v0

    return-object v0
.end method

.method public static parse([BZ)[Lorg/apache/tools/zip/ZipExtraField;
    .locals 1
    .param p0, "data"    # [B
    .param p1, "local"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/zip/ZipException;
        }
    .end annotation

    .prologue
    .line 117
    sget-object v0, Lorg/apache/tools/zip/ExtraFieldUtils$UnparseableExtraField;->THROW:Lorg/apache/tools/zip/ExtraFieldUtils$UnparseableExtraField;

    invoke-static {p0, p1, v0}, Lorg/apache/tools/zip/ExtraFieldUtils;->parse([BZLorg/apache/tools/zip/ExtraFieldUtils$UnparseableExtraField;)[Lorg/apache/tools/zip/ZipExtraField;

    move-result-object v0

    return-object v0
.end method

.method public static parse([BZLorg/apache/tools/zip/ExtraFieldUtils$UnparseableExtraField;)[Lorg/apache/tools/zip/ZipExtraField;
    .locals 13
    .param p0, "data"    # [B
    .param p1, "local"    # Z
    .param p2, "onUnparseableData"    # Lorg/apache/tools/zip/ExtraFieldUtils$UnparseableExtraField;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/zip/ZipException;
        }
    .end annotation

    .prologue
    .line 135
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 136
    .local v8, "v":Ljava/util/List;
    const/4 v7, 0x0

    .line 138
    .local v7, "start":I
    :goto_0
    array-length v10, p0

    add-int/lit8 v10, v10, -0x4

    if-gt v7, v10, :cond_0

    .line 139
    new-instance v2, Lorg/apache/tools/zip/ZipShort;

    invoke-direct {v2, p0, v7}, Lorg/apache/tools/zip/ZipShort;-><init>([BI)V

    .line 140
    .local v2, "headerId":Lorg/apache/tools/zip/ZipShort;
    new-instance v10, Lorg/apache/tools/zip/ZipShort;

    add-int/lit8 v11, v7, 0x2

    invoke-direct {v10, p0, v11}, Lorg/apache/tools/zip/ZipShort;-><init>([BI)V

    invoke-virtual {v10}, Lorg/apache/tools/zip/ZipShort;->getValue()I

    move-result v5

    .line 141
    .local v5, "length":I
    add-int/lit8 v10, v7, 0x4

    add-int/2addr v10, v5

    array-length v11, p0

    if-le v10, v11, :cond_2

    .line 142
    invoke-virtual {p2}, Lorg/apache/tools/zip/ExtraFieldUtils$UnparseableExtraField;->getKey()I

    move-result v10

    packed-switch v10, :pswitch_data_0

    .line 168
    new-instance v10, Ljava/util/zip/ZipException;

    new-instance v11, Ljava/lang/StringBuffer;

    invoke-direct {v11}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v12, "unknown UnparseableExtraField key: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {p2}, Lorg/apache/tools/zip/ExtraFieldUtils$UnparseableExtraField;->getKey()I

    move-result v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11}, Ljava/util/zip/ZipException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 144
    :pswitch_0
    new-instance v10, Ljava/util/zip/ZipException;

    new-instance v11, Ljava/lang/StringBuffer;

    invoke-direct {v11}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v12, "bad extra field starting at "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v11, v7}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v11

    const-string/jumbo v12, ".  Block length of "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v11, v5}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v11

    const-string/jumbo v12, " bytes exceeds remaining"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    const-string/jumbo v12, " data of "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    array-length v12, p0

    sub-int/2addr v12, v7

    add-int/lit8 v12, v12, -0x4

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v11

    const-string/jumbo v12, " bytes."

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11}, Ljava/util/zip/ZipException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 151
    :pswitch_1
    new-instance v1, Lorg/apache/tools/zip/UnparseableExtraFieldData;

    invoke-direct {v1}, Lorg/apache/tools/zip/UnparseableExtraFieldData;-><init>()V

    .line 153
    .local v1, "field":Lorg/apache/tools/zip/UnparseableExtraFieldData;
    if-eqz p1, :cond_1

    .line 154
    array-length v10, p0

    sub-int/2addr v10, v7

    invoke-virtual {v1, p0, v7, v10}, Lorg/apache/tools/zip/UnparseableExtraFieldData;->parseFromLocalFileData([BII)V

    .line 160
    :goto_1
    invoke-interface {v8, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 191
    .end local v1    # "field":Lorg/apache/tools/zip/UnparseableExtraFieldData;
    .end local v2    # "headerId":Lorg/apache/tools/zip/ZipShort;
    .end local v5    # "length":I
    :cond_0
    :pswitch_2
    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v10

    new-array v6, v10, [Lorg/apache/tools/zip/ZipExtraField;

    .line 192
    .local v6, "result":[Lorg/apache/tools/zip/ZipExtraField;
    invoke-interface {v8, v6}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v10

    check-cast v10, [Lorg/apache/tools/zip/ZipExtraField;

    return-object v10

    .line 157
    .end local v6    # "result":[Lorg/apache/tools/zip/ZipExtraField;
    .restart local v1    # "field":Lorg/apache/tools/zip/UnparseableExtraFieldData;
    .restart local v2    # "headerId":Lorg/apache/tools/zip/ZipShort;
    .restart local v5    # "length":I
    :cond_1
    array-length v10, p0

    sub-int/2addr v10, v7

    invoke-virtual {v1, p0, v7, v10}, Lorg/apache/tools/zip/UnparseableExtraFieldData;->parseFromCentralDirectoryData([BII)V

    goto :goto_1

    .line 173
    .end local v1    # "field":Lorg/apache/tools/zip/UnparseableExtraFieldData;
    :cond_2
    :try_start_0
    invoke-static {v2}, Lorg/apache/tools/zip/ExtraFieldUtils;->createExtraField(Lorg/apache/tools/zip/ZipShort;)Lorg/apache/tools/zip/ZipExtraField;

    move-result-object v9

    .line 174
    .local v9, "ze":Lorg/apache/tools/zip/ZipExtraField;
    if-nez p1, :cond_3

    instance-of v10, v9, Lorg/apache/tools/zip/CentralDirectoryParsingZipExtraField;

    if-nez v10, :cond_4

    .line 176
    :cond_3
    add-int/lit8 v10, v7, 0x4

    invoke-interface {v9, p0, v10, v5}, Lorg/apache/tools/zip/ZipExtraField;->parseFromLocalFileData([BII)V

    .line 182
    :goto_2
    invoke-interface {v8, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 188
    add-int/lit8 v10, v5, 0x4

    add-int/2addr v7, v10

    goto/16 :goto_0

    .line 178
    :cond_4
    move-object v0, v9

    check-cast v0, Lorg/apache/tools/zip/CentralDirectoryParsingZipExtraField;

    move-object v10, v0

    add-int/lit8 v11, v7, 0x4

    invoke-interface {v10, p0, v11, v5}, Lorg/apache/tools/zip/CentralDirectoryParsingZipExtraField;->parseFromCentralDirectoryData([BII)V
    :try_end_0
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_2

    .line 183
    .end local v9    # "ze":Lorg/apache/tools/zip/ZipExtraField;
    :catch_0
    move-exception v4

    .line 184
    .local v4, "ie":Ljava/lang/InstantiationException;
    new-instance v10, Ljava/util/zip/ZipException;

    invoke-virtual {v4}, Ljava/lang/InstantiationException;->getMessage()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11}, Ljava/util/zip/ZipException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 185
    .end local v4    # "ie":Ljava/lang/InstantiationException;
    :catch_1
    move-exception v3

    .line 186
    .local v3, "iae":Ljava/lang/IllegalAccessException;
    new-instance v10, Ljava/util/zip/ZipException;

    invoke-virtual {v3}, Ljava/lang/IllegalAccessException;->getMessage()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11}, Ljava/util/zip/ZipException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 142
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
    .param p0, "c"    # Ljava/lang/Class;

    .prologue
    .line 62
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/tools/zip/ZipExtraField;

    .line 63
    .local v2, "ze":Lorg/apache/tools/zip/ZipExtraField;
    sget-object v3, Lorg/apache/tools/zip/ExtraFieldUtils;->implementations:Ljava/util/Map;

    invoke-interface {v2}, Lorg/apache/tools/zip/ZipExtraField;->getHeaderId()Lorg/apache/tools/zip/ZipShort;

    move-result-object v4

    invoke-interface {v3, v4, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_2

    .line 71
    return-void

    .line 64
    .end local v2    # "ze":Lorg/apache/tools/zip/ZipExtraField;
    :catch_0
    move-exception v0

    .line 65
    .local v0, "cc":Ljava/lang/ClassCastException;
    new-instance v3, Ljava/lang/RuntimeException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v4, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, " doesn\'t implement ZipExtraField"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 66
    .end local v0    # "cc":Ljava/lang/ClassCastException;
    :catch_1
    move-exception v1

    .line 67
    .local v1, "ie":Ljava/lang/InstantiationException;
    new-instance v3, Ljava/lang/RuntimeException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v4, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, " is not a concrete class"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 68
    .end local v1    # "ie":Ljava/lang/InstantiationException;
    :catch_2
    move-exception v1

    .line 69
    .local v1, "ie":Ljava/lang/IllegalAccessException;
    new-instance v3, Ljava/lang/RuntimeException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v4, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, "\'s no-arg constructor is not public"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v3
.end method
