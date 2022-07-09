.class public final Lorg/apache/tools/ant/util/StringUtils;
.super Ljava/lang/Object;
.source "StringUtils.java"


# static fields
.field private static final GIGABYTE:J = 0x40000000L

.field private static final KILOBYTE:J = 0x400L

.field public static final LINE_SEP:Ljava/lang/String;

.field private static final MEGABYTE:J = 0x100000L

.field private static final PETABYTE:J = 0x4000000000000L

.field private static final TERABYTE:J = 0x10000000000L


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 44
    const-string/jumbo v0, "line.separator"

    invoke-static {v0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/util/StringUtils;->LINE_SEP:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    return-void
.end method

.method public static endsWith(Ljava/lang/StringBuffer;Ljava/lang/String;)Z
    .locals 5
    .param p0, "buffer"    # Ljava/lang/StringBuffer;
    .param p1, "suffix"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 124
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    invoke-virtual {p0}, Ljava/lang/StringBuffer;->length()I

    move-result v4

    if-le v3, v4, :cond_1

    .line 143
    :cond_0
    :goto_0
    return v2

    .line 134
    :cond_1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v1, v3, -0x1

    .line 135
    .local v1, "endIndex":I
    invoke-virtual {p0}, Ljava/lang/StringBuffer;->length()I

    move-result v3

    add-int/lit8 v0, v3, -0x1

    .line 136
    .local v0, "bufferIndex":I
    :goto_1
    if-ltz v1, :cond_2

    .line 137
    invoke-virtual {p0, v0}, Ljava/lang/StringBuffer;->charAt(I)C

    move-result v3

    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-ne v3, v4, :cond_0

    .line 140
    add-int/lit8 v0, v0, -0x1

    .line 141
    add-int/lit8 v1, v1, -0x1

    goto :goto_1

    .line 143
    :cond_2
    const/4 v2, 0x1

    goto :goto_0
.end method

.method public static getStackTrace(Ljava/lang/Throwable;)Ljava/lang/String;
    .locals 3
    .param p0, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 101
    new-instance v1, Ljava/io/StringWriter;

    invoke-direct {v1}, Ljava/io/StringWriter;-><init>()V

    .line 102
    .local v1, "sw":Ljava/io/StringWriter;
    new-instance v0, Ljava/io/PrintWriter;

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;Z)V

    .line 103
    .local v0, "pw":Ljava/io/PrintWriter;
    invoke-virtual {p0, v0}, Ljava/lang/Throwable;->printStackTrace(Ljava/io/PrintWriter;)V

    .line 104
    invoke-virtual {v0}, Ljava/io/PrintWriter;->flush()V

    .line 105
    invoke-virtual {v0}, Ljava/io/PrintWriter;->close()V

    .line 106
    invoke-virtual {v1}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public static lineSplit(Ljava/lang/String;)Ljava/util/Vector;
    .locals 1
    .param p0, "data"    # Ljava/lang/String;

    .prologue
    .line 53
    const/16 v0, 0xa

    invoke-static {p0, v0}, Lorg/apache/tools/ant/util/StringUtils;->split(Ljava/lang/String;I)Ljava/util/Vector;

    move-result-object v0

    return-object v0
.end method

