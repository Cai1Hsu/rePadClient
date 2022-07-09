.class public Lcom/mongodb/DBTCPConnector;
.super Ljava/lang/Object;
.source "DBTCPConnector.java"

# interfaces
.implements Lcom/mongodb/DBConnector;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mongodb/DBTCPConnector$PinnedRequestStatus;,
        Lcom/mongodb/DBTCPConnector$MyPort;
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field private static final NEXT_CLUSTER_ID:Ljava/util/concurrent/atomic/AtomicInteger;


# instance fields
.field private volatile _closed:Z

.field private final _mongo:Lcom/mongodb/Mongo;

.field private final _myPort:Lcom/mongodb/DBTCPConnector$MyPort;

.field private cluster:Lcom/mongodb/Cluster;

.field private final connectionMode:Lcom/mongodb/ClusterConnectionMode;

.field private mongosHAServerSelector:Lcom/mongodb/MongosHAServerSelector;

.field private type:Lcom/mongodb/ClusterType;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 41
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    sput-object v0, Lcom/mongodb/DBTCPConnector;->NEXT_CLUSTER_ID:Ljava/util/concurrent/atomic/AtomicInteger;

    return-void
.end method

.method public constructor <init>(Lcom/mongodb/Mongo;)V
    .locals 2
    .param p1, "mongo"    # Lcom/mongodb/Mongo;

    .prologue
    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    new-instance v0, Lcom/mongodb/DBTCPConnector$MyPort;

    invoke-direct {v0, p0}, Lcom/mongodb/DBTCPConnector$MyPort;-><init>(Lcom/mongodb/DBTCPConnector;)V

    iput-object v0, p0, Lcom/mongodb/DBTCPConnector;->_myPort:Lcom/mongodb/DBTCPConnector$MyPort;

    .line 53
    sget-object v0, Lcom/mongodb/ClusterType;->Unknown:Lcom/mongodb/ClusterType;

    iput-object v0, p0, Lcom/mongodb/DBTCPConnector;->type:Lcom/mongodb/ClusterType;

    .line 61
    iput-object p1, p0, Lcom/mongodb/DBTCPConnector;->_mongo:Lcom/mongodb/Mongo;

    .line 62
    iget-object v0, p0, Lcom/mongodb/DBTCPConnector;->_mongo:Lcom/mongodb/Mongo;

    invoke-virtual {v0}, Lcom/mongodb/Mongo;->getAuthority()Lcom/mongodb/MongoAuthority;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mongodb/MongoAuthority;->getType()Lcom/mongodb/MongoAuthority$Type;

    move-result-object v0

    sget-object v1, Lcom/mongodb/MongoAuthority$Type;->Set:Lcom/mongodb/MongoAuthority$Type;

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/mongodb/DBTCPConnector;->_mongo:Lcom/mongodb/Mongo;

    invoke-virtual {v0}, Lcom/mongodb/Mongo;->getMongoOptions()Lcom/mongodb/MongoOptions;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mongodb/MongoOptions;->getRequiredReplicaSetName()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    :cond_0
    sget-object v0, Lcom/mongodb/ClusterConnectionMode;->Multiple:Lcom/mongodb/ClusterConnectionMode;

    :goto_0
    iput-object v0, p0, Lcom/mongodb/DBTCPConnector;->connectionMode:Lcom/mongodb/ClusterConnectionMode;

    .line 64
    return-void

    .line 62
    :cond_1
    sget-object v0, Lcom/mongodb/ClusterConnectionMode;->Single:Lcom/mongodb/ClusterConnectionMode;

    goto :goto_0
.end method

.method private _checkWriteError(Lcom/mongodb/DB;Lcom/mongodb/DBPort;Lcom/mongodb/WriteConcern;)Lcom/mongodb/WriteResult;
    .locals 2
    .param p1, "db"    # Lcom/mongodb/DB;
    .param p2, "port"    # Lcom/mongodb/DBPort;
    .param p3, "concern"    # Lcom/mongodb/WriteConcern;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 133
    invoke-virtual {p3}, Lcom/mongodb/WriteConcern;->getCommand()Lcom/mongodb/BasicDBObject;

    move-result-object v1

    invoke-virtual {p2, p1, v1}, Lcom/mongodb/DBPort;->runCommand(Lcom/mongodb/DB;Lcom/mongodb/DBObject;)Lcom/mongodb/CommandResult;

    move-result-object v0

    .line 135
    .local v0, "e":Lcom/mongodb/CommandResult;
    invoke-virtual {v0}, Lcom/mongodb/CommandResult;->throwOnError()V

    .line 136
    new-instance v1, Lcom/mongodb/WriteResult;

    invoke-direct {v1, v0, p3}, Lcom/mongodb/WriteResult;-><init>(Lcom/mongodb/CommandResult;Lcom/mongodb/WriteConcern;)V

    return-object v1
.end method

.method static synthetic access$000(Lcom/mongodb/DBTCPConnector;Lcom/mongodb/DB;Lcom/mongodb/DBPort;Lcom/mongodb/WriteConcern;)Lcom/mongodb/WriteResult;
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/DBTCPConnector;
    .param p1, "x1"    # Lcom/mongodb/DB;
    .param p2, "x2"    # Lcom/mongodb/DBPort;
    .param p3, "x3"    # Lcom/mongodb/WriteConcern;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 39
    invoke-direct {p0, p1, p2, p3}, Lcom/mongodb/DBTCPConnector;->_checkWriteError(Lcom/mongodb/DB;Lcom/mongodb/DBPort;Lcom/mongodb/WriteConcern;)Lcom/mongodb/WriteResult;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$100(Lcom/mongodb/DBTCPConnector;Lcom/mongodb/ReadPreference;)Lcom/mongodb/ServerSelector;
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/DBTCPConnector;
    .param p1, "x1"    # Lcom/mongodb/ReadPreference;

    .prologue
    .line 39
    invoke-direct {p0, p1}, Lcom/mongodb/DBTCPConnector;->createServerSelector(Lcom/mongodb/ReadPreference;)Lcom/mongodb/ServerSelector;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$200(Lcom/mongodb/DBTCPConnector;)Lcom/mongodb/ClusterDescription;
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/DBTCPConnector;

    .prologue
    .line 39
    invoke-direct {p0}, Lcom/mongodb/DBTCPConnector;->getClusterDescription()Lcom/mongodb/ClusterDescription;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$300(Lcom/mongodb/DBTCPConnector;Lcom/mongodb/ServerSelector;)Lcom/mongodb/Server;
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/DBTCPConnector;
    .param p1, "x1"    # Lcom/mongodb/ServerSelector;

    .prologue
    .line 39
    invoke-direct {p0, p1}, Lcom/mongodb/DBTCPConnector;->getServer(Lcom/mongodb/ServerSelector;)Lcom/mongodb/Server;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$400(Lcom/mongodb/DBTCPConnector;)I
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/DBTCPConnector;

    .prologue
    .line 39
    invoke-direct {p0}, Lcom/mongodb/DBTCPConnector;->getConnectionWaitTimeMS()I

    move-result v0

    return v0
.end method

