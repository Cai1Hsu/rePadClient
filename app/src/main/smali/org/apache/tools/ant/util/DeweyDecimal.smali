.class public Lorg/apache/tools/ant/util/DeweyDecimal;
.super Ljava/lang/Object;
.source "DeweyDecimal.java"


# instance fields
.field private components:[I


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 6
    .param p1, "string"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NumberFormatException;
        }
    .end annotation

    .prologue
    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    new-instance v3, Ljava/util/StringTokenizer;

    const-string/jumbo v4, "."

    const/4 v5, 0x1

    invoke-direct {v3, p1, v4, v5}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 55
    .local v3, "tokenizer":Ljava/util/StringTokenizer;
    invoke-virtual {v3}, Ljava/util/StringTokenizer;->countTokens()I

    move-result v2

    .line 57
    .local v2, "size":I
    add-int/lit8 v4, v2, 0x1

    div-int/lit8 v4, v4, 0x2

    new-array v4, v4, [I

    iput-object v4, p0, Lorg/apache/tools/ant/util/DeweyDecimal;->components:[I

    .line 59
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v4, p0, Lorg/apache/tools/ant/util/DeweyDecimal;->components:[I

    array-length v4, v4

    if-ge v1, v4, :cond_2

    .line 60
    invoke-virtual {v3}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v0

    .line 61
    .local v0, "component":Ljava/lang/String;
    const-string/jumbo v4, ""

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 62
    new-instance v4, Ljava/lang/NumberFormatException;

    const-string/jumbo v5, "Empty component in string"

    invoke-direct {v4, v5}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 65
    :cond_0
    iget-object v4, p0, Lorg/apache/tools/ant/util/DeweyDecimal;->components:[I

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    aput v5, v4, v1

    .line 68
    invoke-virtual {v3}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 69
    invoke-virtual {v3}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    .line 72
    invoke-virtual {v3}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v4

    if-nez v4, :cond_1

    .line 73
    new-instance v4, Ljava/lang/NumberFormatException;

    const-string/jumbo v5, "DeweyDecimal ended in a \'.\'"

    invoke-direct {v4, v5}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 59
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 77
    .end local v0    # "component":Ljava/lang/String;
    :cond_2
    return-void
.end method

.method public constructor <init>([I)V
    .locals 3
    .param p1, "components"    # [I

    .prologue
    const/4 v2, 0x0

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    array-length v0, p1

    new-array v0, v0, [I

    iput-object v0, p0, Lorg/apache/tools/ant/util/DeweyDecimal;->components:[I

    .line 43
    iget-object v0, p0, Lorg/apache/tools/ant/util/DeweyDecimal;->components:[I

    array-length v1, p1

    invoke-static {p1, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 44
    return-void
.end method


# virtual methods
.method public get(I)I
    .locals 1
    .param p1, "index"    # I

    .prologue
    .line 95
    iget-object v0, p0, Lorg/apache/tools/ant/util/DeweyDecimal;->components:[I

    aget v0, v0, p1

    return v0
.end method

.method public getSize()I
    .locals 1

    .prologue
    .line 85
    iget-object v0, p0, Lorg/apache/tools/ant/util/DeweyDecimal;->components:[I

    array-length v0, v0

    return v0
.end method

.method public isEqual(Lorg/apache/tools/ant/util/DeweyDecimal;)Z
    .locals 7
    .param p1, "other"    # Lorg/apache/tools/ant/util/DeweyDecimal;

    .prologue
    const/4 v4, 0x0

    .line 106
    iget-object v5, p1, Lorg/apache/tools/ant/util/DeweyDecimal;->components:[I

    array-length v5, v5

    iget-object v6, p0, Lorg/apache/tools/ant/util/DeweyDecimal;->components:[I

    array-length v6, v6

    invoke-static {v5, v6}, Ljava/lang/Math;->max(II)I

    move-result v3

    .line 108
    .local v3, "max":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v3, :cond_3

    .line 109
    iget-object v5, p0, Lorg/apache/tools/ant/util/DeweyDecimal;->components:[I

    array-length v5, v5

    if-ge v2, v5, :cond_0

    iget-object v5, p0, Lorg/apache/tools/ant/util/DeweyDecimal;->components:[I

    aget v0, v5, v2

    .line 110
    .local v0, "component1":I
    :goto_1
    iget-object v5, p1, Lorg/apache/tools/ant/util/DeweyDecimal;->components:[I

    array-length v5, v5

    if-ge v2, v5, :cond_1

    iget-object v5, p1, Lorg/apache/tools/ant/util/DeweyDecimal;->components:[I

    aget v1, v5, v2

    .line 112
    .local v1, "component2":I
    :goto_2
    if-eq v1, v0, :cond_2

    .line 117
    .end local v0    # "component1":I
    .end local v1    # "component2":I
    :goto_3
    return v4

    :cond_0
    move v0, v4

    .line 109
    goto :goto_1

    .restart local v0    # "component1":I
    :cond_1
    move v1, v4

    .line 110
    goto :goto_2

    .line 108
    .restart local v1    # "component2":I
    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 117
    .end local v0    # "component1":I
    .end local v1    # "component2":I
    :cond_3
    const/4 v4, 0x1

    goto :goto_3
.end method

.method public isGreaterThan(Lorg/apache/tools/ant/util/DeweyDecimal;)Z
    .locals 7
    .param p1, "other"    # Lorg/apache/tools/ant/util/DeweyDecimal;

    .prologue
    const/4 v4, 0x0

    .line 150
    iget-object v5, p1, Lorg/apache/tools/ant/util/DeweyDecimal;->components:[I

    array-length v5, v5

    iget-object v6, p0, Lorg/apache/tools/ant/util/DeweyDecimal;->components:[I

    array-length v6, v6

    invoke-static {v5, v6}, Ljava/lang/Math;->max(II)I

    move-result v3

    .line 152
    .local v3, "max":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v3, :cond_0

    .line 153
    iget-object v5, p0, Lorg/apache/tools/ant/util/DeweyDecimal;->components:[I

    array-length v5, v5

    if-ge v2, v5, :cond_1

    iget-object v5, p0, Lorg/apache/tools/ant/util/DeweyDecimal;->components:[I

    aget v0, v5, v2

    .line 154
    .local v0, "component1":I
    :goto_1
    iget-object v5, p1, Lorg/apache/tools/ant/util/DeweyDecimal;->components:[I

    array-length v5, v5

    if-ge v2, v5, :cond_2

    iget-object v5, p1, Lorg/apache/tools/ant/util/DeweyDecimal;->components:[I

    aget v1, v5, v2

    .line 156
    .local v1, "component2":I
    :goto_2
    if-le v1, v0, :cond_3

    .line 164
    .end local v0    # "component1":I
    .end local v1    # "component2":I
    :cond_0
    :goto_3
    return v4

    :cond_1
    move v0, v4

    .line 153
    goto :goto_1

    .restart local v0    # "component1":I
    :cond_2
    move v1, v4

    .line 154
    goto :goto_2

    .line 159
    .restart local v1    # "component2":I
    :cond_3
    if-ge v1, v0, :cond_4

    .line 160
    const/4 v4, 0x1

    goto :goto_3

    .line 152
    :cond_4
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method public isGreaterThanOrEqual(Lorg/apache/tools/ant/util/DeweyDecimal;)Z
    .locals 8
    .param p1, "other"    # Lorg/apache/tools/ant/util/DeweyDecimal;

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 175
    iget-object v6, p1, Lorg/apache/tools/ant/util/DeweyDecimal;->components:[I

    array-length v6, v6

    iget-object v7, p0, Lorg/apache/tools/ant/util/DeweyDecimal;->components:[I

    array-length v7, v7

    invoke-static {v6, v7}, Ljava/lang/Math;->max(II)I

    move-result v3

    .line 177
    .local v3, "max":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v3, :cond_4

    .line 178
    iget-object v6, p0, Lorg/apache/tools/ant/util/DeweyDecimal;->components:[I

    array-length v6, v6

    if-ge v2, v6, :cond_0

    iget-object v6, p0, Lorg/apache/tools/ant/util/DeweyDecimal;->components:[I

    aget v0, v6, v2

    .line 179
    .local v0, "component1":I
    :goto_1
    iget-object v6, p1, Lorg/apache/tools/ant/util/DeweyDecimal;->components:[I

    array-length v6, v6

    if-ge v2, v6, :cond_1

    iget-object v6, p1, Lorg/apache/tools/ant/util/DeweyDecimal;->components:[I

    aget v1, v6, v2

    .line 181
    .local v1, "component2":I
    :goto_2
    if-le v1, v0, :cond_2

    .line 189
    .end local v0    # "component1":I
    .end local v1    # "component2":I
    :goto_3
    return v4

    :cond_0
    move v0, v4

    .line 178
    goto :goto_1

    .restart local v0    # "component1":I
    :cond_1
    move v1, v4

    .line 179
    goto :goto_2

    .line 184
    .restart local v1    # "component2":I
    :cond_2
    if-ge v1, v0, :cond_3

    move v4, v5

    .line 185
    goto :goto_3

    .line 177
    :cond_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .end local v0    # "component1":I
    .end local v1    # "component2":I
    :cond_4
    move v4, v5

    .line 189
    goto :goto_3
.end method

.method public isLessThan(Lorg/apache/tools/ant/util/DeweyDecimal;)Z
    .locals 1
    .param p1, "other"    # Lorg/apache/tools/ant/util/DeweyDecimal;

    .prologue
    .line 128
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/util/DeweyDecimal;->isGreaterThanOrEqual(Lorg/apache/tools/ant/util/DeweyDecimal;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isLessThanOrEqual(Lorg/apache/tools/ant/util/DeweyDecimal;)Z
    .locals 1
    .param p1, "other"    # Lorg/apache/tools/ant/util/DeweyDecimal;

    .prologue
    .line 139
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/util/DeweyDecimal;->isGreaterThan(Lorg/apache/tools/ant/util/DeweyDecimal;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 198
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    .line 200
    .local v1, "sb":Ljava/lang/StringBuffer;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v2, p0, Lorg/apache/tools/ant/util/DeweyDecimal;->components:[I

    array-length v2, v2

    if-ge v0, v2, :cond_1

    .line 201
    if-eqz v0, :cond_0

    .line 202
    const/16 v2, 0x2e

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 204
    :cond_0
    iget-object v2, p0, Lorg/apache/tools/ant/util/DeweyDecimal;->components:[I

    aget v2, v2, v0

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    .line 200
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 207
    :cond_1
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method
