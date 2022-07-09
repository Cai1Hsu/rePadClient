.class public Lorg/apache/tools/ant/taskdefs/optional/j2ee/GenericHotDeploymentTool;
.super Lorg/apache/tools/ant/taskdefs/optional/j2ee/AbstractHotDeploymentTool;
.source "GenericHotDeploymentTool.java"


# static fields
.field private static final VALID_ACTIONS:[Ljava/lang/String;


# instance fields
.field private className:Ljava/lang/String;

.field private java:Lorg/apache/tools/ant/taskdefs/Java;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 42
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string/jumbo v2, "deploy"

    aput-object v2, v0, v1

    sput-object v0, Lorg/apache/tools/ant/taskdefs/optional/j2ee/GenericHotDeploymentTool;->VALID_ACTIONS:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 34
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/j2ee/AbstractHotDeploymentTool;-><init>()V

    return-void
.end method


# virtual methods
.method public createArg()Lorg/apache/tools/ant/types/Commandline$Argument;
    .locals 1

    .prologue
    .line 51
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/j2ee/GenericHotDeploymentTool;->java:Lorg/apache/tools/ant/taskdefs/Java;

    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/Java;->createArg()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    return-object v0
.end method

.method public createJvmarg()Lorg/apache/tools/ant/types/Commandline$Argument;
    .locals 1

    .prologue
    .line 63
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/j2ee/GenericHotDeploymentTool;->java:Lorg/apache/tools/ant/taskdefs/Java;

    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/Java;->createJvmarg()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    return-object v0
.end method

.method public deploy()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x1

    .line 94
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/j2ee/GenericHotDeploymentTool;->java:Lorg/apache/tools/ant/taskdefs/Java;

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/j2ee/GenericHotDeploymentTool;->className:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/taskdefs/Java;->setClassname(Ljava/lang/String;)V

    .line 95
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/j2ee/GenericHotDeploymentTool;->java:Lorg/apache/tools/ant/taskdefs/Java;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/j2ee/GenericHotDeploymentTool;->getClasspath()Lorg/apache/tools/ant/types/Path;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/taskdefs/Java;->setClasspath(Lorg/apache/tools/ant/types/Path;)V

    .line 96
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/j2ee/GenericHotDeploymentTool;->java:Lorg/apache/tools/ant/taskdefs/Java;

    invoke-virtual {v0, v2}, Lorg/apache/tools/ant/taskdefs/Java;->setFork(Z)V

    .line 97
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/j2ee/GenericHotDeploymentTool;->java:Lorg/apache/tools/ant/taskdefs/Java;

    invoke-virtual {v0, v2}, Lorg/apache/tools/ant/taskdefs/Java;->setFailonerror(Z)V

    .line 98
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/j2ee/GenericHotDeploymentTool;->java:Lorg/apache/tools/ant/taskdefs/Java;

    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/Java;->execute()V

    .line 99
    return-void
.end method

.method public getClassName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 138
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/j2ee/GenericHotDeploymentTool;->className:Ljava/lang/String;

    return-object v0
.end method

.method public getJava()Lorg/apache/tools/ant/taskdefs/Java;
    .locals 1

    .prologue
    .line 130
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/j2ee/GenericHotDeploymentTool;->java:Lorg/apache/tools/ant/taskdefs/Java;

    return-object v0
.end method

.method protected isActionValid()Z
    .locals 3

    .prologue
    .line 74
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/j2ee/GenericHotDeploymentTool;->getTask()Lorg/apache/tools/ant/taskdefs/optional/j2ee/ServerDeploy;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/optional/j2ee/ServerDeploy;->getAction()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lorg/apache/tools/ant/taskdefs/optional/j2ee/GenericHotDeploymentTool;->VALID_ACTIONS:[Ljava/lang/String;

    const/4 v2, 0x0

    aget-object v1, v1, v2

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public setClassName(Ljava/lang/String;)V
    .locals 0
    .param p1, "className"    # Ljava/lang/String;

    .prologue
    .line 122
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/j2ee/GenericHotDeploymentTool;->className:Ljava/lang/String;

    .line 123
    return-void
.end method

.method public setTask(Lorg/apache/tools/ant/taskdefs/optional/j2ee/ServerDeploy;)V
    .locals 1
    .param p1, "task"    # Lorg/apache/tools/ant/taskdefs/optional/j2ee/ServerDeploy;

    .prologue
    .line 83
    invoke-super {p0, p1}, Lorg/apache/tools/ant/taskdefs/optional/j2ee/AbstractHotDeploymentTool;->setTask(Lorg/apache/tools/ant/taskdefs/optional/j2ee/ServerDeploy;)V

    .line 84
    new-instance v0, Lorg/apache/tools/ant/taskdefs/Java;

    invoke-direct {v0, p1}, Lorg/apache/tools/ant/taskdefs/Java;-><init>(Lorg/apache/tools/ant/Task;)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/j2ee/GenericHotDeploymentTool;->java:Lorg/apache/tools/ant/taskdefs/Java;

    .line 85
    return-void
.end method

.method public validateAttributes()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 107
    invoke-super {p0}, Lorg/apache/tools/ant/taskdefs/optional/j2ee/AbstractHotDeploymentTool;->validateAttributes()V

    .line 109
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/j2ee/GenericHotDeploymentTool;->className:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 110
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "The classname attribute must be set"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 112
    :cond_0
    return-void
.end method
