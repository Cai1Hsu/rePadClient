.class public Lorg/apache/tools/ant/taskdefs/LogStreamHandler;
.super Lorg/apache/tools/ant/taskdefs/PumpStreamHandler;
.source "LogStreamHandler.java"


# direct methods
.method public constructor <init>(Lorg/apache/tools/ant/ProjectComponent;II)V
    .locals 2
    .param p1, "pc"    # Lorg/apache/tools/ant/ProjectComponent;
    .param p2, "outlevel"    # I
    .param p3, "errlevel"    # I

    .prologue
    .line 52
    new-instance v0, Lorg/apache/tools/ant/taskdefs/LogOutputStream;

    invoke-direct {v0, p1, p2}, Lorg/apache/tools/ant/taskdefs/LogOutputStream;-><init>(Lorg/apache/tools/ant/ProjectComponent;I)V

    new-instance v1, Lorg/apache/tools/ant/taskdefs/LogOutputStream;

    invoke-direct {v1, p1, p3}, Lorg/apache/tools/ant/taskdefs/LogOutputStream;-><init>(Lorg/apache/tools/ant/ProjectComponent;I)V

    invoke-direct {p0, v0, v1}, Lorg/apache/tools/ant/taskdefs/PumpStreamHandler;-><init>(Ljava/io/OutputStream;Ljava/io/OutputStream;)V

    .line 54
    return-void
.end method

.method public constructor <init>(Lorg/apache/tools/ant/Task;II)V
    .locals 0
    .param p1, "task"    # Lorg/apache/tools/ant/Task;
    .param p2, "outlevel"    # I
    .param p3, "errlevel"    # I

    .prologue
    .line 41
    invoke-direct {p0, p1, p2, p3}, Lorg/apache/tools/ant/taskdefs/LogStreamHandler;-><init>(Lorg/apache/tools/ant/ProjectComponent;II)V

    .line 42
    return-void
.end method


# virtual methods
.method public stop()V
    .locals 2

    .prologue
    .line 60
    invoke-super {p0}, Lorg/apache/tools/ant/taskdefs/PumpStreamHandler;->stop()V

    .line 62
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/LogStreamHandler;->getErr()Ljava/io/OutputStream;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V

    .line 63
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/LogStreamHandler;->getOut()Ljava/io/OutputStream;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 68
    return-void

    .line 64
    :catch_0
    move-exception v0

    .line 66
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v1, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method
