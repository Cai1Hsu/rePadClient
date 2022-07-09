.class Lcom/mongodb/Mongo$CursorCleanerThread;
.super Ljava/lang/Thread;
.source "Mongo.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mongodb/Mongo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "CursorCleanerThread"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mongodb/Mongo;


# direct methods
.method constructor <init>(Lcom/mongodb/Mongo;)V
    .locals 2

    .prologue
    .line 811
    iput-object p1, p0, Lcom/mongodb/Mongo$CursorCleanerThread;->this$0:Lcom/mongodb/Mongo;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 812
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/mongodb/Mongo$CursorCleanerThread;->setDaemon(Z)V

    .line 813
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "MongoCleaner"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/mongodb/Mongo$CursorCleanerThread;->setName(Ljava/lang/String;)V

    .line 814
    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 817
    :cond_0
    :goto_0
    iget-object v2, p0, Lcom/mongodb/Mongo$CursorCleanerThread;->this$0:Lcom/mongodb/Mongo;

    iget-object v2, v2, Lcom/mongodb/Mongo;->_connector:Lcom/mongodb/DBTCPConnector;

    invoke-virtual {v2}, Lcom/mongodb/DBTCPConnector;->isOpen()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 820
    :try_start_0
    sget v2, Lcom/mongodb/Mongo;->cleanerIntervalMS:I

    int-to-long v2, v2

    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 824
    :goto_1
    :try_start_1
    iget-object v2, p0, Lcom/mongodb/Mongo$CursorCleanerThread;->this$0:Lcom/mongodb/Mongo;

    iget-object v2, v2, Lcom/mongodb/Mongo;->_dbs:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v2}, Ljava/util/concurrent/ConcurrentMap;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mongodb/DB;

    .line 825
    .local v0, "db":Lcom/mongodb/DB;
    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Lcom/mongodb/DB;->cleanCursors(Z)V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_2

    .line 827
    .end local v0    # "db":Lcom/mongodb/DB;
    .end local v1    # "i$":Ljava/util/Iterator;
    :catch_0
    move-exception v2

    goto :goto_0

    .line 831
    :cond_1
    return-void

    .line 821
    :catch_1
    move-exception v2

    goto :goto_1
.end method
