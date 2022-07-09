.class public Lcom/mongodb/Mongo;
.super Ljava/lang/Object;
.source "Mongo.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mongodb/Mongo$CursorCleanerThread;,
        Lcom/mongodb/Mongo$Holder;
    }
.end annotation


# static fields
.field private static final ADMIN_DATABASE_NAME:Ljava/lang/String; = "admin"

.field private static final FULL_VERSION:Ljava/lang/String; = "2.12.4"

.field public static final MAJOR_VERSION:I = 0x2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final MINOR_VERSION:I = 0xc
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field static cleanerIntervalMS:I

.field static logger:Ljava/util/logging/Logger;


# instance fields
.field final _authority:Lcom/mongodb/MongoAuthority;

.field _bufferPool:Lorg/bson/util/SimplePool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/bson/util/SimplePool",
            "<",
            "Lorg/bson/io/PoolOutputBuffer;",
            ">;"
        }
    .end annotation
.end field

.field final _cleaner:Lcom/mongodb/Mongo$CursorCleanerThread;

.field private _concern:Lcom/mongodb/WriteConcern;

.field final _connector:Lcom/mongodb/DBTCPConnector;

.field final _dbs:Ljava/util/concurrent/ConcurrentMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/mongodb/DB;",
            ">;"
        }
    .end annotation
.end field

.field final _netOptions:Lcom/mongodb/Bytes$OptionHolder;

.field final _options:Lcom/mongodb/MongoOptions;

.field private _readPref:Lcom/mongodb/ReadPreference;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 76
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/mongodb/Bytes;->LOGGER:Ljava/util/logging/Logger;

    invoke-virtual {v1}, Ljava/util/logging/Logger;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ".Mongo"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v0

    sput-object v0, Lcom/mongodb/Mongo;->logger:Ljava/util/logging/Logger;

    .line 101
    const-string/jumbo v0, "com.mongodb.cleanerIntervalMS"

    const-string/jumbo v1, "1000"

    invoke-static {v0, v1}, Ljava/lang/System;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    sput v0, Lcom/mongodb/Mongo;->cleanerIntervalMS:I

    .line 102
    return-void
.end method

.method public constructor <init>()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/UnknownHostException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 150
    new-instance v0, Lcom/mongodb/ServerAddress;

    invoke-direct {v0}, Lcom/mongodb/ServerAddress;-><init>()V

    invoke-direct {p0, v0}, Lcom/mongodb/Mongo;-><init>(Lcom/mongodb/ServerAddress;)V

    .line 151
    return-void
.end method

