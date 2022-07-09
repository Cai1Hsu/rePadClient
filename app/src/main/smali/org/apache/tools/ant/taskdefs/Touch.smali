.class public Lorg/apache/tools/ant/taskdefs/Touch;
.super Lorg/apache/tools/ant/Task;
.source "Touch.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/taskdefs/Touch$DateFormatFactory;
    }
.end annotation


# static fields
.field public static final DEFAULT_DF_FACTORY:Lorg/apache/tools/ant/taskdefs/Touch$DateFormatFactory;

.field private static final FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

.field static class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

.field static class$org$apache$tools$ant$types$resources$Touchable:Ljava/lang/Class;


# instance fields
.field private dateTime:Ljava/lang/String;

.field private dateTimeConfigured:Z

.field private dfFactory:Lorg/apache/tools/ant/taskdefs/Touch$DateFormatFactory;

.field private file:Ljava/io/File;

.field private fileNameMapper:Lorg/apache/tools/ant/util/FileNameMapper;

.field private filesets:Ljava/util/Vector;

.field private millis:J

.field private mkdirs:Z

.field private resources:Lorg/apache/tools/ant/types/resources/Union;

.field private verbose:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 62
    new-instance v0, Lorg/apache/tools/ant/taskdefs/Touch$1;

    invoke-direct {v0}, Lorg/apache/tools/ant/taskdefs/Touch$1;-><init>()V

    sput-object v0, Lorg/apache/tools/ant/taskdefs/Touch;->DEFAULT_DF_FACTORY:Lorg/apache/tools/ant/taskdefs/Touch$DateFormatFactory;

    .line 83
    invoke-static {}, Lorg/apache/tools/ant/util/FileUtils;->getFileUtils()Lorg/apache/tools/ant/util/FileUtils;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/taskdefs/Touch;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    .line 99
    invoke-direct {p0}, Lorg/apache/tools/ant/Task;-><init>()V

    .line 86
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lorg/apache/tools/ant/taskdefs/Touch;->millis:J

    .line 88
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Touch;->filesets:Ljava/util/Vector;

    .line 92
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Touch;->verbose:Z

    .line 93
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Touch;->fileNameMapper:Lorg/apache/tools/ant/util/FileNameMapper;

    .line 94
    sget-object v0, Lorg/apache/tools/ant/taskdefs/Touch;->DEFAULT_DF_FACTORY:Lorg/apache/tools/ant/taskdefs/Touch$DateFormatFactory;

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Touch;->dfFactory:Lorg/apache/tools/ant/taskdefs/Touch$DateFormatFactory;

    .line 100
    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 302
    :try_start_0
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    :catch_0
    move-exception v0

    .local v0, "x1":Ljava/lang/ClassNotFoundException;
    new-instance v1, Ljava/lang/NoClassDefFoundError;

    invoke-direct {v1}, Ljava/lang/NoClassDefFoundError;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/NoClassDefFoundError;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    move-result-object v1

    throw v1
.end method

.method private getTimestamp()J
    .locals 4

    .prologue
    .line 339
    iget-wide v0, p0, Lorg/apache/tools/ant/taskdefs/Touch;->millis:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-gez v0, :cond_0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    :goto_0
    return-wide v0

    :cond_0
    iget-wide v0, p0, Lorg/apache/tools/ant/taskdefs/Touch;->millis:J

    goto :goto_0
.end method