.method public static parseHumanSizes(Ljava/lang/String;)J
    .locals 9
    .param p0, "humanSize"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v6, 0x1

    const/4 v8, 0x0

    .line 206
    const-wide/16 v2, 0x1

    .line 207
    .local v2, "factor":J
    invoke-virtual {p0, v8}, Ljava/lang/String;->charAt(I)C

    move-result v4

    .line 208
    .local v4, "s":C
    packed-switch v4, :pswitch_data_0

    .line 220
    :goto_0
    :pswitch_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v6

    add-int/lit8 v6, v6, -0x1

    invoke-virtual {p0, v6}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 221
    .local v0, "c":C
    invoke-static {v0}, Ljava/lang/Character;->isDigit(C)Z

    move-result v6

    if-nez v6, :cond_0

    .line 222
    const/4 v5, 0x1

    .line 223
    .local v5, "trim":I
    sparse-switch v0, :sswitch_data_0

    .line 240
    const/4 v5, 0x0

    .line 242
    :goto_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v6

    sub-int/2addr v6, v5

    invoke-virtual {p0, v8, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    .line 245
    .end local v5    # "trim":I
    :cond_0
    :try_start_0
    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v6

    mul-long/2addr v6, v2

    return-wide v6

    .line 210
    .end local v0    # "c":C
    :pswitch_1
    invoke-virtual {p0, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    .line 211
    goto :goto_0

    .line 213
    :pswitch_2
    const-wide/16 v2, -0x1

    .line 214
    invoke-virtual {p0, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    .line 215
    goto :goto_0

    .line 225
    .restart local v0    # "c":C
    .restart local v5    # "trim":I
    :sswitch_0
    const-wide/16 v6, 0x400

    mul-long/2addr v2, v6

    .line 226
    goto :goto_1

    .line 228
    :sswitch_1
    const-wide/32 v6, 0x100000

    mul-long/2addr v2, v6

    .line 229
    goto :goto_1

    .line 231
    :sswitch_2
    const-wide/32 v6, 0x40000000

    mul-long/2addr v2, v6

    .line 232
    goto :goto_1

    .line 234
    :sswitch_3
    const-wide v6, 0x10000000000L

    mul-long/2addr v2, v6

    .line 235
    goto :goto_1

    .line 237
    :sswitch_4
    const-wide/high16 v6, 0x4000000000000L

    mul-long/2addr v2, v6

    .line 238
    goto :goto_1

    .line 246
    .end local v5    # "trim":I
    :catch_0
    move-exception v1

    .line 247
    .local v1, "e":Ljava/lang/NumberFormatException;
    new-instance v6, Lorg/apache/tools/ant/BuildException;

    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v8, "Failed to parse \""

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string/jumbo v8, "\""

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v6

    .line 208
    :pswitch_data_0
    .packed-switch 0x2b
        :pswitch_1
        :pswitch_0
        :pswitch_2
    .end packed-switch

    .line 223
    :sswitch_data_0
    .sparse-switch
        0x47 -> :sswitch_2
        0x4b -> :sswitch_0
        0x4d -> :sswitch_1
        0x50 -> :sswitch_4
        0x54 -> :sswitch_3
    .end sparse-switch
.end method

.method public static removePrefix(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "string"    # Ljava/lang/String;
    .param p1, "prefix"    # Ljava/lang/String;

    .prologue
    .line 274
    invoke-virtual {p0, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 275
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    .line 277
    .end local p0    # "string":Ljava/lang/String;
    :cond_0
    return-object p0
.end method

.method public static removeSuffix(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "string"    # Ljava/lang/String;
    .param p1, "suffix"    # Ljava/lang/String;

    .prologue
    .line 259
    invoke-virtual {p0, p1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 260
    const/4 v0, 0x0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    sub-int/2addr v1, v2

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    .line 262
    .end local p0    # "string":Ljava/lang/String;
    :cond_0
    return-object p0
.end method

.method public static replace(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p0, "data"    # Ljava/lang/String;
    .param p1, "from"    # Ljava/lang/String;
    .param p2, "to"    # Ljava/lang/String;

    .prologue
    .line 84
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    invoke-direct {v0, v3}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 85
    .local v0, "buf":Ljava/lang/StringBuffer;
    const/4 v2, -0x1

    .line 86
    .local v2, "pos":I
    const/4 v1, 0x0

    .line 87
    .local v1, "i":I
    :goto_0
    invoke-virtual {p0, p1, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v2

    const/4 v3, -0x1

    if-eq v2, v3, :cond_0

    .line 88
    invoke-virtual {p0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 89
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    add-int v1, v2, v3

    goto :goto_0

    .line 91
    :cond_0
    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 92
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method public static resolveBackSlash(Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .param p0, "input"    # Ljava/lang/String;

    .prologue
    const/16 v5, 0x5c

    .line 158
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 159
    .local v0, "b":Ljava/lang/StringBuffer;
    const/4 v1, 0x0

    .line 160
    .local v1, "backSlashSeen":Z
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    if-ge v3, v4, :cond_2

    .line 161
    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 162
    .local v2, "c":C
    if-nez v1, :cond_1

    .line 163
    if-ne v2, v5, :cond_0

    .line 164
    const/4 v1, 0x1

    .line 160
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 166
    :cond_0
    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_1

    .line 169
    :cond_1
    sparse-switch v2, :sswitch_data_0

    .line 189
    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 191
    :goto_2
    const/4 v1, 0x0

    goto :goto_1

    .line 171
    :sswitch_0
    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_2

    .line 174
    :sswitch_1
    const/16 v4, 0xa

    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_2

    .line 177
    :sswitch_2
    const/16 v4, 0xd

    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_2

    .line 180
    :sswitch_3
    const/16 v4, 0x9

    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_2

    .line 183
    :sswitch_4
    const/16 v4, 0xc

    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_2

    .line 186
    :sswitch_5
    const-string/jumbo v4, " \t\n\r\u000c"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_2

    .line 194
    .end local v2    # "c":C
    :cond_2
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4

    .line 169
    nop

    :sswitch_data_0
    .sparse-switch
        0x5c -> :sswitch_0
        0x66 -> :sswitch_4
        0x6e -> :sswitch_1
        0x72 -> :sswitch_2
        0x73 -> :sswitch_5
        0x74 -> :sswitch_3
    .end sparse-switch
.end method

.method public static split(Ljava/lang/String;I)Ljava/util/Vector;
    .locals 5
    .param p0, "data"    # Ljava/lang/String;
    .param p1, "ch"    # I

    .prologue
    .line 64
    new-instance v1, Ljava/util/Vector;

    invoke-direct {v1}, Ljava/util/Vector;-><init>()V

    .line 65
    .local v1, "elems":Ljava/util/Vector;
    const/4 v3, -0x1

    .line 66
    .local v3, "pos":I
    const/4 v2, 0x0

    .line 67
    .local v2, "i":I
    :goto_0
    invoke-virtual {p0, p1, v2}, Ljava/lang/String;->indexOf(II)I

    move-result v3

    const/4 v4, -0x1

    if-eq v3, v4, :cond_0

    .line 68
    invoke-virtual {p0, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 69
    .local v0, "elem":Ljava/lang/String;
    invoke-virtual {v1, v0}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 70
    add-int/lit8 v2, v3, 0x1

    goto :goto_0

    .line 72
    .end local v0    # "elem":Ljava/lang/String;
    :cond_0
    invoke-virtual {p0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 73
    return-object v1
.end method
