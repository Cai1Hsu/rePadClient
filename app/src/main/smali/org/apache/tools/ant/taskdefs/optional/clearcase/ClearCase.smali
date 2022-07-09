.class public abstract Lorg/apache/tools/ant/taskdefs/optional/clearcase/ClearCase;
.super Lorg/apache/tools/ant/Task;
.source "ClearCase.java"


# static fields
.field private static final CLEARTOOL_EXE:Ljava/lang/String; = "cleartool"

.field public static final COMMAND_CHECKIN:Ljava/lang/String; = "checkin"

.field public static final COMMAND_CHECKOUT:Ljava/lang/String; = "checkout"

.field public static final COMMAND_LOCK:Ljava/lang/String; = "lock"

.field public static final COMMAND_LSCO:Ljava/lang/String; = "lsco"

.field public static final COMMAND_MKATTR:Ljava/lang/String; = "mkattr"

.field public static final COMMAND_MKBL:Ljava/lang/String; = "mkbl"

.field public static final COMMAND_MKDIR:Ljava/lang/String; = "mkdir"

.field public static final COMMAND_MKELEM:Ljava/lang/String; = "mkelem"

.field public static final COMMAND_MKLABEL:Ljava/lang/String; = "mklabel"

.field public static final COMMAND_MKLBTYPE:Ljava/lang/String; = "mklbtype"

.field public static final COMMAND_RMTYPE:Ljava/lang/String; = "rmtype"

.field public static final COMMAND_UNCHECKOUT:Ljava/lang/String; = "uncheckout"

.field public static final COMMAND_UNLOCK:Ljava/lang/String; = "unlock"

.field public static final COMMAND_UPDATE:Ljava/lang/String; = "update"

.field private static pcnt:I


# instance fields
.field private mClearToolDir:Ljava/lang/String;

.field private mFailonerr:Z

.field private mobjSelect:Ljava/lang/String;

.field private mviewPath:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 51
    const/4 v0, 0x0

    sput v0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/ClearCase;->pcnt:I

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 47
    invoke-direct {p0}, Lorg/apache/tools/ant/Task;-><init>()V

    .line 48
    const-string/jumbo v0, ""

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/ClearCase;->mClearToolDir:Ljava/lang/String;

    .line 49
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/ClearCase;->mviewPath:Ljava/lang/String;

    .line 50
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/ClearCase;->mobjSelect:Ljava/lang/String;

    .line 52
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/ClearCase;->mFailonerr:Z

    return-void
.end method


# virtual methods
.method protected final getClearToolCommand()Ljava/lang/String;
    .locals 3

    .prologue
    .line 68
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/ClearCase;->mClearToolDir:Ljava/lang/String;

    .line 69
    .local v0, "toReturn":Ljava/lang/String;
    const-string/jumbo v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string/jumbo v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 70
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 73
    :cond_0
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, "cleartool"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 75
    return-object v0
.end method

.method public getFailOnErr()Z
    .locals 1

    .prologue
    .line 176
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/ClearCase;->mFailonerr:Z

    return v0
.end method

.method public getObjSelect()Ljava/lang/String;
    .locals 1

    .prologue
    .line 120
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/ClearCase;->mobjSelect:Ljava/lang/String;

    return-object v0
.end method

.method public getViewPath()Ljava/lang/String;
    .locals 1

    .prologue
    .line 93
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/ClearCase;->mviewPath:Ljava/lang/String;

    return-object v0
.end method