.method private createServerSelector(Lcom/mongodb/ReadPreference;)Lcom/mongodb/ServerSelector;
    .locals 5
    .param p1, "readPreference"    # Lcom/mongodb/ReadPreference;

    .prologue
    .line 550
    iget-object v1, p0, Lcom/mongodb/DBTCPConnector;->connectionMode:Lcom/mongodb/ClusterConnectionMode;

    sget-object v2, Lcom/mongodb/ClusterConnectionMode;->Multiple:Lcom/mongodb/ClusterConnectionMode;

    if-ne v1, v2, :cond_2

    .line 551
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 552
    .local v0, "serverSelectorList":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/ServerSelector;>;"
    invoke-direct {p0}, Lcom/mongodb/DBTCPConnector;->getType()Lcom/mongodb/ClusterType;

    move-result-object v1

    sget-object v2, Lcom/mongodb/ClusterType;->Sharded:Lcom/mongodb/ClusterType;

    if-ne v1, v2, :cond_0

    .line 553
    invoke-direct {p0}, Lcom/mongodb/DBTCPConnector;->getMongosHAServerSelector()Lcom/mongodb/MongosHAServerSelector;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 559
    :goto_0
    new-instance v1, Lcom/mongodb/LatencyMinimizingServerSelector;

    iget-object v2, p0, Lcom/mongodb/DBTCPConnector;->_mongo:Lcom/mongodb/Mongo;

    invoke-virtual {v2}, Lcom/mongodb/Mongo;->getMongoOptions()Lcom/mongodb/MongoOptions;

    move-result-object v2

    iget v2, v2, Lcom/mongodb/MongoOptions;->acceptableLatencyDifferenceMS:I

    int-to-long v2, v2

    sget-object v4, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-direct {v1, v2, v3, v4}, Lcom/mongodb/LatencyMinimizingServerSelector;-><init>(JLjava/util/concurrent/TimeUnit;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 561
    new-instance v1, Lcom/mongodb/CompositeServerSelector;

    invoke-direct {v1, v0}, Lcom/mongodb/CompositeServerSelector;-><init>(Ljava/util/List;)V

    .line 563
    .end local v0    # "serverSelectorList":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/ServerSelector;>;"
    :goto_1
    return-object v1

    .line 554
    .restart local v0    # "serverSelectorList":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/ServerSelector;>;"
    :cond_0
    invoke-direct {p0}, Lcom/mongodb/DBTCPConnector;->getType()Lcom/mongodb/ClusterType;

    move-result-object v1

    sget-object v2, Lcom/mongodb/ClusterType;->ReplicaSet:Lcom/mongodb/ClusterType;

    if-ne v1, v2, :cond_1

    .line 555
    new-instance v1, Lcom/mongodb/ReadPreferenceServerSelector;

    invoke-direct {v1, p1}, Lcom/mongodb/ReadPreferenceServerSelector;-><init>(Lcom/mongodb/ReadPreference;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 557
    :cond_1
    new-instance v1, Lcom/mongodb/AnyServerSelector;

    invoke-direct {v1}, Lcom/mongodb/AnyServerSelector;-><init>()V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 563
    .end local v0    # "serverSelectorList":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/ServerSelector;>;"
    :cond_2
    new-instance v1, Lcom/mongodb/AnyServerSelector;

    invoke-direct {v1}, Lcom/mongodb/AnyServerSelector;-><init>()V

    goto :goto_1
.end method

.method private getClusterDescription()Lcom/mongodb/ClusterDescription;
    .locals 4

    .prologue
    .line 396
    iget-object v0, p0, Lcom/mongodb/DBTCPConnector;->cluster:Lcom/mongodb/Cluster;

    invoke-direct {p0}, Lcom/mongodb/DBTCPConnector;->getClusterWaitTimeMS()I

    move-result v1

    int-to-long v2, v1

    sget-object v1, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v0, v2, v3, v1}, Lcom/mongodb/Cluster;->getDescription(JLjava/util/concurrent/TimeUnit;)Lcom/mongodb/ClusterDescription;

    move-result-object v0

    return-object v0
.end method

.method private getClusterWaitTimeMS()I
    .locals 2

    .prologue
    .line 400
    iget-object v0, p0, Lcom/mongodb/DBTCPConnector;->_mongo:Lcom/mongodb/Mongo;

    invoke-virtual {v0}, Lcom/mongodb/Mongo;->getMongoOptions()Lcom/mongodb/MongoOptions;

    move-result-object v0

    iget v0, v0, Lcom/mongodb/MongoOptions;->maxWaitTime:I

    iget-object v1, p0, Lcom/mongodb/DBTCPConnector;->_mongo:Lcom/mongodb/Mongo;

    invoke-virtual {v1}, Lcom/mongodb/Mongo;->getMongoOptions()Lcom/mongodb/MongoOptions;

    move-result-object v1

    iget v1, v1, Lcom/mongodb/MongoOptions;->connectTimeout:I

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    return v0
.end method

.method private getConnectionWaitTimeMS()I
    .locals 1

    .prologue
    .line 404
    iget-object v0, p0, Lcom/mongodb/DBTCPConnector;->_mongo:Lcom/mongodb/Mongo;

    invoke-virtual {v0}, Lcom/mongodb/Mongo;->getMongoOptions()Lcom/mongodb/MongoOptions;

    move-result-object v0

    iget v0, v0, Lcom/mongodb/MongoOptions;->maxWaitTime:I

    return v0
.end method

.method private declared-synchronized getMongosHAServerSelector()Lcom/mongodb/MongosHAServerSelector;
    .locals 1

    .prologue
    .line 576
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/mongodb/DBTCPConnector;->mongosHAServerSelector:Lcom/mongodb/MongosHAServerSelector;

    if-nez v0, :cond_0

    .line 577
    new-instance v0, Lcom/mongodb/MongosHAServerSelector;

    invoke-direct {v0}, Lcom/mongodb/MongosHAServerSelector;-><init>()V

    iput-object v0, p0, Lcom/mongodb/DBTCPConnector;->mongosHAServerSelector:Lcom/mongodb/MongosHAServerSelector;

    .line 579
    :cond_0
    iget-object v0, p0, Lcom/mongodb/DBTCPConnector;->mongosHAServerSelector:Lcom/mongodb/MongosHAServerSelector;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    .line 576
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private getServer(Lcom/mongodb/ServerSelector;)Lcom/mongodb/Server;
    .locals 4
    .param p1, "serverSelector"    # Lcom/mongodb/ServerSelector;

    .prologue
    .line 654
    iget-object v0, p0, Lcom/mongodb/DBTCPConnector;->cluster:Lcom/mongodb/Cluster;

    invoke-direct {p0}, Lcom/mongodb/DBTCPConnector;->getClusterWaitTimeMS()I

    move-result v1

    int-to-long v2, v1

    sget-object v1, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v0, p1, v2, v3, v1}, Lcom/mongodb/Cluster;->getServer(Lcom/mongodb/ServerSelector;JLjava/util/concurrent/TimeUnit;)Lcom/mongodb/Server;

    move-result-object v0

    return-object v0
.end method

