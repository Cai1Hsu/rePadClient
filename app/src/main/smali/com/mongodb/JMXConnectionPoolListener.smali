.class Lcom/mongodb/JMXConnectionPoolListener;
.super Ljava/lang/Object;
.source "JMXConnectionPoolListener.java"

# interfaces
.implements Lcom/mongodb/ConnectionPoolListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mongodb/JMXConnectionPoolListener$1;,
        Lcom/mongodb/JMXConnectionPoolListener$ClusterIdServerAddressPair;
    }
.end annotation


# instance fields
.field private final clusterDescription:Ljava/lang/String;

.field private final map:Ljava/util/concurrent/ConcurrentMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentMap",
            "<",
            "Lcom/mongodb/JMXConnectionPoolListener$ClusterIdServerAddressPair;",
            "Lcom/mongodb/ConnectionPoolStatistics;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "clusterDescription"    # Ljava/lang/String;

    .prologue
    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lcom/mongodb/JMXConnectionPoolListener;->map:Ljava/util/concurrent/ConcurrentMap;

    .line 35
    iput-object p1, p0, Lcom/mongodb/JMXConnectionPoolListener;->clusterDescription:Ljava/lang/String;

    .line 36
    return-void
.end method

.method private getStatistics(Lcom/mongodb/ConnectionPoolEvent;)Lcom/mongodb/ConnectionPoolListener;
    .locals 2
    .param p1, "event"    # Lcom/mongodb/ConnectionPoolEvent;

    .prologue
    .line 123
    invoke-virtual {p1}, Lcom/mongodb/ConnectionPoolEvent;->getClusterId()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lcom/mongodb/ConnectionPoolEvent;->getServerAddress()Lcom/mongodb/ServerAddress;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/mongodb/JMXConnectionPoolListener;->getStatistics(Ljava/lang/String;Lcom/mongodb/ServerAddress;)Lcom/mongodb/ConnectionPoolStatistics;

    move-result-object v0

    return-object v0
.end method

.method private getStatistics(Lcom/mongodb/ConnectionEvent;)Lcom/mongodb/ConnectionPoolStatistics;
    .locals 2
    .param p1, "event"    # Lcom/mongodb/ConnectionEvent;

    .prologue
    .line 119
    invoke-virtual {p1}, Lcom/mongodb/ConnectionEvent;->getClusterId()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lcom/mongodb/ConnectionEvent;->getServerAddress()Lcom/mongodb/ServerAddress;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/mongodb/JMXConnectionPoolListener;->getStatistics(Ljava/lang/String;Lcom/mongodb/ServerAddress;)Lcom/mongodb/ConnectionPoolStatistics;

    move-result-object v0

    return-object v0
.end method

