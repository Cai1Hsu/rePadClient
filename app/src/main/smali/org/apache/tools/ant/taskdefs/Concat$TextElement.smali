.class public Lorg/apache/tools/ant/taskdefs/Concat$TextElement;
.super Lorg/apache/tools/ant/ProjectComponent;
.source "Concat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/taskdefs/Concat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "TextElement"
.end annotation


# instance fields
.field private encoding:Ljava/lang/String;

.field private filtering:Z

.field private trim:Z

.field private trimLeading:Z

.field private value:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 92
    invoke-direct {p0}, Lorg/apache/tools/ant/ProjectComponent;-><init>()V

    .line 93
    const-string/jumbo v0, ""

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Concat$TextElement;->value:Ljava/lang/String;

    .line 94
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/Concat$TextElement;->trimLeading:Z

    .line 95
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/Concat$TextElement;->trim:Z

    .line 96
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Concat$TextElement;->filtering:Z

    .line 97
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Concat$TextElement;->encoding:Ljava/lang/String;

    return-void
.end method

.method static access$900(Lorg/apache/tools/ant/taskdefs/Concat$TextElement;)Z
    .locals 1
    .param p0, "x0"    # Lorg/apache/tools/ant/taskdefs/Concat$TextElement;

    .prologue
    .line 92
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/Concat$TextElement;->getFiltering()Z

    move-result v0

    return v0
.end method

.method private getFiltering()Z
    .locals 1

    .prologue
    .line 112
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Concat$TextElement;->filtering:Z

    return v0
.end method