.method private declared-synchronized getType()Lcom/mongodb/ClusterType;
    .locals 2

    .prologue
    .line 568
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/mongodb/DBTCPConnector;->type:Lcom/mongodb/ClusterType;

    sget-object v1, Lcom/mongodb/ClusterType;->Unknown:Lcom/mongodb/ClusterType;

    if-ne v0, v1, :cond_0

    .line 569
    invoke-direct {p0}, Lcom/mongodb/DBTCPConnector;->getClusterDescription()Lcom/mongodb/ClusterDescription;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mongodb/ClusterDescription;->getType()Lcom/mongodb/ClusterType;

    move-result-object v0

    iput-object v0, p0, Lcom/mongodb/DBTCPConnector;->type:Lcom/mongodb/ClusterType;

    .line 571
    :cond_0
    iget-object v0, p0, Lcom/mongodb/DBTCPConnector;->type:Lcom/mongodb/ClusterType;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    .line 568
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private innerCall(Lcom/mongodb/DB;Lcom/mongodb/DBCollection;Lcom/mongodb/OutMessage;Lcom/mongodb/ServerAddress;ILcom/mongodb/ReadPreference;Lcom/mongodb/DBDecoder;)Lcom/mongodb/Response;
    .locals 18
    .param p1, "db"    # Lcom/mongodb/DB;
    .param p2, "coll"    # Lcom/mongodb/DBCollection;
    .param p3, "m"    # Lcom/mongodb/OutMessage;
    .param p4, "hostNeeded"    # Lcom/mongodb/ServerAddress;
    .param p5, "remainingRetries"    # I
    .param p6, "readPref"    # Lcom/mongodb/ReadPreference;
    .param p7, "decoder"    # Lcom/mongodb/DBDecoder;

    .prologue
    .line 280
    if-nez p6, :cond_0

    .line 281
    invoke-static {}, Lcom/mongodb/ReadPreference;->primary()Lcom/mongodb/ReadPreference;

    move-result-object p6

    .line 283
    :cond_0
    invoke-static {}, Lcom/mongodb/ReadPreference;->primary()Lcom/mongodb/ReadPreference;

    move-result-object v4

    move-object/from16 v0, p6

    if-ne v0, v4, :cond_1

    const/4 v4, 0x4

    move-object/from16 v0, p3

    invoke-virtual {v0, v4}, Lcom/mongodb/OutMessage;->hasOption(I)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 284
    invoke-static {}, Lcom/mongodb/ReadPreference;->secondaryPreferred()Lcom/mongodb/ReadPreference;

    move-result-object p6

    .line 286
    :cond_1
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/mongodb/DBTCPConnector;->_myPort:Lcom/mongodb/DBTCPConnector$MyPort;

    const/4 v5, 0x0

    move-object/from16 v0, p6

    move-object/from16 v1, p4

    invoke-virtual {v4, v5, v0, v1}, Lcom/mongodb/DBTCPConnector$MyPort;->get(ZLcom/mongodb/ReadPreference;Lcom/mongodb/ServerAddress;)Lcom/mongodb/DBPort;

    move-result-object v14

    .line 288
    .local v14, "port":Lcom/mongodb/DBPort;
    const/16 v16, 0x0

    .line 289
    .local v16, "res":Lcom/mongodb/Response;
    const/16 v17, 0x0

    .line 291
    .local v17, "retry":Z
    :try_start_0
    invoke-virtual/range {p1 .. p1}, Lcom/mongodb/DB;->getMongo()Lcom/mongodb/Mongo;

    move-result-object v4

    invoke-virtual {v14, v4}, Lcom/mongodb/DBPort;->checkAuth(Lcom/mongodb/Mongo;)V

    .line 292
    move-object/from16 v0, p3

    move-object/from16 v1, p2

    move-object/from16 v2, p7

    invoke-virtual {v14, v0, v1, v2}, Lcom/mongodb/DBPort;->call(Lcom/mongodb/OutMessage;Lcom/mongodb/DBCollection;Lcom/mongodb/DBDecoder;)Lcom/mongodb/Response;

    move-result-object v16

    .line 293
    move-object/from16 v0, v16

    iget v4, v0, Lcom/mongodb/Response;->_responseTo:I

    invoke-virtual/range {p3 .. p3}, Lcom/mongodb/OutMessage;->getId()I

    move-result v5

    if-eq v4, v5, :cond_2

    .line 294
    new-instance v4, Lcom/mongodb/MongoException;

    const-string/jumbo v5, "ids don\'t match"

    invoke-direct {v4, v5}, Lcom/mongodb/MongoException;-><init>(Ljava/lang/String;)V

    throw v4
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 296
    :catch_0
    move-exception v13

    .line 297
    .local v13, "ioe":Ljava/io/IOException;
    :try_start_1
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/mongodb/DBTCPConnector;->_myPort:Lcom/mongodb/DBTCPConnector$MyPort;

    invoke-virtual {v4, v14, v13}, Lcom/mongodb/DBTCPConnector$MyPort;->error(Lcom/mongodb/DBPort;Ljava/lang/Exception;)V

    .line 298
    move-object/from16 v0, p0

    move-object/from16 v1, p6

    move-object/from16 v2, p2

    move/from16 v3, p5

    invoke-direct {v0, v1, v2, v13, v3}, Lcom/mongodb/DBTCPConnector;->shouldRetryQuery(Lcom/mongodb/ReadPreference;Lcom/mongodb/DBCollection;Ljava/io/IOException;I)Z

    move-result v17

    .line 299
    if-nez v17, :cond_4

    .line 300
    new-instance v4, Lcom/mongodb/MongoException$Network;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "Read operation to server "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v14}, Lcom/mongodb/DBPort;->host()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, " failed on database "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, p1

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5, v13}, Lcom/mongodb/MongoException$Network;-><init>(Ljava/lang/String;Ljava/io/IOException;)V

    throw v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 307
    .end local v13    # "ioe":Ljava/io/IOException;
    :catchall_0
    move-exception v4

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/mongodb/DBTCPConnector;->_myPort:Lcom/mongodb/DBTCPConnector$MyPort;

    invoke-virtual {v5, v14}, Lcom/mongodb/DBTCPConnector$MyPort;->done(Lcom/mongodb/DBPort;)V

    throw v4

    :cond_2
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/mongodb/DBTCPConnector;->_myPort:Lcom/mongodb/DBTCPConnector$MyPort;

    invoke-virtual {v4, v14}, Lcom/mongodb/DBTCPConnector$MyPort;->done(Lcom/mongodb/DBPort;)V

    .line 310
    :goto_0
    if-eqz v17, :cond_5

    .line 311
    add-int/lit8 v9, p5, -0x1

    move-object/from16 v4, p0

    move-object/from16 v5, p1

    move-object/from16 v6, p2

    move-object/from16 v7, p3

    move-object/from16 v8, p4

    move-object/from16 v10, p6

    move-object/from16 v11, p7

    invoke-direct/range {v4 .. v11}, Lcom/mongodb/DBTCPConnector;->innerCall(Lcom/mongodb/DB;Lcom/mongodb/DBCollection;Lcom/mongodb/OutMessage;Lcom/mongodb/ServerAddress;ILcom/mongodb/ReadPreference;Lcom/mongodb/DBDecoder;)Lcom/mongodb/Response;

    move-result-object v16

    .line 322
    .end local v16    # "res":Lcom/mongodb/Response;
    :cond_3
    :goto_1
    return-object v16

    .line 307
    .restart local v13    # "ioe":Ljava/io/IOException;
    .restart local v16    # "res":Lcom/mongodb/Response;
    :cond_4
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/mongodb/DBTCPConnector;->_myPort:Lcom/mongodb/DBTCPConnector$MyPort;

    invoke-virtual {v4, v14}, Lcom/mongodb/DBTCPConnector$MyPort;->done(Lcom/mongodb/DBPort;)V

    goto :goto_0

    .line 303
    .end local v13    # "ioe":Ljava/io/IOException;
    :catch_1
    move-exception v15

    .line 304
    .local v15, "re":Ljava/lang/RuntimeException;
    :try_start_2
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/mongodb/DBTCPConnector;->_myPort:Lcom/mongodb/DBTCPConnector$MyPort;

    invoke-virtual {v4, v14, v15}, Lcom/mongodb/DBTCPConnector$MyPort;->error(Lcom/mongodb/DBPort;Ljava/lang/Exception;)V

    .line 305
    throw v15
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 313
    .end local v15    # "re":Ljava/lang/RuntimeException;
    :cond_5
    invoke-virtual/range {v16 .. v16}, Lcom/mongodb/Response;->getError()Lcom/mongodb/ServerError;

    move-result-object v12

    .line 315
    .local v12, "err":Lcom/mongodb/ServerError;
    if-eqz v12, :cond_3

    invoke-virtual {v12}, Lcom/mongodb/ServerError;->isNotMasterError()Z

    move-result v4

    if-eqz v4, :cond_3

    .line 316
    if-gtz p5, :cond_6

    .line 317
    new-instance v4, Lcom/mongodb/MongoException;

    const-string/jumbo v5, "not talking to master and retries used up"

    invoke-direct {v4, v5}, Lcom/mongodb/MongoException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 319
    :cond_6
    add-int/lit8 v9, p5, -0x1

    move-object/from16 v4, p0

    move-object/from16 v5, p1

    move-object/from16 v6, p2

    move-object/from16 v7, p3

    move-object/from16 v8, p4

    move-object/from16 v10, p6

    move-object/from16 v11, p7

    invoke-direct/range {v4 .. v11}, Lcom/mongodb/DBTCPConnector;->innerCall(Lcom/mongodb/DB;Lcom/mongodb/DBCollection;Lcom/mongodb/OutMessage;Lcom/mongodb/ServerAddress;ILcom/mongodb/ReadPreference;Lcom/mongodb/DBDecoder;)Lcom/mongodb/Response;

    move-result-object v16

    goto :goto_1
.end method

