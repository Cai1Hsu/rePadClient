.class public abstract Lorg/apache/tools/ant/taskdefs/JDBCTask;
.super Lorg/apache/tools/ant/Task;
.source "JDBCTask.java"


# static fields
.field private static final HASH_TABLE_SIZE:I = 0x3

.field private static loaderMap:Ljava/util/Hashtable;


# instance fields
.field private autocommit:Z

.field private caching:Z

.field private classpath:Lorg/apache/tools/ant/types/Path;

.field private connectionProperties:Ljava/util/List;

.field private driver:Ljava/lang/String;

.field private failOnConnectionError:Z

.field private loader:Lorg/apache/tools/ant/AntClassLoader;

.field private password:Ljava/lang/String;

.field private rdbms:Ljava/lang/String;

.field private url:Ljava/lang/String;

.field private userId:Ljava/lang/String;

.field private version:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 105
    new-instance v0, Ljava/util/Hashtable;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Ljava/util/Hashtable;-><init>(I)V

    sput-object v0, Lorg/apache/tools/ant/taskdefs/JDBCTask;->loaderMap:Ljava/util/Hashtable;

    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 97
    invoke-direct {p0}, Lorg/apache/tools/ant/Task;-><init>()V

    .line 107
    iput-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/JDBCTask;->caching:Z

    .line 116
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/JDBCTask;->autocommit:Z

    .line 121
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/JDBCTask;->driver:Ljava/lang/String;

    .line 126
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/JDBCTask;->url:Ljava/lang/String;

    .line 131
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/JDBCTask;->userId:Ljava/lang/String;

    .line 136
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/JDBCTask;->password:Ljava/lang/String;

    .line 141
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/JDBCTask;->rdbms:Ljava/lang/String;

    .line 146
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/JDBCTask;->version:Ljava/lang/String;

    .line 152
    iput-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/JDBCTask;->failOnConnectionError:Z

    .line 159
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/JDBCTask;->connectionProperties:Ljava/util/List;

    return-void
.end method

