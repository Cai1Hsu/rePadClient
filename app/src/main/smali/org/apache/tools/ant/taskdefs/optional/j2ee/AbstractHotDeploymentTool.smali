.class public abstract Lorg/apache/tools/ant/taskdefs/optional/j2ee/AbstractHotDeploymentTool;
.super Ljava/lang/Object;
.source "AbstractHotDeploymentTool.java"

# interfaces
.implements Lorg/apache/tools/ant/taskdefs/optional/j2ee/HotDeploymentTool;


# instance fields
.field private classpath:Lorg/apache/tools/ant/types/Path;

.field private password:Ljava/lang/String;

.field private server:Ljava/lang/String;

.field private task:Lorg/apache/tools/ant/taskdefs/optional/j2ee/ServerDeploy;

.field private userName:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createClasspath()Lorg/apache/tools/ant/types/Path;
    .locals 2

    .prologue
    .line 66
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/j2ee/AbstractHotDeploymentTool;->classpath:Lorg/apache/tools/ant/types/Path;

    if-nez v0, :cond_0

    .line 67
    new-instance v0, Lorg/apache/tools/ant/types/Path;

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/j2ee/AbstractHotDeploymentTool;->task:Lorg/apache/tools/ant/taskdefs/optional/j2ee/ServerDeploy;

    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/optional/j2ee/ServerDeploy;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/j2ee/AbstractHotDeploymentTool;->classpath:Lorg/apache/tools/ant/types/Path;

    .line 69
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/j2ee/AbstractHotDeploymentTool;->classpath:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Path;->createPath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    return-object v0
.end method

.method public abstract deploy()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation
.end method

.method public getClasspath()Lorg/apache/tools/ant/types/Path;
    .locals 1

    .prologue
    .line 133
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/j2ee/AbstractHotDeploymentTool;->classpath:Lorg/apache/tools/ant/types/Path;

    return-object v0
.end method

.method public getPassword()Ljava/lang/String;
    .locals 1

    .prologue
    .line 167
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/j2ee/AbstractHotDeploymentTool;->password:Ljava/lang/String;

    return-object v0
.end method

.method public getServer()Ljava/lang/String;
    .locals 1

    .prologue
    .line 183
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/j2ee/AbstractHotDeploymentTool;->server:Ljava/lang/String;

    return-object v0
.end method

.method protected getTask()Lorg/apache/tools/ant/taskdefs/optional/j2ee/ServerDeploy;
    .locals 1

    .prologue
    .line 125
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/j2ee/AbstractHotDeploymentTool;->task:Lorg/apache/tools/ant/taskdefs/optional/j2ee/ServerDeploy;

    return-object v0
.end method

.method public getUserName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 151
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/j2ee/AbstractHotDeploymentTool;->userName:Ljava/lang/String;

    return-object v0
.end method

.method protected abstract isActionValid()Z
.end method

.method public setClasspath(Lorg/apache/tools/ant/types/Path;)V
    .locals 0
    .param p1, "classpath"    # Lorg/apache/tools/ant/types/Path;

    .prologue
    .line 143
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/j2ee/AbstractHotDeploymentTool;->classpath:Lorg/apache/tools/ant/types/Path;

    .line 144
    return-void
.end method

.method public setPassword(Ljava/lang/String;)V
    .locals 0
    .param p1, "password"    # Ljava/lang/String;

    .prologue
    .line 175
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/j2ee/AbstractHotDeploymentTool;->password:Ljava/lang/String;

    .line 176
    return-void
.end method

.method public setServer(Ljava/lang/String;)V
    .locals 0
    .param p1, "server"    # Ljava/lang/String;

    .prologue
    .line 191
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/j2ee/AbstractHotDeploymentTool;->server:Ljava/lang/String;

    .line 192
    return-void
.end method

.method public setTask(Lorg/apache/tools/ant/taskdefs/optional/j2ee/ServerDeploy;)V
    .locals 0
    .param p1, "task"    # Lorg/apache/tools/ant/taskdefs/optional/j2ee/ServerDeploy;

    .prologue
    .line 117
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/j2ee/AbstractHotDeploymentTool;->task:Lorg/apache/tools/ant/taskdefs/optional/j2ee/ServerDeploy;

    .line 118
    return-void
.end method

.method public setUserName(Ljava/lang/String;)V
    .locals 0
    .param p1, "userName"    # Ljava/lang/String;

    .prologue
    .line 159
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/j2ee/AbstractHotDeploymentTool;->userName:Ljava/lang/String;

    .line 160
    return-void
.end method

.method public validateAttributes()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 91
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/j2ee/AbstractHotDeploymentTool;->task:Lorg/apache/tools/ant/taskdefs/optional/j2ee/ServerDeploy;

    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/optional/j2ee/ServerDeploy;->getAction()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    .line 92
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "The \"action\" attribute must be set"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 95
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/j2ee/AbstractHotDeploymentTool;->isActionValid()Z

    move-result v0

    if-nez v0, :cond_1

    .line 96
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "Invalid action \""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/j2ee/AbstractHotDeploymentTool;->task:Lorg/apache/tools/ant/taskdefs/optional/j2ee/ServerDeploy;

    invoke-virtual {v2}, Lorg/apache/tools/ant/taskdefs/optional/j2ee/ServerDeploy;->getAction()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, "\" passed"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 99
    :cond_1
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/j2ee/AbstractHotDeploymentTool;->classpath:Lorg/apache/tools/ant/types/Path;

    if-nez v0, :cond_2

    .line 100
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "The classpath attribute must be set"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 102
    :cond_2
    return-void
.end method
