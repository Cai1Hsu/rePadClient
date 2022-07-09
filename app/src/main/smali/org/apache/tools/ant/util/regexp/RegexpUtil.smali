.class public Lorg/apache/tools/ant/util/regexp/RegexpUtil;
.super Ljava/lang/Object;
.source "RegexpUtil.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static asOptions(Ljava/lang/String;)I
    .locals 7
    .param p0, "flags"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    const/4 v6, -0x1

    .line 63
    const/4 v0, 0x0

    .line 64
    .local v0, "options":I
    if-eqz p0, :cond_0

    .line 65
    const/16 v1, 0x69

    invoke-virtual {p0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    if-ne v1, v6, :cond_1

    move v1, v2

    :goto_0
    const/16 v4, 0x6d

    invoke-virtual {p0, v4}, Ljava/lang/String;->indexOf(I)I

    move-result v4

    if-eq v4, v6, :cond_2

    move v4, v2

    :goto_1
    const/16 v5, 0x73

    invoke-virtual {p0, v5}, Ljava/lang/String;->indexOf(I)I

    move-result v5

    if-eq v5, v6, :cond_3

    :goto_2
    invoke-static {v1, v4, v2}, Lorg/apache/tools/ant/util/regexp/RegexpUtil;->asOptions(ZZZ)I

    move-result v0

    .line 68
    const/16 v1, 0x67

    invoke-virtual {p0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    if-eq v1, v6, :cond_0

    .line 69
    or-int/lit8 v0, v0, 0x10

    .line 72
    :cond_0
    return v0

    :cond_1
    move v1, v3

    .line 65
    goto :goto_0

    :cond_2
    move v4, v3

    goto :goto_1

    :cond_3
    move v2, v3

    goto :goto_2
.end method

.method public static asOptions(Z)I
    .locals 1
    .param p0, "caseSensitive"    # Z

    .prologue
    const/4 v0, 0x0

    .line 83
    invoke-static {p0, v0, v0}, Lorg/apache/tools/ant/util/regexp/RegexpUtil;->asOptions(ZZZ)I

    move-result v0

    return v0
.end method

.method public static asOptions(ZZZ)I
    .locals 2
    .param p0, "caseSensitive"    # Z
    .param p1, "multiLine"    # Z
    .param p2, "singleLine"    # Z

    .prologue
    .line 97
    const/4 v0, 0x0

    .line 98
    .local v0, "options":I
    if-nez p0, :cond_0

    .line 99
    or-int/lit16 v0, v0, 0x100

    .line 101
    :cond_0
    if-eqz p1, :cond_1

    .line 102
    or-int/lit16 v0, v0, 0x1000

    .line 104
    :cond_1
    if-eqz p2, :cond_2

    .line 105
    const/high16 v1, 0x10000

    or-int/2addr v0, v1

    .line 107
    :cond_2
    return v0
.end method

.method public static hasFlag(II)Z
    .locals 1
    .param p0, "options"    # I
    .param p1, "flag"    # I

    .prologue
    .line 36
    and-int v0, p0, p1

    if-lez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static removeFlag(II)I
    .locals 1
    .param p0, "options"    # I
    .param p1, "flag"    # I

    .prologue
    .line 47
    rsub-int/lit8 v0, p1, -0x1

    and-int/2addr v0, p0

    return v0
.end method
