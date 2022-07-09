.class public Lorg/apache/tools/ant/taskdefs/Retry;
.super Lorg/apache/tools/ant/Task;
.source "Retry.java"

# interfaces
.implements Lorg/apache/tools/ant/TaskContainer;


# instance fields
.field private nestedTask:Lorg/apache/tools/ant/Task;

.field private retryCount:I

.field private retryDelay:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 30
    invoke-direct {p0}, Lorg/apache/tools/ant/Task;-><init>()V

    .line 40
    const/4 v0, 0x1

    iput v0, p0, Lorg/apache/tools/ant/taskdefs/Retry;->retryCount:I

    .line 45
    const/4 v0, 0x0

    iput v0, p0, Lorg/apache/tools/ant/taskdefs/Retry;->retryDelay:I

    return-void
.end method


# virtual methods
.method public declared-synchronized addTask(Lorg/apache/tools/ant/Task;)V
    .locals 2
    .param p1, "t"    # Lorg/apache/tools/ant/Task;

    .prologue
    .line 52
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Retry;->nestedTask:Lorg/apache/tools/ant/Task;

    if-eqz v0, :cond_0

    .line 53
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "The retry task container accepts a single nested task (which may be a sequential task container)"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 52
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 57
    :cond_0
    :try_start_1
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Retry;->nestedTask:Lorg/apache/tools/ant/Task;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 58
    monitor-exit p0

    return-void
.end method

.method public execute()V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 85
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    .line 86
    .local v1, "errorMessages":Ljava/lang/StringBuffer;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    iget v5, p0, Lorg/apache/tools/ant/taskdefs/Retry;->retryCount:I

    if-gt v3, v5, :cond_0

    .line 88
    :try_start_0
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Retry;->nestedTask:Lorg/apache/tools/ant/Task;

    invoke-virtual {v5}, Lorg/apache/tools/ant/Task;->perform()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 118
    :cond_0
    return-void

    .line 90
    :catch_0
    move-exception v0

    .line 91
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 92
    iget v5, p0, Lorg/apache/tools/ant/taskdefs/Retry;->retryCount:I

    if-lt v3, v5, :cond_1

    .line 93
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    .line 94
    .local v2, "exceptionMessage":Ljava/lang/StringBuffer;
    const-string/jumbo v5, "Task ["

    invoke-virtual {v2, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/Retry;->nestedTask:Lorg/apache/tools/ant/Task;

    invoke-virtual {v6}, Lorg/apache/tools/ant/Task;->getTaskName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 95
    const-string/jumbo v5, "] failed after ["

    invoke-virtual {v2, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    iget v6, p0, Lorg/apache/tools/ant/taskdefs/Retry;->retryCount:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    .line 96
    const-string/jumbo v5, "] attempts; giving up."

    invoke-virtual {v2, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    sget-object v6, Lorg/apache/tools/ant/util/StringUtils;->LINE_SEP:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 97
    const-string/jumbo v5, "Error messages:"

    invoke-virtual {v2, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    sget-object v6, Lorg/apache/tools/ant/util/StringUtils;->LINE_SEP:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 98
    invoke-virtual {v2, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/StringBuffer;)Ljava/lang/StringBuffer;

    .line 99
    new-instance v5, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Retry;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v7

    invoke-direct {v5, v6, v7}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v5

    .line 102
    .end local v2    # "exceptionMessage":Ljava/lang/StringBuffer;
    :cond_1
    iget v5, p0, Lorg/apache/tools/ant/taskdefs/Retry;->retryDelay:I

    if-lez v5, :cond_3

    .line 103
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "Attempt ["

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string/jumbo v6, "]: error occurred; retrying after "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    iget v6, p0, Lorg/apache/tools/ant/taskdefs/Retry;->retryDelay:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string/jumbo v6, " ms..."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    .line 107
    .local v4, "msg":Ljava/lang/String;
    :goto_1
    const/4 v5, 0x2

    invoke-virtual {p0, v4, v0, v5}, Lorg/apache/tools/ant/taskdefs/Retry;->log(Ljava/lang/String;Ljava/lang/Throwable;I)V

    .line 108
    sget-object v5, Lorg/apache/tools/ant/util/StringUtils;->LINE_SEP:Ljava/lang/String;

    invoke-virtual {v1, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 109
    iget v5, p0, Lorg/apache/tools/ant/taskdefs/Retry;->retryDelay:I

    if-lez v5, :cond_2

    .line 111
    :try_start_1
    iget v5, p0, Lorg/apache/tools/ant/taskdefs/Retry;->retryDelay:I

    int-to-long v6, v5

    invoke-static {v6, v7}, Ljava/lang/Thread;->sleep(J)V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_1

    .line 86
    :cond_2
    :goto_2
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_0

    .line 105
    .end local v4    # "msg":Ljava/lang/String;
    :cond_3
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "Attempt ["

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string/jumbo v6, "]: error occurred; retrying..."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    .restart local v4    # "msg":Ljava/lang/String;
    goto :goto_1

    .line 112
    :catch_1
    move-exception v5

    goto :goto_2
.end method

.method public setRetryCount(I)V
    .locals 0
    .param p1, "n"    # I

    .prologue
    .line 65
    iput p1, p0, Lorg/apache/tools/ant/taskdefs/Retry;->retryCount:I

    .line 66
    return-void
.end method

.method public setRetryDelay(I)V
    .locals 2
    .param p1, "retryDelay"    # I

    .prologue
    .line 74
    if-gez p1, :cond_0

    .line 75
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "delay must be a non-negative number"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 77
    :cond_0
    iput p1, p0, Lorg/apache/tools/ant/taskdefs/Retry;->retryDelay:I

    .line 78
    return-void
.end method
