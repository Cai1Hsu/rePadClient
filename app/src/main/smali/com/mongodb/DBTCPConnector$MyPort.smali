.class Lcom/mongodb/DBTCPConnector$MyPort;
.super Ljava/lang/Object;
.source "DBTCPConnector.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mongodb/DBTCPConnector;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "MyPort"
.end annotation


# instance fields
.field private final pinnedRequestStatusThreadLocal:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal",
            "<",
            "Lcom/mongodb/DBTCPConnector$PinnedRequestStatus;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/mongodb/DBTCPConnector;


# direct methods
.method constructor <init>(Lcom/mongodb/DBTCPConnector;)V
    .locals 1

    .prologue
    .line 422
    iput-object p1, p0, Lcom/mongodb/DBTCPConnector$MyPort;->this$0:Lcom/mongodb/DBTCPConnector;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 546
    new-instance v0, Ljava/lang/ThreadLocal;

    invoke-direct {v0}, Ljava/lang/ThreadLocal;-><init>()V

    iput-object v0, p0, Lcom/mongodb/DBTCPConnector$MyPort;->pinnedRequestStatusThreadLocal:Ljava/lang/ThreadLocal;

    return-void
.end method

.method private getConnection(Lcom/mongodb/ServerSelector;)Lcom/mongodb/DBPort;
    .locals 4
    .param p1, "serverSelector"    # Lcom/mongodb/ServerSelector;

    .prologue
    .line 503
    iget-object v0, p0, Lcom/mongodb/DBTCPConnector$MyPort;->this$0:Lcom/mongodb/DBTCPConnector;

    invoke-static {v0, p1}, Lcom/mongodb/DBTCPConnector;->access$300(Lcom/mongodb/DBTCPConnector;Lcom/mongodb/ServerSelector;)Lcom/mongodb/Server;

    move-result-object v0

    iget-object v1, p0, Lcom/mongodb/DBTCPConnector$MyPort;->this$0:Lcom/mongodb/DBTCPConnector;

    invoke-static {v1}, Lcom/mongodb/DBTCPConnector;->access$400(Lcom/mongodb/DBTCPConnector;)I

    move-result v1

    int-to-long v2, v1

    sget-object v1, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v0, v2, v3, v1}, Lcom/mongodb/Server;->getConnection(JLjava/util/concurrent/TimeUnit;)Lcom/mongodb/Connection;

    move-result-object v0

    check-cast v0, Lcom/mongodb/DBPort;

    return-object v0
.end method

.method private portIsAPrimary(Lcom/mongodb/DBPort;)Z
    .locals 4
    .param p1, "pinnedRequestPort"    # Lcom/mongodb/DBPort;

    .prologue
    .line 462
    iget-object v2, p0, Lcom/mongodb/DBTCPConnector$MyPort;->this$0:Lcom/mongodb/DBTCPConnector;

    invoke-static {v2}, Lcom/mongodb/DBTCPConnector;->access$200(Lcom/mongodb/DBTCPConnector;)Lcom/mongodb/ClusterDescription;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mongodb/ClusterDescription;->getPrimaries()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mongodb/ServerDescription;

    .line 463
    .local v0, "cur":Lcom/mongodb/ServerDescription;
    invoke-virtual {v0}, Lcom/mongodb/ServerDescription;->getAddress()Lcom/mongodb/ServerAddress;

    move-result-object v2

    invoke-virtual {p1}, Lcom/mongodb/DBPort;->serverAddress()Lcom/mongodb/ServerAddress;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/mongodb/ServerAddress;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 464
    const/4 v2, 0x1

    .line 467
    .end local v0    # "cur":Lcom/mongodb/ServerDescription;
    :goto_0
    return v2

    :cond_1
    const/4 v2, 0x0

    goto :goto_0
.end method


