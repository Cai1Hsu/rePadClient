.class public Lorg/apache/tools/ant/types/selectors/FilenameSelector;
.super Lorg/apache/tools/ant/types/selectors/BaseExtendSelector;
.source "FilenameSelector.java"


# static fields
.field public static final CASE_KEY:Ljava/lang/String; = "casesensitive"

.field public static final NAME_KEY:Ljava/lang/String; = "name"

.field public static final NEGATE_KEY:Ljava/lang/String; = "negate"

.field public static final REGEX_KEY:Ljava/lang/String; = "regex"


# instance fields
.field private casesensitive:Z

.field private expression:Lorg/apache/tools/ant/util/regexp/Regexp;

.field private negated:Z

.field private pattern:Ljava/lang/String;

.field private reg:Lorg/apache/tools/ant/types/RegularExpression;

.field private regex:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 58
    invoke-direct {p0}, Lorg/apache/tools/ant/types/selectors/BaseExtendSelector;-><init>()V

    .line 36
    iput-object v0, p0, Lorg/apache/tools/ant/types/selectors/FilenameSelector;->pattern:Ljava/lang/String;

    .line 37
    iput-object v0, p0, Lorg/apache/tools/ant/types/selectors/FilenameSelector;->regex:Ljava/lang/String;

    .line 38
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/types/selectors/FilenameSelector;->casesensitive:Z

    .line 40
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/types/selectors/FilenameSelector;->negated:Z

    .line 59
    return-void
.end method


