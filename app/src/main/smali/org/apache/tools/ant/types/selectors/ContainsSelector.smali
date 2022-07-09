.class public Lorg/apache/tools/ant/types/selectors/ContainsSelector;
.super Lorg/apache/tools/ant/types/selectors/BaseExtendSelector;
.source "ContainsSelector.java"

# interfaces
.implements Lorg/apache/tools/ant/types/resources/selectors/ResourceSelector;


# static fields
.field public static final CASE_KEY:Ljava/lang/String; = "casesensitive"

.field public static final CONTAINS_KEY:Ljava/lang/String; = "text"

.field public static final EXPRESSION_KEY:Ljava/lang/String; = "expression"

.field public static final WHITESPACE_KEY:Ljava/lang/String; = "ignorewhitespace"


# instance fields
.field private casesensitive:Z

.field private contains:Ljava/lang/String;

.field private ignorewhitespace:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 59
    invoke-direct {p0}, Lorg/apache/tools/ant/types/selectors/BaseExtendSelector;-><init>()V

    .line 42
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/types/selectors/ContainsSelector;->contains:Ljava/lang/String;

    .line 43
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/types/selectors/ContainsSelector;->casesensitive:Z

    .line 44
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/types/selectors/ContainsSelector;->ignorewhitespace:Z

    .line 60
    return-void
.end method


# virtual methods
.method public isSelected(Ljava/io/File;Ljava/lang/String;Ljava/io/File;)Z
    .locals 1
    .param p1, "basedir"    # Ljava/io/File;
    .param p2, "filename"    # Ljava/lang/String;
    .param p3, "file"    # Ljava/io/File;

    .prologue
    .line 151
    new-instance v0, Lorg/apache/tools/ant/types/resources/FileResource;

    invoke-direct {v0, p3}, Lorg/apache/tools/ant/types/resources/FileResource;-><init>(Ljava/io/File;)V

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/selectors/ContainsSelector;->isSelected(Lorg/apache/tools/ant/types/Resource;)Z

    move-result v0

    return v0
.end method

.method public isSelected(Lorg/apache/tools/ant/types/Resource;)Z
    .locals 8
    .param p1, "r"    # Lorg/apache/tools/ant/types/Resource;

    .prologue
    const/4 v5, 0x1

    .line 164
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/selectors/ContainsSelector;->validate()V

    .line 166
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Resource;->isDirectory()Z

    move-result v6

    if-nez v6, :cond_0

    iget-object v6, p0, Lorg/apache/tools/ant/types/selectors/ContainsSelector;->contains:Ljava/lang/String;

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    if-nez v6, :cond_1

    .line 202
    :cond_0
    :goto_0
    return v5

    .line 170
    :cond_1
    iget-object v4, p0, Lorg/apache/tools/ant/types/selectors/ContainsSelector;->contains:Ljava/lang/String;

    .line 171
    .local v4, "userstr":Ljava/lang/String;
    iget-boolean v6, p0, Lorg/apache/tools/ant/types/selectors/ContainsSelector;->casesensitive:Z

    if-nez v6, :cond_2

    .line 172
    iget-object v6, p0, Lorg/apache/tools/ant/types/selectors/ContainsSelector;->contains:Ljava/lang/String;

    invoke-virtual {v6}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v4

    .line 174
    :cond_2
    iget-boolean v6, p0, Lorg/apache/tools/ant/types/selectors/ContainsSelector;->ignorewhitespace:Z

    if-eqz v6, :cond_3

    .line 175
    invoke-static {v4}, Lorg/apache/tools/ant/types/selectors/SelectorUtils;->removeWhitespace(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 177
    :cond_3
    const/4 v1, 0x0

    .line 179
    .local v1, "in":Ljava/io/BufferedReader;
    :try_start_0
    new-instance v1, Ljava/io/BufferedReader;

    .end local v1    # "in":Ljava/io/BufferedReader;
    new-instance v6, Ljava/io/InputStreamReader;

    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Resource;->getInputStream()Ljava/io/InputStream;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v1, v6}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 185
    .restart local v1    # "in":Ljava/io/BufferedReader;
    :try_start_1
    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v3

    .line 186
    .local v3, "teststr":Ljava/lang/String;
    :goto_1
    if-eqz v3, :cond_7

    .line 187
    iget-boolean v6, p0, Lorg/apache/tools/ant/types/selectors/ContainsSelector;->casesensitive:Z

    if-nez v6, :cond_4

    .line 188
    invoke-virtual {v3}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v3

    .line 190
    :cond_4
    iget-boolean v6, p0, Lorg/apache/tools/ant/types/selectors/ContainsSelector;->ignorewhitespace:Z

    if-eqz v6, :cond_5

    .line 191
    invoke-static {v3}, Lorg/apache/tools/ant/types/selectors/SelectorUtils;->removeWhitespace(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 193
    :cond_5
    invoke-virtual {v3, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v6

    const/4 v7, -0x1

    if-le v6, v7, :cond_6

    .line 202
    invoke-static {v1}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/Reader;)V

    goto :goto_0

    .line 180
    .end local v1    # "in":Ljava/io/BufferedReader;
    .end local v3    # "teststr":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 181
    .local v0, "e":Ljava/lang/Exception;
    new-instance v5, Lorg/apache/tools/ant/BuildException;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v7, "Could not get InputStream from "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Resource;->toLongString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v5

    .line 196
    .end local v0    # "e":Ljava/lang/Exception;
    .restart local v1    # "in":Ljava/io/BufferedReader;
    .restart local v3    # "teststr":Ljava/lang/String;
    :cond_6
    :try_start_2
    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result-object v3

    goto :goto_1

    .line 198
    :cond_7
    const/4 v5, 0x0

    .line 202
    invoke-static {v1}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/Reader;)V

    goto :goto_0

    .line 199
    .end local v3    # "teststr":Ljava/lang/String;
    :catch_1
    move-exception v2

    .line 200
    .local v2, "ioe":Ljava/io/IOException;
    :try_start_3
    new-instance v5, Lorg/apache/tools/ant/BuildException;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v7, "Could not read "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Resource;->toLongString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v5
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 202
    .end local v2    # "ioe":Ljava/io/IOException;
    :catchall_0
    move-exception v5

    invoke-static {v1}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/Reader;)V

    throw v5
