.class public Lorg/apache/tools/ant/taskdefs/optional/j2ee/WebLogicHotDeploymentTool;
.super Lorg/apache/tools/ant/taskdefs/optional/j2ee/AbstractHotDeploymentTool;
.source "WebLogicHotDeploymentTool.java"

# interfaces
.implements Lorg/apache/tools/ant/taskdefs/optional/j2ee/HotDeploymentTool;


# static fields
.field private static final STRING_BUFFER_SIZE:I = 0x400

.field private static final VALID_ACTIONS:[Ljava/lang/String;

.field private static final WEBLOGIC_DEPLOY_CLASS_NAME:Ljava/lang/String; = "weblogic.deploy"


# instance fields
.field private application:Ljava/lang/String;

.field private component:Ljava/lang/String;

.field private debug:Z


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 44
    const/4 v0, 0x5

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string/jumbo v2, "delete"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string/jumbo v2, "deploy"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string/jumbo v2, "list"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string/jumbo v2, "undeploy"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string/jumbo v2, "update"

    aput-object v2, v0, v1

    sput-object v0, Lorg/apache/tools/ant/taskdefs/optional/j2ee/WebLogicHotDeploymentTool;->VALID_ACTIONS:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 37
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/j2ee/AbstractHotDeploymentTool;-><init>()V

    return-void
.end method


# virtual methods
.method protected buildArgsPrefix()Ljava/lang/StringBuffer;
    .locals 4

    .prologue
    .line 162
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/j2ee/WebLogicHotDeploymentTool;->getTask()Lorg/apache/tools/ant/taskdefs/optional/j2ee/ServerDeploy;

    move-result-object v0

    .line 165
    .local v0, "task":Lorg/apache/tools/ant/taskdefs/optional/j2ee/ServerDeploy;
    new-instance v2, Ljava/lang/StringBuffer;

    const/16 v1, 0x400

    invoke-direct {v2, v1}, Ljava/lang/StringBuffer;-><init>(I)V

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/j2ee/WebLogicHotDeploymentTool;->getServer()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "-url "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/j2ee/WebLogicHotDeploymentTool;->getServer()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    :goto_0
    invoke-virtual {v2, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/optional/j2ee/WebLogicHotDeploymentTool;->debug:Z

    if-eqz v1, :cond_1

    const-string/jumbo v1, "-debug "

    :goto_1
    invoke-virtual {v2, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/j2ee/WebLogicHotDeploymentTool;->getUserName()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_2

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "-username "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/j2ee/WebLogicHotDeploymentTool;->getUserName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    :goto_2
    invoke-virtual {v2, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/optional/j2ee/ServerDeploy;->getAction()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/j2ee/WebLogicHotDeploymentTool;->getPassword()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    return-object v1

    :cond_0
    const-string/jumbo v1, ""

    goto :goto_0

    :cond_1
    const-string/jumbo v1, ""

    goto :goto_1

    :cond_2
    const-string/jumbo v1, ""

    goto :goto_2
.end method

.method protected buildDeployArgs()Ljava/lang/String;
    .locals 3

    .prologue
    .line 185
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/j2ee/WebLogicHotDeploymentTool;->buildArgsPrefix()Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/j2ee/WebLogicHotDeploymentTool;->application:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/j2ee/WebLogicHotDeploymentTool;->getTask()Lorg/apache/tools/ant/taskdefs/optional/j2ee/ServerDeploy;

    move-result-object v2

    invoke-virtual {v2}, Lorg/apache/tools/ant/taskdefs/optional/j2ee/ServerDeploy;->getSource()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 190
    .local v0, "args":Ljava/lang/String;
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/j2ee/WebLogicHotDeploymentTool;->component:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 191
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "-component "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/j2ee/WebLogicHotDeploymentTool;->component:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 194
    :cond_0
    return-object v0
.end method

.method protected buildListArgs()Ljava/lang/String;
    .locals 1

    .prologue
    .line 213
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/j2ee/WebLogicHotDeploymentTool;->buildArgsPrefix()Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected buildUndeployArgs()Ljava/lang/String;
    .locals 2

    .prologue
    .line 203
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/j2ee/WebLogicHotDeploymentTool;->buildArgsPrefix()Ljava/lang/StringBuffer;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/j2ee/WebLogicHotDeploymentTool;->application:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string/jumbo v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public deploy()V
    .locals 3

    .prologue
    const/4 v2, 0x1

    .line 63
    new-instance v0, Lorg/apache/tools/ant/taskdefs/Java;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/j2ee/WebLogicHotDeploymentTool;->getTask()Lorg/apache/tools/ant/taskdefs/optional/j2ee/ServerDeploy;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/taskdefs/Java;-><init>(Lorg/apache/tools/ant/Task;)V

    .line 64
    .local v0, "java":Lorg/apache/tools/ant/taskdefs/Java;
    invoke-virtual {v0, v2}, Lorg/apache/tools/ant/taskdefs/Java;->setFork(Z)V

    .line 65
    invoke-virtual {v0, v2}, Lorg/apache/tools/ant/taskdefs/Java;->setFailonerror(Z)V

    .line 66
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/j2ee/WebLogicHotDeploymentTool;->getClasspath()Lorg/apache/tools/ant/types/Path;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/taskdefs/Java;->setClasspath(Lorg/apache/tools/ant/types/Path;)V

    .line 68
    const-string/jumbo v1, "weblogic.deploy"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/taskdefs/Java;->setClassname(Ljava/lang/String;)V

    .line 69
    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/Java;->createArg()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v1

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/j2ee/WebLogicHotDeploymentTool;->getArguments()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/types/Commandline$Argument;->setLine(Ljava/lang/String;)V

    .line 70
    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/Java;->execute()V

    .line 71
    return-void
.end method

.method public getArguments()Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 121
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/j2ee/WebLogicHotDeploymentTool;->getTask()Lorg/apache/tools/ant/taskdefs/optional/j2ee/ServerDeploy;

    move-result-object v2

    invoke-virtual {v2}, Lorg/apache/tools/ant/taskdefs/optional/j2ee/ServerDeploy;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 122
    .local v0, "action":Ljava/lang/String;
    const/4 v1, 0x0

    .line 124
    .local v1, "args":Ljava/lang/String;
    const-string/jumbo v2, "deploy"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    const-string/jumbo v2, "update"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 125
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/j2ee/WebLogicHotDeploymentTool;->buildDeployArgs()Ljava/lang/String;

    move-result-object v1

    .line 132
    :cond_1
    :goto_0
    return-object v1

    .line 126
    :cond_2
    const-string/jumbo v2, "delete"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3

    const-string/jumbo v2, "undeploy"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 127
    :cond_3
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/j2ee/WebLogicHotDeploymentTool;->buildUndeployArgs()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 128
    :cond_4
    const-string/jumbo v2, "list"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 129
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/j2ee/WebLogicHotDeploymentTool;->buildListArgs()Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method protected isActionValid()Z
    .locals 4

    .prologue
    .line 141
    const/4 v2, 0x0

    .line 143
    .local v2, "valid":Z
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/j2ee/WebLogicHotDeploymentTool;->getTask()Lorg/apache/tools/ant/taskdefs/optional/j2ee/ServerDeploy;

    move-result-object v3

    invoke-virtual {v3}, Lorg/apache/tools/ant/taskdefs/optional/j2ee/ServerDeploy;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 145
    .local v0, "action":Ljava/lang/String;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    sget-object v3, Lorg/apache/tools/ant/taskdefs/optional/j2ee/WebLogicHotDeploymentTool;->VALID_ACTIONS:[Ljava/lang/String;

    array-length v3, v3

    if-ge v1, v3, :cond_0

    .line 146
    sget-object v3, Lorg/apache/tools/ant/taskdefs/optional/j2ee/WebLogicHotDeploymentTool;->VALID_ACTIONS:[Ljava/lang/String;

    aget-object v3, v3, v1

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 147
    const/4 v2, 0x1

    .line 152
    :cond_0
    return v2

    .line 145
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method public setApplication(Ljava/lang/String;)V
    .locals 0
    .param p1, "application"    # Ljava/lang/String;

    .prologue
    .line 232
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/j2ee/WebLogicHotDeploymentTool;->application:Ljava/lang/String;

    .line 233
    return-void
.end method

.method public setComponent(Ljava/lang/String;)V
    .locals 0
    .param p1, "component"    # Ljava/lang/String;

    .prologue
    .line 245
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/j2ee/WebLogicHotDeploymentTool;->component:Ljava/lang/String;

    .line 246
    return-void
.end method

.method public setDebug(Z)V
    .locals 0
    .param p1, "debug"    # Z

    .prologue
    .line 223
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/j2ee/WebLogicHotDeploymentTool;->debug:Z

    .line 224
    return-void
.end method

.method public validateAttributes()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 83
    invoke-super {p0}, Lorg/apache/tools/ant/taskdefs/optional/j2ee/AbstractHotDeploymentTool;->validateAttributes()V

    .line 85
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/j2ee/WebLogicHotDeploymentTool;->getTask()Lorg/apache/tools/ant/taskdefs/optional/j2ee/ServerDeploy;

    move-result-object v1

    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/optional/j2ee/ServerDeploy;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 88
    .local v0, "action":Ljava/lang/String;
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/j2ee/WebLogicHotDeploymentTool;->getPassword()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_0

    .line 89
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v2, "The password attribute must be set."

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 93
    :cond_0
    const-string/jumbo v1, "deploy"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string/jumbo v1, "update"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    :cond_1
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/j2ee/WebLogicHotDeploymentTool;->application:Ljava/lang/String;

    if-nez v1, :cond_2

    .line 95
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "The application attribute must be set if action = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 100
    :cond_2
    const-string/jumbo v1, "deploy"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    const-string/jumbo v1, "update"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    :cond_3
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/j2ee/WebLogicHotDeploymentTool;->getTask()Lorg/apache/tools/ant/taskdefs/optional/j2ee/ServerDeploy;

    move-result-object v1

    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/optional/j2ee/ServerDeploy;->getSource()Ljava/io/File;

    move-result-object v1

    if-nez v1, :cond_4

    .line 102
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "The source attribute must be set if action = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 107
    :cond_4
    const-string/jumbo v1, "delete"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_5

    const-string/jumbo v1, "undeploy"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_6

    :cond_5
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/j2ee/WebLogicHotDeploymentTool;->application:Ljava/lang/String;

    if-nez v1, :cond_6

    .line 109
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "The application attribute must be set if action = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 112
    :cond_6
    return-void
.end method