# virtual methods
.method done(Lcom/mongodb/DBPort;)V
    .locals 2
    .param p1, "port"    # Lcom/mongodb/DBPort;

    .prologue
    .line 471
    invoke-virtual {p0}, Lcom/mongodb/DBTCPConnector$MyPort;->getPinnedRequestPortForThread()Lcom/mongodb/DBPort;

    move-result-object v0

    .line 474
    .local v0, "requestPort":Lcom/mongodb/Connection;
    if-eq p1, v0, :cond_0

    .line 475
    invoke-virtual {p1}, Lcom/mongodb/DBPort;->getProvider()Lcom/mongodb/PooledConnectionProvider;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/mongodb/PooledConnectionProvider;->release(Lcom/mongodb/Connection;)V

    .line 477
    :cond_0
    return-void
.end method

.method error(Lcom/mongodb/DBPort;Ljava/lang/Exception;)V
    .locals 3
    .param p1, "port"    # Lcom/mongodb/DBPort;
    .param p2, "e"    # Ljava/lang/Exception;

    .prologue
    .line 485
    instance-of v0, p2, Ljava/io/InterruptedIOException;

    if-nez v0, :cond_0

    .line 486
    iget-object v0, p0, Lcom/mongodb/DBTCPConnector$MyPort;->this$0:Lcom/mongodb/DBTCPConnector;

    new-instance v1, Lcom/mongodb/ServerAddressSelector;

    invoke-virtual {p1}, Lcom/mongodb/DBPort;->getAddress()Lcom/mongodb/ServerAddress;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/mongodb/ServerAddressSelector;-><init>(Lcom/mongodb/ServerAddress;)V

    invoke-static {v0, v1}, Lcom/mongodb/DBTCPConnector;->access$300(Lcom/mongodb/DBTCPConnector;Lcom/mongodb/ServerSelector;)Lcom/mongodb/Server;

    move-result-object v0

    invoke-interface {v0}, Lcom/mongodb/Server;->invalidate()V

    .line 488
    :cond_0
    invoke-virtual {p1}, Lcom/mongodb/DBPort;->close()V

    .line 489
    iget-object v0, p0, Lcom/mongodb/DBTCPConnector$MyPort;->pinnedRequestStatusThreadLocal:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->remove()V

    .line 490
    return-void
.end method

.method get(ZLcom/mongodb/ReadPreference;Lcom/mongodb/ServerAddress;)Lcom/mongodb/DBPort;
    .locals 3
    .param p1, "keep"    # Z
    .param p2, "readPref"    # Lcom/mongodb/ReadPreference;
    .param p3, "hostNeeded"    # Lcom/mongodb/ServerAddress;

    .prologue
    .line 426
    invoke-virtual {p0}, Lcom/mongodb/DBTCPConnector$MyPort;->getPinnedRequestPortForThread()Lcom/mongodb/DBPort;

    move-result-object v0

    .line 428
    .local v0, "pinnedRequestPort":Lcom/mongodb/DBPort;
    if-eqz p3, :cond_2

    .line 429
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/mongodb/DBPort;->serverAddress()Lcom/mongodb/ServerAddress;

    move-result-object v2

    invoke-virtual {v2, p3}, Lcom/mongodb/ServerAddress;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 458
    .end local v0    # "pinnedRequestPort":Lcom/mongodb/DBPort;
    :cond_0
    :goto_0
    return-object v0

    .line 434
    .restart local v0    # "pinnedRequestPort":Lcom/mongodb/DBPort;
    :cond_1
    new-instance v2, Lcom/mongodb/ServerAddressSelector;

    invoke-direct {v2, p3}, Lcom/mongodb/ServerAddressSelector;-><init>(Lcom/mongodb/ServerAddress;)V

    invoke-direct {p0, v2}, Lcom/mongodb/DBTCPConnector$MyPort;->getConnection(Lcom/mongodb/ServerSelector;)Lcom/mongodb/DBPort;

    move-result-object v0

    goto :goto_0

    .line 437
    :cond_2
    if-eqz v0, :cond_3

    .line 439
    invoke-direct {p0, v0}, Lcom/mongodb/DBTCPConnector$MyPort;->portIsAPrimary(Lcom/mongodb/DBPort;)Z

    move-result v2

    if-nez v2, :cond_0

    if-eqz p1, :cond_0

    .line 447
    invoke-virtual {v0}, Lcom/mongodb/DBPort;->getProvider()Lcom/mongodb/PooledConnectionProvider;

    move-result-object v2

    invoke-virtual {v2, v0}, Lcom/mongodb/PooledConnectionProvider;->release(Lcom/mongodb/Connection;)V

    .line 448
    const/4 v2, 0x0

    invoke-virtual {p0, v2}, Lcom/mongodb/DBTCPConnector$MyPort;->setPinnedRequestPortForThread(Lcom/mongodb/DBPort;)V

    .line 451
    :cond_3
    iget-object v2, p0, Lcom/mongodb/DBTCPConnector$MyPort;->this$0:Lcom/mongodb/DBTCPConnector;

    invoke-static {v2, p2}, Lcom/mongodb/DBTCPConnector;->access$100(Lcom/mongodb/DBTCPConnector;Lcom/mongodb/ReadPreference;)Lcom/mongodb/ServerSelector;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/mongodb/DBTCPConnector$MyPort;->getConnection(Lcom/mongodb/ServerSelector;)Lcom/mongodb/DBPort;

    move-result-object v1

    .line 454
    .local v1, "port":Lcom/mongodb/DBPort;
    invoke-virtual {p0}, Lcom/mongodb/DBTCPConnector$MyPort;->threadHasPinnedRequest()Z

    move-result v2

    if-eqz v2, :cond_4

    .line 455
    invoke-virtual {p0, v1}, Lcom/mongodb/DBTCPConnector$MyPort;->setPinnedRequestPortForThread(Lcom/mongodb/DBPort;)V

    :cond_4
    move-object v0, v1

    .line 458
    goto :goto_0