.method constructor <init>(Lcom/mongodb/MongoAuthority;Lcom/mongodb/MongoOptions;)V
    .locals 4
    .param p1, "authority"    # Lcom/mongodb/MongoAuthority;
    .param p2, "options"    # Lcom/mongodb/MongoOptions;

    .prologue
    const/4 v3, 0x0

    .line 338
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 662
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lcom/mongodb/Mongo;->_dbs:Ljava/util/concurrent/ConcurrentMap;

    .line 663
    sget-object v0, Lcom/mongodb/WriteConcern;->NORMAL:Lcom/mongodb/WriteConcern;

    iput-object v0, p0, Lcom/mongodb/Mongo;->_concern:Lcom/mongodb/WriteConcern;

    .line 664
    invoke-static {}, Lcom/mongodb/ReadPreference;->primary()Lcom/mongodb/ReadPreference;

    move-result-object v0

    iput-object v0, p0, Lcom/mongodb/Mongo;->_readPref:Lcom/mongodb/ReadPreference;

    .line 665
    new-instance v0, Lcom/mongodb/Bytes$OptionHolder;

    invoke-direct {v0, v3}, Lcom/mongodb/Bytes$OptionHolder;-><init>(Lcom/mongodb/Bytes$OptionHolder;)V

    iput-object v0, p0, Lcom/mongodb/Mongo;->_netOptions:Lcom/mongodb/Bytes$OptionHolder;

    .line 670
    new-instance v0, Lcom/mongodb/Mongo$1;

    const/16 v1, 0x3e8

    invoke-direct {v0, p0, v1}, Lcom/mongodb/Mongo$1;-><init>(Lcom/mongodb/Mongo;I)V

    iput-object v0, p0, Lcom/mongodb/Mongo;->_bufferPool:Lorg/bson/util/SimplePool;

    .line 339
    sget-object v0, Lcom/mongodb/Mongo;->logger:Ljava/util/logging/Logger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Creating Mongo instance (driver version "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/mongodb/Mongo;->getVersion()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ") with authority "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " and options "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->info(Ljava/lang/String;)V

    .line 340
    iput-object p1, p0, Lcom/mongodb/Mongo;->_authority:Lcom/mongodb/MongoAuthority;

    .line 341
    iput-object p2, p0, Lcom/mongodb/Mongo;->_options:Lcom/mongodb/MongoOptions;

    .line 342
    invoke-virtual {p0}, Lcom/mongodb/Mongo;->_applyMongoOptions()V

    .line 344
    new-instance v0, Lcom/mongodb/DBTCPConnector;

    invoke-direct {v0, p0}, Lcom/mongodb/DBTCPConnector;-><init>(Lcom/mongodb/Mongo;)V

    iput-object v0, p0, Lcom/mongodb/Mongo;->_connector:Lcom/mongodb/DBTCPConnector;

    .line 346
    iget-object v0, p0, Lcom/mongodb/Mongo;->_connector:Lcom/mongodb/DBTCPConnector;

    invoke-virtual {v0}, Lcom/mongodb/DBTCPConnector;->start()V

    .line 347
    iget-object v0, p0, Lcom/mongodb/Mongo;->_options:Lcom/mongodb/MongoOptions;

    iget-boolean v0, v0, Lcom/mongodb/MongoOptions;->cursorFinalizerEnabled:Z

    if-eqz v0, :cond_0

    .line 348
    new-instance v0, Lcom/mongodb/Mongo$CursorCleanerThread;

    invoke-direct {v0, p0}, Lcom/mongodb/Mongo$CursorCleanerThread;-><init>(Lcom/mongodb/Mongo;)V

    iput-object v0, p0, Lcom/mongodb/Mongo;->_cleaner:Lcom/mongodb/Mongo$CursorCleanerThread;

    .line 349
    iget-object v0, p0, Lcom/mongodb/Mongo;->_cleaner:Lcom/mongodb/Mongo$CursorCleanerThread;

    invoke-virtual {v0}, Lcom/mongodb/Mongo$CursorCleanerThread;->start()V

    .line 353
    :goto_0
    return-void

    .line 351
    :cond_0
    iput-object v3, p0, Lcom/mongodb/Mongo;->_cleaner:Lcom/mongodb/Mongo$CursorCleanerThread;

    goto :goto_0
.end method

.method public constructor <init>(Lcom/mongodb/MongoURI;)V
    .locals 2
    .param p1, "uri"    # Lcom/mongodb/MongoURI;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/UnknownHostException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 327
    invoke-static {p1}, Lcom/mongodb/Mongo;->getMongoAuthorityFromURI(Lcom/mongodb/MongoURI;)Lcom/mongodb/MongoAuthority;

    move-result-object v0

    invoke-virtual {p1}, Lcom/mongodb/MongoURI;->getOptions()Lcom/mongodb/MongoOptions;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/mongodb/Mongo;-><init>(Lcom/mongodb/MongoAuthority;Lcom/mongodb/MongoOptions;)V

    .line 328
    return-void
.end method

.method public constructor <init>(Lcom/mongodb/ServerAddress;)V
    .locals 1
    .param p1, "addr"    # Lcom/mongodb/ServerAddress;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 211
    new-instance v0, Lcom/mongodb/MongoOptions;

    invoke-direct {v0}, Lcom/mongodb/MongoOptions;-><init>()V

    invoke-direct {p0, p1, v0}, Lcom/mongodb/Mongo;-><init>(Lcom/mongodb/ServerAddress;Lcom/mongodb/MongoOptions;)V

    .line 212
    return-void
.end method

.method public constructor <init>(Lcom/mongodb/ServerAddress;Lcom/mongodb/MongoOptions;)V
    .locals 1
    .param p1, "addr"    # Lcom/mongodb/ServerAddress;
    .param p2, "options"    # Lcom/mongodb/MongoOptions;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 226
    invoke-static {p1}, Lcom/mongodb/MongoAuthority;->direct(Lcom/mongodb/ServerAddress;)Lcom/mongodb/MongoAuthority;

    move-result-object v0

    invoke-direct {p0, v0, p2}, Lcom/mongodb/Mongo;-><init>(Lcom/mongodb/MongoAuthority;Lcom/mongodb/MongoOptions;)V

    .line 227
    return-void
.end method

