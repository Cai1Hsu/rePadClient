.class Lorg/apache/tools/ant/taskdefs/Parallel$TaskRunnable;
.super Ljava/lang/Object;
.source "Parallel.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/taskdefs/Parallel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "TaskRunnable"
.end annotation


# instance fields
.field private exception:Ljava/lang/Throwable;

.field private finished:Z

.field private task:Lorg/apache/tools/ant/Task;

.field private final this$0:Lorg/apache/tools/ant/taskdefs/Parallel;

.field private volatile thread:Ljava/lang/Thread;


# direct methods
.method constructor <init>(Lorg/apache/tools/ant/taskdefs/Parallel;Lorg/apache/tools/ant/Task;)V
    .locals 0
    .param p1, "this$0"    # Lorg/apache/tools/ant/taskdefs/Parallel;
    .param p2, "task"    # Lorg/apache/tools/ant/Task;

    .prologue
    .line 423
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Parallel$TaskRunnable;->this$0:Lorg/apache/tools/ant/taskdefs/Parallel;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 424
    iput-object p2, p0, Lorg/apache/tools/ant/taskdefs/Parallel$TaskRunnable;->task:Lorg/apache/tools/ant/Task;

    .line 425
    return-void
.end method


# virtual methods
.method public getException()Ljava/lang/Throwable;
    .locals 1

    .prologue
    .line 454
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Parallel$TaskRunnable;->exception:Ljava/lang/Throwable;

    return-object v0
.end method

.method interrupt()V
    .locals 1

    .prologue
    .line 466
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Parallel$TaskRunnable;->thread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V

    .line 467
    return-void
.end method

.method isFinished()Z
    .locals 1

    .prologue
    .line 462
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Parallel$TaskRunnable;->finished:Z

    return v0
.end method

.method public run()V
    .locals 4

    .prologue
    .line 433
    :try_start_0
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Parallel$TaskRunnable;->this$0:Lorg/apache/tools/ant/taskdefs/Parallel;

    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/Parallel;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-static {v1}, Lorg/apache/tools/ant/property/LocalProperties;->get(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/property/LocalProperties;

    move-result-object v1

    invoke-virtual {v1}, Lorg/apache/tools/ant/property/LocalProperties;->copy()V

    .line 434
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/Parallel$TaskRunnable;->thread:Ljava/lang/Thread;

    .line 435
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Parallel$TaskRunnable;->task:Lorg/apache/tools/ant/Task;

    invoke-virtual {v1}, Lorg/apache/tools/ant/Task;->perform()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 442
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Parallel$TaskRunnable;->this$0:Lorg/apache/tools/ant/taskdefs/Parallel;

    invoke-static {v1}, Lorg/apache/tools/ant/taskdefs/Parallel;->access$200(Lorg/apache/tools/ant/taskdefs/Parallel;)Ljava/lang/Object;

    move-result-object v2

    monitor-enter v2

    .line 443
    const/4 v1, 0x1

    :try_start_1
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/Parallel$TaskRunnable;->finished:Z

    .line 444
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Parallel$TaskRunnable;->this$0:Lorg/apache/tools/ant/taskdefs/Parallel;

    invoke-static {v1}, Lorg/apache/tools/ant/taskdefs/Parallel;->access$200(Lorg/apache/tools/ant/taskdefs/Parallel;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 445
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_3

    .line 447
    :goto_0
    return-void

    .line 436
    :catch_0
    move-exception v0

    .line 437
    .local v0, "t":Ljava/lang/Throwable;
    :try_start_2
    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Parallel$TaskRunnable;->exception:Ljava/lang/Throwable;

    .line 438
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Parallel$TaskRunnable;->this$0:Lorg/apache/tools/ant/taskdefs/Parallel;

    invoke-static {v1}, Lorg/apache/tools/ant/taskdefs/Parallel;->access$500(Lorg/apache/tools/ant/taskdefs/Parallel;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 439
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Parallel$TaskRunnable;->this$0:Lorg/apache/tools/ant/taskdefs/Parallel;

    const/4 v2, 0x0

    invoke-static {v1, v2}, Lorg/apache/tools/ant/taskdefs/Parallel;->access$302(Lorg/apache/tools/ant/taskdefs/Parallel;Z)Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 442
    :cond_0
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Parallel$TaskRunnable;->this$0:Lorg/apache/tools/ant/taskdefs/Parallel;

    invoke-static {v1}, Lorg/apache/tools/ant/taskdefs/Parallel;->access$200(Lorg/apache/tools/ant/taskdefs/Parallel;)Ljava/lang/Object;

    move-result-object v2

    monitor-enter v2

    .line 443
    const/4 v1, 0x1

    :try_start_3
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/Parallel$TaskRunnable;->finished:Z

    .line 444
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Parallel$TaskRunnable;->this$0:Lorg/apache/tools/ant/taskdefs/Parallel;

    invoke-static {v1}, Lorg/apache/tools/ant/taskdefs/Parallel;->access$200(Lorg/apache/tools/ant/taskdefs/Parallel;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 445
    monitor-exit v2

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v1

    .line 442
    .end local v0    # "t":Ljava/lang/Throwable;
    :catchall_1
    move-exception v1

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Parallel$TaskRunnable;->this$0:Lorg/apache/tools/ant/taskdefs/Parallel;

    invoke-static {v2}, Lorg/apache/tools/ant/taskdefs/Parallel;->access$200(Lorg/apache/tools/ant/taskdefs/Parallel;)Ljava/lang/Object;

    move-result-object v2

    monitor-enter v2

    .line 443
    const/4 v3, 0x1

    :try_start_4
    iput-boolean v3, p0, Lorg/apache/tools/ant/taskdefs/Parallel$TaskRunnable;->finished:Z

    .line 444
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Parallel$TaskRunnable;->this$0:Lorg/apache/tools/ant/taskdefs/Parallel;

    invoke-static {v3}, Lorg/apache/tools/ant/taskdefs/Parallel;->access$200(Lorg/apache/tools/ant/taskdefs/Parallel;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->notifyAll()V

    .line 445
    monitor-exit v2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 442
    throw v1

    .line 445
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
