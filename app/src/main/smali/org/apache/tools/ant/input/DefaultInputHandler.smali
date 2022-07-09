.class public Lorg/apache/tools/ant/input/DefaultInputHandler;
.super Ljava/lang/Object;
.source "DefaultInputHandler.java"

# interfaces
.implements Lorg/apache/tools/ant/input/InputHandler;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    return-void
.end method


# virtual methods
.method protected getInputStream()Ljava/io/InputStream;
    .locals 1

    .prologue
    .line 122
    invoke-static {}, Lorg/apache/tools/ant/util/KeepAliveInputStream;->wrapSystemIn()Ljava/io/InputStream;

    move-result-object v0

    return-object v0
.end method

.method protected getPrompt(Lorg/apache/tools/ant/input/InputRequest;)Ljava/lang/String;
    .locals 8
    .param p1, "request"    # Lorg/apache/tools/ant/input/InputRequest;

    .prologue
    .line 86
    invoke-virtual {p1}, Lorg/apache/tools/ant/input/InputRequest;->getPrompt()Ljava/lang/String;

    move-result-object v4

    .line 87
    .local v4, "prompt":Ljava/lang/String;
    invoke-virtual {p1}, Lorg/apache/tools/ant/input/InputRequest;->getDefaultValue()Ljava/lang/String;

    move-result-object v0

    .line 88
    .local v0, "def":Ljava/lang/String;
    instance-of v6, p1, Lorg/apache/tools/ant/input/MultipleChoiceInputRequest;

    if-eqz v6, :cond_5

    .line 89
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5, v4}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 90
    .local v5, "sb":Ljava/lang/StringBuffer;
    const-string/jumbo v6, " ("

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 91
    check-cast p1, Lorg/apache/tools/ant/input/MultipleChoiceInputRequest;

    .end local p1    # "request":Lorg/apache/tools/ant/input/InputRequest;
    invoke-virtual {p1}, Lorg/apache/tools/ant/input/MultipleChoiceInputRequest;->getChoices()Ljava/util/Vector;

    move-result-object v6

    invoke-virtual {v6}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v1

    .line 93
    .local v1, "e":Ljava/util/Enumeration;
    const/4 v2, 0x1

    .line 94
    .local v2, "first":Z
    :goto_0
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v6

    if-eqz v6, :cond_3

    .line 95
    if-nez v2, :cond_0

    .line 96
    const-string/jumbo v6, ", "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 98
    :cond_0
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 99
    .local v3, "next":Ljava/lang/String;
    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 100
    const/16 v6, 0x5b

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 102
    :cond_1
    invoke-virtual {v5, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 103
    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 104
    const/16 v6, 0x5d

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 106
    :cond_2
    const/4 v2, 0x0

    goto :goto_0

    .line 108
    .end local v3    # "next":Ljava/lang/String;
    :cond_3
    const-string/jumbo v6, ")"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 109
    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    .line 113
    .end local v1    # "e":Ljava/util/Enumeration;
    .end local v2    # "first":Z
    .end local v4    # "prompt":Ljava/lang/String;
    .end local v5    # "sb":Ljava/lang/StringBuffer;
    :cond_4
    :goto_1
    return-object v4

    .line 110
    .restart local v4    # "prompt":Ljava/lang/String;
    .restart local p1    # "request":Lorg/apache/tools/ant/input/InputRequest;
    :cond_5
    if-eqz v0, :cond_4

    .line 111
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v6, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string/jumbo v7, " ["

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string/jumbo v7, "]"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_1
.end method

.method public handleInput(Lorg/apache/tools/ant/input/InputRequest;)V
    .locals 7
    .param p1, "request"    # Lorg/apache/tools/ant/input/InputRequest;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 49
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/input/DefaultInputHandler;->getPrompt(Lorg/apache/tools/ant/input/InputRequest;)Ljava/lang/String;

    move-result-object v2

    .line 50
    .local v2, "prompt":Ljava/lang/String;
    const/4 v3, 0x0

    .line 52
    .local v3, "r":Ljava/io/BufferedReader;
    :try_start_0
    new-instance v4, Ljava/io/BufferedReader;

    new-instance v5, Ljava/io/InputStreamReader;

    invoke-virtual {p0}, Lorg/apache/tools/ant/input/DefaultInputHandler;->getInputStream()Ljava/io/InputStream;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v4, v5}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 54
    .end local v3    # "r":Ljava/io/BufferedReader;
    .local v4, "r":Ljava/io/BufferedReader;
    :cond_0
    :try_start_1
    sget-object v5, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {v5, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 55
    sget-object v5, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {v5}, Ljava/io/PrintStream;->flush()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 57
    :try_start_2
    invoke-virtual {v4}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v1

    .line 58
    .local v1, "input":Ljava/lang/String;
    invoke-virtual {p1, v1}, Lorg/apache/tools/ant/input/InputRequest;->setInput(Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 63
    :try_start_3
    invoke-virtual {p1}, Lorg/apache/tools/ant/input/InputRequest;->isInputValid()Z
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    move-result v5

    if-eqz v5, :cond_0

    .line 65
    if-eqz v4, :cond_1

    .line 67
    :try_start_4
    invoke-virtual {v4}, Ljava/io/BufferedReader;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2

    .line 73
    :cond_1
    return-void

    .line 59
    .end local v1    # "input":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 60
    .local v0, "e":Ljava/io/IOException;
    :try_start_5
    new-instance v5, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v6, "Failed to read input from Console."

    invoke-direct {v5, v6, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v5
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 65
    .end local v0    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v5

    move-object v3, v4

    .end local v4    # "r":Ljava/io/BufferedReader;
    .restart local v3    # "r":Ljava/io/BufferedReader;
    :goto_0
    if-eqz v3, :cond_2

    .line 67
    :try_start_6
    invoke-virtual {v3}, Ljava/io/BufferedReader;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_1

    .line 65
    :cond_2
    throw v5

    .line 68
    :catch_1
    move-exception v0

    .line 69
    .restart local v0    # "e":Ljava/io/IOException;
    new-instance v5, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v6, "Failed to close input."

    invoke-direct {v5, v6, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v5

    .line 68
    .end local v0    # "e":Ljava/io/IOException;
    .end local v3    # "r":Ljava/io/BufferedReader;
    .restart local v1    # "input":Ljava/lang/String;
    .restart local v4    # "r":Ljava/io/BufferedReader;
    :catch_2
    move-exception v0

    .line 69
    .restart local v0    # "e":Ljava/io/IOException;
    new-instance v5, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v6, "Failed to close input."

    invoke-direct {v5, v6, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v5

    .line 65
    .end local v0    # "e":Ljava/io/IOException;
    .end local v1    # "input":Ljava/lang/String;
    .end local v4    # "r":Ljava/io/BufferedReader;
    .restart local v3    # "r":Ljava/io/BufferedReader;
    :catchall_1
    move-exception v5

    goto :goto_0
.end method