.method public constructor <init>(Lcom/mongodb/ServerAddress;Lcom/mongodb/ServerAddress;)V
    .locals 1
    .param p1, "left"    # Lcom/mongodb/ServerAddress;
    .param p2, "right"    # Lcom/mongodb/ServerAddress;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 241
    new-instance v0, Lcom/mongodb/MongoOptions;

    invoke-direct {v0}, Lcom/mongodb/MongoOptions;-><init>()V

    invoke-direct {p0, p1, p2, v0}, Lcom/mongodb/Mongo;-><init>(Lcom/mongodb/ServerAddress;Lcom/mongodb/ServerAddress;Lcom/mongodb/MongoOptions;)V

    .line 242
    return-void
.end method

.method public constructor <init>(Lcom/mongodb/ServerAddress;Lcom/mongodb/ServerAddress;Lcom/mongodb/MongoOptions;)V
    .locals 2
    .param p1, "left"    # Lcom/mongodb/ServerAddress;
    .param p2, "right"    # Lcom/mongodb/ServerAddress;
    .param p3, "options"    # Lcom/mongodb/MongoOptions;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 258
    const/4 v0, 0x2

    new-array v0, v0, [Lcom/mongodb/ServerAddress;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    const/4 v1, 0x1

    aput-object p2, v0, v1

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lcom/mongodb/MongoAuthority;->dynamicSet(Ljava/util/List;)Lcom/mongodb/MongoAuthority;

    move-result-object v0

    invoke-direct {p0, v0, p3}, Lcom/mongodb/Mongo;-><init>(Lcom/mongodb/MongoAuthority;Lcom/mongodb/MongoOptions;)V

    .line 259
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "host"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/UnknownHostException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 165
    new-instance v0, Lcom/mongodb/ServerAddress;

    invoke-direct {v0, p1}, Lcom/mongodb/ServerAddress;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v0}, Lcom/mongodb/Mongo;-><init>(Lcom/mongodb/ServerAddress;)V

    .line 166
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;I)V
    .locals 1
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "port"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/UnknownHostException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 197
    new-instance v0, Lcom/mongodb/ServerAddress;

    invoke-direct {v0, p1, p2}, Lcom/mongodb/ServerAddress;-><init>(Ljava/lang/String;I)V

    invoke-direct {p0, v0}, Lcom/mongodb/Mongo;-><init>(Lcom/mongodb/ServerAddress;)V

    .line 198
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/mongodb/MongoOptions;)V
    .locals 1
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "options"    # Lcom/mongodb/MongoOptions;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/UnknownHostException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 181
    new-instance v0, Lcom/mongodb/ServerAddress;

    invoke-direct {v0, p1}, Lcom/mongodb/ServerAddress;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v0, p2}, Lcom/mongodb/Mongo;-><init>(Lcom/mongodb/ServerAddress;Lcom/mongodb/MongoOptions;)V

    .line 182
    return-void
.end method

