.class public Lorg/apache/tools/ant/taskdefs/Get;
.super Lorg/apache/tools/ant/Task;
.source "Get.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/taskdefs/Get$GetThread;,
        Lorg/apache/tools/ant/taskdefs/Get$VerboseProgress;,
        Lorg/apache/tools/ant/taskdefs/Get$NullProgress;,
        Lorg/apache/tools/ant/taskdefs/Get$DownloadProgress;,
        Lorg/apache/tools/ant/taskdefs/Get$Base64Converter;
    }
.end annotation


# static fields
.field private static final BIG_BUFFER_SIZE:I = 0x19000

.field private static final DOTS_PER_LINE:I = 0x32

.field private static final FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

.field private static final HTTP:Ljava/lang/String; = "http"

.field private static final HTTPS:Ljava/lang/String; = "https"

.field private static final NUMBER_RETRIES:I = 0x3

.field private static final REDIRECT_LIMIT:I = 0x19

.field static class$org$apache$tools$ant$types$resources$URLProvider:Ljava/lang/Class;


# instance fields
.field private destination:Ljava/io/File;

.field private httpUseCaches:Z

.field private ignoreErrors:Z

.field private mapperElement:Lorg/apache/tools/ant/types/Mapper;

.field private maxTime:J

.field private numberRetries:I

.field private pword:Ljava/lang/String;

.field private skipExisting:Z

.field private sources:Lorg/apache/tools/ant/types/resources/Resources;

.field private uname:Ljava/lang/String;

.field private useTimestamp:Z

.field private verbose:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 60
    invoke-static {}, Lorg/apache/tools/ant/util/FileUtils;->getFileUtils()Lorg/apache/tools/ant/util/FileUtils;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/taskdefs/Get;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    return-void
.end method

.method public constructor <init>()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 56
    invoke-direct {p0}, Lorg/apache/tools/ant/Task;-><init>()V

    .line 66
    new-instance v0, Lorg/apache/tools/ant/types/resources/Resources;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/resources/Resources;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Get;->sources:Lorg/apache/tools/ant/types/resources/Resources;

    .line 68
    iput-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/Get;->verbose:Z

    .line 69
    iput-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/Get;->useTimestamp:Z

    .line 70
    iput-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/Get;->ignoreErrors:Z

    .line 71
    iput-object v3, p0, Lorg/apache/tools/ant/taskdefs/Get;->uname:Ljava/lang/String;

    .line 72
    iput-object v3, p0, Lorg/apache/tools/ant/taskdefs/Get;->pword:Ljava/lang/String;

    .line 73
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lorg/apache/tools/ant/taskdefs/Get;->maxTime:J

    .line 74
    const/4 v0, 0x3

    iput v0, p0, Lorg/apache/tools/ant/taskdefs/Get;->numberRetries:I

    .line 75
    iput-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/Get;->skipExisting:Z

    .line 76
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Get;->httpUseCaches:Z

    .line 77
    iput-object v3, p0, Lorg/apache/tools/ant/taskdefs/Get;->mapperElement:Lorg/apache/tools/ant/types/Mapper;

    .line 540
    return-void
.end method

.method static access$000(Lorg/apache/tools/ant/taskdefs/Get;)Z
    .locals 1
    .param p0, "x0"    # Lorg/apache/tools/ant/taskdefs/Get;

    .prologue
    .line 56
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Get;->useTimestamp:Z

    return v0
.end method

.method static access$100(Lorg/apache/tools/ant/taskdefs/Get;)Z
    .locals 1
    .param p0, "x0"    # Lorg/apache/tools/ant/taskdefs/Get;

    .prologue
    .line 56
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Get;->ignoreErrors:Z

    return v0
.end method

