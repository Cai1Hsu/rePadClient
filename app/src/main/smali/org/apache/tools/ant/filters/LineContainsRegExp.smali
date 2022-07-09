.class public final Lorg/apache/tools/ant/filters/LineContainsRegExp;
.super Lorg/apache/tools/ant/filters/BaseParamFilterReader;
.source "LineContainsRegExp.java"

# interfaces
.implements Lorg/apache/tools/ant/filters/ChainableReader;


# static fields
.field private static final CS_KEY:Ljava/lang/String; = "casesensitive"

.field private static final NEGATE_KEY:Ljava/lang/String; = "negate"

.field private static final REGEXP_KEY:Ljava/lang/String; = "regexp"


# instance fields
.field private line:Ljava/lang/String;

.field private negate:Z

.field private regexpOptions:I

.field private regexps:Ljava/util/Vector;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 78
    invoke-direct {p0}, Lorg/apache/tools/ant/filters/BaseParamFilterReader;-><init>()V

    .line 60
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/filters/LineContainsRegExp;->regexps:Ljava/util/Vector;

    .line 67
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/filters/LineContainsRegExp;->line:Ljava/lang/String;

    .line 69
    iput-boolean v1, p0, Lorg/apache/tools/ant/filters/LineContainsRegExp;->negate:Z

    .line 70
    iput v1, p0, Lorg/apache/tools/ant/filters/LineContainsRegExp;->regexpOptions:I

    .line 79
    return-void
.end method

.method public constructor <init>(Ljava/io/Reader;)V
    .locals 2
    .param p1, "in"    # Ljava/io/Reader;

    .prologue
    const/4 v1, 0x0

    .line 88
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/filters/BaseParamFilterReader;-><init>(Ljava/io/Reader;)V

    .line 60
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/filters/LineContainsRegExp;->regexps:Ljava/util/Vector;

    .line 67
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/filters/LineContainsRegExp;->line:Ljava/lang/String;

    .line 69
    iput-boolean v1, p0, Lorg/apache/tools/ant/filters/LineContainsRegExp;->negate:Z

    .line 70
    iput v1, p0, Lorg/apache/tools/ant/filters/LineContainsRegExp;->regexpOptions:I

    .line 89
    return-void
.end method

.method private getRegexps()Ljava/util/Vector;
    .locals 1

    .prologue
    .line 173
    iget-object v0, p0, Lorg/apache/tools/ant/filters/LineContainsRegExp;->regexps:Ljava/util/Vector;

    return-object v0
.end method