.method public constructor <init>(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/ServerAddress;",
            ">;)V"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 281
    .local p1, "seeds":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/ServerAddress;>;"
    new-instance v0, Lcom/mongodb/MongoOptions;

    invoke-direct {v0}, Lcom/mongodb/MongoOptions;-><init>()V

    invoke-direct {p0, p1, v0}, Lcom/mongodb/Mongo;-><init>(Ljava/util/List;Lcom/mongodb/MongoOptions;)V

    .line 282
    return-void
.end method

.method public constructor <init>(Ljava/util/List;Lcom/mongodb/MongoOptions;)V
    .locals 1
    .param p2, "options"    # Lcom/mongodb/MongoOptions;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/ServerAddress;",
            ">;",
            "Lcom/mongodb/MongoOptions;",
            ")V"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 305
    .local p1, "seeds":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/ServerAddress;>;"
    invoke-static {p1}, Lcom/mongodb/MongoAuthority;->dynamicSet(Ljava/util/List;)Lcom/mongodb/MongoAuthority;

    move-result-object v0

    invoke-direct {p0, v0, p2}, Lcom/mongodb/Mongo;-><init>(Lcom/mongodb/MongoAuthority;Lcom/mongodb/MongoOptions;)V

    .line 306
    return-void
.end method

.method public static connect(Lcom/mongodb/DBAddress;)Lcom/mongodb/DB;
    .locals 2
    .param p0, "addr"    # Lcom/mongodb/DBAddress;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 136
    new-instance v0, Lcom/mongodb/Mongo;

    invoke-direct {v0, p0}, Lcom/mongodb/Mongo;-><init>(Lcom/mongodb/ServerAddress;)V

    invoke-virtual {p0}, Lcom/mongodb/DBAddress;->getDBName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/mongodb/Mongo;->getDB(Ljava/lang/String;)Lcom/mongodb/DB;

    move-result-object v0

    return-object v0
.end method

.method public static getMajorVersion()I
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 112
    const/4 v0, 0x2

    return v0
.end method

.method public static getMinorVersion()I
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 123
    const/16 v0, 0xc

    return v0
.end method

.method private static getMongoAuthorityFromURI(Lcom/mongodb/MongoURI;)Lcom/mongodb/MongoAuthority;
    .locals 6
    .param p0, "uri"    # Lcom/mongodb/MongoURI;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/UnknownHostException;
        }
    .end annotation

    .prologue
    .line 649
    invoke-virtual {p0}, Lcom/mongodb/MongoURI;->getHosts()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    const/4 v4, 0x1

    if-ne v3, v4, :cond_0

    .line 650
    new-instance v4, Lcom/mongodb/ServerAddress;

    invoke-virtual {p0}, Lcom/mongodb/MongoURI;->getHosts()Ljava/util/List;

    move-result-object v3

    const/4 v5, 0x0

    invoke-interface {v3, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-direct {v4, v3}, Lcom/mongodb/ServerAddress;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/mongodb/MongoURI;->getCredentials()Lcom/mongodb/MongoCredential;

    move-result-object v3

    invoke-static {v4, v3}, Lcom/mongodb/MongoAuthority;->direct(Lcom/mongodb/ServerAddress;Lcom/mongodb/MongoCredential;)Lcom/mongodb/MongoAuthority;

    move-result-object v3

    .line 656
    :goto_0
    return-object v3

    .line 653
    :cond_0
    new-instance v2, Ljava/util/ArrayList;

    invoke-virtual {p0}, Lcom/mongodb/MongoURI;->getHosts()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 654
    .local v2, "replicaSetSeeds":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/ServerAddress;>;"
    invoke-virtual {p0}, Lcom/mongodb/MongoURI;->getHosts()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 655
    .local v0, "host":Ljava/lang/String;
    new-instance v3, Lcom/mongodb/ServerAddress;

    invoke-direct {v3, v0}, Lcom/mongodb/ServerAddress;-><init>(Ljava/lang/String;)V

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 656
    .end local v0    # "host":Ljava/lang/String;
    :cond_1
    invoke-virtual {p0}, Lcom/mongodb/MongoURI;->getCredentials()Lcom/mongodb/MongoCredential;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mongodb/MongoAuthority;->dynamicSet(Ljava/util/List;Lcom/mongodb/MongoCredential;)Lcom/mongodb/MongoAuthority;

    move-result-object v3

    goto :goto_0
.end method


# virtual methods
.method _applyMongoOptions()V
    .locals 1

    .prologue
    .line 612
    iget-object v0, p0, Lcom/mongodb/Mongo;->_options:Lcom/mongodb/MongoOptions;

    iget-boolean v0, v0, Lcom/mongodb/MongoOptions;->slaveOk:Z

    if-eqz v0, :cond_0

    .line 613
    invoke-virtual {p0}, Lcom/mongodb/Mongo;->slaveOk()V

    .line 615
    :cond_0
    iget-object v0, p0, Lcom/mongodb/Mongo;->_options:Lcom/mongodb/MongoOptions;

    invoke-virtual {v0}, Lcom/mongodb/MongoOptions;->getReadPreference()Lcom/mongodb/ReadPreference;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 616
    iget-object v0, p0, Lcom/mongodb/Mongo;->_options:Lcom/mongodb/MongoOptions;

    invoke-virtual {v0}, Lcom/mongodb/MongoOptions;->getReadPreference()Lcom/mongodb/ReadPreference;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/mongodb/Mongo;->setReadPreference(Lcom/mongodb/ReadPreference;)V

    .line 618
    :cond_1
    iget-object v0, p0, Lcom/mongodb/Mongo;->_options:Lcom/mongodb/MongoOptions;

    invoke-virtual {v0}, Lcom/mongodb/MongoOptions;->getWriteConcern()Lcom/mongodb/WriteConcern;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/mongodb/Mongo;->setWriteConcern(Lcom/mongodb/WriteConcern;)V

    .line 619
    return-void
.end method

.method public addOption(I)V
    .locals 1
    .param p1, "option"    # I

    .prologue
    .line 578
    iget-object v0, p0, Lcom/mongodb/Mongo;->_netOptions:Lcom/mongodb/Bytes$OptionHolder;

    invoke-virtual {v0, p1}, Lcom/mongodb/Bytes$OptionHolder;->add(I)V

    .line 579
    return-void
.end method

.method public close()V
    .locals 1

    .prologue
    .line 507
    :try_start_0
    iget-object v0, p0, Lcom/mongodb/Mongo;->_connector:Lcom/mongodb/DBTCPConnector;

    invoke-virtual {v0}, Lcom/mongodb/DBTCPConnector;->close()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_1

    .line 510
    :goto_0
    iget-object v0, p0, Lcom/mongodb/Mongo;->_cleaner:Lcom/mongodb/Mongo$CursorCleanerThread;

    if-eqz v0, :cond_0

    .line 511
    iget-object v0, p0, Lcom/mongodb/Mongo;->_cleaner:Lcom/mongodb/Mongo$CursorCleanerThread;

    invoke-virtual {v0}, Lcom/mongodb/Mongo$CursorCleanerThread;->interrupt()V

    .line 514
    :try_start_1
    iget-object v0, p0, Lcom/mongodb/Mongo;->_cleaner:Lcom/mongodb/Mongo$CursorCleanerThread;

    invoke-virtual {v0}, Lcom/mongodb/Mongo$CursorCleanerThread;->join()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    .line 519
    :cond_0
    :goto_1
    return-void

    .line 515
    :catch_0
    move-exception v0

    goto :goto_1

    .line 508
    :catch_1
    move-exception v0

    goto :goto_0
.end method

.method public debugString()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 436
    iget-object v0, p0, Lcom/mongodb/Mongo;->_connector:Lcom/mongodb/DBTCPConnector;

    invoke-virtual {v0}, Lcom/mongodb/DBTCPConnector;->debugString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public dropDatabase(Ljava/lang/String;)V
    .locals 1
    .param p1, "dbName"    # Ljava/lang/String;

    .prologue
    .line 417
    invoke-virtual {p0, p1}, Lcom/mongodb/Mongo;->getDB(Ljava/lang/String;)Lcom/mongodb/DB;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mongodb/DB;->dropDatabase()V

    .line 418
    return-void
.end method

.method public fsync(Z)Lcom/mongodb/CommandResult;
    .locals 5
    .param p1, "async"    # Z

    .prologue
    const/4 v4, 0x1

    .line 689
    new-instance v0, Lcom/mongodb/BasicDBObject;

    const-string/jumbo v2, "fsync"

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-direct {v0, v2, v3}, Lcom/mongodb/BasicDBObject;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    .line 690
    .local v0, "cmd":Lcom/mongodb/DBObject;
    if-eqz p1, :cond_0

    .line 691
    const-string/jumbo v2, "async"

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v0, v2, v3}, Lcom/mongodb/DBObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 693
    :cond_0
    const-string/jumbo v2, "admin"

    invoke-virtual {p0, v2}, Lcom/mongodb/Mongo;->getDB(Ljava/lang/String;)Lcom/mongodb/DB;

    move-result-object v2

    invoke-virtual {v2, v0}, Lcom/mongodb/DB;->command(Lcom/mongodb/DBObject;)Lcom/mongodb/CommandResult;

    move-result-object v1

    .line 694
    .local v1, "result":Lcom/mongodb/CommandResult;
    invoke-virtual {v1}, Lcom/mongodb/CommandResult;->throwOnError()V

    .line 695
    return-object v1
