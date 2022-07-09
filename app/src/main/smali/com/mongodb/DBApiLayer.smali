.class public Lcom/mongodb/DBApiLayer;
.super Lcom/mongodb/DB;
.source "DBApiLayer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mongodb/DBApiLayer$DeadCursor;
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field static final NUM_CURSORS_BEFORE_KILL:I = 0x64

.field static final NUM_CURSORS_PER_BATCH:I = 0x4e20


# instance fields
.field final _collections:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/mongodb/DBCollectionImpl;",
            ">;"
        }
    .end annotation
.end field

.field final _connector:Lcom/mongodb/DBTCPConnector;

.field _deadCursorIds:Ljava/util/concurrent/ConcurrentLinkedQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentLinkedQueue",
            "<",
            "Lcom/mongodb/DBApiLayer$DeadCursor;",
            ">;"
        }
    .end annotation
.end field

.field final _root:Ljava/lang/String;

.field final _rootPlusDot:Ljava/lang/String;


# direct methods
.method protected constructor <init>(Lcom/mongodb/Mongo;Ljava/lang/String;Lcom/mongodb/DBConnector;)V
    .locals 3
    .param p1, "mongo"    # Lcom/mongodb/Mongo;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "connector"    # Lcom/mongodb/DBConnector;

    .prologue
    .line 51
    invoke-direct {p0, p1, p2}, Lcom/mongodb/DB;-><init>(Lcom/mongodb/Mongo;Ljava/lang/String;)V

    .line 220
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lcom/mongodb/DBApiLayer;->_collections:Ljava/util/concurrent/ConcurrentHashMap;

    .line 222
    new-instance v0, Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;-><init>()V

    iput-object v0, p0, Lcom/mongodb/DBApiLayer;->_deadCursorIds:Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 53
    if-nez p3, :cond_0

    .line 54
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "need a connector: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 56
    :cond_0
    iput-object p2, p0, Lcom/mongodb/DBApiLayer;->_root:Ljava/lang/String;

    .line 57
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/mongodb/DBApiLayer;->_root:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mongodb/DBApiLayer;->_rootPlusDot:Ljava/lang/String;

    .line 59
    check-cast p3, Lcom/mongodb/DBTCPConnector;

    .end local p3    # "connector":Lcom/mongodb/DBConnector;
    iput-object p3, p0, Lcom/mongodb/DBApiLayer;->_connector:Lcom/mongodb/DBTCPConnector;

    .line 60
    return-void
.end method

