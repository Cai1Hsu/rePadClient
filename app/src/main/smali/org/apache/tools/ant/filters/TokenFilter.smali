.class public Lorg/apache/tools/ant/filters/TokenFilter;
.super Lorg/apache/tools/ant/filters/BaseFilterReader;
.source "TokenFilter.java"

# interfaces
.implements Lorg/apache/tools/ant/filters/ChainableReader;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/filters/TokenFilter$DeleteCharacters;,
        Lorg/apache/tools/ant/filters/TokenFilter$IgnoreBlank;,
        Lorg/apache/tools/ant/filters/TokenFilter$Trim;,
        Lorg/apache/tools/ant/filters/TokenFilter$ContainsRegex;,
        Lorg/apache/tools/ant/filters/TokenFilter$ReplaceRegex;,
        Lorg/apache/tools/ant/filters/TokenFilter$ContainsString;,
        Lorg/apache/tools/ant/filters/TokenFilter$ReplaceString;,
        Lorg/apache/tools/ant/filters/TokenFilter$ChainableReaderFilter;,
        Lorg/apache/tools/ant/filters/TokenFilter$StringTokenizer;,
        Lorg/apache/tools/ant/filters/TokenFilter$FileTokenizer;,
        Lorg/apache/tools/ant/filters/TokenFilter$Filter;
    }
.end annotation


# instance fields
.field private delimOutput:Ljava/lang/String;

.field private filters:Ljava/util/Vector;

.field private line:Ljava/lang/String;

.field private linePos:I

.field private tokenizer:Lorg/apache/tools/ant/util/Tokenizer;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 77
    invoke-direct {p0}, Lorg/apache/tools/ant/filters/BaseFilterReader;-><init>()V

    .line 61
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/filters/TokenFilter;->filters:Ljava/util/Vector;

    .line 63
    iput-object v1, p0, Lorg/apache/tools/ant/filters/TokenFilter;->tokenizer:Lorg/apache/tools/ant/util/Tokenizer;

    .line 65
    iput-object v1, p0, Lorg/apache/tools/ant/filters/TokenFilter;->delimOutput:Ljava/lang/String;

    .line 67
    iput-object v1, p0, Lorg/apache/tools/ant/filters/TokenFilter;->line:Ljava/lang/String;

    .line 69
    const/4 v0, 0x0

    iput v0, p0, Lorg/apache/tools/ant/filters/TokenFilter;->linePos:I

    .line 78
    return-void
.end method

.method public constructor <init>(Ljava/io/Reader;)V
    .locals 2
    .param p1, "in"    # Ljava/io/Reader;

    .prologue
    const/4 v1, 0x0

    .line 87
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/filters/BaseFilterReader;-><init>(Ljava/io/Reader;)V

    .line 61
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/filters/TokenFilter;->filters:Ljava/util/Vector;

    .line 63
    iput-object v1, p0, Lorg/apache/tools/ant/filters/TokenFilter;->tokenizer:Lorg/apache/tools/ant/util/Tokenizer;

    .line 65
    iput-object v1, p0, Lorg/apache/tools/ant/filters/TokenFilter;->delimOutput:Ljava/lang/String;

    .line 67
    iput-object v1, p0, Lorg/apache/tools/ant/filters/TokenFilter;->line:Ljava/lang/String;

    .line 69
    const/4 v0, 0x0

    iput v0, p0, Lorg/apache/tools/ant/filters/TokenFilter;->linePos:I

    .line 88
    return-void
.end method