.method private touch(Ljava/io/File;J)V
    .locals 4
    .param p1, "file"    # Ljava/io/File;
    .param p2, "modTime"    # J

    .prologue
    .line 366
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_0

    .line 367
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "Creating "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    iget-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/Touch;->verbose:Z

    if-eqz v1, :cond_1

    const/4 v1, 0x2

    :goto_0
    invoke-virtual {p0, v2, v1}, Lorg/apache/tools/ant/taskdefs/Touch;->log(Ljava/lang/String;I)V

    .line 370
    :try_start_0
    sget-object v1, Lorg/apache/tools/ant/taskdefs/Touch;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    iget-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/Touch;->mkdirs:Z

    invoke-virtual {v1, p1, v2}, Lorg/apache/tools/ant/util/FileUtils;->createNewFile(Ljava/io/File;Z)Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 376
    :cond_0
    invoke-virtual {p1}, Ljava/io/File;->canWrite()Z

    move-result v1

    if-nez v1, :cond_2

    .line 377
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "Can not change modification date of read-only file "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 367
    :cond_1
    const/4 v1, 0x3

    goto :goto_0

    .line 371
    :catch_0
    move-exception v0

    .line 372
    .local v0, "ioe":Ljava/io/IOException;
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "Could not create "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Touch;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v3

    invoke-direct {v1, v2, v0, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v1

    .line 380
    .end local v0    # "ioe":Ljava/io/IOException;
    :cond_2
    sget-object v1, Lorg/apache/tools/ant/taskdefs/Touch;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    invoke-virtual {v1, p1, p2, p3}, Lorg/apache/tools/ant/util/FileUtils;->setFileLastModified(Ljava/io/File;J)V

    .line 381
    return-void
.end method

.method private touch(Lorg/apache/tools/ant/types/Resource;J)V
    .locals 10
    .param p1, "r"    # Lorg/apache/tools/ant/types/Resource;
    .param p2, "defaultTimestamp"    # J

    .prologue
    .line 343
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Touch;->fileNameMapper:Lorg/apache/tools/ant/util/FileNameMapper;

    if-nez v3, :cond_4

    .line 344
    sget-object v3, Lorg/apache/tools/ant/taskdefs/Touch;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    if-nez v3, :cond_1

    const-string/jumbo v3, "org.apache.tools.ant.types.resources.FileProvider"

    invoke-static {v3}, Lorg/apache/tools/ant/taskdefs/Touch;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    sput-object v3, Lorg/apache/tools/ant/taskdefs/Touch;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    :goto_0
    invoke-virtual {p1, v3}, Lorg/apache/tools/ant/types/Resource;->as(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/resources/FileProvider;

    .line 345
    .local v0, "fp":Lorg/apache/tools/ant/types/resources/FileProvider;
    if-eqz v0, :cond_2

    .line 347
    invoke-interface {v0}, Lorg/apache/tools/ant/types/resources/FileProvider;->getFile()Ljava/io/File;

    move-result-object v3

    invoke-direct {p0, v3, p2, p3}, Lorg/apache/tools/ant/taskdefs/Touch;->touch(Ljava/io/File;J)V

    .line 363
    .end local v0    # "fp":Lorg/apache/tools/ant/types/resources/FileProvider;
    :cond_0
    :goto_1
    return-void

    .line 344
    :cond_1
    sget-object v3, Lorg/apache/tools/ant/taskdefs/Touch;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    goto :goto_0

    .line 349
    .restart local v0    # "fp":Lorg/apache/tools/ant/types/resources/FileProvider;
    :cond_2
    sget-object v3, Lorg/apache/tools/ant/taskdefs/Touch;->class$org$apache$tools$ant$types$resources$Touchable:Ljava/lang/Class;

    if-nez v3, :cond_3

    const-string/jumbo v3, "org.apache.tools.ant.types.resources.Touchable"

    invoke-static {v3}, Lorg/apache/tools/ant/taskdefs/Touch;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    sput-object v3, Lorg/apache/tools/ant/taskdefs/Touch;->class$org$apache$tools$ant$types$resources$Touchable:Ljava/lang/Class;

    :goto_2
    invoke-virtual {p1, v3}, Lorg/apache/tools/ant/types/Resource;->as(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/apache/tools/ant/types/resources/Touchable;

    invoke-interface {v3, p2, p3}, Lorg/apache/tools/ant/types/resources/Touchable;->touch(J)V

    goto :goto_1

    :cond_3
    sget-object v3, Lorg/apache/tools/ant/taskdefs/Touch;->class$org$apache$tools$ant$types$resources$Touchable:Ljava/lang/Class;

    goto :goto_2

    .line 352
    .end local v0    # "fp":Lorg/apache/tools/ant/types/resources/FileProvider;
    :cond_4
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Touch;->fileNameMapper:Lorg/apache/tools/ant/util/FileNameMapper;

    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Resource;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v3, v6}, Lorg/apache/tools/ant/util/FileNameMapper;->mapFileName(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 353
    .local v2, "mapped":[Ljava/lang/String;
    if-eqz v2, :cond_0

    array-length v3, v2

    if-lez v3, :cond_0

    .line 354
    move-wide v4, p2

    .line 355
    .local v4, "modTime":J
    iget-wide v6, p0, Lorg/apache/tools/ant/taskdefs/Touch;->millis:J

    const-wide/16 v8, 0x0

    cmp-long v3, v6, v8

    if-gez v3, :cond_5

    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Resource;->isExists()Z

    move-result v3

    if-eqz v3, :cond_5

    .line 356
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Resource;->getLastModified()J

    move-result-wide v4

    .line 358
    :cond_5
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_3
    array-length v3, v2

    if-ge v1, v3, :cond_0

    .line 359
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Touch;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v3

    aget-object v6, v2, v1

    invoke-virtual {v3, v6}, Lorg/apache/tools/ant/Project;->resolveFile(Ljava/lang/String;)Ljava/io/File;

    move-result-object v3

    invoke-direct {p0, v3, v4, v5}, Lorg/apache/tools/ant/taskdefs/Touch;->touch(Ljava/io/File;J)V

    .line 358
    add-int/lit8 v1, v1, 0x1

    goto :goto_3
.end method


# virtual methods
.method public declared-synchronized add(Lorg/apache/tools/ant/types/ResourceCollection;)V
    .locals 1
    .param p1, "rc"    # Lorg/apache/tools/ant/types/ResourceCollection;

    .prologue
    .line 217
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Touch;->resources:Lorg/apache/tools/ant/types/resources/Union;

    if-nez v0, :cond_0

    new-instance v0, Lorg/apache/tools/ant/types/resources/Union;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/resources/Union;-><init>()V

    :goto_0
    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Touch;->resources:Lorg/apache/tools/ant/types/resources/Union;

    .line 218
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Touch;->resources:Lorg/apache/tools/ant/types/resources/Union;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/resources/Union;->add(Lorg/apache/tools/ant/types/ResourceCollection;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 219
    monitor-exit p0

    return-void

    .line 217
    :cond_0
    :try_start_1
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Touch;->resources:Lorg/apache/tools/ant/types/resources/Union;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public add(Lorg/apache/tools/ant/util/FileNameMapper;)V
    .locals 3
    .param p1, "fileNameMapper"    # Lorg/apache/tools/ant/util/FileNameMapper;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 187
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Touch;->fileNameMapper:Lorg/apache/tools/ant/util/FileNameMapper;

    if-eqz v0, :cond_0

    .line 188
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "Only one mapper may be added to the "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Touch;->getTaskName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, " task."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 191
    :cond_0
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Touch;->fileNameMapper:Lorg/apache/tools/ant/util/FileNameMapper;

    .line 192
    return-void
.end method

.method public addConfiguredMapper(Lorg/apache/tools/ant/types/Mapper;)V
    .locals 1
    .param p1, "mapper"    # Lorg/apache/tools/ant/types/Mapper;

    .prologue
    .line 177
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Mapper;->getImplementation()Lorg/apache/tools/ant/util/FileNameMapper;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/Touch;->add(Lorg/apache/tools/ant/util/FileNameMapper;)V

    .line 178
    return-void
.end method

.method public addFilelist(Lorg/apache/tools/ant/types/FileList;)V
    .locals 0
    .param p1, "list"    # Lorg/apache/tools/ant/types/FileList;

    .prologue
    .line 208
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/taskdefs/Touch;->add(Lorg/apache/tools/ant/types/ResourceCollection;)V

    .line 209
    return-void
.end method

.method public addFileset(Lorg/apache/tools/ant/types/FileSet;)V
    .locals 1
    .param p1, "set"    # Lorg/apache/tools/ant/types/FileSet;

    .prologue
    .line 199
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Touch;->filesets:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 200
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/taskdefs/Touch;->add(Lorg/apache/tools/ant/types/ResourceCollection;)V

    .line 201
    return-void
.end method

.method protected declared-synchronized checkConfiguration()V
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    const-wide/16 v10, 0x0

    .line 227
    monitor-enter p0

    :try_start_0
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/Touch;->file:Ljava/io/File;

    if-nez v6, :cond_0

    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/Touch;->resources:Lorg/apache/tools/ant/types/resources/Union;

    if-nez v6, :cond_0

    .line 228
    new-instance v6, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v7, "Specify at least one source--a file or resource collection."

    invoke-direct {v6, v7}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 227
    :catchall_0
    move-exception v6

    monitor-exit p0

    throw v6

    .line 231
    :cond_0
    :try_start_1
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/Touch;->file:Ljava/io/File;

    if-eqz v6, :cond_1

    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/Touch;->file:Ljava/io/File;

    invoke-virtual {v6}, Ljava/io/File;->exists()Z

    move-result v6

    if-eqz v6, :cond_1

    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/Touch;->file:Ljava/io/File;

    invoke-virtual {v6}, Ljava/io/File;->isDirectory()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 232
    new-instance v6, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v7, "Use a resource collection to touch directories."

    invoke-direct {v6, v7}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 234
    :cond_1
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/Touch;->dateTime:Ljava/lang/String;

    if-eqz v6, :cond_3

    iget-boolean v6, p0, Lorg/apache/tools/ant/taskdefs/Touch;->dateTimeConfigured:Z

    if-nez v6, :cond_3

    .line 235
    iget-wide v4, p0, Lorg/apache/tools/ant/taskdefs/Touch;->millis:J

    .line 236
    .local v4, "workmillis":J
    const-string/jumbo v6, "now"

    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/Touch;->dateTime:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_4

    .line 237
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    .line 265
    :cond_2
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v7, "Setting millis to "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, v4, v5}, Ljava/lang/StringBuffer;->append(J)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string/jumbo v7, " from datetime attribute"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    iget-wide v8, p0, Lorg/apache/tools/ant/taskdefs/Touch;->millis:J

    cmp-long v6, v8, v10

    if-gez v6, :cond_7

    const/4 v6, 0x4

    :goto_0
    invoke-virtual {p0, v7, v6}, Lorg/apache/tools/ant/taskdefs/Touch;->log(Ljava/lang/String;I)V

    .line 267
    invoke-virtual {p0, v4, v5}, Lorg/apache/tools/ant/taskdefs/Touch;->setMillis(J)V

    .line 269
    const/4 v6, 0x1

    iput-boolean v6, p0, Lorg/apache/tools/ant/taskdefs/Touch;->dateTimeConfigured:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 271
    .end local v4    # "workmillis":J
    :cond_3
    monitor-exit p0

    return-void

    .line 239
    .restart local v4    # "workmillis":J
    :cond_4
    :try_start_2
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/Touch;->dfFactory:Lorg/apache/tools/ant/taskdefs/Touch$DateFormatFactory;

    invoke-interface {v6}, Lorg/apache/tools/ant/taskdefs/Touch$DateFormatFactory;->getPrimaryFormat()Ljava/text/DateFormat;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result-object v0

    .line 240
    .local v0, "df":Ljava/text/DateFormat;
    const/4 v1, 0x0

    .line 242
    .local v1, "pe":Ljava/text/ParseException;
    :try_start_3
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/Touch;->dateTime:Ljava/lang/String;

    invoke-virtual {v0, v6}, Ljava/text/DateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v6

    invoke-virtual {v6}, Ljava/util/Date;->getTime()J
    :try_end_3
    .catch Ljava/text/ParseException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    move-result-wide v4

    .line 255
    :goto_1
    if-eqz v1, :cond_6

    .line 256
    :try_start_4
    new-instance v6, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {v1}, Ljava/text/ParseException;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Touch;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v8

    invoke-direct {v6, v7, v1, v8}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v6

    .line 243
    :catch_0
    move-exception v2

    .line 244
    .local v2, "peOne":Ljava/text/ParseException;
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/Touch;->dfFactory:Lorg/apache/tools/ant/taskdefs/Touch$DateFormatFactory;

    invoke-interface {v6}, Lorg/apache/tools/ant/taskdefs/Touch$DateFormatFactory;->getFallbackFormat()Ljava/text/DateFormat;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    move-result-object v0

    .line 245
    if-nez v0, :cond_5

    .line 246
    move-object v1, v2

    goto :goto_1

    .line 249
    :cond_5
    :try_start_5
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/Touch;->dateTime:Ljava/lang/String;

    invoke-virtual {v0, v6}, Ljava/text/DateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v6

    invoke-virtual {v6}, Ljava/util/Date;->getTime()J
    :try_end_5
    .catch Ljava/text/ParseException; {:try_start_5 .. :try_end_5} :catch_1
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    move-result-wide v4

    goto :goto_1

    .line 250
    :catch_1
    move-exception v3

    .line 251
    .local v3, "peTwo":Ljava/text/ParseException;
    move-object v1, v3

    goto :goto_1

    .line 258
    .end local v2    # "peOne":Ljava/text/ParseException;
    .end local v3    # "peTwo":Ljava/text/ParseException;
    :cond_6
    cmp-long v6, v4, v10

    if-gez v6, :cond_2

    .line 259
    :try_start_6
    new-instance v6, Lorg/apache/tools/ant/BuildException;

    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v8, "Date of "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/Touch;->dateTime:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string/jumbo v8, " results in negative "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string/jumbo v8, "milliseconds value "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string/jumbo v8, "relative to epoch "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string/jumbo v8, "(January 1, 1970, "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string/jumbo v8, "00:00:00 GMT)."

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v6
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 265
    .end local v0    # "df":Ljava/text/DateFormat;
    .end local v1    # "pe":Ljava/text/ParseException;
    :cond_7
    const/4 v6, 0x3

    goto/16 :goto_0
.end method

.method public execute()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 280
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Touch;->checkConfiguration()V

    .line 281
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Touch;->touch()V

    .line 282
    return-void
.end method

.method public setDatetime(Ljava/lang/String;)V
    .locals 2
    .param p1, "dateTime"    # Ljava/lang/String;

    .prologue
    .line 128
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Touch;->dateTime:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 129
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v1, "Resetting datetime attribute to "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x3

    invoke-virtual {p0, v0, v1}, Lorg/apache/tools/ant/taskdefs/Touch;->log(Ljava/lang/String;I)V

    .line 131
    :cond_0
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Touch;->dateTime:Ljava/lang/String;

    .line 132
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Touch;->dateTimeConfigured:Z

    .line 133
    return-void
.end method

.method public setFile(Ljava/io/File;)V
    .locals 0
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 108
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Touch;->file:Ljava/io/File;

    .line 109
    return-void
.end method

.method public setMillis(J)V
    .locals 1
    .param p1, "millis"    # J

    .prologue
    .line 117
    iput-wide p1, p0, Lorg/apache/tools/ant/taskdefs/Touch;->millis:J

    .line 118
    return-void
.end method

.method public setMkdirs(Z)V
    .locals 0
    .param p1, "mkdirs"    # Z

    .prologue
    .line 142
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Touch;->mkdirs:Z

    .line 143
    return-void
.end method

.method public setPattern(Ljava/lang/String;)V
    .locals 1
    .param p1, "pattern"    # Ljava/lang/String;

    .prologue
    .line 161
    new-instance v0, Lorg/apache/tools/ant/taskdefs/Touch$2;

    invoke-direct {v0, p0, p1}, Lorg/apache/tools/ant/taskdefs/Touch$2;-><init>(Lorg/apache/tools/ant/taskdefs/Touch;Ljava/lang/String;)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Touch;->dfFactory:Lorg/apache/tools/ant/taskdefs/Touch$DateFormatFactory;

    .line 169
    return-void
.end method

.method public setVerbose(Z)V
    .locals 0
    .param p1, "verbose"    # Z

    .prologue
    .line 152
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Touch;->verbose:Z

    .line 153
    return-void
.end method

.method protected touch()V
    .locals 15
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 289
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/Touch;->getTimestamp()J

    move-result-wide v0

    .line 291
    .local v0, "defaultTimestamp":J
    iget-object v12, p0, Lorg/apache/tools/ant/taskdefs/Touch;->file:Ljava/io/File;

    if-eqz v12, :cond_0

    .line 292
    new-instance v12, Lorg/apache/tools/ant/types/resources/FileResource;

    iget-object v13, p0, Lorg/apache/tools/ant/taskdefs/Touch;->file:Ljava/io/File;

    invoke-virtual {v13}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v13

    iget-object v14, p0, Lorg/apache/tools/ant/taskdefs/Touch;->file:Ljava/io/File;

    invoke-virtual {v14}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v14

    invoke-direct {v12, v13, v14}, Lorg/apache/tools/ant/types/resources/FileResource;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-direct {p0, v12, v0, v1}, Lorg/apache/tools/ant/taskdefs/Touch;->touch(Lorg/apache/tools/ant/types/Resource;J)V

    .line 295
    :cond_0
    iget-object v12, p0, Lorg/apache/tools/ant/taskdefs/Touch;->resources:Lorg/apache/tools/ant/types/resources/Union;

    if-nez v12, :cond_2

    .line 324
    :cond_1
    return-void

    .line 299
    :cond_2
    iget-object v12, p0, Lorg/apache/tools/ant/taskdefs/Touch;->resources:Lorg/apache/tools/ant/types/resources/Union;

    invoke-virtual {v12}, Lorg/apache/tools/ant/types/resources/Union;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .line 300
    .local v6, "iter":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_5

    .line 301
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lorg/apache/tools/ant/types/Resource;

    .line 302
    .local v8, "r":Lorg/apache/tools/ant/types/Resource;
    sget-object v12, Lorg/apache/tools/ant/taskdefs/Touch;->class$org$apache$tools$ant$types$resources$Touchable:Ljava/lang/Class;

    if-nez v12, :cond_3

    const-string/jumbo v12, "org.apache.tools.ant.types.resources.Touchable"

    invoke-static {v12}, Lorg/apache/tools/ant/taskdefs/Touch;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v12

    sput-object v12, Lorg/apache/tools/ant/taskdefs/Touch;->class$org$apache$tools$ant$types$resources$Touchable:Ljava/lang/Class;

    :goto_1
    invoke-virtual {v8, v12}, Lorg/apache/tools/ant/types/Resource;->as(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lorg/apache/tools/ant/types/resources/Touchable;

    .line 303
    .local v11, "t":Lorg/apache/tools/ant/types/resources/Touchable;
    if-nez v11, :cond_4

    .line 304
    new-instance v12, Lorg/apache/tools/ant/BuildException;

    new-instance v13, Ljava/lang/StringBuffer;

    invoke-direct {v13}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v14, "Can\'t touch "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v13

    invoke-virtual {v13, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-direct {v12, v13}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v12

    .line 302
    .end local v11    # "t":Lorg/apache/tools/ant/types/resources/Touchable;
    :cond_3
    sget-object v12, Lorg/apache/tools/ant/taskdefs/Touch;->class$org$apache$tools$ant$types$resources$Touchable:Ljava/lang/Class;

    goto :goto_1

    .line 306
    .restart local v11    # "t":Lorg/apache/tools/ant/types/resources/Touchable;
    :cond_4
    invoke-direct {p0, v8, v0, v1}, Lorg/apache/tools/ant/taskdefs/Touch;->touch(Lorg/apache/tools/ant/types/Resource;J)V

    goto :goto_0

    .line 312
    .end local v8    # "r":Lorg/apache/tools/ant/types/Resource;
    .end local v11    # "t":Lorg/apache/tools/ant/types/resources/Touchable;
    :cond_5
    iget-object v12, p0, Lorg/apache/tools/ant/taskdefs/Touch;->filesets:Ljava/util/Vector;

    invoke-virtual {v12}, Ljava/util/Vector;->size()I

    move-result v9

    .line 313
    .local v9, "size":I
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_2
    if-ge v5, v9, :cond_1

    .line 314
    iget-object v12, p0, Lorg/apache/tools/ant/taskdefs/Touch;->filesets:Ljava/util/Vector;

    invoke-virtual {v12, v5}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/apache/tools/ant/types/FileSet;

    .line 315
    .local v4, "fs":Lorg/apache/tools/ant/types/FileSet;
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Touch;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v12

    invoke-virtual {v4, v12}, Lorg/apache/tools/ant/types/FileSet;->getDirectoryScanner(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/DirectoryScanner;

    move-result-object v2

    .line 316
    .local v2, "ds":Lorg/apache/tools/ant/DirectoryScanner;
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Touch;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v12

    invoke-virtual {v4, v12}, Lorg/apache/tools/ant/types/FileSet;->getDir(Lorg/apache/tools/ant/Project;)Ljava/io/File;

    move-result-object v3

    .line 318
    .local v3, "fromDir":Ljava/io/File;
    invoke-virtual {v2}, Lorg/apache/tools/ant/DirectoryScanner;->getIncludedDirectories()[Ljava/lang/String;

    move-result-object v10

    .line 320
    .local v10, "srcDirs":[Ljava/lang/String;
    const/4 v7, 0x0

    .local v7, "j":I
    :goto_3
    array-length v12, v10

    if-ge v7, v12, :cond_6

    .line 321
    new-instance v12, Lorg/apache/tools/ant/types/resources/FileResource;

    aget-object v13, v10, v7

    invoke-direct {v12, v3, v13}, Lorg/apache/tools/ant/types/resources/FileResource;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-direct {p0, v12, v0, v1}, Lorg/apache/tools/ant/taskdefs/Touch;->touch(Lorg/apache/tools/ant/types/Resource;J)V

    .line 320
    add-int/lit8 v7, v7, 0x1

    goto :goto_3

    .line 313
    :cond_6
    add-int/lit8 v5, v5, 0x1

    goto :goto_2
.end method

.method protected touch(Ljava/io/File;)V
    .locals 2
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 335
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/Touch;->getTimestamp()J

    move-result-wide v0

    invoke-direct {p0, p1, v0, v1}, Lorg/apache/tools/ant/taskdefs/Touch;->touch(Ljava/io/File;J)V

    .line 336
    return-void
.end method
