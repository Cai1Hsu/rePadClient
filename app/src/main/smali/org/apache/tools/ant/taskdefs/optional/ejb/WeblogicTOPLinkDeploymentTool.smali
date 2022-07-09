.class public Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicTOPLinkDeploymentTool;
.super Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool;
.source "WeblogicTOPLinkDeploymentTool.java"


# static fields
.field private static final TL_DTD_LOC:Ljava/lang/String; = "http://www.objectpeople.com/tlwl/dtd/toplink-cmp_2_5_1.dtd"


# instance fields
.field private toplinkDTD:Ljava/lang/String;

.field private toplinkDescriptor:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 29
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool;-><init>()V

    return-void
.end method


# virtual methods
.method protected addVendorFiles(Ljava/util/Hashtable;Ljava/lang/String;)V
    .locals 4
    .param p1, "ejbFiles"    # Ljava/util/Hashtable;
    .param p2, "ddPrefix"    # Ljava/lang/String;

    .prologue
    .line 83
    invoke-super {p0, p1, p2}, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool;->addVendorFiles(Ljava/util/Hashtable;Ljava/lang/String;)V

    .line 89
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicTOPLinkDeploymentTool;->getConfig()Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;

    move-result-object v1

    iget-object v1, v1, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;->descriptorDir:Ljava/io/File;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v2, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicTOPLinkDeploymentTool;->toplinkDescriptor:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 91
    .local v0, "toplinkDD":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 92
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "META-INF/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicTOPLinkDeploymentTool;->toplinkDescriptor:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1, v0}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 99
    :goto_0
    return-void

    .line 95
    :cond_0
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "Unable to locate toplink deployment descriptor. It was expected to be in "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {p0, v1, v2}, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicTOPLinkDeploymentTool;->log(Ljava/lang/String;I)V

    goto :goto_0
.end method

.method protected getDescriptorHandler(Ljava/io/File;)Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;
    .locals 3
    .param p1, "srcDir"    # Ljava/io/File;

    .prologue
    .line 65
    invoke-super {p0, p1}, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool;->getDescriptorHandler(Ljava/io/File;)Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;

    move-result-object v0

    .line 66
    .local v0, "handler":Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicTOPLinkDeploymentTool;->toplinkDTD:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 67
    const-string/jumbo v1, "-//The Object People, Inc.//DTD TOPLink for WebLogic CMP 2.5.1//EN"

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicTOPLinkDeploymentTool;->toplinkDTD:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;->registerDTD(Ljava/lang/String;Ljava/lang/String;)V

    .line 73
    :goto_0
    return-object v0

    .line 70
    :cond_0
    const-string/jumbo v1, "-//The Object People, Inc.//DTD TOPLink for WebLogic CMP 2.5.1//EN"

    const-string/jumbo v2, "http://www.objectpeople.com/tlwl/dtd/toplink-cmp_2_5_1.dtd"

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;->registerDTD(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public setToplinkdescriptor(Ljava/lang/String;)V
    .locals 0
    .param p1, "inString"    # Ljava/lang/String;

    .prologue
    .line 42
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicTOPLinkDeploymentTool;->toplinkDescriptor:Ljava/lang/String;

    .line 43
    return-void
.end method

.method public setToplinkdtd(Ljava/lang/String;)V
    .locals 0
    .param p1, "inString"    # Ljava/lang/String;

    .prologue
    .line 56
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicTOPLinkDeploymentTool;->toplinkDTD:Ljava/lang/String;

    .line 57
    return-void
.end method

.method public validateConfigured()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 106
    invoke-super {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool;->validateConfigured()V

    .line 107
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicTOPLinkDeploymentTool;->toplinkDescriptor:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 108
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "The toplinkdescriptor attribute must be specified"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 111
    :cond_0
    return-void
.end method
