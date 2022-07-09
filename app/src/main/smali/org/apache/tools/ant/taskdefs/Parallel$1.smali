.class Lorg/apache/tools/ant/taskdefs/Parallel$1;
.super Ljava/lang/Thread;
.source "Parallel.java"


# instance fields
.field private final this$0:Lorg/apache/tools/ant/taskdefs/Parallel;


# direct methods
.method constructor <init>(Lorg/apache/tools/ant/taskdefs/Parallel;)V
    .locals 0
    .param p1, "this$0"    # Lorg/apache/tools/ant/taskdefs/Parallel;

    .prologue
    .line 300
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Parallel$1;->this$0:Lorg/apache/tools/ant/taskdefs/Parallel;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public declared-synchronized run()V
    .locals 3

    .prologue
    .line 302
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Parallel$1;->this$0:Lorg/apache/tools/ant/taskdefs/Parallel;

    invoke-static {v0}, Lorg/apache/tools/ant/taskdefs/Parallel;->access$100(Lorg/apache/tools/ant/taskdefs/Parallel;)J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Ljava/lang/Object;->wait(J)V

    .line 303
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Parallel$1;->this$0:Lorg/apache/tools/ant/taskdefs/Parallel;

    invoke-static {v0}, Lorg/apache/tools/ant/taskdefs/Parallel;->access$200(Lorg/apache/tools/ant/taskdefs/Parallel;)Ljava/lang/Object;

    move-result-object v1

    monitor-enter v1
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 304
    :try_start_1
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Parallel$1;->this$0:Lorg/apache/tools/ant/taskdefs/Parallel;

    const/4 v2, 0x0

    invoke-static {v0, v2}, Lorg/apache/tools/ant/taskdefs/Parallel;->access$302(Lorg/apache/tools/ant/taskdefs/Parallel;Z)Z

    .line 305
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Parallel$1;->this$0:Lorg/apache/tools/ant/taskdefs/Parallel;

    const/4 v2, 0x1

    invoke-static {v0, v2}, Lorg/apache/tools/ant/taskdefs/Parallel;->access$402(Lorg/apache/tools/ant/taskdefs/Parallel;Z)Z

    .line 306
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Parallel$1;->this$0:Lorg/apache/tools/ant/taskdefs/Parallel;

    invoke-static {v0}, Lorg/apache/tools/ant/taskdefs/Parallel;->access$200(Lorg/apache/tools/ant/taskdefs/Parallel;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 307
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 311
    :goto_0
    monitor-exit p0

    return-void

    .line 307
    :catchall_0
    move-exception v0

    :try_start_2
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :try_start_3
    throw v0
    :try_end_3
    .catch Ljava/lang/InterruptedException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 308
    :catch_0
    move-exception v0

    goto :goto_0

    .line 302
    :catchall_1
    move-exception v0

    monitor-exit p0

    throw v0
.end method
