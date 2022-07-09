.class public Lorg/apache/tools/ant/types/selectors/TokenizedPattern;
.super Ljava/lang/Object;
.source "TokenizedPattern.java"


# static fields
.field public static final EMPTY_PATTERN:Lorg/apache/tools/ant/types/selectors/TokenizedPattern;


# instance fields
.field private final pattern:Ljava/lang/String;

.field private final tokenizedPattern:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 37
    new-instance v0, Lorg/apache/tools/ant/types/selectors/TokenizedPattern;

    const-string/jumbo v1, ""

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/String;

    invoke-direct {v0, v1, v2}, Lorg/apache/tools/ant/types/selectors/TokenizedPattern;-><init>(Ljava/lang/String;[Ljava/lang/String;)V

    sput-object v0, Lorg/apache/tools/ant/types/selectors/TokenizedPattern;->EMPTY_PATTERN:Lorg/apache/tools/ant/types/selectors/TokenizedPattern;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "pattern"    # Ljava/lang/String;

    .prologue
    .line 49
    invoke-static {p1}, Lorg/apache/tools/ant/types/selectors/SelectorUtils;->tokenizePathAsArray(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lorg/apache/tools/ant/types/selectors/TokenizedPattern;-><init>(Ljava/lang/String;[Ljava/lang/String;)V

    .line 50
    return-void
.end method

.method constructor <init>(Ljava/lang/String;[Ljava/lang/String;)V
    .locals 0
    .param p1, "pattern"    # Ljava/lang/String;
    .param p2, "tokens"    # [Ljava/lang/String;

    .prologue
    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    iput-object p1, p0, Lorg/apache/tools/ant/types/selectors/TokenizedPattern;->pattern:Ljava/lang/String;

    .line 54
    iput-object p2, p0, Lorg/apache/tools/ant/types/selectors/TokenizedPattern;->tokenizedPattern:[Ljava/lang/String;

    .line 55
    return-void
.end method


# virtual methods
.method public containsPattern(Ljava/lang/String;)Z
    .locals 2
    .param p1, "pat"    # Ljava/lang/String;

    .prologue
    .line 117
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lorg/apache/tools/ant/types/selectors/TokenizedPattern;->tokenizedPattern:[Ljava/lang/String;

    array-length v1, v1

    if-ge v0, v1, :cond_1

    .line 118
    iget-object v1, p0, Lorg/apache/tools/ant/types/selectors/TokenizedPattern;->tokenizedPattern:[Ljava/lang/String;

    aget-object v1, v1, v0

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 119
    const/4 v1, 0x1

    .line 122
    :goto_1
    return v1

    .line 117
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 122
    :cond_1
    const/4 v1, 0x0

    goto :goto_1
.end method

.method public depth()I
    .locals 1

    .prologue
    .line 110
    iget-object v0, p0, Lorg/apache/tools/ant/types/selectors/TokenizedPattern;->tokenizedPattern:[Ljava/lang/String;

    array-length v0, v0

    return v0
.end method

.method public endsWith(Ljava/lang/String;)Z
    .locals 2
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 155
    iget-object v0, p0, Lorg/apache/tools/ant/types/selectors/TokenizedPattern;->tokenizedPattern:[Ljava/lang/String;

    array-length v0, v0

    if-lez v0, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/types/selectors/TokenizedPattern;->tokenizedPattern:[Ljava/lang/String;

    iget-object v1, p0, Lorg/apache/tools/ant/types/selectors/TokenizedPattern;->tokenizedPattern:[Ljava/lang/String;

    array-length v1, v1

    add-int/lit8 v1, v1, -0x1

    aget-object v0, v0, v1

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 2
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 98
    instance-of v0, p1, Lorg/apache/tools/ant/types/selectors/TokenizedPattern;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/types/selectors/TokenizedPattern;->pattern:Ljava/lang/String;

    check-cast p1, Lorg/apache/tools/ant/types/selectors/TokenizedPattern;

    .end local p1    # "o":Ljava/lang/Object;
    iget-object v1, p1, Lorg/apache/tools/ant/types/selectors/TokenizedPattern;->pattern:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getPattern()Ljava/lang/String;
    .locals 1

    .prologue
    .line 91
    iget-object v0, p0, Lorg/apache/tools/ant/types/selectors/TokenizedPattern;->pattern:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 1

    .prologue
    .line 103
    iget-object v0, p0, Lorg/apache/tools/ant/types/selectors/TokenizedPattern;->pattern:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    return v0
.end method

.method public matchPath(Lorg/apache/tools/ant/types/selectors/TokenizedPath;Z)Z
    .locals 2
    .param p1, "path"    # Lorg/apache/tools/ant/types/selectors/TokenizedPath;
    .param p2, "isCaseSensitive"    # Z

    .prologue
    .line 69
    iget-object v0, p0, Lorg/apache/tools/ant/types/selectors/TokenizedPattern;->tokenizedPattern:[Ljava/lang/String;

    invoke-virtual {p1}, Lorg/apache/tools/ant/types/selectors/TokenizedPath;->getTokens()[Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, p2}, Lorg/apache/tools/ant/types/selectors/SelectorUtils;->matchPath([Ljava/lang/String;[Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public matchStartOf(Lorg/apache/tools/ant/types/selectors/TokenizedPath;Z)Z
    .locals 2
    .param p1, "path"    # Lorg/apache/tools/ant/types/selectors/TokenizedPath;
    .param p2, "caseSensitive"    # Z

    .prologue
    .line 79
    iget-object v0, p0, Lorg/apache/tools/ant/types/selectors/TokenizedPattern;->tokenizedPattern:[Ljava/lang/String;

    invoke-virtual {p1}, Lorg/apache/tools/ant/types/selectors/TokenizedPath;->getTokens()[Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, p2}, Lorg/apache/tools/ant/types/selectors/SelectorUtils;->matchPatternStart([Ljava/lang/String;[Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public rtrimWildcardTokens()Lorg/apache/tools/ant/types/selectors/TokenizedPath;
    .locals 6

    .prologue
    const/4 v5, 0x0

    .line 131
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    .line 132
    .local v2, "sb":Ljava/lang/StringBuffer;
    const/4 v0, 0x0

    .line 133
    .local v0, "newLen":I
    :goto_0
    iget-object v3, p0, Lorg/apache/tools/ant/types/selectors/TokenizedPattern;->tokenizedPattern:[Ljava/lang/String;

    array-length v3, v3

    if-ge v0, v3, :cond_0

    .line 134
    iget-object v3, p0, Lorg/apache/tools/ant/types/selectors/TokenizedPattern;->tokenizedPattern:[Ljava/lang/String;

    aget-object v3, v3, v0

    invoke-static {v3}, Lorg/apache/tools/ant/types/selectors/SelectorUtils;->hasWildcards(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 143
    :cond_0
    if-nez v0, :cond_3

    .line 144
    sget-object v3, Lorg/apache/tools/ant/types/selectors/TokenizedPath;->EMPTY_PATH:Lorg/apache/tools/ant/types/selectors/TokenizedPath;

    .line 148
    :goto_1
    return-object v3

    .line 137
    :cond_1
    if-lez v0, :cond_2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->length()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->charAt(I)C

    move-result v3

    sget-char v4, Ljava/io/File;->separatorChar:C

    if-eq v3, v4, :cond_2

    .line 139
    sget-object v3, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 141
    :cond_2
    iget-object v3, p0, Lorg/apache/tools/ant/types/selectors/TokenizedPattern;->tokenizedPattern:[Ljava/lang/String;

    aget-object v3, v3, v0

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 133
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 146
    :cond_3
    new-array v1, v0, [Ljava/lang/String;

    .line 147
    .local v1, "newPats":[Ljava/lang/String;
    iget-object v3, p0, Lorg/apache/tools/ant/types/selectors/TokenizedPattern;->tokenizedPattern:[Ljava/lang/String;

    invoke-static {v3, v5, v1, v5, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 148
    new-instance v3, Lorg/apache/tools/ant/types/selectors/TokenizedPath;

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v1}, Lorg/apache/tools/ant/types/selectors/TokenizedPath;-><init>(Ljava/lang/String;[Ljava/lang/String;)V

    goto :goto_1
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 87
    iget-object v0, p0, Lorg/apache/tools/ant/types/selectors/TokenizedPattern;->pattern:Ljava/lang/String;

    return-object v0
.end method

.method public withoutLastToken()Lorg/apache/tools/ant/types/selectors/TokenizedPattern;
    .locals 6

    .prologue
    const/4 v5, 0x0

    .line 163
    iget-object v3, p0, Lorg/apache/tools/ant/types/selectors/TokenizedPattern;->tokenizedPattern:[Ljava/lang/String;

    array-length v3, v3

    if-nez v3, :cond_0

    .line 164
    new-instance v3, Ljava/lang/IllegalStateException;

    const-string/jumbo v4, "cant strip a token from nothing"

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 165
    :cond_0
    iget-object v3, p0, Lorg/apache/tools/ant/types/selectors/TokenizedPattern;->tokenizedPattern:[Ljava/lang/String;

    array-length v3, v3

    const/4 v4, 0x1

    if-ne v3, v4, :cond_1

    .line 166
    sget-object v3, Lorg/apache/tools/ant/types/selectors/TokenizedPattern;->EMPTY_PATTERN:Lorg/apache/tools/ant/types/selectors/TokenizedPattern;

    .line 173
    :goto_0
    return-object v3

    .line 168
    :cond_1
    iget-object v3, p0, Lorg/apache/tools/ant/types/selectors/TokenizedPattern;->tokenizedPattern:[Ljava/lang/String;

    iget-object v4, p0, Lorg/apache/tools/ant/types/selectors/TokenizedPattern;->tokenizedPattern:[Ljava/lang/String;

    array-length v4, v4

    add-int/lit8 v4, v4, -0x1

    aget-object v1, v3, v4

    .line 169
    .local v1, "toStrip":Ljava/lang/String;
    iget-object v3, p0, Lorg/apache/tools/ant/types/selectors/TokenizedPattern;->pattern:Ljava/lang/String;

    invoke-virtual {v3, v1}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v0

    .line 170
    .local v0, "index":I
    iget-object v3, p0, Lorg/apache/tools/ant/types/selectors/TokenizedPattern;->tokenizedPattern:[Ljava/lang/String;

    array-length v3, v3

    add-int/lit8 v3, v3, -0x1

    new-array v2, v3, [Ljava/lang/String;

    .line 171
    .local v2, "tokens":[Ljava/lang/String;
    iget-object v3, p0, Lorg/apache/tools/ant/types/selectors/TokenizedPattern;->tokenizedPattern:[Ljava/lang/String;

    iget-object v4, p0, Lorg/apache/tools/ant/types/selectors/TokenizedPattern;->tokenizedPattern:[Ljava/lang/String;

    array-length v4, v4

    add-int/lit8 v4, v4, -0x1

    invoke-static {v3, v5, v2, v5, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 173
    new-instance v3, Lorg/apache/tools/ant/types/selectors/TokenizedPattern;

    iget-object v4, p0, Lorg/apache/tools/ant/types/selectors/TokenizedPattern;->pattern:Ljava/lang/String;

    invoke-virtual {v4, v5, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v2}, Lorg/apache/tools/ant/types/selectors/TokenizedPattern;-><init>(Ljava/lang/String;[Ljava/lang/String;)V

    goto :goto_0
.end method