.method private getDriver()Ljava/sql/Driver;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 398
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/JDBCTask;->driver:Ljava/lang/String;

    if-nez v3, :cond_0

    .line 399
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v4, "Driver attribute must be set!"

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/JDBCTask;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v5

    invoke-direct {v3, v4, v5}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v3

    .line 402
    :cond_0
    const/4 v1, 0x0

    .line 405
    .local v1, "driverInstance":Ljava/sql/Driver;
    :try_start_0
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/JDBCTask;->classpath:Lorg/apache/tools/ant/types/Path;

    if-eqz v3, :cond_4

    .line 412
    sget-object v4, Lorg/apache/tools/ant/taskdefs/JDBCTask;->loaderMap:Ljava/util/Hashtable;

    monitor-enter v4
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_2

    .line 413
    :try_start_1
    iget-boolean v3, p0, Lorg/apache/tools/ant/taskdefs/JDBCTask;->caching:Z

    if-eqz v3, :cond_1

    .line 414
    sget-object v3, Lorg/apache/tools/ant/taskdefs/JDBCTask;->loaderMap:Ljava/util/Hashtable;

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/JDBCTask;->driver:Ljava/lang/String;

    invoke-virtual {v3, v5}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/apache/tools/ant/AntClassLoader;

    iput-object v3, p0, Lorg/apache/tools/ant/taskdefs/JDBCTask;->loader:Lorg/apache/tools/ant/AntClassLoader;

    .line 416
    :cond_1
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/JDBCTask;->loader:Lorg/apache/tools/ant/AntClassLoader;

    if-nez v3, :cond_3

    .line 417
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "Loading "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/JDBCTask;->driver:Ljava/lang/String;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v5, " using AntClassLoader with classpath "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/JDBCTask;->classpath:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v5, 0x3

    invoke-virtual {p0, v3, v5}, Lorg/apache/tools/ant/taskdefs/JDBCTask;->log(Ljava/lang/String;I)V

    .line 420
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/JDBCTask;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v3

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/JDBCTask;->classpath:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v3, v5}, Lorg/apache/tools/ant/Project;->createClassLoader(Lorg/apache/tools/ant/types/Path;)Lorg/apache/tools/ant/AntClassLoader;

    move-result-object v3

    iput-object v3, p0, Lorg/apache/tools/ant/taskdefs/JDBCTask;->loader:Lorg/apache/tools/ant/AntClassLoader;

    .line 421
    iget-boolean v3, p0, Lorg/apache/tools/ant/taskdefs/JDBCTask;->caching:Z

    if-eqz v3, :cond_2

    .line 422
    sget-object v3, Lorg/apache/tools/ant/taskdefs/JDBCTask;->loaderMap:Ljava/util/Hashtable;

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/JDBCTask;->driver:Ljava/lang/String;

    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/JDBCTask;->loader:Lorg/apache/tools/ant/AntClassLoader;

    invoke-virtual {v3, v5, v6}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 429
    :cond_2
    :goto_0
    monitor-exit v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 430
    :try_start_2
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/JDBCTask;->loader:Lorg/apache/tools/ant/AntClassLoader;

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/JDBCTask;->driver:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lorg/apache/tools/ant/AntClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 436
    .local v0, "dc":Ljava/lang/Class;
    :goto_1
    invoke-virtual {v0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v1

    .end local v1    # "driverInstance":Ljava/sql/Driver;
    check-cast v1, Ljava/sql/Driver;
    :try_end_2
    .catch Ljava/lang/ClassNotFoundException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/InstantiationException; {:try_start_2 .. :try_end_2} :catch_2

    .line 453
    .restart local v1    # "driverInstance":Ljava/sql/Driver;
    return-object v1

    .line 425
    .end local v0    # "dc":Ljava/lang/Class;
    :cond_3
    :try_start_3
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "Loading "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/JDBCTask;->driver:Ljava/lang/String;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v5, " using a cached AntClassLoader."

    invoke-virtual {v3, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v5, 0x3

    invoke-virtual {p0, v3, v5}, Lorg/apache/tools/ant/taskdefs/JDBCTask;->log(Ljava/lang/String;I)V

    goto :goto_0

    .line 429
    :catchall_0
    move-exception v3

    monitor-exit v4
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    throw v3
    :try_end_4
    .catch Ljava/lang/ClassNotFoundException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_4 .. :try_end_4} :catch_1
    .catch Ljava/lang/InstantiationException; {:try_start_4 .. :try_end_4} :catch_2

    .line 437
    .end local v1    # "driverInstance":Ljava/sql/Driver;
    :catch_0
    move-exception v2

    .line 438
    .local v2, "e":Ljava/lang/ClassNotFoundException;
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "Class Not Found: JDBC driver "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/JDBCTask;->driver:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, " could not be loaded"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/JDBCTask;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v5

    invoke-direct {v3, v4, v2, v5}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v3

    .line 432
    .end local v2    # "e":Ljava/lang/ClassNotFoundException;
    .restart local v1    # "driverInstance":Ljava/sql/Driver;
    :cond_4
    :try_start_5
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "Loading "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/JDBCTask;->driver:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, " using system loader."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x3

    invoke-virtual {p0, v3, v4}, Lorg/apache/tools/ant/taskdefs/JDBCTask;->log(Ljava/lang/String;I)V

    .line 434
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/JDBCTask;->driver:Ljava/lang/String;

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_5
    .catch Ljava/lang/ClassNotFoundException; {:try_start_5 .. :try_end_5} :catch_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_5 .. :try_end_5} :catch_1
    .catch Ljava/lang/InstantiationException; {:try_start_5 .. :try_end_5} :catch_2

    move-result-object v0

    .restart local v0    # "dc":Ljava/lang/Class;
    goto :goto_1

    .line 442
    .end local v0    # "dc":Ljava/lang/Class;
    .end local v1    # "driverInstance":Ljava/sql/Driver;
    :catch_1
    move-exception v2

    .line 443
    .local v2, "e":Ljava/lang/IllegalAccessException;
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "Illegal Access: JDBC driver "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/JDBCTask;->driver:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, " could not be loaded"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/JDBCTask;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v5

    invoke-direct {v3, v4, v2, v5}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v3

    .line 447
    .end local v2    # "e":Ljava/lang/IllegalAccessException;
    :catch_2
    move-exception v2

    .line 448
    .local v2, "e":Ljava/lang/InstantiationException;
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "Instantiation Exception: JDBC driver "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/JDBCTask;->driver:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, " could not be loaded"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/JDBCTask;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v5

    invoke-direct {v3, v4, v2, v5}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v3
