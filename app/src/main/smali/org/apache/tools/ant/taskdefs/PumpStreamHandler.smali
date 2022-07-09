.class public Lorg/apache/tools/ant/taskdefs/PumpStreamHandler;
.super Ljava/lang/Object;
.source "PumpStreamHandler.java"

# interfaces
.implements Lorg/apache/tools/ant/taskdefs/ExecuteStreamHandler;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/taskdefs/PumpStreamHandler$ThreadWithPumper;
    }
.end annotation


# static fields
.field private static final JOIN_TIMEOUT:J = 0xc8L


# instance fields
.field private err:Ljava/io/OutputStream;

.field private errorThread:Ljava/lang/Thread;

.field private input:Ljava/io/InputStream;

.field private inputThread:Ljava/lang/Thread;

.field private final nonBlockingRead:Z

.field private out:Ljava/io/OutputStream;

.field private outputThread:Ljava/lang/Thread;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 90
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    sget-object v1, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-direct {p0, v0, v1}, Lorg/apache/tools/ant/taskdefs/PumpStreamHandler;-><init>(Ljava/io/OutputStream;Ljava/io/OutputStream;)V

    .line 91
    return-void
.end method

.method public constructor <init>(Ljava/io/OutputStream;)V
    .locals 0
    .param p1, "outAndErr"    # Ljava/io/OutputStream;

    .prologue
    .line 83
    invoke-direct {p0, p1, p1}, Lorg/apache/tools/ant/taskdefs/PumpStreamHandler;-><init>(Ljava/io/OutputStream;Ljava/io/OutputStream;)V

    .line 84
    return-void
.end method

.method public constructor <init>(Ljava/io/OutputStream;Ljava/io/OutputStream;)V
    .locals 1
    .param p1, "out"    # Ljava/io/OutputStream;
    .param p2, "err"    # Ljava/io/OutputStream;

    .prologue
    .line 75
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lorg/apache/tools/ant/taskdefs/PumpStreamHandler;-><init>(Ljava/io/OutputStream;Ljava/io/OutputStream;Ljava/io/InputStream;)V

    .line 76
    return-void
.end method

.method public constructor <init>(Ljava/io/OutputStream;Ljava/io/OutputStream;Ljava/io/InputStream;)V
    .locals 1
    .param p1, "out"    # Ljava/io/OutputStream;
    .param p2, "err"    # Ljava/io/OutputStream;
    .param p3, "input"    # Ljava/io/InputStream;

    .prologue
    .line 66
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lorg/apache/tools/ant/taskdefs/PumpStreamHandler;-><init>(Ljava/io/OutputStream;Ljava/io/OutputStream;Ljava/io/InputStream;Z)V

    .line 67
    return-void
.end method

.method public constructor <init>(Ljava/io/OutputStream;Ljava/io/OutputStream;Ljava/io/InputStream;Z)V
    .locals 0
    .param p1, "out"    # Ljava/io/OutputStream;
    .param p2, "err"    # Ljava/io/OutputStream;
    .param p3, "input"    # Ljava/io/InputStream;
    .param p4, "nonBlockingRead"    # Z

    .prologue
    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/PumpStreamHandler;->out:Ljava/io/OutputStream;

    .line 53
    iput-object p2, p0, Lorg/apache/tools/ant/taskdefs/PumpStreamHandler;->err:Ljava/io/OutputStream;

    .line 54
    iput-object p3, p0, Lorg/apache/tools/ant/taskdefs/PumpStreamHandler;->input:Ljava/io/InputStream;

    .line 55
    iput-boolean p4, p0, Lorg/apache/tools/ant/taskdefs/PumpStreamHandler;->nonBlockingRead:Z

    .line 56
    return-void
.end method


# virtual methods
.method protected createProcessErrorPump(Ljava/io/InputStream;Ljava/io/OutputStream;)V
    .locals 1
    .param p1, "is"    # Ljava/io/InputStream;
    .param p2, "os"    # Ljava/io/OutputStream;

    .prologue
    .line 232
    invoke-virtual {p0, p1, p2}, Lorg/apache/tools/ant/taskdefs/PumpStreamHandler;->createPump(Ljava/io/InputStream;Ljava/io/OutputStream;)Ljava/lang/Thread;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/PumpStreamHandler;->errorThread:Ljava/lang/Thread;

    .line 233
    return-void
.end method

.method protected createProcessOutputPump(Ljava/io/InputStream;Ljava/io/OutputStream;)V
    .locals 1
    .param p1, "is"    # Ljava/io/InputStream;
    .param p2, "os"    # Ljava/io/OutputStream;

    .prologue
    .line 223
    invoke-virtual {p0, p1, p2}, Lorg/apache/tools/ant/taskdefs/PumpStreamHandler;->createPump(Ljava/io/InputStream;Ljava/io/OutputStream;)Ljava/lang/Thread;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/PumpStreamHandler;->outputThread:Ljava/lang/Thread;

    .line 224
    return-void
