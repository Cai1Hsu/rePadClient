.class public abstract Lcom/mongodb/DB;
.super Ljava/lang/Object;
.source "DB.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mongodb/DB$CommandResultPair;
    }
.end annotation


# static fields
.field private static final _obedientCommands:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private _concern:Lcom/mongodb/WriteConcern;

.field final _mongo:Lcom/mongodb/Mongo;

.field final _name:Ljava/lang/String;

.field final _options:Lcom/mongodb/Bytes$OptionHolder;

.field protected _readOnly:Z
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field private _readPref:Lcom/mongodb/ReadPreference;

.field private volatile authenticationTestCommandResult:Lcom/mongodb/CommandResult;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 47
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    sput-object v0, Lcom/mongodb/DB;->_obedientCommands:Ljava/util/Set;

    .line 50
    sget-object v0, Lcom/mongodb/DB;->_obedientCommands:Ljava/util/Set;

    const-string/jumbo v1, "group"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 51
    sget-object v0, Lcom/mongodb/DB;->_obedientCommands:Ljava/util/Set;

    const-string/jumbo v1, "aggregate"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 52
    sget-object v0, Lcom/mongodb/DB;->_obedientCommands:Ljava/util/Set;

    const-string/jumbo v1, "collstats"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 53
    sget-object v0, Lcom/mongodb/DB;->_obedientCommands:Ljava/util/Set;

    const-string/jumbo v1, "dbstats"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 54
    sget-object v0, Lcom/mongodb/DB;->_obedientCommands:Ljava/util/Set;

    const-string/jumbo v1, "count"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 55
    sget-object v0, Lcom/mongodb/DB;->_obedientCommands:Ljava/util/Set;

    const-string/jumbo v1, "distinct"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 56
    sget-object v0, Lcom/mongodb/DB;->_obedientCommands:Ljava/util/Set;

    const-string/jumbo v1, "geonear"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 57
    sget-object v0, Lcom/mongodb/DB;->_obedientCommands:Ljava/util/Set;

    const-string/jumbo v1, "geosearch"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 58
    sget-object v0, Lcom/mongodb/DB;->_obedientCommands:Ljava/util/Set;

    const-string/jumbo v1, "geowalk"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 59
    sget-object v0, Lcom/mongodb/DB;->_obedientCommands:Ljava/util/Set;

    const-string/jumbo v1, "text"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 60
    sget-object v0, Lcom/mongodb/DB;->_obedientCommands:Ljava/util/Set;

    const-string/jumbo v1, "parallelcollectionscan"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 61
    return-void
.end method

