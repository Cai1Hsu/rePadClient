.class public Lorg/apache/tools/ant/taskdefs/optional/ccm/CCMReconfigure;
.super Lorg/apache/tools/ant/taskdefs/optional/ccm/Continuus;
.source "CCMReconfigure.java"


# static fields
.field public static final FLAG_PROJECT:Ljava/lang/String; = "/project"

.field public static final FLAG_RECURSE:Ljava/lang/String; = "/recurse"

.field public static final FLAG_VERBOSE:Ljava/lang/String; = "/verbose"


# instance fields
.field private ccmProject:Ljava/lang/String;

.field private recurse:Z

.field private verbose:Z


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 38
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/ccm/Continuus;-><init>()V

    .line 32
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ccm/CCMReconfigure;->ccmProject:Ljava/lang/String;

    .line 33
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ccm/CCMReconfigure;->recurse:Z

    .line 34
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ccm/CCMReconfigure;->verbose:Z

    .line 39
    const-string/jumbo v0, "reconfigure"

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/optional/ccm/CCMReconfigure;->setCcmAction(Ljava/lang/String;)V

    .line 40
    return-void
.end method

.method private checkOptions(Lorg/apache/tools/ant/types/Commandline;)V
    .locals 2
    .param p1, "cmd"    # Lorg/apache/tools/ant/types/Commandline;

    .prologue
    .line 75
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ccm/CCMReconfigure;->isRecurse()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 76
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "/recurse"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 79
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ccm/CCMReconfigure;->isVerbose()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 80
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "/verbose"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 83
    :cond_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ccm/CCMReconfigure;->getCcmProject()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 84
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "/project"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 85
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ccm/CCMReconfigure;->getCcmProject()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 88
    :cond_2
    return-void
.end method


# virtual methods
.method public execute()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 52
    new-instance v0, Lorg/apache/tools/ant/types/Commandline;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/Commandline;-><init>()V

    .line 53
    .local v0, "commandLine":Lorg/apache/tools/ant/types/Commandline;
    const/4 v2, 0x0

    .line 57
    .local v2, "result":I
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ccm/CCMReconfigure;->getCcmCommand()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lorg/apache/tools/ant/types/Commandline;->setExecutable(Ljava/lang/String;)V

    .line 58
    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v3

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ccm/CCMReconfigure;->getCcmAction()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 60
    invoke-direct {p0, v0}, Lorg/apache/tools/ant/taskdefs/optional/ccm/CCMReconfigure;->checkOptions(Lorg/apache/tools/ant/types/Commandline;)V

    .line 62
    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/optional/ccm/CCMReconfigure;->run(Lorg/apache/tools/ant/types/Commandline;)I

    move-result v2

    .line 63
    invoke-static {v2}, Lorg/apache/tools/ant/taskdefs/Execute;->isFailure(I)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 64
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "Failed executing: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    .line 65
    .local v1, "msg":Ljava/lang/String;
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ccm/CCMReconfigure;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v4

    invoke-direct {v3, v1, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v3

    .line 67
    .end local v1    # "msg":Ljava/lang/String;
    :cond_0
    return-void
.end method

.method public getCcmProject()Ljava/lang/String;
    .locals 1

    .prologue
    .line 95
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ccm/CCMReconfigure;->ccmProject:Ljava/lang/String;

    return-object v0
.end method

.method public isRecurse()Z
    .locals 1

    .prologue
    .line 112
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ccm/CCMReconfigure;->recurse:Z

    return v0
.end method

.method public isVerbose()Z
    .locals 1

    .prologue
    .line 130
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ccm/CCMReconfigure;->verbose:Z

    return v0
.end method

.method public setCcmProject(Ljava/lang/String;)V
    .locals 0
    .param p1, "v"    # Ljava/lang/String;

    .prologue
    .line 103
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ccm/CCMReconfigure;->ccmProject:Ljava/lang/String;

    .line 104
    return-void
.end method

.method public setRecurse(Z)V
    .locals 0
    .param p1, "v"    # Z

    .prologue
    .line 121
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ccm/CCMReconfigure;->recurse:Z

    .line 122
    return-void
.end method

.method public setVerbose(Z)V
    .locals 0
    .param p1, "v"    # Z

    .prologue
    .line 138
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ccm/CCMReconfigure;->verbose:Z

    .line 139
    return-void
.end method
