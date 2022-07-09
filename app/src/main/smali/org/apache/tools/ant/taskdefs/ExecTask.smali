.class public Lorg/apache/tools/ant/taskdefs/ExecTask;
.super Lorg/apache/tools/ant/Task;
.source "ExecTask.java"


# static fields
.field private static final FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;


# instance fields
.field protected cmdl:Lorg/apache/tools/ant/types/Commandline;

.field private dir:Ljava/io/File;

.field private env:Lorg/apache/tools/ant/types/Environment;

.field private error:Ljava/io/File;

.field private executable:Ljava/lang/String;

.field private failIfExecFails:Z

.field protected failOnError:Z

.field private incompatibleWithSpawn:Z

.field private input:Ljava/io/File;

.field private inputString:Ljava/lang/String;

.field protected newEnvironment:Z

.field private os:Ljava/lang/String;

.field private osFamily:Ljava/lang/String;

.field private output:Ljava/io/File;

.field protected redirector:Lorg/apache/tools/ant/taskdefs/Redirector;

.field protected redirectorElement:Lorg/apache/tools/ant/types/RedirectorElement;

.field private resolveExecutable:Z

.field private resultProperty:Ljava/lang/String;

.field private searchPath:Z

.field private spawn:Z

.field private timeout:Ljava/lang/Long;

.field private vmLauncher:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 47
    invoke-static {}, Lorg/apache/tools/ant/util/FileUtils;->getFileUtils()Lorg/apache/tools/ant/util/FileUtils;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/taskdefs/ExecTask;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 88
    invoke-direct {p0}, Lorg/apache/tools/ant/Task;-><init>()V

    .line 54
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->failOnError:Z

    .line 55
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->newEnvironment:Z

    .line 56
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->timeout:Ljava/lang/Long;

    .line 57
    new-instance v0, Lorg/apache/tools/ant/types/Environment;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/Environment;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->env:Lorg/apache/tools/ant/types/Environment;

    .line 58
    new-instance v0, Lorg/apache/tools/ant/types/Commandline;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/Commandline;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->cmdl:Lorg/apache/tools/ant/types/Commandline;

    .line 60
    iput-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->failIfExecFails:Z

    .line 62
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->resolveExecutable:Z

    .line 63
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->searchPath:Z

    .line 64
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->spawn:Z

    .line 65
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->incompatibleWithSpawn:Z

    .line 73
    new-instance v0, Lorg/apache/tools/ant/taskdefs/Redirector;

    invoke-direct {v0, p0}, Lorg/apache/tools/ant/taskdefs/Redirector;-><init>(Lorg/apache/tools/ant/Task;)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->redirector:Lorg/apache/tools/ant/taskdefs/Redirector;

    .line 81
    iput-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->vmLauncher:Z

    .line 89
    return-void
.end method

.method public constructor <init>(Lorg/apache/tools/ant/Task;)V
    .locals 3
    .param p1, "owner"    # Lorg/apache/tools/ant/Task;

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 97
    invoke-direct {p0}, Lorg/apache/tools/ant/Task;-><init>()V

    .line 54
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->failOnError:Z

    .line 55
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->newEnvironment:Z

    .line 56
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->timeout:Ljava/lang/Long;

    .line 57
    new-instance v0, Lorg/apache/tools/ant/types/Environment;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/Environment;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->env:Lorg/apache/tools/ant/types/Environment;

    .line 58
    new-instance v0, Lorg/apache/tools/ant/types/Commandline;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/Commandline;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->cmdl:Lorg/apache/tools/ant/types/Commandline;

    .line 60
    iput-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->failIfExecFails:Z

    .line 62
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->resolveExecutable:Z

    .line 63
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->searchPath:Z

    .line 64
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->spawn:Z

    .line 65
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->incompatibleWithSpawn:Z

    .line 73
    new-instance v0, Lorg/apache/tools/ant/taskdefs/Redirector;

    invoke-direct {v0, p0}, Lorg/apache/tools/ant/taskdefs/Redirector;-><init>(Lorg/apache/tools/ant/Task;)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->redirector:Lorg/apache/tools/ant/taskdefs/Redirector;

    .line 81
    iput-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->vmLauncher:Z

    .line 98
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/taskdefs/ExecTask;->bindToOwner(Lorg/apache/tools/ant/Task;)V

    .line 99
    return-void