.end method

.method protected createPump(Ljava/io/InputStream;Ljava/io/OutputStream;)Ljava/lang/Thread;
    .locals 1
    .param p1, "is"    # Ljava/io/InputStream;
    .param p2, "os"    # Ljava/io/OutputStream;

    .prologue
    .line 243
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lorg/apache/tools/ant/taskdefs/PumpStreamHandler;->createPump(Ljava/io/InputStream;Ljava/io/OutputStream;Z)Ljava/lang/Thread;

    move-result-object v0

    return-object v0
.end method

.method protected createPump(Ljava/io/InputStream;Ljava/io/OutputStream;Z)Ljava/lang/Thread;
    .locals 1
    .param p1, "is"    # Ljava/io/InputStream;
    .param p2, "os"    # Ljava/io/OutputStream;
    .param p3, "closeWhenExhausted"    # Z

    .prologue
    .line 258
    const/4 v0, 0x1

    invoke-virtual {p0, p1, p2, p3, v0}, Lorg/apache/tools/ant/taskdefs/PumpStreamHandler;->createPump(Ljava/io/InputStream;Ljava/io/OutputStream;ZZ)Ljava/lang/Thread;

    move-result-object v0

    return-object v0
.end method

.method protected createPump(Ljava/io/InputStream;Ljava/io/OutputStream;ZZ)Ljava/lang/Thread;
    .locals 3
    .param p1, "is"    # Ljava/io/InputStream;
    .param p2, "os"    # Ljava/io/OutputStream;
    .param p3, "closeWhenExhausted"    # Z
    .param p4, "nonBlockingIO"    # Z

    .prologue
    const/4 v2, 0x1

    .line 276
    new-instance v0, Lorg/apache/tools/ant/taskdefs/StreamPumper;

    invoke-direct {v0, p1, p2, p3, p4}, Lorg/apache/tools/ant/taskdefs/StreamPumper;-><init>(Ljava/io/InputStream;Ljava/io/OutputStream;ZZ)V

    .line 277
    .local v0, "pumper":Lorg/apache/tools/ant/taskdefs/StreamPumper;
    invoke-virtual {v0, v2}, Lorg/apache/tools/ant/taskdefs/StreamPumper;->setAutoflush(Z)V

    .line 278
    new-instance v1, Lorg/apache/tools/ant/taskdefs/PumpStreamHandler$ThreadWithPumper;

    invoke-direct {v1, v0}, Lorg/apache/tools/ant/taskdefs/PumpStreamHandler$ThreadWithPumper;-><init>(Lorg/apache/tools/ant/taskdefs/StreamPumper;)V

    .line 279
    .local v1, "result":Ljava/lang/Thread;
    invoke-virtual {v1, v2}, Ljava/lang/Thread;->setDaemon(Z)V

    .line 280
    return-object v1
.end method