.method private shouldRetryQuery(Lcom/mongodb/ReadPreference;Lcom/mongodb/DBCollection;Ljava/io/IOException;I)Z
    .locals 3
    .param p1, "readPreference"    # Lcom/mongodb/ReadPreference;
    .param p2, "coll"    # Lcom/mongodb/DBCollection;
    .param p3, "ioe"    # Ljava/io/IOException;
    .param p4, "remainingRetries"    # I

    .prologue
    const/4 v0, 0x0

    .line 380
    if-nez p4, :cond_1

    .line 392
    :cond_0
    :goto_0
    return v0

    .line 383
    :cond_1
    iget-object v1, p2, Lcom/mongodb/DBCollection;->_name:Ljava/lang/String;

    const-string/jumbo v2, "$cmd"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 386
    instance-of v1, p3, Ljava/net/SocketTimeoutException;

    if-nez v1, :cond_0

    .line 389
    invoke-static {}, Lcom/mongodb/ReadPreference;->primary()Lcom/mongodb/ReadPreference;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 392
    iget-object v1, p0, Lcom/mongodb/DBTCPConnector;->connectionMode:Lcom/mongodb/ClusterConnectionMode;

    sget-object v2, Lcom/mongodb/ClusterConnectionMode;->Multiple:Lcom/mongodb/ClusterConnectionMode;

    if-ne v1, v2, :cond_0

    invoke-direct {p0}, Lcom/mongodb/DBTCPConnector;->getType()Lcom/mongodb/ClusterType;

    move-result-object v1

    sget-object v2, Lcom/mongodb/ClusterType;->ReplicaSet:Lcom/mongodb/ClusterType;

    if-ne v1, v2, :cond_0

    const/4 v0, 0x1

    goto :goto_0
.end method


# virtual methods
.method public authenticate(Lcom/mongodb/MongoCredential;)Lcom/mongodb/CommandResult;
    .locals 6
    .param p1, "credentials"    # Lcom/mongodb/MongoCredential;

    .prologue
    .line 624
    iget-object v2, p0, Lcom/mongodb/DBTCPConnector;->_myPort:Lcom/mongodb/DBTCPConnector$MyPort;

    const/4 v3, 0x0

    invoke-static {}, Lcom/mongodb/ReadPreference;->primaryPreferred()Lcom/mongodb/ReadPreference;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v2, v3, v4, v5}, Lcom/mongodb/DBTCPConnector$MyPort;->get(ZLcom/mongodb/ReadPreference;Lcom/mongodb/ServerAddress;)Lcom/mongodb/DBPort;

    move-result-object v0

    .line 627
    .local v0, "port":Lcom/mongodb/DBPort;
    :try_start_0
    iget-object v2, p0, Lcom/mongodb/DBTCPConnector;->_mongo:Lcom/mongodb/Mongo;

    invoke-virtual {v0, v2, p1}, Lcom/mongodb/DBPort;->authenticate(Lcom/mongodb/Mongo;Lcom/mongodb/MongoCredential;)Lcom/mongodb/CommandResult;

    move-result-object v1

    .line 628
    .local v1, "result":Lcom/mongodb/CommandResult;
    iget-object v2, p0, Lcom/mongodb/DBTCPConnector;->_mongo:Lcom/mongodb/Mongo;

    invoke-virtual {v2}, Lcom/mongodb/Mongo;->getAuthority()Lcom/mongodb/MongoAuthority;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mongodb/MongoAuthority;->getCredentialsStore()Lcom/mongodb/MongoCredentialsStore;

    move-result-object v2

    invoke-virtual {v2, p1}, Lcom/mongodb/MongoCredentialsStore;->add(Lcom/mongodb/MongoCredential;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 631
    iget-object v2, p0, Lcom/mongodb/DBTCPConnector;->_myPort:Lcom/mongodb/DBTCPConnector$MyPort;

    invoke-virtual {v2, v0}, Lcom/mongodb/DBTCPConnector$MyPort;->done(Lcom/mongodb/DBPort;)V

    return-object v1

    .end local v1    # "result":Lcom/mongodb/CommandResult;
    :catchall_0
    move-exception v2

    iget-object v3, p0, Lcom/mongodb/DBTCPConnector;->_myPort:Lcom/mongodb/DBTCPConnector$MyPort;

    invoke-virtual {v3, v0}, Lcom/mongodb/DBTCPConnector$MyPort;->done(Lcom/mongodb/DBPort;)V

    throw v2
.end method

.method public call(Lcom/mongodb/DB;Lcom/mongodb/DBCollection;Lcom/mongodb/OutMessage;Lcom/mongodb/ServerAddress;I)Lcom/mongodb/Response;
    .locals 8
    .param p1, "db"    # Lcom/mongodb/DB;
    .param p2, "coll"    # Lcom/mongodb/DBCollection;
    .param p3, "m"    # Lcom/mongodb/OutMessage;
    .param p4, "hostNeeded"    # Lcom/mongodb/ServerAddress;
    .param p5, "retries"    # I

    .prologue
    const/4 v6, 0x0

    .line 251
    const-string/jumbo v1, "open"

    iget-boolean v0, p0, Lcom/mongodb/DBTCPConnector;->_closed:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-static {v1, v0}, Lorg/bson/util/Assertions;->isTrue(Ljava/lang/String;Z)V

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move v5, p5

    move-object v7, v6

    .line 252
    invoke-virtual/range {v0 .. v7}, Lcom/mongodb/DBTCPConnector;->call(Lcom/mongodb/DB;Lcom/mongodb/DBCollection;Lcom/mongodb/OutMessage;Lcom/mongodb/ServerAddress;ILcom/mongodb/ReadPreference;Lcom/mongodb/DBDecoder;)Lcom/mongodb/Response;

    move-result-object v0

    return-object v0

    .line 251
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public call(Lcom/mongodb/DB;Lcom/mongodb/DBCollection;Lcom/mongodb/OutMessage;Lcom/mongodb/ServerAddress;ILcom/mongodb/ReadPreference;Lcom/mongodb/DBDecoder;)Lcom/mongodb/Response;
    .locals 2
    .param p1, "db"    # Lcom/mongodb/DB;
    .param p2, "coll"    # Lcom/mongodb/DBCollection;
    .param p3, "m"    # Lcom/mongodb/OutMessage;
    .param p4, "hostNeeded"    # Lcom/mongodb/ServerAddress;
    .param p5, "retries"    # I
    .param p6, "readPref"    # Lcom/mongodb/ReadPreference;
    .param p7, "decoder"    # Lcom/mongodb/DBDecoder;

    .prologue
    .line 269
    const-string/jumbo v1, "open"

    iget-boolean v0, p0, Lcom/mongodb/DBTCPConnector;->_closed:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-static {v1, v0}, Lorg/bson/util/Assertions;->isTrue(Ljava/lang/String;Z)V

    .line 271
    :try_start_0
    invoke-direct/range {p0 .. p7}, Lcom/mongodb/DBTCPConnector;->innerCall(Lcom/mongodb/DB;Lcom/mongodb/DBCollection;Lcom/mongodb/OutMessage;Lcom/mongodb/ServerAddress;ILcom/mongodb/ReadPreference;Lcom/mongodb/DBDecoder;)Lcom/mongodb/Response;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    .line 273
    invoke-virtual {p3}, Lcom/mongodb/OutMessage;->doneWithMessage()V

    return-object v0

    .line 269
    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    .line 273
    :catchall_0
    move-exception v0

    invoke-virtual {p3}, Lcom/mongodb/OutMessage;->doneWithMessage()V

    throw v0
.end method

.method public call(Lcom/mongodb/DB;Lcom/mongodb/DBCollection;Lcom/mongodb/OutMessage;Lcom/mongodb/ServerAddress;Lcom/mongodb/DBDecoder;)Lcom/mongodb/Response;
    .locals 8
    .param p1, "db"    # Lcom/mongodb/DB;
    .param p2, "coll"    # Lcom/mongodb/DBCollection;
    .param p3, "m"    # Lcom/mongodb/OutMessage;
    .param p4, "hostNeeded"    # Lcom/mongodb/ServerAddress;
    .param p5, "decoder"    # Lcom/mongodb/DBDecoder;

    .prologue
    .line 236
    const-string/jumbo v1, "open"

    iget-boolean v0, p0, Lcom/mongodb/DBTCPConnector;->_closed:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-static {v1, v0}, Lorg/bson/util/Assertions;->isTrue(Ljava/lang/String;Z)V

    .line 237
    const/4 v5, 0x2

    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v7, p5

    invoke-virtual/range {v0 .. v7}, Lcom/mongodb/DBTCPConnector;->call(Lcom/mongodb/DB;Lcom/mongodb/DBCollection;Lcom/mongodb/OutMessage;Lcom/mongodb/ServerAddress;ILcom/mongodb/ReadPreference;Lcom/mongodb/DBDecoder;)Lcom/mongodb/Response;

    move-result-object v0

    return-object v0

    .line 236
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public close()V
    .locals 1

    .prologue
    .line 593
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mongodb/DBTCPConnector;->_closed:Z

    .line 594
    iget-object v0, p0, Lcom/mongodb/DBTCPConnector;->cluster:Lcom/mongodb/Cluster;

    if-eqz v0, :cond_0

    .line 595
    iget-object v0, p0, Lcom/mongodb/DBTCPConnector;->cluster:Lcom/mongodb/Cluster;

    invoke-interface {v0}, Lcom/mongodb/Cluster;->close()V

    .line 596
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mongodb/DBTCPConnector;->cluster:Lcom/mongodb/Cluster;

    .line 598
    :cond_0
    return-void
.end method

.method public debugString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 589
    invoke-direct {p0}, Lcom/mongodb/DBTCPConnector;->getClusterDescription()Lcom/mongodb/ClusterDescription;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mongodb/ClusterDescription;->getShortDescription()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method doOperation(Lcom/mongodb/DB;Lcom/mongodb/DBPort;Lcom/mongodb/DBPort$Operation;)Ljava/lang/Object;
    .locals 5
    .param p1, "db"    # Lcom/mongodb/DB;
    .param p2, "port"    # Lcom/mongodb/DBPort;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/mongodb/DB;",
            "Lcom/mongodb/DBPort;",
            "Lcom/mongodb/DBPort$Operation",
            "<TT;>;)TT;"
        }
    .end annotation

    .prologue
    .line 206
    .local p3, "operation":Lcom/mongodb/DBPort$Operation;, "Lcom/mongodb/DBPort$Operation<TT;>;"
    const-string/jumbo v3, "open"

    iget-boolean v2, p0, Lcom/mongodb/DBTCPConnector;->_closed:Z

    if-nez v2, :cond_0

    const/4 v2, 0x1

    :goto_0
    invoke-static {v3, v2}, Lorg/bson/util/Assertions;->isTrue(Ljava/lang/String;Z)V

    .line 209
    :try_start_0
    invoke-virtual {p1}, Lcom/mongodb/DB;->getMongo()Lcom/mongodb/Mongo;

    move-result-object v2

    invoke-virtual {p2, v2}, Lcom/mongodb/DBPort;->checkAuth(Lcom/mongodb/Mongo;)V

    .line 210
    invoke-interface {p3}, Lcom/mongodb/DBPort$Operation;->execute()Ljava/lang/Object;
    :try_end_0
    .catch Lcom/mongodb/MongoException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_2

    move-result-object v2

    return-object v2

    .line 206
    :cond_0
    const/4 v2, 0x0

    goto :goto_0

    .line 212
    :catch_0
    move-exception v1

    .line 213
    .local v1, "re":Lcom/mongodb/MongoException;
    throw v1

    .line 215
    .end local v1    # "re":Lcom/mongodb/MongoException;
    :catch_1
    move-exception v0

    .line 216
    .local v0, "ioe":Ljava/io/IOException;
    iget-object v2, p0, Lcom/mongodb/DBTCPConnector;->_myPort:Lcom/mongodb/DBTCPConnector$MyPort;

    invoke-virtual {v2, p2, v0}, Lcom/mongodb/DBTCPConnector$MyPort;->error(Lcom/mongodb/DBPort;Ljava/lang/Exception;)V

    .line 217
    new-instance v2, Lcom/mongodb/MongoException$Network;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "Operation on server "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p2}, Lcom/mongodb/DBPort;->getAddress()Lcom/mongodb/ServerAddress;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, " failed"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v0}, Lcom/mongodb/MongoException$Network;-><init>(Ljava/lang/String;Ljava/io/IOException;)V

    throw v2

    .line 219
    .end local v0    # "ioe":Ljava/io/IOException;
    :catch_2
    move-exception v1

    .line 220
    .local v1, "re":Ljava/lang/RuntimeException;
    iget-object v2, p0, Lcom/mongodb/DBTCPConnector;->_myPort:Lcom/mongodb/DBTCPConnector$MyPort;

    invoke-virtual {v2, p2, v1}, Lcom/mongodb/DBTCPConnector$MyPort;->error(Lcom/mongodb/DBPort;Ljava/lang/Exception;)V

    .line 221
    throw v1
