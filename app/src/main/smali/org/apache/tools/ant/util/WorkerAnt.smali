.class public Lorg/apache/tools/ant/util/WorkerAnt;
.super Ljava/lang/Thread;
.source "WorkerAnt.java"


# static fields
.field public static final ERROR_NO_TASK:Ljava/lang/String; = "No task defined"


# instance fields
.field private volatile buildException:Lorg/apache/tools/ant/BuildException;

.field private volatile exception:Ljava/lang/Throwable;

.field private volatile finished:Z

.field private notify:Ljava/lang/Object;

.field private task:Lorg/apache/tools/ant/Task;


# direct methods
.method public constructor <init>(Lorg/apache/tools/ant/Task;)V
    .locals 1
    .param p1, "task"    # Lorg/apache/tools/ant/Task;

    .prologue
    .line 69
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/apache/tools/ant/util/WorkerAnt;-><init>(Lorg/apache/tools/ant/Task;Ljava/lang/Object;)V

    .line 70
    return-void
.end method

.method public constructor <init>(Lorg/apache/tools/ant/Task;Ljava/lang/Object;)V
    .locals 1
    .param p1, "task"    # Lorg/apache/tools/ant/Task;
    .param p2, "notify"    # Ljava/lang/Object;

    .prologue
    .line 57
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 40
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/util/WorkerAnt;->finished:Z

    .line 58
    iput-object p1, p0, Lorg/apache/tools/ant/util/WorkerAnt;->task:Lorg/apache/tools/ant/Task;

    .line 59
    if-eqz p2, :cond_0

    .end local p2    # "notify":Ljava/lang/Object;
    :goto_0
    iput-object p2, p0, Lorg/apache/tools/ant/util/WorkerAnt;->notify:Ljava/lang/Object;

    .line 60
    return-void

    .restart local p2    # "notify":Ljava/lang/Object;
    :cond_0
    move-object p2, p0

    .line 59
    goto :goto_0
.end method

