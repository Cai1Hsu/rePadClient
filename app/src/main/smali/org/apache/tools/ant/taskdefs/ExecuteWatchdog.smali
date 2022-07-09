.class public Lorg/apache/tools/ant/taskdefs/ExecuteWatchdog;
.super Ljava/lang/Object;
.source "ExecuteWatchdog.java"

# interfaces
.implements Lorg/apache/tools/ant/util/TimeoutObserver;


# instance fields
.field private caught:Ljava/lang/Exception;

.field private volatile killedProcess:Z

.field private process:Ljava/lang/Process;

.field private volatile watch:Z

.field private watchdog:Lorg/apache/tools/ant/util/Watchdog;


# direct methods
.method public constructor <init>(I)V
    .locals 2
    .param p1, "timeout"    # I

    .prologue
    .line 78
    int-to-long v0, p1

    invoke-direct {p0, v0, v1}, Lorg/apache/tools/ant/taskdefs/ExecuteWatchdog;-><init>(J)V

    .line 79
    return-void
.end method

.method public constructor <init>(J)V
    .locals 3
    .param p1, "timeout"    # J

    .prologue
    const/4 v1, 0x0

    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/ExecuteWatchdog;->watch:Z

    .line 51
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/ExecuteWatchdog;->caught:Ljava/lang/Exception;

    .line 54
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/ExecuteWatchdog;->killedProcess:Z

    .line 66
    new-instance v0, Lorg/apache/tools/ant/util/Watchdog;

    invoke-direct {v0, p1, p2}, Lorg/apache/tools/ant/util/Watchdog;-><init>(J)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/ExecuteWatchdog;->watchdog:Lorg/apache/tools/ant/util/Watchdog;

    .line 67
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/ExecuteWatchdog;->watchdog:Lorg/apache/tools/ant/util/Watchdog;

    invoke-virtual {v0, p0}, Lorg/apache/tools/ant/util/Watchdog;->addTimeoutObserver(Lorg/apache/tools/ant/util/TimeoutObserver;)V

    .line 68
    return-void
.end method


# virtual methods
.method public declared-synchronized checkException()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 153
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/ExecuteWatchdog;->caught:Ljava/lang/Exception;

    if-eqz v0, :cond_0

    .line 154
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "Exception in ExecuteWatchdog.run: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/ExecuteWatchdog;->caught:Ljava/lang/Exception;

    invoke-virtual {v2}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/ExecuteWatchdog;->caught:Ljava/lang/Exception;

    invoke-direct {v0, v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 153
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 157
    :cond_0
    monitor-exit p0

    return-void
.end method

.method protected declared-synchronized cleanUp()V
    .locals 1

    .prologue
    .line 140
    monitor-enter p0

    const/4 v0, 0x0

    :try_start_0
    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/ExecuteWatchdog;->watch:Z

    .line 141
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/ExecuteWatchdog;->process:Ljava/lang/Process;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 142
    monitor-exit p0

    return-void

    .line 140
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public isWatching()Z
    .locals 1

    .prologue
    .line 165
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/ExecuteWatchdog;->watch:Z

    return v0
.end method

.method public killedProcess()Z
    .locals 1

    .prologue
    .line 174
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/ExecuteWatchdog;->killedProcess:Z

    return v0
.end method

.method public declared-synchronized start(Ljava/lang/Process;)V
    .locals 2
    .param p1, "process"    # Ljava/lang/Process;

    .prologue
    .line 88
    monitor-enter p0

    if-nez p1, :cond_0

    .line 89
    :try_start_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "process is null."

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 88
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 91
    :cond_0
    :try_start_1
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/ExecuteWatchdog;->process:Ljava/lang/Process;

    if-eqz v0, :cond_1

    .line 92
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "Already running."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 94
    :cond_1
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/ExecuteWatchdog;->caught:Ljava/lang/Exception;

    .line 95
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/ExecuteWatchdog;->killedProcess:Z

    .line 96
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/ExecuteWatchdog;->watch:Z

    .line 97
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/ExecuteWatchdog;->process:Ljava/lang/Process;

    .line 98
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/ExecuteWatchdog;->watchdog:Lorg/apache/tools/ant/util/Watchdog;

    invoke-virtual {v0}, Lorg/apache/tools/ant/util/Watchdog;->start()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 99
    monitor-exit p0

    return-void
.end method

.method public declared-synchronized stop()V
    .locals 1

    .prologue
    .line 106
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/ExecuteWatchdog;->watchdog:Lorg/apache/tools/ant/util/Watchdog;

    invoke-virtual {v0}, Lorg/apache/tools/ant/util/Watchdog;->stop()V

    .line 107
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/ExecuteWatchdog;->cleanUp()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 108
    monitor-exit p0

    return-void

    .line 106
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized timeoutOccured(Lorg/apache/tools/ant/util/Watchdog;)V
    .locals 3
    .param p1, "w"    # Lorg/apache/tools/ant/util/Watchdog;

    .prologue
    .line 120
    monitor-enter p0

    :try_start_0
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/ExecuteWatchdog;->process:Ljava/lang/Process;

    invoke-virtual {v2}, Ljava/lang/Process;->exitValue()I
    :try_end_0
    .catch Ljava/lang/IllegalThreadStateException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 132
    :cond_0
    :goto_0
    :try_start_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/ExecuteWatchdog;->cleanUp()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 134
    :goto_1
    monitor-exit p0

    return-void

    .line 121
    :catch_0
    move-exception v1

    .line 124
    .local v1, "itse":Ljava/lang/IllegalThreadStateException;
    :try_start_2
    iget-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/ExecuteWatchdog;->watch:Z

    if-eqz v2, :cond_0

    .line 125
    const/4 v2, 0x1

    iput-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/ExecuteWatchdog;->killedProcess:Z

    .line 126
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/ExecuteWatchdog;->process:Ljava/lang/Process;

    invoke-virtual {v2}, Ljava/lang/Process;->destroy()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    goto :goto_0

    .line 129
    .end local v1    # "itse":Ljava/lang/IllegalThreadStateException;
    :catch_1
    move-exception v0

    .line 130
    .local v0, "e":Ljava/lang/Exception;
    :try_start_3
    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/ExecuteWatchdog;->caught:Ljava/lang/Exception;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 132
    :try_start_4
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/ExecuteWatchdog;->cleanUp()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_1

    .line 120
    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2

    .line 132
    :catchall_1
    move-exception v2

    :try_start_5
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/ExecuteWatchdog;->cleanUp()V

    throw v2
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0
.end method
