.class Lcom/mongodb/util/ThreadPool$MyThread;
.super Ljava/lang/Thread;
.source "ThreadPool.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mongodb/util/ThreadPool;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "MyThread"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mongodb/util/ThreadPool;


# direct methods
.method constructor <init>(Lcom/mongodb/util/ThreadPool;)V
    .locals 3

    .prologue
    .line 111
    .local p0, "this":Lcom/mongodb/util/ThreadPool$MyThread;, "Lcom/mongodb/util/ThreadPool<TT;>.MyThread;"
    iput-object p1, p0, Lcom/mongodb/util/ThreadPool$MyThread;->this$0:Lcom/mongodb/util/ThreadPool;

    .line 112
    invoke-static {p1}, Lcom/mongodb/util/ThreadPool;->access$100(Lcom/mongodb/util/ThreadPool;)Lcom/mongodb/util/ThreadPool$MyThreadGroup;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "ThreadPool.MyThread:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p1, Lcom/mongodb/util/ThreadPool;->_name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ":"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {p1}, Lcom/mongodb/util/ThreadPool;->access$000(Lcom/mongodb/util/ThreadPool;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/ThreadGroup;Ljava/lang/String;)V

    .line 113
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/mongodb/util/ThreadPool$MyThread;->setDaemon(Z)V

    .line 114
    invoke-virtual {p0}, Lcom/mongodb/util/ThreadPool$MyThread;->start()V

    .line 115
    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 119
    .local p0, "this":Lcom/mongodb/util/ThreadPool$MyThread;, "Lcom/mongodb/util/ThreadPool<TT;>.MyThread;"
    :cond_0
    :goto_0
    const/4 v1, 0x0

    .line 122
    .local v1, "t":Ljava/lang/Object;, "TT;"
    :try_start_0
    iget-object v2, p0, Lcom/mongodb/util/ThreadPool$MyThread;->this$0:Lcom/mongodb/util/ThreadPool;

    invoke-static {v2}, Lcom/mongodb/util/ThreadPool;->access$200(Lcom/mongodb/util/ThreadPool;)Ljava/util/concurrent/BlockingQueue;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/concurrent/BlockingQueue;->take()Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v1

    .line 127
    .end local v1    # "t":Ljava/lang/Object;, "TT;"
    :goto_1
    if-eqz v1, :cond_0

    .line 131
    :try_start_1
    iget-object v2, p0, Lcom/mongodb/util/ThreadPool$MyThread;->this$0:Lcom/mongodb/util/ThreadPool;

    invoke-static {v2}, Lcom/mongodb/util/ThreadPool;->access$300(Lcom/mongodb/util/ThreadPool;)Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    .line 132
    iget-object v2, p0, Lcom/mongodb/util/ThreadPool$MyThread;->this$0:Lcom/mongodb/util/ThreadPool;

    invoke-virtual {v2, v1}, Lcom/mongodb/util/ThreadPool;->handle(Ljava/lang/Object;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 138
    iget-object v2, p0, Lcom/mongodb/util/ThreadPool$MyThread;->this$0:Lcom/mongodb/util/ThreadPool;

    invoke-static {v2}, Lcom/mongodb/util/ThreadPool;->access$300(Lcom/mongodb/util/ThreadPool;)Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    goto :goto_0

    .line 134
    :catch_0
    move-exception v0

    .line 135
    .local v0, "e":Ljava/lang/Exception;
    :try_start_2
    iget-object v2, p0, Lcom/mongodb/util/ThreadPool$MyThread;->this$0:Lcom/mongodb/util/ThreadPool;

    invoke-virtual {v2, v1, v0}, Lcom/mongodb/util/ThreadPool;->handleError(Ljava/lang/Object;Ljava/lang/Exception;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 138
    iget-object v2, p0, Lcom/mongodb/util/ThreadPool$MyThread;->this$0:Lcom/mongodb/util/ThreadPool;

    invoke-static {v2}, Lcom/mongodb/util/ThreadPool;->access$300(Lcom/mongodb/util/ThreadPool;)Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    goto :goto_0

    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v2

    iget-object v3, p0, Lcom/mongodb/util/ThreadPool$MyThread;->this$0:Lcom/mongodb/util/ThreadPool;

    invoke-static {v3}, Lcom/mongodb/util/ThreadPool;->access$300(Lcom/mongodb/util/ThreadPool;)Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    throw v2

    .line 124
    .restart local v1    # "t":Ljava/lang/Object;, "TT;"
    :catch_1
    move-exception v2

    goto :goto_1
.end method
