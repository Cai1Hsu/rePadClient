.class public Lorg/apache/tools/ant/taskdefs/StreamPumper;
.super Ljava/lang/Object;
.source "StreamPumper.java"

# interfaces
.implements Ljava/lang/Runnable;


# static fields
.field private static final POLL_INTERVAL:J = 0x64L

.field private static final SMALL_BUFFER_SIZE:I = 0x80


# instance fields
.field private autoflush:Z

.field private bufferSize:I

.field private final closeWhenExhausted:Z

.field private exception:Ljava/lang/Exception;

.field private volatile finish:Z

.field private volatile finished:Z

.field private final is:Ljava/io/InputStream;

.field private final os:Ljava/io/OutputStream;

.field private started:Z

.field private final useAvailable:Z


# direct methods
.method public constructor <init>(Ljava/io/InputStream;Ljava/io/OutputStream;)V
    .locals 1
    .param p1, "is"    # Ljava/io/InputStream;
    .param p2, "os"    # Ljava/io/OutputStream;

    .prologue
    .line 97
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lorg/apache/tools/ant/taskdefs/StreamPumper;-><init>(Ljava/io/InputStream;Ljava/io/OutputStream;Z)V

    .line 98
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;Ljava/io/OutputStream;Z)V
    .locals 1
    .param p1, "is"    # Ljava/io/InputStream;
    .param p2, "os"    # Ljava/io/OutputStream;
    .param p3, "closeWhenExhausted"    # Z

    .prologue
    .line 54
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lorg/apache/tools/ant/taskdefs/StreamPumper;-><init>(Ljava/io/InputStream;Ljava/io/OutputStream;ZZ)V

    .line 55
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;Ljava/io/OutputStream;ZZ)V
    .locals 2
    .param p1, "is"    # Ljava/io/InputStream;
    .param p2, "os"    # Ljava/io/OutputStream;
    .param p3, "closeWhenExhausted"    # Z
    .param p4, "useAvailable"    # Z

    .prologue
    const/4 v1, 0x0

    .line 83
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/StreamPumper;->autoflush:Z

    .line 40
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/StreamPumper;->exception:Ljava/lang/Exception;

    .line 41
    const/16 v0, 0x80

    iput v0, p0, Lorg/apache/tools/ant/taskdefs/StreamPumper;->bufferSize:I

    .line 42
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/StreamPumper;->started:Z

    .line 84
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/StreamPumper;->is:Ljava/io/InputStream;

    .line 85
    iput-object p2, p0, Lorg/apache/tools/ant/taskdefs/StreamPumper;->os:Ljava/io/OutputStream;

    .line 86
    iput-boolean p3, p0, Lorg/apache/tools/ant/taskdefs/StreamPumper;->closeWhenExhausted:Z

    .line 87
    iput-boolean p4, p0, Lorg/apache/tools/ant/taskdefs/StreamPumper;->useAvailable:Z

    .line 88
    return-void
.end method

.method private waitForInput(Ljava/io/InputStream;)V
    .locals 2
    .param p1, "is"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 222
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/StreamPumper;->useAvailable:Z

    if-eqz v0, :cond_1

    .line 223
    :goto_0
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/StreamPumper;->finish:Z

    if-nez v0, :cond_1

    invoke-virtual {p1}, Ljava/io/InputStream;->available()I

    move-result v0

    if-nez v0, :cond_1

    .line 224
    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 225
    new-instance v0, Ljava/lang/InterruptedException;

    invoke-direct {v0}, Ljava/lang/InterruptedException;-><init>()V

    throw v0

    .line 228
    :cond_0
    monitor-enter p0

    .line 229
    const-wide/16 v0, 0x64

    :try_start_0
    invoke-virtual {p0, v0, v1}, Ljava/lang/Object;->wait(J)V

    .line 230
    monitor-exit p0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    .line 233
    :cond_1
    return-void
.end method


