.class public Lorg/apache/tools/ant/PathTokenizer;
.super Ljava/lang/Object;
.source "PathTokenizer.java"


# instance fields
.field private dosStyleFilesystem:Z

.field private lookahead:Ljava/lang/String;

.field private onNetWare:Z

.field private tokenizer:Ljava/util/StringTokenizer;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 4
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    const/4 v2, 0x0

    iput-object v2, p0, Lorg/apache/tools/ant/PathTokenizer;->lookahead:Ljava/lang/String;

    .line 50
    const-string/jumbo v2, "netware"

    invoke-static {v2}, Lorg/apache/tools/ant/taskdefs/condition/Os;->isFamily(Ljava/lang/String;)Z

    move-result v2

    iput-boolean v2, p0, Lorg/apache/tools/ant/PathTokenizer;->onNetWare:Z

    .line 64
    iget-boolean v2, p0, Lorg/apache/tools/ant/PathTokenizer;->onNetWare:Z

    if-eqz v2, :cond_0

    .line 67
    new-instance v2, Ljava/util/StringTokenizer;

    const-string/jumbo v3, ":;"

    invoke-direct {v2, p1, v3, v0}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    iput-object v2, p0, Lorg/apache/tools/ant/PathTokenizer;->tokenizer:Ljava/util/StringTokenizer;

    .line 73
    :goto_0
    sget-char v2, Ljava/io/File;->pathSeparatorChar:C

    const/16 v3, 0x3b

    if-ne v2, v3, :cond_1

    :goto_1
    iput-boolean v0, p0, Lorg/apache/tools/ant/PathTokenizer;->dosStyleFilesystem:Z

    .line 74
    return-void

    .line 71
    :cond_0
    new-instance v2, Ljava/util/StringTokenizer;

    const-string/jumbo v3, ":;"

    invoke-direct {v2, p1, v3, v1}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    iput-object v2, p0, Lorg/apache/tools/ant/PathTokenizer;->tokenizer:Ljava/util/StringTokenizer;

    goto :goto_0

    :cond_1
    move v0, v1

    .line 73
    goto :goto_1
.end method


# virtual methods
.method public hasMoreTokens()Z
    .locals 1

    .prologue
    .line 85
    iget-object v0, p0, Lorg/apache/tools/ant/PathTokenizer;->lookahead:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 86
    const/4 v0, 0x1

    .line 89
    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/PathTokenizer;->tokenizer:Ljava/util/StringTokenizer;

    invoke-virtual {v0}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v0

    goto :goto_0
.end method

.method public nextToken()Ljava/lang/String;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/NoSuchElementException;
        }
    .end annotation

    .prologue
    .line 101
    const/4 v2, 0x0

    .line 102
    .local v2, "token":Ljava/lang/String;
    iget-object v3, p0, Lorg/apache/tools/ant/PathTokenizer;->lookahead:Ljava/lang/String;

    if-eqz v3, :cond_2

    .line 103
    iget-object v2, p0, Lorg/apache/tools/ant/PathTokenizer;->lookahead:Ljava/lang/String;

    .line 104
    const/4 v3, 0x0

    iput-object v3, p0, Lorg/apache/tools/ant/PathTokenizer;->lookahead:Ljava/lang/String;

    .line 109
    :goto_0
    iget-boolean v3, p0, Lorg/apache/tools/ant/PathTokenizer;->onNetWare:Z

    if-nez v3, :cond_4

    .line 110
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    const/4 v4, 0x1

    if-ne v3, v4, :cond_1

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-static {v3}, Ljava/lang/Character;->isLetter(C)Z

    move-result v3

    if-eqz v3, :cond_1

    iget-boolean v3, p0, Lorg/apache/tools/ant/PathTokenizer;->dosStyleFilesystem:Z

    if-eqz v3, :cond_1

    iget-object v3, p0, Lorg/apache/tools/ant/PathTokenizer;->tokenizer:Ljava/util/StringTokenizer;

    invoke-virtual {v3}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 115
    iget-object v3, p0, Lorg/apache/tools/ant/PathTokenizer;->tokenizer:Ljava/util/StringTokenizer;

    invoke-virtual {v3}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 116
    .local v0, "nextToken":Ljava/lang/String;
    const-string/jumbo v3, "\\"

    invoke-virtual {v0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_0

    const-string/jumbo v3, "/"

    invoke-virtual {v0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 120
    :cond_0
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, ":"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    .line 162
    .end local v0    # "nextToken":Ljava/lang/String;
    :cond_1
    :goto_1
    return-object v2

    .line 106
    :cond_2
    iget-object v3, p0, Lorg/apache/tools/ant/PathTokenizer;->tokenizer:Ljava/util/StringTokenizer;

    invoke-virtual {v3}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    .line 123
    .restart local v0    # "nextToken":Ljava/lang/String;
    :cond_3
    iput-object v0, p0, Lorg/apache/tools/ant/PathTokenizer;->lookahead:Ljava/lang/String;

    goto :goto_1

    .line 129
    .end local v0    # "nextToken":Ljava/lang/String;
    :cond_4
    sget-object v3, Ljava/io/File;->pathSeparator:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_5

    const-string/jumbo v3, ":"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_6

    .line 131
    :cond_5
    iget-object v3, p0, Lorg/apache/tools/ant/PathTokenizer;->tokenizer:Ljava/util/StringTokenizer;

    invoke-virtual {v3}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    .line 134
    :cond_6
    iget-object v3, p0, Lorg/apache/tools/ant/PathTokenizer;->tokenizer:Ljava/util/StringTokenizer;

    invoke-virtual {v3}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 136
    iget-object v3, p0, Lorg/apache/tools/ant/PathTokenizer;->tokenizer:Ljava/util/StringTokenizer;

    invoke-virtual {v3}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 139
    .restart local v0    # "nextToken":Ljava/lang/String;
    sget-object v3, Ljava/io/File;->pathSeparator:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 140
    const-string/jumbo v3, ":"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_8

    .line 141
    const-string/jumbo v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_1

    const-string/jumbo v3, "\\"

    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_1

    const-string/jumbo v3, "."

    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_1

    const-string/jumbo v3, ".."

    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 145
    iget-object v3, p0, Lorg/apache/tools/ant/PathTokenizer;->tokenizer:Ljava/util/StringTokenizer;

    invoke-virtual {v3}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 146
    .local v1, "oneMore":Ljava/lang/String;
    sget-object v3, Ljava/io/File;->pathSeparator:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_7

    .line 147
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, ":"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    goto/16 :goto_1

    .line 149
    :cond_7
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, ":"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    .line 150
    iput-object v1, p0, Lorg/apache/tools/ant/PathTokenizer;->lookahead:Ljava/lang/String;

    goto/16 :goto_1

    .line 157
    .end local v1    # "oneMore":Ljava/lang/String;
    :cond_8
    iput-object v0, p0, Lorg/apache/tools/ant/PathTokenizer;->lookahead:Ljava/lang/String;

    goto/16 :goto_1
.end method