.method private getStatistics(Ljava/lang/String;Lcom/mongodb/ServerAddress;)Lcom/mongodb/ConnectionPoolStatistics;
    .locals 3
    .param p1, "clusterId"    # Ljava/lang/String;
    .param p2, "serverAddress"    # Lcom/mongodb/ServerAddress;

    .prologue
    .line 127
    iget-object v0, p0, Lcom/mongodb/JMXConnectionPoolListener;->map:Ljava/util/concurrent/ConcurrentMap;

    new-instance v1, Lcom/mongodb/JMXConnectionPoolListener$ClusterIdServerAddressPair;

    const/4 v2, 0x0

    invoke-direct {v1, p1, p2, v2}, Lcom/mongodb/JMXConnectionPoolListener$ClusterIdServerAddressPair;-><init>(Ljava/lang/String;Lcom/mongodb/ServerAddress;Lcom/mongodb/JMXConnectionPoolListener$1;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ConcurrentMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mongodb/ConnectionPoolStatistics;

    return-object v0
.end method


# virtual methods
.method public connectionAdded(Lcom/mongodb/ConnectionEvent;)V
    .locals 1
    .param p1, "event"    # Lcom/mongodb/ConnectionEvent;

    .prologue
    .line 104
    invoke-direct {p0, p1}, Lcom/mongodb/JMXConnectionPoolListener;->getStatistics(Lcom/mongodb/ConnectionEvent;)Lcom/mongodb/ConnectionPoolStatistics;

    move-result-object v0

    .line 105
    .local v0, "statistics":Lcom/mongodb/ConnectionPoolStatistics;
    if-eqz v0, :cond_0

    .line 106
    invoke-virtual {v0, p1}, Lcom/mongodb/ConnectionPoolStatistics;->connectionAdded(Lcom/mongodb/ConnectionEvent;)V

    .line 108
    :cond_0
    return-void
.end method

.method public connectionCheckedIn(Lcom/mongodb/ConnectionEvent;)V
    .locals 1
    .param p1, "event"    # Lcom/mongodb/ConnectionEvent;

    .prologue
    .line 81
    invoke-direct {p0, p1}, Lcom/mongodb/JMXConnectionPoolListener;->getStatistics(Lcom/mongodb/ConnectionEvent;)Lcom/mongodb/ConnectionPoolStatistics;

    move-result-object v0

    .line 82
    .local v0, "statistics":Lcom/mongodb/ConnectionPoolStatistics;
    if-eqz v0, :cond_0

    .line 83
    invoke-virtual {v0, p1}, Lcom/mongodb/ConnectionPoolStatistics;->connectionCheckedIn(Lcom/mongodb/ConnectionEvent;)V

    .line 85
    :cond_0
    return-void
.end method

.method public connectionCheckedOut(Lcom/mongodb/ConnectionEvent;)V
    .locals 1
    .param p1, "event"    # Lcom/mongodb/ConnectionEvent;

    .prologue
    .line 73
    invoke-direct {p0, p1}, Lcom/mongodb/JMXConnectionPoolListener;->getStatistics(Lcom/mongodb/ConnectionEvent;)Lcom/mongodb/ConnectionPoolStatistics;

    move-result-object v0

    .line 74
    .local v0, "statistics":Lcom/mongodb/ConnectionPoolStatistics;
    if-eqz v0, :cond_0

    .line 75
    invoke-virtual {v0, p1}, Lcom/mongodb/ConnectionPoolStatistics;->connectionCheckedOut(Lcom/mongodb/ConnectionEvent;)V

    .line 77
    :cond_0
    return-void
.end method

.method public connectionPoolClosed(Lcom/mongodb/ConnectionPoolEvent;)V
    .locals 5
    .param p1, "event"    # Lcom/mongodb/ConnectionPoolEvent;

    .prologue
    .line 67
    iget-object v0, p0, Lcom/mongodb/JMXConnectionPoolListener;->map:Ljava/util/concurrent/ConcurrentMap;

    new-instance v1, Lcom/mongodb/JMXConnectionPoolListener$ClusterIdServerAddressPair;

    invoke-virtual {p1}, Lcom/mongodb/ConnectionPoolEvent;->getClusterId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Lcom/mongodb/ConnectionPoolEvent;->getServerAddress()Lcom/mongodb/ServerAddress;

    move-result-object v3

    const/4 v4, 0x0

    invoke-direct {v1, v2, v3, v4}, Lcom/mongodb/JMXConnectionPoolListener$ClusterIdServerAddressPair;-><init>(Ljava/lang/String;Lcom/mongodb/ServerAddress;Lcom/mongodb/JMXConnectionPoolListener$1;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ConcurrentMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 68
    invoke-static {}, Lcom/mongodb/util/management/MBeanServerFactory;->getMBeanServer()Lcom/mongodb/util/management/MBeanServer;

    move-result-object v0

    invoke-virtual {p1}, Lcom/mongodb/ConnectionPoolEvent;->getClusterId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/mongodb/ConnectionPoolEvent;->getServerAddress()Lcom/mongodb/ServerAddress;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lcom/mongodb/JMXConnectionPoolListener;->getMBeanObjectName(Ljava/lang/String;Lcom/mongodb/ServerAddress;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/mongodb/util/management/MBeanServer;->unregisterMBean(Ljava/lang/String;)V

    .line 69
    return-void
.end method

.method public connectionPoolOpened(Lcom/mongodb/ConnectionPoolOpenedEvent;)V
    .locals 6
    .param p1, "event"    # Lcom/mongodb/ConnectionPoolOpenedEvent;

    .prologue
    .line 60
    new-instance v0, Lcom/mongodb/ConnectionPoolStatistics;

    invoke-direct {v0, p1}, Lcom/mongodb/ConnectionPoolStatistics;-><init>(Lcom/mongodb/ConnectionPoolOpenedEvent;)V

    .line 61
    .local v0, "statistics":Lcom/mongodb/ConnectionPoolStatistics;
    iget-object v1, p0, Lcom/mongodb/JMXConnectionPoolListener;->map:Ljava/util/concurrent/ConcurrentMap;

    new-instance v2, Lcom/mongodb/JMXConnectionPoolListener$ClusterIdServerAddressPair;

    invoke-virtual {p1}, Lcom/mongodb/ConnectionPoolOpenedEvent;->getClusterId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1}, Lcom/mongodb/ConnectionPoolOpenedEvent;->getServerAddress()Lcom/mongodb/ServerAddress;

    move-result-object v4

    const/4 v5, 0x0

    invoke-direct {v2, v3, v4, v5}, Lcom/mongodb/JMXConnectionPoolListener$ClusterIdServerAddressPair;-><init>(Ljava/lang/String;Lcom/mongodb/ServerAddress;Lcom/mongodb/JMXConnectionPoolListener$1;)V

    invoke-interface {v1, v2, v0}, Ljava/util/concurrent/ConcurrentMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 62
    invoke-static {}, Lcom/mongodb/util/management/MBeanServerFactory;->getMBeanServer()Lcom/mongodb/util/management/MBeanServer;

    move-result-object v1

    invoke-virtual {p1}, Lcom/mongodb/ConnectionPoolOpenedEvent;->getClusterId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Lcom/mongodb/ConnectionPoolOpenedEvent;->getServerAddress()Lcom/mongodb/ServerAddress;

    move-result-object v3

    invoke-virtual {p0, v2, v3}, Lcom/mongodb/JMXConnectionPoolListener;->getMBeanObjectName(Ljava/lang/String;Lcom/mongodb/ServerAddress;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v0, v2}, Lcom/mongodb/util/management/MBeanServer;->registerMBean(Ljava/lang/Object;Ljava/lang/String;)V

    .line 63
    return-void
.end method

.method public connectionRemoved(Lcom/mongodb/ConnectionEvent;)V
    .locals 1
    .param p1, "event"    # Lcom/mongodb/ConnectionEvent;

    .prologue
    .line 112
    invoke-direct {p0, p1}, Lcom/mongodb/JMXConnectionPoolListener;->getStatistics(Lcom/mongodb/ConnectionEvent;)Lcom/mongodb/ConnectionPoolStatistics;

    move-result-object v0

    .line 113
    .local v0, "statistics":Lcom/mongodb/ConnectionPoolStatistics;
    if-eqz v0, :cond_0

    .line 114
    invoke-virtual {v0, p1}, Lcom/mongodb/ConnectionPoolStatistics;->connectionRemoved(Lcom/mongodb/ConnectionEvent;)V

    .line 116
    :cond_0
    return-void
.end method

.method public getMBean(Ljava/lang/String;Lcom/mongodb/ServerAddress;)Lcom/mongodb/ConnectionPoolStatisticsMBean;
    .locals 1
    .param p1, "clusterId"    # Ljava/lang/String;
    .param p2, "serverAddress"    # Lcom/mongodb/ServerAddress;

    .prologue
    .line 55
    invoke-direct {p0, p1, p2}, Lcom/mongodb/JMXConnectionPoolListener;->getStatistics(Ljava/lang/String;Lcom/mongodb/ServerAddress;)Lcom/mongodb/ConnectionPoolStatistics;

    move-result-object v0

    return-object v0
.end method

.method public getMBeanObjectName(Ljava/lang/String;Lcom/mongodb/ServerAddress;)Ljava/lang/String;
    .locals 10
    .param p1, "clusterId"    # Ljava/lang/String;
    .param p2, "serverAddress"    # Lcom/mongodb/ServerAddress;

    .prologue
    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 41
    const-string/jumbo v4, ":"

    const-string/jumbo v5, "%3A"

    invoke-virtual {p1, v4, v5}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    .line 42
    .local v1, "adjustedClusterId":Ljava/lang/String;
    invoke-virtual {p2}, Lcom/mongodb/ServerAddress;->getHost()Ljava/lang/String;

    move-result-object v4

    const-string/jumbo v5, ":"

    const-string/jumbo v6, "%3A"

    invoke-virtual {v4, v5, v6}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v2

    .line 44
    .local v2, "adjustedHost":Ljava/lang/String;
    const-string/jumbo v4, "org.mongodb.driver:type=ConnectionPool,clusterId=%s,host=%s,port=%s"

    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/Object;

    aput-object v1, v5, v8

    aput-object v2, v5, v9

    const/4 v6, 0x2

    invoke-virtual {p2}, Lcom/mongodb/ServerAddress;->getPort()I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    .line 46
    .local v3, "objectName":Ljava/lang/String;
    iget-object v4, p0, Lcom/mongodb/JMXConnectionPoolListener;->clusterDescription:Ljava/lang/String;

    if-eqz v4, :cond_0

    .line 47
    iget-object v4, p0, Lcom/mongodb/JMXConnectionPoolListener;->clusterDescription:Ljava/lang/String;

    const-string/jumbo v5, ":"

    const-string/jumbo v6, "%3A"

    invoke-virtual {v4, v5, v6}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    .line 48
    .local v0, "adjustedClusterDescription":Ljava/lang/String;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, ",description=%s"

    new-array v6, v9, [Ljava/lang/Object;

    aput-object v0, v6, v8

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 51
    .end local v0    # "adjustedClusterDescription":Ljava/lang/String;
    :cond_0
    return-object v3
.end method

.method public waitQueueEntered(Lcom/mongodb/ConnectionPoolWaitQueueEvent;)V
    .locals 1
    .param p1, "event"    # Lcom/mongodb/ConnectionPoolWaitQueueEvent;

    .prologue
    .line 89
    invoke-direct {p0, p1}, Lcom/mongodb/JMXConnectionPoolListener;->getStatistics(Lcom/mongodb/ConnectionPoolEvent;)Lcom/mongodb/ConnectionPoolListener;

    move-result-object v0

    .line 90
    .local v0, "statistics":Lcom/mongodb/ConnectionPoolListener;
    if-eqz v0, :cond_0

    .line 91
    invoke-interface {v0, p1}, Lcom/mongodb/ConnectionPoolListener;->waitQueueEntered(Lcom/mongodb/ConnectionPoolWaitQueueEvent;)V

    .line 93
    :cond_0
    return-void
.end method

.method public waitQueueExited(Lcom/mongodb/ConnectionPoolWaitQueueEvent;)V
    .locals 1
    .param p1, "event"    # Lcom/mongodb/ConnectionPoolWaitQueueEvent;

    .prologue
    .line 97
    invoke-direct {p0, p1}, Lcom/mongodb/JMXConnectionPoolListener;->getStatistics(Lcom/mongodb/ConnectionPoolEvent;)Lcom/mongodb/ConnectionPoolListener;

    move-result-object v0

    .line 98
    .local v0, "statistics":Lcom/mongodb/ConnectionPoolListener;
    if-eqz v0, :cond_0

    .line 99
    invoke-interface {v0, p1}, Lcom/mongodb/ConnectionPoolListener;->waitQueueExited(Lcom/mongodb/ConnectionPoolWaitQueueEvent;)V

    .line 101
    :cond_0
    return-void
.end method
