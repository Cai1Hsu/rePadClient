.class public Lorg/apache/tools/ant/taskdefs/optional/j2ee/JonasHotDeploymentTool;
.super Lorg/apache/tools/ant/taskdefs/optional/j2ee/GenericHotDeploymentTool;
.source "JonasHotDeploymentTool.java"

# interfaces
.implements Lorg/apache/tools/ant/taskdefs/optional/j2ee/HotDeploymentTool;


# static fields
.field protected static final DEFAULT_ORB:Ljava/lang/String; = "RMI"

.field private static final JONAS_DEPLOY_CLASS_NAME:Ljava/lang/String; = "org.objectweb.jonas.adm.JonasAdmin"

.field private static final VALID_ACTIONS:[Ljava/lang/String;


# instance fields
.field private davidHost:Ljava/lang/String;

.field private davidPort:I

.field private jonasroot:Ljava/io/File;

.field private orb:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 55
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

    sput-object v0, Lorg/apache/tools/ant/taskdefs/optional/j2ee/JonasHotDeploymentTool;->VALID_ACTIONS:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 40
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/j2ee/GenericHotDeploymentTool;-><init>()V

    .line 66
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/j2ee/JonasHotDeploymentTool;->orb:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getClasspath()Lorg/apache/tools/ant/types/Path;
    .locals 8

    .prologue
    .line 134
    invoke-super {p0}, Lorg/apache/tools/ant/taskdefs/optional/j2ee/GenericHotDeploymentTool;->getClasspath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    .line 136
    .local v0, "aClassPath":Lorg/apache/tools/ant/types/Path;
    if-nez v0, :cond_0

    .line 137
    new-instance v0, Lorg/apache/tools/ant/types/Path;

    .end local v0    # "aClassPath":Lorg/apache/tools/ant/types/Path;
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/j2ee/JonasHotDeploymentTool;->getTask()Lorg/apache/tools/ant/taskdefs/optional/j2ee/ServerDeploy;

    move-result-object v4

    invoke-virtual {v4}, Lorg/apache/tools/ant/taskdefs/optional/j2ee/ServerDeploy;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v4

    invoke-direct {v0, v4}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;)V

    .line 139
    .restart local v0    # "aClassPath":Lorg/apache/tools/ant/types/Path;
    :cond_0
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/optional/j2ee/JonasHotDeploymentTool;->orb:Ljava/lang/String;

    if-eqz v4, :cond_1

    .line 140
    new-instance v4, Ljava/io/File;

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/j2ee/JonasHotDeploymentTool;->jonasroot:Ljava/io/File;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v7, "lib/"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/optional/j2ee/JonasHotDeploymentTool;->orb:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string/jumbo v7, "_jonas.jar"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v5, v6}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v4}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v3

    .line 141
    .local v3, "aOrbJar":Ljava/lang/String;
    new-instance v4, Ljava/io/File;

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/j2ee/JonasHotDeploymentTool;->jonasroot:Ljava/io/File;

    const-string/jumbo v6, "config/"

    invoke-direct {v4, v5, v6}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v4}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v1

    .line 142
    .local v1, "aConfigDir":Ljava/lang/String;
    new-instance v2, Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Path;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v5, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    sget-object v6, Ljava/io/File;->pathSeparator:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v2, v4, v5}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;Ljava/lang/String;)V

    .line 144
    .local v2, "aJOnASOrbPath":Lorg/apache/tools/ant/types/Path;
    invoke-virtual {v0, v2}, Lorg/apache/tools/ant/types/Path;->append(Lorg/apache/tools/ant/types/Path;)V

    .line 146
    .end local v1    # "aConfigDir":Ljava/lang/String;
    .end local v2    # "aJOnASOrbPath":Lorg/apache/tools/ant/types/Path;
    .end local v3    # "aOrbJar":Ljava/lang/String;
    :cond_1
    return-object v0
.end method