.end method

.method public fsyncAndLock()Lcom/mongodb/CommandResult;
    .locals 5

    .prologue
    const/4 v4, 0x1

    .line 707
    new-instance v0, Lcom/mongodb/BasicDBObject;

    const-string/jumbo v2, "fsync"

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-direct {v0, v2, v3}, Lcom/mongodb/BasicDBObject;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    .line 708
    .local v0, "cmd":Lcom/mongodb/DBObject;
    const-string/jumbo v2, "lock"

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v0, v2, v3}, Lcom/mongodb/DBObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 709
    const-string/jumbo v2, "admin"

    invoke-virtual {p0, v2}, Lcom/mongodb/Mongo;->getDB(Ljava/lang/String;)Lcom/mongodb/DB;

    move-result-object v2

    invoke-virtual {v2, v0}, Lcom/mongodb/DB;->command(Lcom/mongodb/DBObject;)Lcom/mongodb/CommandResult;

    move-result-object v1

    .line 710
    .local v1, "result":Lcom/mongodb/CommandResult;
    invoke-virtual {v1}, Lcom/mongodb/CommandResult;->throwOnError()V

    .line 711
    return-object v1
.end method

.method public getAddress()Lcom/mongodb/ServerAddress;
    .locals 1

    .prologue
    .line 473
    iget-object v0, p0, Lcom/mongodb/Mongo;->_connector:Lcom/mongodb/DBTCPConnector;

    invoke-virtual {v0}, Lcom/mongodb/DBTCPConnector;->getAddress()Lcom/mongodb/ServerAddress;

    move-result-object v0

    return-object v0
