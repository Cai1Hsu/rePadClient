.class public Lorg/apache/tools/ant/taskdefs/Java;
.super Lorg/apache/tools/ant/Task;
.source "Java.java"


# static fields
.field private static final TIMEOUT_MESSAGE:Ljava/lang/String; = "Timeout: killed the sub-process"


# instance fields
.field private cmdl:Lorg/apache/tools/ant/types/CommandlineJava;

.field private dir:Ljava/io/File;

.field private env:Lorg/apache/tools/ant/types/Environment;

.field private error:Ljava/io/File;

.field private failOnError:Z

.field private fork:Z

.field private incompatibleWithSpawn:Z

.field private input:Ljava/io/File;

.field private inputString:Ljava/lang/String;

.field private newEnvironment:Z

.field private output:Ljava/io/File;

.field private perm:Lorg/apache/tools/ant/types/Permissions;

.field protected redirector:Lorg/apache/tools/ant/taskdefs/Redirector;

.field protected redirectorElement:Lorg/apache/tools/ant/types/RedirectorElement;

.field private resultProperty:Ljava/lang/String;

.field private spawn:Z

.field private timeout:Ljava/lang/Long;


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 85
    invoke-direct {p0}, Lorg/apache/tools/ant/Task;-><init>()V

    .line 54
    new-instance v0, Lorg/apache/tools/ant/types/CommandlineJava;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/CommandlineJava;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Java;->cmdl:Lorg/apache/tools/ant/types/CommandlineJava;

    .line 55
    new-instance v0, Lorg/apache/tools/ant/types/Environment;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/Environment;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Java;->env:Lorg/apache/tools/ant/types/Environment;

    .line 56
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/Java;->fork:Z

    .line 57
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/Java;->newEnvironment:Z

    .line 58
    iput-object v2, p0, Lorg/apache/tools/ant/taskdefs/Java;->dir:Ljava/io/File;

    .line 59
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/Java;->failOnError:Z

    .line 60
    iput-object v2, p0, Lorg/apache/tools/ant/taskdefs/Java;->timeout:Ljava/lang/Long;

    .line 69
    new-instance v0, Lorg/apache/tools/ant/taskdefs/Redirector;

    invoke-direct {v0, p0}, Lorg/apache/tools/ant/taskdefs/Redirector;-><init>(Lorg/apache/tools/ant/Task;)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Java;->redirector:Lorg/apache/tools/ant/taskdefs/Redirector;

    .line 74
    iput-object v2, p0, Lorg/apache/tools/ant/taskdefs/Java;->perm:Lorg/apache/tools/ant/types/Permissions;

    .line 76
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/Java;->spawn:Z

    .line 77
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/Java;->incompatibleWithSpawn:Z

    .line 86
    return-void
.end method

.method public constructor <init>(Lorg/apache/tools/ant/Task;)V
    .locals 3
    .param p1, "owner"    # Lorg/apache/tools/ant/Task;

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 92
    invoke-direct {p0}, Lorg/apache/tools/ant/Task;-><init>()V

    .line 54
    new-instance v0, Lorg/apache/tools/ant/types/CommandlineJava;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/CommandlineJava;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Java;->cmdl:Lorg/apache/tools/ant/types/CommandlineJava;

    .line 55
    new-instance v0, Lorg/apache/tools/ant/types/Environment;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/Environment;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Java;->env:Lorg/apache/tools/ant/types/Environment;

    .line 56
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/Java;->fork:Z

    .line 57
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/Java;->newEnvironment:Z

    .line 58
    iput-object v2, p0, Lorg/apache/tools/ant/taskdefs/Java;->dir:Ljava/io/File;

    .line 59
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/Java;->failOnError:Z

    .line 60
    iput-object v2, p0, Lorg/apache/tools/ant/taskdefs/Java;->timeout:Ljava/lang/Long;

    .line 69
    new-instance v0, Lorg/apache/tools/ant/taskdefs/Redirector;

    invoke-direct {v0, p0}, Lorg/apache/tools/ant/taskdefs/Redirector;-><init>(Lorg/apache/tools/ant/Task;)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Java;->redirector:Lorg/apache/tools/ant/taskdefs/Redirector;

    .line 74
    iput-object v2, p0, Lorg/apache/tools/ant/taskdefs/Java;->perm:Lorg/apache/tools/ant/types/Permissions;

    .line 76
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/Java;->spawn:Z

    .line 77
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/Java;->incompatibleWithSpawn:Z

    .line 93
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/taskdefs/Java;->bindToOwner(Lorg/apache/tools/ant/Task;)V

    .line 94
    return-void
.end method

