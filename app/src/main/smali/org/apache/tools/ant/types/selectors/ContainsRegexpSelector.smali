.class public Lorg/apache/tools/ant/types/selectors/ContainsRegexpSelector;
.super Lorg/apache/tools/ant/types/selectors/BaseExtendSelector;
.source "ContainsRegexpSelector.java"

# interfaces
.implements Lorg/apache/tools/ant/types/resources/selectors/ResourceSelector;


# static fields
.field private static final CS_KEY:Ljava/lang/String; = "casesensitive"

.field public static final EXPRESSION_KEY:Ljava/lang/String; = "expression"

.field private static final ML_KEY:Ljava/lang/String; = "multiline"

.field private static final SL_KEY:Ljava/lang/String; = "singleline"


# instance fields
.field private caseSensitive:Z

.field private multiLine:Z

.field private myExpression:Lorg/apache/tools/ant/util/regexp/Regexp;

.field private myRegExp:Lorg/apache/tools/ant/types/RegularExpression;

.field private singleLine:Z

.field private userProvidedExpression:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x0

    .line 62
    invoke-direct {p0}, Lorg/apache/tools/ant/types/selectors/BaseExtendSelector;-><init>()V

    .line 44
    iput-object v0, p0, Lorg/apache/tools/ant/types/selectors/ContainsRegexpSelector;->userProvidedExpression:Ljava/lang/String;

    .line 45
    iput-object v0, p0, Lorg/apache/tools/ant/types/selectors/ContainsRegexpSelector;->myRegExp:Lorg/apache/tools/ant/types/RegularExpression;

    .line 46
    iput-object v0, p0, Lorg/apache/tools/ant/types/selectors/ContainsRegexpSelector;->myExpression:Lorg/apache/tools/ant/util/regexp/Regexp;

    .line 47
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/types/selectors/ContainsRegexpSelector;->caseSensitive:Z

    .line 48
    iput-boolean v1, p0, Lorg/apache/tools/ant/types/selectors/ContainsRegexpSelector;->multiLine:Z

    .line 49
    iput-boolean v1, p0, Lorg/apache/tools/ant/types/selectors/ContainsRegexpSelector;->singleLine:Z

    .line 63
    return-void
.end method


# virtual methods
.method public isSelected(Ljava/io/File;Ljava/lang/String;Ljava/io/File;)Z
    .locals 1
    .param p1, "basedir"    # Ljava/io/File;
    .param p2, "filename"    # Ljava/lang/String;
    .param p3, "file"    # Ljava/io/File;

    .prologue
    .line 159
    new-instance v0, Lorg/apache/tools/ant/types/resources/FileResource;

    invoke-direct {v0, p3}, Lorg/apache/tools/ant/types/resources/FileResource;-><init>(Ljava/io/File;)V

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/selectors/ContainsRegexpSelector;->isSelected(Lorg/apache/tools/ant/types/Resource;)Z

    move-result v0

    return v0
.end method