.end method

.method public getAddress()Lcom/mongodb/ServerAddress;
    .locals 4

    .prologue
    const/4 v2, 0x0

    .line 326
    const-string/jumbo v3, "open"

    iget-boolean v1, p0, Lcom/mongodb/DBTCPConnector;->_closed:Z

    if-nez v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    invoke-static {v3, v1}, Lorg/bson/util/Assertions;->isTrue(Ljava/lang/String;Z)V

    .line 327
    invoke-direct {p0}, Lcom/mongodb/DBTCPConnector;->getClusterDescription()Lcom/mongodb/ClusterDescription;

    move-result-object v0

    .line 328
    .local v0, "clusterDescription":Lcom/mongodb/ClusterDescription;
    iget-object v1, p0, Lcom/mongodb/DBTCPConnector;->connectionMode:Lcom/mongodb/ClusterConnectionMode;

    sget-object v3, Lcom/mongodb/ClusterConnectionMode;->Single:Lcom/mongodb/ClusterConnectionMode;

    if-ne v1, v3, :cond_1

    .line 329
    invoke-virtual {v0}, Lcom/mongodb/ClusterDescription;->getAny()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mongodb/ServerDescription;

    invoke-virtual {v1}, Lcom/mongodb/ServerDescription;->getAddress()Lcom/mongodb/ServerAddress;

    move-result-object v1

    .line 334
    :goto_1
    return-object v1

    .end local v0    # "clusterDescription":Lcom/mongodb/ClusterDescription;
    :cond_0
    move v1, v2

    .line 326
    goto :goto_0

    .line 331
    .restart local v0    # "clusterDescription":Lcom/mongodb/ClusterDescription;
    :cond_1
    invoke-virtual {v0}, Lcom/mongodb/ClusterDescription;->getPrimaries()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 332
    const/4 v1, 0x0

    goto :goto_1

    .line 334
    :cond_2
    invoke-virtual {v0}, Lcom/mongodb/ClusterDescription;->getPrimaries()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mongodb/ServerDescription;

    invoke-virtual {v1}, Lcom/mongodb/ServerDescription;->getAddress()Lcom/mongodb/ServerAddress;

    move-result-object v1

    goto :goto_1
.end method

.method public getAllAddress()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/ServerAddress;",
            ">;"
        }
    .end annotation

    .prologue
    .line 342
    const-string/jumbo v1, "open"

    iget-boolean v0, p0, Lcom/mongodb/DBTCPConnector;->_closed:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-static {v1, v0}, Lorg/bson/util/Assertions;->isTrue(Ljava/lang/String;Z)V

    .line 343
    iget-object v0, p0, Lcom/mongodb/DBTCPConnector;->_mongo:Lcom/mongodb/Mongo;

    iget-object v0, v0, Lcom/mongodb/Mongo;->_authority:Lcom/mongodb/MongoAuthority;

    invoke-virtual {v0}, Lcom/mongodb/MongoAuthority;->getServerAddresses()Ljava/util/List;

    move-result-object v0

    return-object v0

    .line 342
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getConnectPoint()Ljava/lang/String;
    .locals 3

    .prologue
    .line 374
    const-string/jumbo v2, "open"

    iget-boolean v1, p0, Lcom/mongodb/DBTCPConnector;->_closed:Z

    if-nez v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    invoke-static {v2, v1}, Lorg/bson/util/Assertions;->isTrue(Ljava/lang/String;Z)V

    .line 375
    invoke-virtual {p0}, Lcom/mongodb/DBTCPConnector;->getAddress()Lcom/mongodb/ServerAddress;

    move-result-object v0

    .line 376
    .local v0, "master":Lcom/mongodb/ServerAddress;
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/mongodb/ServerAddress;->toString()Ljava/lang/String;

    move-result-object v1

    :goto_1
    return-object v1

    .line 374
    .end local v0    # "master":Lcom/mongodb/ServerAddress;
    :cond_0
    const/4 v1, 0x0

    goto :goto_0

    .line 376
    .restart local v0    # "master":Lcom/mongodb/ServerAddress;
    :cond_1
    const/4 v1, 0x0

    goto :goto_1
