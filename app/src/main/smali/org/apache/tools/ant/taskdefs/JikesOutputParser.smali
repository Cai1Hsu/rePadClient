.class public Lorg/apache/tools/ant/taskdefs/JikesOutputParser;
.super Ljava/lang/Object;
.source "JikesOutputParser.java"

# interfaces
.implements Lorg/apache/tools/ant/taskdefs/ExecuteStreamHandler;


# instance fields
.field protected br:Ljava/io/BufferedReader;

.field protected emacsMode:Z

.field protected error:Z

.field protected errorFlag:Z

.field protected errors:I

.field protected task:Lorg/apache/tools/ant/Task;

.field protected warnings:I


# direct methods
.method protected constructor <init>(Lorg/apache/tools/ant/Task;Z)V
    .locals 2
    .param p1, "task"    # Lorg/apache/tools/ant/Task;
    .param p2, "emacsMode"    # Z

    .prologue
    const/4 v0, 0x0

    .line 95
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/JikesOutputParser;->errorFlag:Z

    .line 46
    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/JikesOutputParser;->error:Z

    .line 97
    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string/jumbo v1, "As of Ant 1.2 released in October 2000, the JikesOutputParser class"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 99
    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string/jumbo v1, "is considered to be dead code by the Ant developers and is unmaintained."

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 101
    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string/jumbo v1, "Don\'t use it!"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 103
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/JikesOutputParser;->task:Lorg/apache/tools/ant/Task;

    .line 104
    iput-boolean p2, p0, Lorg/apache/tools/ant/taskdefs/JikesOutputParser;->emacsMode:Z

    .line 105
    return-void
.end method

.method private log(Ljava/lang/String;)V
    .locals 5
    .param p1, "line"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 169
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/JikesOutputParser;->emacsMode:Z

    if-nez v0, :cond_0

    .line 170
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/JikesOutputParser;->task:Lorg/apache/tools/ant/Task;

    const-string/jumbo v4, ""

    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/JikesOutputParser;->error:Z

    if-eqz v0, :cond_1

    move v0, v1

    :goto_0
    invoke-virtual {v3, v4, v0}, Lorg/apache/tools/ant/Task;->log(Ljava/lang/String;I)V

    .line 172
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/JikesOutputParser;->task:Lorg/apache/tools/ant/Task;

    iget-boolean v3, p0, Lorg/apache/tools/ant/taskdefs/JikesOutputParser;->error:Z

    if-eqz v3, :cond_2

    :goto_1
    invoke-virtual {v0, p1, v1}, Lorg/apache/tools/ant/Task;->log(Ljava/lang/String;I)V

    .line 173
    return-void

    :cond_1
    move v0, v2

    .line 170
    goto :goto_0

    :cond_2
    move v1, v2

    .line 172
    goto :goto_1
.end method

.method private parseEmacsOutput(Ljava/io/BufferedReader;)V
    .locals 0
    .param p1, "reader"    # Ljava/io/BufferedReader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 158
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/taskdefs/JikesOutputParser;->parseStandardOutput(Ljava/io/BufferedReader;)V

    .line 159
    return-void
.end method

.method private parseStandardOutput(Ljava/io/BufferedReader;)V
    .locals 6
    .param p1, "reader"    # Ljava/io/BufferedReader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x1

    const/4 v4, -0x1

    .line 132
    :cond_0
    :goto_0
    invoke-virtual {p1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v0

    .local v0, "line":Ljava/lang/String;
    if-eqz v0, :cond_4

    .line 133
    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    .line 134
    .local v1, "lower":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    const-string/jumbo v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 137
    const-string/jumbo v2, "error"

    invoke-virtual {v1, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    if-eq v2, v4, :cond_2

    .line 138
    invoke-direct {p0, v5}, Lorg/apache/tools/ant/taskdefs/JikesOutputParser;->setError(Z)V

    .line 152
    :cond_1
    :goto_1
    invoke-direct {p0, v0}, Lorg/apache/tools/ant/taskdefs/JikesOutputParser;->log(Ljava/lang/String;)V

    goto :goto_0

    .line 139
    :cond_2
    const-string/jumbo v2, "warning"

    invoke-virtual {v1, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    if-eq v2, v4, :cond_3

    .line 140
    const/4 v2, 0x0

    invoke-direct {p0, v2}, Lorg/apache/tools/ant/taskdefs/JikesOutputParser;->setError(Z)V

    goto :goto_1

    .line 148
    :cond_3
    iget-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/JikesOutputParser;->emacsMode:Z

    if-eqz v2, :cond_1

    .line 149
    invoke-direct {p0, v5}, Lorg/apache/tools/ant/taskdefs/JikesOutputParser;->setError(Z)V

    goto :goto_1

    .line 154
    .end local v1    # "lower":Ljava/lang/String;
    :cond_4
    return-void
.end method

.method private setError(Z)V
    .locals 1
    .param p1, "err"    # Z

    .prologue
    .line 162
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/JikesOutputParser;->error:Z

    .line 163
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/JikesOutputParser;->error:Z

    if-eqz v0, :cond_0

    .line 164
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/JikesOutputParser;->errorFlag:Z

    .line 166
    :cond_0
    return-void
.end method


# virtual methods
.method protected getErrorFlag()Z
    .locals 1

    .prologue
    .line 180
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/JikesOutputParser;->errorFlag:Z

    return v0
.end method

.method protected parseOutput(Ljava/io/BufferedReader;)V
    .locals 1
    .param p1, "reader"    # Ljava/io/BufferedReader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 113
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/JikesOutputParser;->emacsMode:Z

    if-eqz v0, :cond_0

    .line 114
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/taskdefs/JikesOutputParser;->parseEmacsOutput(Ljava/io/BufferedReader;)V

    .line 118
    :goto_0
    return-void

    .line 116
    :cond_0
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/taskdefs/JikesOutputParser;->parseStandardOutput(Ljava/io/BufferedReader;)V

    goto :goto_0
.end method

.method public setProcessErrorStream(Ljava/io/InputStream;)V
    .locals 0
    .param p1, "is"    # Ljava/io/InputStream;

    .prologue
    .line 64
    return-void
.end method

.method public setProcessInputStream(Ljava/io/OutputStream;)V
    .locals 0
    .param p1, "os"    # Ljava/io/OutputStream;

    .prologue
    .line 57
    return-void
.end method

.method public setProcessOutputStream(Ljava/io/InputStream;)V
    .locals 2
    .param p1, "is"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 72
    new-instance v0, Ljava/io/BufferedReader;

    new-instance v1, Ljava/io/InputStreamReader;

    invoke-direct {v1, p1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v0, v1}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/JikesOutputParser;->br:Ljava/io/BufferedReader;

    .line 73
    return-void
.end method

.method public start()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 80
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/JikesOutputParser;->br:Ljava/io/BufferedReader;

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/JikesOutputParser;->parseOutput(Ljava/io/BufferedReader;)V

    .line 81
    return-void
.end method

.method public stop()V
    .locals 0

    .prologue
    .line 87
    return-void
.end method