.method public isSelected(Lorg/apache/tools/ant/types/Resource;)Z
    .locals 9
    .param p1, "r"    # Lorg/apache/tools/ant/types/Resource;

    .prologue
    const/4 v4, 0x1

    .line 169
    const/4 v3, 0x0

    .line 170
    .local v3, "teststr":Ljava/lang/String;
    const/4 v1, 0x0

    .line 174
    .local v1, "in":Ljava/io/BufferedReader;
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/selectors/ContainsRegexpSelector;->validate()V

    .line 176
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Resource;->isDirectory()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 206
    :goto_0
    return v4

    .line 180
    :cond_0
    iget-object v5, p0, Lorg/apache/tools/ant/types/selectors/ContainsRegexpSelector;->myRegExp:Lorg/apache/tools/ant/types/RegularExpression;

    if-nez v5, :cond_1

    .line 181
    new-instance v5, Lorg/apache/tools/ant/types/RegularExpression;

    invoke-direct {v5}, Lorg/apache/tools/ant/types/RegularExpression;-><init>()V

    iput-object v5, p0, Lorg/apache/tools/ant/types/selectors/ContainsRegexpSelector;->myRegExp:Lorg/apache/tools/ant/types/RegularExpression;

    .line 182
    iget-object v5, p0, Lorg/apache/tools/ant/types/selectors/ContainsRegexpSelector;->myRegExp:Lorg/apache/tools/ant/types/RegularExpression;

    iget-object v6, p0, Lorg/apache/tools/ant/types/selectors/ContainsRegexpSelector;->userProvidedExpression:Ljava/lang/String;

    invoke-virtual {v5, v6}, Lorg/apache/tools/ant/types/RegularExpression;->setPattern(Ljava/lang/String;)V

    .line 183
    iget-object v5, p0, Lorg/apache/tools/ant/types/selectors/ContainsRegexpSelector;->myRegExp:Lorg/apache/tools/ant/types/RegularExpression;

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/selectors/ContainsRegexpSelector;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v6

    invoke-virtual {v5, v6}, Lorg/apache/tools/ant/types/RegularExpression;->getRegexp(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/util/regexp/Regexp;

    move-result-object v5

    iput-object v5, p0, Lorg/apache/tools/ant/types/selectors/ContainsRegexpSelector;->myExpression:Lorg/apache/tools/ant/util/regexp/Regexp;

    .line 187
    :cond_1
    :try_start_0
    new-instance v1, Ljava/io/BufferedReader;

    .end local v1    # "in":Ljava/io/BufferedReader;
    new-instance v5, Ljava/io/InputStreamReader;

    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Resource;->getInputStream()Ljava/io/InputStream;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v1, v5}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 193
    .restart local v1    # "in":Ljava/io/BufferedReader;
    :try_start_1
    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v3

    .line 195
    :goto_1
    if-eqz v3, :cond_3

    .line 197
    iget-object v5, p0, Lorg/apache/tools/ant/types/selectors/ContainsRegexpSelector;->myExpression:Lorg/apache/tools/ant/util/regexp/Regexp;

    iget-boolean v6, p0, Lorg/apache/tools/ant/types/selectors/ContainsRegexpSelector;->caseSensitive:Z

    iget-boolean v7, p0, Lorg/apache/tools/ant/types/selectors/ContainsRegexpSelector;->multiLine:Z

    iget-boolean v8, p0, Lorg/apache/tools/ant/types/selectors/ContainsRegexpSelector;->singleLine:Z

    invoke-static {v6, v7, v8}, Lorg/apache/tools/ant/util/regexp/RegexpUtil;->asOptions(ZZZ)I

    move-result v6

    invoke-interface {v5, v3, v6}, Lorg/apache/tools/ant/util/regexp/Regexp;->matches(Ljava/lang/String;I)Z
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_3
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v5

    if-eqz v5, :cond_2

    .line 211
    :try_start_2
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_0

    .line 212
    :catch_0
    move-exception v0

    .line 213
    .local v0, "e":Ljava/lang/Exception;
    new-instance v4, Lorg/apache/tools/ant/BuildException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "Could not close "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Resource;->toLongString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 188
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v1    # "in":Ljava/io/BufferedReader;
    :catch_1
    move-exception v0

    .line 189
    .restart local v0    # "e":Ljava/lang/Exception;
    new-instance v4, Lorg/apache/tools/ant/BuildException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "Could not get InputStream from "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Resource;->toLongString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4

    .line 203
    .end local v0    # "e":Ljava/lang/Exception;
    .restart local v1    # "in":Ljava/io/BufferedReader;
    :cond_2
    :try_start_3
    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    move-result-object v3

    goto :goto_1

    .line 206
    :cond_3
    const/4 v4, 0x0

    .line 211
    :try_start_4
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2

    goto/16 :goto_0

    .line 212
    :catch_2
    move-exception v0

    .line 213
    .restart local v0    # "e":Ljava/lang/Exception;
    new-instance v4, Lorg/apache/tools/ant/BuildException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "Could not close "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Resource;->toLongString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 207
    .end local v0    # "e":Ljava/lang/Exception;
    :catch_3
    move-exception v2

    .line 208
    .local v2, "ioe":Ljava/io/IOException;
    :try_start_5
    new-instance v4, Lorg/apache/tools/ant/BuildException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "Could not read "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Resource;->toLongString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v4
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 210
    .end local v2    # "ioe":Ljava/io/IOException;
    :catchall_0
    move-exception v4

    .line 211
    :try_start_6
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_4

    .line 210
    throw v4

    .line 212
    :catch_4
    move-exception v0

    .line 213
    .restart local v0    # "e":Ljava/lang/Exception;
    new-instance v4, Lorg/apache/tools/ant/BuildException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "Could not close "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Resource;->toLongString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v4
.end method

.method public setCaseSensitive(Z)V
    .locals 0
    .param p1, "b"    # Z

    .prologue
    .line 91
    iput-boolean p1, p0, Lorg/apache/tools/ant/types/selectors/ContainsRegexpSelector;->caseSensitive:Z

    .line 92
    return-void