# virtual methods
.method public declared-synchronized getBufferSize()I
    .locals 1

    .prologue
    .line 195
    monitor-enter p0

    :try_start_0
    iget v0, p0, Lorg/apache/tools/ant/taskdefs/StreamPumper;->bufferSize:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getException()Ljava/lang/Exception;
    .locals 1

    .prologue
    .line 203
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/StreamPumper;->exception:Ljava/lang/Exception;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public isFinished()Z
    .locals 1

    .prologue
    .line 164
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/StreamPumper;->finished:Z

    return v0
.end method

.method public run()V
    .locals 6

    .prologue
    const/4 v4, 0x0

    const/4 v5, 0x1

    .line 115
    monitor-enter p0

    .line 116
    const/4 v3, 0x1

    :try_start_0
    iput-boolean v3, p0, Lorg/apache/tools/ant/taskdefs/StreamPumper;->started:Z

    .line 117
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 118
    iput-boolean v4, p0, Lorg/apache/tools/ant/taskdefs/StreamPumper;->finished:Z

    .line 119
    iput-boolean v4, p0, Lorg/apache/tools/ant/taskdefs/StreamPumper;->finish:Z

    .line 121
    iget v3, p0, Lorg/apache/tools/ant/taskdefs/StreamPumper;->bufferSize:I

    new-array v0, v3, [B

    .line 126
    .local v0, "buf":[B
    :cond_0
    :goto_0
    :try_start_1
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/StreamPumper;->is:Ljava/io/InputStream;

    invoke-direct {p0, v3}, Lorg/apache/tools/ant/taskdefs/StreamPumper;->waitForInput(Ljava/io/InputStream;)V

    .line 128
    iget-boolean v3, p0, Lorg/apache/tools/ant/taskdefs/StreamPumper;->finish:Z

    if-nez v3, :cond_1

    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 141
    :cond_1
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/StreamPumper;->os:Ljava/io/OutputStream;

    invoke-virtual {v3}, Ljava/io/OutputStream;->flush()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_4

    .line 149
    iget-boolean v3, p0, Lorg/apache/tools/ant/taskdefs/StreamPumper;->closeWhenExhausted:Z

    if-eqz v3, :cond_2

    .line 150
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/StreamPumper;->os:Ljava/io/OutputStream;

    invoke-static {v3}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/OutputStream;)V

    .line 152
    :cond_2
    iput-boolean v5, p0, Lorg/apache/tools/ant/taskdefs/StreamPumper;->finished:Z

    .line 153
    monitor-enter p0

    .line 154
    :try_start_2
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 155
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_6

    .line 157
    :goto_1
    return-void

    .line 117
    .end local v0    # "buf":[B
    :catchall_0
    move-exception v3

    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v3

    .line 132
    .restart local v0    # "buf":[B
    :cond_3
    :try_start_4
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/StreamPumper;->is:Ljava/io/InputStream;

    invoke-virtual {v3, v0}, Ljava/io/InputStream;->read([B)I

    move-result v2

    .line 133
    .local v2, "length":I
    if-lez v2, :cond_1

    iget-boolean v3, p0, Lorg/apache/tools/ant/taskdefs/StreamPumper;->finish:Z

    if-nez v3, :cond_1

    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    move-result v3

    if-nez v3, :cond_1

    .line 136
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/StreamPumper;->os:Ljava/io/OutputStream;

    const/4 v4, 0x0

    invoke-virtual {v3, v0, v4, v2}, Ljava/io/OutputStream;->write([BII)V

    .line 137
    iget-boolean v3, p0, Lorg/apache/tools/ant/taskdefs/StreamPumper;->autoflush:Z

    if-eqz v3, :cond_0

    .line 138
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/StreamPumper;->os:Ljava/io/OutputStream;

    invoke-virtual {v3}, Ljava/io/OutputStream;->flush()V
    :try_end_4
    .catch Ljava/lang/InterruptedException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_4

    goto :goto_0

    .line 142
    .end local v2    # "length":I
    :catch_0
    move-exception v3

    .line 149
    iget-boolean v3, p0, Lorg/apache/tools/ant/taskdefs/StreamPumper;->closeWhenExhausted:Z

    if-eqz v3, :cond_4

    .line 150
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/StreamPumper;->os:Ljava/io/OutputStream;

    invoke-static {v3}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/OutputStream;)V

    .line 152
    :cond_4
    iput-boolean v5, p0, Lorg/apache/tools/ant/taskdefs/StreamPumper;->finished:Z

    .line 153
    monitor-enter p0

    .line 154
    :try_start_5
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 155
    monitor-exit p0

    goto :goto_1

    :catchall_1
    move-exception v3

    monitor-exit p0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    throw v3

    .line 144
    :catch_1
    move-exception v1

    .line 145
    .local v1, "e":Ljava/lang/Exception;
    :try_start_6
    monitor-enter p0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_4

    .line 146
    :try_start_7
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/StreamPumper;->exception:Ljava/lang/Exception;

    .line 147
    monitor-exit p0
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    .line 149
    iget-boolean v3, p0, Lorg/apache/tools/ant/taskdefs/StreamPumper;->closeWhenExhausted:Z

    if-eqz v3, :cond_5

    .line 150
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/StreamPumper;->os:Ljava/io/OutputStream;

    invoke-static {v3}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/OutputStream;)V

    .line 152
    :cond_5
    iput-boolean v5, p0, Lorg/apache/tools/ant/taskdefs/StreamPumper;->finished:Z

    .line 153
    monitor-enter p0

    .line 154
    :try_start_8
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 155
    monitor-exit p0

    goto :goto_1

    :catchall_2
    move-exception v3

    monitor-exit p0
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    throw v3

    .line 147
    :catchall_3
    move-exception v3

    :try_start_9
    monitor-exit p0
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_3

    :try_start_a
    throw v3
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_4

    .line 149
    .end local v1    # "e":Ljava/lang/Exception;
    :catchall_4
    move-exception v3

    iget-boolean v4, p0, Lorg/apache/tools/ant/taskdefs/StreamPumper;->closeWhenExhausted:Z

    if-eqz v4, :cond_6

    .line 150
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/StreamPumper;->os:Ljava/io/OutputStream;

    invoke-static {v4}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/OutputStream;)V

    .line 152
    :cond_6
    iput-boolean v5, p0, Lorg/apache/tools/ant/taskdefs/StreamPumper;->finished:Z

    .line 153
    monitor-enter p0

    .line 154
    :try_start_b
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 155
    monitor-exit p0
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_5

    .line 149
    throw v3

    .line 155
    :catchall_5
    move-exception v3

    :try_start_c
    monitor-exit p0
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_5

    throw v3

    :catchall_6
    move-exception v3

    :try_start_d
    monitor-exit p0
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_6

    throw v3
.end method

.method setAutoflush(Z)V
    .locals 0
    .param p1, "autoflush"    # Z

    .prologue
    .line 106
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/StreamPumper;->autoflush:Z

    .line 107
    return-void
.end method

.method public declared-synchronized setBufferSize(I)V
    .locals 2
    .param p1, "bufferSize"    # I

    .prologue
    .line 184
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/StreamPumper;->started:Z

    if-eqz v0, :cond_0

    .line 185
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "Cannot set buffer size on a running StreamPumper"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 184
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 187
    :cond_0
    :try_start_1
    iput p1, p0, Lorg/apache/tools/ant/taskdefs/StreamPumper;->bufferSize:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 188
    monitor-exit p0

    return-void
.end method

.method declared-synchronized stop()V
    .locals 1

    .prologue
    .line 214
    monitor-enter p0

    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/StreamPumper;->finish:Z

    .line 215
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 216
    monitor-exit p0

    return-void

    .line 214
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized waitFor()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 173
    monitor-enter p0

    :goto_0
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/StreamPumper;->isFinished()Z

    move-result v0

    if-nez v0, :cond_0

    .line 174
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 173
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 176
    :cond_0
    monitor-exit p0

    return-void
.end method