.method public getViewPathBasename()Ljava/lang/String;
    .locals 2

    .prologue
    .line 102
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/ClearCase;->mviewPath:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected run(Lorg/apache/tools/ant/types/Commandline;)I
    .locals 6
    .param p1, "cmd"    # Lorg/apache/tools/ant/types/Commandline;

    .prologue
    .line 130
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/ClearCase;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    .line 131
    .local v0, "aProj":Lorg/apache/tools/ant/Project;
    new-instance v2, Lorg/apache/tools/ant/taskdefs/Execute;

    new-instance v3, Lorg/apache/tools/ant/taskdefs/LogStreamHandler;

    const/4 v4, 0x2

    const/4 v5, 0x1

    invoke-direct {v3, p0, v4, v5}, Lorg/apache/tools/ant/taskdefs/LogStreamHandler;-><init>(Lorg/apache/tools/ant/Task;II)V

    invoke-direct {v2, v3}, Lorg/apache/tools/ant/taskdefs/Execute;-><init>(Lorg/apache/tools/ant/taskdefs/ExecuteStreamHandler;)V

    .line 133
    .local v2, "exe":Lorg/apache/tools/ant/taskdefs/Execute;
    invoke-virtual {v2, v0}, Lorg/apache/tools/ant/taskdefs/Execute;->setAntRun(Lorg/apache/tools/ant/Project;)V

    .line 134
    invoke-virtual {v0}, Lorg/apache/tools/ant/Project;->getBaseDir()Ljava/io/File;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/taskdefs/Execute;->setWorkingDirectory(Ljava/io/File;)V

    .line 135
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->getCommandline()[Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/taskdefs/Execute;->setCommandline([Ljava/lang/String;)V

    .line 136
    invoke-virtual {v2}, Lorg/apache/tools/ant/taskdefs/Execute;->execute()I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v3

    return v3

    .line 137
    .end local v0    # "aProj":Lorg/apache/tools/ant/Project;
    .end local v2    # "exe":Lorg/apache/tools/ant/taskdefs/Execute;
    :catch_0
    move-exception v1

    .line 138
    .local v1, "e":Ljava/io/IOException;
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/ClearCase;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v4

    invoke-direct {v3, v1, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v3
.end method

.method protected runS(Lorg/apache/tools/ant/types/Commandline;)Ljava/lang/String;
    .locals 6
    .param p1, "cmdline"    # Lorg/apache/tools/ant/types/Commandline;

    .prologue
    .line 148
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "opts.cc.runS.output"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    sget v4, Lorg/apache/tools/ant/taskdefs/optional/clearcase/ClearCase;->pcnt:I

    add-int/lit8 v5, v4, 0x1

    sput v5, Lorg/apache/tools/ant/taskdefs/optional/clearcase/ClearCase;->pcnt:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    .line 149
    .local v2, "outV":Ljava/lang/String;
    new-instance v1, Lorg/apache/tools/ant/taskdefs/ExecTask;

    invoke-direct {v1, p0}, Lorg/apache/tools/ant/taskdefs/ExecTask;-><init>(Lorg/apache/tools/ant/Task;)V

    .line 150
    .local v1, "exe":Lorg/apache/tools/ant/taskdefs/ExecTask;
    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/ExecTask;->createArg()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    .line 152
    .local v0, "arg":Lorg/apache/tools/ant/types/Commandline$Argument;
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->getExecutable()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Lorg/apache/tools/ant/taskdefs/ExecTask;->setExecutable(Ljava/lang/String;)V

    .line 153
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->getArguments()[Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lorg/apache/tools/ant/types/Commandline;->toString([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lorg/apache/tools/ant/types/Commandline$Argument;->setLine(Ljava/lang/String;)V

    .line 154
    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/taskdefs/ExecTask;->setOutputproperty(Ljava/lang/String;)V

    .line 155
    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/ExecTask;->execute()V

    .line 157
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/ClearCase;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v3

    invoke-virtual {v3, v2}, Lorg/apache/tools/ant/Project;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method public final setClearToolDir(Ljava/lang/String;)V
    .locals 1
    .param p1, "dir"    # Ljava/lang/String;

    .prologue
    .line 59
    invoke-static {p1}, Lorg/apache/tools/ant/util/FileUtils;->translatePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/ClearCase;->mClearToolDir:Ljava/lang/String;

    .line 60
    return-void
.end method

.method public setFailOnErr(Z)V
    .locals 0
    .param p1, "failonerr"    # Z

    .prologue
    .line 166
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/ClearCase;->mFailonerr:Z

    .line 167
    return-void
.end method

.method public final setObjSelect(Ljava/lang/String;)V
    .locals 0
    .param p1, "objSelect"    # Ljava/lang/String;

    .prologue
    .line 111
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/ClearCase;->mobjSelect:Ljava/lang/String;

    .line 112
    return-void
.end method

.method public final setViewPath(Ljava/lang/String;)V
    .locals 0
    .param p1, "viewPath"    # Ljava/lang/String;

    .prologue
    .line 84
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/ClearCase;->mviewPath:Ljava/lang/String;

    .line 85
    return-void
.end method