.method private declared-synchronized caught(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "thrown"    # Ljava/lang/Throwable;

    .prologue
    .line 146
    monitor-enter p0

    :try_start_0
    iput-object p1, p0, Lorg/apache/tools/ant/util/WorkerAnt;->exception:Ljava/lang/Throwable;

    .line 147
    instance-of v0, p1, Lorg/apache/tools/ant/BuildException;

    if-eqz v0, :cond_0

    check-cast p1, Lorg/apache/tools/ant/BuildException;

    .end local p1    # "thrown":Ljava/lang/Throwable;
    :goto_0
    iput-object p1, p0, Lorg/apache/tools/ant/util/WorkerAnt;->buildException:Lorg/apache/tools/ant/BuildException;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 150
    monitor-exit p0

    return-void

    .line 147
    .restart local p1    # "thrown":Ljava/lang/Throwable;
    :cond_0
    :try_start_1
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v0, p1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-object p1, v0

    goto :goto_0

    .line 146
    .end local p1    # "thrown":Ljava/lang/Throwable;
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method


# virtual methods
.method public declared-synchronized getBuildException()Lorg/apache/tools/ant/BuildException;
    .locals 1

    .prologue
    .line 81
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lorg/apache/tools/ant/util/WorkerAnt;->buildException:Lorg/apache/tools/ant/BuildException;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getException()Ljava/lang/Throwable;
    .locals 1

    .prologue
    .line 90
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lorg/apache/tools/ant/util/WorkerAnt;->exception:Ljava/lang/Throwable;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getTask()Lorg/apache/tools/ant/Task;
    .locals 1

    .prologue
    .line 99
    iget-object v0, p0, Lorg/apache/tools/ant/util/WorkerAnt;->task:Lorg/apache/tools/ant/Task;

    return-object v0
.end method

.method public declared-synchronized isFinished()Z
    .locals 1

    .prologue
    .line 111
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lorg/apache/tools/ant/util/WorkerAnt;->finished:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public rethrowAnyBuildException()V
    .locals 1

    .prologue
    .line 133
    invoke-virtual {p0}, Lorg/apache/tools/ant/util/WorkerAnt;->getBuildException()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    .line 134
    .local v0, "ex":Lorg/apache/tools/ant/BuildException;
    if-eqz v0, :cond_0

    .line 135
    throw v0

    .line 137
    :cond_0
    return-void
.end method

.method public run()V
    .locals 4

    .prologue
    .line 158
    :try_start_0
    iget-object v1, p0, Lorg/apache/tools/ant/util/WorkerAnt;->task:Lorg/apache/tools/ant/Task;

    if-eqz v1, :cond_0

    .line 159
    iget-object v1, p0, Lorg/apache/tools/ant/util/WorkerAnt;->task:Lorg/apache/tools/ant/Task;

    invoke-virtual {v1}, Lorg/apache/tools/ant/Task;->execute()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 164
    :cond_0
    iget-object v2, p0, Lorg/apache/tools/ant/util/WorkerAnt;->notify:Ljava/lang/Object;

    monitor-enter v2

    .line 165
    const/4 v1, 0x1

    :try_start_1
    iput-boolean v1, p0, Lorg/apache/tools/ant/util/WorkerAnt;->finished:Z

    .line 168
    iget-object v1, p0, Lorg/apache/tools/ant/util/WorkerAnt;->notify:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 169
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_3

    .line 171
    :goto_0
    return-void

    .line 161
    :catch_0
    move-exception v0

    .line 162
    .local v0, "thrown":Ljava/lang/Throwable;
    :try_start_2
    invoke-direct {p0, v0}, Lorg/apache/tools/ant/util/WorkerAnt;->caught(Ljava/lang/Throwable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 164
    iget-object v2, p0, Lorg/apache/tools/ant/util/WorkerAnt;->notify:Ljava/lang/Object;

    monitor-enter v2

    .line 165
    const/4 v1, 0x1

    :try_start_3
    iput-boolean v1, p0, Lorg/apache/tools/ant/util/WorkerAnt;->finished:Z

    .line 168
    iget-object v1, p0, Lorg/apache/tools/ant/util/WorkerAnt;->notify:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 169
    monitor-exit v2

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v1

    .line 164
    .end local v0    # "thrown":Ljava/lang/Throwable;
    :catchall_1
    move-exception v1

    iget-object v2, p0, Lorg/apache/tools/ant/util/WorkerAnt;->notify:Ljava/lang/Object;

    monitor-enter v2

    .line 165
    const/4 v3, 0x1

    :try_start_4
    iput-boolean v3, p0, Lorg/apache/tools/ant/util/WorkerAnt;->finished:Z

    .line 168
    iget-object v3, p0, Lorg/apache/tools/ant/util/WorkerAnt;->notify:Ljava/lang/Object;

    invoke-virtual {v3}, Ljava/lang/Object;->notifyAll()V

    .line 169
    monitor-exit v2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 164
    throw v1

    .line 169
    :catchall_2
    move-exception v1

    :try_start_5
    monitor-exit v2
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    throw v1

    :catchall_3
    move-exception v1

    :try_start_6
    monitor-exit v2
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    throw v1
.end method

.method public waitUntilFinished(J)V
    .locals 3
    .param p1, "timeout"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 120
    iget-object v1, p0, Lorg/apache/tools/ant/util/WorkerAnt;->notify:Ljava/lang/Object;

    monitor-enter v1

    .line 121
    :try_start_0
    iget-boolean v0, p0, Lorg/apache/tools/ant/util/WorkerAnt;->finished:Z

    if-nez v0, :cond_0

    .line 122
    iget-object v0, p0, Lorg/apache/tools/ant/util/WorkerAnt;->notify:Ljava/lang/Object;

    invoke-virtual {v0, p1, p2}, Ljava/lang/Object;->wait(J)V

    .line 124
    :cond_0
    monitor-exit v1

    .line 125
    return-void

    .line 124
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