.end method

.method protected static getLoaderMap()Ljava/util/Hashtable;
    .locals 1

    .prologue
    .line 307
    sget-object v0, Lorg/apache/tools/ant/taskdefs/JDBCTask;->loaderMap:Ljava/util/Hashtable;

    return-object v0
.end method


# virtual methods
.method public addConnectionProperty(Lorg/apache/tools/ant/taskdefs/Property;)V
    .locals 1
    .param p1, "var"    # Lorg/apache/tools/ant/taskdefs/Property;

    .prologue
    .line 324
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/JDBCTask;->connectionProperties:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 325
    return-void
.end method

.method public createClasspath()Lorg/apache/tools/ant/types/Path;
    .locals 2

    .prologue
    .line 184
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/JDBCTask;->classpath:Lorg/apache/tools/ant/types/Path;

    if-nez v0, :cond_0

    .line 185
    new-instance v0, Lorg/apache/tools/ant/types/Path;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/JDBCTask;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/JDBCTask;->classpath:Lorg/apache/tools/ant/types/Path;

    .line 187
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/JDBCTask;->classpath:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Path;->createPath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    return-object v0
.end method

.method public getClasspath()Lorg/apache/tools/ant/types/Path;
    .locals 1

    .prologue
    .line 470
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/JDBCTask;->classpath:Lorg/apache/tools/ant/types/Path;

    return-object v0
.end method

