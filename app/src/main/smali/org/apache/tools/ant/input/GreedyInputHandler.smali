.class public Lorg/apache/tools/ant/input/GreedyInputHandler;
.super Lorg/apache/tools/ant/input/DefaultInputHandler;
.source "GreedyInputHandler.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 37
    invoke-direct {p0}, Lorg/apache/tools/ant/input/DefaultInputHandler;-><init>()V

    .line 38
    return-void
.end method


# virtual methods
.method public handleInput(Lorg/apache/tools/ant/input/InputRequest;)V
    .locals 9
    .param p1, "request"    # Lorg/apache/tools/ant/input/InputRequest;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 47
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/input/GreedyInputHandler;->getPrompt(Lorg/apache/tools/ant/input/InputRequest;)Ljava/lang/String;

    move-result-object v4

    .line 48
    .local v4, "prompt":Ljava/lang/String;
    const/4 v2, 0x0

    .line 50
    .local v2, "in":Ljava/io/InputStream;
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/input/GreedyInputHandler;->getInputStream()Ljava/io/InputStream;

    move-result-object v2

    .line 51
    sget-object v6, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {v6, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 52
    sget-object v6, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {v6}, Ljava/io/PrintStream;->flush()V

    .line 53
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 54
    .local v0, "baos":Ljava/io/ByteArrayOutputStream;
    new-instance v3, Lorg/apache/tools/ant/taskdefs/StreamPumper;

    invoke-direct {v3, v2, v0}, Lorg/apache/tools/ant/taskdefs/StreamPumper;-><init>(Ljava/io/InputStream;Ljava/io/OutputStream;)V

    .line 55
    .local v3, "p":Lorg/apache/tools/ant/taskdefs/StreamPumper;
    new-instance v5, Ljava/lang/Thread;

    invoke-direct {v5, v3}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 56
    .local v5, "t":Ljava/lang/Thread;
    invoke-virtual {v5}, Ljava/lang/Thread;->start()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 58
    :try_start_1
    invoke-virtual {v5}, Ljava/lang/Thread;->join()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 66
    :goto_0
    :try_start_2
    new-instance v6, Ljava/lang/String;

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/String;-><init>([B)V

    invoke-virtual {p1, v6}, Lorg/apache/tools/ant/input/InputRequest;->setInput(Ljava/lang/String;)V

    .line 67
    invoke-virtual {p1}, Lorg/apache/tools/ant/input/InputRequest;->isInputValid()Z

    move-result v6

    if-nez v6, :cond_0

    .line 68
    new-instance v6, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v7, "Received invalid console input"

    invoke-direct {v6, v7}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v6
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 76
    .end local v0    # "baos":Ljava/io/ByteArrayOutputStream;
    .end local v3    # "p":Lorg/apache/tools/ant/taskdefs/StreamPumper;
    .end local v5    # "t":Ljava/lang/Thread;
    :catchall_0
    move-exception v6

    invoke-static {v2}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    throw v6

    .line 59
    .restart local v0    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v3    # "p":Lorg/apache/tools/ant/taskdefs/StreamPumper;
    .restart local v5    # "t":Ljava/lang/Thread;
    :catch_0
    move-exception v1

    .line 61
    .local v1, "e":Ljava/lang/InterruptedException;
    :try_start_3
    invoke-virtual {v5}, Ljava/lang/Thread;->join()V
    :try_end_3
    .catch Ljava/lang/InterruptedException; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    .line 62
    :catch_1
    move-exception v6

    goto :goto_0

    .line 71
    .end local v1    # "e":Ljava/lang/InterruptedException;
    :cond_0
    :try_start_4
    invoke-virtual {v3}, Lorg/apache/tools/ant/taskdefs/StreamPumper;->getException()Ljava/lang/Exception;

    move-result-object v6

    if-eqz v6, :cond_1

    .line 72
    new-instance v6, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v7, "Failed to read input from console"

    invoke-virtual {v3}, Lorg/apache/tools/ant/taskdefs/StreamPumper;->getException()Ljava/lang/Exception;

    move-result-object v8

    invoke-direct {v6, v7, v8}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v6
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 76
    :cond_1
    invoke-static {v2}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    .line 78
    return-void
.end method
