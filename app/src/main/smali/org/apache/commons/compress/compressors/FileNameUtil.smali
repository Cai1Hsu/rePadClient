.class public Lorg/apache/commons/compress/compressors/FileNameUtil;
.super Ljava/lang/Object;
.source "FileNameUtil.java"


# instance fields
.field private final compressSuffix:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final defaultExtension:Ljava/lang/String;

.field private final longestCompressedSuffix:I

.field private final longestUncompressedSuffix:I

.field private final shortestCompressedSuffix:I

.field private final shortestUncompressedSuffix:I

.field private final uncompressSuffix:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/Map;Ljava/lang/String;)V
    .locals 11
    .param p2, "defaultExtension"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 92
    .local p1, "uncompressSuffix":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    new-instance v9, Ljava/util/HashMap;

    invoke-direct {v9}, Ljava/util/HashMap;-><init>()V

    iput-object v9, p0, Lorg/apache/commons/compress/compressors/FileNameUtil;->compressSuffix:Ljava/util/Map;

    .line 93
    invoke-static {p1}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v9

    iput-object v9, p0, Lorg/apache/commons/compress/compressors/FileNameUtil;->uncompressSuffix:Ljava/util/Map;

    .line 94
    const/high16 v3, -0x80000000

    .local v3, "lc":I
    const v5, 0x7fffffff

    .line 95
    .local v5, "sc":I
    const/high16 v4, -0x80000000

    .local v4, "lu":I
    const v6, 0x7fffffff

    .line 96
    .local v6, "su":I
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v9

    invoke-interface {v9}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_5

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 97
    .local v1, "ent":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v0

    .line 98
    .local v0, "cl":I
    if-le v0, v3, :cond_1

    .line 99
    move v3, v0

    .line 101
    :cond_1
    if-ge v0, v5, :cond_2

    .line 102
    move v5, v0

    .line 105
    :cond_2
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    .line 106
    .local v7, "u":Ljava/lang/String;
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v8

    .line 107
    .local v8, "ul":I
    if-lez v8, :cond_0

    .line 108
    iget-object v9, p0, Lorg/apache/commons/compress/compressors/FileNameUtil;->compressSuffix:Ljava/util/Map;

    invoke-interface {v9, v7}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_3

    .line 109
    iget-object v9, p0, Lorg/apache/commons/compress/compressors/FileNameUtil;->compressSuffix:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v10

    invoke-interface {v9, v7, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 111
    :cond_3
    if-le v8, v4, :cond_4

    .line 112
    move v4, v8

    .line 114
    :cond_4
    if-ge v8, v6, :cond_0

    .line 115
    move v6, v8

    goto :goto_0

    .line 119
    .end local v0    # "cl":I
    .end local v1    # "ent":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v7    # "u":Ljava/lang/String;
    .end local v8    # "ul":I
    :cond_5
    iput v3, p0, Lorg/apache/commons/compress/compressors/FileNameUtil;->longestCompressedSuffix:I

    .line 120
    iput v4, p0, Lorg/apache/commons/compress/compressors/FileNameUtil;->longestUncompressedSuffix:I

    .line 121
    iput v5, p0, Lorg/apache/commons/compress/compressors/FileNameUtil;->shortestCompressedSuffix:I

    .line 122
    iput v6, p0, Lorg/apache/commons/compress/compressors/FileNameUtil;->shortestUncompressedSuffix:I

    .line 123
    iput-object p2, p0, Lorg/apache/commons/compress/compressors/FileNameUtil;->defaultExtension:Ljava/lang/String;

    .line 124
    return-void
.end method


# virtual methods
.method public getCompressedFilename(Ljava/lang/String;)Ljava/lang/String;
    .locals 7
    .param p1, "filename"    # Ljava/lang/String;

    .prologue
    .line 183
    sget-object v4, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {p1, v4}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    .line 184
    .local v1, "lower":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    .line 185
    .local v2, "n":I
    iget v0, p0, Lorg/apache/commons/compress/compressors/FileNameUtil;->shortestUncompressedSuffix:I

    .line 186
    .local v0, "i":I
    :goto_0
    iget v4, p0, Lorg/apache/commons/compress/compressors/FileNameUtil;->longestUncompressedSuffix:I

    if-gt v0, v4, :cond_1

    if-ge v0, v2, :cond_1

    .line 187
    iget-object v4, p0, Lorg/apache/commons/compress/compressors/FileNameUtil;->compressSuffix:Ljava/util/Map;

    sub-int v5, v2, v0

    invoke-virtual {v1, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 188
    .local v3, "suffix":Ljava/lang/String;
    if-eqz v3, :cond_0

    .line 189
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v5, 0x0

    sub-int v6, v2, v0

    invoke-virtual {p1, v5, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 193
    .end local v3    # "suffix":Ljava/lang/String;
    :goto_1
    return-object v4

    .line 186
    .restart local v3    # "suffix":Ljava/lang/String;
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 193
    .end local v3    # "suffix":Ljava/lang/String;
    :cond_1
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lorg/apache/commons/compress/compressors/FileNameUtil;->defaultExtension:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_1
.end method

.method public getUncompressedFilename(Ljava/lang/String;)Ljava/lang/String;
    .locals 7
    .param p1, "filename"    # Ljava/lang/String;

    .prologue
    .line 159
    sget-object v4, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {p1, v4}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    .line 160
    .local v1, "lower":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    .line 161
    .local v2, "n":I
    iget v0, p0, Lorg/apache/commons/compress/compressors/FileNameUtil;->shortestCompressedSuffix:I

    .line 162
    .local v0, "i":I
    :goto_0
    iget v4, p0, Lorg/apache/commons/compress/compressors/FileNameUtil;->longestCompressedSuffix:I

    if-gt v0, v4, :cond_0

    if-ge v0, v2, :cond_0

    .line 163
    iget-object v4, p0, Lorg/apache/commons/compress/compressors/FileNameUtil;->uncompressSuffix:Ljava/util/Map;

    sub-int v5, v2, v0

    invoke-virtual {v1, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 164
    .local v3, "suffix":Ljava/lang/String;
    if-eqz v3, :cond_1

    .line 165
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v5, 0x0

    sub-int v6, v2, v0

    invoke-virtual {p1, v5, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 168
    .end local v3    # "suffix":Ljava/lang/String;
    .end local p1    # "filename":Ljava/lang/String;
    :cond_0
    return-object p1

    .line 162
    .restart local v3    # "suffix":Ljava/lang/String;
    .restart local p1    # "filename":Ljava/lang/String;
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public isCompressedFilename(Ljava/lang/String;)Z
    .locals 5
    .param p1, "filename"    # Ljava/lang/String;

    .prologue
    .line 134
    sget-object v3, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {p1, v3}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    .line 135
    .local v1, "lower":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    .line 136
    .local v2, "n":I
    iget v0, p0, Lorg/apache/commons/compress/compressors/FileNameUtil;->shortestCompressedSuffix:I

    .line 137
    .local v0, "i":I
    :goto_0
    iget v3, p0, Lorg/apache/commons/compress/compressors/FileNameUtil;->longestCompressedSuffix:I

    if-gt v0, v3, :cond_1

    if-ge v0, v2, :cond_1

    .line 138
    iget-object v3, p0, Lorg/apache/commons/compress/compressors/FileNameUtil;->uncompressSuffix:Ljava/util/Map;

    sub-int v4, v2, v0

    invoke-virtual {v1, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 139
    const/4 v3, 0x1

    .line 142
    :goto_1
    return v3

    .line 137
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 142
    :cond_1
    const/4 v3, 0x0

    goto :goto_1
.end method