.end method

.method getPinnedRequestPortForThread()Lcom/mongodb/DBPort;
    .locals 1

    .prologue
    .line 539
    invoke-virtual {p0}, Lcom/mongodb/DBTCPConnector$MyPort;->threadHasPinnedRequest()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mongodb/DBTCPConnector$MyPort;->pinnedRequestStatusThreadLocal:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mongodb/DBTCPConnector$PinnedRequestStatus;

    iget-object v0, v0, Lcom/mongodb/DBTCPConnector$PinnedRequestStatus;->requestPort:Lcom/mongodb/DBPort;

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method getPinnedRequestStatusForThread()Lcom/mongodb/DBTCPConnector$PinnedRequestStatus;
    .locals 1

    .prologue
    .line 531
    iget-object v0, p0, Lcom/mongodb/DBTCPConnector$MyPort;->pinnedRequestStatusThreadLocal:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mongodb/DBTCPConnector$PinnedRequestStatus;

    return-object v0
.end method

.method requestDone()V
    .locals 3

    .prologue
    .line 517
    invoke-virtual {p0}, Lcom/mongodb/DBTCPConnector$MyPort;->getPinnedRequestStatusForThread()Lcom/mongodb/DBTCPConnector$PinnedRequestStatus;

    move-result-object v0

    .line 518
    .local v0, "current":Lcom/mongodb/DBTCPConnector$PinnedRequestStatus;
    if-eqz v0, :cond_0

    .line 519
    iget v1, v0, Lcom/mongodb/DBTCPConnector$PinnedRequestStatus;->nestedBindings:I

    if-lez v1, :cond_1

    .line 520
    iget v1, v0, Lcom/mongodb/DBTCPConnector$PinnedRequestStatus;->nestedBindings:I

    add-int/lit8 v1, v1, -0x1

    iput v1, v0, Lcom/mongodb/DBTCPConnector$PinnedRequestStatus;->nestedBindings:I

    .line 528
    :cond_0
    :goto_0
    return-void

    .line 523
    :cond_1
    iget-object v1, p0, Lcom/mongodb/DBTCPConnector$MyPort;->pinnedRequestStatusThreadLocal:Ljava/lang/ThreadLocal;

    invoke-virtual {v1}, Ljava/lang/ThreadLocal;->remove()V

    .line 524
    iget-object v1, v0, Lcom/mongodb/DBTCPConnector$PinnedRequestStatus;->requestPort:Lcom/mongodb/DBPort;

    if-eqz v1, :cond_0

    .line 525
    iget-object v1, v0, Lcom/mongodb/DBTCPConnector$PinnedRequestStatus;->requestPort:Lcom/mongodb/DBPort;

    invoke-virtual {v1}, Lcom/mongodb/DBPort;->getProvider()Lcom/mongodb/PooledConnectionProvider;

    move-result-object v1

    iget-object v2, v0, Lcom/mongodb/DBTCPConnector$PinnedRequestStatus;->requestPort:Lcom/mongodb/DBPort;

    invoke-virtual {v1, v2}, Lcom/mongodb/PooledConnectionProvider;->release(Lcom/mongodb/Connection;)V

    goto :goto_0
