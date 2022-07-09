.class public final Lcom/mongodb/util/StringParseUtil;
.super Ljava/lang/Object;
.source "StringParseUtil.java"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static parseBoolean(Ljava/lang/String;Z)Z
    .locals 3
    .param p0, "s"    # Ljava/lang/String;
    .param p1, "d"    # Z

    .prologue
    const/4 v1, 0x0

    .line 34
    if-nez p0, :cond_1

    .line 51
    .end local p1    # "d":Z
    :cond_0
    :goto_0
    return p1

    .line 37
    .restart local p1    # "d":Z
    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    .line 38
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-eqz v2, :cond_0

    .line 41
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 43
    .local v0, "c":C
    const/16 v2, 0x74

    if-eq v0, v2, :cond_2

    const/16 v2, 0x54

    if-eq v0, v2, :cond_2

    const/16 v2, 0x79

    if-eq v0, v2, :cond_2

    const/16 v2, 0x59

    if-ne v0, v2, :cond_3

    .line 45
    :cond_2
    const/4 p1, 0x1

    goto :goto_0

    .line 47
    :cond_3
    const/16 v2, 0x66

    if-eq v0, v2, :cond_4

    const/16 v2, 0x46

    if-eq v0, v2, :cond_4

    const/16 v2, 0x6e

    if-eq v0, v2, :cond_4

    const/16 v2, 0x4e

    if-ne v0, v2, :cond_0

    :cond_4
    move p1, v1

    .line 49
    goto :goto_0
.end method

.method public static parseIfInt(Ljava/lang/String;I)I
    .locals 2
    .param p0, "s"    # Ljava/lang/String;
    .param p1, "def"    # I

    .prologue
    .line 258
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_1

    .line 267
    .end local p1    # "def":I
    :cond_0
    :goto_0
    return p1

    .line 261
    .restart local p1    # "def":I
    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    .line 263
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-ge v0, v1, :cond_2

    .line 264
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v1

    invoke-static {v1}, Ljava/lang/Character;->isDigit(C)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 263
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 267
    :cond_2
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p1

    goto :goto_0
.end method