.end method

.method public getDBPortPool(Lcom/mongodb/ServerAddress;)Lcom/mongodb/DBPortPool;
    .locals 1
    .param p1, "addr"    # Lcom/mongodb/ServerAddress;

    .prologue
    .line 615
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public getMaxBsonObjectSize()I
    .locals 3

    .prologue
    .line 641
    invoke-direct {p0}, Lcom/mongodb/DBTCPConnector;->getClusterDescription()Lcom/mongodb/ClusterDescription;

    move-result-object v0

    .line 642
    .local v0, "clusterDescription":Lcom/mongodb/ClusterDescription;
    invoke-virtual {v0}, Lcom/mongodb/ClusterDescription;->getPrimaries()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 643
    const/high16 v1, 0x400000

    .line 645
    :goto_0
    return v1

    :cond_0
    invoke-virtual {v0}, Lcom/mongodb/ClusterDescription;->getPrimaries()Ljava/util/List;

    move-result-object v1

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mongodb/ServerDescription;

    invoke-virtual {v1}, Lcom/mongodb/ServerDescription;->getMaxDocumentSize()I

    move-result v1

    goto :goto_0
.end method

.method getMyPort()Lcom/mongodb/DBTCPConnector$MyPort;
    .locals 1

    .prologue
    .line 650
    iget-object v0, p0, Lcom/mongodb/DBTCPConnector;->_myPort:Lcom/mongodb/DBTCPConnector$MyPort;

    return-object v0
.end method

.method getPrimaryPort()Lcom/mongodb/DBPort;
    .locals 4

    .prologue
    const/4 v1, 0x1

    .line 408
    const-string/jumbo v2, "open"

    iget-boolean v0, p0, Lcom/mongodb/DBTCPConnector;->_closed:Z

    if-nez v0, :cond_0

    move v0, v1

    :goto_0
    invoke-static {v2, v0}, Lorg/bson/util/Assertions;->isTrue(Ljava/lang/String;Z)V

    .line 409
    iget-object v0, p0, Lcom/mongodb/DBTCPConnector;->_myPort:Lcom/mongodb/DBTCPConnector$MyPort;

    invoke-static {}, Lcom/mongodb/ReadPreference;->primary()Lcom/mongodb/ReadPreference;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Lcom/mongodb/DBTCPConnector$MyPort;->get(ZLcom/mongodb/ReadPreference;Lcom/mongodb/ServerAddress;)Lcom/mongodb/DBPort;

    move-result-object v0

    return-object v0

    .line 408
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getReplicaSetStatus()Lcom/mongodb/ReplicaSetStatus;
    .locals 2

    .prologue
    .line 363
    const-string/jumbo v1, "open"

    iget-boolean v0, p0, Lcom/mongodb/DBTCPConnector;->_closed:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-static {v1, v0}, Lorg/bson/util/Assertions;->isTrue(Ljava/lang/String;Z)V

    .line 364
    invoke-direct {p0}, Lcom/mongodb/DBTCPConnector;->getType()Lcom/mongodb/ClusterType;

    move-result-object v0

    sget-object v1, Lcom/mongodb/ClusterType;->ReplicaSet:Lcom/mongodb/ClusterType;

    if-ne v0, v1, :cond_1

    iget-object v0, p0, Lcom/mongodb/DBTCPConnector;->connectionMode:Lcom/mongodb/ClusterConnectionMode;

    sget-object v1, Lcom/mongodb/ClusterConnectionMode;->Multiple:Lcom/mongodb/ClusterConnectionMode;

    if-ne v0, v1, :cond_1

    new-instance v0, Lcom/mongodb/ReplicaSetStatus;

    invoke-direct {p0}, Lcom/mongodb/DBTCPConnector;->getClusterDescription()Lcom/mongodb/ClusterDescription;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/mongodb/ReplicaSetStatus;-><init>(Lcom/mongodb/ClusterDescription;)V

    :goto_1
    return-object v0

    .line 363
    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    .line 364
    :cond_1
    const/4 v0, 0x0

    goto :goto_1
.end method

.method public getServerAddressList()Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/ServerAddress;",
            ">;"
        }
    .end annotation

    .prologue
    .line 353
    const-string/jumbo v5, "open"

    iget-boolean v4, p0, Lcom/mongodb/DBTCPConnector;->_closed:Z

    if-nez v4, :cond_0

    const/4 v4, 0x1

    :goto_0
    invoke-static {v5, v4}, Lorg/bson/util/Assertions;->isTrue(Ljava/lang/String;Z)V

    .line 354
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 355
    .local v2, "serverAddressList":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/ServerAddress;>;"
    invoke-direct {p0}, Lcom/mongodb/DBTCPConnector;->getClusterDescription()Lcom/mongodb/ClusterDescription;

    move-result-object v0

    .line 356
    .local v0, "clusterDescription":Lcom/mongodb/ClusterDescription;
    invoke-virtual {v0}, Lcom/mongodb/ClusterDescription;->getAll()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/mongodb/ServerDescription;

    .line 357
    .local v3, "serverDescription":Lcom/mongodb/ServerDescription;
    invoke-virtual {v3}, Lcom/mongodb/ServerDescription;->getAddress()Lcom/mongodb/ServerAddress;

    move-result-object v4

    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 353
    .end local v0    # "clusterDescription":Lcom/mongodb/ClusterDescription;
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v2    # "serverAddressList":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/ServerAddress;>;"
    .end local v3    # "serverDescription":Lcom/mongodb/ServerDescription;
    :cond_0
    const/4 v4, 0x0

    goto :goto_0

    .line 359
    .restart local v0    # "clusterDescription":Lcom/mongodb/ClusterDescription;
    .restart local v1    # "i$":Ljava/util/Iterator;
    .restart local v2    # "serverAddressList":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/ServerAddress;>;"
    :cond_1
    return-object v2
.end method

.method getServerDescription(Lcom/mongodb/ServerAddress;)Lcom/mongodb/ServerDescription;
    .locals 2
    .param p1, "address"    # Lcom/mongodb/ServerAddress;

    .prologue
    .line 418
    const-string/jumbo v1, "open"

    iget-boolean v0, p0, Lcom/mongodb/DBTCPConnector;->_closed:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-static {v1, v0}, Lorg/bson/util/Assertions;->isTrue(Ljava/lang/String;Z)V

    .line 419
    invoke-direct {p0}, Lcom/mongodb/DBTCPConnector;->getClusterDescription()Lcom/mongodb/ClusterDescription;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/mongodb/ClusterDescription;->getByServerAddress(Lcom/mongodb/ServerAddress;)Lcom/mongodb/ServerDescription;

    move-result-object v0

    return-object v0

    .line 418
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method isMongosConnection()Z
    .locals 4

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 369
    const-string/jumbo v3, "open"

    iget-boolean v0, p0, Lcom/mongodb/DBTCPConnector;->_closed:Z

    if-nez v0, :cond_0

    move v0, v1

    :goto_0
    invoke-static {v3, v0}, Lorg/bson/util/Assertions;->isTrue(Ljava/lang/String;Z)V

    .line 370
    invoke-direct {p0}, Lcom/mongodb/DBTCPConnector;->getType()Lcom/mongodb/ClusterType;

    move-result-object v0

    sget-object v3, Lcom/mongodb/ClusterType;->Sharded:Lcom/mongodb/ClusterType;

    if-ne v0, v3, :cond_1

    :goto_1
    return v1

    :cond_0
    move v0, v2

    .line 369
    goto :goto_0

    :cond_1
    move v1, v2

    .line 370
    goto :goto_1
.end method

