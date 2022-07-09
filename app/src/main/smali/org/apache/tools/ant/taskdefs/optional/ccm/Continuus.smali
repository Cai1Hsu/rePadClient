.class public abstract Lorg/apache/tools/ant/taskdefs/optional/ccm/Continuus;
.super Lorg/apache/tools/ant/Task;
.source "Continuus.java"


# static fields
.field private static final CCM_EXE:Ljava/lang/String; = "ccm"

.field public static final COMMAND_CHECKIN:Ljava/lang/String; = "ci"

.field public static final COMMAND_CHECKOUT:Ljava/lang/String; = "co"

.field public static final COMMAND_CREATE_TASK:Ljava/lang/String; = "create_task"

.field public static final COMMAND_DEFAULT_TASK:Ljava/lang/String; = "default_task"

.field public static final COMMAND_RECONFIGURE:Ljava/lang/String; = "reconfigure"


# instance fields
.field private ccmAction:Ljava/lang/String;

.field private ccmDir:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 41
    invoke-direct {p0}, Lorg/apache/tools/ant/Task;-><init>()V

    .line 43
    const-string/jumbo v0, ""

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ccm/Continuus;->ccmDir:Ljava/lang/String;

    .line 44
    const-string/jumbo v0, ""

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ccm/Continuus;->ccmAction:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getCcmAction()Ljava/lang/String;
    .locals 1

    .prologue
    .line 51
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ccm/Continuus;->ccmAction:Ljava/lang/String;

    return-object v0
.end method

.method protected final getCcmCommand()Ljava/lang/String;
    .locals 3

    .prologue
    .line 78
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ccm/Continuus;->ccmDir:Ljava/lang/String;

    .line 79
    .local v0, "toReturn":Ljava/lang/String;
    const-string/jumbo v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string/jumbo v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 80
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 83
    :cond_0
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, "ccm"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 85
    return-object v0
.end method

.method protected run(Lorg/apache/tools/ant/types/Commandline;)I
    .locals 3
    .param p1, "cmd"    # Lorg/apache/tools/ant/types/Commandline;

    .prologue
    .line 113
    new-instance v0, Lorg/apache/tools/ant/taskdefs/LogStreamHandler;

    const/4 v1, 0x3

    const/4 v2, 0x1

    invoke-direct {v0, p0, v1, v2}, Lorg/apache/tools/ant/taskdefs/LogStreamHandler;-><init>(Lorg/apache/tools/ant/Task;II)V

    invoke-virtual {p0, p1, v0}, Lorg/apache/tools/ant/taskdefs/optional/ccm/Continuus;->run(Lorg/apache/tools/ant/types/Commandline;Lorg/apache/tools/ant/taskdefs/ExecuteStreamHandler;)I

    move-result v0

    return v0
.end method

.method protected run(Lorg/apache/tools/ant/types/Commandline;Lorg/apache/tools/ant/taskdefs/ExecuteStreamHandler;)I
    .locals 4
    .param p1, "cmd"    # Lorg/apache/tools/ant/types/Commandline;
    .param p2, "handler"    # Lorg/apache/tools/ant/taskdefs/ExecuteStreamHandler;

    .prologue
    .line 97
    :try_start_0
    new-instance v1, Lorg/apache/tools/ant/taskdefs/Execute;

    invoke-direct {v1, p2}, Lorg/apache/tools/ant/taskdefs/Execute;-><init>(Lorg/apache/tools/ant/taskdefs/ExecuteStreamHandler;)V

    .line 98
    .local v1, "exe":Lorg/apache/tools/ant/taskdefs/Execute;
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ccm/Continuus;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/taskdefs/Execute;->setAntRun(Lorg/apache/tools/ant/Project;)V

    .line 99
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ccm/Continuus;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v2

    invoke-virtual {v2}, Lorg/apache/tools/ant/Project;->getBaseDir()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/taskdefs/Execute;->setWorkingDirectory(Ljava/io/File;)V

    .line 100
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->getCommandline()[Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/taskdefs/Execute;->setCommandline([Ljava/lang/String;)V

    .line 101
    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/Execute;->execute()I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    return v2

    .line 102
    .end local v1    # "exe":Lorg/apache/tools/ant/taskdefs/Execute;
    :catch_0
    move-exception v0

    .line 103
    .local v0, "e":Ljava/io/IOException;
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ccm/Continuus;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v3

    invoke-direct {v2, v0, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v2
.end method

.method public setCcmAction(Ljava/lang/String;)V
    .locals 0
    .param p1, "v"    # Ljava/lang/String;

    .prologue
    .line 60
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ccm/Continuus;->ccmAction:Ljava/lang/String;

    .line 61
    return-void
.end method

.method public final setCcmDir(Ljava/lang/String;)V
    .locals 1
    .param p1, "dir"    # Ljava/lang/String;

    .prologue
    .line 70
    invoke-static {p1}, Lorg/apache/tools/ant/util/FileUtils;->translatePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ccm/Continuus;->ccmDir:Ljava/lang/String;

    .line 71
    return-void
.end method