# virtual methods
.method public addText(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 158
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Concat$TextElement;->value:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Concat$TextElement;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-virtual {v1, p1}, Lorg/apache/tools/ant/Project;->replaceProperties(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Concat$TextElement;->value:Ljava/lang/String;

    .line 159
    return-void
.end method

.method public getValue()Ljava/lang/String;
    .locals 7

    .prologue
    .line 181
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/Concat$TextElement;->value:Ljava/lang/String;

    if-nez v6, :cond_0

    .line 182
    const-string/jumbo v6, ""

    iput-object v6, p0, Lorg/apache/tools/ant/taskdefs/Concat$TextElement;->value:Ljava/lang/String;

    .line 184
    :cond_0
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/Concat$TextElement;->value:Ljava/lang/String;

    invoke-virtual {v6}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    if-nez v6, :cond_1

    .line 185
    const-string/jumbo v6, ""

    iput-object v6, p0, Lorg/apache/tools/ant/taskdefs/Concat$TextElement;->value:Ljava/lang/String;

    .line 187
    :cond_1
    iget-boolean v6, p0, Lorg/apache/tools/ant/taskdefs/Concat$TextElement;->trimLeading:Z

    if-eqz v6, :cond_7

    .line 188
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/Concat$TextElement;->value:Ljava/lang/String;

    invoke-virtual {v6}, Ljava/lang/String;->toCharArray()[C

    move-result-object v2

    .line 189
    .local v2, "current":[C
    new-instance v0, Ljava/lang/StringBuffer;

    array-length v6, v2

    invoke-direct {v0, v6}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 190
    .local v0, "b":Ljava/lang/StringBuffer;
    const/4 v5, 0x1

    .line 191
    .local v5, "startOfLine":Z
    const/4 v3, 0x0

    .line 192
    .local v3, "pos":I
    :goto_0
    array-length v6, v2

    if-ge v3, v6, :cond_6

    .line 193
    add-int/lit8 v4, v3, 0x1

    .end local v3    # "pos":I
    .local v4, "pos":I
    aget-char v1, v2, v3

    .line 194
    .local v1, "ch":C
    if-eqz v5, :cond_3

    .line 195
    const/16 v6, 0x20

    if-eq v1, v6, :cond_9

    const/16 v6, 0x9

    if-ne v1, v6, :cond_2

    move v3, v4

    .line 196
    .end local v4    # "pos":I
    .restart local v3    # "pos":I
    goto :goto_0

    .line 198
    .end local v3    # "pos":I
    .restart local v4    # "pos":I
    :cond_2
    const/4 v5, 0x0

    .line 200
    :cond_3
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 201
    const/16 v6, 0xa

    if-eq v1, v6, :cond_4

    const/16 v6, 0xd

    if-ne v1, v6, :cond_5

    .line 202
    :cond_4
    const/4 v5, 0x1

    :cond_5
    move v3, v4

    .end local v4    # "pos":I
    .restart local v3    # "pos":I
    goto :goto_0

    .line 205
    .end local v1    # "ch":C
    :cond_6
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lorg/apache/tools/ant/taskdefs/Concat$TextElement;->value:Ljava/lang/String;

    .line 207
    .end local v0    # "b":Ljava/lang/StringBuffer;
    .end local v2    # "current":[C
    .end local v3    # "pos":I
    .end local v5    # "startOfLine":Z
    :cond_7
    iget-boolean v6, p0, Lorg/apache/tools/ant/taskdefs/Concat$TextElement;->trim:Z

    if-eqz v6, :cond_8

    .line 208
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/Concat$TextElement;->value:Ljava/lang/String;

    invoke-virtual {v6}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lorg/apache/tools/ant/taskdefs/Concat$TextElement;->value:Ljava/lang/String;

    .line 210
    :cond_8
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/Concat$TextElement;->value:Ljava/lang/String;

    return-object v6

    .restart local v0    # "b":Ljava/lang/StringBuffer;
    .restart local v1    # "ch":C
    .restart local v2    # "current":[C
    .restart local v4    # "pos":I
    .restart local v5    # "startOfLine":Z
    :cond_9
    move v3, v4

    .end local v4    # "pos":I
    .restart local v3    # "pos":I
    goto :goto_0
.end method

.method public setEncoding(Ljava/lang/String;)V
    .locals 0
    .param p1, "encoding"    # Ljava/lang/String;

    .prologue
    .line 121
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Concat$TextElement;->encoding:Ljava/lang/String;

    .line 122
    return-void
.end method

.method public setFile(Ljava/io/File;)V
    .locals 6
    .param p1, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 132
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v3

    if-nez v3, :cond_0

    .line 133
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "File "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, " does not exist."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 136
    :cond_0
    const/4 v1, 0x0

    .line 138
    .local v1, "reader":Ljava/io/BufferedReader;
    :try_start_0
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Concat$TextElement;->encoding:Ljava/lang/String;

    if-nez v3, :cond_1

    .line 139
    new-instance v2, Ljava/io/BufferedReader;

    new-instance v3, Ljava/io/FileReader;

    invoke-direct {v3, p1}, Ljava/io/FileReader;-><init>(Ljava/io/File;)V

    invoke-direct {v2, v3}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .end local v1    # "reader":Ljava/io/BufferedReader;
    .local v2, "reader":Ljava/io/BufferedReader;
    move-object v1, v2

    .line 145
    .end local v2    # "reader":Ljava/io/BufferedReader;
    .restart local v1    # "reader":Ljava/io/BufferedReader;
    :goto_0
    invoke-static {v1}, Lorg/apache/tools/ant/util/FileUtils;->safeReadFully(Ljava/io/Reader;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lorg/apache/tools/ant/taskdefs/Concat$TextElement;->value:Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 149
    invoke-static {v1}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/Reader;)V

    .line 151
    return-void

    .line 141
    :cond_1
    :try_start_1
    new-instance v2, Ljava/io/BufferedReader;

    new-instance v3, Ljava/io/InputStreamReader;

    new-instance v4, Ljava/io/FileInputStream;

    invoke-direct {v4, p1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Concat$TextElement;->encoding:Ljava/lang/String;

    invoke-direct {v3, v4, v5}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    invoke-direct {v2, v3}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .end local v1    # "reader":Ljava/io/BufferedReader;
    .restart local v2    # "reader":Ljava/io/BufferedReader;
    move-object v1, v2

    .end local v2    # "reader":Ljava/io/BufferedReader;
    .restart local v1    # "reader":Ljava/io/BufferedReader;
    goto :goto_0

    .line 146
    :catch_0
    move-exception v0

    .line 147
    .local v0, "ex":Ljava/io/IOException;
    :try_start_2
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v3, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 149
    .end local v0    # "ex":Ljava/io/IOException;
    :catchall_0
    move-exception v3

    invoke-static {v1}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/Reader;)V

    throw v3
.end method

.method public setFiltering(Z)V
    .locals 0
    .param p1, "filtering"    # Z

    .prologue
    .line 107
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Concat$TextElement;->filtering:Z

    .line 108
    return-void
.end method

.method public setTrim(Z)V
    .locals 0
    .param p1, "trim"    # Z

    .prologue
    .line 174
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Concat$TextElement;->trim:Z

    .line 175
    return-void
.end method

.method public setTrimLeading(Z)V
    .locals 0
    .param p1, "strip"    # Z

    .prologue
    .line 166
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Concat$TextElement;->trimLeading:Z

    .line 167
    return-void
.end method