.method public static convertRegexOptions(Ljava/lang/String;)I
    .locals 1
    .param p0, "flags"    # Ljava/lang/String;

    .prologue
    .line 709
    invoke-static {p0}, Lorg/apache/tools/ant/util/regexp/RegexpUtil;->asOptions(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public static resolveBackSlash(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "input"    # Ljava/lang/String;

    .prologue
    .line 694
    invoke-static {p0}, Lorg/apache/tools/ant/util/StringUtils;->resolveBackSlash(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public add(Lorg/apache/tools/ant/filters/TokenFilter$Filter;)V
    .locals 1
    .param p1, "filter"    # Lorg/apache/tools/ant/filters/TokenFilter$Filter;

    .prologue
    .line 273
    iget-object v0, p0, Lorg/apache/tools/ant/filters/TokenFilter;->filters:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 274
    return-void
.end method

.method public add(Lorg/apache/tools/ant/util/Tokenizer;)V
    .locals 2
    .param p1, "tokenizer"    # Lorg/apache/tools/ant/util/Tokenizer;

    .prologue
    .line 202
    iget-object v0, p0, Lorg/apache/tools/ant/filters/TokenFilter;->tokenizer:Lorg/apache/tools/ant/util/Tokenizer;

    if-eqz v0, :cond_0

    .line 203
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Only one tokenizer allowed"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 205
    :cond_0
    iput-object p1, p0, Lorg/apache/tools/ant/filters/TokenFilter;->tokenizer:Lorg/apache/tools/ant/util/Tokenizer;

    .line 206
    return-void
.end method

.method public addContainsRegex(Lorg/apache/tools/ant/filters/TokenFilter$ContainsRegex;)V
    .locals 1
    .param p1, "filter"    # Lorg/apache/tools/ant/filters/TokenFilter$ContainsRegex;

    .prologue
    .line 241
    iget-object v0, p0, Lorg/apache/tools/ant/filters/TokenFilter;->filters:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 242
    return-void
.end method

.method public addContainsString(Lorg/apache/tools/ant/filters/TokenFilter$ContainsString;)V
    .locals 1
    .param p1, "filter"    # Lorg/apache/tools/ant/filters/TokenFilter$ContainsString;

    .prologue
    .line 225
    iget-object v0, p0, Lorg/apache/tools/ant/filters/TokenFilter;->filters:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 226
    return-void
.end method

.method public addDeleteCharacters(Lorg/apache/tools/ant/filters/TokenFilter$DeleteCharacters;)V
    .locals 1
    .param p1, "filter"    # Lorg/apache/tools/ant/filters/TokenFilter$DeleteCharacters;

    .prologue
    .line 265
    iget-object v0, p0, Lorg/apache/tools/ant/filters/TokenFilter;->filters:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 266
    return-void
.end method

.method public addFileTokenizer(Lorg/apache/tools/ant/filters/TokenFilter$FileTokenizer;)V
    .locals 0
    .param p1, "tokenizer"    # Lorg/apache/tools/ant/filters/TokenFilter$FileTokenizer;

    .prologue
    .line 193
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/filters/TokenFilter;->add(Lorg/apache/tools/ant/util/Tokenizer;)V

    .line 194
    return-void
.end method

.method public addIgnoreBlank(Lorg/apache/tools/ant/filters/TokenFilter$IgnoreBlank;)V
    .locals 1
    .param p1, "filter"    # Lorg/apache/tools/ant/filters/TokenFilter$IgnoreBlank;

    .prologue
    .line 257
    iget-object v0, p0, Lorg/apache/tools/ant/filters/TokenFilter;->filters:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 258
    return-void
.end method

.method public addLineTokenizer(Lorg/apache/tools/ant/util/LineTokenizer;)V
    .locals 0
    .param p1, "tokenizer"    # Lorg/apache/tools/ant/util/LineTokenizer;

    .prologue
    .line 176
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/filters/TokenFilter;->add(Lorg/apache/tools/ant/util/Tokenizer;)V

    .line 177
    return-void
.end method

.method public addReplaceRegex(Lorg/apache/tools/ant/filters/TokenFilter$ReplaceRegex;)V
    .locals 1
    .param p1, "filter"    # Lorg/apache/tools/ant/filters/TokenFilter$ReplaceRegex;

    .prologue
    .line 233
    iget-object v0, p0, Lorg/apache/tools/ant/filters/TokenFilter;->filters:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 234
    return-void
.end method

.method public addReplaceString(Lorg/apache/tools/ant/filters/TokenFilter$ReplaceString;)V
    .locals 1
    .param p1, "filter"    # Lorg/apache/tools/ant/filters/TokenFilter$ReplaceString;

    .prologue
    .line 217
    iget-object v0, p0, Lorg/apache/tools/ant/filters/TokenFilter;->filters:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 218
    return-void
.end method

.method public addStringTokenizer(Lorg/apache/tools/ant/filters/TokenFilter$StringTokenizer;)V
    .locals 0
    .param p1, "tokenizer"    # Lorg/apache/tools/ant/filters/TokenFilter$StringTokenizer;

    .prologue
    .line 185
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/filters/TokenFilter;->add(Lorg/apache/tools/ant/util/Tokenizer;)V

    .line 186
    return-void
.end method

.method public addTrim(Lorg/apache/tools/ant/filters/TokenFilter$Trim;)V
    .locals 1
    .param p1, "filter"    # Lorg/apache/tools/ant/filters/TokenFilter$Trim;

    .prologue
    .line 249
    iget-object v0, p0, Lorg/apache/tools/ant/filters/TokenFilter;->filters:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 250
    return-void
.end method

.method public final chain(Ljava/io/Reader;)Ljava/io/Reader;
    .locals 2
    .param p1, "reader"    # Ljava/io/Reader;

    .prologue
    .line 148
    new-instance v0, Lorg/apache/tools/ant/filters/TokenFilter;

    invoke-direct {v0, p1}, Lorg/apache/tools/ant/filters/TokenFilter;-><init>(Ljava/io/Reader;)V

    .line 149
    .local v0, "newFilter":Lorg/apache/tools/ant/filters/TokenFilter;
    iget-object v1, p0, Lorg/apache/tools/ant/filters/TokenFilter;->filters:Ljava/util/Vector;

    iput-object v1, v0, Lorg/apache/tools/ant/filters/TokenFilter;->filters:Ljava/util/Vector;

    .line 150
    iget-object v1, p0, Lorg/apache/tools/ant/filters/TokenFilter;->tokenizer:Lorg/apache/tools/ant/util/Tokenizer;

    iput-object v1, v0, Lorg/apache/tools/ant/filters/TokenFilter;->tokenizer:Lorg/apache/tools/ant/util/Tokenizer;

    .line 151
    iget-object v1, p0, Lorg/apache/tools/ant/filters/TokenFilter;->delimOutput:Ljava/lang/String;

    iput-object v1, v0, Lorg/apache/tools/ant/filters/TokenFilter;->delimOutput:Ljava/lang/String;

    .line 152
    invoke-virtual {p0}, Lorg/apache/tools/ant/filters/TokenFilter;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/filters/TokenFilter;->setProject(Lorg/apache/tools/ant/Project;)V

    .line 153
    return-object v0
.end method

.method public read()I
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 104
    iget-object v3, p0, Lorg/apache/tools/ant/filters/TokenFilter;->tokenizer:Lorg/apache/tools/ant/util/Tokenizer;

    if-nez v3, :cond_0

    .line 105
    new-instance v3, Lorg/apache/tools/ant/util/LineTokenizer;

    invoke-direct {v3}, Lorg/apache/tools/ant/util/LineTokenizer;-><init>()V

    iput-object v3, p0, Lorg/apache/tools/ant/filters/TokenFilter;->tokenizer:Lorg/apache/tools/ant/util/Tokenizer;

    .line 107
    :cond_0
    :goto_0
    iget-object v3, p0, Lorg/apache/tools/ant/filters/TokenFilter;->line:Ljava/lang/String;

    if-eqz v3, :cond_1

    iget-object v3, p0, Lorg/apache/tools/ant/filters/TokenFilter;->line:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    if-nez v3, :cond_7

    .line 108
    :cond_1
    iget-object v3, p0, Lorg/apache/tools/ant/filters/TokenFilter;->tokenizer:Lorg/apache/tools/ant/util/Tokenizer;

    iget-object v4, p0, Lorg/apache/tools/ant/filters/TokenFilter;->in:Ljava/io/Reader;

    invoke-interface {v3, v4}, Lorg/apache/tools/ant/util/Tokenizer;->getToken(Ljava/io/Reader;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lorg/apache/tools/ant/filters/TokenFilter;->line:Ljava/lang/String;

    .line 109
    iget-object v3, p0, Lorg/apache/tools/ant/filters/TokenFilter;->line:Ljava/lang/String;

    if-nez v3, :cond_3

    .line 110
    const/4 v0, -0x1

    .line 135
    :cond_2
    :goto_1
    return v0

    .line 112
    :cond_3
    iget-object v3, p0, Lorg/apache/tools/ant/filters/TokenFilter;->filters:Ljava/util/Vector;

    invoke-virtual {v3}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v1

    .local v1, "e":Ljava/util/Enumeration;
    :cond_4
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v3

    if-eqz v3, :cond_5

    .line 113
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/tools/ant/filters/TokenFilter$Filter;

    .line 114
    .local v2, "filter":Lorg/apache/tools/ant/filters/TokenFilter$Filter;
    iget-object v3, p0, Lorg/apache/tools/ant/filters/TokenFilter;->line:Ljava/lang/String;

    invoke-interface {v2, v3}, Lorg/apache/tools/ant/filters/TokenFilter$Filter;->filter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lorg/apache/tools/ant/filters/TokenFilter;->line:Ljava/lang/String;

    .line 115
    iget-object v3, p0, Lorg/apache/tools/ant/filters/TokenFilter;->line:Ljava/lang/String;

    if-nez v3, :cond_4

    .line 119
    .end local v2    # "filter":Lorg/apache/tools/ant/filters/TokenFilter$Filter;
    :cond_5
    const/4 v3, 0x0

    iput v3, p0, Lorg/apache/tools/ant/filters/TokenFilter;->linePos:I

    .line 120
    iget-object v3, p0, Lorg/apache/tools/ant/filters/TokenFilter;->line:Ljava/lang/String;

    if-eqz v3, :cond_0

    .line 121
    iget-object v3, p0, Lorg/apache/tools/ant/filters/TokenFilter;->tokenizer:Lorg/apache/tools/ant/util/Tokenizer;

    invoke-interface {v3}, Lorg/apache/tools/ant/util/Tokenizer;->getPostToken()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    if-eqz v3, :cond_0

    .line 122
    iget-object v3, p0, Lorg/apache/tools/ant/filters/TokenFilter;->delimOutput:Ljava/lang/String;

    if-eqz v3, :cond_6

    .line 123
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v4, p0, Lorg/apache/tools/ant/filters/TokenFilter;->line:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    iget-object v4, p0, Lorg/apache/tools/ant/filters/TokenFilter;->delimOutput:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lorg/apache/tools/ant/filters/TokenFilter;->line:Ljava/lang/String;

    goto :goto_0

    .line 125
    :cond_6
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v4, p0, Lorg/apache/tools/ant/filters/TokenFilter;->line:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    iget-object v4, p0, Lorg/apache/tools/ant/filters/TokenFilter;->tokenizer:Lorg/apache/tools/ant/util/Tokenizer;

    invoke-interface {v4}, Lorg/apache/tools/ant/util/Tokenizer;->getPostToken()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lorg/apache/tools/ant/filters/TokenFilter;->line:Ljava/lang/String;

    goto/16 :goto_0

    .line 130
    .end local v1    # "e":Ljava/util/Enumeration;
    :cond_7
    iget-object v3, p0, Lorg/apache/tools/ant/filters/TokenFilter;->line:Ljava/lang/String;

    iget v4, p0, Lorg/apache/tools/ant/filters/TokenFilter;->linePos:I

    invoke-virtual {v3, v4}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 131
    .local v0, "ch":I
    iget v3, p0, Lorg/apache/tools/ant/filters/TokenFilter;->linePos:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lorg/apache/tools/ant/filters/TokenFilter;->linePos:I

    .line 132
    iget v3, p0, Lorg/apache/tools/ant/filters/TokenFilter;->linePos:I

    iget-object v4, p0, Lorg/apache/tools/ant/filters/TokenFilter;->line:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    if-ne v3, v4, :cond_2

    .line 133
    const/4 v3, 0x0

    iput-object v3, p0, Lorg/apache/tools/ant/filters/TokenFilter;->line:Ljava/lang/String;

    goto/16 :goto_1
.end method

.method public setDelimOutput(Ljava/lang/String;)V
    .locals 1
    .param p1, "delimOutput"    # Ljava/lang/String;

    .prologue
    .line 163
    invoke-static {p1}, Lorg/apache/tools/ant/filters/TokenFilter;->resolveBackSlash(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/filters/TokenFilter;->delimOutput:Ljava/lang/String;

    .line 164
    return-void
.end method
