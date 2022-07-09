.class public Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar;
.super Lorg/apache/tools/ant/taskdefs/MatchingTask;
.source "EjbJar.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$CMPVersion;,
        Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$NamingScheme;,
        Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;,
        Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$DTDLocation;
    }
.end annotation


# instance fields
.field private cmpVersion:Ljava/lang/String;

.field private config:Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;

.field private deploymentTools:Ljava/util/ArrayList;

.field private destDir:Ljava/io/File;

.field private genericJarSuffix:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 57
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/MatchingTask;-><init>()V

    .line 190
    new-instance v0, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;

    invoke-direct {v0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar;->config:Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;

    .line 202
    const-string/jumbo v0, "-generic.jar"

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar;->genericJarSuffix:Ljava/lang/String;

    .line 205
    const-string/jumbo v0, "1.0"

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar;->cmpVersion:Ljava/lang/String;

    .line 208
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar;->deploymentTools:Ljava/util/ArrayList;

    return-void
.end method

.method private validateConfig()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 536
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar;->config:Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;->srcDir:Ljava/io/File;

    if-nez v0, :cond_0

    .line 537
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "The srcDir attribute must be specified"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 540
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar;->config:Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;->descriptorDir:Ljava/io/File;

    if-nez v0, :cond_1

    .line 541
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar;->config:Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar;->config:Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;

    iget-object v1, v1, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;->srcDir:Ljava/io/File;

    iput-object v1, v0, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;->descriptorDir:Ljava/io/File;

    .line 544
    :cond_1
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar;->config:Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;->namingScheme:Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$NamingScheme;

    if-nez v0, :cond_3

    .line 545
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar;->config:Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;

    new-instance v1, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$NamingScheme;

    invoke-direct {v1}, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$NamingScheme;-><init>()V

    iput-object v1, v0, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;->namingScheme:Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$NamingScheme;

    .line 546
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar;->config:Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;->namingScheme:Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$NamingScheme;

    const-string/jumbo v1, "descriptor"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$NamingScheme;->setValue(Ljava/lang/String;)V

    .line 552
    :cond_2
    return-void

    .line 547
    :cond_3
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar;->config:Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;->namingScheme:Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$NamingScheme;

    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$NamingScheme;->getValue()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "basejarname"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar;->config:Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;->baseJarName:Ljava/lang/String;

    if-nez v0, :cond_2

    .line 549
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "The basejarname attribute must be specified with the basejarname naming scheme"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method protected addDeploymentTool(Lorg/apache/tools/ant/taskdefs/optional/ejb/EJBDeploymentTool;)V
    .locals 1
    .param p1, "deploymentTool"    # Lorg/apache/tools/ant/taskdefs/optional/ejb/EJBDeploymentTool;

    .prologue
    .line 218
    invoke-interface {p1, p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/EJBDeploymentTool;->setTask(Lorg/apache/tools/ant/Task;)V

    .line 219
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar;->deploymentTools:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 220
    return-void
.end method

.method public createBorland()Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandDeploymentTool;
    .locals 3

    .prologue
    .line 250
    const-string/jumbo v1, "Borland deployment tools"

    const/4 v2, 0x3

    invoke-virtual {p0, v1, v2}, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar;->log(Ljava/lang/String;I)V

    .line 252
    new-instance v0, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandDeploymentTool;

    invoke-direct {v0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandDeploymentTool;-><init>()V

    .line 253
    .local v0, "tool":Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandDeploymentTool;
    invoke-virtual {v0, p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandDeploymentTool;->setTask(Lorg/apache/tools/ant/Task;)V

    .line 254
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar;->deploymentTools:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 255
    return-object v0
.end method

.method public createClasspath()Lorg/apache/tools/ant/types/Path;
    .locals 3

    .prologue
    .line 318
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar;->config:Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;->classpath:Lorg/apache/tools/ant/types/Path;

    if-nez v0, :cond_0

    .line 319
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar;->config:Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;

    new-instance v1, Lorg/apache/tools/ant/types/Path;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;)V

    iput-object v1, v0, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;->classpath:Lorg/apache/tools/ant/types/Path;

    .line 321
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar;->config:Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;->classpath:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Path;->createPath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    return-object v0
.end method

.method public createDTD()Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$DTDLocation;
    .locals 2

    .prologue
    .line 332
    new-instance v0, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$DTDLocation;

    invoke-direct {v0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$DTDLocation;-><init>()V

    .line 333
    .local v0, "dtdLocation":Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$DTDLocation;
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar;->config:Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;

    iget-object v1, v1, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;->dtdLocations:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 335
    return-object v0
.end method

.method public createIplanet()Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetDeploymentTool;
    .locals 3

    .prologue
    .line 264
    const-string/jumbo v1, "iPlanet Application Server deployment tools"

    const/4 v2, 0x3

    invoke-virtual {p0, v1, v2}, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar;->log(Ljava/lang/String;I)V

    .line 266
    new-instance v0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetDeploymentTool;

    invoke-direct {v0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetDeploymentTool;-><init>()V

    .line 267
    .local v0, "tool":Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetDeploymentTool;
    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar;->addDeploymentTool(Lorg/apache/tools/ant/taskdefs/optional/ejb/EJBDeploymentTool;)V

    .line 268
    return-object v0
.end method

.method public createJboss()Lorg/apache/tools/ant/taskdefs/optional/ejb/JbossDeploymentTool;
    .locals 1

    .prologue
    .line 277
    new-instance v0, Lorg/apache/tools/ant/taskdefs/optional/ejb/JbossDeploymentTool;

    invoke-direct {v0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/JbossDeploymentTool;-><init>()V

    .line 278
    .local v0, "tool":Lorg/apache/tools/ant/taskdefs/optional/ejb/JbossDeploymentTool;
    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar;->addDeploymentTool(Lorg/apache/tools/ant/taskdefs/optional/ejb/EJBDeploymentTool;)V

    .line 279
    return-object v0
.end method

.method public createJonas()Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;
    .locals 3

    .prologue
    .line 288
    const-string/jumbo v1, "JOnAS deployment tools"

    const/4 v2, 0x3

    invoke-virtual {p0, v1, v2}, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar;->log(Ljava/lang/String;I)V

    .line 290
    new-instance v0, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;

    invoke-direct {v0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;-><init>()V

    .line 291
    .local v0, "tool":Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;
    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar;->addDeploymentTool(Lorg/apache/tools/ant/taskdefs/optional/ejb/EJBDeploymentTool;)V

    .line 292
    return-object v0
.end method

.method public createSupport()Lorg/apache/tools/ant/types/FileSet;
    .locals 2

    .prologue
    .line 344
    new-instance v0, Lorg/apache/tools/ant/types/FileSet;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/FileSet;-><init>()V

    .line 345
    .local v0, "supportFileSet":Lorg/apache/tools/ant/types/FileSet;
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar;->config:Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;

    iget-object v1, v1, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;->supportFileSets:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 346
    return-object v0
.end method

.method public createWeblogic()Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool;
    .locals 1

    .prologue
    .line 228
    new-instance v0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool;

    invoke-direct {v0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool;-><init>()V

    .line 229
    .local v0, "tool":Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool;
    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar;->addDeploymentTool(Lorg/apache/tools/ant/taskdefs/optional/ejb/EJBDeploymentTool;)V

    .line 230
    return-object v0
.end method

.method public createWeblogictoplink()Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicTOPLinkDeploymentTool;
    .locals 3

    .prologue
    .line 302
    const-string/jumbo v1, "The <weblogictoplink> element is no longer required. Please use the <weblogic> element and set newCMP=\"true\""

    const/4 v2, 0x2

    invoke-virtual {p0, v1, v2}, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar;->log(Ljava/lang/String;I)V

    .line 305
    new-instance v0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicTOPLinkDeploymentTool;

    invoke-direct {v0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicTOPLinkDeploymentTool;-><init>()V

    .line 307
    .local v0, "tool":Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicTOPLinkDeploymentTool;
    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar;->addDeploymentTool(Lorg/apache/tools/ant/taskdefs/optional/ejb/EJBDeploymentTool;)V

    .line 308
    return-object v0
.end method

.method public createWebsphere()Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;
    .locals 1

    .prologue
    .line 239
    new-instance v0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;

    invoke-direct {v0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;-><init>()V

    .line 240
    .local v0, "tool":Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;
    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar;->addDeploymentTool(Lorg/apache/tools/ant/taskdefs/optional/ejb/EJBDeploymentTool;)V

    .line 241
    return-object v0
.end method

.method public execute()V
    .locals 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 570
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar;->validateConfig()V

    .line 572
    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar;->deploymentTools:Ljava/util/ArrayList;

    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v11

    if-nez v11, :cond_0

    .line 573
    new-instance v2, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;

    invoke-direct {v2}, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;-><init>()V

    .line 574
    .local v2, "genericTool":Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;
    invoke-virtual {v2, p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->setTask(Lorg/apache/tools/ant/Task;)V

    .line 575
    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar;->destDir:Ljava/io/File;

    invoke-virtual {v2, v11}, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->setDestdir(Ljava/io/File;)V

    .line 576
    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar;->genericJarSuffix:Ljava/lang/String;

    invoke-virtual {v2, v11}, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->setGenericJarSuffix(Ljava/lang/String;)V

    .line 577
    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar;->deploymentTools:Ljava/util/ArrayList;

    invoke-virtual {v11, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 580
    .end local v2    # "genericTool":Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;
    :cond_0
    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar;->deploymentTools:Ljava/util/ArrayList;

    invoke-virtual {v11}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_1

    .line 581
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lorg/apache/tools/ant/taskdefs/optional/ejb/EJBDeploymentTool;

    .line 582
    .local v10, "tool":Lorg/apache/tools/ant/taskdefs/optional/ejb/EJBDeploymentTool;
    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar;->config:Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;

    invoke-interface {v10, v11}, Lorg/apache/tools/ant/taskdefs/optional/ejb/EJBDeploymentTool;->configure(Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;)V

    .line 583
    invoke-interface {v10}, Lorg/apache/tools/ant/taskdefs/optional/ejb/EJBDeploymentTool;->validateConfigured()V

    goto :goto_0

    .line 588
    .end local v10    # "tool":Lorg/apache/tools/ant/taskdefs/optional/ejb/EJBDeploymentTool;
    :cond_1
    :try_start_0
    invoke-static {}, Ljavax/xml/parsers/SAXParserFactory;->newInstance()Ljavax/xml/parsers/SAXParserFactory;

    move-result-object v8

    .line 589
    .local v8, "saxParserFactory":Ljavax/xml/parsers/SAXParserFactory;
    const/4 v11, 0x1

    invoke-virtual {v8, v11}, Ljavax/xml/parsers/SAXParserFactory;->setValidating(Z)V

    .line 590
    invoke-virtual {v8}, Ljavax/xml/parsers/SAXParserFactory;->newSAXParser()Ljavax/xml/parsers/SAXParser;

    move-result-object v7

    .line 593
    .local v7, "saxParser":Ljavax/xml/parsers/SAXParser;
    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar;->config:Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;

    iget-object v11, v11, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;->descriptorDir:Ljava/io/File;

    invoke-virtual {p0, v11}, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar;->getDirectoryScanner(Ljava/io/File;)Lorg/apache/tools/ant/DirectoryScanner;

    move-result-object v0

    .line 594
    .local v0, "ds":Lorg/apache/tools/ant/DirectoryScanner;
    invoke-virtual {v0}, Lorg/apache/tools/ant/DirectoryScanner;->scan()V

    .line 595
    invoke-virtual {v0}, Lorg/apache/tools/ant/DirectoryScanner;->getIncludedFiles()[Ljava/lang/String;

    move-result-object v1

    .line 597
    .local v1, "files":[Ljava/lang/String;
    new-instance v11, Ljava/lang/StringBuffer;

    invoke-direct {v11}, Ljava/lang/StringBuffer;-><init>()V

    array-length v12, v1

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v11

    const-string/jumbo v12, " deployment descriptors located."

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v11

    const/4 v12, 0x3

    invoke-virtual {p0, v11, v12}, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar;->log(Ljava/lang/String;I)V

    .line 602
    const/4 v4, 0x0

    .local v4, "index":I
    :goto_1
    array-length v11, v1

    if-ge v4, v11, :cond_3

    .line 604
    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar;->deploymentTools:Ljava/util/ArrayList;

    invoke-virtual {v11}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_2

    .line 605
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lorg/apache/tools/ant/taskdefs/optional/ejb/EJBDeploymentTool;

    .line 606
    .restart local v10    # "tool":Lorg/apache/tools/ant/taskdefs/optional/ejb/EJBDeploymentTool;
    aget-object v11, v1, v4

    invoke-interface {v10, v11, v7}, Lorg/apache/tools/ant/taskdefs/optional/ejb/EJBDeploymentTool;->processDescriptor(Ljava/lang/String;Ljavax/xml/parsers/SAXParser;)V
    :try_end_0
    .catch Lorg/xml/sax/SAXException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljavax/xml/parsers/ParserConfigurationException; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_2

    .line 609
    .end local v0    # "ds":Lorg/apache/tools/ant/DirectoryScanner;
    .end local v1    # "files":[Ljava/lang/String;
    .end local v4    # "index":I
    .end local v7    # "saxParser":Ljavax/xml/parsers/SAXParser;
    .end local v8    # "saxParserFactory":Ljavax/xml/parsers/SAXParserFactory;
    .end local v10    # "tool":Lorg/apache/tools/ant/taskdefs/optional/ejb/EJBDeploymentTool;
    :catch_0
    move-exception v9

    .line 610
    .local v9, "se":Lorg/xml/sax/SAXException;
    new-instance v11, Ljava/lang/StringBuffer;

    invoke-direct {v11}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v12, "SAXException while creating parser.  Details: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v9}, Lorg/xml/sax/SAXException;->getMessage()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    .line 613
    .local v5, "msg":Ljava/lang/String;
    new-instance v11, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v11, v5, v9}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v11

    .line 602
    .end local v5    # "msg":Ljava/lang/String;
    .end local v9    # "se":Lorg/xml/sax/SAXException;
    .restart local v0    # "ds":Lorg/apache/tools/ant/DirectoryScanner;
    .restart local v1    # "files":[Ljava/lang/String;
    .restart local v4    # "index":I
    .restart local v7    # "saxParser":Ljavax/xml/parsers/SAXParser;
    .restart local v8    # "saxParserFactory":Ljavax/xml/parsers/SAXParserFactory;
    :cond_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 614
    .end local v0    # "ds":Lorg/apache/tools/ant/DirectoryScanner;
    .end local v1    # "files":[Ljava/lang/String;
    .end local v4    # "index":I
    .end local v7    # "saxParser":Ljavax/xml/parsers/SAXParser;
    .end local v8    # "saxParserFactory":Ljavax/xml/parsers/SAXParserFactory;
    :catch_1
    move-exception v6

    .line 615
    .local v6, "pce":Ljavax/xml/parsers/ParserConfigurationException;
    new-instance v11, Ljava/lang/StringBuffer;

    invoke-direct {v11}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v12, "ParserConfigurationException while creating parser. Details: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v6}, Ljavax/xml/parsers/ParserConfigurationException;->getMessage()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    .line 617
    .restart local v5    # "msg":Ljava/lang/String;
    new-instance v11, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v11, v5, v6}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v11

    .line 619
    .end local v5    # "msg":Ljava/lang/String;
    .end local v6    # "pce":Ljavax/xml/parsers/ParserConfigurationException;
    .restart local v0    # "ds":Lorg/apache/tools/ant/DirectoryScanner;
    .restart local v1    # "files":[Ljava/lang/String;
    .restart local v4    # "index":I
    .restart local v7    # "saxParser":Ljavax/xml/parsers/SAXParser;
    .restart local v8    # "saxParserFactory":Ljavax/xml/parsers/SAXParserFactory;
    :cond_3
    return-void
.end method

.method public getCmpversion()Ljava/lang/String;
    .locals 1

    .prologue
    .line 464
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar;->cmpVersion:Ljava/lang/String;

    return-object v0
.end method

.method public getDestdir()Ljava/io/File;
    .locals 1

    .prologue
    .line 440
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar;->destDir:Ljava/io/File;

    return-object v0
.end method

.method public setBasejarname(Ljava/lang/String;)V
    .locals 3
    .param p1, "inValue"    # Ljava/lang/String;

    .prologue
    .line 406
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar;->config:Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;

    iput-object p1, v0, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;->baseJarName:Ljava/lang/String;

    .line 407
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar;->config:Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;->namingScheme:Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$NamingScheme;

    if-nez v0, :cond_1

    .line 408
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar;->config:Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;

    new-instance v1, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$NamingScheme;

    invoke-direct {v1}, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$NamingScheme;-><init>()V

    iput-object v1, v0, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;->namingScheme:Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$NamingScheme;

    .line 409
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar;->config:Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;->namingScheme:Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$NamingScheme;

    const-string/jumbo v1, "basejarname"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$NamingScheme;->setValue(Ljava/lang/String;)V

    .line 415
    :cond_0
    return-void

    .line 410
    :cond_1
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar;->config:Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;->namingScheme:Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$NamingScheme;

    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$NamingScheme;->getValue()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "basejarname"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 411
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "The basejarname attribute is not compatible with the "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar;->config:Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;

    iget-object v2, v2, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;->namingScheme:Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$NamingScheme;

    invoke-virtual {v2}, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$NamingScheme;->getValue()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, " naming scheme"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setBasenameterminator(Ljava/lang/String;)V
    .locals 1
    .param p1, "inValue"    # Ljava/lang/String;

    .prologue
    .line 527
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar;->config:Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;

    iput-object p1, v0, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;->baseNameTerminator:Ljava/lang/String;

    .line 528
    return-void
.end method

.method public setClasspath(Lorg/apache/tools/ant/types/Path;)V
    .locals 1
    .param p1, "classpath"    # Lorg/apache/tools/ant/types/Path;

    .prologue
    .line 486
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar;->config:Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;

    iput-object p1, v0, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;->classpath:Lorg/apache/tools/ant/types/Path;

    .line 487
    return-void
.end method

.method public setCmpversion(Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$CMPVersion;)V
    .locals 1
    .param p1, "version"    # Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$CMPVersion;

    .prologue
    .line 477
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$CMPVersion;->getValue()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar;->cmpVersion:Ljava/lang/String;

    .line 478
    return-void
.end method

.method public setDependency(Ljava/lang/String;)V
    .locals 1
    .param p1, "analyzer"    # Ljava/lang/String;

    .prologue
    .line 395
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar;->config:Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;

    iput-object p1, v0, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;->analyzer:Ljava/lang/String;

    .line 396
    return-void
.end method

.method public setDescriptordir(Ljava/io/File;)V
    .locals 1
    .param p1, "inDir"    # Ljava/io/File;

    .prologue
    .line 386
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar;->config:Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;

    iput-object p1, v0, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;->descriptorDir:Ljava/io/File;

    .line 387
    return-void
.end method

.method public setDestdir(Ljava/io/File;)V
    .locals 0
    .param p1, "inDir"    # Ljava/io/File;

    .prologue
    .line 454
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar;->destDir:Ljava/io/File;

    .line 455
    return-void
.end method

.method public setFlatdestdir(Z)V
    .locals 1
    .param p1, "inValue"    # Z

    .prologue
    .line 501
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar;->config:Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;

    iput-boolean p1, v0, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;->flatDestDir:Z

    .line 502
    return-void
.end method

.method public setGenericjarsuffix(Ljava/lang/String;)V
    .locals 0
    .param p1, "inString"    # Ljava/lang/String;

    .prologue
    .line 514
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar;->genericJarSuffix:Ljava/lang/String;

    .line 515
    return-void
.end method

.method public setManifest(Ljava/io/File;)V
    .locals 1
    .param p1, "manifest"    # Ljava/io/File;

    .prologue
    .line 362
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar;->config:Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;

    iput-object p1, v0, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;->manifest:Ljava/io/File;

    .line 363
    return-void
.end method

.method public setNaming(Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$NamingScheme;)V
    .locals 3
    .param p1, "namingScheme"    # Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$NamingScheme;

    .prologue
    .line 424
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar;->config:Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;

    iput-object p1, v0, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;->namingScheme:Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$NamingScheme;

    .line 425
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar;->config:Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;->namingScheme:Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$NamingScheme;

    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$NamingScheme;->getValue()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "basejarname"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar;->config:Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;->baseJarName:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 427
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "The basejarname attribute is not compatible with the "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar;->config:Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;

    iget-object v2, v2, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;->namingScheme:Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$NamingScheme;

    invoke-virtual {v2}, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$NamingScheme;->getValue()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, " naming scheme"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 431
    :cond_0
    return-void
.end method

.method public setSrcdir(Ljava/io/File;)V
    .locals 1
    .param p1, "inDir"    # Ljava/io/File;

    .prologue
    .line 373
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar;->config:Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;

    iput-object p1, v0, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;->srcDir:Ljava/io/File;

    .line 374
    return-void
.end method
