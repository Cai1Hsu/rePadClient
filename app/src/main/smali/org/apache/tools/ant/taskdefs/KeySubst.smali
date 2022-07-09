.class public Lorg/apache/tools/ant/taskdefs/KeySubst;
.super Lorg/apache/tools/ant/Task;
.source "KeySubst.java"


# instance fields
.field private dest:Ljava/io/File;

.field private replacements:Ljava/util/Hashtable;

.field private sep:Ljava/lang/String;

.field private source:Ljava/io/File;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 43
    invoke-direct {p0}, Lorg/apache/tools/ant/Task;-><init>()V

    .line 44
    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/KeySubst;->source:Ljava/io/File;

    .line 45
    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/KeySubst;->dest:Ljava/io/File;

    .line 46
    const-string/jumbo v0, "*"

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/KeySubst;->sep:Ljava/lang/String;

    .line 47
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/KeySubst;->replacements:Ljava/util/Hashtable;

    return-void
.end method

.method public static main([Ljava/lang/String;)V
    .locals 4
    .param p0, "args"    # [Ljava/lang/String;

    .prologue
    .line 149
    :try_start_0
    new-instance v1, Ljava/util/Hashtable;

    invoke-direct {v1}, Ljava/util/Hashtable;-><init>()V

    .line 150
    .local v1, "hash":Ljava/util/Hashtable;
    const-string/jumbo v2, "VERSION"

    const-string/jumbo v3, "1.0.3"

    invoke-virtual {v1, v2, v3}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 151
    const-string/jumbo v2, "b"

    const-string/jumbo v3, "ffff"

    invoke-virtual {v1, v2, v3}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 152
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string/jumbo v3, "$f ${VERSION} f ${b} jj $"

    invoke-static {v3, v1}, Lorg/apache/tools/ant/taskdefs/KeySubst;->replace(Ljava/lang/String;Ljava/util/Hashtable;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 157
    .end local v1    # "hash":Ljava/util/Hashtable;
    :goto_0
    return-void

    .line 154
    :catch_0
    move-exception v0

    .line 155
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public static replace(Ljava/lang/String;Ljava/util/Hashtable;)Ljava/lang/String;
    .locals 7
    .param p0, "origString"    # Ljava/lang/String;
    .param p1, "keys"    # Ljava/util/Hashtable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 168
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 169
    .local v0, "finalString":Ljava/lang/StringBuffer;
    const/4 v2, 0x0

    .line 170
    .local v2, "index":I
    const/4 v1, 0x0

    .line 171
    .local v1, "i":I
    const/4 v3, 0x0

    .line 173
    .local v3, "key":Ljava/lang/String;
    :goto_0
    const-string/jumbo v4, "${"

    invoke-virtual {p0, v4, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v2

    const/4 v4, -0x1

    if-le v2, v4, :cond_1

    .line 174
    add-int/lit8 v4, v2, 0x2

    const-string/jumbo v5, "}"

    add-int/lit8 v6, v2, 0x3

    invoke-virtual {p0, v5, v6}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v5

    invoke-virtual {p0, v4, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    .line 176
    invoke-virtual {p0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 177
    invoke-virtual {p1, v3}, Ljava/util/Hashtable;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 178
    invoke-virtual {p1, v3}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    .line 184
    :goto_1
    add-int/lit8 v4, v2, 0x3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v5

    add-int v1, v4, v5

    goto :goto_0

    .line 180
    :cond_0
    const-string/jumbo v4, "${"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 181
    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 182
    const-string/jumbo v4, "}"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_1

    .line 187
    :cond_1
    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 188
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4
.end method


# virtual methods
.method public execute()V
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 54
    const-string/jumbo v7, "!! KeySubst is deprecated. Use Filter + Copy instead. !!"

    invoke-virtual {p0, v7}, Lorg/apache/tools/ant/taskdefs/KeySubst;->log(Ljava/lang/String;)V

    .line 55
    const-string/jumbo v7, "Performing Substitutions"

    invoke-virtual {p0, v7}, Lorg/apache/tools/ant/taskdefs/KeySubst;->log(Ljava/lang/String;)V

    .line 56
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/KeySubst;->source:Ljava/io/File;

    if-eqz v7, :cond_0

    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/KeySubst;->dest:Ljava/io/File;

    if-nez v7, :cond_1

    .line 57
    :cond_0
    const-string/jumbo v7, "Source and destinations must not be null"

    invoke-virtual {p0, v7}, Lorg/apache/tools/ant/taskdefs/KeySubst;->log(Ljava/lang/String;)V

    .line 87
    :goto_0
    return-void

    .line 60
    :cond_1
    const/4 v0, 0x0

    .line 61
    .local v0, "br":Ljava/io/BufferedReader;
    const/4 v2, 0x0

    .line 63
    .local v2, "bw":Ljava/io/BufferedWriter;
    :try_start_0
    new-instance v1, Ljava/io/BufferedReader;

    new-instance v7, Ljava/io/FileReader;

    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/KeySubst;->source:Ljava/io/File;

    invoke-direct {v7, v8}, Ljava/io/FileReader;-><init>(Ljava/io/File;)V

    invoke-direct {v1, v7}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 64
    .end local v0    # "br":Ljava/io/BufferedReader;
    .local v1, "br":Ljava/io/BufferedReader;
    :try_start_1
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/KeySubst;->dest:Ljava/io/File;

    invoke-virtual {v7}, Ljava/io/File;->delete()Z

    .line 65
    new-instance v3, Ljava/io/BufferedWriter;

    new-instance v7, Ljava/io/FileWriter;

    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/KeySubst;->dest:Ljava/io/File;

    invoke-direct {v7, v8}, Ljava/io/FileWriter;-><init>(Ljava/io/File;)V

    invoke-direct {v3, v7}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 67
    .end local v2    # "bw":Ljava/io/BufferedWriter;
    .local v3, "bw":Ljava/io/BufferedWriter;
    const/4 v5, 0x0

    .line 68
    .local v5, "line":Ljava/lang/String;
    const/4 v6, 0x0

    .line 69
    .local v6, "newline":Ljava/lang/String;
    :try_start_2
    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v5

    .line 70
    :goto_1
    if-eqz v5, :cond_3

    .line 71
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v7

    if-nez v7, :cond_2

    .line 72
    invoke-virtual {v3}, Ljava/io/BufferedWriter;->newLine()V

    .line 78
    :goto_2
    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v5

    goto :goto_1

    .line 74
    :cond_2
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/KeySubst;->replacements:Ljava/util/Hashtable;

    invoke-static {v5, v7}, Lorg/apache/tools/ant/taskdefs/KeySubst;->replace(Ljava/lang/String;Ljava/util/Hashtable;)Ljava/lang/String;

    move-result-object v6

    .line 75
    invoke-virtual {v3, v6}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 76
    invoke-virtual {v3}, Ljava/io/BufferedWriter;->newLine()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    goto :goto_2

    .line 81
    :catch_0
    move-exception v4

    move-object v2, v3

    .end local v3    # "bw":Ljava/io/BufferedWriter;
    .restart local v2    # "bw":Ljava/io/BufferedWriter;
    move-object v0, v1

    .line 82
    .end local v1    # "br":Ljava/io/BufferedReader;
    .end local v5    # "line":Ljava/lang/String;
    .end local v6    # "newline":Ljava/lang/String;
    .restart local v0    # "br":Ljava/io/BufferedReader;
    .local v4, "ioe":Ljava/io/IOException;
    :goto_3
    :try_start_3
    invoke-virtual {v4}, Ljava/io/IOException;->printStackTrace()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 84
    invoke-static {v2}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/Writer;)V

    .line 85
    invoke-static {v0}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/Reader;)V

    goto :goto_0

    .line 80
    .end local v0    # "br":Ljava/io/BufferedReader;
    .end local v2    # "bw":Ljava/io/BufferedWriter;
    .end local v4    # "ioe":Ljava/io/IOException;
    .restart local v1    # "br":Ljava/io/BufferedReader;
    .restart local v3    # "bw":Ljava/io/BufferedWriter;
    .restart local v5    # "line":Ljava/lang/String;
    .restart local v6    # "newline":Ljava/lang/String;
    :cond_3
    :try_start_4
    invoke-virtual {v3}, Ljava/io/BufferedWriter;->flush()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 84
    invoke-static {v3}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/Writer;)V

    .line 85
    invoke-static {v1}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/Reader;)V

    move-object v2, v3

    .end local v3    # "bw":Ljava/io/BufferedWriter;
    .restart local v2    # "bw":Ljava/io/BufferedWriter;
    move-object v0, v1

    .line 86
    .end local v1    # "br":Ljava/io/BufferedReader;
    .restart local v0    # "br":Ljava/io/BufferedReader;
    goto :goto_0

    .line 84
    .end local v5    # "line":Ljava/lang/String;
    .end local v6    # "newline":Ljava/lang/String;
    :catchall_0
    move-exception v7

    :goto_4
    invoke-static {v2}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/Writer;)V

    .line 85
    invoke-static {v0}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/Reader;)V

    throw v7

    .line 84
    .end local v0    # "br":Ljava/io/BufferedReader;
    .restart local v1    # "br":Ljava/io/BufferedReader;
    :catchall_1
    move-exception v7

    move-object v0, v1

    .end local v1    # "br":Ljava/io/BufferedReader;
    .restart local v0    # "br":Ljava/io/BufferedReader;
    goto :goto_4

    .end local v0    # "br":Ljava/io/BufferedReader;
    .end local v2    # "bw":Ljava/io/BufferedWriter;
    .restart local v1    # "br":Ljava/io/BufferedReader;
    .restart local v3    # "bw":Ljava/io/BufferedWriter;
    .restart local v5    # "line":Ljava/lang/String;
    .restart local v6    # "newline":Ljava/lang/String;
    :catchall_2
    move-exception v7

    move-object v2, v3

    .end local v3    # "bw":Ljava/io/BufferedWriter;
    .restart local v2    # "bw":Ljava/io/BufferedWriter;
    move-object v0, v1

    .end local v1    # "br":Ljava/io/BufferedReader;
    .restart local v0    # "br":Ljava/io/BufferedReader;
    goto :goto_4

    .line 81
    .end local v5    # "line":Ljava/lang/String;
    .end local v6    # "newline":Ljava/lang/String;
    :catch_1
    move-exception v4

    goto :goto_3

    .end local v0    # "br":Ljava/io/BufferedReader;
    .restart local v1    # "br":Ljava/io/BufferedReader;
    :catch_2
    move-exception v4

    move-object v0, v1

    .end local v1    # "br":Ljava/io/BufferedReader;
    .restart local v0    # "br":Ljava/io/BufferedReader;
    goto :goto_3