.method private fork([Ljava/lang/String;)I
    .locals 5
    .param p1, "command"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 786
    new-instance v1, Lorg/apache/tools/ant/taskdefs/Execute;

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Java;->redirector:Lorg/apache/tools/ant/taskdefs/Redirector;

    invoke-virtual {v3}, Lorg/apache/tools/ant/taskdefs/Redirector;->createHandler()Lorg/apache/tools/ant/taskdefs/ExecuteStreamHandler;

    move-result-object v3

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Java;->createWatchdog()Lorg/apache/tools/ant/taskdefs/ExecuteWatchdog;

    move-result-object v4

    invoke-direct {v1, v3, v4}, Lorg/apache/tools/ant/taskdefs/Execute;-><init>(Lorg/apache/tools/ant/taskdefs/ExecuteStreamHandler;Lorg/apache/tools/ant/taskdefs/ExecuteWatchdog;)V

    .line 788
    .local v1, "exe":Lorg/apache/tools/ant/taskdefs/Execute;
    invoke-direct {p0, v1, p1}, Lorg/apache/tools/ant/taskdefs/Java;->setupExecutable(Lorg/apache/tools/ant/taskdefs/Execute;[Ljava/lang/String;)V

    .line 791
    :try_start_0
    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/Execute;->execute()I

    move-result v2

    .line 792
    .local v2, "rc":I
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Java;->redirector:Lorg/apache/tools/ant/taskdefs/Redirector;

    invoke-virtual {v3}, Lorg/apache/tools/ant/taskdefs/Redirector;->complete()V

    .line 793
    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/Execute;->killedProcess()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 794
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v4, "Timeout: killed the sub-process"

    invoke-direct {v3, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 797
    .end local v2    # "rc":I
    :catch_0
    move-exception v0

    .line 798
    .local v0, "e":Ljava/io/IOException;
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Java;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v4

    invoke-direct {v3, v0, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v3

    .line 796
    .end local v0    # "e":Ljava/io/IOException;
    .restart local v2    # "rc":I
    :cond_0
    return v2
.end method

.method private log(Ljava/lang/Throwable;)V
    .locals 4
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 938
    new-instance v0, Ljava/io/StringWriter;

    invoke-direct {v0}, Ljava/io/StringWriter;-><init>()V

    .line 939
    .local v0, "sw":Ljava/io/StringWriter;
    new-instance v1, Ljava/io/PrintWriter;

    invoke-direct {v1, v0}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    .line 940
    .local v1, "w":Ljava/io/PrintWriter;
    invoke-virtual {p1, v1}, Ljava/lang/Throwable;->printStackTrace(Ljava/io/PrintWriter;)V

    .line 941
    invoke-virtual {v1}, Ljava/io/PrintWriter;->close()V

    .line 942
    invoke-virtual {v0}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {p0, v2, v3}, Lorg/apache/tools/ant/taskdefs/Java;->log(Ljava/lang/String;I)V

    .line 943
    return-void
.end method

.method private run(Lorg/apache/tools/ant/types/CommandlineJava;)V
    .locals 4
    .param p1, "command"    # Lorg/apache/tools/ant/types/CommandlineJava;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 764
    :try_start_0
    new-instance v1, Lorg/apache/tools/ant/taskdefs/ExecuteJava;

    invoke-direct {v1}, Lorg/apache/tools/ant/taskdefs/ExecuteJava;-><init>()V

    .line 765
    .local v1, "exe":Lorg/apache/tools/ant/taskdefs/ExecuteJava;
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/CommandlineJava;->getJavaCommand()Lorg/apache/tools/ant/types/Commandline;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/taskdefs/ExecuteJava;->setJavaCommand(Lorg/apache/tools/ant/types/Commandline;)V

    .line 766
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/CommandlineJava;->getClasspath()Lorg/apache/tools/ant/types/Path;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/taskdefs/ExecuteJava;->setClasspath(Lorg/apache/tools/ant/types/Path;)V

    .line 767
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/CommandlineJava;->getSystemProperties()Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/taskdefs/ExecuteJava;->setSystemProperties(Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;)V

    .line 768
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Java;->perm:Lorg/apache/tools/ant/types/Permissions;

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/taskdefs/ExecuteJava;->setPermissions(Lorg/apache/tools/ant/types/Permissions;)V

    .line 769
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Java;->timeout:Ljava/lang/Long;

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/taskdefs/ExecuteJava;->setTimeout(Ljava/lang/Long;)V

    .line 770
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Java;->redirector:Lorg/apache/tools/ant/taskdefs/Redirector;

    invoke-virtual {v2}, Lorg/apache/tools/ant/taskdefs/Redirector;->createStreams()V

    .line 771
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Java;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/taskdefs/ExecuteJava;->execute(Lorg/apache/tools/ant/Project;)V

    .line 772
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Java;->redirector:Lorg/apache/tools/ant/taskdefs/Redirector;

    invoke-virtual {v2}, Lorg/apache/tools/ant/taskdefs/Redirector;->complete()V

    .line 773
    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/ExecuteJava;->killedProcess()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 774
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v3, "Timeout: killed the sub-process"

    invoke-direct {v2, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 776
    .end local v1    # "exe":Lorg/apache/tools/ant/taskdefs/ExecuteJava;
    :catch_0
    move-exception v0

    .line 777
    .local v0, "e":Ljava/io/IOException;
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v2, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v2

    .line 779
    .end local v0    # "e":Ljava/io/IOException;
    .restart local v1    # "exe":Lorg/apache/tools/ant/taskdefs/ExecuteJava;
    :cond_0
    return-void
.end method

.method private setupCommandLine(Lorg/apache/tools/ant/taskdefs/Execute;[Ljava/lang/String;)V
    .locals 1
    .param p1, "exe"    # Lorg/apache/tools/ant/taskdefs/Execute;
    .param p2, "command"    # [Ljava/lang/String;

    .prologue
    .line 872
    const-string/jumbo v0, "openvms"

    invoke-static {v0}, Lorg/apache/tools/ant/taskdefs/condition/Os;->isFamily(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 873
    invoke-direct {p0, p1, p2}, Lorg/apache/tools/ant/taskdefs/Java;->setupCommandLineForVMS(Lorg/apache/tools/ant/taskdefs/Execute;[Ljava/lang/String;)V

    .line 877
    :goto_0
    return-void

    .line 875
    :cond_0
    invoke-virtual {p1, p2}, Lorg/apache/tools/ant/taskdefs/Execute;->setCommandline([Ljava/lang/String;)V

    goto :goto_0
.end method

.method private setupCommandLineForVMS(Lorg/apache/tools/ant/taskdefs/Execute;[Ljava/lang/String;)V
    .locals 0
    .param p1, "exe"    # Lorg/apache/tools/ant/taskdefs/Execute;
    .param p2, "command"    # [Ljava/lang/String;

    .prologue
    .line 888
    invoke-static {p1, p2}, Lorg/apache/tools/ant/taskdefs/ExecuteJava;->setupCommandLineForVMS(Lorg/apache/tools/ant/taskdefs/Execute;[Ljava/lang/String;)V

    .line 889
    return-void
.end method

.method private setupEnvironment(Lorg/apache/tools/ant/taskdefs/Execute;)V
    .locals 4
    .param p1, "exe"    # Lorg/apache/tools/ant/taskdefs/Execute;

    .prologue
    .line 835
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Java;->env:Lorg/apache/tools/ant/types/Environment;

    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Environment;->getVariables()[Ljava/lang/String;

    move-result-object v0

    .line 836
    .local v0, "environment":[Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 837
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v2, v0

    if-ge v1, v2, :cond_0

    .line 838
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "Setting environment variable: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    aget-object v3, v0, v1

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x3

    invoke-virtual {p0, v2, v3}, Lorg/apache/tools/ant/taskdefs/Java;->log(Ljava/lang/String;I)V

    .line 837
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 842
    .end local v1    # "i":I
    :cond_0
    iget-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/Java;->newEnvironment:Z

    invoke-virtual {p1, v2}, Lorg/apache/tools/ant/taskdefs/Execute;->setNewenvironment(Z)V

    .line 843
    invoke-virtual {p1, v0}, Lorg/apache/tools/ant/taskdefs/Execute;->setEnvironment([Ljava/lang/String;)V

    .line 844
    return-void
.end method

.method private setupExecutable(Lorg/apache/tools/ant/taskdefs/Execute;[Ljava/lang/String;)V
    .locals 1
    .param p1, "exe"    # Lorg/apache/tools/ant/taskdefs/Execute;
    .param p2, "command"    # [Ljava/lang/String;

    .prologue
    .line 824
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Java;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    invoke-virtual {p1, v0}, Lorg/apache/tools/ant/taskdefs/Execute;->setAntRun(Lorg/apache/tools/ant/Project;)V

    .line 825
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/taskdefs/Java;->setupWorkingDir(Lorg/apache/tools/ant/taskdefs/Execute;)V

    .line 826
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/taskdefs/Java;->setupEnvironment(Lorg/apache/tools/ant/taskdefs/Execute;)V

    .line 827
    invoke-direct {p0, p1, p2}, Lorg/apache/tools/ant/taskdefs/Java;->setupCommandLine(Lorg/apache/tools/ant/taskdefs/Execute;[Ljava/lang/String;)V

    .line 828
    return-void
.end method

.method private setupWorkingDir(Lorg/apache/tools/ant/taskdefs/Execute;)V
    .locals 3
    .param p1, "exe"    # Lorg/apache/tools/ant/taskdefs/Execute;

    .prologue
    .line 852
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Java;->dir:Ljava/io/File;

    if-nez v0, :cond_1

    .line 853
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Java;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/tools/ant/Project;->getBaseDir()Ljava/io/File;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Java;->dir:Ljava/io/File;

    .line 859
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Java;->dir:Ljava/io/File;

    invoke-virtual {p1, v0}, Lorg/apache/tools/ant/taskdefs/Execute;->setWorkingDirectory(Ljava/io/File;)V

    .line 860
    return-void

    .line 854
    :cond_1
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Java;->dir:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Java;->dir:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-nez v0, :cond_0

    .line 855
    :cond_2
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Java;->dir:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, " is not a valid directory"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Java;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v0
.end method

.method private spawn([Ljava/lang/String;)V
    .locals 4
    .param p1, "command"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 807
    new-instance v1, Lorg/apache/tools/ant/taskdefs/Execute;

    invoke-direct {v1}, Lorg/apache/tools/ant/taskdefs/Execute;-><init>()V

    .line 808
    .local v1, "exe":Lorg/apache/tools/ant/taskdefs/Execute;
    invoke-direct {p0, v1, p1}, Lorg/apache/tools/ant/taskdefs/Java;->setupExecutable(Lorg/apache/tools/ant/taskdefs/Execute;[Ljava/lang/String;)V

    .line 810
    :try_start_0
    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/Execute;->spawn()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 814
    return-void

    .line 811
    :catch_0
    move-exception v0

    .line 812
    .local v0, "e":Ljava/io/IOException;
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Java;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v3

    invoke-direct {v2, v0, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v2
.end method


# virtual methods
.method public addAssertions(Lorg/apache/tools/ant/types/Assertions;)V
    .locals 2
    .param p1, "asserts"    # Lorg/apache/tools/ant/types/Assertions;

    .prologue
    .line 643
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Java;->getCommandLine()Lorg/apache/tools/ant/types/CommandlineJava;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/CommandlineJava;->getAssertions()Lorg/apache/tools/ant/types/Assertions;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 644
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Only one assertion declaration is allowed"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 646
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Java;->getCommandLine()Lorg/apache/tools/ant/types/CommandlineJava;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/CommandlineJava;->setAssertions(Lorg/apache/tools/ant/types/Assertions;)V

    .line 647
    return-void
.end method

.method public addConfiguredRedirector(Lorg/apache/tools/ant/types/RedirectorElement;)V
    .locals 2
    .param p1, "redirectorElement"    # Lorg/apache/tools/ant/types/RedirectorElement;

    .prologue
    .line 654
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Java;->redirectorElement:Lorg/apache/tools/ant/types/RedirectorElement;

    if-eqz v0, :cond_0

    .line 655
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "cannot have > 1 nested redirectors"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 657
    :cond_0
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Java;->redirectorElement:Lorg/apache/tools/ant/types/RedirectorElement;

    .line 658
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Java;->incompatibleWithSpawn:Z

    .line 659
    return-void
.end method

.method public addEnv(Lorg/apache/tools/ant/types/Environment$Variable;)V
    .locals 1
    .param p1, "var"    # Lorg/apache/tools/ant/types/Environment$Variable;

    .prologue
    .line 597
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Java;->env:Lorg/apache/tools/ant/types/Environment;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Environment;->addVariable(Lorg/apache/tools/ant/types/Environment$Variable;)V

    .line 598
    return-void
.end method

.method public addSysproperty(Lorg/apache/tools/ant/types/Environment$Variable;)V
    .locals 1
    .param p1, "sysp"    # Lorg/apache/tools/ant/types/Environment$Variable;

    .prologue
    .line 446
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Java;->getCommandLine()Lorg/apache/tools/ant/types/CommandlineJava;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/CommandlineJava;->addSysproperty(Lorg/apache/tools/ant/types/Environment$Variable;)V

    .line 447
    return-void
.end method

.method public addSyspropertyset(Lorg/apache/tools/ant/types/PropertySet;)V
    .locals 1
    .param p1, "sysp"    # Lorg/apache/tools/ant/types/PropertySet;

    .prologue
    .line 457
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Java;->getCommandLine()Lorg/apache/tools/ant/types/CommandlineJava;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/CommandlineJava;->addSyspropertyset(Lorg/apache/tools/ant/types/PropertySet;)V

    .line 458
    return-void
.end method

.method protected checkConfiguration()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x3

    const/4 v2, 0x1

    .line 143
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Java;->getCommandLine()Lorg/apache/tools/ant/types/CommandlineJava;

    move-result-object v1

    invoke-virtual {v1}, Lorg/apache/tools/ant/types/CommandlineJava;->getClassname()Ljava/lang/String;

    move-result-object v0

    .line 144
    .local v0, "classname":Ljava/lang/String;
    if-nez v0, :cond_0

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Java;->getCommandLine()Lorg/apache/tools/ant/types/CommandlineJava;

    move-result-object v1

    invoke-virtual {v1}, Lorg/apache/tools/ant/types/CommandlineJava;->getJar()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_0

    .line 145
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v2, "Classname must not be null."

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 147
    :cond_0
    iget-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/Java;->fork:Z

    if-nez v1, :cond_1

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Java;->getCommandLine()Lorg/apache/tools/ant/types/CommandlineJava;

    move-result-object v1

    invoke-virtual {v1}, Lorg/apache/tools/ant/types/CommandlineJava;->getJar()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 148
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v2, "Cannot execute a jar in non-forked mode. Please set fork=\'true\'. "

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 151
    :cond_1
    iget-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/Java;->spawn:Z

    if-eqz v1, :cond_2

    iget-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/Java;->fork:Z

    if-nez v1, :cond_2

    .line 152
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v2, "Cannot spawn a java process in non-forked mode. Please set fork=\'true\'. "

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 155
    :cond_2
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Java;->getCommandLine()Lorg/apache/tools/ant/types/CommandlineJava;

    move-result-object v1

    invoke-virtual {v1}, Lorg/apache/tools/ant/types/CommandlineJava;->getClasspath()Lorg/apache/tools/ant/types/Path;

    move-result-object v1

    if-eqz v1, :cond_3

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Java;->getCommandLine()Lorg/apache/tools/ant/types/CommandlineJava;

    move-result-object v1

    invoke-virtual {v1}, Lorg/apache/tools/ant/types/CommandlineJava;->getJar()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_3

    .line 157
    const-string/jumbo v1, "When using \'jar\' attribute classpath-settings are ignored. See the manual for more information."

    invoke-virtual {p0, v1, v3}, Lorg/apache/tools/ant/taskdefs/Java;->log(Ljava/lang/String;I)V

    .line 160
    :cond_3
    iget-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/Java;->spawn:Z

    if-eqz v1, :cond_4

    iget-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/Java;->incompatibleWithSpawn:Z

    if-eqz v1, :cond_4

    .line 161
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Java;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    const-string/jumbo v2, "spawn does not allow attributes related to input, output, error, result"

    invoke-virtual {v1, v2, v4}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V

    .line 163
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Java;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    const-string/jumbo v2, "spawn also does not allow timeout"

    invoke-virtual {v1, v2, v4}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V

    .line 164
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Java;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    const-string/jumbo v2, "finally, spawn is not compatible with a nested I/O <redirector>"

    invoke-virtual {v1, v2, v4}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V

    .line 166
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v2, "You have used an attribute or nested element which is not compatible with spawn"

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 169
    :cond_4
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Java;->getCommandLine()Lorg/apache/tools/ant/types/CommandlineJava;

    move-result-object v1

    invoke-virtual {v1}, Lorg/apache/tools/ant/types/CommandlineJava;->getAssertions()Lorg/apache/tools/ant/types/Assertions;

    move-result-object v1

    if-eqz v1, :cond_5

    iget-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/Java;->fork:Z

    if-nez v1, :cond_5

    .line 170
    const-string/jumbo v1, "Assertion statements are currently ignored in non-forked mode"

    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/taskdefs/Java;->log(Ljava/lang/String;)V

    .line 172
    :cond_5
    iget-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/Java;->fork:Z

    if-eqz v1, :cond_7

    .line 173
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Java;->perm:Lorg/apache/tools/ant/types/Permissions;

    if-eqz v1, :cond_6

    .line 174
    const-string/jumbo v1, "Permissions can not be set this way in forked mode."

    invoke-virtual {p0, v1, v2}, Lorg/apache/tools/ant/taskdefs/Java;->log(Ljava/lang/String;I)V

    .line 176
    :cond_6
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Java;->getCommandLine()Lorg/apache/tools/ant/types/CommandlineJava;

    move-result-object v1

    invoke-virtual {v1}, Lorg/apache/tools/ant/types/CommandlineJava;->describeCommand()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1, v3}, Lorg/apache/tools/ant/taskdefs/Java;->log(Ljava/lang/String;I)V

    .line 202
    :goto_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Java;->setupRedirector()V

    .line 203
    return-void

    .line 178
    :cond_7
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Java;->getCommandLine()Lorg/apache/tools/ant/types/CommandlineJava;

    move-result-object v1

    invoke-virtual {v1}, Lorg/apache/tools/ant/types/CommandlineJava;->getVmCommand()Lorg/apache/tools/ant/types/Commandline;

    move-result-object v1

    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Commandline;->size()I

    move-result v1

    if-le v1, v2, :cond_8

    .line 179
    const-string/jumbo v1, "JVM args ignored when same JVM is used."

    invoke-virtual {p0, v1, v2}, Lorg/apache/tools/ant/taskdefs/Java;->log(Ljava/lang/String;I)V

    .line 182
    :cond_8
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Java;->dir:Ljava/io/File;

    if-eqz v1, :cond_9

    .line 183
    const-string/jumbo v1, "Working directory ignored when same JVM is used."

    invoke-virtual {p0, v1, v2}, Lorg/apache/tools/ant/taskdefs/Java;->log(Ljava/lang/String;I)V

    .line 186
    :cond_9
    iget-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/Java;->newEnvironment:Z

    if-nez v1, :cond_a

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Java;->env:Lorg/apache/tools/ant/types/Environment;

    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Environment;->getVariables()[Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_b

    .line 187
    :cond_a
    const-string/jumbo v1, "Changes to environment variables are ignored when same JVM is used."

    invoke-virtual {p0, v1, v2}, Lorg/apache/tools/ant/taskdefs/Java;->log(Ljava/lang/String;I)V

    .line 190
    :cond_b
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Java;->getCommandLine()Lorg/apache/tools/ant/types/CommandlineJava;

    move-result-object v1

    invoke-virtual {v1}, Lorg/apache/tools/ant/types/CommandlineJava;->getBootclasspath()Lorg/apache/tools/ant/types/Path;

    move-result-object v1

    if-eqz v1, :cond_c

    .line 191
    const-string/jumbo v1, "bootclasspath ignored when same JVM is used."

    invoke-virtual {p0, v1, v2}, Lorg/apache/tools/ant/taskdefs/Java;->log(Ljava/lang/String;I)V

    .line 194
    :cond_c
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Java;->perm:Lorg/apache/tools/ant/types/Permissions;

    if-nez v1, :cond_d

    .line 195
    new-instance v1, Lorg/apache/tools/ant/types/Permissions;

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/types/Permissions;-><init>(Z)V

    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/Java;->perm:Lorg/apache/tools/ant/types/Permissions;

    .line 196
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "running "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Java;->getCommandLine()Lorg/apache/tools/ant/types/CommandlineJava;

    move-result-object v2

    invoke-virtual {v2}, Lorg/apache/tools/ant/types/CommandlineJava;->getClassname()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, " with default permissions (exit forbidden)"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1, v3}, Lorg/apache/tools/ant/taskdefs/Java;->log(Ljava/lang/String;I)V

    .line 199
    :cond_d
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "Running in same VM "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Java;->getCommandLine()Lorg/apache/tools/ant/types/CommandlineJava;

    move-result-object v2

    invoke-virtual {v2}, Lorg/apache/tools/ant/types/CommandlineJava;->describeJavaCommand()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1, v3}, Lorg/apache/tools/ant/taskdefs/Java;->log(Ljava/lang/String;I)V

    goto/16 :goto_0
.end method

.method public clearArgs()V
    .locals 1

    .prologue
    .line 913
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Java;->getCommandLine()Lorg/apache/tools/ant/types/CommandlineJava;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/CommandlineJava;->clearJavaArgs()V

    .line 914
    return-void
.end method

.method public createArg()Lorg/apache/tools/ant/types/Commandline$Argument;
    .locals 1

    .prologue
    .line 373
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Java;->getCommandLine()Lorg/apache/tools/ant/types/CommandlineJava;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/CommandlineJava;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    return-object v0
.end method

.method public createBootclasspath()Lorg/apache/tools/ant/types/Path;
    .locals 2

    .prologue
    .line 288
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Java;->getCommandLine()Lorg/apache/tools/ant/types/CommandlineJava;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Java;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/CommandlineJava;->createBootclasspath(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Path;->createPath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    return-object v0
.end method

.method public createClasspath()Lorg/apache/tools/ant/types/Path;
    .locals 2

    .prologue
    .line 278
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Java;->getCommandLine()Lorg/apache/tools/ant/types/CommandlineJava;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Java;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/CommandlineJava;->createClasspath(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Path;->createPath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    return-object v0
.end method

.method public createJvmarg()Lorg/apache/tools/ant/types/Commandline$Argument;
    .locals 1

    .prologue
    .line 428
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Java;->getCommandLine()Lorg/apache/tools/ant/types/CommandlineJava;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/CommandlineJava;->createVmArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    return-object v0
.end method

.method public createPermissions()Lorg/apache/tools/ant/types/Permissions;
    .locals 1

    .prologue
    .line 297
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Java;->perm:Lorg/apache/tools/ant/types/Permissions;

    if-nez v0, :cond_0

    new-instance v0, Lorg/apache/tools/ant/types/Permissions;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/Permissions;-><init>()V

    :goto_0
    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Java;->perm:Lorg/apache/tools/ant/types/Permissions;

    .line 298
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Java;->perm:Lorg/apache/tools/ant/types/Permissions;

    return-object v0

    .line 297
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Java;->perm:Lorg/apache/tools/ant/types/Permissions;

    goto :goto_0
.end method

.method protected createWatchdog()Lorg/apache/tools/ant/taskdefs/ExecuteWatchdog;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 926
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Java;->timeout:Ljava/lang/Long;

    if-nez v0, :cond_0

    .line 927
    const/4 v0, 0x0

    .line 929
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Lorg/apache/tools/ant/taskdefs/ExecuteWatchdog;

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Java;->timeout:Ljava/lang/Long;

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-direct {v0, v2, v3}, Lorg/apache/tools/ant/taskdefs/ExecuteWatchdog;-><init>(J)V

    goto :goto_0
.end method

.method public execute()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 102
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Java;->dir:Ljava/io/File;

    .line 103
    .local v1, "savedDir":Ljava/io/File;
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Java;->perm:Lorg/apache/tools/ant/types/Permissions;

    .line 105
    .local v2, "savedPermissions":Lorg/apache/tools/ant/types/Permissions;
    const/4 v0, -0x1

    .line 107
    .local v0, "err":I
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Java;->checkConfiguration()V

    .line 108
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Java;->executeJava()I

    move-result v0

    .line 109
    if-eqz v0, :cond_1

    .line 110
    iget-boolean v3, p0, Lorg/apache/tools/ant/taskdefs/Java;->failOnError:Z

    if-eqz v3, :cond_0

    .line 111
    new-instance v3, Lorg/apache/tools/ant/ExitStatusException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "Java returned: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Java;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v5

    invoke-direct {v3, v4, v0, v5}, Lorg/apache/tools/ant/ExitStatusException;-><init>(Ljava/lang/String;ILorg/apache/tools/ant/Location;)V

    throw v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 120
    :catchall_0
    move-exception v3

    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/Java;->dir:Ljava/io/File;

    .line 121
    iput-object v2, p0, Lorg/apache/tools/ant/taskdefs/Java;->perm:Lorg/apache/tools/ant/types/Permissions;

    throw v3

    .line 115
    :cond_0
    :try_start_1
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "Java Result: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {p0, v3, v4}, Lorg/apache/tools/ant/taskdefs/Java;->log(Ljava/lang/String;I)V

    .line 118
    :cond_1
    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/Java;->maybeSetResultPropertyValue(I)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 120
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/Java;->dir:Ljava/io/File;

    .line 121
    iput-object v2, p0, Lorg/apache/tools/ant/taskdefs/Java;->perm:Lorg/apache/tools/ant/types/Permissions;

    .line 123
    return-void
.end method

.method public executeJava()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 135
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Java;->getCommandLine()Lorg/apache/tools/ant/types/CommandlineJava;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/Java;->executeJava(Lorg/apache/tools/ant/types/CommandlineJava;)I

    move-result v0

    return v0
.end method

.method protected executeJava(Lorg/apache/tools/ant/types/CommandlineJava;)I
    .locals 6
    .param p1, "commandLine"    # Lorg/apache/tools/ant/types/CommandlineJava;

    .prologue
    const/4 v3, 0x0

    const/4 v4, -0x1

    .line 212
    :try_start_0
    iget-boolean v5, p0, Lorg/apache/tools/ant/taskdefs/Java;->fork:Z

    if-eqz v5, :cond_2

    .line 213
    iget-boolean v5, p0, Lorg/apache/tools/ant/taskdefs/Java;->spawn:Z

    if-nez v5, :cond_0

    .line 214
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/CommandlineJava;->getCommandline()[Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lorg/apache/tools/ant/taskdefs/Java;->fork([Ljava/lang/String;)I

    move-result v3

    .line 248
    :goto_0
    return v3

    .line 216
    :cond_0
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/CommandlineJava;->getCommandline()[Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v5}, Lorg/apache/tools/ant/taskdefs/Java;->spawn([Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/apache/tools/ant/BuildException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/ThreadDeath; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_3

    goto :goto_0

    .line 227
    :catch_0
    move-exception v0

    .line 228
    .local v0, "e":Lorg/apache/tools/ant/BuildException;
    invoke-virtual {v0}, Lorg/apache/tools/ant/BuildException;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v3

    if-nez v3, :cond_1

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Java;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 229
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Java;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v3

    invoke-virtual {v0, v3}, Lorg/apache/tools/ant/BuildException;->setLocation(Lorg/apache/tools/ant/Location;)V

    .line 231
    :cond_1
    iget-boolean v3, p0, Lorg/apache/tools/ant/taskdefs/Java;->failOnError:Z

    if-eqz v3, :cond_3

    .line 232
    throw v0

    .line 221
    .end local v0    # "e":Lorg/apache/tools/ant/BuildException;
    :cond_2
    :try_start_1
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/taskdefs/Java;->run(Lorg/apache/tools/ant/types/CommandlineJava;)V
    :try_end_1
    .catch Lorg/apache/tools/ant/ExitException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Lorg/apache/tools/ant/BuildException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/ThreadDeath; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_3

    goto :goto_0

    .line 223
    :catch_1
    move-exception v1

    .line 224
    .local v1, "ex":Lorg/apache/tools/ant/ExitException;
    :try_start_2
    invoke-virtual {v1}, Lorg/apache/tools/ant/ExitException;->getStatus()I
    :try_end_2
    .catch Lorg/apache/tools/ant/BuildException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/lang/ThreadDeath; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_3

    move-result v3

    goto :goto_0

    .line 234
    .end local v1    # "ex":Lorg/apache/tools/ant/ExitException;
    .restart local v0    # "e":Lorg/apache/tools/ant/BuildException;
    :cond_3
    const-string/jumbo v3, "Timeout: killed the sub-process"

    invoke-virtual {v0}, Lorg/apache/tools/ant/BuildException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 235
    const-string/jumbo v3, "Timeout: killed the sub-process"

    invoke-virtual {p0, v3}, Lorg/apache/tools/ant/taskdefs/Java;->log(Ljava/lang/String;)V

    :goto_1
    move v3, v4

    .line 239
    goto :goto_0

    .line 237
    :cond_4
    invoke-direct {p0, v0}, Lorg/apache/tools/ant/taskdefs/Java;->log(Ljava/lang/Throwable;)V

    goto :goto_1

    .line 241
    .end local v0    # "e":Lorg/apache/tools/ant/BuildException;
    :catch_2
    move-exception v2

    .line 242
    .local v2, "t":Ljava/lang/ThreadDeath;
    throw v2

    .line 243
    .end local v2    # "t":Ljava/lang/ThreadDeath;
    :catch_3
    move-exception v2

    .line 244
    .local v2, "t":Ljava/lang/Throwable;
    iget-boolean v3, p0, Lorg/apache/tools/ant/taskdefs/Java;->failOnError:Z

    if-eqz v3, :cond_5

    .line 245
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Java;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v4

    invoke-direct {v3, v2, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v3

    .line 247
    :cond_5
    invoke-direct {p0, v2}, Lorg/apache/tools/ant/taskdefs/Java;->log(Ljava/lang/Throwable;)V

    move v3, v4

    .line 248
    goto :goto_0
.end method

.method public getCommandLine()Lorg/apache/tools/ant/types/CommandlineJava;
    .locals 1

    .prologue
    .line 952
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Java;->cmdl:Lorg/apache/tools/ant/types/CommandlineJava;

    return-object v0
.end method

.method public getSysProperties()Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;
    .locals 1

    .prologue
    .line 962
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Java;->getCommandLine()Lorg/apache/tools/ant/types/CommandlineJava;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/CommandlineJava;->getSystemProperties()Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;

    move-result-object v0

    return-object v0
.end method

.method protected handleErrorFlush(Ljava/lang/String;)V
    .locals 1
    .param p1, "output"    # Ljava/lang/String;

    .prologue
    .line 732
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Java;->redirector:Lorg/apache/tools/ant/taskdefs/Redirector;

    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/Redirector;->getErrorStream()Ljava/io/OutputStream;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 733
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Java;->redirector:Lorg/apache/tools/ant/taskdefs/Redirector;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/taskdefs/Redirector;->handleErrorFlush(Ljava/lang/String;)V

    .line 737
    :goto_0
    return-void

    .line 735
    :cond_0
    invoke-super {p0, p1}, Lorg/apache/tools/ant/Task;->handleErrorFlush(Ljava/lang/String;)V

    goto :goto_0
.end method

.method protected handleErrorOutput(Ljava/lang/String;)V
    .locals 1
    .param p1, "output"    # Ljava/lang/String;

    .prologue
    .line 717
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Java;->redirector:Lorg/apache/tools/ant/taskdefs/Redirector;

    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/Redirector;->getErrorStream()Ljava/io/OutputStream;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 718
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Java;->redirector:Lorg/apache/tools/ant/taskdefs/Redirector;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/taskdefs/Redirector;->handleErrorOutput(Ljava/lang/String;)V

    .line 722
    :goto_0
    return-void

    .line 720
    :cond_0
    invoke-super {p0, p1}, Lorg/apache/tools/ant/Task;->handleErrorOutput(Ljava/lang/String;)V

    goto :goto_0
.end method

.method protected handleFlush(Ljava/lang/String;)V
    .locals 1
    .param p1, "output"    # Ljava/lang/String;

    .prologue
    .line 702
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Java;->redirector:Lorg/apache/tools/ant/taskdefs/Redirector;

    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/Redirector;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 703
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Java;->redirector:Lorg/apache/tools/ant/taskdefs/Redirector;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/taskdefs/Redirector;->handleFlush(Ljava/lang/String;)V

    .line 707
    :goto_0
    return-void

    .line 705
    :cond_0
    invoke-super {p0, p1}, Lorg/apache/tools/ant/Task;->handleFlush(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public handleInput([BII)I
    .locals 1
    .param p1, "buffer"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 691
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Java;->redirector:Lorg/apache/tools/ant/taskdefs/Redirector;

    invoke-virtual {v0, p1, p2, p3}, Lorg/apache/tools/ant/taskdefs/Redirector;->handleInput([BII)I

    move-result v0

    return v0
.end method

.method protected handleOutput(Ljava/lang/String;)V
    .locals 1
    .param p1, "output"    # Ljava/lang/String;

    .prologue
    .line 669
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Java;->redirector:Lorg/apache/tools/ant/taskdefs/Redirector;

    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/Redirector;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 670
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Java;->redirector:Lorg/apache/tools/ant/taskdefs/Redirector;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/taskdefs/Redirector;->handleOutput(Ljava/lang/String;)V

    .line 674
    :goto_0
    return-void

    .line 672
    :cond_0
    invoke-super {p0, p1}, Lorg/apache/tools/ant/Task;->handleOutput(Ljava/lang/String;)V

    goto :goto_0
.end method

.method protected maybeSetResultPropertyValue(I)V
    .locals 3
    .param p1, "result"    # I

    .prologue
    .line 396
    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    .line 397
    .local v0, "res":Ljava/lang/String;
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Java;->resultProperty:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 398
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Java;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Java;->resultProperty:Ljava/lang/String;

    invoke-virtual {v1, v2, v0}, Lorg/apache/tools/ant/Project;->setNewProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 400
    :cond_0
    return-void
.end method

.method protected run(Ljava/lang/String;Ljava/util/Vector;)V
    .locals 5
    .param p1, "classname"    # Ljava/lang/String;
    .param p2, "args"    # Ljava/util/Vector;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 900
    new-instance v0, Lorg/apache/tools/ant/types/CommandlineJava;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/CommandlineJava;-><init>()V

    .line 901
    .local v0, "cmdj":Lorg/apache/tools/ant/types/CommandlineJava;
    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/CommandlineJava;->setClassname(Ljava/lang/String;)V

    .line 902
    invoke-virtual {p2}, Ljava/util/Vector;->size()I

    move-result v2

    .line 903
    .local v2, "size":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v2, :cond_0

    .line 904
    invoke-virtual {v0}, Lorg/apache/tools/ant/types/CommandlineJava;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v4

    invoke-virtual {p2, v1}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v4, v3}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 903
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 906
    :cond_0
    invoke-direct {p0, v0}, Lorg/apache/tools/ant/taskdefs/Java;->run(Lorg/apache/tools/ant/types/CommandlineJava;)V

    .line 907
    return-void
.end method

.method public setAppend(Z)V
    .locals 1
    .param p1, "append"    # Z

    .prologue
    .line 621
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Java;->redirector:Lorg/apache/tools/ant/taskdefs/Redirector;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/taskdefs/Redirector;->setAppend(Z)V

    .line 622
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Java;->incompatibleWithSpawn:Z

    .line 623
    return-void
.end method

.method public setArgs(Ljava/lang/String;)V
    .locals 2
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 349
    const-string/jumbo v0, "The args attribute is deprecated. Please use nested arg elements."

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lorg/apache/tools/ant/taskdefs/Java;->log(Ljava/lang/String;I)V

    .line 351
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Java;->getCommandLine()Lorg/apache/tools/ant/types/CommandlineJava;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/CommandlineJava;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setLine(Ljava/lang/String;)V

    .line 352
    return-void
.end method

.method public setClassname(Ljava/lang/String;)V
    .locals 2
    .param p1, "s"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 333
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Java;->getCommandLine()Lorg/apache/tools/ant/types/CommandlineJava;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/CommandlineJava;->getJar()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 334
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Cannot use \'jar\' and \'classname\' attributes in same command"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 337
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Java;->getCommandLine()Lorg/apache/tools/ant/types/CommandlineJava;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/CommandlineJava;->setClassname(Ljava/lang/String;)V

    .line 338
    return-void
.end method

.method public setClasspath(Lorg/apache/tools/ant/types/Path;)V
    .locals 1
    .param p1, "s"    # Lorg/apache/tools/ant/types/Path;

    .prologue
    .line 269
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Java;->createClasspath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Path;->append(Lorg/apache/tools/ant/types/Path;)V

    .line 270
    return-void
.end method

.method public setClasspathRef(Lorg/apache/tools/ant/types/Reference;)V
    .locals 1
    .param p1, "r"    # Lorg/apache/tools/ant/types/Reference;

    .prologue
    .line 307
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Java;->createClasspath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Path;->setRefid(Lorg/apache/tools/ant/types/Reference;)V

    .line 308
    return-void
.end method

.method public setCloneVm(Z)V
    .locals 1
    .param p1, "cloneVm"    # Z

    .prologue
    .line 364
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Java;->getCommandLine()Lorg/apache/tools/ant/types/CommandlineJava;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/CommandlineJava;->setCloneVm(Z)V

    .line 365
    return-void
.end method

.method public setDir(Ljava/io/File;)V
    .locals 0
    .param p1, "d"    # Ljava/io/File;

    .prologue
    .line 479
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Java;->dir:Ljava/io/File;

    .line 480
    return-void
.end method

.method public setError(Ljava/io/File;)V
    .locals 1
    .param p1, "error"    # Ljava/io/File;

    .prologue
    .line 541
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Java;->error:Ljava/io/File;

    .line 542
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Java;->incompatibleWithSpawn:Z

    .line 543
    return-void
.end method

.method public setErrorProperty(Ljava/lang/String;)V
    .locals 1
    .param p1, "errorProperty"    # Ljava/lang/String;

    .prologue
    .line 566
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Java;->redirector:Lorg/apache/tools/ant/taskdefs/Redirector;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/taskdefs/Redirector;->setErrorProperty(Ljava/lang/String;)V

    .line 567
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Java;->incompatibleWithSpawn:Z

    .line 568
    return-void
.end method

.method public setFailonerror(Z)V
    .locals 1
    .param p1, "fail"    # Z

    .prologue
    .line 468
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Java;->failOnError:Z

    .line 469
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Java;->incompatibleWithSpawn:Z

    or-int/2addr v0, p1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Java;->incompatibleWithSpawn:Z

    .line 470
    return-void
.end method

.method public setFork(Z)V
    .locals 0
    .param p1, "s"    # Z

    .prologue
    .line 408
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Java;->fork:Z

    .line 409
    return-void
.end method

.method public setInput(Ljava/io/File;)V
    .locals 2
    .param p1, "input"    # Ljava/io/File;

    .prologue
    .line 498
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Java;->inputString:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 499
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "The \"input\" and \"inputstring\" attributes cannot both be specified"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 502
    :cond_0
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Java;->input:Ljava/io/File;

    .line 503
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Java;->incompatibleWithSpawn:Z

    .line 504
    return-void
.end method

.method public setInputString(Ljava/lang/String;)V
    .locals 2
    .param p1, "inputString"    # Ljava/lang/String;

    .prologue
    .line 512
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Java;->input:Ljava/io/File;

    if-eqz v0, :cond_0

    .line 513
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "The \"input\" and \"inputstring\" attributes cannot both be specified"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 516
    :cond_0
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Java;->inputString:Ljava/lang/String;

    .line 517
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Java;->incompatibleWithSpawn:Z

    .line 518
    return-void
.end method

.method public setJVMVersion(Ljava/lang/String;)V
    .locals 1
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 584
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Java;->getCommandLine()Lorg/apache/tools/ant/types/CommandlineJava;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/CommandlineJava;->setVmversion(Ljava/lang/String;)V

    .line 585
    return-void
.end method

.method public setJar(Ljava/io/File;)V
    .locals 2
    .param p1, "jarfile"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 318
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Java;->getCommandLine()Lorg/apache/tools/ant/types/CommandlineJava;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/CommandlineJava;->getClassname()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 319
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Cannot use \'jar\' and \'classname\' attributes in same command."

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 322
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Java;->getCommandLine()Lorg/apache/tools/ant/types/CommandlineJava;

    move-result-object v0

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/CommandlineJava;->setJar(Ljava/lang/String;)V

    .line 323
    return-void
.end method

.method public setJvm(Ljava/lang/String;)V
    .locals 1
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 437
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Java;->getCommandLine()Lorg/apache/tools/ant/types/CommandlineJava;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/CommandlineJava;->setVm(Ljava/lang/String;)V

    .line 438
    return-void
.end method

.method public setJvmargs(Ljava/lang/String;)V
    .locals 2
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 417
    const-string/jumbo v0, "The jvmargs attribute is deprecated. Please use nested jvmarg elements."

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lorg/apache/tools/ant/taskdefs/Java;->log(Ljava/lang/String;I)V

    .line 419
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Java;->getCommandLine()Lorg/apache/tools/ant/types/CommandlineJava;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/CommandlineJava;->createVmArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setLine(Ljava/lang/String;)V

    .line 420
    return-void
.end method

.method public setLogError(Z)V
    .locals 1
    .param p1, "logError"    # Z

    .prologue
    .line 529
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Java;->redirector:Lorg/apache/tools/ant/taskdefs/Redirector;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/taskdefs/Redirector;->setLogError(Z)V

    .line 530
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Java;->incompatibleWithSpawn:Z

    or-int/2addr v0, p1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Java;->incompatibleWithSpawn:Z

    .line 531
    return-void
.end method

.method public setMaxmemory(Ljava/lang/String;)V
    .locals 1
    .param p1, "max"    # Ljava/lang/String;

    .prologue
    .line 576
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Java;->getCommandLine()Lorg/apache/tools/ant/types/CommandlineJava;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/CommandlineJava;->setMaxmemory(Ljava/lang/String;)V

    .line 577
    return-void
.end method

.method public setNewenvironment(Z)V
    .locals 0
    .param p1, "newenv"    # Z

    .prologue
    .line 610
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Java;->newEnvironment:Z

    .line 611
    return-void
.end method

.method public setOutput(Ljava/io/File;)V
    .locals 1
    .param p1, "out"    # Ljava/io/File;

    .prologue
    .line 488
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Java;->output:Ljava/io/File;

    .line 489
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Java;->incompatibleWithSpawn:Z

    .line 490
    return-void
.end method

.method public setOutputproperty(Ljava/lang/String;)V
    .locals 1
    .param p1, "outputProp"    # Ljava/lang/String;

    .prologue
    .line 553
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Java;->redirector:Lorg/apache/tools/ant/taskdefs/Redirector;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/taskdefs/Redirector;->setOutputProperty(Ljava/lang/String;)V

    .line 554
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Java;->incompatibleWithSpawn:Z

    .line 555
    return-void
.end method

.method public setResultProperty(Ljava/lang/String;)V
    .locals 1
    .param p1, "resultProperty"    # Ljava/lang/String;

    .prologue
    .line 385
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Java;->resultProperty:Ljava/lang/String;

    .line 386
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Java;->incompatibleWithSpawn:Z

    .line 387
    return-void
.end method

.method public setSpawn(Z)V
    .locals 0
    .param p1, "spawn"    # Z

    .prologue
    .line 260
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Java;->spawn:Z

    .line 261
    return-void
.end method

.method public setTimeout(Ljava/lang/Long;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/Long;

    .prologue
    .line 633
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Java;->timeout:Ljava/lang/Long;

    .line 634
    iget-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/Java;->incompatibleWithSpawn:Z

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Java;->timeout:Ljava/lang/Long;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    or-int/2addr v0, v1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Java;->incompatibleWithSpawn:Z

    .line 635
    return-void

    .line 634
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected setupRedirector()V
    .locals 3

    .prologue
    .line 743
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Java;->redirector:Lorg/apache/tools/ant/taskdefs/Redirector;

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Java;->input:Ljava/io/File;

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/taskdefs/Redirector;->setInput(Ljava/io/File;)V

    .line 744
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Java;->redirector:Lorg/apache/tools/ant/taskdefs/Redirector;

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Java;->inputString:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/taskdefs/Redirector;->setInputString(Ljava/lang/String;)V

    .line 745
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Java;->redirector:Lorg/apache/tools/ant/taskdefs/Redirector;

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Java;->output:Ljava/io/File;

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/taskdefs/Redirector;->setOutput(Ljava/io/File;)V

    .line 746
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Java;->redirector:Lorg/apache/tools/ant/taskdefs/Redirector;

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Java;->error:Ljava/io/File;

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/taskdefs/Redirector;->setError(Ljava/io/File;)V

    .line 747
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Java;->redirectorElement:Lorg/apache/tools/ant/types/RedirectorElement;

    if-eqz v0, :cond_0

    .line 748
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Java;->redirectorElement:Lorg/apache/tools/ant/types/RedirectorElement;

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Java;->redirector:Lorg/apache/tools/ant/taskdefs/Redirector;

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/RedirectorElement;->configure(Lorg/apache/tools/ant/taskdefs/Redirector;)V

    .line 750
    :cond_0
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Java;->spawn:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Java;->input:Ljava/io/File;

    if-nez v0, :cond_1

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Java;->inputString:Ljava/lang/String;

    if-nez v0, :cond_1

    .line 752
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Java;->redirector:Lorg/apache/tools/ant/taskdefs/Redirector;

    new-instance v1, Lorg/apache/tools/ant/util/KeepAliveInputStream;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Java;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v2

    invoke-virtual {v2}, Lorg/apache/tools/ant/Project;->getDefaultInputStream()Ljava/io/InputStream;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/util/KeepAliveInputStream;-><init>(Ljava/io/InputStream;)V

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/taskdefs/Redirector;->setInputStream(Ljava/io/InputStream;)V

    .line 755
    :cond_1
    return-void
.end method
