.class Lcom/mongodb/PooledConnectionProvider$1;
.super Ljava/lang/Object;
.source "PooledConnectionProvider.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mongodb/PooledConnectionProvider;->createMaintenanceTask()Ljava/lang/Runnable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mongodb/PooledConnectionProvider;


# direct methods
.method constructor <init>(Lcom/mongodb/PooledConnectionProvider;)V
    .locals 0

    .prologue
    .line 123
    iput-object p1, p0, Lcom/mongodb/PooledConnectionProvider$1;->this$0:Lcom/mongodb/PooledConnectionProvider;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public declared-synchronized run()V
    .locals 5

    .prologue
    .line 126
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/mongodb/PooledConnectionProvider$1;->this$0:Lcom/mongodb/PooledConnectionProvider;

    invoke-static {v0}, Lcom/mongodb/PooledConnectionProvider;->access$100(Lcom/mongodb/PooledConnectionProvider;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 127
    invoke-static {}, Lcom/mongodb/PooledConnectionProvider;->access$300()Ljava/util/logging/Logger;

    move-result-object v0

    const-string/jumbo v1, "Pruning pooled connections to %s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-object v4, p0, Lcom/mongodb/PooledConnectionProvider$1;->this$0:Lcom/mongodb/PooledConnectionProvider;

    invoke-static {v4}, Lcom/mongodb/PooledConnectionProvider;->access$200(Lcom/mongodb/PooledConnectionProvider;)Lcom/mongodb/ServerAddress;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 128
    iget-object v0, p0, Lcom/mongodb/PooledConnectionProvider$1;->this$0:Lcom/mongodb/PooledConnectionProvider;

    invoke-static {v0}, Lcom/mongodb/PooledConnectionProvider;->access$400(Lcom/mongodb/PooledConnectionProvider;)Lcom/mongodb/ConcurrentPool;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mongodb/ConcurrentPool;->prune()V

    .line 130
    :cond_0
    iget-object v0, p0, Lcom/mongodb/PooledConnectionProvider$1;->this$0:Lcom/mongodb/PooledConnectionProvider;

    invoke-static {v0}, Lcom/mongodb/PooledConnectionProvider;->access$500(Lcom/mongodb/PooledConnectionProvider;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 131
    invoke-static {}, Lcom/mongodb/PooledConnectionProvider;->access$300()Ljava/util/logging/Logger;

    move-result-object v0

    const-string/jumbo v1, "Ensuring minimum pooled connections to %s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-object v4, p0, Lcom/mongodb/PooledConnectionProvider$1;->this$0:Lcom/mongodb/PooledConnectionProvider;

    invoke-static {v4}, Lcom/mongodb/PooledConnectionProvider;->access$200(Lcom/mongodb/PooledConnectionProvider;)Lcom/mongodb/ServerAddress;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 132
    iget-object v0, p0, Lcom/mongodb/PooledConnectionProvider$1;->this$0:Lcom/mongodb/PooledConnectionProvider;

    invoke-static {v0}, Lcom/mongodb/PooledConnectionProvider;->access$400(Lcom/mongodb/PooledConnectionProvider;)Lcom/mongodb/ConcurrentPool;

    move-result-object v0

    iget-object v1, p0, Lcom/mongodb/PooledConnectionProvider$1;->this$0:Lcom/mongodb/PooledConnectionProvider;

    invoke-static {v1}, Lcom/mongodb/PooledConnectionProvider;->access$600(Lcom/mongodb/PooledConnectionProvider;)Lcom/mongodb/ConnectionPoolSettings;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mongodb/ConnectionPoolSettings;->getMinSize()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/mongodb/ConcurrentPool;->ensureMinSize(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 134
    :cond_1
    monitor-exit p0

    return-void

    .line 126
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
