.class public Lorg/apache/tools/ant/taskdefs/optional/ejb/JbossDeploymentTool;
.super Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;
.source "JbossDeploymentTool.java"


# static fields
.field protected static final JBOSS_CMP10D:Ljava/lang/String; = "jaws.xml"

.field protected static final JBOSS_CMP20D:Ljava/lang/String; = "jbosscmp-jdbc.xml"

.field protected static final JBOSS_DD:Ljava/lang/String; = "jboss.xml"


# instance fields
.field private jarSuffix:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 33
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;-><init>()V

    .line 39
    const-string/jumbo v0, ".jar"

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/JbossDeploymentTool;->jarSuffix:Ljava/lang/String;

    return-void
.end method

.method private getParent()Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar;
    .locals 1

    .prologue
    .line 108
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/JbossDeploymentTool;->getTask()Lorg/apache/tools/ant/Task;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar;

    return-object v0
.end method


# virtual methods
.method protected addVendorFiles(Ljava/util/Hashtable;Ljava/lang/String;)V
    .locals 6
    .param p1, "ejbFiles"    # Ljava/util/Hashtable;
    .param p2, "ddPrefix"    # Ljava/lang/String;

    .prologue
    .line 56
    new-instance v2, Ljava/io/File;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/JbossDeploymentTool;->getConfig()Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;

    move-result-object v3

    iget-object v3, v3, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;->descriptorDir:Ljava/io/File;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v4, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, "jboss.xml"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 57
    .local v2, "jbossDD":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 58
    const-string/jumbo v3, "META-INF/jboss.xml"

    invoke-virtual {p1, v3, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 65
    const-string/jumbo v0, "jaws.xml"

    .line 66
    .local v0, "descriptorFileName":Ljava/lang/String;
    const-string/jumbo v3, "2.0"

    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/JbossDeploymentTool;->getParent()Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar;

    move-result-object v4

    invoke-virtual {v4}, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar;->getCmpversion()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 67
    const-string/jumbo v0, "jbosscmp-jdbc.xml"

    .line 69
    :cond_0
    new-instance v1, Ljava/io/File;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/JbossDeploymentTool;->getConfig()Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;

    move-result-object v3

    iget-object v3, v3, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;->descriptorDir:Ljava/io/File;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v4, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v1, v3, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 72
    .local v1, "jbossCMPD":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 73
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "META-INF/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3, v1}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 80
    .end local v0    # "descriptorFileName":Ljava/lang/String;
    .end local v1    # "jbossCMPD":Ljava/io/File;
    :goto_0
    return-void

    .line 60
    :cond_1
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "Unable to locate jboss deployment descriptor. It was expected to be in "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v2}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x1

    invoke-virtual {p0, v3, v4}, Lorg/apache/tools/ant/taskdefs/optional/ejb/JbossDeploymentTool;->log(Ljava/lang/String;I)V

    goto :goto_0

    .line 75
    .restart local v0    # "descriptorFileName":Ljava/lang/String;
    .restart local v1    # "jbossCMPD":Ljava/io/File;
    :cond_2
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "Unable to locate jboss cmp descriptor. It was expected to be in "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x3

    invoke-virtual {p0, v3, v4}, Lorg/apache/tools/ant/taskdefs/optional/ejb/JbossDeploymentTool;->log(Ljava/lang/String;I)V

    goto :goto_0
.end method

.method getVendorOutputJarFile(Ljava/lang/String;)Ljava/io/File;
    .locals 4
    .param p1, "baseName"    # Ljava/lang/String;

    .prologue
    .line 87
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/JbossDeploymentTool;->getDestDir()Ljava/io/File;

    move-result-object v0

    if-nez v0, :cond_0

    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/JbossDeploymentTool;->getParent()Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar;->getDestdir()Ljava/io/File;

    move-result-object v0

    if-nez v0, :cond_0

    .line 88
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "DestDir not specified"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 90
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/JbossDeploymentTool;->getDestDir()Ljava/io/File;

    move-result-object v0

    if-nez v0, :cond_1

    .line 91
    new-instance v0, Ljava/io/File;

    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/JbossDeploymentTool;->getParent()Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar;

    move-result-object v1

    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar;->getDestdir()Ljava/io/File;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/JbossDeploymentTool;->jarSuffix:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 93
    :goto_0
    return-object v0

    :cond_1
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/JbossDeploymentTool;->getDestDir()Ljava/io/File;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/JbossDeploymentTool;->jarSuffix:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public setSuffix(Ljava/lang/String;)V
    .locals 0
    .param p1, "inString"    # Ljava/lang/String;

    .prologue
    .line 46
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/JbossDeploymentTool;->jarSuffix:Ljava/lang/String;

    .line 47
    return-void
.end method

.method public validateConfigured()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 105
    return-void
.end method