.method protected isActionValid()Z
    .locals 4

    .prologue
    .line 237
    const/4 v2, 0x0

    .line 239
    .local v2, "valid":Z
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/j2ee/JonasHotDeploymentTool;->getTask()Lorg/apache/tools/ant/taskdefs/optional/j2ee/ServerDeploy;

    move-result-object v3

    invoke-virtual {v3}, Lorg/apache/tools/ant/taskdefs/optional/j2ee/ServerDeploy;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 241
    .local v0, "action":Ljava/lang/String;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    sget-object v3, Lorg/apache/tools/ant/taskdefs/optional/j2ee/JonasHotDeploymentTool;->VALID_ACTIONS:[Ljava/lang/String;

    array-length v3, v3

    if-ge v1, v3, :cond_0

    .line 242
    sget-object v3, Lorg/apache/tools/ant/taskdefs/optional/j2ee/JonasHotDeploymentTool;->VALID_ACTIONS:[Ljava/lang/String;

    aget-object v3, v3, v1

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 243
    const/4 v2, 0x1

    .line 248
    :cond_0
    return v2

    .line 241
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method public setDavidhost(Ljava/lang/String;)V
    .locals 0
    .param p1, "inValue"    # Ljava/lang/String;

    .prologue
    .line 86
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/j2ee/JonasHotDeploymentTool;->davidHost:Ljava/lang/String;

    .line 87
    return-void
.end method

.method public setDavidport(I)V
    .locals 0
    .param p1, "inValue"    # I

    .prologue
    .line 97
    iput p1, p0, Lorg/apache/tools/ant/taskdefs/optional/j2ee/JonasHotDeploymentTool;->davidPort:I

    .line 98
    return-void
.end method

.method public setJonasroot(Ljava/io/File;)V
    .locals 0
    .param p1, "inValue"    # Ljava/io/File;

    .prologue
    .line 108
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/j2ee/JonasHotDeploymentTool;->jonasroot:Ljava/io/File;

    .line 109
    return-void
.end method

.method public setOrb(Ljava/lang/String;)V
    .locals 0
    .param p1, "inValue"    # Ljava/lang/String;

    .prologue
    .line 123
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/j2ee/JonasHotDeploymentTool;->orb:Ljava/lang/String;

    .line 124
    return-void
.end method

.method public validateAttributes()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 166
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/j2ee/JonasHotDeploymentTool;->getJava()Lorg/apache/tools/ant/taskdefs/Java;

    move-result-object v1

    .line 168
    .local v1, "java":Lorg/apache/tools/ant/taskdefs/Java;
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/j2ee/JonasHotDeploymentTool;->getTask()Lorg/apache/tools/ant/taskdefs/optional/j2ee/ServerDeploy;

    move-result-object v2

    invoke-virtual {v2}, Lorg/apache/tools/ant/taskdefs/optional/j2ee/ServerDeploy;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 169
    .local v0, "action":Ljava/lang/String;
    if-nez v0, :cond_0

    .line 170
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v3, "The \"action\" attribute must be set"

    invoke-direct {v2, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 173
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/j2ee/JonasHotDeploymentTool;->isActionValid()Z

    move-result v2

    if-nez v2, :cond_1

    .line 174
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "Invalid action \""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, "\" passed"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 177
    :cond_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/j2ee/JonasHotDeploymentTool;->getClassName()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_2

    .line 178
    const-string/jumbo v2, "org.objectweb.jonas.adm.JonasAdmin"

    invoke-virtual {p0, v2}, Lorg/apache/tools/ant/taskdefs/optional/j2ee/JonasHotDeploymentTool;->setClassName(Ljava/lang/String;)V

    .line 181
    :cond_2
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/j2ee/JonasHotDeploymentTool;->jonasroot:Ljava/io/File;

    if-eqz v2, :cond_3

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/j2ee/JonasHotDeploymentTool;->jonasroot:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->isDirectory()Z

    move-result v2

    if-eqz v2, :cond_5

    .line 182
    :cond_3
    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/Java;->createJvmarg()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "-Dinstall.root="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/optional/j2ee/JonasHotDeploymentTool;->jonasroot:Ljava/io/File;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 183
    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/Java;->createJvmarg()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "-Djava.security.policy="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/optional/j2ee/JonasHotDeploymentTool;->jonasroot:Ljava/io/File;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, "/config/java.policy"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 186
    const-string/jumbo v2, "DAVID"

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/j2ee/JonasHotDeploymentTool;->orb:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 187
    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/Java;->createJvmarg()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v2

    const-string/jumbo v3, "-Dorg.omg.CORBA.ORBClass=org.objectweb.david.libs.binding.orbs.iiop.IIOPORB"

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 189
    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/Java;->createJvmarg()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v2

    const-string/jumbo v3, "-Dorg.omg.CORBA.ORBSingletonClass=org.objectweb.david.libs.binding.orbs.ORBSingletonClass"

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 191
    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/Java;->createJvmarg()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v2

    const-string/jumbo v3, "-Djavax.rmi.CORBA.StubClass=org.objectweb.david.libs.stub_factories.rmi.StubDelegate"

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 193
    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/Java;->createJvmarg()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v2

    const-string/jumbo v3, "-Djavax.rmi.CORBA.PortableRemoteObjectClass=org.objectweb.david.libs.binding.rmi.ORBPortableRemoteObjectDelegate"

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 195
    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/Java;->createJvmarg()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v2

    const-string/jumbo v3, "-Djavax.rmi.CORBA.UtilClass=org.objectweb.david.libs.helpers.RMIUtilDelegate"

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 197
    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/Java;->createJvmarg()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v2

    const-string/jumbo v3, "-Ddavid.CosNaming.default_method=0"

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 198
    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/Java;->createJvmarg()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v2

    const-string/jumbo v3, "-Ddavid.rmi.ValueHandlerClass=com.sun.corba.se.internal.io.ValueHandlerImpl"

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 200
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/j2ee/JonasHotDeploymentTool;->davidHost:Ljava/lang/String;

    if-eqz v2, :cond_4

    .line 201
    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/Java;->createJvmarg()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "-Ddavid.CosNaming.default_host="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/optional/j2ee/JonasHotDeploymentTool;->davidHost:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 204
    :cond_4
    iget v2, p0, Lorg/apache/tools/ant/taskdefs/optional/j2ee/JonasHotDeploymentTool;->davidPort:I

    if-eqz v2, :cond_5

    .line 205
    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/Java;->createJvmarg()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "-Ddavid.CosNaming.default_port="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    iget v4, p0, Lorg/apache/tools/ant/taskdefs/optional/j2ee/JonasHotDeploymentTool;->davidPort:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 211
    :cond_5
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/j2ee/JonasHotDeploymentTool;->getServer()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_6

    .line 212
    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/Java;->createArg()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "-n "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/j2ee/JonasHotDeploymentTool;->getServer()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/types/Commandline$Argument;->setLine(Ljava/lang/String;)V

    .line 215
    :cond_6
    const-string/jumbo v2, "deploy"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_7

    const-string/jumbo v2, "update"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_7

    const-string/jumbo v2, "redeploy"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    .line 218
    :cond_7
    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/Java;->createArg()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "-a "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/j2ee/JonasHotDeploymentTool;->getTask()Lorg/apache/tools/ant/taskdefs/optional/j2ee/ServerDeploy;

    move-result-object v4

    invoke-virtual {v4}, Lorg/apache/tools/ant/taskdefs/optional/j2ee/ServerDeploy;->getSource()Ljava/io/File;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/types/Commandline$Argument;->setLine(Ljava/lang/String;)V

    .line 224
    :cond_8
    :goto_0
    return-void

    .line 219
    :cond_9
    const-string/jumbo v2, "delete"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_a

    const-string/jumbo v2, "undeploy"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_b

    .line 220
    :cond_a
    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/Java;->createArg()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "-r "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/j2ee/JonasHotDeploymentTool;->getTask()Lorg/apache/tools/ant/taskdefs/optional/j2ee/ServerDeploy;

    move-result-object v4

    invoke-virtual {v4}, Lorg/apache/tools/ant/taskdefs/optional/j2ee/ServerDeploy;->getSource()Ljava/io/File;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/types/Commandline$Argument;->setLine(Ljava/lang/String;)V

    goto :goto_0

    .line 221
    :cond_b
    const-string/jumbo v2, "list"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 222
    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/Java;->createArg()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v2

    const-string/jumbo v3, "-l"

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    goto :goto_0
.end method