.method protected final finish(Ljava/lang/Thread;)V
    .locals 6
    .param p1, "t"    # Ljava/lang/Thread;

    .prologue
    .line 172
    if-nez p1, :cond_1

    .line 199
    :cond_0
    :goto_0
    return-void

    .line 177
    :cond_1
    const/4 v2, 0x0

    .line 178
    .local v2, "s":Lorg/apache/tools/ant/taskdefs/StreamPumper;
    :try_start_0
    instance-of v3, p1, Lorg/apache/tools/ant/taskdefs/PumpStreamHandler$ThreadWithPumper;

    if-eqz v3, :cond_2

    .line 179
    move-object v0, p1

    check-cast v0, Lorg/apache/tools/ant/taskdefs/PumpStreamHandler$ThreadWithPumper;

    move-object v3, v0

    invoke-virtual {v3}, Lorg/apache/tools/ant/taskdefs/PumpStreamHandler$ThreadWithPumper;->getPumper()Lorg/apache/tools/ant/taskdefs/StreamPumper;

    move-result-object v2

    .line 181
    :cond_2
    if-eqz v2, :cond_3

    invoke-virtual {v2}, Lorg/apache/tools/ant/taskdefs/StreamPumper;->isFinished()Z

    move-result v3

    if-nez v3, :cond_0

    .line 184
    :cond_3
    invoke-virtual {p1}, Ljava/lang/Thread;->isAlive()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 188
    const-wide/16 v4, 0xc8

    invoke-virtual {p1, v4, v5}, Ljava/lang/Thread;->join(J)V

    .line 189
    if-eqz v2, :cond_4

    invoke-virtual {v2}, Lorg/apache/tools/ant/taskdefs/StreamPumper;->isFinished()Z

    move-result v3

    if-nez v3, :cond_4

    .line 190
    invoke-virtual {v2}, Lorg/apache/tools/ant/taskdefs/StreamPumper;->stop()V

    .line 192
    :cond_4
    :goto_1
    if-eqz v2, :cond_5

    invoke-virtual {v2}, Lorg/apache/tools/ant/taskdefs/StreamPumper;->isFinished()Z

    move-result v3

    if-nez v3, :cond_0

    :cond_5
    invoke-virtual {p1}, Ljava/lang/Thread;->isAlive()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 193
    invoke-virtual {p1}, Ljava/lang/Thread;->interrupt()V

    .line 194
    const-wide/16 v4, 0xc8

    invoke-virtual {p1, v4, v5}, Ljava/lang/Thread;->join(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 196
    :catch_0
    move-exception v3

    goto :goto_0
.end method

.method protected getErr()Ljava/io/OutputStream;
    .locals 1

    .prologue
    .line 206
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/PumpStreamHandler;->err:Ljava/io/OutputStream;

    return-object v0
.end method

.method protected getOut()Ljava/io/OutputStream;
    .locals 1

    .prologue
    .line 214
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/PumpStreamHandler;->out:Ljava/io/OutputStream;

    return-object v0
.end method

.method public setProcessErrorStream(Ljava/io/InputStream;)V
    .locals 1
    .param p1, "is"    # Ljava/io/InputStream;

    .prologue
    .line 108
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/PumpStreamHandler;->err:Ljava/io/OutputStream;

    if-eqz v0, :cond_0

    .line 109
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/PumpStreamHandler;->err:Ljava/io/OutputStream;

    invoke-virtual {p0, p1, v0}, Lorg/apache/tools/ant/taskdefs/PumpStreamHandler;->createProcessErrorPump(Ljava/io/InputStream;Ljava/io/OutputStream;)V

    .line 111
    :cond_0
    return-void
.end method

.method public setProcessInputStream(Ljava/io/OutputStream;)V
    .locals 3
    .param p1, "os"    # Ljava/io/OutputStream;

    .prologue
    .line 119
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/PumpStreamHandler;->input:Ljava/io/InputStream;

    if-eqz v0, :cond_0

    .line 120
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/PumpStreamHandler;->input:Ljava/io/InputStream;

    const/4 v1, 0x1

    iget-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/PumpStreamHandler;->nonBlockingRead:Z

    invoke-virtual {p0, v0, p1, v1, v2}, Lorg/apache/tools/ant/taskdefs/PumpStreamHandler;->createPump(Ljava/io/InputStream;Ljava/io/OutputStream;ZZ)Ljava/lang/Thread;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/PumpStreamHandler;->inputThread:Ljava/lang/Thread;

    .line 128
    :goto_0
    return-void

    .line 123
    :cond_0
    :try_start_0
    invoke-virtual {p1}, Ljava/io/OutputStream;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 124
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public setProcessOutputStream(Ljava/io/InputStream;)V
    .locals 1
    .param p1, "is"    # Ljava/io/InputStream;

    .prologue
    .line 99
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/PumpStreamHandler;->out:Ljava/io/OutputStream;

    invoke-virtual {p0, p1, v0}, Lorg/apache/tools/ant/taskdefs/PumpStreamHandler;->createProcessOutputPump(Ljava/io/InputStream;Ljava/io/OutputStream;)V

    .line 100
    return-void
.end method

.method public start()V
    .locals 1

    .prologue
    .line 134
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/PumpStreamHandler;->outputThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 135
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/PumpStreamHandler;->errorThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 136
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/PumpStreamHandler;->inputThread:Ljava/lang/Thread;

    if-eqz v0, :cond_0

    .line 137
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/PumpStreamHandler;->inputThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 139
    :cond_0
    return-void
.end method

.method public stop()V
    .locals 1

    .prologue
    .line 145
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/PumpStreamHandler;->inputThread:Ljava/lang/Thread;

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/PumpStreamHandler;->finish(Ljava/lang/Thread;)V

    .line 148
    :try_start_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/PumpStreamHandler;->err:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 153
    :goto_0
    :try_start_1
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/PumpStreamHandler;->out:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 157
    :goto_1
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/PumpStreamHandler;->outputThread:Ljava/lang/Thread;

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/PumpStreamHandler;->finish(Ljava/lang/Thread;)V

    .line 158
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/PumpStreamHandler;->errorThread:Ljava/lang/Thread;

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/PumpStreamHandler;->finish(Ljava/lang/Thread;)V

    .line 159
    return-void

    .line 154
    :catch_0
    move-exception v0

    goto :goto_1

    .line 149
    :catch_1
    move-exception v0

    goto :goto_0
.end method