.end method

.method public setCasesensitive(Z)V
    .locals 0
    .param p1, "casesensitive"    # Z

    .prologue
    .line 91
    iput-boolean p1, p0, Lorg/apache/tools/ant/types/selectors/ContainsSelector;->casesensitive:Z

    .line 92
    return-void
.end method

.method public setIgnorewhitespace(Z)V
    .locals 0
    .param p1, "ignorewhitespace"    # Z

    .prologue
    .line 101
    iput-boolean p1, p0, Lorg/apache/tools/ant/types/selectors/ContainsSelector;->ignorewhitespace:Z

    .line 102
    return-void
.end method

.method public setParameters([Lorg/apache/tools/ant/types/Parameter;)V
    .locals 4
    .param p1, "parameters"    # [Lorg/apache/tools/ant/types/Parameter;

    .prologue
    .line 111
    invoke-super {p0, p1}, Lorg/apache/tools/ant/types/selectors/BaseExtendSelector;->setParameters([Lorg/apache/tools/ant/types/Parameter;)V

    .line 112
    if-eqz p1, :cond_3

    .line 113
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v2, p1

    if-ge v0, v2, :cond_3

    .line 114
    aget-object v2, p1, v0

    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Parameter;->getName()Ljava/lang/String;

    move-result-object v1

    .line 115
    .local v1, "paramname":Ljava/lang/String;
    const-string/jumbo v2, "text"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 116
    aget-object v2, p1, v0

    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Parameter;->getValue()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lorg/apache/tools/ant/types/selectors/ContainsSelector;->setText(Ljava/lang/String;)V

    .line 113
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 117
    :cond_0
    const-string/jumbo v2, "casesensitive"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 118
    aget-object v2, p1, v0

    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Parameter;->getValue()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lorg/apache/tools/ant/Project;->toBoolean(Ljava/lang/String;)Z

    move-result v2

    invoke-virtual {p0, v2}, Lorg/apache/tools/ant/types/selectors/ContainsSelector;->setCasesensitive(Z)V

    goto :goto_1

    .line 120
    :cond_1
    const-string/jumbo v2, "ignorewhitespace"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 121
    aget-object v2, p1, v0

    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Parameter;->getValue()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lorg/apache/tools/ant/Project;->toBoolean(Ljava/lang/String;)Z

    move-result v2

    invoke-virtual {p0, v2}, Lorg/apache/tools/ant/types/selectors/ContainsSelector;->setIgnorewhitespace(Z)V

    goto :goto_1

    .line 124
    :cond_2
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "Invalid parameter "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lorg/apache/tools/ant/types/selectors/ContainsSelector;->setError(Ljava/lang/String;)V

    goto :goto_1

    .line 128
    .end local v0    # "i":I
    .end local v1    # "paramname":Ljava/lang/String;
    :cond_3
    return-void
.end method

.method public setText(Ljava/lang/String;)V
    .locals 0
    .param p1, "contains"    # Ljava/lang/String;

    .prologue
    .line 82
    iput-object p1, p0, Lorg/apache/tools/ant/types/selectors/ContainsSelector;->contains:Ljava/lang/String;

    .line 83
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    const/16 v3, 0x22

    .line 66
    new-instance v0, Ljava/lang/StringBuffer;

    const-string/jumbo v1, "{containsselector text: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 67
    .local v0, "buf":Ljava/lang/StringBuffer;
    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/ant/types/selectors/ContainsSelector;->contains:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 68
    const-string/jumbo v1, " casesensitive: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 69
    iget-boolean v1, p0, Lorg/apache/tools/ant/types/selectors/ContainsSelector;->casesensitive:Z

    if-eqz v1, :cond_0

    const-string/jumbo v1, "true"

    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 70
    const-string/jumbo v1, " ignorewhitespace: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 71
    iget-boolean v1, p0, Lorg/apache/tools/ant/types/selectors/ContainsSelector;->ignorewhitespace:Z

    if-eqz v1, :cond_1

    const-string/jumbo v1, "true"

    :goto_1
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 72
    const-string/jumbo v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 73
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 69
    :cond_0
    const-string/jumbo v1, "false"

    goto :goto_0

    .line 71
    :cond_1
    const-string/jumbo v1, "false"

    goto :goto_1
.end method

.method public verifySettings()V
    .locals 1

    .prologue
    .line 136
    iget-object v0, p0, Lorg/apache/tools/ant/types/selectors/ContainsSelector;->contains:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 137
    const-string/jumbo v0, "The text attribute is required"

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/selectors/ContainsSelector;->setError(Ljava/lang/String;)V

    .line 139
    :cond_0
    return-void
.end method