.end method

.method public getAllAddress()Ljava/util/List;
    .locals 4
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
    .line 483
    iget-object v1, p0, Lcom/mongodb/Mongo;->_connector:Lcom/mongodb/DBTCPConnector;

    invoke-virtual {v1}, Lcom/mongodb/DBTCPConnector;->getAllAddress()Ljava/util/List;

    move-result-object v0

    .line 484
    .local v0, "result":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/ServerAddress;>;"
    if-nez v0, :cond_0

    .line 485
    const/4 v1, 0x1

    new-array v1, v1, [Lcom/mongodb/ServerAddress;

    const/4 v2, 0x0

    invoke-virtual {p0}, Lcom/mongodb/Mongo;->getAddress()Lcom/mongodb/ServerAddress;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    .line 487
    .end local v0    # "result":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/ServerAddress;>;"
    :cond_0
    return-object v0
.end method

.method getAuthority()Lcom/mongodb/MongoAuthority;
    .locals 1

    .prologue
    .line 848
    iget-object v0, p0, Lcom/mongodb/Mongo;->_authority:Lcom/mongodb/MongoAuthority;

    return-object v0
.end method

.method public getConnectPoint()Ljava/lang/String;
    .locals 1

    .prologue
    .line 445
    iget-object v0, p0, Lcom/mongodb/Mongo;->_connector:Lcom/mongodb/DBTCPConnector;

    invoke-virtual {v0}, Lcom/mongodb/DBTCPConnector;->getConnectPoint()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getConnector()Lcom/mongodb/DBTCPConnector;
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 456
    iget-object v0, p0, Lcom/mongodb/Mongo;->_connector:Lcom/mongodb/DBTCPConnector;

    return-object v0
.end method

.method public getDB(Ljava/lang/String;)Lcom/mongodb/DB;
    .locals 3
    .param p1, "dbname"    # Ljava/lang/String;

    .prologue
    .line 363
    iget-object v2, p0, Lcom/mongodb/Mongo;->_dbs:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v2, p1}, Ljava/util/concurrent/ConcurrentMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mongodb/DB;

    .line 364
    .local v0, "db":Lcom/mongodb/DB;
    if-eqz v0, :cond_1

    move-object v1, v0

    .line 371
    :cond_0
    :goto_0
    return-object v1

    .line 367
    :cond_1
    new-instance v0, Lcom/mongodb/DBApiLayer;

    .end local v0    # "db":Lcom/mongodb/DB;
    iget-object v2, p0, Lcom/mongodb/Mongo;->_connector:Lcom/mongodb/DBTCPConnector;

    invoke-direct {v0, p0, p1, v2}, Lcom/mongodb/DBApiLayer;-><init>(Lcom/mongodb/Mongo;Ljava/lang/String;Lcom/mongodb/DBConnector;)V

    .line 368
    .restart local v0    # "db":Lcom/mongodb/DB;
    iget-object v2, p0, Lcom/mongodb/Mongo;->_dbs:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v2, p1, v0}, Ljava/util/concurrent/ConcurrentMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mongodb/DB;

    .line 369
    .local v1, "temp":Lcom/mongodb/DB;
    if-nez v1, :cond_0

    move-object v1, v0

    .line 371
    goto :goto_0
.end method