# virtual methods
.method public isSelected(Ljava/io/File;Ljava/lang/String;Ljava/io/File;)Z
    .locals 5
    .param p1, "basedir"    # Ljava/io/File;
    .param p2, "filename"    # Ljava/lang/String;
    .param p3, "file"    # Ljava/io/File;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 179
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/selectors/FilenameSelector;->validate()V

    .line 180
    iget-object v3, p0, Lorg/apache/tools/ant/types/selectors/FilenameSelector;->pattern:Ljava/lang/String;

    if-eqz v3, :cond_3

    .line 181
    iget-object v3, p0, Lorg/apache/tools/ant/types/selectors/FilenameSelector;->pattern:Ljava/lang/String;

    iget-boolean v4, p0, Lorg/apache/tools/ant/types/selectors/FilenameSelector;->casesensitive:Z

    invoke-static {v3, p2, v4}, Lorg/apache/tools/ant/types/selectors/SelectorUtils;->matchPath(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v4

    iget-boolean v3, p0, Lorg/apache/tools/ant/types/selectors/FilenameSelector;->negated:Z

    if-nez v3, :cond_1

    move v3, v1

    :goto_0
    if-ne v4, v3, :cond_2

    .line 190
    :cond_0
    :goto_1
    return v1

    :cond_1
    move v3, v2

    .line 181
    goto :goto_0

    :cond_2
    move v1, v2

    goto :goto_1

    .line 184
    :cond_3
    iget-object v3, p0, Lorg/apache/tools/ant/types/selectors/FilenameSelector;->reg:Lorg/apache/tools/ant/types/RegularExpression;

    if-nez v3, :cond_4

    .line 185
    new-instance v3, Lorg/apache/tools/ant/types/RegularExpression;

    invoke-direct {v3}, Lorg/apache/tools/ant/types/RegularExpression;-><init>()V

    iput-object v3, p0, Lorg/apache/tools/ant/types/selectors/FilenameSelector;->reg:Lorg/apache/tools/ant/types/RegularExpression;

    .line 186
    iget-object v3, p0, Lorg/apache/tools/ant/types/selectors/FilenameSelector;->reg:Lorg/apache/tools/ant/types/RegularExpression;

    iget-object v4, p0, Lorg/apache/tools/ant/types/selectors/FilenameSelector;->regex:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lorg/apache/tools/ant/types/RegularExpression;->setPattern(Ljava/lang/String;)V

    .line 187
    iget-object v3, p0, Lorg/apache/tools/ant/types/selectors/FilenameSelector;->reg:Lorg/apache/tools/ant/types/RegularExpression;

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/selectors/FilenameSelector;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/apache/tools/ant/types/RegularExpression;->getRegexp(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/util/regexp/Regexp;

    move-result-object v3

    iput-object v3, p0, Lorg/apache/tools/ant/types/selectors/FilenameSelector;->expression:Lorg/apache/tools/ant/util/regexp/Regexp;

    .line 189
    :cond_4
    iget-boolean v3, p0, Lorg/apache/tools/ant/types/selectors/FilenameSelector;->casesensitive:Z

    invoke-static {v3}, Lorg/apache/tools/ant/util/regexp/RegexpUtil;->asOptions(Z)I

    move-result v0

    .line 190
    .local v0, "options":I
    iget-object v3, p0, Lorg/apache/tools/ant/types/selectors/FilenameSelector;->expression:Lorg/apache/tools/ant/util/regexp/Regexp;

    invoke-interface {v3, p2, v0}, Lorg/apache/tools/ant/util/regexp/Regexp;->matches(Ljava/lang/String;I)Z

    move-result v4

    iget-boolean v3, p0, Lorg/apache/tools/ant/types/selectors/FilenameSelector;->negated:Z

    if-nez v3, :cond_5

    move v3, v1

    :goto_2
    if-eq v4, v3, :cond_0

    move v1, v2

    goto :goto_1

    :cond_5
    move v3, v2

    goto :goto_2
.end method

.method public setCasesensitive(Z)V
    .locals 0
    .param p1, "casesensitive"    # Z

    .prologue
    .line 111
    iput-boolean p1, p0, Lorg/apache/tools/ant/types/selectors/FilenameSelector;->casesensitive:Z

    .line 112
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 3
    .param p1, "pattern"    # Ljava/lang/String;

    .prologue
    .line 86
    const/16 v0, 0x2f

    sget-char v1, Ljava/io/File;->separatorChar:C

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x5c

    sget-char v2, Ljava/io/File;->separatorChar:C

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object p1

    .line 88
    sget-object v0, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 89
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string/jumbo v1, "**"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p1

    .line 91
    :cond_0
    iput-object p1, p0, Lorg/apache/tools/ant/types/selectors/FilenameSelector;->pattern:Ljava/lang/String;

    .line 92
    return-void
.end method

.method public setNegate(Z)V
    .locals 0
    .param p1, "negated"    # Z

    .prologue
    .line 123
    iput-boolean p1, p0, Lorg/apache/tools/ant/types/selectors/FilenameSelector;->negated:Z

    .line 124
    return-void
.end method

.method public setParameters([Lorg/apache/tools/ant/types/Parameter;)V
    .locals 4
    .param p1, "parameters"    # [Lorg/apache/tools/ant/types/Parameter;

    .prologue
    .line 133
    invoke-super {p0, p1}, Lorg/apache/tools/ant/types/selectors/BaseExtendSelector;->setParameters([Lorg/apache/tools/ant/types/Parameter;)V

    .line 134
    if-eqz p1, :cond_4

    .line 135
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v2, p1

    if-ge v0, v2, :cond_4

    .line 136
    aget-object v2, p1, v0

    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Parameter;->getName()Ljava/lang/String;

    move-result-object v1

    .line 137
    .local v1, "paramname":Ljava/lang/String;
    const-string/jumbo v2, "name"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 138
    aget-object v2, p1, v0

    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Parameter;->getValue()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lorg/apache/tools/ant/types/selectors/FilenameSelector;->setName(Ljava/lang/String;)V

    .line 135
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 139
    :cond_0
    const-string/jumbo v2, "casesensitive"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 140
    aget-object v2, p1, v0

    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Parameter;->getValue()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lorg/apache/tools/ant/Project;->toBoolean(Ljava/lang/String;)Z

    move-result v2

    invoke-virtual {p0, v2}, Lorg/apache/tools/ant/types/selectors/FilenameSelector;->setCasesensitive(Z)V

    goto :goto_1

    .line 142
    :cond_1
    const-string/jumbo v2, "negate"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 143
    aget-object v2, p1, v0

    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Parameter;->getValue()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lorg/apache/tools/ant/Project;->toBoolean(Ljava/lang/String;)Z

    move-result v2

    invoke-virtual {p0, v2}, Lorg/apache/tools/ant/types/selectors/FilenameSelector;->setNegate(Z)V

    goto :goto_1

    .line 144
    :cond_2
    const-string/jumbo v2, "regex"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 145
    aget-object v2, p1, v0

    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Parameter;->getValue()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lorg/apache/tools/ant/types/selectors/FilenameSelector;->setRegex(Ljava/lang/String;)V

    goto :goto_1

    .line 147
    :cond_3
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "Invalid parameter "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lorg/apache/tools/ant/types/selectors/FilenameSelector;->setError(Ljava/lang/String;)V

    goto :goto_1

    .line 151
    .end local v0    # "i":I
    .end local v1    # "paramname":Ljava/lang/String;
    :cond_4
    return-void
.end method

.method public setRegex(Ljava/lang/String;)V
    .locals 1
    .param p1, "pattern"    # Ljava/lang/String;

    .prologue
    .line 101
    iput-object p1, p0, Lorg/apache/tools/ant/types/selectors/FilenameSelector;->regex:Ljava/lang/String;

    .line 102
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/types/selectors/FilenameSelector;->reg:Lorg/apache/tools/ant/types/RegularExpression;

    .line 103
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 65
    new-instance v0, Ljava/lang/StringBuffer;

    const-string/jumbo v1, "{filenameselector name: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 66
    .local v0, "buf":Ljava/lang/StringBuffer;
    iget-object v1, p0, Lorg/apache/tools/ant/types/selectors/FilenameSelector;->pattern:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 67
    iget-object v1, p0, Lorg/apache/tools/ant/types/selectors/FilenameSelector;->pattern:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 69
    :cond_0
    iget-object v1, p0, Lorg/apache/tools/ant/types/selectors/FilenameSelector;->regex:Ljava/lang/String;

    if-eqz v1, :cond_1

    .line 70
    iget-object v1, p0, Lorg/apache/tools/ant/types/selectors/FilenameSelector;->regex:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, " [as regular expression]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 72
    :cond_1
    const-string/jumbo v1, " negate: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-boolean v2, p0, Lorg/apache/tools/ant/types/selectors/FilenameSelector;->negated:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Z)Ljava/lang/StringBuffer;

    .line 73
    const-string/jumbo v1, " casesensitive: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-boolean v2, p0, Lorg/apache/tools/ant/types/selectors/FilenameSelector;->casesensitive:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Z)Ljava/lang/StringBuffer;

    .line 74
    const-string/jumbo v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 75
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public verifySettings()V
    .locals 1

    .prologue
    .line 159
    iget-object v0, p0, Lorg/apache/tools/ant/types/selectors/FilenameSelector;->pattern:Ljava/lang/String;

    if-nez v0, :cond_1

    iget-object v0, p0, Lorg/apache/tools/ant/types/selectors/FilenameSelector;->regex:Ljava/lang/String;

    if-nez v0, :cond_1

    .line 160
    const-string/jumbo v0, "The name or regex attribute is required"

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/selectors/FilenameSelector;->setError(Ljava/lang/String;)V

    .line 164
    :cond_0
    :goto_0
    return-void

    .line 161
    :cond_1
    iget-object v0, p0, Lorg/apache/tools/ant/types/selectors/FilenameSelector;->pattern:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/types/selectors/FilenameSelector;->regex:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 162
    const-string/jumbo v0, "Only one of name and regex attribute is allowed"

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/selectors/FilenameSelector;->setError(Ljava/lang/String;)V

    goto :goto_0
.end method
