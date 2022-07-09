.class public Lorg/apache/tools/ant/taskdefs/optional/j2ee/ServerDeploy;
.super Lorg/apache/tools/ant/Task;
.source "ServerDeploy.java"


# instance fields
.field private action:Ljava/lang/String;

.field private source:Ljava/io/File;

.field private vendorTools:Ljava/util/Vector;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 38
    invoke-direct {p0}, Lorg/apache/tools/ant/Task;-><init>()V

    .line 46
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/j2ee/ServerDeploy;->vendorTools:Ljava/util/Vector;

    return-void
.end method


# virtual methods
.method public addGeneric(Lorg/apache/tools/ant/taskdefs/optional/j2ee/GenericHotDeploymentTool;)V
    .locals 1
    .param p1, "tool"    # Lorg/apache/tools/ant/taskdefs/optional/j2ee/GenericHotDeploymentTool;

    .prologue
    .line 61
    invoke-virtual {p1, p0}, Lorg/apache/tools/ant/taskdefs/optional/j2ee/GenericHotDeploymentTool;->setTask(Lorg/apache/tools/ant/taskdefs/optional/j2ee/ServerDeploy;)V

    .line 62
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/j2ee/ServerDeploy;->vendorTools:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 63
    return-void
.end method

.method public addJonas(Lorg/apache/tools/ant/taskdefs/optional/j2ee/JonasHotDeploymentTool;)V
    .locals 1
    .param p1, "tool"    # Lorg/apache/tools/ant/taskdefs/optional/j2ee/JonasHotDeploymentTool;

    .prologue
    .line 83
    invoke-virtual {p1, p0}, Lorg/apache/tools/ant/taskdefs/optional/j2ee/JonasHotDeploymentTool;->setTask(Lorg/apache/tools/ant/taskdefs/optional/j2ee/ServerDeploy;)V

    .line 84
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/j2ee/ServerDeploy;->vendorTools:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 85
    return-void
.end method

.method public addWeblogic(Lorg/apache/tools/ant/taskdefs/optional/j2ee/WebLogicHotDeploymentTool;)V
    .locals 1
    .param p1, "tool"    # Lorg/apache/tools/ant/taskdefs/optional/j2ee/WebLogicHotDeploymentTool;

    .prologue
    .line 72
    invoke-virtual {p1, p0}, Lorg/apache/tools/ant/taskdefs/optional/j2ee/WebLogicHotDeploymentTool;->setTask(Lorg/apache/tools/ant/taskdefs/optional/j2ee/ServerDeploy;)V

    .line 73
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/j2ee/ServerDeploy;->vendorTools:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 74
    return-void
.end method

.method public execute()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 103
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/j2ee/ServerDeploy;->vendorTools:Ljava/util/Vector;

    invoke-virtual {v2}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v0

    .line 104
    .local v0, "e":Ljava/util/Enumeration;
    :goto_0
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 105
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/tools/ant/taskdefs/optional/j2ee/HotDeploymentTool;

    .line 106
    .local v1, "tool":Lorg/apache/tools/ant/taskdefs/optional/j2ee/HotDeploymentTool;
    invoke-interface {v1}, Lorg/apache/tools/ant/taskdefs/optional/j2ee/HotDeploymentTool;->validateAttributes()V

    .line 107
    invoke-interface {v1}, Lorg/apache/tools/ant/taskdefs/optional/j2ee/HotDeploymentTool;->deploy()V

    goto :goto_0

    .line 109
    .end local v1    # "tool":Lorg/apache/tools/ant/taskdefs/optional/j2ee/HotDeploymentTool;
    :cond_0
    return-void
.end method

.method public getAction()Ljava/lang/String;
    .locals 1

    .prologue
    .line 122
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/j2ee/ServerDeploy;->action:Ljava/lang/String;

    return-object v0
.end method

.method public getSource()Ljava/io/File;
    .locals 1

    .prologue
    .line 140
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/j2ee/ServerDeploy;->source:Ljava/io/File;

    return-object v0
.end method

.method public setAction(Ljava/lang/String;)V
    .locals 0
    .param p1, "action"    # Ljava/lang/String;

    .prologue
    .line 131
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/j2ee/ServerDeploy;->action:Ljava/lang/String;

    .line 132
    return-void
.end method

.method public setSource(Ljava/io/File;)V
    .locals 0
    .param p1, "source"    # Ljava/io/File;

    .prologue
    .line 149
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/j2ee/ServerDeploy;->source:Ljava/io/File;

    .line 150
    return-void
.end method