.method static access$200(Lorg/apache/tools/ant/taskdefs/Get;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lorg/apache/tools/ant/taskdefs/Get;

    .prologue
    .line 56
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Get;->uname:Ljava/lang/String;

    return-object v0
.end method

.method static access$300(Lorg/apache/tools/ant/taskdefs/Get;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lorg/apache/tools/ant/taskdefs/Get;

    .prologue
    .line 56
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Get;->pword:Ljava/lang/String;

    return-object v0
.end method

.method static access$400(Lorg/apache/tools/ant/taskdefs/Get;)Z
    .locals 1
    .param p0, "x0"    # Lorg/apache/tools/ant/taskdefs/Get;

    .prologue
    .line 56
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Get;->httpUseCaches:Z

    return v0
.end method

.method static access$500(Lorg/apache/tools/ant/taskdefs/Get;)I
    .locals 1
    .param p0, "x0"    # Lorg/apache/tools/ant/taskdefs/Get;

    .prologue
    .line 56
    iget v0, p0, Lorg/apache/tools/ant/taskdefs/Get;->numberRetries:I

    return v0
.end method

.method static access$600(Lorg/apache/tools/ant/taskdefs/Get;)Z
    .locals 1
    .param p0, "x0"    # Lorg/apache/tools/ant/taskdefs/Get;

    .prologue
    .line 56
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Get;->verbose:Z

    return v0
.end method

.method static access$700()Lorg/apache/tools/ant/util/FileUtils;
    .locals 1

    .prologue
    .line 56
    sget-object v0, Lorg/apache/tools/ant/taskdefs/Get;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    return-object v0
.end method

.method private checkAttributes()V
    .locals 5

    .prologue
    const/4 v4, 0x1

    .line 250
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Get;->sources:Lorg/apache/tools/ant/types/resources/Resources;

    invoke-virtual {v2}, Lorg/apache/tools/ant/types/resources/Resources;->size()I

    move-result v2

    if-nez v2, :cond_0

    .line 251
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v3, "at least one source is required"

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Get;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v2

    .line 254
    :cond_0
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Get;->sources:Lorg/apache/tools/ant/types/resources/Resources;

    invoke-virtual {v2}, Lorg/apache/tools/ant/types/resources/Resources;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "iter":Ljava/util/Iterator;
    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 255
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/tools/ant/types/Resource;

    sget-object v3, Lorg/apache/tools/ant/taskdefs/Get;->class$org$apache$tools$ant$types$resources$URLProvider:Ljava/lang/Class;

    if-nez v3, :cond_2

    const-string/jumbo v3, "org.apache.tools.ant.types.resources.URLProvider"

    invoke-static {v3}, Lorg/apache/tools/ant/taskdefs/Get;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    sput-object v3, Lorg/apache/tools/ant/taskdefs/Get;->class$org$apache$tools$ant$types$resources$URLProvider:Ljava/lang/Class;

    :goto_0
    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/types/Resource;->as(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    .line 256
    .local v1, "up":Ljava/lang/Object;
    if-nez v1, :cond_1

    .line 257
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v3, "Only URLProvider resources are supported"

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Get;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v2

    .line 255
    .end local v1    # "up":Ljava/lang/Object;
    :cond_2
    sget-object v3, Lorg/apache/tools/ant/taskdefs/Get;->class$org$apache$tools$ant$types$resources$URLProvider:Ljava/lang/Class;

    goto :goto_0

    .line 262
    :cond_3
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Get;->destination:Ljava/io/File;

    if-nez v2, :cond_4

    .line 263
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v3, "dest attribute is required"

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Get;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v2

    .line 266
    :cond_4
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Get;->destination:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_5

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Get;->sources:Lorg/apache/tools/ant/types/resources/Resources;

    invoke-virtual {v2}, Lorg/apache/tools/ant/types/resources/Resources;->size()I

    move-result v2

    if-le v2, v4, :cond_5

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Get;->destination:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->isDirectory()Z

    move-result v2

    if-nez v2, :cond_5

    .line 268
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v3, "The specified destination is not a directory"

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Get;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v2

    .line 273
    :cond_5
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Get;->destination:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_6

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Get;->destination:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->canWrite()Z

    move-result v2

    if-nez v2, :cond_6

    .line 274
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "Can\'t write to "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Get;->destination:Ljava/io/File;

    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Get;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v2

    .line 279
    :cond_6
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Get;->sources:Lorg/apache/tools/ant/types/resources/Resources;

    invoke-virtual {v2}, Lorg/apache/tools/ant/types/resources/Resources;->size()I

    move-result v2

    if-le v2, v4, :cond_7

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Get;->destination:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_7

    .line 280
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Get;->destination:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->mkdirs()Z

    .line 282
    :cond_7
    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 89
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


# virtual methods
.method public add(Lorg/apache/tools/ant/types/ResourceCollection;)V
    .locals 1
    .param p1, "rc"    # Lorg/apache/tools/ant/types/ResourceCollection;

    .prologue
    .line 298
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Get;->sources:Lorg/apache/tools/ant/types/resources/Resources;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/resources/Resources;->add(Lorg/apache/tools/ant/types/ResourceCollection;)V

    .line 299
    return-void
.end method

.method public add(Lorg/apache/tools/ant/util/FileNameMapper;)V
    .locals 1
    .param p1, "fileNameMapper"    # Lorg/apache/tools/ant/util/FileNameMapper;

    .prologue
    .line 436
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Get;->createMapper()Lorg/apache/tools/ant/types/Mapper;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Mapper;->add(Lorg/apache/tools/ant/util/FileNameMapper;)V

    .line 437
    return-void
.end method

.method public createMapper()Lorg/apache/tools/ant/types/Mapper;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 422
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Get;->mapperElement:Lorg/apache/tools/ant/types/Mapper;

    if-eqz v0, :cond_0

    .line 423
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Cannot define more than one mapper"

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Get;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v0

    .line 426
    :cond_0
    new-instance v0, Lorg/apache/tools/ant/types/Mapper;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Get;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/types/Mapper;-><init>(Lorg/apache/tools/ant/Project;)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Get;->mapperElement:Lorg/apache/tools/ant/types/Mapper;

    .line 427
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Get;->mapperElement:Lorg/apache/tools/ant/types/Mapper;

    return-object v0
.end method

.method public doGet(ILorg/apache/tools/ant/taskdefs/Get$DownloadProgress;)Z
    .locals 5
    .param p1, "logLevel"    # I
    .param p2, "progress"    # Lorg/apache/tools/ant/taskdefs/Get$DownloadProgress;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 159
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/Get;->checkAttributes()V

    .line 160
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Get;->sources:Lorg/apache/tools/ant/types/resources/Resources;

    invoke-virtual {v4}, Lorg/apache/tools/ant/types/resources/Resources;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "iter":Ljava/util/Iterator;
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 161
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/tools/ant/types/Resource;

    .line 162
    .local v1, "r":Lorg/apache/tools/ant/types/Resource;
    sget-object v4, Lorg/apache/tools/ant/taskdefs/Get;->class$org$apache$tools$ant$types$resources$URLProvider:Ljava/lang/Class;

    if-nez v4, :cond_0

    const-string/jumbo v4, "org.apache.tools.ant.types.resources.URLProvider"

    invoke-static {v4}, Lorg/apache/tools/ant/taskdefs/Get;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    sput-object v4, Lorg/apache/tools/ant/taskdefs/Get;->class$org$apache$tools$ant$types$resources$URLProvider:Ljava/lang/Class;

    :goto_0
    invoke-virtual {v1, v4}, Lorg/apache/tools/ant/types/Resource;->as(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/apache/tools/ant/types/resources/URLProvider;

    .line 163
    .local v3, "up":Lorg/apache/tools/ant/types/resources/URLProvider;
    invoke-interface {v3}, Lorg/apache/tools/ant/types/resources/URLProvider;->getURL()Ljava/net/URL;

    move-result-object v2

    .line 164
    .local v2, "source":Ljava/net/URL;
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Get;->destination:Ljava/io/File;

    invoke-virtual {p0, v2, v4, p1, p2}, Lorg/apache/tools/ant/taskdefs/Get;->doGet(Ljava/net/URL;Ljava/io/File;ILorg/apache/tools/ant/taskdefs/Get$DownloadProgress;)Z

    move-result v4

    .line 167
    .end local v1    # "r":Lorg/apache/tools/ant/types/Resource;
    .end local v2    # "source":Ljava/net/URL;
    .end local v3    # "up":Lorg/apache/tools/ant/types/resources/URLProvider;
    :goto_1
    return v4

    .line 162
    .restart local v1    # "r":Lorg/apache/tools/ant/types/Resource;
    :cond_0
    sget-object v4, Lorg/apache/tools/ant/taskdefs/Get;->class$org$apache$tools$ant$types$resources$URLProvider:Ljava/lang/Class;

    goto :goto_0

    .line 167
    .end local v1    # "r":Lorg/apache/tools/ant/types/Resource;
    :cond_1
    const/4 v4, 0x0

    goto :goto_1
.end method

.method public doGet(Ljava/net/URL;Ljava/io/File;ILorg/apache/tools/ant/taskdefs/Get$DownloadProgress;)Z
    .locals 12
    .param p1, "source"    # Ljava/net/URL;
    .param p2, "dest"    # Ljava/io/File;
    .param p3, "logLevel"    # I
    .param p4, "progress"    # Lorg/apache/tools/ant/taskdefs/Get$DownloadProgress;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 191
    invoke-virtual {p2}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_0

    iget-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/Get;->skipExisting:Z

    if-eqz v2, :cond_0

    .line 192
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "Destination already exists (skipping): "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {p2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2, p3}, Lorg/apache/tools/ant/taskdefs/Get;->log(Ljava/lang/String;I)V

    .line 194
    const/4 v2, 0x1

    .line 243
    :goto_0
    return v2

    .line 198
    :cond_0
    if-nez p4, :cond_1

    .line 199
    new-instance p4, Lorg/apache/tools/ant/taskdefs/Get$NullProgress;

    .end local p4    # "progress":Lorg/apache/tools/ant/taskdefs/Get$DownloadProgress;
    invoke-direct/range {p4 .. p4}, Lorg/apache/tools/ant/taskdefs/Get$NullProgress;-><init>()V

    .line 201
    .restart local p4    # "progress":Lorg/apache/tools/ant/taskdefs/Get$DownloadProgress;
    :cond_1
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "Getting: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2, p3}, Lorg/apache/tools/ant/taskdefs/Get;->log(Ljava/lang/String;I)V

    .line 202
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "To: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {p2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2, p3}, Lorg/apache/tools/ant/taskdefs/Get;->log(Ljava/lang/String;I)V

    .line 205
    const-wide/16 v6, 0x0

    .line 207
    .local v6, "timestamp":J
    const/4 v5, 0x0

    .line 208
    .local v5, "hasTimestamp":Z
    iget-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/Get;->useTimestamp:Z

    if-eqz v2, :cond_3

    invoke-virtual {p2}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 209
    invoke-virtual {p2}, Ljava/io/File;->lastModified()J

    move-result-wide v6

    .line 210
    iget-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/Get;->verbose:Z

    if-eqz v2, :cond_2

    .line 211
    new-instance v11, Ljava/util/Date;

    invoke-direct {v11, v6, v7}, Ljava/util/Date;-><init>(J)V

    .line 212
    .local v11, "t":Ljava/util/Date;
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "local file date : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v11}, Ljava/util/Date;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2, p3}, Lorg/apache/tools/ant/taskdefs/Get;->log(Ljava/lang/String;I)V

    .line 214
    .end local v11    # "t":Ljava/util/Date;
    :cond_2
    const/4 v5, 0x1

    .line 217
    :cond_3
    new-instance v1, Lorg/apache/tools/ant/taskdefs/Get$GetThread;

    move-object v2, p0

    move-object v3, p1

    move-object v4, p2

    move-object/from16 v8, p4

    move v9, p3

    invoke-direct/range {v1 .. v9}, Lorg/apache/tools/ant/taskdefs/Get$GetThread;-><init>(Lorg/apache/tools/ant/taskdefs/Get;Ljava/net/URL;Ljava/io/File;ZJLorg/apache/tools/ant/taskdefs/Get$DownloadProgress;I)V

    .line 220
    .local v1, "getThread":Lorg/apache/tools/ant/taskdefs/Get$GetThread;
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/taskdefs/Get$GetThread;->setDaemon(Z)V

    .line 221
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Get;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v2

    invoke-virtual {v2, v1, p0}, Lorg/apache/tools/ant/Project;->registerThreadTask(Ljava/lang/Thread;Lorg/apache/tools/ant/Task;)V

    .line 222
    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/Get$GetThread;->start()V

    .line 224
    :try_start_0
    iget-wide v2, p0, Lorg/apache/tools/ant/taskdefs/Get;->maxTime:J

    const-wide/16 v8, 0x3e8

    mul-long/2addr v2, v8

    invoke-virtual {v1, v2, v3}, Lorg/apache/tools/ant/taskdefs/Get$GetThread;->join(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 230
    :goto_1
    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/Get$GetThread;->isAlive()Z

    move-result v2

    if-eqz v2, :cond_6

    .line 231
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "The GET operation took longer than "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-wide v8, p0, Lorg/apache/tools/ant/taskdefs/Get;->maxTime:J

    invoke-virtual {v2, v8, v9}, Ljava/lang/StringBuffer;->append(J)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, " seconds, stopping it."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    .line 233
    .local v10, "msg":Ljava/lang/String;
    iget-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/Get;->ignoreErrors:Z

    if-eqz v2, :cond_4

    .line 234
    invoke-virtual {p0, v10}, Lorg/apache/tools/ant/taskdefs/Get;->log(Ljava/lang/String;)V

    .line 236
    :cond_4
    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/Get$GetThread;->closeStreams()V

    .line 237
    iget-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/Get;->ignoreErrors:Z

    if-nez v2, :cond_5

    .line 238
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v2, v10}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 225
    .end local v10    # "msg":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 226
    .local v0, "ie":Ljava/lang/InterruptedException;
    const-string/jumbo v2, "interrupted waiting for GET to finish"

    const/4 v3, 0x3

    invoke-virtual {p0, v2, v3}, Lorg/apache/tools/ant/taskdefs/Get;->log(Ljava/lang/String;I)V

    goto :goto_1

    .line 240
    .end local v0    # "ie":Ljava/lang/InterruptedException;
    .restart local v10    # "msg":Ljava/lang/String;
    :cond_5
    const/4 v2, 0x0

    goto/16 :goto_0

    .line 243
    .end local v10    # "msg":Ljava/lang/String;
    :cond_6
    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/Get$GetThread;->wasSuccessful()Z

    move-result v2

    goto/16 :goto_0
.end method

.method public execute()V
    .locals 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 85
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/Get;->checkAttributes()V

    .line 87
    iget-object v12, p0, Lorg/apache/tools/ant/taskdefs/Get;->sources:Lorg/apache/tools/ant/types/resources/Resources;

    invoke-virtual {v12}, Lorg/apache/tools/ant/types/resources/Resources;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "iter":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_a

    .line 88
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lorg/apache/tools/ant/types/Resource;

    .line 89
    .local v8, "r":Lorg/apache/tools/ant/types/Resource;
    sget-object v12, Lorg/apache/tools/ant/taskdefs/Get;->class$org$apache$tools$ant$types$resources$URLProvider:Ljava/lang/Class;

    if-nez v12, :cond_5

    const-string/jumbo v12, "org.apache.tools.ant.types.resources.URLProvider"

    invoke-static {v12}, Lorg/apache/tools/ant/taskdefs/Get;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v12

    sput-object v12, Lorg/apache/tools/ant/taskdefs/Get;->class$org$apache$tools$ant$types$resources$URLProvider:Ljava/lang/Class;

    :goto_1
    invoke-virtual {v8, v12}, Lorg/apache/tools/ant/types/Resource;->as(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lorg/apache/tools/ant/types/resources/URLProvider;

    .line 90
    .local v11, "up":Lorg/apache/tools/ant/types/resources/URLProvider;
    invoke-interface {v11}, Lorg/apache/tools/ant/types/resources/URLProvider;->getURL()Ljava/net/URL;

    move-result-object v10

    .line 92
    .local v10, "source":Ljava/net/URL;
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Get;->destination:Ljava/io/File;

    .line 93
    .local v1, "dest":Ljava/io/File;
    iget-object v12, p0, Lorg/apache/tools/ant/taskdefs/Get;->destination:Ljava/io/File;

    invoke-virtual {v12}, Ljava/io/File;->isDirectory()Z

    move-result v12

    if-eqz v12, :cond_3

    .line 94
    iget-object v12, p0, Lorg/apache/tools/ant/taskdefs/Get;->mapperElement:Lorg/apache/tools/ant/types/Mapper;

    if-nez v12, :cond_6

    .line 95
    invoke-virtual {v10}, Ljava/net/URL;->getPath()Ljava/lang/String;

    move-result-object v6

    .line 96
    .local v6, "path":Ljava/lang/String;
    const-string/jumbo v12, "/"

    invoke-virtual {v6, v12}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_1

    .line 97
    const/4 v12, 0x0

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v13

    add-int/lit8 v13, v13, -0x1

    invoke-virtual {v6, v12, v13}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    .line 99
    :cond_1
    const-string/jumbo v12, "/"

    invoke-virtual {v6, v12}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v9

    .line 100
    .local v9, "slash":I
    const/4 v12, -0x1

    if-le v9, v12, :cond_2

    .line 101
    add-int/lit8 v12, v9, 0x1

    invoke-virtual {v6, v12}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    .line 103
    :cond_2
    new-instance v1, Ljava/io/File;

    .end local v1    # "dest":Ljava/io/File;
    iget-object v12, p0, Lorg/apache/tools/ant/taskdefs/Get;->destination:Ljava/io/File;

    invoke-direct {v1, v12, v6}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 125
    .end local v6    # "path":Ljava/lang/String;
    .end local v9    # "slash":I
    .restart local v1    # "dest":Ljava/io/File;
    :cond_3
    :goto_2
    const/4 v4, 0x2

    .line 126
    .local v4, "logLevel":I
    const/4 v7, 0x0

    .line 127
    .local v7, "progress":Lorg/apache/tools/ant/taskdefs/Get$DownloadProgress;
    iget-boolean v12, p0, Lorg/apache/tools/ant/taskdefs/Get;->verbose:Z

    if-eqz v12, :cond_4

    .line 128
    new-instance v7, Lorg/apache/tools/ant/taskdefs/Get$VerboseProgress;

    .end local v7    # "progress":Lorg/apache/tools/ant/taskdefs/Get$DownloadProgress;
    sget-object v12, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-direct {v7, v12}, Lorg/apache/tools/ant/taskdefs/Get$VerboseProgress;-><init>(Ljava/io/PrintStream;)V

    .line 133
    .restart local v7    # "progress":Lorg/apache/tools/ant/taskdefs/Get$DownloadProgress;
    :cond_4
    :try_start_0
    invoke-virtual {p0, v10, v1, v4, v7}, Lorg/apache/tools/ant/taskdefs/Get;->doGet(Ljava/net/URL;Ljava/io/File;ILorg/apache/tools/ant/taskdefs/Get$DownloadProgress;)Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 134
    :catch_0
    move-exception v2

    .line 135
    .local v2, "ioe":Ljava/io/IOException;
    new-instance v12, Ljava/lang/StringBuffer;

    invoke-direct {v12}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v13, "Error getting "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    invoke-virtual {v12, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v12

    const-string/jumbo v13, " to "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    invoke-virtual {v12, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {p0, v12}, Lorg/apache/tools/ant/taskdefs/Get;->log(Ljava/lang/String;)V

    .line 136
    iget-boolean v12, p0, Lorg/apache/tools/ant/taskdefs/Get;->ignoreErrors:Z

    if-nez v12, :cond_0

    .line 137
    new-instance v12, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Get;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v13

    invoke-direct {v12, v2, v13}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v12

    .line 89
    .end local v1    # "dest":Ljava/io/File;
    .end local v2    # "ioe":Ljava/io/IOException;
    .end local v4    # "logLevel":I
    .end local v7    # "progress":Lorg/apache/tools/ant/taskdefs/Get$DownloadProgress;
    .end local v10    # "source":Ljava/net/URL;
    .end local v11    # "up":Lorg/apache/tools/ant/types/resources/URLProvider;
    :cond_5
    sget-object v12, Lorg/apache/tools/ant/taskdefs/Get;->class$org$apache$tools$ant$types$resources$URLProvider:Ljava/lang/Class;

    goto/16 :goto_1

    .line 105
    .restart local v1    # "dest":Ljava/io/File;
    .restart local v10    # "source":Ljava/net/URL;
    .restart local v11    # "up":Lorg/apache/tools/ant/types/resources/URLProvider;
    :cond_6
    iget-object v12, p0, Lorg/apache/tools/ant/taskdefs/Get;->mapperElement:Lorg/apache/tools/ant/types/Mapper;

    invoke-virtual {v12}, Lorg/apache/tools/ant/types/Mapper;->getImplementation()Lorg/apache/tools/ant/util/FileNameMapper;

    move-result-object v5

    .line 106
    .local v5, "mapper":Lorg/apache/tools/ant/util/FileNameMapper;
    invoke-virtual {v10}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-interface {v5, v12}, Lorg/apache/tools/ant/util/FileNameMapper;->mapFileName(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 107
    .local v0, "d":[Ljava/lang/String;
    if-nez v0, :cond_7

    .line 108
    new-instance v12, Ljava/lang/StringBuffer;

    invoke-direct {v12}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v13, "skipping "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    invoke-virtual {v12, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v12

    const-string/jumbo v13, " - mapper can\'t handle it"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v12

    const/4 v13, 0x1

    invoke-virtual {p0, v12, v13}, Lorg/apache/tools/ant/taskdefs/Get;->log(Ljava/lang/String;I)V

    goto/16 :goto_0

    .line 111
    :cond_7
    array-length v12, v0

    if-nez v12, :cond_8

    .line 112
    new-instance v12, Ljava/lang/StringBuffer;

    invoke-direct {v12}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v13, "skipping "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    invoke-virtual {v12, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v12

    const-string/jumbo v13, " - mapper returns no file name"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v12

    const/4 v13, 0x1

    invoke-virtual {p0, v12, v13}, Lorg/apache/tools/ant/taskdefs/Get;->log(Ljava/lang/String;I)V

    goto/16 :goto_0

    .line 115
    :cond_8
    array-length v12, v0

    const/4 v13, 0x1

    if-le v12, v13, :cond_9

    .line 116
    new-instance v12, Ljava/lang/StringBuffer;

    invoke-direct {v12}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v13, "skipping "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    invoke-virtual {v12, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v12

    const-string/jumbo v13, " - mapper returns multiple file"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    const-string/jumbo v13, " names"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v12

    const/4 v13, 0x1

    invoke-virtual {p0, v12, v13}, Lorg/apache/tools/ant/taskdefs/Get;->log(Ljava/lang/String;I)V

    goto/16 :goto_0

    .line 120
    :cond_9
    new-instance v1, Ljava/io/File;

    .end local v1    # "dest":Ljava/io/File;
    iget-object v12, p0, Lorg/apache/tools/ant/taskdefs/Get;->destination:Ljava/io/File;

    const/4 v13, 0x0

    aget-object v13, v0, v13

    invoke-direct {v1, v12, v13}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .restart local v1    # "dest":Ljava/io/File;
    goto/16 :goto_2

    .line 141
    .end local v0    # "d":[Ljava/lang/String;
    .end local v1    # "dest":Ljava/io/File;
    .end local v5    # "mapper":Lorg/apache/tools/ant/util/FileNameMapper;
    .end local v8    # "r":Lorg/apache/tools/ant/types/Resource;
    .end local v10    # "source":Ljava/net/URL;
    .end local v11    # "up":Lorg/apache/tools/ant/types/resources/URLProvider;
    :cond_a
    return-void
.end method

.method public setDest(Ljava/io/File;)V
    .locals 0
    .param p1, "dest"    # Ljava/io/File;

    .prologue
    .line 307
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Get;->destination:Ljava/io/File;

    .line 308
    return-void
.end method

.method public setHttpUseCaches(Z)V
    .locals 0
    .param p1, "httpUseCache"    # Z

    .prologue
    .line 412
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Get;->httpUseCaches:Z

    .line 413
    return-void
.end method

.method public setIgnoreErrors(Z)V
    .locals 0
    .param p1, "v"    # Z

    .prologue
    .line 325
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Get;->ignoreErrors:Z

    .line 326
    return-void
.end method

.method public setMaxTime(J)V
    .locals 1
    .param p1, "maxTime"    # J

    .prologue
    .line 376
    iput-wide p1, p0, Lorg/apache/tools/ant/taskdefs/Get;->maxTime:J

    .line 377
    return-void
.end method

.method public setPassword(Ljava/lang/String;)V
    .locals 0
    .param p1, "p"    # Ljava/lang/String;

    .prologue
    .line 366
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Get;->pword:Ljava/lang/String;

    .line 367
    return-void
.end method

.method public setRetries(I)V
    .locals 0
    .param p1, "r"    # I

    .prologue
    .line 387
    iput p1, p0, Lorg/apache/tools/ant/taskdefs/Get;->numberRetries:I

    .line 388
    return-void
.end method

.method public setSkipExisting(Z)V
    .locals 0
    .param p1, "s"    # Z

    .prologue
    .line 398
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Get;->skipExisting:Z

    .line 399
    return-void
.end method

.method public setSrc(Ljava/net/URL;)V
    .locals 1
    .param p1, "u"    # Ljava/net/URL;

    .prologue
    .line 290
    new-instance v0, Lorg/apache/tools/ant/types/resources/URLResource;

    invoke-direct {v0, p1}, Lorg/apache/tools/ant/types/resources/URLResource;-><init>(Ljava/net/URL;)V

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/Get;->add(Lorg/apache/tools/ant/types/ResourceCollection;)V

    .line 291
    return-void
.end method

.method public setUseTimestamp(Z)V
    .locals 0
    .param p1, "v"    # Z

    .prologue
    .line 347
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Get;->useTimestamp:Z

    .line 348
    return-void
.end method

.method public setUsername(Ljava/lang/String;)V
    .locals 0
    .param p1, "u"    # Ljava/lang/String;

    .prologue
    .line 357
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Get;->uname:Ljava/lang/String;

    .line 358
    return-void
.end method

.method public setVerbose(Z)V
    .locals 0
    .param p1, "v"    # Z

    .prologue
    .line 316
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Get;->verbose:Z

    .line 317
    return-void
.end method
