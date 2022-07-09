.class public Lorg/apache/tools/ant/util/regexp/Jdk14RegexpMatcher;
.super Ljava/lang/Object;
.source "Jdk14RegexpMatcher.java"

# interfaces
.implements Lorg/apache/tools/ant/util/regexp/RegexpMatcher;


# instance fields
.field private pattern:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    return-void
.end method


# virtual methods
.method protected getCompiledPattern(I)Ljava/util/regex/Pattern;
    .locals 4
    .param p1, "options"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 65
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/util/regexp/Jdk14RegexpMatcher;->getCompilerOptions(I)I

    move-result v0

    .line 67
    .local v0, "cOptions":I
    :try_start_0
    iget-object v3, p0, Lorg/apache/tools/ant/util/regexp/Jdk14RegexpMatcher;->pattern:Ljava/lang/String;

    invoke-static {v3, v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;
    :try_end_0
    .catch Ljava/util/regex/PatternSyntaxException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 68
    .local v2, "p":Ljava/util/regex/Pattern;
    return-object v2

    .line 69
    .end local v2    # "p":Ljava/util/regex/Pattern;
    :catch_0
    move-exception v1

    .line 70
    .local v1, "e":Ljava/util/regex/PatternSyntaxException;
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v3, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v3
.end method

.method protected getCompilerOptions(I)I
    .locals 2
    .param p1, "options"    # I

    .prologue
    .line 154
    const/4 v0, 0x1

    .line 156
    .local v0, "cOptions":I
    const/16 v1, 0x100

    invoke-static {p1, v1}, Lorg/apache/tools/ant/util/regexp/RegexpUtil;->hasFlag(II)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 157
    or-int/lit8 v0, v0, 0x2

    .line 159
    :cond_0
    const/16 v1, 0x1000

    invoke-static {p1, v1}, Lorg/apache/tools/ant/util/regexp/RegexpUtil;->hasFlag(II)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 160
    or-int/lit8 v0, v0, 0x8

    .line 162
    :cond_1
    const/high16 v1, 0x10000

    invoke-static {p1, v1}, Lorg/apache/tools/ant/util/regexp/RegexpUtil;->hasFlag(II)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 163
    or-int/lit8 v0, v0, 0x20

    .line 166
    :cond_2
    return v0
.end method

.method public getGroups(Ljava/lang/String;)Ljava/util/Vector;
    .locals 1
    .param p1, "argument"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 113
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lorg/apache/tools/ant/util/regexp/Jdk14RegexpMatcher;->getGroups(Ljava/lang/String;I)Ljava/util/Vector;

    move-result-object v0

    return-object v0
.end method

.method public getGroups(Ljava/lang/String;I)Ljava/util/Vector;
    .locals 7
    .param p1, "input"    # Ljava/lang/String;
    .param p2, "options"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 129
    invoke-virtual {p0, p2}, Lorg/apache/tools/ant/util/regexp/Jdk14RegexpMatcher;->getCompiledPattern(I)Ljava/util/regex/Pattern;

    move-result-object v4

    .line 130
    .local v4, "p":Ljava/util/regex/Pattern;
    invoke-virtual {v4, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v3

    .line 131
    .local v3, "matcher":Ljava/util/regex/Matcher;
    invoke-virtual {v3}, Ljava/util/regex/Matcher;->find()Z

    move-result v6

    if-nez v6, :cond_1

    .line 132
    const/4 v5, 0x0

    .line 144
    :cond_0
    return-object v5

    .line 134
    :cond_1
    new-instance v5, Ljava/util/Vector;

    invoke-direct {v5}, Ljava/util/Vector;-><init>()V

    .line 135
    .local v5, "v":Ljava/util/Vector;
    invoke-virtual {v3}, Ljava/util/regex/Matcher;->groupCount()I

    move-result v0

    .line 136
    .local v0, "cnt":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-gt v1, v0, :cond_0

    .line 137
    invoke-virtual {v3, v1}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v2

    .line 139
    .local v2, "match":Ljava/lang/String;
    if-nez v2, :cond_2

    .line 140
    const-string/jumbo v2, ""

    .line 142
    :cond_2
    invoke-virtual {v5, v2}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 136
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method public getPattern()Ljava/lang/String;
    .locals 1

    .prologue
    .line 54
    iget-object v0, p0, Lorg/apache/tools/ant/util/regexp/Jdk14RegexpMatcher;->pattern:Ljava/lang/String;

    return-object v0
.end method

.method public matches(Ljava/lang/String;)Z
    .locals 1
    .param p1, "argument"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 81
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lorg/apache/tools/ant/util/regexp/Jdk14RegexpMatcher;->matches(Ljava/lang/String;I)Z

    move-result v0

    return v0
.end method

.method public matches(Ljava/lang/String;I)Z
    .locals 3
    .param p1, "input"    # Ljava/lang/String;
    .param p2, "options"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 94
    :try_start_0
    invoke-virtual {p0, p2}, Lorg/apache/tools/ant/util/regexp/Jdk14RegexpMatcher;->getCompiledPattern(I)Ljava/util/regex/Pattern;

    move-result-object v1

    .line 95
    .local v1, "p":Ljava/util/regex/Pattern;
    invoke-virtual {v1, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/regex/Matcher;->find()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    return v2

    .line 96
    .end local v1    # "p":Ljava/util/regex/Pattern;
    :catch_0
    move-exception v0

    .line 97
    .local v0, "e":Ljava/lang/Exception;
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v2, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method public setPattern(Ljava/lang/String;)V
    .locals 0
    .param p1, "pattern"    # Ljava/lang/String;

    .prologue
    .line 45
    iput-object p1, p0, Lorg/apache/tools/ant/util/regexp/Jdk14RegexpMatcher;->pattern:Ljava/lang/String;

    .line 46
    return-void
.end method
