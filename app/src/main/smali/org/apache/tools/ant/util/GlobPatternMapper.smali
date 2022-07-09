.class public Lorg/apache/tools/ant/util/GlobPatternMapper;
.super Ljava/lang/Object;
.source "GlobPatternMapper.java"

# interfaces
.implements Lorg/apache/tools/ant/util/FileNameMapper;


# instance fields
.field private caseSensitive:Z

.field private fromContainsStar:Z

.field protected fromPostfix:Ljava/lang/String;

.field protected fromPrefix:Ljava/lang/String;

.field private handleDirSep:Z

.field protected postfixLength:I

.field protected prefixLength:I

.field private toContainsStar:Z

.field protected toPostfix:Ljava/lang/String;

.field protected toPrefix:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x0

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    iput-object v0, p0, Lorg/apache/tools/ant/util/GlobPatternMapper;->fromPrefix:Ljava/lang/String;

    .line 47
    iput-object v0, p0, Lorg/apache/tools/ant/util/GlobPatternMapper;->fromPostfix:Ljava/lang/String;

    .line 62
    iput-object v0, p0, Lorg/apache/tools/ant/util/GlobPatternMapper;->toPrefix:Ljava/lang/String;

    .line 67
    iput-object v0, p0, Lorg/apache/tools/ant/util/GlobPatternMapper;->toPostfix:Ljava/lang/String;

    .line 71
    iput-boolean v1, p0, Lorg/apache/tools/ant/util/GlobPatternMapper;->fromContainsStar:Z

    .line 72
    iput-boolean v1, p0, Lorg/apache/tools/ant/util/GlobPatternMapper;->toContainsStar:Z

    .line 73
    iput-boolean v1, p0, Lorg/apache/tools/ant/util/GlobPatternMapper;->handleDirSep:Z

    .line 74
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/util/GlobPatternMapper;->caseSensitive:Z

    return-void
.end method