.end method

.method private getPath(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "line"    # Ljava/lang/String;

    .prologue
    .line 721
    const-string/jumbo v0, "PATH="

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getPath(Ljava/util/Map;)Ljava/lang/String;
    .locals 2
    .param p1, "map"    # Ljava/util/Map;

    .prologue
    .line 725
    const-string/jumbo v1, "PATH"

    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 726
    .local v0, "p":Ljava/lang/String;
    if-eqz v0, :cond_0

    .end local v0    # "p":Ljava/lang/String;
    :goto_0
    return-object v0

    .restart local v0    # "p":Ljava/lang/String;
    :cond_0
    const-string/jumbo v1, "Path"

    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    move-object v0, v1

    goto :goto_0
.end method

.method private isPath(Ljava/lang/String;)Z
    .locals 1
    .param p1, "line"    # Ljava/lang/String;

    .prologue
    .line 716
    const-string/jumbo v0, "PATH="

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string/jumbo v0, "Path="

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public addConfiguredRedirector(Lorg/apache/tools/ant/types/RedirectorElement;)V
    .locals 2
    .param p1, "redirectorElement"    # Lorg/apache/tools/ant/types/RedirectorElement;

    .prologue
    .line 392
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->redirectorElement:Lorg/apache/tools/ant/types/RedirectorElement;

    if-eqz v0, :cond_0

    .line 393
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "cannot have > 1 nested <redirector>s"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 395
    :cond_0
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->redirectorElement:Lorg/apache/tools/ant/types/RedirectorElement;

    .line 396
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->incompatibleWithSpawn:Z

    .line 397
    return-void
.end method

.method public addEnv(Lorg/apache/tools/ant/types/Environment$Variable;)V
    .locals 1
    .param p1, "var"    # Lorg/apache/tools/ant/types/Environment$Variable;

    .prologue
    .line 321
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->env:Lorg/apache/tools/ant/types/Environment;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Environment;->addVariable(Lorg/apache/tools/ant/types/Environment$Variable;)V

    .line 322
    return-void
.end method

.method protected checkConfiguration()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 509
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->cmdl:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->getExecutable()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    .line 510
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "no executable specified"

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/ExecTask;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v0

    .line 512
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->dir:Ljava/io/File;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->dir:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_1

    .line 513
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "The directory "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->dir:Ljava/io/File;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, " does not exist"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 515
    :cond_1
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->dir:Ljava/io/File;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->dir:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-nez v0, :cond_2

    .line 516
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->dir:Ljava/io/File;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, " is not a directory"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 518
    :cond_2
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->spawn:Z

    if-eqz v0, :cond_3

    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->incompatibleWithSpawn:Z

    if-eqz v0, :cond_3

    .line 519
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/ExecTask;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    const-string/jumbo v1, "spawn does not allow attributes related to input, output, error, result"

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V

    .line 521
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/ExecTask;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    const-string/jumbo v1, "spawn also does not allow timeout"

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V

    .line 522
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/ExecTask;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    const-string/jumbo v1, "finally, spawn is not compatible with a nested I/O <redirector>"

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V

    .line 524
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "You have used an attribute or nested element which is not compatible with spawn"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 527
    :cond_3
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/ExecTask;->setupRedirector()V

    .line 528
    return-void
.end method

.method public createArg()Lorg/apache/tools/ant/types/Commandline$Argument;
    .locals 1

    .prologue
    .line 330
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->cmdl:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    return-object v0
.end method

.method protected createHandler()Lorg/apache/tools/ant/taskdefs/ExecuteStreamHandler;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 694
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->redirector:Lorg/apache/tools/ant/taskdefs/Redirector;

    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/Redirector;->createHandler()Lorg/apache/tools/ant/taskdefs/ExecuteStreamHandler;

    move-result-object v0

    return-object v0
.end method

.method protected createWatchdog()Lorg/apache/tools/ant/taskdefs/ExecuteWatchdog;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 705
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->timeout:Ljava/lang/Long;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Lorg/apache/tools/ant/taskdefs/ExecuteWatchdog;

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->timeout:Ljava/lang/Long;

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-direct {v0, v2, v3}, Lorg/apache/tools/ant/taskdefs/ExecuteWatchdog;-><init>(J)V

    goto :goto_0
.end method

.method public execute()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 491
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/ExecTask;->isValidOs()Z

    move-result v1

    if-nez v1, :cond_0

    .line 502
    :goto_0
    return-void

    .line 494
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->dir:Ljava/io/File;

    .line 495
    .local v0, "savedDir":Ljava/io/File;
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->cmdl:Lorg/apache/tools/ant/types/Commandline;

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->executable:Ljava/lang/String;

    iget-boolean v3, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->searchPath:Z

    invoke-virtual {p0, v2, v3}, Lorg/apache/tools/ant/taskdefs/ExecTask;->resolveExecutable(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/types/Commandline;->setExecutable(Ljava/lang/String;)V

    .line 496
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/ExecTask;->checkConfiguration()V

    .line 498
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/ExecTask;->prepareExec()Lorg/apache/tools/ant/taskdefs/Execute;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/taskdefs/ExecTask;->runExec(Lorg/apache/tools/ant/taskdefs/Execute;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 500
    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->dir:Ljava/io/File;

    goto :goto_0

    :catchall_0
    move-exception v1

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->dir:Ljava/io/File;

    throw v1
.end method

.method public final getOs()Ljava/lang/String;
    .locals 1

    .prologue
    .line 163
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->os:Ljava/lang/String;

    return-object v0
.end method

.method public final getOsFamily()Ljava/lang/String;
    .locals 1

    .prologue
    .line 413
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->osFamily:Ljava/lang/String;

    return-object v0
.end method

.method public getResolveExecutable()Z
    .locals 1

    .prologue
    .line 312
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->resolveExecutable:Z

    return v0
.end method

.method protected isValidOs()Z
    .locals 5

    .prologue
    const/4 v4, 0x3

    const/4 v1, 0x0

    .line 559
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->osFamily:Ljava/lang/String;

    if-eqz v2, :cond_0

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->osFamily:Ljava/lang/String;

    invoke-static {v2}, Lorg/apache/tools/ant/taskdefs/condition/Os;->isFamily(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 574
    :goto_0
    return v1

    .line 565
    :cond_0
    const-string/jumbo v2, "os.name"

    invoke-static {v2}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 566
    .local v0, "myos":Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "Current OS is "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2, v4}, Lorg/apache/tools/ant/taskdefs/ExecTask;->log(Ljava/lang/String;I)V

    .line 567
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->os:Ljava/lang/String;

    if-eqz v2, :cond_1

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->os:Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    if-gez v2, :cond_1

    .line 569
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "This OS, "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, " was not found in the specified list of valid OSes: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->os:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2, v4}, Lorg/apache/tools/ant/taskdefs/ExecTask;->log(Ljava/lang/String;I)V

    goto :goto_0

    .line 574
    :cond_1
    const/4 v1, 0x1

    goto :goto_0
.end method

.method protected logFlush()V
    .locals 0

    .prologue
    .line 713
    return-void
.end method

.method protected maybeSetResultPropertyValue(I)V
    .locals 3
    .param p1, "result"    # I

    .prologue
    .line 353
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->resultProperty:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 354
    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    .line 355
    .local v0, "res":Ljava/lang/String;
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/ExecTask;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->resultProperty:Ljava/lang/String;

    invoke-virtual {v1, v2, v0}, Lorg/apache/tools/ant/Project;->setNewProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 357
    .end local v0    # "res":Ljava/lang/String;
    :cond_0
    return-void
.end method

.method protected prepareExec()Lorg/apache/tools/ant/taskdefs/Execute;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 596
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->dir:Ljava/io/File;

    if-nez v3, :cond_0

    .line 597
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/ExecTask;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v3

    invoke-virtual {v3}, Lorg/apache/tools/ant/Project;->getBaseDir()Ljava/io/File;

    move-result-object v3

    iput-object v3, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->dir:Ljava/io/File;

    .line 599
    :cond_0
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->redirectorElement:Lorg/apache/tools/ant/types/RedirectorElement;

    if-eqz v3, :cond_1

    .line 600
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->redirectorElement:Lorg/apache/tools/ant/types/RedirectorElement;

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->redirector:Lorg/apache/tools/ant/taskdefs/Redirector;

    invoke-virtual {v3, v4}, Lorg/apache/tools/ant/types/RedirectorElement;->configure(Lorg/apache/tools/ant/taskdefs/Redirector;)V

    .line 602
    :cond_1
    new-instance v1, Lorg/apache/tools/ant/taskdefs/Execute;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/ExecTask;->createHandler()Lorg/apache/tools/ant/taskdefs/ExecuteStreamHandler;

    move-result-object v3

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/ExecTask;->createWatchdog()Lorg/apache/tools/ant/taskdefs/ExecuteWatchdog;

    move-result-object v4

    invoke-direct {v1, v3, v4}, Lorg/apache/tools/ant/taskdefs/Execute;-><init>(Lorg/apache/tools/ant/taskdefs/ExecuteStreamHandler;Lorg/apache/tools/ant/taskdefs/ExecuteWatchdog;)V

    .line 603
    .local v1, "exe":Lorg/apache/tools/ant/taskdefs/Execute;
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/ExecTask;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v3

    invoke-virtual {v1, v3}, Lorg/apache/tools/ant/taskdefs/Execute;->setAntRun(Lorg/apache/tools/ant/Project;)V

    .line 604
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->dir:Ljava/io/File;

    invoke-virtual {v1, v3}, Lorg/apache/tools/ant/taskdefs/Execute;->setWorkingDirectory(Ljava/io/File;)V

    .line 605
    iget-boolean v3, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->vmLauncher:Z

    invoke-virtual {v1, v3}, Lorg/apache/tools/ant/taskdefs/Execute;->setVMLauncher(Z)V

    .line 606
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->env:Lorg/apache/tools/ant/types/Environment;

    invoke-virtual {v3}, Lorg/apache/tools/ant/types/Environment;->getVariables()[Ljava/lang/String;

    move-result-object v0

    .line 607
    .local v0, "environment":[Ljava/lang/String;
    if-eqz v0, :cond_2

    .line 608
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v3, v0

    if-ge v2, v3, :cond_2

    .line 609
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "Setting environment variable: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    aget-object v4, v0, v2

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x3

    invoke-virtual {p0, v3, v4}, Lorg/apache/tools/ant/taskdefs/ExecTask;->log(Ljava/lang/String;I)V

    .line 608
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 613
    .end local v2    # "i":I
    :cond_2
    iget-boolean v3, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->newEnvironment:Z

    invoke-virtual {v1, v3}, Lorg/apache/tools/ant/taskdefs/Execute;->setNewenvironment(Z)V

    .line 614
    invoke-virtual {v1, v0}, Lorg/apache/tools/ant/taskdefs/Execute;->setEnvironment([Ljava/lang/String;)V

    .line 615
    return-object v1
.end method

.method protected resolveExecutable(Ljava/lang/String;Z)Ljava/lang/String;
    .locals 9
    .param p1, "exec"    # Ljava/lang/String;
    .param p2, "mustSearchPath"    # Z

    .prologue
    .line 430
    iget-boolean v6, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->resolveExecutable:Z

    if-nez v6, :cond_1

    .line 476
    .end local p1    # "exec":Ljava/lang/String;
    :cond_0
    :goto_0
    return-object p1

    .line 434
    .restart local p1    # "exec":Ljava/lang/String;
    :cond_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/ExecTask;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v6

    invoke-virtual {v6, p1}, Lorg/apache/tools/ant/Project;->resolveFile(Ljava/lang/String;)Ljava/io/File;

    move-result-object v2

    .line 435
    .local v2, "executableFile":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v6

    if-eqz v6, :cond_2

    .line 436
    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    .line 439
    :cond_2
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->dir:Ljava/io/File;

    if-eqz v6, :cond_3

    .line 440
    sget-object v6, Lorg/apache/tools/ant/taskdefs/ExecTask;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->dir:Ljava/io/File;

    invoke-virtual {v6, v7, p1}, Lorg/apache/tools/ant/util/FileUtils;->resolveFile(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;

    move-result-object v2

    .line 441
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v6

    if-eqz v6, :cond_3

    .line 442
    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    .line 446
    :cond_3
    if-eqz p2, :cond_0

    .line 447
    const/4 v4, 0x0

    .line 448
    .local v4, "p":Lorg/apache/tools/ant/types/Path;
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->env:Lorg/apache/tools/ant/types/Environment;

    invoke-virtual {v6}, Lorg/apache/tools/ant/types/Environment;->getVariables()[Ljava/lang/String;

    move-result-object v1

    .line 449
    .local v1, "environment":[Ljava/lang/String;
    if-eqz v1, :cond_4

    .line 450
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1
    array-length v6, v1

    if-ge v3, v6, :cond_4

    .line 451
    aget-object v6, v1, v3

    invoke-direct {p0, v6}, Lorg/apache/tools/ant/taskdefs/ExecTask;->isPath(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_6

    .line 452
    new-instance v4, Lorg/apache/tools/ant/types/Path;

    .end local v4    # "p":Lorg/apache/tools/ant/types/Path;
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/ExecTask;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v6

    aget-object v7, v1, v3

    invoke-direct {p0, v7}, Lorg/apache/tools/ant/taskdefs/ExecTask;->getPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v4, v6, v7}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;Ljava/lang/String;)V

    .line 457
    .end local v3    # "i":I
    .restart local v4    # "p":Lorg/apache/tools/ant/types/Path;
    :cond_4
    if-nez v4, :cond_5

    .line 458
    invoke-static {}, Lorg/apache/tools/ant/taskdefs/Execute;->getEnvironmentVariables()Ljava/util/Map;

    move-result-object v6

    invoke-direct {p0, v6}, Lorg/apache/tools/ant/taskdefs/ExecTask;->getPath(Ljava/util/Map;)Ljava/lang/String;

    move-result-object v5

    .line 459
    .local v5, "path":Ljava/lang/String;
    if-eqz v5, :cond_5

    .line 460
    new-instance v4, Lorg/apache/tools/ant/types/Path;

    .end local v4    # "p":Lorg/apache/tools/ant/types/Path;
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/ExecTask;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v6

    invoke-direct {v4, v6, v5}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;Ljava/lang/String;)V

    .line 463
    .end local v5    # "path":Ljava/lang/String;
    .restart local v4    # "p":Lorg/apache/tools/ant/types/Path;
    :cond_5
    if-eqz v4, :cond_0

    .line 464
    invoke-virtual {v4}, Lorg/apache/tools/ant/types/Path;->list()[Ljava/lang/String;

    move-result-object v0

    .line 465
    .local v0, "dirs":[Ljava/lang/String;
    const/4 v3, 0x0

    .restart local v3    # "i":I
    :goto_2
    array-length v6, v0

    if-ge v3, v6, :cond_0

    .line 466
    sget-object v6, Lorg/apache/tools/ant/taskdefs/ExecTask;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    new-instance v7, Ljava/io/File;

    aget-object v8, v0, v3

    invoke-direct {v7, v8}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v7, p1}, Lorg/apache/tools/ant/util/FileUtils;->resolveFile(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;

    move-result-object v2

    .line 468
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v6

    if-eqz v6, :cond_7

    .line 469
    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p1

    goto/16 :goto_0

    .line 450
    .end local v0    # "dirs":[Ljava/lang/String;
    :cond_6
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 465
    .restart local v0    # "dirs":[Ljava/lang/String;
    :cond_7
    add-int/lit8 v3, v3, 0x1

    goto :goto_2
.end method

.method protected runExec(Lorg/apache/tools/ant/taskdefs/Execute;)V
    .locals 4
    .param p1, "exe"    # Lorg/apache/tools/ant/taskdefs/Execute;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 668
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->cmdl:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Commandline;->describeCommand()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x3

    invoke-virtual {p0, v1, v2}, Lorg/apache/tools/ant/taskdefs/ExecTask;->log(Ljava/lang/String;I)V

    .line 670
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->cmdl:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Commandline;->getCommandline()[Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Lorg/apache/tools/ant/taskdefs/Execute;->setCommandline([Ljava/lang/String;)V

    .line 672
    :try_start_0
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/taskdefs/ExecTask;->runExecute(Lorg/apache/tools/ant/taskdefs/Execute;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 682
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/ExecTask;->logFlush()V

    .line 684
    :goto_0
    return-void

    .line 673
    :catch_0
    move-exception v0

    .line 674
    .local v0, "e":Ljava/io/IOException;
    :try_start_1
    iget-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->failIfExecFails:Z

    if-eqz v1, :cond_0

    .line 675
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "Execute failed: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v0}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/ExecTask;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v3

    invoke-direct {v1, v2, v0, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 682
    .end local v0    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v1

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/ExecTask;->logFlush()V

    throw v1

    .line 678
    .restart local v0    # "e":Ljava/io/IOException;
    :cond_0
    :try_start_2
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "Execute failed: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v0}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2}, Lorg/apache/tools/ant/taskdefs/ExecTask;->log(Ljava/lang/String;I)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 682
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/ExecTask;->logFlush()V

    goto :goto_0
.end method

.method protected final runExecute(Lorg/apache/tools/ant/taskdefs/Execute;)V
    .locals 5
    .param p1, "exe"    # Lorg/apache/tools/ant/taskdefs/Execute;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 628
    const/4 v1, -0x1

    .line 630
    .local v1, "returnCode":I
    iget-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->spawn:Z

    if-nez v2, :cond_4

    .line 631
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/Execute;->execute()I

    move-result v1

    .line 634
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/Execute;->killedProcess()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 635
    const-string/jumbo v0, "Timeout: killed the sub-process"

    .line 636
    .local v0, "msg":Ljava/lang/String;
    iget-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->failOnError:Z

    if-eqz v2, :cond_0

    .line 637
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v2, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 639
    :cond_0
    const/4 v2, 0x1

    invoke-virtual {p0, v0, v2}, Lorg/apache/tools/ant/taskdefs/ExecTask;->log(Ljava/lang/String;I)V

    .line 642
    .end local v0    # "msg":Ljava/lang/String;
    :cond_1
    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/taskdefs/ExecTask;->maybeSetResultPropertyValue(I)V

    .line 643
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->redirector:Lorg/apache/tools/ant/taskdefs/Redirector;

    invoke-virtual {v2}, Lorg/apache/tools/ant/taskdefs/Redirector;->complete()V

    .line 644
    invoke-static {v1}, Lorg/apache/tools/ant/taskdefs/Execute;->isFailure(I)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 645
    iget-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->failOnError:Z

    if-eqz v2, :cond_2

    .line 646
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/ExecTask;->getTaskType()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, " returned: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/ExecTask;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v2

    .line 649
    :cond_2
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "Result: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {p0, v2, v3}, Lorg/apache/tools/ant/taskdefs/ExecTask;->log(Ljava/lang/String;I)V

    .line 655
    :cond_3
    :goto_0
    return-void

    .line 653
    :cond_4
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/Execute;->spawn()V

    goto :goto_0
.end method

.method public setAppend(Z)V
    .locals 1
    .param p1, "append"    # Z

    .prologue
    .line 381
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->redirector:Lorg/apache/tools/ant/taskdefs/Redirector;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/taskdefs/Redirector;->setAppend(Z)V

    .line 382
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->incompatibleWithSpawn:Z

    .line 383
    return-void
.end method

.method public setCommand(Lorg/apache/tools/ant/types/Commandline;)V
    .locals 2
    .param p1, "cmdl"    # Lorg/apache/tools/ant/types/Commandline;

    .prologue
    .line 172
    const-string/jumbo v0, "The command attribute is deprecated.\nPlease use the executable attribute and nested arg elements."

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lorg/apache/tools/ant/taskdefs/ExecTask;->log(Ljava/lang/String;I)V

    .line 175
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->cmdl:Lorg/apache/tools/ant/types/Commandline;

    .line 176
    return-void
.end method

.method public setDir(Ljava/io/File;)V
    .locals 0
    .param p1, "d"    # Ljava/io/File;

    .prologue
    .line 147
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->dir:Ljava/io/File;

    .line 148
    return-void
.end method

.method public setError(Ljava/io/File;)V
    .locals 1
    .param p1, "error"    # Ljava/io/File;

    .prologue
    .line 236
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->error:Ljava/io/File;

    .line 237
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->incompatibleWithSpawn:Z

    .line 238
    return-void
.end method

.method public setErrorProperty(Ljava/lang/String;)V
    .locals 1
    .param p1, "errorProperty"    # Ljava/lang/String;

    .prologue
    .line 260
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->redirector:Lorg/apache/tools/ant/taskdefs/Redirector;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/taskdefs/Redirector;->setErrorProperty(Ljava/lang/String;)V

    .line 261
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->incompatibleWithSpawn:Z

    .line 262
    return-void
.end method

.method public setExecutable(Ljava/lang/String;)V
    .locals 1
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 138
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->executable:Ljava/lang/String;

    .line 139
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->cmdl:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Commandline;->setExecutable(Ljava/lang/String;)V

    .line 140
    return-void
.end method

.method public setFailIfExecutionFails(Z)V
    .locals 1
    .param p1, "flag"    # Z

    .prologue
    .line 368
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->failIfExecFails:Z

    .line 369
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->incompatibleWithSpawn:Z

    .line 370
    return-void
.end method

.method public setFailonerror(Z)V
    .locals 1
    .param p1, "fail"    # Z

    .prologue
    .line 270
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->failOnError:Z

    .line 271
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->incompatibleWithSpawn:Z

    or-int/2addr v0, p1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->incompatibleWithSpawn:Z

    .line 272
    return-void
.end method

.method public setInput(Ljava/io/File;)V
    .locals 2
    .param p1, "input"    # Ljava/io/File;

    .prologue
    .line 195
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->inputString:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 196
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "The \"input\" and \"inputstring\" attributes cannot both be specified"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 199
    :cond_0
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->input:Ljava/io/File;

    .line 200
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->incompatibleWithSpawn:Z

    .line 201
    return-void
.end method

.method public setInputString(Ljava/lang/String;)V
    .locals 2
    .param p1, "inputString"    # Ljava/lang/String;

    .prologue
    .line 209
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->input:Ljava/io/File;

    if-eqz v0, :cond_0

    .line 210
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "The \"input\" and \"inputstring\" attributes cannot both be specified"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 213
    :cond_0
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->inputString:Ljava/lang/String;

    .line 214
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->incompatibleWithSpawn:Z

    .line 215
    return-void
.end method

.method public setLogError(Z)V
    .locals 1
    .param p1, "logError"    # Z

    .prologue
    .line 224
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->redirector:Lorg/apache/tools/ant/taskdefs/Redirector;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/taskdefs/Redirector;->setLogError(Z)V

    .line 225
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->incompatibleWithSpawn:Z

    or-int/2addr v0, p1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->incompatibleWithSpawn:Z

    .line 226
    return-void
.end method

.method public setNewenvironment(Z)V
    .locals 0
    .param p1, "newenv"    # Z

    .prologue
    .line 281
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->newEnvironment:Z

    .line 282
    return-void
.end method

.method public setOs(Ljava/lang/String;)V
    .locals 0
    .param p1, "os"    # Ljava/lang/String;

    .prologue
    .line 155
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->os:Ljava/lang/String;

    .line 156
    return-void
.end method

.method public setOsFamily(Ljava/lang/String;)V
    .locals 1
    .param p1, "osFamily"    # Ljava/lang/String;

    .prologue
    .line 405
    sget-object v0, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {p1, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->osFamily:Ljava/lang/String;

    .line 406
    return-void
.end method

.method public setOutput(Ljava/io/File;)V
    .locals 1
    .param p1, "out"    # Ljava/io/File;

    .prologue
    .line 185
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->output:Ljava/io/File;

    .line 186
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->incompatibleWithSpawn:Z

    .line 187
    return-void
.end method

.method public setOutputproperty(Ljava/lang/String;)V
    .locals 1
    .param p1, "outputProp"    # Ljava/lang/String;

    .prologue
    .line 247
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->redirector:Lorg/apache/tools/ant/taskdefs/Redirector;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/taskdefs/Redirector;->setOutputProperty(Ljava/lang/String;)V

    .line 248
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->incompatibleWithSpawn:Z

    .line 249
    return-void
.end method

.method public setResolveExecutable(Z)V
    .locals 0
    .param p1, "resolveExecutable"    # Z

    .prologue
    .line 291
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->resolveExecutable:Z

    .line 292
    return-void
.end method

.method public setResultProperty(Ljava/lang/String;)V
    .locals 1
    .param p1, "resultProperty"    # Ljava/lang/String;

    .prologue
    .line 342
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->resultProperty:Ljava/lang/String;

    .line 343
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->incompatibleWithSpawn:Z

    .line 344
    return-void
.end method

.method public setSearchPath(Z)V
    .locals 0
    .param p1, "searchPath"    # Z

    .prologue
    .line 301
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->searchPath:Z

    .line 302
    return-void
.end method

.method public setSpawn(Z)V
    .locals 0
    .param p1, "spawn"    # Z

    .prologue
    .line 108
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->spawn:Z

    .line 109
    return-void
.end method

.method public setTimeout(Ljava/lang/Integer;)V
    .locals 4
    .param p1, "value"    # Ljava/lang/Integer;

    .prologue
    .line 129
    if-nez p1, :cond_0

    const/4 v0, 0x0

    :goto_0
    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/ExecTask;->setTimeout(Ljava/lang/Long;)V

    .line 131
    return-void

    .line 129
    :cond_0
    new-instance v0, Ljava/lang/Long;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    int-to-long v2, v1

    invoke-direct {v0, v2, v3}, Ljava/lang/Long;-><init>(J)V

    goto :goto_0
.end method

.method public setTimeout(Ljava/lang/Long;)V
    .locals 1
    .param p1, "value"    # Ljava/lang/Long;

    .prologue
    .line 119
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->timeout:Ljava/lang/Long;

    .line 120
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->incompatibleWithSpawn:Z

    .line 121
    return-void
.end method

.method public setVMLauncher(Z)V
    .locals 0
    .param p1, "vmLauncher"    # Z

    .prologue
    .line 584
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->vmLauncher:Z

    .line 585
    return-void
.end method

.method protected setupRedirector()V
    .locals 2

    .prologue
    .line 534
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->redirector:Lorg/apache/tools/ant/taskdefs/Redirector;

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->input:Ljava/io/File;

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/taskdefs/Redirector;->setInput(Ljava/io/File;)V

    .line 535
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->redirector:Lorg/apache/tools/ant/taskdefs/Redirector;

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->inputString:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/taskdefs/Redirector;->setInputString(Ljava/lang/String;)V

    .line 536
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->redirector:Lorg/apache/tools/ant/taskdefs/Redirector;

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->output:Ljava/io/File;

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/taskdefs/Redirector;->setOutput(Ljava/io/File;)V

    .line 537
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->redirector:Lorg/apache/tools/ant/taskdefs/Redirector;

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/ExecTask;->error:Ljava/io/File;

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/taskdefs/Redirector;->setError(Ljava/io/File;)V

    .line 538
    return-void
.end method
