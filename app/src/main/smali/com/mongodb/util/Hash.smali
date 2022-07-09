.class public final Lcom/mongodb/util/Hash;
.super Ljava/lang/Object;
.source "Hash.java"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field static final _longHashConstant:J = 0xfffL


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static final hashBackward(Ljava/lang/String;)I
    .locals 4
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    .line 32
    const/4 v0, 0x0

    .line 33
    .local v0, "hash":I
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v1, v2, -0x1

    .local v1, "i":I
    :goto_0
    if-ltz v1, :cond_0

    .line 34
    mul-int/lit8 v2, v0, 0x1f

    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v3

    add-int v0, v2, v3

    .line 33
    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    .line 35
    :cond_0
    return v0
.end method

.method public static final hashBackwardLong(Ljava/lang/String;)J
    .locals 8
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    .line 43
    const-wide/16 v0, 0x0

    .line 44
    .local v0, "hash":J
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v2, v3, -0x1

    .local v2, "i":I
    :goto_0
    if-ltz v2, :cond_0

    .line 45
    const-wide/16 v4, 0x3f

    mul-long/2addr v4, v0

    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v3

    int-to-long v6, v3

    add-long v0, v4, v6

    .line 44
    add-int/lit8 v2, v2, -0x1

    goto :goto_0

    .line 46
    :cond_0
    return-wide v0
.end method