.end method

.method public setDest(Ljava/io/File;)V
    .locals 0
    .param p1, "dest"    # Ljava/io/File;

    .prologue
    .line 102
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/KeySubst;->dest:Ljava/io/File;

    .line 103
    return-void
.end method

.method public setKeys(Ljava/lang/String;)V
    .locals 7
    .param p1, "keys"    # Ljava/lang/String;

    .prologue
    const/4 v6, 0x0

    .line 127
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v5

    if-lez v5, :cond_0

    .line 128
    new-instance v2, Ljava/util/StringTokenizer;

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/KeySubst;->sep:Ljava/lang/String;

    invoke-direct {v2, p1, v5, v6}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 130
    .local v2, "tok":Ljava/util/StringTokenizer;
    :goto_0
    invoke-virtual {v2}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 131
    invoke-virtual {v2}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    .line 132
    .local v3, "token":Ljava/lang/String;
    new-instance v0, Ljava/util/StringTokenizer;

    const-string/jumbo v5, "="

    invoke-direct {v0, v3, v5, v6}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 135
    .local v0, "itok":Ljava/util/StringTokenizer;
    invoke-virtual {v0}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v1

    .line 136
    .local v1, "name":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v4

    .line 137
    .local v4, "value":Ljava/lang/String;
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/KeySubst;->replacements:Ljava/util/Hashtable;

    invoke-virtual {v5, v1, v4}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 140
    .end local v0    # "itok":Ljava/util/StringTokenizer;
    .end local v1    # "name":Ljava/lang/String;
    .end local v2    # "tok":Ljava/util/StringTokenizer;
    .end local v3    # "token":Ljava/lang/String;
    .end local v4    # "value":Ljava/lang/String;
    :cond_0
    return-void
.end method

.method public setSep(Ljava/lang/String;)V
    .locals 0
    .param p1, "sep"    # Ljava/lang/String;

    .prologue
    .line 111
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/KeySubst;->sep:Ljava/lang/String;

    .line 112
    return-void
.end method

.method public setSrc(Ljava/io/File;)V
    .locals 0
    .param p1, "s"    # Ljava/io/File;

    .prologue
    .line 94
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/KeySubst;->source:Ljava/io/File;

    .line 95
    return-void
.end method