.method protected getConnection()Ljava/sql/Connection;
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    const/4 v10, 0x1

    .line 339
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/JDBCTask;->userId:Ljava/lang/String;

    if-nez v7, :cond_0

    .line 340
    new-instance v7, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v8, "UserId attribute must be set!"

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/JDBCTask;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v9

    invoke-direct {v7, v8, v9}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v7

    .line 342
    :cond_0
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/JDBCTask;->password:Ljava/lang/String;

    if-nez v7, :cond_1

    .line 343
    new-instance v7, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v8, "Password attribute must be set!"

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/JDBCTask;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v9

    invoke-direct {v7, v8, v9}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v7

    .line 345
    :cond_1
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/JDBCTask;->url:Ljava/lang/String;

    if-nez v7, :cond_2

    .line 346
    new-instance v7, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v8, "Url attribute must be set!"

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/JDBCTask;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v9

    invoke-direct {v7, v8, v9}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v7

    .line 350
    :cond_2
    :try_start_0
    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v8, "connecting to "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/JDBCTask;->getUrl()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    const/4 v8, 0x3

    invoke-virtual {p0, v7, v8}, Lorg/apache/tools/ant/taskdefs/JDBCTask;->log(Ljava/lang/String;I)V

    .line 351
    new-instance v2, Ljava/util/Properties;

    invoke-direct {v2}, Ljava/util/Properties;-><init>()V

    .line 352
    .local v2, "info":Ljava/util/Properties;
    const-string/jumbo v7, "user"

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/JDBCTask;->getUserId()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v2, v7, v8}, Ljava/util/Properties;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 353
    const-string/jumbo v7, "password"

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/JDBCTask;->getPassword()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v2, v7, v8}, Ljava/util/Properties;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 355
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/JDBCTask;->connectionProperties:Ljava/util/List;

    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .line 356
    .local v5, "props":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_5

    .line 357
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/apache/tools/ant/taskdefs/Property;

    .line 358
    .local v4, "p":Lorg/apache/tools/ant/taskdefs/Property;
    invoke-virtual {v4}, Lorg/apache/tools/ant/taskdefs/Property;->getName()Ljava/lang/String;

    move-result-object v3

    .line 359
    .local v3, "name":Ljava/lang/String;
    invoke-virtual {v4}, Lorg/apache/tools/ant/taskdefs/Property;->getValue()Ljava/lang/String;

    move-result-object v6

    .line 360
    .local v6, "value":Ljava/lang/String;
    if-eqz v3, :cond_3

    if-nez v6, :cond_4

    .line 361
    :cond_3
    const-string/jumbo v7, "Only name/value pairs are supported as connection properties."

    const/4 v8, 0x1

    invoke-virtual {p0, v7, v8}, Lorg/apache/tools/ant/taskdefs/JDBCTask;->log(Ljava/lang/String;I)V
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 379
    .end local v2    # "info":Ljava/util/Properties;
    .end local v3    # "name":Ljava/lang/String;
    .end local v4    # "p":Lorg/apache/tools/ant/taskdefs/Property;
    .end local v5    # "props":Ljava/util/Iterator;
    .end local v6    # "value":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 381
    .local v1, "e":Ljava/sql/SQLException;
    iget-boolean v7, p0, Lorg/apache/tools/ant/taskdefs/JDBCTask;->failOnConnectionError:Z

    if-nez v7, :cond_7

    .line 382
    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v8, "Failed to connect: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v1}, Ljava/sql/SQLException;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0, v7, v10}, Lorg/apache/tools/ant/taskdefs/JDBCTask;->log(Ljava/lang/String;I)V

    .line 383
    const/4 v0, 0x0

    .end local v1    # "e":Ljava/sql/SQLException;
    :goto_1
    return-object v0

    .line 364
    .restart local v2    # "info":Ljava/util/Properties;
    .restart local v3    # "name":Ljava/lang/String;
    .restart local v4    # "p":Lorg/apache/tools/ant/taskdefs/Property;
    .restart local v5    # "props":Ljava/util/Iterator;
    .restart local v6    # "value":Ljava/lang/String;
    :cond_4
    :try_start_1
    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v8, "Setting connection property "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string/jumbo v8, " to "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    const/4 v8, 0x3

    invoke-virtual {p0, v7, v8}, Lorg/apache/tools/ant/taskdefs/JDBCTask;->log(Ljava/lang/String;I)V

    .line 366
    invoke-virtual {v2, v3, v6}, Ljava/util/Properties;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 370
    .end local v3    # "name":Ljava/lang/String;
    .end local v4    # "p":Lorg/apache/tools/ant/taskdefs/Property;
    .end local v6    # "value":Ljava/lang/String;
    :cond_5
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/JDBCTask;->getDriver()Ljava/sql/Driver;

    move-result-object v7

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/JDBCTask;->getUrl()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v7, v8, v2}, Ljava/sql/Driver;->connect(Ljava/lang/String;Ljava/util/Properties;)Ljava/sql/Connection;

    move-result-object v0

    .line 372
    .local v0, "conn":Ljava/sql/Connection;
    if-nez v0, :cond_6

    .line 374
    new-instance v7, Ljava/sql/SQLException;

    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v9, "No suitable Driver for "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/JDBCTask;->url:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/sql/SQLException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 377
    :cond_6
    iget-boolean v7, p0, Lorg/apache/tools/ant/taskdefs/JDBCTask;->autocommit:Z

    invoke-interface {v0, v7}, Ljava/sql/Connection;->setAutoCommit(Z)V
    :try_end_1
    .catch Ljava/sql/SQLException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 385
    .end local v0    # "conn":Ljava/sql/Connection;
    .end local v2    # "info":Ljava/util/Properties;
    .end local v5    # "props":Ljava/util/Iterator;
    .restart local v1    # "e":Ljava/sql/SQLException;
    :cond_7
    new-instance v7, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/JDBCTask;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v8

    invoke-direct {v7, v1, v8}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v7