.method public isOpen()Z
    .locals 1

    .prologue
    .line 619
    iget-boolean v0, p0, Lcom/mongodb/DBTCPConnector;->_closed:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method releasePort(Lcom/mongodb/DBPort;)V
    .locals 2
    .param p1, "port"    # Lcom/mongodb/DBPort;

    .prologue
    .line 413
    const-string/jumbo v1, "open"

    iget-boolean v0, p0, Lcom/mongodb/DBTCPConnector;->_closed:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-static {v1, v0}, Lorg/bson/util/Assertions;->isTrue(Ljava/lang/String;Z)V

    .line 414
    iget-object v0, p0, Lcom/mongodb/DBTCPConnector;->_myPort:Lcom/mongodb/DBTCPConnector$MyPort;

    invoke-virtual {v0, p1}, Lcom/mongodb/DBTCPConnector$MyPort;->done(Lcom/mongodb/DBPort;)V

    .line 415
    return-void

    .line 413
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public requestDone()V
    .locals 2

    .prologue
    .line 118
    const-string/jumbo v1, "open"

    iget-boolean v0, p0, Lcom/mongodb/DBTCPConnector;->_closed:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-static {v1, v0}, Lorg/bson/util/Assertions;->isTrue(Ljava/lang/String;Z)V

    .line 119
    iget-object v0, p0, Lcom/mongodb/DBTCPConnector;->_myPort:Lcom/mongodb/DBTCPConnector$MyPort;

    invoke-virtual {v0}, Lcom/mongodb/DBTCPConnector$MyPort;->requestDone()V

    .line 120
    return-void

    .line 118
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public requestEnsureConnection()V
    .locals 2

    .prologue
    .line 127
    const-string/jumbo v1, "open"

    iget-boolean v0, p0, Lcom/mongodb/DBTCPConnector;->_closed:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-static {v1, v0}, Lorg/bson/util/Assertions;->isTrue(Ljava/lang/String;Z)V

    .line 128
    iget-object v0, p0, Lcom/mongodb/DBTCPConnector;->_myPort:Lcom/mongodb/DBTCPConnector$MyPort;

    invoke-virtual {v0}, Lcom/mongodb/DBTCPConnector$MyPort;->requestEnsureConnection()V

    .line 129
    return-void

    .line 127
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public requestStart()V
    .locals 2

    .prologue
    .line 105
    const-string/jumbo v1, "open"

    iget-boolean v0, p0, Lcom/mongodb/DBTCPConnector;->_closed:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-static {v1, v0}, Lorg/bson/util/Assertions;->isTrue(Ljava/lang/String;Z)V

    .line 106
    iget-object v0, p0, Lcom/mongodb/DBTCPConnector;->_myPort:Lcom/mongodb/DBTCPConnector$MyPort;

    invoke-virtual {v0}, Lcom/mongodb/DBTCPConnector$MyPort;->requestStart()V

    .line 107
    return-void

    .line 105
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public say(Lcom/mongodb/DB;Lcom/mongodb/OutMessage;Lcom/mongodb/WriteConcern;)Lcom/mongodb/WriteResult;
    .locals 2
    .param p1, "db"    # Lcom/mongodb/DB;
    .param p2, "m"    # Lcom/mongodb/OutMessage;
    .param p3, "concern"    # Lcom/mongodb/WriteConcern;

    .prologue
    .line 148
    const-string/jumbo v1, "open"

    iget-boolean v0, p0, Lcom/mongodb/DBTCPConnector;->_closed:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-static {v1, v0}, Lorg/bson/util/Assertions;->isTrue(Ljava/lang/String;Z)V

    .line 149
    const/4 v0, 0x0

    check-cast v0, Lcom/mongodb/ServerAddress;

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/mongodb/DBTCPConnector;->say(Lcom/mongodb/DB;Lcom/mongodb/OutMessage;Lcom/mongodb/WriteConcern;Lcom/mongodb/ServerAddress;)Lcom/mongodb/WriteResult;

    move-result-object v0

    return-object v0

    .line 148
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method say(Lcom/mongodb/DB;Lcom/mongodb/OutMessage;Lcom/mongodb/WriteConcern;Lcom/mongodb/DBPort;)Lcom/mongodb/WriteResult;
    .locals 8
    .param p1, "db"    # Lcom/mongodb/DB;
    .param p2, "m"    # Lcom/mongodb/OutMessage;
    .param p3, "concern"    # Lcom/mongodb/WriteConcern;
    .param p4, "port"    # Lcom/mongodb/DBPort;

    .prologue
    const/4 v0, 0x0

    .line 174
    const-string/jumbo v1, "open"

    iget-boolean v2, p0, Lcom/mongodb/DBTCPConnector;->_closed:Z

    if-nez v2, :cond_0

    const/4 v0, 0x1

    :cond_0
    invoke-static {v1, v0}, Lorg/bson/util/Assertions;->isTrue(Ljava/lang/String;Z)V

    .line 176
    if-nez p3, :cond_1

    .line 177
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Write concern is null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 181
    :cond_1
    :try_start_0
    new-instance v0, Lcom/mongodb/DBTCPConnector$1;

    move-object v1, p0

    move-object v2, p4

    move-object v3, p2

    move-object v4, p3

    move-object v5, p1

    invoke-direct/range {v0 .. v5}, Lcom/mongodb/DBTCPConnector$1;-><init>(Lcom/mongodb/DBTCPConnector;Lcom/mongodb/DBPort;Lcom/mongodb/OutMessage;Lcom/mongodb/WriteConcern;Lcom/mongodb/DB;)V

    invoke-virtual {p0, p1, p4, v0}, Lcom/mongodb/DBTCPConnector;->doOperation(Lcom/mongodb/DB;Lcom/mongodb/DBPort;Lcom/mongodb/DBPort$Operation;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mongodb/WriteResult;
    :try_end_0
    .catch Lcom/mongodb/MongoException$Network; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 201
    invoke-virtual {p2}, Lcom/mongodb/OutMessage;->doneWithMessage()V

    :goto_0
    return-object v0

    .line 192
    :catch_0
    move-exception v6

    .line 193
    .local v6, "e":Lcom/mongodb/MongoException$Network;
    :try_start_1
    invoke-virtual {p3}, Lcom/mongodb/WriteConcern;->raiseNetworkErrors()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 194
    throw v6
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 201
    .end local v6    # "e":Lcom/mongodb/MongoException$Network;
    :catchall_0
    move-exception v0

    invoke-virtual {p2}, Lcom/mongodb/OutMessage;->doneWithMessage()V

    throw v0

    .line 196
    .restart local v6    # "e":Lcom/mongodb/MongoException$Network;
    :cond_2
    :try_start_2
    new-instance v7, Lcom/mongodb/CommandResult;

    invoke-virtual {p4}, Lcom/mongodb/DBPort;->serverAddress()Lcom/mongodb/ServerAddress;

    move-result-object v0

    invoke-direct {v7, v0}, Lcom/mongodb/CommandResult;-><init>(Lcom/mongodb/ServerAddress;)V

    .line 197
    .local v7, "res":Lcom/mongodb/CommandResult;
    const-string/jumbo v0, "ok"

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v7, v0, v1}, Lcom/mongodb/CommandResult;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 198
    const-string/jumbo v0, "$err"

    const-string/jumbo v1, "NETWORK ERROR"

    invoke-virtual {v7, v0, v1}, Lcom/mongodb/CommandResult;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 199
    new-instance v0, Lcom/mongodb/WriteResult;

    invoke-direct {v0, v7, p3}, Lcom/mongodb/WriteResult;-><init>(Lcom/mongodb/CommandResult;Lcom/mongodb/WriteConcern;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 201
    invoke-virtual {p2}, Lcom/mongodb/OutMessage;->doneWithMessage()V

    goto :goto_0
.end method

.method public say(Lcom/mongodb/DB;Lcom/mongodb/OutMessage;Lcom/mongodb/WriteConcern;Lcom/mongodb/ServerAddress;)Lcom/mongodb/WriteResult;
    .locals 4
    .param p1, "db"    # Lcom/mongodb/DB;
    .param p2, "m"    # Lcom/mongodb/OutMessage;
    .param p3, "concern"    # Lcom/mongodb/WriteConcern;
    .param p4, "hostNeeded"    # Lcom/mongodb/ServerAddress;

    .prologue
    const/4 v2, 0x1

    .line 162
    const-string/jumbo v3, "open"

    iget-boolean v1, p0, Lcom/mongodb/DBTCPConnector;->_closed:Z

    if-nez v1, :cond_0

    move v1, v2

    :goto_0
    invoke-static {v3, v1}, Lorg/bson/util/Assertions;->isTrue(Ljava/lang/String;Z)V

    .line 163
    iget-object v1, p0, Lcom/mongodb/DBTCPConnector;->_myPort:Lcom/mongodb/DBTCPConnector$MyPort;

    invoke-static {}, Lcom/mongodb/ReadPreference;->primary()Lcom/mongodb/ReadPreference;

    move-result-object v3

    invoke-virtual {v1, v2, v3, p4}, Lcom/mongodb/DBTCPConnector$MyPort;->get(ZLcom/mongodb/ReadPreference;Lcom/mongodb/ServerAddress;)Lcom/mongodb/DBPort;

    move-result-object v0

    .line 166
    .local v0, "port":Lcom/mongodb/DBPort;
    :try_start_0
    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/mongodb/DBTCPConnector;->say(Lcom/mongodb/DB;Lcom/mongodb/OutMessage;Lcom/mongodb/WriteConcern;Lcom/mongodb/DBPort;)Lcom/mongodb/WriteResult;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    .line 169
    iget-object v2, p0, Lcom/mongodb/DBTCPConnector;->_myPort:Lcom/mongodb/DBTCPConnector$MyPort;

    invoke-virtual {v2, v0}, Lcom/mongodb/DBTCPConnector$MyPort;->done(Lcom/mongodb/DBPort;)V

    return-object v1

    .line 162
    .end local v0    # "port":Lcom/mongodb/DBPort;
    :cond_0
    const/4 v1, 0x0

    goto :goto_0

    .line 169
    .restart local v0    # "port":Lcom/mongodb/DBPort;
    :catchall_0
    move-exception v1

    iget-object v2, p0, Lcom/mongodb/DBTCPConnector;->_myPort:Lcom/mongodb/DBTCPConnector$MyPort;

    invoke-virtual {v2, v0}, Lcom/mongodb/DBTCPConnector$MyPort;->done(Lcom/mongodb/DBPort;)V

    throw v1
.end method

.method public start()V
    .locals 7

    .prologue
    .line 67
    const-string/jumbo v3, "open"

    iget-boolean v2, p0, Lcom/mongodb/DBTCPConnector;->_closed:Z

    if-nez v2, :cond_0

    const/4 v2, 0x1

    :goto_0
    invoke-static {v3, v2}, Lorg/bson/util/Assertions;->isTrue(Ljava/lang/String;Z)V

    .line 69
    iget-object v2, p0, Lcom/mongodb/DBTCPConnector;->_mongo:Lcom/mongodb/Mongo;

    invoke-virtual {v2}, Lcom/mongodb/Mongo;->getMongoOptions()Lcom/mongodb/MongoOptions;

    move-result-object v1

    .line 71
    .local v1, "options":Lcom/mongodb/MongoOptions;
    sget-object v2, Lcom/mongodb/DBTCPConnector;->NEXT_CLUSTER_ID:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    .line 72
    .local v0, "clusterId":Ljava/lang/String;
    invoke-static {}, Lcom/mongodb/ClusterSettings;->builder()Lcom/mongodb/ClusterSettings$Builder;

    move-result-object v2

    iget-object v3, p0, Lcom/mongodb/DBTCPConnector;->_mongo:Lcom/mongodb/Mongo;

    invoke-virtual {v3}, Lcom/mongodb/Mongo;->getAuthority()Lcom/mongodb/MongoAuthority;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mongodb/MongoAuthority;->getServerAddresses()Ljava/util/List;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/mongodb/ClusterSettings$Builder;->hosts(Ljava/util/List;)Lcom/mongodb/ClusterSettings$Builder;

    move-result-object v2

    iget-object v3, p0, Lcom/mongodb/DBTCPConnector;->connectionMode:Lcom/mongodb/ClusterConnectionMode;

    invoke-virtual {v2, v3}, Lcom/mongodb/ClusterSettings$Builder;->mode(Lcom/mongodb/ClusterConnectionMode;)Lcom/mongodb/ClusterSettings$Builder;

    move-result-object v2

    iget-object v3, p0, Lcom/mongodb/DBTCPConnector;->_mongo:Lcom/mongodb/Mongo;

    invoke-virtual {v3}, Lcom/mongodb/Mongo;->getMongoOptions()Lcom/mongodb/MongoOptions;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mongodb/MongoOptions;->getRequiredReplicaSetName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/mongodb/ClusterSettings$Builder;->requiredReplicaSetName(Ljava/lang/String;)Lcom/mongodb/ClusterSettings$Builder;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mongodb/ClusterSettings$Builder;->build()Lcom/mongodb/ClusterSettings;

    move-result-object v2

    invoke-static {}, Lcom/mongodb/ServerSettings;->builder()Lcom/mongodb/ServerSettings$Builder;

    move-result-object v3

    iget v4, v1, Lcom/mongodb/MongoOptions;->heartbeatFrequencyMS:I

    int-to-long v4, v4

    sget-object v6, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v3, v4, v5, v6}, Lcom/mongodb/ServerSettings$Builder;->heartbeatFrequency(JLjava/util/concurrent/TimeUnit;)Lcom/mongodb/ServerSettings$Builder;

    move-result-object v3

    iget v4, v1, Lcom/mongodb/MongoOptions;->heartbeatConnectRetryFrequencyMS:I

    int-to-long v4, v4

    sget-object v6, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v3, v4, v5, v6}, Lcom/mongodb/ServerSettings$Builder;->heartbeatConnectRetryFrequency(JLjava/util/concurrent/TimeUnit;)Lcom/mongodb/ServerSettings$Builder;

    move-result-object v3

    invoke-static {}, Lcom/mongodb/SocketSettings;->builder()Lcom/mongodb/SocketSettings$Builder;

    move-result-object v4

    iget v5, v1, Lcom/mongodb/MongoOptions;->heartbeatConnectTimeoutMS:I

    sget-object v6, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v4, v5, v6}, Lcom/mongodb/SocketSettings$Builder;->connectTimeout(ILjava/util/concurrent/TimeUnit;)Lcom/mongodb/SocketSettings$Builder;

    move-result-object v4

    iget v5, v1, Lcom/mongodb/MongoOptions;->heartbeatReadTimeoutMS:I

    sget-object v6, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v4, v5, v6}, Lcom/mongodb/SocketSettings$Builder;->readTimeout(ILjava/util/concurrent/TimeUnit;)Lcom/mongodb/SocketSettings$Builder;

    move-result-object v4

    iget-object v5, p0, Lcom/mongodb/DBTCPConnector;->_mongo:Lcom/mongodb/Mongo;

    invoke-virtual {v5}, Lcom/mongodb/Mongo;->getMongoOptions()Lcom/mongodb/MongoOptions;

    move-result-object v5

    invoke-virtual {v5}, Lcom/mongodb/MongoOptions;->getSocketFactory()Ljavax/net/SocketFactory;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/mongodb/SocketSettings$Builder;->socketFactory(Ljavax/net/SocketFactory;)Lcom/mongodb/SocketSettings$Builder;

    move-result-object v4

    invoke-virtual {v4}, Lcom/mongodb/SocketSettings$Builder;->build()Lcom/mongodb/SocketSettings;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/mongodb/ServerSettings$Builder;->heartbeatSocketSettings(Lcom/mongodb/SocketSettings;)Lcom/mongodb/ServerSettings$Builder;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mongodb/ServerSettings$Builder;->build()Lcom/mongodb/ServerSettings;

    move-result-object v3

    const/4 v4, 0x0

    iget-object v5, p0, Lcom/mongodb/DBTCPConnector;->_mongo:Lcom/mongodb/Mongo;

    invoke-static {v0, v2, v3, v4, v5}, Lcom/mongodb/Clusters;->create(Ljava/lang/String;Lcom/mongodb/ClusterSettings;Lcom/mongodb/ServerSettings;Lcom/mongodb/ClusterListener;Lcom/mongodb/Mongo;)Lcom/mongodb/Cluster;

    move-result-object v2

    iput-object v2, p0, Lcom/mongodb/DBTCPConnector;->cluster:Lcom/mongodb/Cluster;

    .line 90
    return-void

    .line 67
    .end local v0    # "clusterId":Ljava/lang/String;
    .end local v1    # "options":Lcom/mongodb/MongoOptions;
    :cond_0
    const/4 v2, 0x0

    goto/16 :goto_0
.end method

.method public updatePortPool(Lcom/mongodb/ServerAddress;)V
    .locals 0
    .param p1, "addr"    # Lcom/mongodb/ServerAddress;

    .prologue
    .line 607
    return-void
.end method
