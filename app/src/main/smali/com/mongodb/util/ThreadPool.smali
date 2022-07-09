.class public abstract Lcom/mongodb/util/ThreadPool;
.super Ljava/lang/Object;
.source "ThreadPool.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mongodb/util/ThreadPool$MyThread;,
        Lcom/mongodb/util/ThreadPool$MyThreadGroup;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field private final _inProgress:Ljava/util/concurrent/atomic/AtomicInteger;

.field final _maxThreads:I

.field private final _myThreadGroup:Lcom/mongodb/util/ThreadPool$MyThreadGroup;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/mongodb/util/ThreadPool",
            "<TT;>.MyThreadGroup;"
        }
    .end annotation
.end field

.field final _name:Ljava/lang/String;

.field private final _queue:Ljava/util/concurrent/BlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/BlockingQueue",
            "<TT;>;"
        }
    .end annotation
.end field

.field private final _threads:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/util/ThreadPool",
            "<TT;>.MyThread;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;I)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "numThreads"    # I

    .prologue
    .line 40
    .local p0, "this":Lcom/mongodb/util/ThreadPool;, "Lcom/mongodb/util/ThreadPool<TT;>;"
    const v0, 0x7fffffff

    invoke-direct {p0, p1, p2, v0}, Lcom/mongodb/util/ThreadPool;-><init>(Ljava/lang/String;II)V

    .line 41
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;II)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "numThreads"    # I
    .param p3, "maxQueueSize"    # I

    .prologue
    .line 48
    .local p0, "this":Lcom/mongodb/util/ThreadPool;, "Lcom/mongodb/util/ThreadPool<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 147
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v0, p0, Lcom/mongodb/util/ThreadPool;->_inProgress:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 148
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lcom/mongodb/util/ThreadPool;->_threads:Ljava/util/List;

    .line 49
    iput-object p1, p0, Lcom/mongodb/util/ThreadPool;->_name:Ljava/lang/String;

    .line 50
    iput p2, p0, Lcom/mongodb/util/ThreadPool;->_maxThreads:I

    .line 51
    new-instance v0, Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-direct {v0, p3}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>(I)V

    iput-object v0, p0, Lcom/mongodb/util/ThreadPool;->_queue:Ljava/util/concurrent/BlockingQueue;

    .line 52
    new-instance v0, Lcom/mongodb/util/ThreadPool$MyThreadGroup;

    invoke-direct {v0, p0}, Lcom/mongodb/util/ThreadPool$MyThreadGroup;-><init>(Lcom/mongodb/util/ThreadPool;)V

    iput-object v0, p0, Lcom/mongodb/util/ThreadPool;->_myThreadGroup:Lcom/mongodb/util/ThreadPool$MyThreadGroup;

    .line 53
    iget-object v0, p0, Lcom/mongodb/util/ThreadPool;->_threads:Ljava/util/List;

    new-instance v1, Lcom/mongodb/util/ThreadPool$MyThread;

    invoke-direct {v1, p0}, Lcom/mongodb/util/ThreadPool$MyThread;-><init>(Lcom/mongodb/util/ThreadPool;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 54
    return-void
.end method

.method static synthetic access$000(Lcom/mongodb/util/ThreadPool;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/util/ThreadPool;

    .prologue
    .line 33
    iget-object v0, p0, Lcom/mongodb/util/ThreadPool;->_threads:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$100(Lcom/mongodb/util/ThreadPool;)Lcom/mongodb/util/ThreadPool$MyThreadGroup;
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/util/ThreadPool;

    .prologue
    .line 33
    iget-object v0, p0, Lcom/mongodb/util/ThreadPool;->_myThreadGroup:Lcom/mongodb/util/ThreadPool$MyThreadGroup;

    return-object v0
.end method

.method static synthetic access$200(Lcom/mongodb/util/ThreadPool;)Ljava/util/concurrent/BlockingQueue;
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/util/ThreadPool;

    .prologue
    .line 33
    iget-object v0, p0, Lcom/mongodb/util/ThreadPool;->_queue:Ljava/util/concurrent/BlockingQueue;

    return-object v0
.end method

.method static synthetic access$300(Lcom/mongodb/util/ThreadPool;)Ljava/util/concurrent/atomic/AtomicInteger;
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/util/ThreadPool;

    .prologue
    .line 33
    iget-object v0, p0, Lcom/mongodb/util/ThreadPool;->_inProgress:Ljava/util/concurrent/atomic/AtomicInteger;

    return-object v0
.end method


# virtual methods
.method public abstract handle(Ljava/lang/Object;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation
.end method

.method public abstract handleError(Ljava/lang/Object;Ljava/lang/Exception;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Ljava/lang/Exception;",
            ")V"
        }
    .end annotation
.end method

.method public inProgress()I
    .locals 1

    .prologue
    .line 88
    .local p0, "this":Lcom/mongodb/util/ThreadPool;, "Lcom/mongodb/util/ThreadPool<TT;>;"
    iget-object v0, p0, Lcom/mongodb/util/ThreadPool;->_inProgress:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    return v0
.end method

.method public numThreads()I
    .locals 1

    .prologue
    .line 92
    .local p0, "this":Lcom/mongodb/util/ThreadPool;, "Lcom/mongodb/util/ThreadPool<TT;>;"
    iget-object v0, p0, Lcom/mongodb/util/ThreadPool;->_threads:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public offer(Ljava/lang/Object;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    .prologue
    .line 81
    .local p0, "this":Lcom/mongodb/util/ThreadPool;, "Lcom/mongodb/util/ThreadPool<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget-object v0, p0, Lcom/mongodb/util/ThreadPool;->_queue:Ljava/util/concurrent/BlockingQueue;

    invoke-interface {v0}, Ljava/util/concurrent/BlockingQueue;->size()I

    move-result v0

    if-gtz v0, :cond_0

    iget-object v0, p0, Lcom/mongodb/util/ThreadPool;->_inProgress:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    iget-object v1, p0, Lcom/mongodb/util/ThreadPool;->_threads:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ne v0, v1, :cond_1

    :cond_0
    iget-object v0, p0, Lcom/mongodb/util/ThreadPool;->_threads:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    iget v1, p0, Lcom/mongodb/util/ThreadPool;->_maxThreads:I

    if-ge v0, v1, :cond_1

    .line 83
    iget-object v0, p0, Lcom/mongodb/util/ThreadPool;->_threads:Ljava/util/List;

    new-instance v1, Lcom/mongodb/util/ThreadPool$MyThread;

    invoke-direct {v1, p0}, Lcom/mongodb/util/ThreadPool$MyThread;-><init>(Lcom/mongodb/util/ThreadPool;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 84
    :cond_1
    iget-object v0, p0, Lcom/mongodb/util/ThreadPool;->_queue:Ljava/util/concurrent/BlockingQueue;

    invoke-interface {v0, p1}, Ljava/util/concurrent/BlockingQueue;->offer(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public queueSize()I
    .locals 1

    .prologue
    .line 73
    .local p0, "this":Lcom/mongodb/util/ThreadPool;, "Lcom/mongodb/util/ThreadPool<TT;>;"
    iget-object v0, p0, Lcom/mongodb/util/ThreadPool;->_queue:Ljava/util/concurrent/BlockingQueue;

    invoke-interface {v0}, Ljava/util/concurrent/BlockingQueue;->size()I

    move-result v0

    return v0
.end method