.end method

.method protected getLoader()Lorg/apache/tools/ant/AntClassLoader;
    .locals 1

    .prologue
    .line 315
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/JDBCTask;->loader:Lorg/apache/tools/ant/AntClassLoader;

    return-object v0
.end method

.method public getPassword()Ljava/lang/String;
    .locals 1

    .prologue
    .line 510
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/JDBCTask;->password:Ljava/lang/String;

    return-object v0
.end method

.method public getRdbms()Ljava/lang/String;
    .locals 1

    .prologue
    .line 518
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/JDBCTask;->rdbms:Ljava/lang/String;

    return-object v0
.end method

.method public getUrl()Ljava/lang/String;
    .locals 1

    .prologue
    .line 486
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/JDBCTask;->url:Ljava/lang/String;

    return-object v0
.end method

.method public getUserId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 494
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/JDBCTask;->userId:Ljava/lang/String;

    return-object v0
.end method

.method public getVersion()Ljava/lang/String;
    .locals 1

    .prologue
    .line 526
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/JDBCTask;->version:Ljava/lang/String;

    return-object v0
.end method

.method public isAutocommit()Z
    .locals 1

    .prologue
    .line 478
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/JDBCTask;->autocommit:Z

    return v0
.end method

.method public isCaching(Z)V
    .locals 0
    .param p1, "value"    # Z

    .prologue
    .line 462
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/JDBCTask;->caching:Z

    .line 463
    return-void
.end method