.method private initialize()V
    .locals 6

    .prologue
    .line 225
    invoke-virtual {p0}, Lorg/apache/tools/ant/filters/LineContainsRegExp;->getParameters()[Lorg/apache/tools/ant/types/Parameter;

    move-result-object v1

    .line 226
    .local v1, "params":[Lorg/apache/tools/ant/types/Parameter;
    if-eqz v1, :cond_3

    .line 227
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v4, v1

    if-ge v0, v4, :cond_3

    .line 228
    const-string/jumbo v4, "regexp"

    aget-object v5, v1, v0

    invoke-virtual {v5}, Lorg/apache/tools/ant/types/Parameter;->getType()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 229
    aget-object v4, v1, v0

    invoke-virtual {v4}, Lorg/apache/tools/ant/types/Parameter;->getValue()Ljava/lang/String;

    move-result-object v2

    .line 230
    .local v2, "pattern":Ljava/lang/String;
    new-instance v3, Lorg/apache/tools/ant/types/RegularExpression;

    invoke-direct {v3}, Lorg/apache/tools/ant/types/RegularExpression;-><init>()V

    .line 231
    .local v3, "regexp":Lorg/apache/tools/ant/types/RegularExpression;
    invoke-virtual {v3, v2}, Lorg/apache/tools/ant/types/RegularExpression;->setPattern(Ljava/lang/String;)V

    .line 232
    iget-object v4, p0, Lorg/apache/tools/ant/filters/LineContainsRegExp;->regexps:Ljava/util/Vector;

    invoke-virtual {v4, v3}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 227
    .end local v2    # "pattern":Ljava/lang/String;
    .end local v3    # "regexp":Lorg/apache/tools/ant/types/RegularExpression;
    :cond_0
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 233
    :cond_1
    const-string/jumbo v4, "negate"

    aget-object v5, v1, v0

    invoke-virtual {v5}, Lorg/apache/tools/ant/types/Parameter;->getType()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 234
    aget-object v4, v1, v0

    invoke-virtual {v4}, Lorg/apache/tools/ant/types/Parameter;->getValue()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lorg/apache/tools/ant/Project;->toBoolean(Ljava/lang/String;)Z

    move-result v4

    invoke-virtual {p0, v4}, Lorg/apache/tools/ant/filters/LineContainsRegExp;->setNegate(Z)V

    goto :goto_1

    .line 235
    :cond_2
    const-string/jumbo v4, "casesensitive"

    aget-object v5, v1, v0

    invoke-virtual {v5}, Lorg/apache/tools/ant/types/Parameter;->getType()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 236
    aget-object v4, v1, v0

    invoke-virtual {v4}, Lorg/apache/tools/ant/types/Parameter;->getValue()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lorg/apache/tools/ant/Project;->toBoolean(Ljava/lang/String;)Z

    move-result v4

    invoke-virtual {p0, v4}, Lorg/apache/tools/ant/filters/LineContainsRegExp;->setCaseSensitive(Z)V

    goto :goto_1

    .line 240
    .end local v0    # "i":I
    :cond_3
    return-void
.end method

.method private setRegexps(Ljava/util/Vector;)V
    .locals 0
    .param p1, "regexps"    # Ljava/util/Vector;

    .prologue
    .line 159
    iput-object p1, p0, Lorg/apache/tools/ant/filters/LineContainsRegExp;->regexps:Ljava/util/Vector;

    .line 160
    return-void
.end method


# virtual methods
.method public addConfiguredRegexp(Lorg/apache/tools/ant/types/RegularExpression;)V
    .locals 1
    .param p1, "regExp"    # Lorg/apache/tools/ant/types/RegularExpression;

    .prologue
    .line 146
    iget-object v0, p0, Lorg/apache/tools/ant/filters/LineContainsRegExp;->regexps:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 147
    return-void
.end method

.method public chain(Ljava/io/Reader;)Ljava/io/Reader;
    .locals 3
    .param p1, "rdr"    # Ljava/io/Reader;

    .prologue
    .line 187
    new-instance v0, Lorg/apache/tools/ant/filters/LineContainsRegExp;

    invoke-direct {v0, p1}, Lorg/apache/tools/ant/filters/LineContainsRegExp;-><init>(Ljava/io/Reader;)V

    .line 188
    .local v0, "newFilter":Lorg/apache/tools/ant/filters/LineContainsRegExp;
    invoke-direct {p0}, Lorg/apache/tools/ant/filters/LineContainsRegExp;->getRegexps()Ljava/util/Vector;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/filters/LineContainsRegExp;->setRegexps(Ljava/util/Vector;)V

    .line 189
    invoke-virtual {p0}, Lorg/apache/tools/ant/filters/LineContainsRegExp;->isNegated()Z

    move-result v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/filters/LineContainsRegExp;->setNegate(Z)V

    .line 190
    iget v1, p0, Lorg/apache/tools/ant/filters/LineContainsRegExp;->regexpOptions:I

    const/16 v2, 0x100

    invoke-static {v1, v2}, Lorg/apache/tools/ant/util/regexp/RegexpUtil;->hasFlag(II)Z

    move-result v1

    if-nez v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/filters/LineContainsRegExp;->setCaseSensitive(Z)V

    .line 194
    return-object v0

    .line 190
    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public isNegated()Z
    .locals 1

    .prologue
    .line 218
    iget-boolean v0, p0, Lorg/apache/tools/ant/filters/LineContainsRegExp;->negate:Z

    return v0
.end method

.method public read()I
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x1

    .line 103
    invoke-virtual {p0}, Lorg/apache/tools/ant/filters/LineContainsRegExp;->getInitialized()Z

    move-result v6

    if-nez v6, :cond_0

    .line 104
    invoke-direct {p0}, Lorg/apache/tools/ant/filters/LineContainsRegExp;->initialize()V

    .line 105
    invoke-virtual {p0, v8}, Lorg/apache/tools/ant/filters/LineContainsRegExp;->setInitialized(Z)V

    .line 108
    :cond_0
    const/4 v0, -0x1

    .line 110
    .local v0, "ch":I
    iget-object v6, p0, Lorg/apache/tools/ant/filters/LineContainsRegExp;->line:Ljava/lang/String;

    if-eqz v6, :cond_3

    .line 111
    iget-object v6, p0, Lorg/apache/tools/ant/filters/LineContainsRegExp;->line:Ljava/lang/String;

    const/4 v7, 0x0

    invoke-virtual {v6, v7}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 112
    iget-object v6, p0, Lorg/apache/tools/ant/filters/LineContainsRegExp;->line:Ljava/lang/String;

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    if-ne v6, v8, :cond_2

    .line 113
    const/4 v6, 0x0

    iput-object v6, p0, Lorg/apache/tools/ant/filters/LineContainsRegExp;->line:Ljava/lang/String;

    :cond_1
    :goto_0
    move v6, v0

    .line 136
    :goto_1
    return v6

    .line 115
    :cond_2
    iget-object v6, p0, Lorg/apache/tools/ant/filters/LineContainsRegExp;->line:Ljava/lang/String;

    invoke-virtual {v6, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lorg/apache/tools/ant/filters/LineContainsRegExp;->line:Ljava/lang/String;

    goto :goto_0

    .line 118
    :cond_3
    iget-object v6, p0, Lorg/apache/tools/ant/filters/LineContainsRegExp;->regexps:Ljava/util/Vector;

    invoke-virtual {v6}, Ljava/util/Vector;->size()I

    move-result v5

    .line 120
    .local v5, "regexpsSize":I
    invoke-virtual {p0}, Lorg/apache/tools/ant/filters/LineContainsRegExp;->readLine()Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lorg/apache/tools/ant/filters/LineContainsRegExp;->line:Ljava/lang/String;

    :goto_2
    iget-object v6, p0, Lorg/apache/tools/ant/filters/LineContainsRegExp;->line:Ljava/lang/String;

    if-eqz v6, :cond_5

    .line 121
    const/4 v2, 0x1

    .line 122
    .local v2, "matches":Z
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_3
    if-eqz v2, :cond_4

    if-ge v1, v5, :cond_4

    .line 123
    iget-object v6, p0, Lorg/apache/tools/ant/filters/LineContainsRegExp;->regexps:Ljava/util/Vector;

    invoke-virtual {v6, v1}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/apache/tools/ant/types/RegularExpression;

    .line 125
    .local v4, "regexp":Lorg/apache/tools/ant/types/RegularExpression;
    invoke-virtual {p0}, Lorg/apache/tools/ant/filters/LineContainsRegExp;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v6

    invoke-virtual {v4, v6}, Lorg/apache/tools/ant/types/RegularExpression;->getRegexp(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/util/regexp/Regexp;

    move-result-object v3

    .line 126
    .local v3, "re":Lorg/apache/tools/ant/util/regexp/Regexp;
    iget-object v6, p0, Lorg/apache/tools/ant/filters/LineContainsRegExp;->line:Ljava/lang/String;

    iget v7, p0, Lorg/apache/tools/ant/filters/LineContainsRegExp;->regexpOptions:I

    invoke-interface {v3, v6, v7}, Lorg/apache/tools/ant/util/regexp/Regexp;->matches(Ljava/lang/String;I)Z

    move-result v2

    .line 122
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    .line 128
    .end local v3    # "re":Lorg/apache/tools/ant/util/regexp/Regexp;
    .end local v4    # "regexp":Lorg/apache/tools/ant/types/RegularExpression;
    :cond_4
    invoke-virtual {p0}, Lorg/apache/tools/ant/filters/LineContainsRegExp;->isNegated()Z

    move-result v6

    xor-int/2addr v6, v2

    if-eqz v6, :cond_6

    .line 132
    .end local v1    # "i":I
    .end local v2    # "matches":Z
    :cond_5
    iget-object v6, p0, Lorg/apache/tools/ant/filters/LineContainsRegExp;->line:Ljava/lang/String;

    if-eqz v6, :cond_1

    .line 133
    invoke-virtual {p0}, Lorg/apache/tools/ant/filters/LineContainsRegExp;->read()I

    move-result v6

    goto :goto_1

    .line 120
    .restart local v1    # "i":I
    .restart local v2    # "matches":Z
    :cond_6
    invoke-virtual {p0}, Lorg/apache/tools/ant/filters/LineContainsRegExp;->readLine()Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lorg/apache/tools/ant/filters/LineContainsRegExp;->line:Ljava/lang/String;

    goto :goto_2
.end method

.method public setCaseSensitive(Z)V
    .locals 1
    .param p1, "b"    # Z

    .prologue
    .line 210
    invoke-static {p1}, Lorg/apache/tools/ant/util/regexp/RegexpUtil;->asOptions(Z)I

    move-result v0

    iput v0, p0, Lorg/apache/tools/ant/filters/LineContainsRegExp;->regexpOptions:I

    .line 211
    return-void
.end method

.method public setNegate(Z)V
    .locals 0
    .param p1, "b"    # Z

    .prologue
    .line 202
    iput-boolean p1, p0, Lorg/apache/tools/ant/filters/LineContainsRegExp;->negate:Z

    .line 203
    return-void
.end method
