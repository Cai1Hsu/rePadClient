.class Lorg/apache/tools/ant/taskdefs/cvslib/RedirectingStreamHandler;
.super Lorg/apache/tools/ant/taskdefs/PumpStreamHandler;
.source "RedirectingStreamHandler.java"


# direct methods
.method constructor <init>(Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogParser;)V
    .locals 2
    .param p1, "parser"    # Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogParser;

    .prologue
    .line 32
    new-instance v0, Lorg/apache/tools/ant/taskdefs/cvslib/RedirectingOutputStream;

    invoke-direct {v0, p1}, Lorg/apache/tools/ant/taskdefs/cvslib/RedirectingOutputStream;-><init>(Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogParser;)V

    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    invoke-direct {p0, v0, v1}, Lorg/apache/tools/ant/taskdefs/PumpStreamHandler;-><init>(Ljava/io/OutputStream;Ljava/io/OutputStream;)V

    .line 34
    return-void
.end method


# virtual methods
.method getErrors()Ljava/lang/String;
    .locals 3

    .prologue
    .line 39
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/cvslib/RedirectingStreamHandler;->getErr()Ljava/io/OutputStream;

    move-result-object v1

    check-cast v1, Ljava/io/ByteArrayOutputStream;

    .line 42
    .local v1, "error":Ljava/io/ByteArrayOutputStream;
    const-string/jumbo v2, "ASCII"

    invoke-virtual {v1, v2}, Ljava/io/ByteArrayOutputStream;->toString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 44
    .end local v1    # "error":Ljava/io/ByteArrayOutputStream;
    :goto_0
    return-object v2

    .line 43
    :catch_0
    move-exception v0

    .line 44
    .local v0, "e":Ljava/lang/Exception;
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public stop()V
    .locals 2

    .prologue
    .line 50
    invoke-super {p0}, Lorg/apache/tools/ant/taskdefs/PumpStreamHandler;->stop()V

    .line 52
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/cvslib/RedirectingStreamHandler;->getErr()Ljava/io/OutputStream;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V

    .line 53
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/cvslib/RedirectingStreamHandler;->getOut()Ljava/io/OutputStream;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 58
    return-void

    .line 54
    :catch_0
    move-exception v0

    .line 56
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v1, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method
