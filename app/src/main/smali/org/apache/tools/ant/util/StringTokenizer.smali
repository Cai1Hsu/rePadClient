.class public Lorg/apache/tools/ant/util/StringTokenizer;
.super Lorg/apache/tools/ant/ProjectComponent;
.source "StringTokenizer.java"

# interfaces
.implements Lorg/apache/tools/ant/util/Tokenizer;


# static fields
.field private static final NOT_A_CHAR:I = -0x2


# instance fields
.field private delims:[C

.field private delimsAreTokens:Z

.field private includeDelims:Z

.field private intraString:Ljava/lang/String;

.field private pushed:I

.field private suppressDelims:Z


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 33
    invoke-direct {p0}, Lorg/apache/tools/ant/ProjectComponent;-><init>()V

    .line 35
    const-string/jumbo v0, ""

    iput-object v0, p0, Lorg/apache/tools/ant/util/StringTokenizer;->intraString:Ljava/lang/String;

    .line 36
    const/4 v0, -0x2

    iput v0, p0, Lorg/apache/tools/ant/util/StringTokenizer;->pushed:I

    .line 37
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/util/StringTokenizer;->delims:[C

    .line 38
    iput-boolean v1, p0, Lorg/apache/tools/ant/util/StringTokenizer;->delimsAreTokens:Z

    .line 39
    iput-boolean v1, p0, Lorg/apache/tools/ant/util/StringTokenizer;->suppressDelims:Z

    .line 40
    iput-boolean v1, p0, Lorg/apache/tools/ant/util/StringTokenizer;->includeDelims:Z

    return-void
.end method

.method private isDelim(C)Z
    .locals 2
    .param p1, "ch"    # C

    .prologue
    .line 143
    iget-object v1, p0, Lorg/apache/tools/ant/util/StringTokenizer;->delims:[C

    if-nez v1, :cond_0

    .line 144
    invoke-static {p1}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v1

    .line 151
    :goto_0
    return v1

    .line 146
    :cond_0
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    iget-object v1, p0, Lorg/apache/tools/ant/util/StringTokenizer;->delims:[C

    array-length v1, v1

    if-ge v0, v1, :cond_2

    .line 147
    iget-object v1, p0, Lorg/apache/tools/ant/util/StringTokenizer;->delims:[C

    aget-char v1, v1, v0

    if-ne v1, p1, :cond_1

    .line 148
    const/4 v1, 0x1

    goto :goto_0

    .line 146
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 151
    :cond_2
    const/4 v1, 0x0

    goto :goto_0
.end method


# virtual methods
.method public getPostToken()Ljava/lang/String;
    .locals 1

    .prologue
    .line 139
    iget-boolean v0, p0, Lorg/apache/tools/ant/util/StringTokenizer;->suppressDelims:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lorg/apache/tools/ant/util/StringTokenizer;->includeDelims:Z

    if-eqz v0, :cond_1

    :cond_0
    const-string/jumbo v0, ""

    :goto_0
    return-object v0

    :cond_1
    iget-object v0, p0, Lorg/apache/tools/ant/util/StringTokenizer;->intraString:Ljava/lang/String;

    goto :goto_0
.end method

.method public getToken(Ljava/io/Reader;)Ljava/lang/String;
    .locals 9
    .param p1, "in"    # Ljava/io/Reader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v8, -0x1

    const/4 v7, -0x2

    .line 86
    const/4 v1, -0x1

    .line 87
    .local v1, "ch":I
    iget v6, p0, Lorg/apache/tools/ant/util/StringTokenizer;->pushed:I

    if-eq v6, v7, :cond_0

    .line 88
    iget v1, p0, Lorg/apache/tools/ant/util/StringTokenizer;->pushed:I

    .line 89
    iput v7, p0, Lorg/apache/tools/ant/util/StringTokenizer;->pushed:I

    .line 93
    :goto_0
    if-ne v1, v8, :cond_1

    .line 94
    const/4 v6, 0x0

    .line 132
    :goto_1
    return-object v6

    .line 91
    :cond_0
    invoke-virtual {p1}, Ljava/io/Reader;->read()I

    move-result v1

    goto :goto_0

    .line 96
    :cond_1
    const/4 v2, 0x1

    .line 97
    .local v2, "inToken":Z
    const-string/jumbo v6, ""

    iput-object v6, p0, Lorg/apache/tools/ant/util/StringTokenizer;->intraString:Ljava/lang/String;

    .line 98
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    .line 99
    .local v5, "word":Ljava/lang/StringBuffer;
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    .line 100
    .local v4, "padding":Ljava/lang/StringBuffer;
    :goto_2
    if-eq v1, v8, :cond_2

    .line 101
    int-to-char v0, v1

    .line 102
    .local v0, "c":C
    invoke-direct {p0, v0}, Lorg/apache/tools/ant/util/StringTokenizer;->isDelim(C)Z

    move-result v3

    .line 103
    .local v3, "isDelim":Z
    if-eqz v2, :cond_7

    .line 104
    if-eqz v3, :cond_6

    .line 105
    iget-boolean v6, p0, Lorg/apache/tools/ant/util/StringTokenizer;->delimsAreTokens:Z

    if-eqz v6, :cond_5

    .line 106
    invoke-virtual {v5}, Ljava/lang/StringBuffer;->length()I

    move-result v6

    if-nez v6, :cond_4

    .line 107
    invoke-virtual {v5, v0}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 128
    .end local v0    # "c":C
    .end local v3    # "isDelim":Z
    :cond_2
    :goto_3
    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lorg/apache/tools/ant/util/StringTokenizer;->intraString:Ljava/lang/String;

    .line 129
    iget-boolean v6, p0, Lorg/apache/tools/ant/util/StringTokenizer;->includeDelims:Z

    if-eqz v6, :cond_3

    .line 130
    iget-object v6, p0, Lorg/apache/tools/ant/util/StringTokenizer;->intraString:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 132
    :cond_3
    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    goto :goto_1

    .line 109
    .restart local v0    # "c":C
    .restart local v3    # "isDelim":Z
    :cond_4
    iput v1, p0, Lorg/apache/tools/ant/util/StringTokenizer;->pushed:I

    goto :goto_3

    .line 113
    :cond_5
    invoke-virtual {v4, v0}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 114
    const/4 v2, 0x0

    .line 126
    :goto_4
    invoke-virtual {p1}, Ljava/io/Reader;->read()I

    move-result v1

    goto :goto_2

    .line 116
    :cond_6
    invoke-virtual {v5, v0}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_4

    .line 119
    :cond_7
    if-eqz v3, :cond_8

    .line 120
    invoke-virtual {v4, v0}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_4

    .line 122
    :cond_8
    iput v1, p0, Lorg/apache/tools/ant/util/StringTokenizer;->pushed:I

    goto :goto_3
.end method

.method public setDelims(Ljava/lang/String;)V
    .locals 1
    .param p1, "delims"    # Ljava/lang/String;

    .prologue
    .line 47
    invoke-static {p1}, Lorg/apache/tools/ant/util/StringUtils;->resolveBackSlash(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/util/StringTokenizer;->delims:[C

    .line 48
    return-void
.end method

.method public setDelimsAreTokens(Z)V
    .locals 0
    .param p1, "delimsAreTokens"    # Z

    .prologue
    .line 57
    iput-boolean p1, p0, Lorg/apache/tools/ant/util/StringTokenizer;->delimsAreTokens:Z

    .line 58
    return-void
.end method

.method public setIncludeDelims(Z)V
    .locals 0
    .param p1, "includeDelims"    # Z

    .prologue
    .line 75
    iput-boolean p1, p0, Lorg/apache/tools/ant/util/StringTokenizer;->includeDelims:Z

    .line 76
    return-void
.end method

.method public setSuppressDelims(Z)V
    .locals 0
    .param p1, "suppressDelims"    # Z

    .prologue
    .line 65
    iput-boolean p1, p0, Lorg/apache/tools/ant/util/StringTokenizer;->suppressDelims:Z

    .line 66
    return-void
.end method