.end method

.method requestEnsureConnection()V
    .locals 2

    .prologue
    .line 493
    invoke-virtual {p0}, Lcom/mongodb/DBTCPConnector$MyPort;->threadHasPinnedRequest()Z

    move-result v0

    if-nez v0, :cond_1

    .line 500
    :cond_0
    :goto_0
    return-void

    .line 496
    :cond_1
    invoke-virtual {p0}, Lcom/mongodb/DBTCPConnector$MyPort;->getPinnedRequestPortForThread()Lcom/mongodb/DBPort;

    move-result-object v0

    if-nez v0, :cond_0

    .line 499
    iget-object v0, p0, Lcom/mongodb/DBTCPConnector$MyPort;->this$0:Lcom/mongodb/DBTCPConnector;

    invoke-static {}, Lcom/mongodb/ReadPreference;->primary()Lcom/mongodb/ReadPreference;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mongodb/DBTCPConnector;->access$100(Lcom/mongodb/DBTCPConnector;Lcom/mongodb/ReadPreference;)Lcom/mongodb/ServerSelector;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/mongodb/DBTCPConnector$MyPort;->getConnection(Lcom/mongodb/ServerSelector;)Lcom/mongodb/DBPort;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/mongodb/DBTCPConnector$MyPort;->setPinnedRequestPortForThread(Lcom/mongodb/DBPort;)V

    goto :goto_0
.end method

.method requestStart()V
    .locals 3

    .prologue
    .line 507
    invoke-virtual {p0}, Lcom/mongodb/DBTCPConnector$MyPort;->getPinnedRequestStatusForThread()Lcom/mongodb/DBTCPConnector$PinnedRequestStatus;

    move-result-object v0

    .line 508
    .local v0, "current":Lcom/mongodb/DBTCPConnector$PinnedRequestStatus;
    if-nez v0, :cond_0

    .line 509
    iget-object v1, p0, Lcom/mongodb/DBTCPConnector$MyPort;->pinnedRequestStatusThreadLocal:Ljava/lang/ThreadLocal;

    new-instance v2, Lcom/mongodb/DBTCPConnector$PinnedRequestStatus;

    invoke-direct {v2}, Lcom/mongodb/DBTCPConnector$PinnedRequestStatus;-><init>()V

    invoke-virtual {v1, v2}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    .line 514
    :goto_0
    return-void

    .line 512
    :cond_0
    iget v1, v0, Lcom/mongodb/DBTCPConnector$PinnedRequestStatus;->nestedBindings:I

    add-int/lit8 v1, v1, 0x1

    iput v1, v0, Lcom/mongodb/DBTCPConnector$PinnedRequestStatus;->nestedBindings:I

    goto :goto_0
.end method

.method setPinnedRequestPortForThread(Lcom/mongodb/DBPort;)V
    .locals 1
    .param p1, "port"    # Lcom/mongodb/DBPort;

    .prologue
    .line 543
    iget-object v0, p0, Lcom/mongodb/DBTCPConnector$MyPort;->pinnedRequestStatusThreadLocal:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mongodb/DBTCPConnector$PinnedRequestStatus;

    iput-object p1, v0, Lcom/mongodb/DBTCPConnector$PinnedRequestStatus;->requestPort:Lcom/mongodb/DBPort;

    .line 544
    return-void
.end method

.method threadHasPinnedRequest()Z
    .locals 1

    .prologue
    .line 535
    iget-object v0, p0, Lcom/mongodb/DBTCPConnector$MyPort;->pinnedRequestStatusThreadLocal:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