.method protected isValidRdbms(Ljava/sql/Connection;)Z
    .locals 8
    .param p1, "conn"    # Ljava/sql/Connection;

    .prologue
    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 265
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/JDBCTask;->rdbms:Ljava/lang/String;

    if-nez v6, :cond_1

    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/JDBCTask;->version:Ljava/lang/String;

    if-nez v6, :cond_1

    .line 299
    :cond_0
    :goto_0
    return v4

    .line 270
    :cond_1
    :try_start_0
    invoke-interface {p1}, Ljava/sql/Connection;->getMetaData()Ljava/sql/DatabaseMetaData;

    move-result-object v0

    .line 272
    .local v0, "dmd":Ljava/sql/DatabaseMetaData;
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/JDBCTask;->rdbms:Ljava/lang/String;

    if-eqz v6, :cond_3

    .line 273
    invoke-interface {v0}, Ljava/sql/DatabaseMetaData;->getDatabaseProductName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    .line 275
    .local v2, "theVendor":Ljava/lang/String;
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v7, "RDBMS = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x3

    invoke-virtual {p0, v6, v7}, Lorg/apache/tools/ant/taskdefs/JDBCTask;->log(Ljava/lang/String;I)V

    .line 276
    if-eqz v2, :cond_2

    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/JDBCTask;->rdbms:Ljava/lang/String;

    invoke-virtual {v2, v6}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v6

    if-gez v6, :cond_3

    .line 277
    :cond_2
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "Not the required RDBMS: "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/JDBCTask;->rdbms:Ljava/lang/String;

    invoke-virtual {v4, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v6, 0x3

    invoke-virtual {p0, v4, v6}, Lorg/apache/tools/ant/taskdefs/JDBCTask;->log(Ljava/lang/String;I)V

    move v4, v5

    .line 278
    goto :goto_0

    .line 282
    .end local v2    # "theVendor":Ljava/lang/String;
    :cond_3
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/JDBCTask;->version:Ljava/lang/String;

    if-eqz v6, :cond_0

    .line 283
    invoke-interface {v0}, Ljava/sql/DatabaseMetaData;->getDatabaseProductVersion()Ljava/lang/String;

    move-result-object v6

    sget-object v7, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v6, v7}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v3

    .line 285
    .local v3, "theVersion":Ljava/lang/String;
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v7, "Version = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x3

    invoke-virtual {p0, v6, v7}, Lorg/apache/tools/ant/taskdefs/JDBCTask;->log(Ljava/lang/String;I)V

    .line 286
    if-eqz v3, :cond_4

    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/JDBCTask;->version:Ljava/lang/String;

    invoke-virtual {v3, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_0

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v7, " "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/JDBCTask;->version:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v6}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v6

    if-gez v6, :cond_0

    .line 289
    :cond_4
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "Not the required version: \""

    invoke-virtual {v4, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/JDBCTask;->version:Ljava/lang/String;

    invoke-virtual {v4, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v6, "\""

    invoke-virtual {v4, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v6, 0x3

    invoke-virtual {p0, v4, v6}, Lorg/apache/tools/ant/taskdefs/JDBCTask;->log(Ljava/lang/String;I)V
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    move v4, v5

    .line 290
    goto/16 :goto_0

    .line 293
    .end local v0    # "dmd":Ljava/sql/DatabaseMetaData;
    .end local v3    # "theVersion":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 295
    .local v1, "e":Ljava/sql/SQLException;
    const-string/jumbo v4, "Failed to obtain required RDBMS information"

    invoke-virtual {p0, v4, v5}, Lorg/apache/tools/ant/taskdefs/JDBCTask;->log(Ljava/lang/String;I)V

    move v4, v5

    .line 296
    goto/16 :goto_0
.end method

.method public setAutocommit(Z)V
    .locals 0
    .param p1, "autocommit"    # Z

    .prologue
    .line 229
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/JDBCTask;->autocommit:Z

    .line 230
    return-void
.end method

.method public setCaching(Z)V
    .locals 0
    .param p1, "enable"    # Z

    .prologue
    .line 176
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/JDBCTask;->caching:Z

    .line 177
    return-void
.end method

.method public setClasspath(Lorg/apache/tools/ant/types/Path;)V
    .locals 0
    .param p1, "classpath"    # Lorg/apache/tools/ant/types/Path;

    .prologue
    .line 166
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/JDBCTask;->classpath:Lorg/apache/tools/ant/types/Path;

    .line 167
    return-void
.end method

.method public setClasspathRef(Lorg/apache/tools/ant/types/Reference;)V
    .locals 1
    .param p1, "r"    # Lorg/apache/tools/ant/types/Reference;

    .prologue
    .line 196
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/JDBCTask;->createClasspath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Path;->setRefid(Lorg/apache/tools/ant/types/Reference;)V

    .line 197
    return-void
.end method

.method public setDriver(Ljava/lang/String;)V
    .locals 1
    .param p1, "driver"    # Ljava/lang/String;

    .prologue
    .line 204
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/JDBCTask;->driver:Ljava/lang/String;

    .line 205
    return-void
.end method

.method public setFailOnConnectionError(Z)V
    .locals 0
    .param p1, "b"    # Z

    .prologue
    .line 256
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/JDBCTask;->failOnConnectionError:Z

    .line 257
    return-void
.end method

.method public setPassword(Ljava/lang/String;)V
    .locals 0
    .param p1, "password"    # Ljava/lang/String;

    .prologue
    .line 220
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/JDBCTask;->password:Ljava/lang/String;

    .line 221
    return-void
.end method

.method public setRdbms(Ljava/lang/String;)V
    .locals 0
    .param p1, "rdbms"    # Ljava/lang/String;

    .prologue
    .line 238
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/JDBCTask;->rdbms:Ljava/lang/String;

    .line 239
    return-void
.end method

.method public setUrl(Ljava/lang/String;)V
    .locals 0
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 212
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/JDBCTask;->url:Ljava/lang/String;

    .line 213
    return-void
.end method

.method public setUserid(Ljava/lang/String;)V
    .locals 0
    .param p1, "userId"    # Ljava/lang/String;

    .prologue
    .line 502
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/JDBCTask;->userId:Ljava/lang/String;

    .line 503
    return-void
.end method

.method public setVersion(Ljava/lang/String;)V
    .locals 0
    .param p1, "version"    # Ljava/lang/String;

    .prologue
    .line 247
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/JDBCTask;->version:Ljava/lang/String;

    .line 248
    return-void
.end method