.method private modifyName(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    const/16 v2, 0x5c

    .line 193
    iget-boolean v0, p0, Lorg/apache/tools/ant/util/GlobPatternMapper;->caseSensitive:Z

    if-nez v0, :cond_0

    .line 194
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p1

    .line 196
    :cond_0
    iget-boolean v0, p0, Lorg/apache/tools/ant/util/GlobPatternMapper;->handleDirSep:Z

    if-eqz v0, :cond_1

    .line 197
    invoke-virtual {p1, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_1

    .line 198
    const/16 v0, 0x2f

    invoke-virtual {p1, v2, v0}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object p1

    .line 201
    :cond_1
    return-object p1
.end method


# virtual methods
.method protected extractVariablePart(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 183
    iget v0, p0, Lorg/apache/tools/ant/util/GlobPatternMapper;->prefixLength:I

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    iget v2, p0, Lorg/apache/tools/ant/util/GlobPatternMapper;->postfixLength:I

    sub-int/2addr v1, v2

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getHandleDirSep()Z
    .locals 1

    .prologue
    .line 92
    iget-boolean v0, p0, Lorg/apache/tools/ant/util/GlobPatternMapper;->handleDirSep:Z

    return v0
.end method

.method public mapFileName(Ljava/lang/String;)[Ljava/lang/String;
    .locals 6
    .param p1, "sourceFileName"    # Ljava/lang/String;

    .prologue
    .line 156
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/util/GlobPatternMapper;->modifyName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 157
    .local v0, "modName":Ljava/lang/String;
    iget-object v1, p0, Lorg/apache/tools/ant/util/GlobPatternMapper;->fromPrefix:Ljava/lang/String;

    if-eqz v1, :cond_1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    iget v2, p0, Lorg/apache/tools/ant/util/GlobPatternMapper;->prefixLength:I

    iget v3, p0, Lorg/apache/tools/ant/util/GlobPatternMapper;->postfixLength:I

    add-int/2addr v2, v3

    if-lt v1, v2, :cond_1

    iget-boolean v1, p0, Lorg/apache/tools/ant/util/GlobPatternMapper;->fromContainsStar:Z

    if-nez v1, :cond_0

    iget-object v1, p0, Lorg/apache/tools/ant/util/GlobPatternMapper;->fromPrefix:Ljava/lang/String;

    invoke-direct {p0, v1}, Lorg/apache/tools/ant/util/GlobPatternMapper;->modifyName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    :cond_0
    iget-boolean v1, p0, Lorg/apache/tools/ant/util/GlobPatternMapper;->fromContainsStar:Z

    if-eqz v1, :cond_2

    iget-object v1, p0, Lorg/apache/tools/ant/util/GlobPatternMapper;->fromPrefix:Ljava/lang/String;

    invoke-direct {p0, v1}, Lorg/apache/tools/ant/util/GlobPatternMapper;->modifyName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lorg/apache/tools/ant/util/GlobPatternMapper;->fromPostfix:Ljava/lang/String;

    invoke-direct {p0, v1}, Lorg/apache/tools/ant/util/GlobPatternMapper;->modifyName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 167
    :cond_1
    const/4 v1, 0x0

    .line 169
    :goto_0
    return-object v1

    :cond_2
    const/4 v1, 0x1

    new-array v2, v1, [Ljava/lang/String;

    const/4 v3, 0x0

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v4, p0, Lorg/apache/tools/ant/util/GlobPatternMapper;->toPrefix:Ljava/lang/String;

    invoke-virtual {v1, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    iget-boolean v1, p0, Lorg/apache/tools/ant/util/GlobPatternMapper;->toContainsStar:Z

    if-eqz v1, :cond_3

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/util/GlobPatternMapper;->extractVariablePart(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v5, p0, Lorg/apache/tools/ant/util/GlobPatternMapper;->toPostfix:Ljava/lang/String;

    invoke-virtual {v1, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    :goto_1
    invoke-virtual {v4, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    aput-object v1, v2, v3

    move-object v1, v2

    goto :goto_0

    :cond_3
    const-string/jumbo v1, ""

    goto :goto_1
.end method

.method public setCaseSensitive(Z)V
    .locals 0
    .param p1, "caseSensitive"    # Z

    .prologue
    .line 103
    iput-boolean p1, p0, Lorg/apache/tools/ant/util/GlobPatternMapper;->caseSensitive:Z

    .line 104
    return-void
.end method

.method public setFrom(Ljava/lang/String;)V
    .locals 3
    .param p1, "from"    # Ljava/lang/String;

    .prologue
    .line 111
    if-eqz p1, :cond_1

    .line 112
    const-string/jumbo v1, "*"

    invoke-virtual {p1, v1}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v0

    .line 113
    .local v0, "index":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 114
    iput-object p1, p0, Lorg/apache/tools/ant/util/GlobPatternMapper;->fromPrefix:Ljava/lang/String;

    .line 115
    const-string/jumbo v1, ""

    iput-object v1, p0, Lorg/apache/tools/ant/util/GlobPatternMapper;->fromPostfix:Ljava/lang/String;

    .line 121
    :goto_0
    iget-object v1, p0, Lorg/apache/tools/ant/util/GlobPatternMapper;->fromPrefix:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    iput v1, p0, Lorg/apache/tools/ant/util/GlobPatternMapper;->prefixLength:I

    .line 122
    iget-object v1, p0, Lorg/apache/tools/ant/util/GlobPatternMapper;->fromPostfix:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    iput v1, p0, Lorg/apache/tools/ant/util/GlobPatternMapper;->postfixLength:I

    .line 126
    return-void

    .line 117
    :cond_0
    const/4 v1, 0x0

    invoke-virtual {p1, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/tools/ant/util/GlobPatternMapper;->fromPrefix:Ljava/lang/String;

    .line 118
    add-int/lit8 v1, v0, 0x1

    invoke-virtual {p1, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/tools/ant/util/GlobPatternMapper;->fromPostfix:Ljava/lang/String;

    .line 119
    const/4 v1, 0x1

    iput-boolean v1, p0, Lorg/apache/tools/ant/util/GlobPatternMapper;->fromContainsStar:Z

    goto :goto_0

    .line 124
    .end local v0    # "index":I
    :cond_1
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v2, "this mapper requires a \'from\' attribute"

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public setHandleDirSep(Z)V
    .locals 0
    .param p1, "handleDirSep"    # Z

    .prologue
    .line 83
    iput-boolean p1, p0, Lorg/apache/tools/ant/util/GlobPatternMapper;->handleDirSep:Z

    .line 84
    return-void
.end method

.method public setTo(Ljava/lang/String;)V
    .locals 3
    .param p1, "to"    # Ljava/lang/String;

    .prologue
    .line 133
    if-eqz p1, :cond_1

    .line 134
    const-string/jumbo v1, "*"

    invoke-virtual {p1, v1}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v0

    .line 135
    .local v0, "index":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 136
    iput-object p1, p0, Lorg/apache/tools/ant/util/GlobPatternMapper;->toPrefix:Ljava/lang/String;

    .line 137
    const-string/jumbo v1, ""

    iput-object v1, p0, Lorg/apache/tools/ant/util/GlobPatternMapper;->toPostfix:Ljava/lang/String;

    .line 146
    :goto_0
    return-void

    .line 139
    :cond_0
    const/4 v1, 0x0

    invoke-virtual {p1, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/tools/ant/util/GlobPatternMapper;->toPrefix:Ljava/lang/String;

    .line 140
    add-int/lit8 v1, v0, 0x1

    invoke-virtual {p1, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/tools/ant/util/GlobPatternMapper;->toPostfix:Ljava/lang/String;

    .line 141
    const/4 v1, 0x1

    iput-boolean v1, p0, Lorg/apache/tools/ant/util/GlobPatternMapper;->toContainsStar:Z

    goto :goto_0

    .line 144
    .end local v0    # "index":I
    :cond_1
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v2, "this mapper requires a \'to\' attribute"

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1
.end method