.end method

.method public setExpression(Ljava/lang/String;)V
    .locals 0
    .param p1, "theexpression"    # Ljava/lang/String;

    .prologue
    .line 82
    iput-object p1, p0, Lorg/apache/tools/ant/types/selectors/ContainsRegexpSelector;->userProvidedExpression:Ljava/lang/String;

    .line 83
    return-void
.end method

.method public setMultiLine(Z)V
    .locals 0
    .param p1, "b"    # Z

    .prologue
    .line 100
    iput-boolean p1, p0, Lorg/apache/tools/ant/types/selectors/ContainsRegexpSelector;->multiLine:Z

    .line 101
    return-void
.end method

.method public setParameters([Lorg/apache/tools/ant/types/Parameter;)V
    .locals 4
    .param p1, "parameters"    # [Lorg/apache/tools/ant/types/Parameter;

    .prologue
    .line 120
    invoke-super {p0, p1}, Lorg/apache/tools/ant/types/selectors/BaseExtendSelector;->setParameters([Lorg/apache/tools/ant/types/Parameter;)V

    .line 121
    if-eqz p1, :cond_4

    .line 122
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v2, p1

    if-ge v0, v2, :cond_4

    .line 123
    aget-object v2, p1, v0

    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Parameter;->getName()Ljava/lang/String;

    move-result-object v1

    .line 124
    .local v1, "paramname":Ljava/lang/String;
    const-string/jumbo v2, "expression"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 125
    aget-object v2, p1, v0

    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Parameter;->getValue()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lorg/apache/tools/ant/types/selectors/ContainsRegexpSelector;->setExpression(Ljava/lang/String;)V

    .line 122
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 126
    :cond_0
    const-string/jumbo v2, "casesensitive"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 127
    aget-object v2, p1, v0

    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Parameter;->getValue()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lorg/apache/tools/ant/Project;->toBoolean(Ljava/lang/String;)Z

    move-result v2

    invoke-virtual {p0, v2}, Lorg/apache/tools/ant/types/selectors/ContainsRegexpSelector;->setCaseSensitive(Z)V

    goto :goto_1

    .line 129
    :cond_1
    const-string/jumbo v2, "multiline"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 130
    aget-object v2, p1, v0

    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Parameter;->getValue()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lorg/apache/tools/ant/Project;->toBoolean(Ljava/lang/String;)Z

    move-result v2

    invoke-virtual {p0, v2}, Lorg/apache/tools/ant/types/selectors/ContainsRegexpSelector;->setMultiLine(Z)V

    goto :goto_1

    .line 131
    :cond_2
    const-string/jumbo v2, "singleline"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 132
    aget-object v2, p1, v0

    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Parameter;->getValue()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lorg/apache/tools/ant/Project;->toBoolean(Ljava/lang/String;)Z

    move-result v2

    invoke-virtual {p0, v2}, Lorg/apache/tools/ant/types/selectors/ContainsRegexpSelector;->setSingleLine(Z)V

    goto :goto_1

    .line 134
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

    invoke-virtual {p0, v2}, Lorg/apache/tools/ant/types/selectors/ContainsRegexpSelector;->setError(Ljava/lang/String;)V

    goto :goto_1

    .line 138
    .end local v0    # "i":I
    .end local v1    # "paramname":Ljava/lang/String;
    :cond_4
    return-void
.end method

.method public setSingleLine(Z)V
    .locals 0
    .param p1, "b"    # Z

    .prologue
    .line 110
    iput-boolean p1, p0, Lorg/apache/tools/ant/types/selectors/ContainsRegexpSelector;->singleLine:Z

    .line 111
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 69
    new-instance v0, Ljava/lang/StringBuffer;

    const-string/jumbo v1, "{containsregexpselector expression: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 71
    .local v0, "buf":Ljava/lang/StringBuffer;
    iget-object v1, p0, Lorg/apache/tools/ant/types/selectors/ContainsRegexpSelector;->userProvidedExpression:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 72
    const-string/jumbo v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 73
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public verifySettings()V
    .locals 1

    .prologue
    .line 145
    iget-object v0, p0, Lorg/apache/tools/ant/types/selectors/ContainsRegexpSelector;->userProvidedExpression:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 146
    const-string/jumbo v0, "The expression attribute is required"

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/selectors/ContainsRegexpSelector;->setError(Ljava/lang/String;)V

    .line 148
    :cond_0
    return-void
.end method