.method private getUserCommandDocument(Ljava/lang/String;[CZLjava/lang/String;)Lcom/mongodb/DBObject;
    .locals 5
    .param p1, "username"    # Ljava/lang/String;
    .param p2, "passwd"    # [C
    .param p3, "readOnly"    # Z
    .param p4, "commandName"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    .line 111
    new-instance v0, Lcom/mongodb/BasicDBObject;

    invoke-direct {v0, p4, p1}, Lcom/mongodb/BasicDBObject;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    const-string/jumbo v1, "pwd"

    invoke-virtual {p0, p1, p2}, Lcom/mongodb/DBApiLayer;->_hash(Ljava/lang/String;[C)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/mongodb/BasicDBObject;->append(Ljava/lang/String;Ljava/lang/Object;)Lcom/mongodb/BasicDBObject;

    move-result-object v0

    const-string/jumbo v1, "digestPassword"

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/mongodb/BasicDBObject;->append(Ljava/lang/String;Ljava/lang/Object;)Lcom/mongodb/BasicDBObject;

    move-result-object v0

    const-string/jumbo v1, "roles"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    invoke-direct {p0, p3}, Lcom/mongodb/DBApiLayer;->getUserRoleName(Z)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v4

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/mongodb/BasicDBObject;->append(Ljava/lang/String;Ljava/lang/Object;)Lcom/mongodb/BasicDBObject;

    move-result-object v0

    return-object v0
.end method

.method private getUserRoleName(Z)Ljava/lang/String;
    .locals 2
    .param p1, "readOnly"    # Z

    .prologue
    .line 119
    invoke-virtual {p0}, Lcom/mongodb/DBApiLayer;->getName()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "admin"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    if-eqz p1, :cond_0

    const-string/jumbo v0, "readAnyDatabase"

    :goto_0
    return-object v0

    :cond_0
    const-string/jumbo v0, "root"

    goto :goto_0

    :cond_1
    if-eqz p1, :cond_2

    const-string/jumbo v0, "read"

    goto :goto_0

    :cond_2
    const-string/jumbo v0, "dbOwner"

    goto :goto_0
.end method

.method private useUserCommands(Lcom/mongodb/DBPort;)Z
    .locals 4
    .param p1, "port"    # Lcom/mongodb/DBPort;

    .prologue
    .line 199
    iget-object v0, p0, Lcom/mongodb/DBApiLayer;->_connector:Lcom/mongodb/DBTCPConnector;

    invoke-virtual {p1}, Lcom/mongodb/DBPort;->getAddress()Lcom/mongodb/ServerAddress;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/mongodb/DBTCPConnector;->getServerDescription(Lcom/mongodb/ServerAddress;)Lcom/mongodb/ServerDescription;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mongodb/ServerDescription;->getVersion()Lcom/mongodb/ServerVersion;

    move-result-object v0

    new-instance v1, Lcom/mongodb/ServerVersion;

    const/4 v2, 0x2

    const/4 v3, 0x6

    invoke-direct {v1, v2, v3}, Lcom/mongodb/ServerVersion;-><init>(II)V

    invoke-virtual {v0, v1}, Lcom/mongodb/ServerVersion;->compareTo(Lcom/mongodb/ServerVersion;)I

    move-result v0

    if-ltz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method addDeadCursor(Lcom/mongodb/DBApiLayer$DeadCursor;)V
    .locals 1
    .param p1, "deadCursor"    # Lcom/mongodb/DBApiLayer$DeadCursor;

    .prologue
    .line 203
    iget-object v0, p0, Lcom/mongodb/DBApiLayer;->_deadCursorIds:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/ConcurrentLinkedQueue;->add(Ljava/lang/Object;)Z

    .line 204
    return-void
.end method

.method public addUser(Ljava/lang/String;[CZ)Lcom/mongodb/WriteResult;
    .locals 5
    .param p1, "username"    # Ljava/lang/String;
    .param p2, "passwd"    # [C
    .param p3, "readOnly"    # Z

    .prologue
    .line 75
    invoke-virtual {p0}, Lcom/mongodb/DBApiLayer;->requestStart()V

    .line 77
    :try_start_0
    iget-object v3, p0, Lcom/mongodb/DBApiLayer;->_connector:Lcom/mongodb/DBTCPConnector;

    invoke-virtual {v3}, Lcom/mongodb/DBTCPConnector;->getPrimaryPort()Lcom/mongodb/DBPort;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/mongodb/DBApiLayer;->useUserCommands(Lcom/mongodb/DBPort;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 78
    new-instance v3, Lcom/mongodb/BasicDBObject;

    const-string/jumbo v4, "usersInfo"

    invoke-direct {v3, v4, p1}, Lcom/mongodb/BasicDBObject;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {p0, v3}, Lcom/mongodb/DBApiLayer;->command(Lcom/mongodb/DBObject;)Lcom/mongodb/CommandResult;

    move-result-object v2

    .line 79
    .local v2, "userInfoResult":Lcom/mongodb/CommandResult;
    invoke-virtual {v2}, Lcom/mongodb/CommandResult;->throwOnError()V

    .line 80
    const-string/jumbo v3, "users"

    invoke-virtual {v2, v3}, Lcom/mongodb/CommandResult;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_0

    const-string/jumbo v3, "createUser"

    :goto_0
    invoke-direct {p0, p1, p2, p3, v3}, Lcom/mongodb/DBApiLayer;->getUserCommandDocument(Ljava/lang/String;[CZLjava/lang/String;)Lcom/mongodb/DBObject;

    move-result-object v1

    .line 83
    .local v1, "userCommandDocument":Lcom/mongodb/DBObject;
    invoke-virtual {p0, v1}, Lcom/mongodb/DBApiLayer;->command(Lcom/mongodb/DBObject;)Lcom/mongodb/CommandResult;

    move-result-object v0

    .line 84
    .local v0, "commandResult":Lcom/mongodb/CommandResult;
    invoke-virtual {v0}, Lcom/mongodb/CommandResult;->throwOnError()V

    .line 85
    new-instance v3, Lcom/mongodb/WriteResult;

    invoke-virtual {p0}, Lcom/mongodb/DBApiLayer;->getWriteConcern()Lcom/mongodb/WriteConcern;

    move-result-object v4

    invoke-direct {v3, v0, v4}, Lcom/mongodb/WriteResult;-><init>(Lcom/mongodb/CommandResult;Lcom/mongodb/WriteConcern;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 90
    invoke-virtual {p0}, Lcom/mongodb/DBApiLayer;->requestDone()V

    .end local v0    # "commandResult":Lcom/mongodb/CommandResult;
    .end local v1    # "userCommandDocument":Lcom/mongodb/DBObject;
    .end local v2    # "userInfoResult":Lcom/mongodb/CommandResult;
    :goto_1
    return-object v3

    .line 80
    .restart local v2    # "userInfoResult":Lcom/mongodb/CommandResult;
    :cond_0
    :try_start_1
    const-string/jumbo v3, "updateUser"

    goto :goto_0

    .line 87
    .end local v2    # "userInfoResult":Lcom/mongodb/CommandResult;
    :cond_1
    invoke-super {p0, p1, p2, p3}, Lcom/mongodb/DB;->addUser(Ljava/lang/String;[CZ)Lcom/mongodb/WriteResult;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v3

    .line 90
    invoke-virtual {p0}, Lcom/mongodb/DBApiLayer;->requestDone()V

    goto :goto_1

    :catchall_0
    move-exception v3

    invoke-virtual {p0}, Lcom/mongodb/DBApiLayer;->requestDone()V

    throw v3
.end method

.method public cleanCursors(Z)V
    .locals 14
    .param p1, "force"    # Z

    .prologue
    .line 139
    iget-object v9, p0, Lcom/mongodb/DBApiLayer;->_deadCursorIds:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v9}, Ljava/util/concurrent/ConcurrentLinkedQueue;->size()I

    move-result v5

    .line 141
    .local v5, "sz":I
    if-eqz v5, :cond_0

    if-nez p1, :cond_1

    const/16 v9, 0x64

    if-ge v5, v9, :cond_1

    .line 167
    :cond_0
    return-void

    .line 144
    :cond_1
    sget-object v9, Lcom/mongodb/Bytes;->LOGGER:Ljava/util/logging/Logger;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v11, "going to kill cursors : "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/util/logging/Logger;->info(Ljava/lang/String;)V

    .line 146
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 148
    .local v4, "m":Ljava/util/Map;, "Ljava/util/Map<Lcom/mongodb/ServerAddress;Ljava/util/List<Ljava/lang/Long;>;>;"
    :goto_0
    iget-object v9, p0, Lcom/mongodb/DBApiLayer;->_deadCursorIds:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v9}, Ljava/util/concurrent/ConcurrentLinkedQueue;->poll()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mongodb/DBApiLayer$DeadCursor;

    .local v0, "c":Lcom/mongodb/DBApiLayer$DeadCursor;
    if-eqz v0, :cond_3

    .line 149
    iget-object v9, v0, Lcom/mongodb/DBApiLayer$DeadCursor;->host:Lcom/mongodb/ServerAddress;

    invoke-interface {v4, v9}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/util/List;

    .line 150
    .local v8, "x":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Long;>;"
    if-nez v8, :cond_2

    .line 151
    new-instance v8, Ljava/util/LinkedList;

    .end local v8    # "x":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Long;>;"
    invoke-direct {v8}, Ljava/util/LinkedList;-><init>()V

    .line 152
    .restart local v8    # "x":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Long;>;"
    iget-object v9, v0, Lcom/mongodb/DBApiLayer$DeadCursor;->host:Lcom/mongodb/ServerAddress;

    invoke-interface {v4, v9, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 154
    :cond_2
    iget-wide v10, v0, Lcom/mongodb/DBApiLayer$DeadCursor;->id:J

    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    invoke-interface {v8, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 157
    .end local v8    # "x":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Long;>;"
    :cond_3
    invoke-interface {v4}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v9

    invoke-interface {v9}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_4
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 159
    .local v1, "e":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lcom/mongodb/ServerAddress;Ljava/util/List<Ljava/lang/Long;>;>;"
    :try_start_0
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/mongodb/ServerAddress;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/util/List;

    invoke-virtual {p0, v9, v10}, Lcom/mongodb/DBApiLayer;->killCursors(Lcom/mongodb/ServerAddress;Ljava/util/List;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 161
    :catch_0
    move-exception v6

    .line 162
    .local v6, "t":Ljava/lang/Throwable;
    sget-object v9, Lcom/mongodb/Bytes;->LOGGER:Ljava/util/logging/Logger;

    sget-object v10, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    const-string/jumbo v11, "can\'t clean cursors"

    invoke-virtual {v9, v10, v11, v6}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 163
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/util/List;

    invoke-interface {v9}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :goto_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_4

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Long;

    .line 164
    .local v7, "x":Ljava/lang/Long;
    iget-object v10, p0, Lcom/mongodb/DBApiLayer;->_deadCursorIds:Ljava/util/concurrent/ConcurrentLinkedQueue;

    new-instance v11, Lcom/mongodb/DBApiLayer$DeadCursor;

    invoke-virtual {v7}, Ljava/lang/Long;->longValue()J

    move-result-wide v12

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/mongodb/ServerAddress;

    invoke-direct {v11, v12, v13, v9}, Lcom/mongodb/DBApiLayer$DeadCursor;-><init>(JLcom/mongodb/ServerAddress;)V

    invoke-virtual {v10, v11}, Ljava/util/concurrent/ConcurrentLinkedQueue;->add(Ljava/lang/Object;)Z

    goto :goto_2
.end method

.method doAuthenticate(Lcom/mongodb/MongoCredential;)Lcom/mongodb/CommandResult;
    .locals 1
    .param p1, "credentials"    # Lcom/mongodb/MongoCredential;

    .prologue
    .line 195
    iget-object v0, p0, Lcom/mongodb/DBApiLayer;->_connector:Lcom/mongodb/DBTCPConnector;

    invoke-virtual {v0, p1}, Lcom/mongodb/DBTCPConnector;->authenticate(Lcom/mongodb/MongoCredential;)Lcom/mongodb/CommandResult;

    move-result-object v0

    return-object v0
.end method

.method protected bridge synthetic doGetCollection(Ljava/lang/String;)Lcom/mongodb/DBCollection;
    .locals 1
    .param p1, "x0"    # Ljava/lang/String;

    .prologue
    .line 33
    invoke-virtual {p0, p1}, Lcom/mongodb/DBApiLayer;->doGetCollection(Ljava/lang/String;)Lcom/mongodb/DBCollectionImpl;

    move-result-object v0

    return-object v0
.end method

.method protected doGetCollection(Ljava/lang/String;)Lcom/mongodb/DBCollectionImpl;
    .locals 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 123
    iget-object v2, p0, Lcom/mongodb/DBApiLayer;->_collections:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v2, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mongodb/DBCollectionImpl;

    .line 124
    .local v0, "c":Lcom/mongodb/DBCollectionImpl;
    if-eqz v0, :cond_1

    move-object v1, v0

    .line 129
    :cond_0
    :goto_0
    return-object v1

    .line 127
    :cond_1
    new-instance v0, Lcom/mongodb/DBCollectionImpl;

    .end local v0    # "c":Lcom/mongodb/DBCollectionImpl;
    invoke-direct {v0, p0, p1}, Lcom/mongodb/DBCollectionImpl;-><init>(Lcom/mongodb/DBApiLayer;Ljava/lang/String;)V

    .line 128
    .restart local v0    # "c":Lcom/mongodb/DBCollectionImpl;
    iget-object v2, p0, Lcom/mongodb/DBApiLayer;->_collections:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v2, p1, v0}, Ljava/util/concurrent/ConcurrentHashMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mongodb/DBCollectionImpl;

    .line 129
    .local v1, "old":Lcom/mongodb/DBCollectionImpl;
    if-nez v1, :cond_0

    move-object v1, v0

    goto :goto_0
.end method

.method getConnector()Lcom/mongodb/DBTCPConnector;
    .locals 1

    .prologue
    .line 42
    iget-object v0, p0, Lcom/mongodb/DBApiLayer;->_connector:Lcom/mongodb/DBTCPConnector;

    return-object v0
.end method

.method killCursors(Lcom/mongodb/ServerAddress;Ljava/util/List;)V
    .locals 9
    .param p1, "addr"    # Lcom/mongodb/ServerAddress;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/mongodb/ServerAddress;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Long;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p2, "all":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Long;>;"
    const/16 v8, 0x4e20

    .line 170
    if-eqz p2, :cond_0

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v5

    if-nez v5, :cond_1

    .line 191
    :cond_0
    :goto_0
    return-void

    .line 173
    :cond_1
    iget-object v5, p0, Lcom/mongodb/DBApiLayer;->_mongo:Lcom/mongodb/Mongo;

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v6

    invoke-static {v8, v6}, Ljava/lang/Math;->min(II)I

    move-result v6

    invoke-static {v5, v6}, Lcom/mongodb/OutMessage;->killCursors(Lcom/mongodb/Mongo;I)Lcom/mongodb/OutMessage;

    move-result-object v2

    .line 175
    .local v2, "om":Lcom/mongodb/OutMessage;
    const/4 v3, 0x0

    .line 176
    .local v3, "soFar":I
    const/4 v4, 0x0

    .line 177
    .local v4, "totalSoFar":I
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_2
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Long;

    .line 178
    .local v1, "l":Ljava/lang/Long;
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    invoke-virtual {v2, v6, v7}, Lcom/mongodb/OutMessage;->writeLong(J)V

    .line 180
    add-int/lit8 v4, v4, 0x1

    .line 181
    add-int/lit8 v3, v3, 0x1

    .line 183
    if-lt v3, v8, :cond_2

    .line 184
    iget-object v5, p0, Lcom/mongodb/DBApiLayer;->_connector:Lcom/mongodb/DBTCPConnector;

    sget-object v6, Lcom/mongodb/WriteConcern;->NONE:Lcom/mongodb/WriteConcern;

    invoke-virtual {v5, p0, v2, v6}, Lcom/mongodb/DBTCPConnector;->say(Lcom/mongodb/DB;Lcom/mongodb/OutMessage;Lcom/mongodb/WriteConcern;)Lcom/mongodb/WriteResult;

    .line 185
    iget-object v5, p0, Lcom/mongodb/DBApiLayer;->_mongo:Lcom/mongodb/Mongo;

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v6

    sub-int/2addr v6, v4

    invoke-static {v8, v6}, Ljava/lang/Math;->min(II)I

    move-result v6

    invoke-static {v5, v6}, Lcom/mongodb/OutMessage;->killCursors(Lcom/mongodb/Mongo;I)Lcom/mongodb/OutMessage;

    move-result-object v2

    .line 186
    const/4 v3, 0x0

    goto :goto_1

    .line 190
    .end local v1    # "l":Ljava/lang/Long;
    :cond_3
    iget-object v5, p0, Lcom/mongodb/DBApiLayer;->_connector:Lcom/mongodb/DBTCPConnector;

    sget-object v6, Lcom/mongodb/WriteConcern;->NONE:Lcom/mongodb/WriteConcern;

    invoke-virtual {v5, p0, v2, v6, p1}, Lcom/mongodb/DBTCPConnector;->say(Lcom/mongodb/DB;Lcom/mongodb/OutMessage;Lcom/mongodb/WriteConcern;Lcom/mongodb/ServerAddress;)Lcom/mongodb/WriteResult;

    goto :goto_0
.end method

.method public removeUser(Ljava/lang/String;)Lcom/mongodb/WriteResult;
    .locals 3
    .param p1, "username"    # Ljava/lang/String;

    .prologue
    .line 95
    invoke-virtual {p0}, Lcom/mongodb/DBApiLayer;->requestStart()V

    .line 97
    :try_start_0
    iget-object v1, p0, Lcom/mongodb/DBApiLayer;->_connector:Lcom/mongodb/DBTCPConnector;

    invoke-virtual {v1}, Lcom/mongodb/DBTCPConnector;->getPrimaryPort()Lcom/mongodb/DBPort;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/mongodb/DBApiLayer;->useUserCommands(Lcom/mongodb/DBPort;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 98
    new-instance v1, Lcom/mongodb/BasicDBObject;

    const-string/jumbo v2, "dropUser"

    invoke-direct {v1, v2, p1}, Lcom/mongodb/BasicDBObject;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {p0, v1}, Lcom/mongodb/DBApiLayer;->command(Lcom/mongodb/DBObject;)Lcom/mongodb/CommandResult;

    move-result-object v0

    .line 99
    .local v0, "res":Lcom/mongodb/CommandResult;
    invoke-virtual {v0}, Lcom/mongodb/CommandResult;->throwOnError()V

    .line 100
    new-instance v1, Lcom/mongodb/WriteResult;

    invoke-virtual {p0}, Lcom/mongodb/DBApiLayer;->getWriteConcern()Lcom/mongodb/WriteConcern;

    move-result-object v2

    invoke-direct {v1, v0, v2}, Lcom/mongodb/WriteResult;-><init>(Lcom/mongodb/CommandResult;Lcom/mongodb/WriteConcern;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 106
    invoke-virtual {p0}, Lcom/mongodb/DBApiLayer;->requestDone()V

    .end local v0    # "res":Lcom/mongodb/CommandResult;
    :goto_0
    return-object v1

    .line 103
    :cond_0
    :try_start_1
    invoke-super {p0, p1}, Lcom/mongodb/DB;->removeUser(Ljava/lang/String;)Lcom/mongodb/WriteResult;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v1

    .line 106
    invoke-virtual {p0}, Lcom/mongodb/DBApiLayer;->requestDone()V

    goto :goto_0

    :catchall_0
    move-exception v1

    invoke-virtual {p0}, Lcom/mongodb/DBApiLayer;->requestDone()V

    throw v1
.end method

.method public requestDone()V
    .locals 1

    .prologue
    .line 67
    iget-object v0, p0, Lcom/mongodb/DBApiLayer;->_connector:Lcom/mongodb/DBTCPConnector;

    invoke-virtual {v0}, Lcom/mongodb/DBTCPConnector;->requestDone()V

    .line 68
    return-void
.end method

.method public requestEnsureConnection()V
    .locals 1

    .prologue
    .line 71
    iget-object v0, p0, Lcom/mongodb/DBApiLayer;->_connector:Lcom/mongodb/DBTCPConnector;

    invoke-virtual {v0}, Lcom/mongodb/DBTCPConnector;->requestEnsureConnection()V

    .line 72
    return-void
.end method

.method public requestStart()V
    .locals 1

    .prologue
    .line 63
    iget-object v0, p0, Lcom/mongodb/DBApiLayer;->_connector:Lcom/mongodb/DBTCPConnector;

    invoke-virtual {v0}, Lcom/mongodb/DBTCPConnector;->requestStart()V

    .line 64
    return-void
.end method