.method public getDatabaseNames()Ljava/util/List;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 392
    new-instance v0, Lcom/mongodb/BasicDBObject;

    invoke-direct {v0}, Lcom/mongodb/BasicDBObject;-><init>()V

    .line 393
    .local v0, "cmd":Lcom/mongodb/BasicDBObject;
    const-string/jumbo v6, "listDatabases"

    const/4 v7, 0x1

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v0, v6, v7}, Lcom/mongodb/BasicDBObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 396
    const-string/jumbo v6, "admin"

    invoke-virtual {p0, v6}, Lcom/mongodb/Mongo;->getDB(Ljava/lang/String;)Lcom/mongodb/DB;

    move-result-object v6

    invoke-virtual {p0}, Lcom/mongodb/Mongo;->getOptions()I

    move-result v7

    invoke-virtual {v6, v0, v7}, Lcom/mongodb/DB;->command(Lcom/mongodb/DBObject;I)Lcom/mongodb/CommandResult;

    move-result-object v5

    .line 397
    .local v5, "res":Lcom/mongodb/CommandResult;
    invoke-virtual {v5}, Lcom/mongodb/CommandResult;->throwOnError()V

    .line 399
    const-string/jumbo v6, "databases"

    invoke-virtual {v5, v6}, Lcom/mongodb/CommandResult;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    .line 401
    .local v2, "l":Ljava/util/List;
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 403
    .local v3, "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    .line 404
    .local v4, "o":Ljava/lang/Object;
    check-cast v4, Lcom/mongodb/BasicDBObject;

    .end local v4    # "o":Ljava/lang/Object;
    const-string/jumbo v6, "name"

    invoke-virtual {v4, v6}, Lcom/mongodb/BasicDBObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-interface {v3, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 406
    :cond_0
    return-object v3
.end method

.method public getMaxBsonObjectSize()I
    .locals 1

    .prologue
    .line 641
    iget-object v0, p0, Lcom/mongodb/Mongo;->_connector:Lcom/mongodb/DBTCPConnector;

    invoke-virtual {v0}, Lcom/mongodb/DBTCPConnector;->getMaxBsonObjectSize()I

    move-result v0

    return v0
.end method

.method public getMongoOptions()Lcom/mongodb/MongoOptions;
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 630
    iget-object v0, p0, Lcom/mongodb/Mongo;->_options:Lcom/mongodb/MongoOptions;

    return-object v0
.end method

.method public getOptions()I
    .locals 1

    .prologue
    .line 603
    iget-object v0, p0, Lcom/mongodb/Mongo;->_netOptions:Lcom/mongodb/Bytes$OptionHolder;

    invoke-virtual {v0}, Lcom/mongodb/Bytes$OptionHolder;->get()I

    move-result v0

    return v0
.end method

.method public getReadPreference()Lcom/mongodb/ReadPreference;
    .locals 1

    .prologue
    .line 558
    iget-object v0, p0, Lcom/mongodb/Mongo;->_readPref:Lcom/mongodb/ReadPreference;

    return-object v0
.end method

.method public getReplicaSetStatus()Lcom/mongodb/ReplicaSetStatus;
    .locals 1

    .prologue
    .line 465
    iget-object v0, p0, Lcom/mongodb/Mongo;->_connector:Lcom/mongodb/DBTCPConnector;

    invoke-virtual {v0}, Lcom/mongodb/DBTCPConnector;->getReplicaSetStatus()Lcom/mongodb/ReplicaSetStatus;

    move-result-object v0

    return-object v0
.end method

.method public getServerAddressList()Ljava/util/List;
    .locals 1
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
    .line 497
    iget-object v0, p0, Lcom/mongodb/Mongo;->_connector:Lcom/mongodb/DBTCPConnector;

    invoke-virtual {v0}, Lcom/mongodb/DBTCPConnector;->getServerAddressList()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getUsedDatabases()Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Lcom/mongodb/DB;",
            ">;"
        }
    .end annotation

    .prologue
    .line 381
    iget-object v0, p0, Lcom/mongodb/Mongo;->_dbs:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v0}, Ljava/util/concurrent/ConcurrentMap;->values()Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method

.method public getVersion()Ljava/lang/String;
    .locals 1

    .prologue
    .line 425
    const-string/jumbo v0, "2.12.4"

    return-object v0
.end method

.method public getWriteConcern()Lcom/mongodb/WriteConcern;
    .locals 1

    .prologue
    .line 538
    iget-object v0, p0, Lcom/mongodb/Mongo;->_concern:Lcom/mongodb/WriteConcern;

    return-object v0
.end method

