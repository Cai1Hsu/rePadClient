.class public Lorg/apache/tools/ant/util/RegexpPatternMapper;
.super Ljava/lang/Object;
.source "RegexpPatternMapper.java"

# interfaces
.implements Lorg/apache/tools/ant/util/FileNameMapper;


# static fields
.field private static final DECIMAL:I = 0xa


# instance fields
.field private handleDirSep:Z

.field protected reg:Lorg/apache/tools/ant/util/regexp/RegexpMatcher;

.field private regexpOptions:I

.field protected result:Ljava/lang/StringBuffer;

.field protected to:[C


# direct methods
.method public constructor <init>()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    iput-object v0, p0, Lorg/apache/tools/ant/util/RegexpPatternMapper;->reg:Lorg/apache/tools/ant/util/regexp/RegexpMatcher;

    .line 38
    iput-object v0, p0, Lorg/apache/tools/ant/util/RegexpPatternMapper;->to:[C

    .line 39
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/util/RegexpPatternMapper;->result:Ljava/lang/StringBuffer;

    .line 50
    iput-boolean v1, p0, Lorg/apache/tools/ant/util/RegexpPatternMapper;->handleDirSep:Z

    .line 51
    iput v1, p0, Lorg/apache/tools/ant/util/RegexpPatternMapper;->regexpOptions:I

    .line 47
    new-instance v0, Lorg/apache/tools/ant/util/regexp/RegexpMatcherFactory;

    invoke-direct {v0}, Lorg/apache/tools/ant/util/regexp/RegexpMatcherFactory;-><init>()V

    invoke-virtual {v0}, Lorg/apache/tools/ant/util/regexp/RegexpMatcherFactory;->newRegexpMatcher()Lorg/apache/tools/ant/util/regexp/RegexpMatcher;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/util/RegexpPatternMapper;->reg:Lorg/apache/tools/ant/util/regexp/RegexpMatcher;

    .line 48
    return-void
.end method


# virtual methods
.method public mapFileName(Ljava/lang/String;)[Ljava/lang/String;
    .locals 3
    .param p1, "sourceFileName"    # Ljava/lang/String;

    .prologue
    .line 116
    iget-boolean v0, p0, Lorg/apache/tools/ant/util/RegexpPatternMapper;->handleDirSep:Z

    if-eqz v0, :cond_0

    .line 117
    const-string/jumbo v0, "\\"

    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    .line 118
    const/16 v0, 0x5c

    const/16 v1, 0x2f

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object p1

    .line 121
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/util/RegexpPatternMapper;->reg:Lorg/apache/tools/ant/util/regexp/RegexpMatcher;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lorg/apache/tools/ant/util/RegexpPatternMapper;->to:[C

    if-eqz v0, :cond_1

    iget-object v0, p0, Lorg/apache/tools/ant/util/RegexpPatternMapper;->reg:Lorg/apache/tools/ant/util/regexp/RegexpMatcher;

    iget v1, p0, Lorg/apache/tools/ant/util/RegexpPatternMapper;->regexpOptions:I

    invoke-interface {v0, p1, v1}, Lorg/apache/tools/ant/util/regexp/RegexpMatcher;->matches(Ljava/lang/String;I)Z

    move-result v0

    if-nez v0, :cond_2

    .line 123
    :cond_1
    const/4 v0, 0x0

    .line 125
    :goto_0
    return-object v0

    :cond_2
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/util/RegexpPatternMapper;->replaceReferences(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    goto :goto_0
.end method

.method protected replaceReferences(Ljava/lang/String;)Ljava/lang/String;
    .locals 7
    .param p1, "source"    # Ljava/lang/String;

    .prologue
    const/16 v6, 0x5c

    const/4 v5, 0x0

    .line 135
    iget-object v3, p0, Lorg/apache/tools/ant/util/RegexpPatternMapper;->reg:Lorg/apache/tools/ant/util/regexp/RegexpMatcher;

    iget v4, p0, Lorg/apache/tools/ant/util/RegexpPatternMapper;->regexpOptions:I

    invoke-interface {v3, p1, v4}, Lorg/apache/tools/ant/util/regexp/RegexpMatcher;->getGroups(Ljava/lang/String;I)Ljava/util/Vector;

    move-result-object v1

    .line 137
    .local v1, "v":Ljava/util/Vector;
    iget-object v3, p0, Lorg/apache/tools/ant/util/RegexpPatternMapper;->result:Ljava/lang/StringBuffer;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuffer;->setLength(I)V

    .line 138
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v3, p0, Lorg/apache/tools/ant/util/RegexpPatternMapper;->to:[C

    array-length v3, v3

    if-ge v0, v3, :cond_3

    .line 139
    iget-object v3, p0, Lorg/apache/tools/ant/util/RegexpPatternMapper;->to:[C

    aget-char v3, v3, v0

    if-ne v3, v6, :cond_2

    .line 140
    add-int/lit8 v0, v0, 0x1

    iget-object v3, p0, Lorg/apache/tools/ant/util/RegexpPatternMapper;->to:[C

    array-length v3, v3

    if-ge v0, v3, :cond_1

    .line 141
    iget-object v3, p0, Lorg/apache/tools/ant/util/RegexpPatternMapper;->to:[C

    aget-char v3, v3, v0

    const/16 v4, 0xa

    invoke-static {v3, v4}, Ljava/lang/Character;->digit(CI)I

    move-result v2

    .line 142
    .local v2, "value":I
    const/4 v3, -0x1

    if-le v2, v3, :cond_0

    .line 143
    iget-object v4, p0, Lorg/apache/tools/ant/util/RegexpPatternMapper;->result:Ljava/lang/StringBuffer;

    invoke-virtual {v1, v2}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 138
    .end local v2    # "value":I
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 145
    .restart local v2    # "value":I
    :cond_0
    iget-object v3, p0, Lorg/apache/tools/ant/util/RegexpPatternMapper;->result:Ljava/lang/StringBuffer;

    iget-object v4, p0, Lorg/apache/tools/ant/util/RegexpPatternMapper;->to:[C

    aget-char v4, v4, v0

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_1

    .line 149
    .end local v2    # "value":I
    :cond_1
    iget-object v3, p0, Lorg/apache/tools/ant/util/RegexpPatternMapper;->result:Ljava/lang/StringBuffer;

    invoke-virtual {v3, v6}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_1

    .line 152
    :cond_2
    iget-object v3, p0, Lorg/apache/tools/ant/util/RegexpPatternMapper;->result:Ljava/lang/StringBuffer;

    iget-object v4, p0, Lorg/apache/tools/ant/util/RegexpPatternMapper;->to:[C

    aget-char v4, v4, v0

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_1

    .line 155
    :cond_3
    iget-object v3, p0, Lorg/apache/tools/ant/util/RegexpPatternMapper;->result:Ljava/lang/StringBuffer;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuffer;->substring(I)Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method public setCaseSensitive(Z)V
    .locals 1
    .param p1, "caseSensitive"    # Z

    .prologue
    .line 71
    invoke-static {p1}, Lorg/apache/tools/ant/util/regexp/RegexpUtil;->asOptions(Z)I

    move-result v0

    iput v0, p0, Lorg/apache/tools/ant/util/RegexpPatternMapper;->regexpOptions:I

    .line 72
    return-void
.end method

.method public setFrom(Ljava/lang/String;)V
    .locals 3
    .param p1, "from"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 80
    if-eqz p1, :cond_0

    .line 82
    :try_start_0
    iget-object v1, p0, Lorg/apache/tools/ant/util/RegexpPatternMapper;->reg:Lorg/apache/tools/ant/util/regexp/RegexpMatcher;

    invoke-interface {v1, p1}, Lorg/apache/tools/ant/util/regexp/RegexpMatcher;->setPattern(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_0 .. :try_end_0} :catch_0

    .line 92
    return-void

    .line 83
    :catch_0
    move-exception v0

    .line 86
    .local v0, "e":Ljava/lang/NoClassDefFoundError;
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v2, "Cannot load regular expression matcher"

    invoke-direct {v1, v2, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 90
    .end local v0    # "e":Ljava/lang/NoClassDefFoundError;
    :cond_0
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v2, "this mapper requires a \'from\' attribute"

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public setHandleDirSep(Z)V
    .locals 0
    .param p1, "handleDirSep"    # Z

    .prologue
    .line 60
    iput-boolean p1, p0, Lorg/apache/tools/ant/util/RegexpPatternMapper;->handleDirSep:Z

    .line 61
    return-void
.end method

.method public setTo(Ljava/lang/String;)V
    .locals 2
    .param p1, "to"    # Ljava/lang/String;

    .prologue
    .line 100
    if-eqz p1, :cond_0

    .line 101
    invoke-virtual {p1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/util/RegexpPatternMapper;->to:[C

    .line 105
    return-void

    .line 103
    :cond_0
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "this mapper requires a \'to\' attribute"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