.method public constructor <init>(Lcom/mongodb/Mongo;Ljava/lang/String;)V
    .locals 2
    .param p1, "mongo"    # Lcom/mongodb/Mongo;
    .param p2, "name"    # Ljava/lang/String;

    .prologue
    .line 69
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 992
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mongodb/DB;->_readOnly:Z

    .line 70
    invoke-direct {p0, p2}, Lcom/mongodb/DB;->isValidName(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 71
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Invalid database name format. Database name is either empty or it contains spaces."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 72
    :cond_0
    iput-object p1, p0, Lcom/mongodb/DB;->_mongo:Lcom/mongodb/Mongo;

    .line 73
    iput-object p2, p0, Lcom/mongodb/DB;->_name:Ljava/lang/String;

    .line 74
    new-instance v0, Lcom/mongodb/Bytes$OptionHolder;

    iget-object v1, p0, Lcom/mongodb/DB;->_mongo:Lcom/mongodb/Mongo;

    iget-object v1, v1, Lcom/mongodb/Mongo;->_netOptions:Lcom/mongodb/Bytes$OptionHolder;

    invoke-direct {v0, v1}, Lcom/mongodb/Bytes$OptionHolder;-><init>(Lcom/mongodb/Bytes$OptionHolder;)V

    iput-object v0, p0, Lcom/mongodb/DB;->_options:Lcom/mongodb/Bytes$OptionHolder;

    .line 75
    return-void
.end method

.method private authenticateCommandHelper(Ljava/lang/String;[C)Lcom/mongodb/DB$CommandResultPair;
    .locals 4
    .param p1, "username"    # Ljava/lang/String;
    .param p2, "password"    # [C

    .prologue
    .line 752
    invoke-virtual {p0}, Lcom/mongodb/DB;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-static {p1, v2, p2}, Lcom/mongodb/MongoCredential;->createMongoCRCredential(Ljava/lang/String;Ljava/lang/String;[C)Lcom/mongodb/MongoCredential;

    move-result-object v1

    .line 754
    .local v1, "credentials":Lcom/mongodb/MongoCredential;
    invoke-virtual {p0}, Lcom/mongodb/DB;->getAuthenticationCredentials()Lcom/mongodb/MongoCredential;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 755
    invoke-virtual {p0}, Lcom/mongodb/DB;->getAuthenticationCredentials()Lcom/mongodb/MongoCredential;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/mongodb/MongoCredential;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 756
    iget-object v2, p0, Lcom/mongodb/DB;->authenticationTestCommandResult:Lcom/mongodb/CommandResult;

    if-eqz v2, :cond_1

    .line 757
    new-instance v2, Lcom/mongodb/DB$CommandResultPair;

    iget-object v3, p0, Lcom/mongodb/DB;->authenticationTestCommandResult:Lcom/mongodb/CommandResult;

    invoke-direct {v2, p0, v3}, Lcom/mongodb/DB$CommandResultPair;-><init>(Lcom/mongodb/DB;Lcom/mongodb/CommandResult;)V

    .line 768
    :goto_0
    return-object v2

    .line 760
    :cond_0
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string/jumbo v3, "can\'t authenticate twice on the same database"

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 765
    :cond_1
    :try_start_0
    invoke-virtual {p0, v1}, Lcom/mongodb/DB;->doAuthenticate(Lcom/mongodb/MongoCredential;)Lcom/mongodb/CommandResult;

    move-result-object v2

    iput-object v2, p0, Lcom/mongodb/DB;->authenticationTestCommandResult:Lcom/mongodb/CommandResult;

    .line 766
    new-instance v2, Lcom/mongodb/DB$CommandResultPair;

    iget-object v3, p0, Lcom/mongodb/DB;->authenticationTestCommandResult:Lcom/mongodb/CommandResult;

    invoke-direct {v2, p0, v3}, Lcom/mongodb/DB$CommandResultPair;-><init>(Lcom/mongodb/DB;Lcom/mongodb/CommandResult;)V
    :try_end_0
    .catch Lcom/mongodb/CommandFailureException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 767
    :catch_0
    move-exception v0

    .line 768
    .local v0, "commandFailureException":Lcom/mongodb/CommandFailureException;
    new-instance v2, Lcom/mongodb/DB$CommandResultPair;

    invoke-direct {v2, p0, v0}, Lcom/mongodb/DB$CommandResultPair;-><init>(Lcom/mongodb/DB;Lcom/mongodb/CommandFailureException;)V

    goto :goto_0
.end method

.method private isValidName(Ljava/lang/String;)Z
    .locals 1
    .param p1, "dbname"    # Ljava/lang/String;

    .prologue
    .line 968
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_0

    const-string/jumbo v0, " "

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private wrapCommand(Lcom/mongodb/DBObject;Lcom/mongodb/ReadPreference;)Lcom/mongodb/DBObject;
    .locals 3
    .param p1, "cmd"    # Lcom/mongodb/DBObject;
    .param p2, "readPreference"    # Lcom/mongodb/ReadPreference;

    .prologue
    .line 349
    invoke-virtual {p0}, Lcom/mongodb/DB;->getMongo()Lcom/mongodb/Mongo;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mongodb/Mongo;->isMongosConnection()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/mongodb/ReadPreference;->primary()Lcom/mongodb/ReadPreference;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {}, Lcom/mongodb/ReadPreference;->secondaryPreferred()Lcom/mongodb/ReadPreference;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    instance-of v0, p1, Lcom/mongodb/BasicDBObject;

    if-eqz v0, :cond_0

    .line 352
    new-instance v0, Lcom/mongodb/BasicDBObject;

    const-string/jumbo v1, "$query"

    invoke-direct {v0, v1, p1}, Lcom/mongodb/BasicDBObject;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    const-string/jumbo v1, "$readPreference"

    invoke-virtual {p2}, Lcom/mongodb/ReadPreference;->toDBObject()Lcom/mongodb/DBObject;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/mongodb/BasicDBObject;->append(Ljava/lang/String;Ljava/lang/Object;)Lcom/mongodb/BasicDBObject;

    move-result-object p1

    .line 355
    :cond_0
    return-object p1
.end method


# virtual methods
.method _hash(Ljava/lang/String;[C)Ljava/lang/String;
    .locals 5
    .param p1, "username"    # Ljava/lang/String;
    .param p2, "passwd"    # [C

    .prologue
    .line 840
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, 0x14

    array-length v4, p2

    add-int/2addr v3, v4

    invoke-direct {v0, v3}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    .line 842
    .local v0, "bout":Ljava/io/ByteArrayOutputStream;
    :try_start_0
    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/io/ByteArrayOutputStream;->write([B)V

    .line 843
    const-string/jumbo v3, ":mongo:"

    invoke-virtual {v3}, Ljava/lang/String;->getBytes()[B

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/io/ByteArrayOutputStream;->write([B)V

    .line 844
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v3, p2

    if-ge v1, v3, :cond_1

    .line 845
    aget-char v3, p2, v1

    const/16 v4, 0x80

    if-lt v3, v4, :cond_0

    .line 846
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v4, "can\'t handle non-ascii passwords yet"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 850
    .end local v1    # "i":I
    :catch_0
    move-exception v2

    .line 851
    .local v2, "ioe":Ljava/io/IOException;
    new-instance v3, Ljava/lang/RuntimeException;

    const-string/jumbo v4, "impossible"

    invoke-direct {v3, v4, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 847
    .end local v2    # "ioe":Ljava/io/IOException;
    .restart local v1    # "i":I
    :cond_0
    :try_start_1
    aget-char v3, p2, v1

    int-to-byte v3, v3

    invoke-virtual {v0, v3}, Ljava/io/ByteArrayOutputStream;->write(I)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 844
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 853
    :cond_1
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v3

    invoke-static {v3}, Lcom/mongodb/util/Util;->hexMD5([B)Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method public addOption(I)V
    .locals 1
    .param p1, "option"    # I

    .prologue
    .line 939
    iget-object v0, p0, Lcom/mongodb/DB;->_options:Lcom/mongodb/Bytes$OptionHolder;

    invoke-virtual {v0, p1}, Lcom/mongodb/Bytes$OptionHolder;->add(I)V

    .line 940
    return-void
.end method

.method public addUser(Ljava/lang/String;[C)Lcom/mongodb/WriteResult;
    .locals 1
    .param p1, "username"    # Ljava/lang/String;
    .param p2, "passwd"    # [C
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 799
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/mongodb/DB;->addUser(Ljava/lang/String;[CZ)Lcom/mongodb/WriteResult;

    move-result-object v0

    return-object v0
.end method

.method public addUser(Ljava/lang/String;[CZ)Lcom/mongodb/WriteResult;
    .locals 4
    .param p1, "username"    # Ljava/lang/String;
    .param p2, "passwd"    # [C
    .param p3, "readOnly"    # Z
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 815
    const-string/jumbo v2, "system.users"

    invoke-virtual {p0, v2}, Lcom/mongodb/DB;->getCollection(Ljava/lang/String;)Lcom/mongodb/DBCollection;

    move-result-object v0

    .line 816
    .local v0, "c":Lcom/mongodb/DBCollection;
    new-instance v2, Lcom/mongodb/BasicDBObject;

    const-string/jumbo v3, "user"

    invoke-direct {v2, v3, p1}, Lcom/mongodb/BasicDBObject;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {v0, v2}, Lcom/mongodb/DBCollection;->findOne(Lcom/mongodb/DBObject;)Lcom/mongodb/DBObject;

    move-result-object v1

    .line 817
    .local v1, "o":Lcom/mongodb/DBObject;
    if-nez v1, :cond_0

    .line 818
    new-instance v1, Lcom/mongodb/BasicDBObject;

    .end local v1    # "o":Lcom/mongodb/DBObject;
    const-string/jumbo v2, "user"

    invoke-direct {v1, v2, p1}, Lcom/mongodb/BasicDBObject;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    .line 819
    .restart local v1    # "o":Lcom/mongodb/DBObject;
    :cond_0
    const-string/jumbo v2, "pwd"

    invoke-virtual {p0, p1, p2}, Lcom/mongodb/DB;->_hash(Ljava/lang/String;[C)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Lcom/mongodb/DBObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 820
    const-string/jumbo v2, "readOnly"

    invoke-static {p3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Lcom/mongodb/DBObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 821
    invoke-virtual {v0, v1}, Lcom/mongodb/DBCollection;->save(Lcom/mongodb/DBObject;)Lcom/mongodb/WriteResult;

    move-result-object v2

    return-object v2
.end method

.method public authenticate(Ljava/lang/String;[C)Z
    .locals 1
    .param p1, "username"    # Ljava/lang/String;
    .param p2, "password"    # [C
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 721
    invoke-direct {p0, p1, p2}, Lcom/mongodb/DB;->authenticateCommandHelper(Ljava/lang/String;[C)Lcom/mongodb/DB$CommandResultPair;

    move-result-object v0

    iget-object v0, v0, Lcom/mongodb/DB$CommandResultPair;->failure:Lcom/mongodb/CommandFailureException;

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public declared-synchronized authenticateCommand(Ljava/lang/String;[C)Lcom/mongodb/CommandResult;
    .locals 2
    .param p1, "username"    # Ljava/lang/String;
    .param p2, "password"    # [C
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 744
    monitor-enter p0

    :try_start_0
    invoke-direct {p0, p1, p2}, Lcom/mongodb/DB;->authenticateCommandHelper(Ljava/lang/String;[C)Lcom/mongodb/DB$CommandResultPair;

    move-result-object v0

    .line 745
    .local v0, "commandResultPair":Lcom/mongodb/DB$CommandResultPair;
    iget-object v1, v0, Lcom/mongodb/DB$CommandResultPair;->failure:Lcom/mongodb/CommandFailureException;

    if-eqz v1, :cond_0

    .line 746
    iget-object v1, v0, Lcom/mongodb/DB$CommandResultPair;->failure:Lcom/mongodb/CommandFailureException;

    throw v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 744
    .end local v0    # "commandResultPair":Lcom/mongodb/DB$CommandResultPair;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1

    .line 748
    .restart local v0    # "commandResultPair":Lcom/mongodb/DB$CommandResultPair;
    :cond_0
    :try_start_1
    iget-object v1, v0, Lcom/mongodb/DB$CommandResultPair;->result:Lcom/mongodb/CommandResult;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-object v1
.end method

.method public abstract cleanCursors(Z)V
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public collectionExists(Ljava/lang/String;)Z
    .locals 5
    .param p1, "collectionName"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 552
    if-eqz p1, :cond_0

    const-string/jumbo v4, ""

    invoke-virtual {v4, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 565
    :cond_0
    :goto_0
    return v3

    .line 555
    :cond_1
    invoke-virtual {p0}, Lcom/mongodb/DB;->getCollectionNames()Ljava/util/Set;

    move-result-object v1

    .line 556
    .local v1, "collections":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-interface {v1}, Ljava/util/Set;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_0

    .line 559
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 561
    .local v0, "collection":Ljava/lang/String;
    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 562
    const/4 v3, 0x1

    goto :goto_0
.end method

.method public command(Lcom/mongodb/DBObject;)Lcom/mongodb/CommandResult;
    .locals 1
    .param p1, "cmd"    # Lcom/mongodb/DBObject;

    .prologue
    .line 243
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/mongodb/DB;->command(Lcom/mongodb/DBObject;I)Lcom/mongodb/CommandResult;

    move-result-object v0

    return-object v0
.end method

.method public command(Lcom/mongodb/DBObject;I)Lcom/mongodb/CommandResult;
    .locals 1
    .param p1, "cmd"    # Lcom/mongodb/DBObject;
    .param p2, "options"    # I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 371
    invoke-virtual {p0}, Lcom/mongodb/DB;->getReadPreference()Lcom/mongodb/ReadPreference;

    move-result-object v0

    invoke-virtual {p0, p1, p2, v0}, Lcom/mongodb/DB;->command(Lcom/mongodb/DBObject;ILcom/mongodb/ReadPreference;)Lcom/mongodb/CommandResult;

    move-result-object v0

    return-object v0
.end method

.method public command(Lcom/mongodb/DBObject;ILcom/mongodb/DBEncoder;)Lcom/mongodb/CommandResult;
    .locals 1
    .param p1, "cmd"    # Lcom/mongodb/DBObject;
    .param p2, "options"    # I
    .param p3, "encoder"    # Lcom/mongodb/DBEncoder;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 277
    invoke-virtual {p0}, Lcom/mongodb/DB;->getReadPreference()Lcom/mongodb/ReadPreference;

    move-result-object v0

    invoke-virtual {p0, p1, p2, v0, p3}, Lcom/mongodb/DB;->command(Lcom/mongodb/DBObject;ILcom/mongodb/ReadPreference;Lcom/mongodb/DBEncoder;)Lcom/mongodb/CommandResult;

    move-result-object v0

    return-object v0
.end method

.method public command(Lcom/mongodb/DBObject;ILcom/mongodb/ReadPreference;)Lcom/mongodb/CommandResult;
    .locals 1
    .param p1, "cmd"    # Lcom/mongodb/DBObject;
    .param p2, "options"    # I
    .param p3, "readPreference"    # Lcom/mongodb/ReadPreference;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 296
    sget-object v0, Lcom/mongodb/DefaultDBEncoder;->FACTORY:Lcom/mongodb/DBEncoderFactory;

    invoke-interface {v0}, Lcom/mongodb/DBEncoderFactory;->create()Lcom/mongodb/DBEncoder;

    move-result-object v0

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/mongodb/DB;->command(Lcom/mongodb/DBObject;ILcom/mongodb/ReadPreference;Lcom/mongodb/DBEncoder;)Lcom/mongodb/CommandResult;

    move-result-object v0

    return-object v0
.end method

.method public command(Lcom/mongodb/DBObject;ILcom/mongodb/ReadPreference;Lcom/mongodb/DBEncoder;)Lcom/mongodb/CommandResult;
    .locals 12
    .param p1, "cmd"    # Lcom/mongodb/DBObject;
    .param p2, "options"    # I
    .param p3, "readPreference"    # Lcom/mongodb/ReadPreference;
    .param p4, "encoder"    # Lcom/mongodb/DBEncoder;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 314
    invoke-virtual {p0, p1, p3}, Lcom/mongodb/DB;->getCommandReadPreference(Lcom/mongodb/DBObject;Lcom/mongodb/ReadPreference;)Lcom/mongodb/ReadPreference;

    move-result-object v7

    .line 315
    .local v7, "effectiveReadPrefs":Lcom/mongodb/ReadPreference;
    invoke-direct {p0, p1, v7}, Lcom/mongodb/DB;->wrapCommand(Lcom/mongodb/DBObject;Lcom/mongodb/ReadPreference;)Lcom/mongodb/DBObject;

    move-result-object p1

    .line 317
    const-string/jumbo v0, "$cmd"

    invoke-virtual {p0, v0}, Lcom/mongodb/DB;->getCollection(Ljava/lang/String;)Lcom/mongodb/DBCollection;

    move-result-object v0

    new-instance v2, Lcom/mongodb/BasicDBObject;

    invoke-direct {v2}, Lcom/mongodb/BasicDBObject;-><init>()V

    const/4 v3, 0x0

    const/4 v4, -0x1

    const/4 v5, 0x0

    sget-object v1, Lcom/mongodb/DefaultDBDecoder;->FACTORY:Lcom/mongodb/DBDecoderFactory;

    invoke-interface {v1}, Lcom/mongodb/DBDecoderFactory;->create()Lcom/mongodb/DBDecoder;

    move-result-object v8

    move-object v1, p1

    move v6, p2

    move-object/from16 v9, p4

    invoke-virtual/range {v0 .. v9}, Lcom/mongodb/DBCollection;->find(Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;IIIILcom/mongodb/ReadPreference;Lcom/mongodb/DBDecoder;Lcom/mongodb/DBEncoder;)Lcom/mongodb/QueryResultIterator;

    move-result-object v11

    .line 319
    .local v11, "i":Lcom/mongodb/QueryResultIterator;
    invoke-virtual {v11}, Lcom/mongodb/QueryResultIterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_0

    .line 320
    const/4 v10, 0x0

    .line 325
    :goto_0
    return-object v10

    .line 323
    :cond_0
    new-instance v10, Lcom/mongodb/CommandResult;

    invoke-virtual {v11}, Lcom/mongodb/QueryResultIterator;->getServerAddress()Lcom/mongodb/ServerAddress;

    move-result-object v0

    invoke-direct {v10, v0}, Lcom/mongodb/CommandResult;-><init>(Lcom/mongodb/ServerAddress;)V

    .line 324
    .local v10, "cr":Lcom/mongodb/CommandResult;
    invoke-virtual {v11}, Lcom/mongodb/QueryResultIterator;->next()Lcom/mongodb/DBObject;

    move-result-object v0

    invoke-virtual {v10, v0}, Lcom/mongodb/CommandResult;->putAll(Lorg/bson/BSONObject;)V

    goto :goto_0
.end method

.method public command(Lcom/mongodb/DBObject;Lcom/mongodb/DBEncoder;)Lcom/mongodb/CommandResult;
    .locals 1
    .param p1, "cmd"    # Lcom/mongodb/DBObject;
    .param p2, "encoder"    # Lcom/mongodb/DBEncoder;

    .prologue
    .line 258
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0, p2}, Lcom/mongodb/DB;->command(Lcom/mongodb/DBObject;ILcom/mongodb/DBEncoder;)Lcom/mongodb/CommandResult;

    move-result-object v0

    return-object v0
.end method

.method public command(Lcom/mongodb/DBObject;Lcom/mongodb/ReadPreference;)Lcom/mongodb/CommandResult;
    .locals 1
    .param p1, "cmd"    # Lcom/mongodb/DBObject;
    .param p2, "readPreference"    # Lcom/mongodb/ReadPreference;

    .prologue
    .line 385
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0, p2}, Lcom/mongodb/DB;->command(Lcom/mongodb/DBObject;ILcom/mongodb/ReadPreference;)Lcom/mongodb/CommandResult;

    move-result-object v0

    return-object v0
.end method

.method public command(Lcom/mongodb/DBObject;Lcom/mongodb/ReadPreference;Lcom/mongodb/DBEncoder;)Lcom/mongodb/CommandResult;
    .locals 1
    .param p1, "cmd"    # Lcom/mongodb/DBObject;
    .param p2, "readPreference"    # Lcom/mongodb/ReadPreference;
    .param p3, "encoder"    # Lcom/mongodb/DBEncoder;

    .prologue
    .line 339
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0, p2, p3}, Lcom/mongodb/DB;->command(Lcom/mongodb/DBObject;ILcom/mongodb/ReadPreference;Lcom/mongodb/DBEncoder;)Lcom/mongodb/CommandResult;

    move-result-object v0

    return-object v0
.end method

.method public command(Ljava/lang/String;)Lcom/mongodb/CommandResult;
    .locals 2
    .param p1, "cmd"    # Ljava/lang/String;

    .prologue
    .line 397
    new-instance v0, Lcom/mongodb/BasicDBObject;

    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-direct {v0, p1, v1}, Lcom/mongodb/BasicDBObject;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {p0, v0}, Lcom/mongodb/DB;->command(Lcom/mongodb/DBObject;)Lcom/mongodb/CommandResult;

    move-result-object v0

    return-object v0
.end method

.method public command(Ljava/lang/String;I)Lcom/mongodb/CommandResult;
    .locals 2
    .param p1, "cmd"    # Ljava/lang/String;
    .param p2, "options"    # I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 412
    new-instance v0, Lcom/mongodb/BasicDBObject;

    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-direct {v0, p1, v1}, Lcom/mongodb/BasicDBObject;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {p0, v0, p2}, Lcom/mongodb/DB;->command(Lcom/mongodb/DBObject;I)Lcom/mongodb/CommandResult;

    move-result-object v0

    return-object v0
.end method

.method public command(Ljava/lang/String;Lcom/mongodb/ReadPreference;)Lcom/mongodb/CommandResult;
    .locals 2
    .param p1, "cmd"    # Ljava/lang/String;
    .param p2, "readPreference"    # Lcom/mongodb/ReadPreference;

    .prologue
    .line 428
    new-instance v0, Lcom/mongodb/BasicDBObject;

    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-direct {v0, p1, v1}, Lcom/mongodb/BasicDBObject;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1, p2}, Lcom/mongodb/DB;->command(Lcom/mongodb/DBObject;ILcom/mongodb/ReadPreference;)Lcom/mongodb/CommandResult;

    move-result-object v0

    return-object v0
.end method

.method public createCollection(Ljava/lang/String;Lcom/mongodb/DBObject;)Lcom/mongodb/DBCollection;
    .locals 3
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "options"    # Lcom/mongodb/DBObject;

    .prologue
    .line 198
    if-eqz p2, :cond_0

    .line 199
    new-instance v0, Lcom/mongodb/BasicDBObject;

    const-string/jumbo v2, "create"

    invoke-direct {v0, v2, p1}, Lcom/mongodb/BasicDBObject;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    .line 200
    .local v0, "createCmd":Lcom/mongodb/DBObject;
    invoke-interface {v0, p2}, Lcom/mongodb/DBObject;->putAll(Lorg/bson/BSONObject;)V

    .line 201
    invoke-virtual {p0, v0}, Lcom/mongodb/DB;->command(Lcom/mongodb/DBObject;)Lcom/mongodb/CommandResult;

    move-result-object v1

    .line 202
    .local v1, "result":Lcom/mongodb/CommandResult;
    invoke-virtual {v1}, Lcom/mongodb/CommandResult;->throwOnError()V

    .line 204
    .end local v0    # "createCmd":Lcom/mongodb/DBObject;
    .end local v1    # "result":Lcom/mongodb/CommandResult;
    :cond_0
    invoke-virtual {p0, p1}, Lcom/mongodb/DB;->getCollection(Ljava/lang/String;)Lcom/mongodb/DBCollection;

    move-result-object v2

    return-object v2
.end method

.method abstract doAuthenticate(Lcom/mongodb/MongoCredential;)Lcom/mongodb/CommandResult;
.end method

.method public varargs doEval(Ljava/lang/String;[Ljava/lang/Object;)Lcom/mongodb/CommandResult;
    .locals 2
    .param p1, "code"    # Ljava/lang/String;
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    .line 442
    invoke-static {}, Lcom/mongodb/BasicDBObjectBuilder;->start()Lcom/mongodb/BasicDBObjectBuilder;

    move-result-object v0

    const-string/jumbo v1, "$eval"

    invoke-virtual {v0, v1, p1}, Lcom/mongodb/BasicDBObjectBuilder;->add(Ljava/lang/String;Ljava/lang/Object;)Lcom/mongodb/BasicDBObjectBuilder;

    move-result-object v0

    const-string/jumbo v1, "args"

    invoke-virtual {v0, v1, p2}, Lcom/mongodb/BasicDBObjectBuilder;->add(Ljava/lang/String;Ljava/lang/Object;)Lcom/mongodb/BasicDBObjectBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mongodb/BasicDBObjectBuilder;->get()Lcom/mongodb/DBObject;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/mongodb/DB;->command(Lcom/mongodb/DBObject;)Lcom/mongodb/CommandResult;

    move-result-object v0

    return-object v0
.end method

.method protected abstract doGetCollection(Ljava/lang/String;)Lcom/mongodb/DBCollection;
.end method

.method public dropDatabase()V
    .locals 4

    .prologue
    .line 683
    new-instance v1, Lcom/mongodb/BasicDBObject;

    const-string/jumbo v2, "dropDatabase"

    const/4 v3, 0x1

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lcom/mongodb/BasicDBObject;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {p0, v1}, Lcom/mongodb/DB;->command(Lcom/mongodb/DBObject;)Lcom/mongodb/CommandResult;

    move-result-object v0

    .line 684
    .local v0, "res":Lcom/mongodb/CommandResult;
    invoke-virtual {v0}, Lcom/mongodb/CommandResult;->throwOnError()V

    .line 685
    iget-object v1, p0, Lcom/mongodb/DB;->_mongo:Lcom/mongodb/Mongo;

    iget-object v1, v1, Lcom/mongodb/Mongo;->_dbs:Ljava/util/concurrent/ConcurrentMap;

    invoke-virtual {p0}, Lcom/mongodb/DB;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/concurrent/ConcurrentMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 686
    return-void
.end method

.method public varargs eval(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .param p1, "code"    # Ljava/lang/String;
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    .line 460
    invoke-virtual {p0, p1, p2}, Lcom/mongodb/DB;->doEval(Ljava/lang/String;[Ljava/lang/Object;)Lcom/mongodb/CommandResult;

    move-result-object v0

    .line 461
    .local v0, "res":Lcom/mongodb/CommandResult;
    invoke-virtual {v0}, Lcom/mongodb/CommandResult;->throwOnError()V

    .line 462
    const-string/jumbo v1, "retval"

    invoke-virtual {v0, v1}, Lcom/mongodb/CommandResult;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public forceError()V
    .locals 3
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 900
    new-instance v0, Lcom/mongodb/BasicDBObject;

    const-string/jumbo v1, "forceerror"

    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/mongodb/BasicDBObject;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {p0, v0}, Lcom/mongodb/DB;->command(Lcom/mongodb/DBObject;)Lcom/mongodb/CommandResult;

    .line 901
    return-void
.end method

.method getAuthenticationCredentials()Lcom/mongodb/MongoCredential;
    .locals 2

    .prologue
    .line 982
    invoke-virtual {p0}, Lcom/mongodb/DB;->getMongo()Lcom/mongodb/Mongo;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mongodb/Mongo;->getAuthority()Lcom/mongodb/MongoAuthority;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mongodb/MongoAuthority;->getCredentialsStore()Lcom/mongodb/MongoCredentialsStore;

    move-result-object v0

    invoke-virtual {p0}, Lcom/mongodb/DB;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/mongodb/MongoCredentialsStore;->get(Ljava/lang/String;)Lcom/mongodb/MongoCredential;

    move-result-object v0

    return-object v0
.end method

.method public getCollection(Ljava/lang/String;)Lcom/mongodb/DBCollection;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 164
    invoke-virtual {p0, p1}, Lcom/mongodb/DB;->doGetCollection(Ljava/lang/String;)Lcom/mongodb/DBCollection;

    move-result-object v0

    .line 165
    .local v0, "c":Lcom/mongodb/DBCollection;
    return-object v0
.end method

.method public getCollectionFromString(Ljava/lang/String;)Lcom/mongodb/DBCollection;
    .locals 4
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 215
    const/4 v1, 0x0

    .line 217
    .local v1, "foo":Lcom/mongodb/DBCollection;
    const-string/jumbo v3, "."

    invoke-virtual {p1, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    .line 218
    .local v2, "idx":I
    :goto_0
    if-ltz v2, :cond_1

    .line 219
    const/4 v3, 0x0

    invoke-virtual {p1, v3, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 220
    .local v0, "b":Ljava/lang/String;
    add-int/lit8 v3, v2, 0x1

    invoke-virtual {p1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    .line 221
    if-nez v1, :cond_0

    .line 222
    invoke-virtual {p0, v0}, Lcom/mongodb/DB;->getCollection(Ljava/lang/String;)Lcom/mongodb/DBCollection;

    move-result-object v1

    .line 225
    :goto_1
    const-string/jumbo v3, "."

    invoke-virtual {p1, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    .line 226
    goto :goto_0

    .line 224
    :cond_0
    invoke-virtual {v1, v0}, Lcom/mongodb/DBCollection;->getCollection(Ljava/lang/String;)Lcom/mongodb/DBCollection;

    move-result-object v1

    goto :goto_1

    .line 228
    .end local v0    # "b":Ljava/lang/String;
    :cond_1
    if-eqz v1, :cond_2

    .line 229
    invoke-virtual {v1, p1}, Lcom/mongodb/DBCollection;->getCollection(Ljava/lang/String;)Lcom/mongodb/DBCollection;

    move-result-object v3

    .line 230
    :goto_2
    return-object v3

    :cond_2
    invoke-virtual {p0, p1}, Lcom/mongodb/DB;->getCollection(Ljava/lang/String;)Lcom/mongodb/DBCollection;

    move-result-object v3

    goto :goto_2
.end method

.method public getCollectionNames()Ljava/util/Set;
    .locals 17
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 508
    const-string/jumbo v2, "system.namespaces"

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lcom/mongodb/DB;->getCollection(Ljava/lang/String;)Lcom/mongodb/DBCollection;

    move-result-object v1

    .line 509
    .local v1, "namespaces":Lcom/mongodb/DBCollection;
    if-nez v1, :cond_0

    .line 510
    new-instance v2, Ljava/lang/RuntimeException;

    const-string/jumbo v3, "this is impossible"

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 512
    :cond_0
    new-instance v2, Lcom/mongodb/BasicDBObject;

    invoke-direct {v2}, Lcom/mongodb/BasicDBObject;-><init>()V

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-virtual/range {p0 .. p0}, Lcom/mongodb/DB;->getOptions()I

    move-result v7

    invoke-virtual/range {p0 .. p0}, Lcom/mongodb/DB;->getReadPreference()Lcom/mongodb/ReadPreference;

    move-result-object v8

    const/4 v9, 0x0

    invoke-virtual/range {v1 .. v9}, Lcom/mongodb/DBCollection;->find(Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;IIIILcom/mongodb/ReadPreference;Lcom/mongodb/DBDecoder;)Lcom/mongodb/QueryResultIterator;

    move-result-object v10

    .line 513
    .local v10, "i":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/mongodb/DBObject;>;"
    if-nez v10, :cond_1

    .line 514
    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    .line 540
    :goto_0
    return-object v2

    .line 516
    :cond_1
    new-instance v16, Ljava/util/ArrayList;

    invoke-direct/range {v16 .. v16}, Ljava/util/ArrayList;-><init>()V

    .line 518
    .local v16, "tables":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_2
    :goto_1
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4

    .line 519
    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lcom/mongodb/DBObject;

    .line 520
    .local v13, "o":Lcom/mongodb/DBObject;
    const-string/jumbo v2, "name"

    invoke-interface {v13, v2}, Lcom/mongodb/DBObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    if-nez v2, :cond_3

    .line 521
    new-instance v2, Lcom/mongodb/MongoException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "how is name null : "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/mongodb/MongoException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 523
    :cond_3
    const-string/jumbo v2, "name"

    invoke-interface {v13, v2}, Lcom/mongodb/DBObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v12

    .line 524
    .local v12, "n":Ljava/lang/String;
    const-string/jumbo v2, "."

    invoke-virtual {v12, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v11

    .line 526
    .local v11, "idx":I
    const/4 v2, 0x0

    invoke-virtual {v12, v2, v11}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v14

    .line 527
    .local v14, "root":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mongodb/DB;->_name:Ljava/lang/String;

    invoke-virtual {v14, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 530
    const-string/jumbo v2, "$"

    invoke-virtual {v12, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    if-gez v2, :cond_2

    .line 533
    add-int/lit8 v2, v11, 0x1

    invoke-virtual {v12, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v15

    .line 535
    .local v15, "table":Ljava/lang/String;
    move-object/from16 v0, v16

    invoke-interface {v0, v15}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 538
    .end local v11    # "idx":I
    .end local v12    # "n":Ljava/lang/String;
    .end local v13    # "o":Lcom/mongodb/DBObject;
    .end local v14    # "root":Ljava/lang/String;
    .end local v15    # "table":Ljava/lang/String;
    :cond_4
    invoke-static/range {v16 .. v16}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 540
    new-instance v2, Ljava/util/LinkedHashSet;

    move-object/from16 v0, v16

    invoke-direct {v2, v0}, Ljava/util/LinkedHashSet;-><init>(Ljava/util/Collection;)V

    goto :goto_0
.end method

.method getCommandReadPreference(Lcom/mongodb/DBObject;Lcom/mongodb/ReadPreference;)Lcom/mongodb/ReadPreference;
    .locals 8
    .param p1, "command"    # Lcom/mongodb/DBObject;
    .param p2, "requestedPreference"    # Lcom/mongodb/ReadPreference;

    .prologue
    const/4 v4, 0x1

    const/4 v6, 0x0

    .line 86
    iget-object v5, p0, Lcom/mongodb/DB;->_mongo:Lcom/mongodb/Mongo;

    invoke-virtual {v5}, Lcom/mongodb/Mongo;->getReplicaSetStatus()Lcom/mongodb/ReplicaSetStatus;

    move-result-object v5

    if-nez v5, :cond_1

    .line 120
    .end local p2    # "requestedPreference":Lcom/mongodb/ReadPreference;
    :cond_0
    :goto_0
    return-object p2

    .line 90
    .restart local p2    # "requestedPreference":Lcom/mongodb/ReadPreference;
    :cond_1
    invoke-interface {p1}, Lcom/mongodb/DBObject;->keySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 92
    .local v0, "comString":Ljava/lang/String;
    const-string/jumbo v5, "getnonce"

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_2

    const-string/jumbo v5, "authenticate"

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 93
    :cond_2
    invoke-static {}, Lcom/mongodb/ReadPreference;->primaryPreferred()Lcom/mongodb/ReadPreference;

    move-result-object p2

    goto :goto_0

    .line 99
    :cond_3
    const-string/jumbo v5, "mapreduce"

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_6

    .line 100
    const-string/jumbo v5, "out"

    invoke-interface {p1, v5}, Lcom/mongodb/DBObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 101
    .local v1, "out":Ljava/lang/Object;
    instance-of v5, v1, Lorg/bson/BSONObject;

    if-eqz v5, :cond_5

    move-object v2, v1

    .line 102
    check-cast v2, Lorg/bson/BSONObject;

    .line 103
    .local v2, "outMap":Lorg/bson/BSONObject;
    const-string/jumbo v5, "inline"

    invoke-interface {v2, v5}, Lorg/bson/BSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    if-nez v5, :cond_4

    .line 115
    .end local v1    # "out":Ljava/lang/Object;
    .end local v2    # "outMap":Lorg/bson/BSONObject;
    .local v4, "primaryRequired":Z
    :goto_1
    if-eqz v4, :cond_a

    .line 116
    invoke-static {}, Lcom/mongodb/ReadPreference;->primary()Lcom/mongodb/ReadPreference;

    move-result-object p2

    goto :goto_0

    .end local v4    # "primaryRequired":Z
    .restart local v1    # "out":Ljava/lang/Object;
    .restart local v2    # "outMap":Lorg/bson/BSONObject;
    :cond_4
    move v4, v6

    .line 103
    goto :goto_1

    .line 105
    .end local v2    # "outMap":Lorg/bson/BSONObject;
    :cond_5
    const/4 v4, 0x1

    .restart local v4    # "primaryRequired":Z
    goto :goto_1

    .line 107
    .end local v1    # "out":Ljava/lang/Object;
    .end local v4    # "primaryRequired":Z
    :cond_6
    const-string/jumbo v5, "aggregate"

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_8

    .line 109
    const-string/jumbo v5, "pipeline"

    invoke-interface {p1, v5}, Lcom/mongodb/DBObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    .line 110
    .local v3, "pipeline":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/DBObject;>;"
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    invoke-interface {v3, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/mongodb/DBObject;

    const-string/jumbo v7, "$out"

    invoke-interface {v5, v7}, Lcom/mongodb/DBObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_7

    .line 111
    .restart local v4    # "primaryRequired":Z
    :goto_2
    goto :goto_1

    .end local v4    # "primaryRequired":Z
    :cond_7
    move v4, v6

    .line 110
    goto :goto_2

    .line 112
    .end local v3    # "pipeline":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/DBObject;>;"
    :cond_8
    sget-object v5, Lcom/mongodb/DB;->_obedientCommands:Ljava/util/Set;

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v5, v7}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_9

    .restart local v4    # "primaryRequired":Z
    :goto_3
    goto :goto_1

    .end local v4    # "primaryRequired":Z
    :cond_9
    move v4, v6

    goto :goto_3

    .line 117
    .restart local v4    # "primaryRequired":Z
    :cond_a
    if-nez p2, :cond_0

    .line 118
    invoke-static {}, Lcom/mongodb/ReadPreference;->primary()Lcom/mongodb/ReadPreference;

    move-result-object p2

    goto/16 :goto_0
.end method

.method public getLastError()Lcom/mongodb/CommandResult;
    .locals 3
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 597
    new-instance v0, Lcom/mongodb/BasicDBObject;

    const-string/jumbo v1, "getlasterror"

    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/mongodb/BasicDBObject;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {p0, v0}, Lcom/mongodb/DB;->command(Lcom/mongodb/DBObject;)Lcom/mongodb/CommandResult;

    move-result-object v0

    return-object v0
.end method

.method public getLastError(IIZ)Lcom/mongodb/CommandResult;
    .locals 1
    .param p1, "w"    # I
    .param p2, "wtimeout"    # I
    .param p3, "fsync"    # Z
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 627
    new-instance v0, Lcom/mongodb/WriteConcern;

    invoke-direct {v0, p1, p2, p3}, Lcom/mongodb/WriteConcern;-><init>(IIZ)V

    invoke-virtual {v0}, Lcom/mongodb/WriteConcern;->getCommand()Lcom/mongodb/BasicDBObject;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/mongodb/DB;->command(Lcom/mongodb/DBObject;)Lcom/mongodb/CommandResult;

    move-result-object v0

    return-object v0
.end method

.method public getLastError(Lcom/mongodb/WriteConcern;)Lcom/mongodb/CommandResult;
    .locals 1
    .param p1, "concern"    # Lcom/mongodb/WriteConcern;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 611
    invoke-virtual {p1}, Lcom/mongodb/WriteConcern;->getCommand()Lcom/mongodb/BasicDBObject;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/mongodb/DB;->command(Lcom/mongodb/DBObject;)Lcom/mongodb/CommandResult;

    move-result-object v0

    return-object v0
.end method

.method public getMongo()Lcom/mongodb/Mongo;
    .locals 1

    .prologue
    .line 909
    iget-object v0, p0, Lcom/mongodb/DB;->_mongo:Lcom/mongodb/Mongo;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 484
    iget-object v0, p0, Lcom/mongodb/DB;->_name:Ljava/lang/String;

    return-object v0
.end method

.method public getOptions()I
    .locals 1

    .prologue
    .line 964
    iget-object v0, p0, Lcom/mongodb/DB;->_options:Lcom/mongodb/Bytes$OptionHolder;

    invoke-virtual {v0}, Lcom/mongodb/Bytes$OptionHolder;->get()I

    move-result v0

    return v0
.end method

.method public getPreviousError()Lcom/mongodb/CommandResult;
    .locals 3
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 875
    new-instance v0, Lcom/mongodb/BasicDBObject;

    const-string/jumbo v1, "getpreverror"

    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/mongodb/BasicDBObject;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {p0, v0}, Lcom/mongodb/DB;->command(Lcom/mongodb/DBObject;)Lcom/mongodb/CommandResult;

    move-result-object v0

    return-object v0
.end method

.method public getReadPreference()Lcom/mongodb/ReadPreference;
    .locals 1

    .prologue
    .line 671
    iget-object v0, p0, Lcom/mongodb/DB;->_readPref:Lcom/mongodb/ReadPreference;

    if-eqz v0, :cond_0

    .line 672
    iget-object v0, p0, Lcom/mongodb/DB;->_readPref:Lcom/mongodb/ReadPreference;

    .line 673
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/mongodb/DB;->_mongo:Lcom/mongodb/Mongo;

    invoke-virtual {v0}, Lcom/mongodb/Mongo;->getReadPreference()Lcom/mongodb/ReadPreference;

    move-result-object v0

    goto :goto_0
.end method

.method public getSisterDB(Ljava/lang/String;)Lcom/mongodb/DB;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 919
    iget-object v0, p0, Lcom/mongodb/DB;->_mongo:Lcom/mongodb/Mongo;

    invoke-virtual {v0, p1}, Lcom/mongodb/Mongo;->getDB(Ljava/lang/String;)Lcom/mongodb/DB;

    move-result-object v0

    return-object v0
.end method

.method public getStats()Lcom/mongodb/CommandResult;
    .locals 2

    .prologue
    .line 473
    const-string/jumbo v1, "dbstats"

    invoke-virtual {p0, v1}, Lcom/mongodb/DB;->command(Ljava/lang/String;)Lcom/mongodb/CommandResult;

    move-result-object v0

    .line 474
    .local v0, "result":Lcom/mongodb/CommandResult;
    invoke-virtual {v0}, Lcom/mongodb/CommandResult;->throwOnError()V

    .line 475
    return-object v0
.end method

.method public getWriteConcern()Lcom/mongodb/WriteConcern;
    .locals 1

    .prologue
    .line 649
    iget-object v0, p0, Lcom/mongodb/DB;->_concern:Lcom/mongodb/WriteConcern;

    if-eqz v0, :cond_0

    .line 650
    iget-object v0, p0, Lcom/mongodb/DB;->_concern:Lcom/mongodb/WriteConcern;

    .line 651
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/mongodb/DB;->_mongo:Lcom/mongodb/Mongo;

    invoke-virtual {v0}, Lcom/mongodb/Mongo;->getWriteConcern()Lcom/mongodb/WriteConcern;

    move-result-object v0

    goto :goto_0
.end method

.method public isAuthenticated()Z
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 698
    invoke-virtual {p0}, Lcom/mongodb/DB;->getAuthenticationCredentials()Lcom/mongodb/MongoCredential;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public removeUser(Ljava/lang/String;)Lcom/mongodb/WriteResult;
    .locals 3
    .param p1, "username"    # Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 835
    const-string/jumbo v1, "system.users"

    invoke-virtual {p0, v1}, Lcom/mongodb/DB;->getCollection(Ljava/lang/String;)Lcom/mongodb/DBCollection;

    move-result-object v0

    .line 836
    .local v0, "c":Lcom/mongodb/DBCollection;
    new-instance v1, Lcom/mongodb/BasicDBObject;

    const-string/jumbo v2, "user"

    invoke-direct {v1, v2, p1}, Lcom/mongodb/BasicDBObject;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Lcom/mongodb/DBCollection;->remove(Lcom/mongodb/DBObject;)Lcom/mongodb/WriteResult;

    move-result-object v1

    return-object v1
.end method

.method public abstract requestDone()V
.end method

.method public abstract requestEnsureConnection()V
.end method

.method public abstract requestStart()V
.end method

.method public resetError()V
    .locals 3
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 888
    new-instance v0, Lcom/mongodb/BasicDBObject;

    const-string/jumbo v1, "reseterror"

    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/mongodb/BasicDBObject;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {p0, v0}, Lcom/mongodb/DB;->command(Lcom/mongodb/DBObject;)Lcom/mongodb/CommandResult;

    .line 889
    return-void
.end method

.method public resetOptions()V
    .locals 1

    .prologue
    .line 955
    iget-object v0, p0, Lcom/mongodb/DB;->_options:Lcom/mongodb/Bytes$OptionHolder;

    invoke-virtual {v0}, Lcom/mongodb/Bytes$OptionHolder;->reset()V

    .line 956
    return-void
.end method

.method public setOptions(I)V
    .locals 1
    .param p1, "options"    # I

    .prologue
    .line 948
    iget-object v0, p0, Lcom/mongodb/DB;->_options:Lcom/mongodb/Bytes$OptionHolder;

    invoke-virtual {v0, p1}, Lcom/mongodb/Bytes$OptionHolder;->set(I)V

    .line 949
    return-void
.end method

.method public setReadOnly(Ljava/lang/Boolean;)V
    .locals 1
    .param p1, "b"    # Ljava/lang/Boolean;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 497
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/mongodb/DB;->_readOnly:Z

    .line 498
    return-void
.end method

.method public setReadPreference(Lcom/mongodb/ReadPreference;)V
    .locals 0
    .param p1, "preference"    # Lcom/mongodb/ReadPreference;

    .prologue
    .line 662
    iput-object p1, p0, Lcom/mongodb/DB;->_readPref:Lcom/mongodb/ReadPreference;

    .line 663
    return-void
.end method

.method public setWriteConcern(Lcom/mongodb/WriteConcern;)V
    .locals 1
    .param p1, "concern"    # Lcom/mongodb/WriteConcern;

    .prologue
    .line 639
    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 640
    :cond_0
    iput-object p1, p0, Lcom/mongodb/DB;->_concern:Lcom/mongodb/WriteConcern;

    .line 641
    return-void
.end method

.method public slaveOk()V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 930
    const/4 v0, 0x4

    invoke-virtual {p0, v0}, Lcom/mongodb/DB;->addOption(I)V

    .line 931
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 576
    iget-object v0, p0, Lcom/mongodb/DB;->_name:Ljava/lang/String;

    return-object v0
.end method
