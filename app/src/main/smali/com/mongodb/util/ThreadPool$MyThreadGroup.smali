.class Lcom/mongodb/util/ThreadPool$MyThreadGroup;
.super Ljava/lang/ThreadGroup;
.source "ThreadPool.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mongodb/util/ThreadPool;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "MyThreadGroup"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mongodb/util/ThreadPool;


# direct methods
.method constructor <init>(Lcom/mongodb/util/ThreadPool;)V
    .locals 2

    .prologue
    .line 96
    .local p0, "this":Lcom/mongodb/util/ThreadPool$MyThreadGroup;, "Lcom/mongodb/util/ThreadPool<TT;>.MyThreadGroup;"
    iput-object p1, p0, Lcom/mongodb/util/ThreadPool$MyThreadGroup;->this$0:Lcom/mongodb/util/ThreadPool;

    .line 97
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "ThreadPool.MyThreadGroup:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p1, Lcom/mongodb/util/ThreadPool;->_name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/lang/ThreadGroup;-><init>(Ljava/lang/String;)V

    .line 98
    return-void
.end method


# virtual methods
.method public uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V
    .locals 2
    .param p1, "t"    # Ljava/lang/Thread;
    .param p2, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 101
    .local p0, "this":Lcom/mongodb/util/ThreadPool$MyThreadGroup;, "Lcom/mongodb/util/ThreadPool<TT;>.MyThreadGroup;"
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lcom/mongodb/util/ThreadPool$MyThreadGroup;->this$0:Lcom/mongodb/util/ThreadPool;

    invoke-static {v1}, Lcom/mongodb/util/ThreadPool;->access$000(Lcom/mongodb/util/ThreadPool;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 102
    iget-object v1, p0, Lcom/mongodb/util/ThreadPool$MyThreadGroup;->this$0:Lcom/mongodb/util/ThreadPool;

    invoke-static {v1}, Lcom/mongodb/util/ThreadPool;->access$000(Lcom/mongodb/util/ThreadPool;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    if-ne v1, p1, :cond_1

    .line 103
    iget-object v1, p0, Lcom/mongodb/util/ThreadPool$MyThreadGroup;->this$0:Lcom/mongodb/util/ThreadPool;

    invoke-static {v1}, Lcom/mongodb/util/ThreadPool;->access$000(Lcom/mongodb/util/ThreadPool;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1, v0}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 107
    :cond_0
    return-void

    .line 101
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method