.method public static parseInt(Ljava/lang/String;I)I
    .locals 2
    .param p0, "s"    # Ljava/lang/String;
    .param p1, "def"    # I

    .prologue
    .line 60
    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-static {p0, p1, v0, v1}, Lcom/mongodb/util/StringParseUtil;->parseInt(Ljava/lang/String;I[IZ)I

    move-result v0

    return v0
.end method

.method public static parseInt(Ljava/lang/String;I[IZ)I
    .locals 7
    .param p0, "s"    # Ljava/lang/String;
    .param p1, "def"    # I
    .param p2, "lastIdx"    # [I
    .param p3, "allowNegative"    # Z

    .prologue
    const/4 v4, 0x0

    .line 103
    if-eqz p2, :cond_2

    array-length v5, p2

    if-lez v5, :cond_2

    const/4 v3, 0x1

    .line 104
    .local v3, "useLastIdx":Z
    :goto_0
    if-eqz v3, :cond_0

    .line 105
    const/4 v5, -0x1

    aput v5, p2, v4

    .line 107
    :cond_0
    if-nez p0, :cond_3

    .line 134
    .end local p1    # "def":I
    :cond_1
    :goto_1
    return p1

    .end local v3    # "useLastIdx":Z
    .restart local p1    # "def":I
    :cond_2
    move v3, v4

    .line 103
    goto :goto_0

    .line 110
    .restart local v3    # "useLastIdx":Z
    :cond_3
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    .line 111
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    if-eqz v5, :cond_1

    .line 114
    const/4 v0, -0x1

    .line 115
    .local v0, "firstDigit":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_2
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    if-ge v1, v5, :cond_4

    .line 116
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v5

    invoke-static {v5}, Ljava/lang/Character;->isDigit(C)Z

    move-result v5

    if-eqz v5, :cond_5

    .line 117
    move v0, v1

    .line 122
    :cond_4
    if-ltz v0, :cond_1

    .line 125
    add-int/lit8 v2, v0, 0x1

    .line 126
    .local v2, "lastDigit":I
    :goto_3
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    if-ge v2, v5, :cond_6

    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v5

    invoke-static {v5}, Ljava/lang/Character;->isDigit(C)Z

    move-result v5

    if-eqz v5, :cond_6

    .line 127
    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    .line 115
    .end local v2    # "lastDigit":I
    :cond_5
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 129
    .restart local v2    # "lastDigit":I
    :cond_6
    if-eqz p3, :cond_7

    if-lez v0, :cond_7

    add-int/lit8 v5, v0, -0x1

    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    const/16 v6, 0x2d

    if-ne v5, v6, :cond_7

    .line 130
    add-int/lit8 v0, v0, -0x1

    .line 132
    :cond_7
    if-eqz v3, :cond_8

    .line 133
    aput v2, p2, v4

    .line 134
    :cond_8
    invoke-virtual {p0, v0, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p1

    goto :goto_1
.end method

.method public static parseIntRadix(Ljava/lang/String;I)Ljava/lang/Number;
    .locals 8
    .param p0, "s"    # Ljava/lang/String;
    .param p1, "radix"    # I

    .prologue
    const/4 v4, 0x0

    const-wide/high16 v6, 0x7ff8000000000000L    # Double.NaN

    .line 69
    if-nez p0, :cond_0

    .line 70
    invoke-static {v6, v7}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v3

    .line 91
    :goto_0
    return-object v3

    .line 72
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    .line 73
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    if-nez v3, :cond_1

    .line 74
    invoke-static {v6, v7}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v3

    goto :goto_0

    .line 76
    :cond_1
    const/4 v1, -0x1

    .line 77
    .local v1, "firstDigit":I
    const/4 v2, 0x0

    .line 78
    .local v2, "i":I
    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x2d

    if-ne v3, v4, :cond_2

    .line 79
    const/4 v2, 0x1

    .line 81
    :cond_2
    :goto_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v2, v3, :cond_3

    .line 82
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-static {v3, p1}, Ljava/lang/Character;->digit(CI)I

    move-result v3

    const/4 v4, -0x1

    if-ne v3, v4, :cond_4

    .line 88
    :cond_3
    const/4 v3, 0x0

    :try_start_0
    invoke-virtual {p0, v3, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3, p1}, Ljava/lang/Long;->valueOf(Ljava/lang/String;I)Ljava/lang/Long;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    goto :goto_0

    .line 81
    :cond_4
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 90
    :catch_0
    move-exception v0

    .line 91
    .local v0, "e":Ljava/lang/Exception;
    invoke-static {v6, v7}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v3

    goto :goto_0
.end method

.method public static parseNumber(Ljava/lang/String;Ljava/lang/Number;)Ljava/lang/Number;
    .locals 8
    .param p0, "s"    # Ljava/lang/String;
    .param p1, "def"    # Ljava/lang/Number;

    .prologue
    const/16 v7, 0x2e

    .line 143
    if-nez p0, :cond_1

    .line 202
    .end local p1    # "def":Ljava/lang/Number;
    :cond_0
    :goto_0
    return-object p1

    .line 146
    .restart local p1    # "def":Ljava/lang/Number;
    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    .line 147
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    if-eqz v5, :cond_0

    .line 151
    const/4 v1, -0x1

    .line 152
    .local v1, "firstDigit":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    if-ge v2, v5, :cond_2

    .line 153
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v5

    invoke-static {v5}, Ljava/lang/Character;->isDigit(C)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 154
    move v1, v2

    .line 159
    :cond_2
    if-ltz v1, :cond_0

    .line 162
    add-int/lit8 v4, v1, 0x1

    .line 163
    .local v4, "lastDigit":I
    :goto_2
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    if-ge v4, v5, :cond_4

    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v5

    invoke-static {v5}, Ljava/lang/Character;->isDigit(C)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 164
    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    .line 152
    .end local v4    # "lastDigit":I
    :cond_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 166
    .restart local v4    # "lastDigit":I
    :cond_4
    const/4 v3, 0x0

    .line 168
    .local v3, "isDouble":Z
    if-lez v1, :cond_5

    add-int/lit8 v5, v1, -0x1

    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    if-ne v5, v7, :cond_5

    .line 169
    add-int/lit8 v1, v1, -0x1

    .line 170
    const/4 v3, 0x1

    .line 173
    :cond_5
    if-lez v1, :cond_6

    add-int/lit8 v5, v1, -0x1

    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    const/16 v6, 0x2d

    if-ne v5, v6, :cond_6

    .line 174
    add-int/lit8 v1, v1, -0x1

    .line 176
    :cond_6
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    if-ge v4, v5, :cond_8

    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v5

    if-ne v5, v7, :cond_8

    .line 177
    add-int/lit8 v4, v4, 0x1

    .line 178
    :goto_3
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    if-ge v4, v5, :cond_7

    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v5

    invoke-static {v5}, Ljava/lang/Character;->isDigit(C)Z

    move-result v5

    if-eqz v5, :cond_7

    .line 179
    add-int/lit8 v4, v4, 0x1

    goto :goto_3

    .line 181
    :cond_7
    const/4 v3, 0x1

    .line 184
    :cond_8
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    if-ge v4, v5, :cond_a

    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v5

    const/16 v6, 0x45

    if-ne v5, v6, :cond_a

    .line 185
    add-int/lit8 v4, v4, 0x1

    .line 186
    :goto_4
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    if-ge v4, v5, :cond_9

    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v5

    invoke-static {v5}, Ljava/lang/Character;->isDigit(C)Z

    move-result v5

    if-eqz v5, :cond_9

    .line 187
    add-int/lit8 v4, v4, 0x1

    goto :goto_4

    .line 189
    :cond_9
    const/4 v3, 0x1

    .line 193
    :cond_a
    invoke-virtual {p0, v1, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 195
    .local v0, "actual":Ljava/lang/String;
    if-nez v3, :cond_b

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v5

    const/16 v6, 0x11

    if-le v5, v6, :cond_c

    .line 196
    :cond_b
    invoke-static {v0}, Ljava/lang/Double;->valueOf(Ljava/lang/String;)Ljava/lang/Double;

    move-result-object p1

    goto/16 :goto_0

    .line 199
    :cond_c
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v5

    const/16 v6, 0xa

    if-le v5, v6, :cond_d

    .line 200
    invoke-static {v0}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object p1

    goto/16 :goto_0

    .line 202
    :cond_d
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object p1

    goto/16 :goto_0
.end method

.method public static parseStrict(Ljava/lang/String;)Ljava/lang/Number;
    .locals 14
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x1

    const-wide/high16 v12, 0x4004000000000000L    # 2.5

    const-wide/high16 v10, -0x4020000000000000L    # -0.5

    const/4 v0, -0x1

    const/4 v8, 0x0

    .line 210
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v6

    if-nez v6, :cond_0

    .line 211
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    .line 254
    :goto_0
    return-object v3

    .line 212
    :cond_0
    invoke-virtual {p0, v8}, Ljava/lang/String;->charAt(I)C

    move-result v6

    const/16 v7, 0x2b

    if-ne v6, v7, :cond_1

    .line 213
    invoke-virtual {p0, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    .line 215
    :cond_1
    const-string/jumbo v6, "(\\+|-)?Infinity"

    invoke-virtual {p0, v6}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 216
    const-string/jumbo v3, "-"

    invoke-virtual {p0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 217
    const-wide/high16 v6, -0x10000000000000L    # Double.NEGATIVE_INFINITY

    invoke-static {v6, v7}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v3

    goto :goto_0

    .line 220
    :cond_2
    const-wide/high16 v6, 0x7ff0000000000000L    # Double.POSITIVE_INFINITY

    invoke-static {v6, v7}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v3

    goto :goto_0

    .line 223
    :cond_3
    const/16 v6, 0x2e

    invoke-virtual {p0, v6}, Ljava/lang/String;->indexOf(I)I

    move-result v6

    if-ne v6, v0, :cond_4

    const-string/jumbo v6, "-0"

    invoke-virtual {p0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_5

    .line 225
    :cond_4
    invoke-static {p0}, Ljava/lang/Double;->valueOf(Ljava/lang/String;)Ljava/lang/Double;

    move-result-object v3

    goto :goto_0

    .line 228
    :cond_5
    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v6

    const-string/jumbo v7, "0x"

    invoke-virtual {v6, v7}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v6

    if-le v6, v0, :cond_9

    .line 229
    invoke-virtual {p0, v8}, Ljava/lang/String;->charAt(I)C

    move-result v6

    const/16 v7, 0x2d

    if-ne v6, v7, :cond_6

    .line 230
    .local v0, "coef":I
    :goto_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    const/16 v6, 0x11

    if-le v3, v6, :cond_7

    .line 231
    new-instance v3, Ljava/lang/RuntimeException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "Can\'t handle a number this big: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v3, v6}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v3

    .end local v0    # "coef":I
    :cond_6
    move v0, v3

    .line 229
    goto :goto_1

    .line 236
    .restart local v0    # "coef":I
    :cond_7
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    const/16 v6, 0x9

    if-le v3, v6, :cond_8

    .line 237
    int-to-long v6, v0

    int-to-double v8, v0

    mul-double/2addr v8, v10

    add-double/2addr v8, v12

    double-to-int v3, v8

    invoke-virtual {p0, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    const/16 v8, 0x10

    invoke-static {v3, v8}, Ljava/lang/Long;->valueOf(Ljava/lang/String;I)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    move-result-wide v8

    mul-long/2addr v6, v8

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    goto/16 :goto_0

    .line 238
    :cond_8
    int-to-double v6, v0

    mul-double/2addr v6, v10

    add-double/2addr v6, v12

    double-to-int v3, v6

    invoke-virtual {p0, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    const/16 v6, 0x10

    invoke-static {v3, v6}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    mul-int/2addr v3, v0

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    goto/16 :goto_0

    .line 241
    .end local v0    # "coef":I
    :cond_9
    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v3

    const/16 v6, 0x65

    invoke-virtual {v3, v6}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    .line 243
    .local v1, "e":I
    if-lez v1, :cond_a

    .line 244
    invoke-virtual {p0, v8, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v4

    .line 245
    .local v4, "num":D
    add-int/lit8 v3, v1, 0x1

    invoke-virtual {p0, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    .line 246
    .local v2, "exp":I
    const-wide/high16 v6, 0x4024000000000000L    # 10.0

    int-to-double v8, v2

    invoke-static {v6, v7, v8, v9}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v6

    mul-double/2addr v6, v4

    invoke-static {v6, v7}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v3

    goto/16 :goto_0

    .line 250
    .end local v2    # "exp":I
    .end local v4    # "num":D
    :cond_a
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    const/16 v6, 0x11

    if-le v3, v6, :cond_b

    .line 251
    invoke-static {p0}, Ljava/lang/Double;->valueOf(Ljava/lang/String;)Ljava/lang/Double;

    move-result-object v3

    goto/16 :goto_0

    .line 252
    :cond_b
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    const/16 v6, 0x9

    if-le v3, v6, :cond_c

    .line 253
    invoke-static {p0}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v3

    goto/16 :goto_0

    .line 254
    :cond_c
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v3

    goto/16 :goto_0
.end method