.method public isLocked()Z
    .locals 6

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 736
    const-string/jumbo v5, "admin"

    invoke-virtual {p0, v5}, Lcom/mongodb/Mongo;->getDB(Ljava/lang/String;)Lcom/mongodb/DB;

    move-result-object v1

    .line 737
    .local v1, "db":Lcom/mongodb/DB;
    const-string/jumbo v5, "$cmd.sys.inprog"

    invoke-virtual {v1, v5}, Lcom/mongodb/DB;->getCollection(Ljava/lang/String;)Lcom/mongodb/DBCollection;

    move-result-object v0

    .line 738
    .local v0, "col":Lcom/mongodb/DBCollection;
    invoke-virtual {v0}, Lcom/mongodb/DBCollection;->findOne()Lcom/mongodb/DBObject;

    move-result-object v2

    check-cast v2, Lcom/mongodb/BasicDBObject;

    .line 739
    .local v2, "res":Lcom/mongodb/BasicDBObject;
    const-string/jumbo v5, "fsyncLock"

    invoke-virtual {v2, v5}, Lcom/mongodb/BasicDBObject;->containsField(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 740
    const-string/jumbo v5, "fsyncLock"

    invoke-virtual {v2, v5}, Lcom/mongodb/BasicDBObject;->getInt(Ljava/lang/String;)I

    move-result v5

    if-ne v5, v3, :cond_0

    .line 742
    :goto_0
    return v3

    :cond_0
    move v3, v4

    .line 740
    goto :goto_0

    :cond_1
    move v3, v4

    .line 742
    goto :goto_0
.end method

.method isMongosConnection()Z
    .locals 1

    .prologue
    .line 645
    iget-object v0, p0, Lcom/mongodb/Mongo;->_connector:Lcom/mongodb/DBTCPConnector;

    invoke-virtual {v0}, Lcom/mongodb/DBTCPConnector;->isMongosConnection()Z

    move-result v0

    return v0
.end method

.method public resetOptions()V
    .locals 1

    .prologue
    .line 594
    iget-object v0, p0, Lcom/mongodb/Mongo;->_netOptions:Lcom/mongodb/Bytes$OptionHolder;

    invoke-virtual {v0}, Lcom/mongodb/Bytes$OptionHolder;->reset()V

    .line 595
    return-void
.end method

.method public setOptions(I)V
    .locals 1
    .param p1, "options"    # I

    .prologue
    .line 587
    iget-object v0, p0, Lcom/mongodb/Mongo;->_netOptions:Lcom/mongodb/Bytes$OptionHolder;

    invoke-virtual {v0, p1}, Lcom/mongodb/Bytes$OptionHolder;->set(I)V

    .line 588
    return-void
.end method

.method public setReadPreference(Lcom/mongodb/ReadPreference;)V
    .locals 0
    .param p1, "preference"    # Lcom/mongodb/ReadPreference;

    .prologue
    .line 549
    iput-object p1, p0, Lcom/mongodb/Mongo;->_readPref:Lcom/mongodb/ReadPreference;

    .line 550
    return-void
.end method

.method public setWriteConcern(Lcom/mongodb/WriteConcern;)V
    .locals 0
    .param p1, "concern"    # Lcom/mongodb/WriteConcern;

    .prologue
    .line 529
    iput-object p1, p0, Lcom/mongodb/Mongo;->_concern:Lcom/mongodb/WriteConcern;

    .line 530
    return-void
.end method

.method public slaveOk()V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 569
    const/4 v0, 0x4

    invoke-virtual {p0, v0}, Lcom/mongodb/Mongo;->addOption(I)V

    .line 570
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 836
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "Mongo{authority="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/mongodb/Mongo;->_authority:Lcom/mongodb/MongoAuthority;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", options="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/mongodb/Mongo;->_options:Lcom/mongodb/MongoOptions;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public unlock()Lcom/mongodb/DBObject;
    .locals 3

    .prologue
    .line 723
    const-string/jumbo v2, "admin"

    invoke-virtual {p0, v2}, Lcom/mongodb/Mongo;->getDB(Ljava/lang/String;)Lcom/mongodb/DB;

    move-result-object v1

    .line 724
    .local v1, "db":Lcom/mongodb/DB;
    const-string/jumbo v2, "$cmd.sys.unlock"

    invoke-virtual {v1, v2}, Lcom/mongodb/DB;->getCollection(Ljava/lang/String;)Lcom/mongodb/DBCollection;

    move-result-object v0

    .line 725
    .local v0, "col":Lcom/mongodb/DBCollection;
    invoke-virtual {v0}, Lcom/mongodb/DBCollection;->findOne()Lcom/mongodb/DBObject;

    move-result-object v2

    return-object v2
.end method