.method public static final hashCode(Ljava/lang/CharSequence;II)I
    .locals 5
    .param p0, "s"    # Ljava/lang/CharSequence;
    .param p1, "start"    # I
    .param p2, "end"    # I

    .prologue
    .line 167
    const/4 v0, 0x0

    .line 168
    .local v0, "h":I
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v2

    .line 169
    .local v2, "len":I
    move v1, p1

    .local v1, "i":I
    :goto_0
    if-ge v1, v2, :cond_0

    if-ge v1, p2, :cond_0

    .line 170
    mul-int/lit8 v3, v0, 0x1f

    invoke-interface {p0, v1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v4

    add-int v0, v3, v4

    .line 169
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 171
    :cond_0
    return v0
.end method

.method public static final varargs hashCode([Ljava/lang/String;)I
    .locals 9
    .param p0, "strings"    # [Ljava/lang/String;

    .prologue
    .line 244
    const/4 v1, 0x0

    .line 245
    .local v1, "h":I
    move-object v0, p0

    .local v0, "arr$":[Ljava/lang/String;
    array-length v5, v0

    .local v5, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_0
    if-ge v3, v5, :cond_1

    aget-object v6, v0, v3

    .line 246
    .local v6, "s":Ljava/lang/String;
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v4

    .line 247
    .local v4, "len":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    if-ge v2, v4, :cond_0

    .line 248
    mul-int/lit8 v7, v1, 0x1f

    invoke-virtual {v6, v2}, Ljava/lang/String;->charAt(I)C

    move-result v8

    add-int v1, v7, v8

    .line 247
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 245
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 250
    .end local v2    # "i":I
    .end local v4    # "len":I
    .end local v6    # "s":Ljava/lang/String;
    :cond_1
    return v1
.end method

.method public static final longHash(Ljava/lang/String;)J
    .locals 2
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    .line 59
    const/4 v0, 0x0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    invoke-static {p0, v0, v1}, Lcom/mongodb/util/Hash;->longHash(Ljava/lang/String;II)J

    move-result-wide v0

    return-wide v0
.end method

.method public static final longHash(Ljava/lang/String;II)J
    .locals 6
    .param p0, "s"    # Ljava/lang/String;
    .param p1, "start"    # I
    .param p2, "end"    # I

    .prologue
    .line 70
    const-wide/16 v0, 0x0

    .line 71
    .local v0, "hash":J
    :goto_0
    if-ge p1, p2, :cond_0

    .line 72
    const-wide/16 v2, 0xfff

    mul-long/2addr v2, v0

    invoke-virtual {p0, p1}, Ljava/lang/String;->charAt(I)C

    move-result v4

    int-to-long v4, v4

    add-long v0, v2, v4

    .line 71
    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    .line 73
    :cond_0
    return-wide v0
.end method

.method public static final longHashAppend(JC)J
    .locals 4
    .param p0, "hash"    # J
    .param p2, "c"    # C

    .prologue
    .line 128
    const-wide/16 v0, 0xfff

    mul-long/2addr v0, p0

    int-to-long v2, p2

    add-long/2addr v0, v2

    return-wide v0
.end method

.method public static final longLowerHash(Ljava/lang/String;)J
    .locals 2
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    .line 83
    const/4 v0, 0x0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    invoke-static {p0, v0, v1}, Lcom/mongodb/util/Hash;->longLowerHash(Ljava/lang/String;II)J

    move-result-wide v0

    return-wide v0
.end method

.method public static final longLowerHash(Ljava/lang/String;II)J
    .locals 6
    .param p0, "s"    # Ljava/lang/String;
    .param p1, "start"    # I
    .param p2, "end"    # I

    .prologue
    .line 94
    const-wide/16 v0, 0x0

    .line 95
    .local v0, "hash":J
    :goto_0
    if-ge p1, p2, :cond_0

    .line 96
    const-wide/16 v2, 0xfff

    mul-long/2addr v2, v0

    invoke-virtual {p0, p1}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-static {v4}, Ljava/lang/Character;->toLowerCase(C)C

    move-result v4

    int-to-long v4, v4

    add-long v0, v2, v4

    .line 95
    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    .line 97
    :cond_0
    return-wide v0
.end method

.method public static final longLowerHash(Ljava/lang/String;IIJ)J
    .locals 5
    .param p0, "s"    # Ljava/lang/String;
    .param p1, "start"    # I
    .param p2, "end"    # I
    .param p3, "hash"    # J

    .prologue
    .line 108
    :goto_0
    if-ge p1, p2, :cond_0

    .line 109
    const-wide/16 v0, 0xfff

    mul-long/2addr v0, p3

    invoke-virtual {p0, p1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-static {v2}, Ljava/lang/Character;->toLowerCase(C)C

    move-result v2

    int-to-long v2, v2

    add-long p3, v0, v2

    .line 108
    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    .line 110
    :cond_0
    return-wide p3
.end method

.method public static final longLowerHashAppend(JC)J
    .locals 4
    .param p0, "hash"    # J
    .param p2, "c"    # C

    .prologue
    .line 119
    const-wide/16 v0, 0xfff

    mul-long/2addr v0, p0

    invoke-static {p2}, Ljava/lang/Character;->toLowerCase(C)C

    move-result v2

    int-to-long v2, v2

    add-long/2addr v0, v2

    return-wide v0
.end method

.method public static final lowerCaseHash(Ljava/lang/String;)I
    .locals 5
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    .line 137
    const/4 v0, 0x0

    .line 138
    .local v0, "h":I
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    .line 139
    .local v2, "len":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v2, :cond_0

    .line 140
    mul-int/lit8 v3, v0, 0x1f

    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-static {v4}, Ljava/lang/Character;->toLowerCase(C)C

    move-result v4

    add-int v0, v3, v4

    .line 139
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 141
    :cond_0
    return v0
.end method

.method public static final lowerCaseHash(Ljava/lang/String;II)I
    .locals 5
    .param p0, "s"    # Ljava/lang/String;
    .param p1, "start"    # I
    .param p2, "end"    # I

    .prologue
    .line 152
    const/4 v0, 0x0

    .line 153
    .local v0, "h":I
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    .line 154
    .local v2, "len":I
    move v1, p1

    .local v1, "i":I
    :goto_0
    if-ge v1, v2, :cond_0

    if-ge v1, p2, :cond_0

    .line 155
    mul-int/lit8 v3, v0, 0x1f

    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-static {v4}, Ljava/lang/Character;->toLowerCase(C)C

    move-result v4

    add-int v0, v3, v4

    .line 154
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 156
    :cond_0
    return v0
.end method

.method public static final lowerCaseSpaceTrimHash(Ljava/lang/String;)I
    .locals 7
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    .line 200
    const/4 v0, 0x0

    .line 201
    .local v0, "h":I
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    .line 202
    .local v4, "len":I
    :goto_0
    const/4 v5, 0x1

    if-le v4, v5, :cond_0

    add-int/lit8 v5, v4, -0x1

    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    invoke-static {v5}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 203
    add-int/lit8 v4, v4, -0x1

    goto :goto_0

    .line 204
    :cond_0
    const/4 v3, 0x1

    .line 205
    .local v3, "lastWasSpace":Z
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    if-ge v1, v4, :cond_2

    .line 206
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v5

    invoke-static {v5}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v2

    .line 207
    .local v2, "isSpace":Z
    if-eqz v2, :cond_1

    if-eqz v3, :cond_1

    .line 205
    :goto_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 209
    :cond_1
    move v3, v2

    .line 210
    mul-int/lit8 v5, v0, 0x1f

    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v6

    invoke-static {v6}, Ljava/lang/Character;->toLowerCase(C)C

    move-result v6

    add-int v0, v5, v6

    goto :goto_2

    .line 212
    .end local v2    # "isSpace":Z
    :cond_2
    return v0
.end method

.method public static final lowerCaseSpaceTrimHash(Ljava/lang/String;II)I
    .locals 7
    .param p0, "s"    # Ljava/lang/String;
    .param p1, "start"    # I
    .param p2, "end"    # I

    .prologue
    .line 223
    const/4 v0, 0x0

    .line 224
    .local v0, "h":I
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    .line 225
    .local v4, "len":I
    :goto_0
    const/4 v5, 0x1

    if-le v4, v5, :cond_0

    add-int/lit8 v5, v4, -0x1

    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    invoke-static {v5}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 226
    add-int/lit8 v4, v4, -0x1

    goto :goto_0

    .line 227
    :cond_0
    const/4 v3, 0x1

    .line 228
    .local v3, "lastWasSpace":Z
    move v1, p1

    .local v1, "i":I
    :goto_1
    if-ge v1, v4, :cond_2

    if-ge v1, p2, :cond_2

    .line 229
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v5

    invoke-static {v5}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v2

    .line 230
    .local v2, "isSpace":Z
    if-eqz v2, :cond_1

    if-eqz v3, :cond_1

    .line 228
    :goto_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 232
    :cond_1
    move v3, v2

    .line 233
    mul-int/lit8 v5, v0, 0x1f

    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v6

    invoke-static {v6}, Ljava/lang/Character;->toLowerCase(C)C

    move-result v6

    add-int v0, v5, v6

    goto :goto_2

    .line 235
    .end local v2    # "isSpace":Z
    :cond_2
    return v0
.end method

.method public static final nospaceLowerHash(Ljava/lang/String;II)I
    .locals 6
    .param p0, "s"    # Ljava/lang/String;
    .param p1, "start"    # I
    .param p2, "end"    # I

    .prologue
    .line 182
    const/4 v1, 0x0

    .line 183
    .local v1, "h":I
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    .line 184
    .local v3, "len":I
    move v2, p1

    .local v2, "i":I
    :goto_0
    if-ge v2, v3, :cond_1

    if-ge v2, p2, :cond_1

    .line 185
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 186
    .local v0, "c":C
    invoke-static {v0}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 184
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 188
    :cond_0
    mul-int/lit8 v4, v1, 0x1f

    invoke-static {v0}, Ljava/lang/Character;->toLowerCase(C)C

    move-result v5

    add-int v1, v4, v5

    goto :goto_1

    .line 190
    .end local v0    # "c":C
    :cond_1
    return v1
.end method
