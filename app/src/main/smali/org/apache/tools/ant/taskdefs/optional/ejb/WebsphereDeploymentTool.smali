.class public Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;
.super Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;
.source "WebsphereDeploymentTool.java"


# static fields
.field private static final FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

.field public static final PUBLICID_EJB11:Ljava/lang/String; = "-//Sun Microsystems, Inc.//DTD Enterprise JavaBeans 1.1//EN"

.field public static final PUBLICID_EJB20:Ljava/lang/String; = "-//Sun Microsystems, Inc.//DTD Enterprise JavaBeans 2.0//EN"

.field protected static final SCHEMA_DIR:Ljava/lang/String; = "Schema/"

.field protected static final WAS_BND:Ljava/lang/String; = "ibm-ejb-jar-bnd.xmi"

.field protected static final WAS_CMP_MAP:Ljava/lang/String; = "Map.mapxmi"

.field protected static final WAS_CMP_SCHEMA:Ljava/lang/String; = "Schema.dbxmi"

.field protected static final WAS_EXT:Ljava/lang/String; = "ibm-ejb-jar-ext.xmi"


# instance fields
.field private alwaysRebuild:Z

.field private codegen:Z

.field private dbName:Ljava/lang/String;

.field private dbSchema:Ljava/lang/String;

.field private dbVendor:Ljava/lang/String;

.field private ejb11DTD:Ljava/lang/String;

.field private ejbdeploy:Z

.field private jarSuffix:Ljava/lang/String;

.field private keepGeneric:Z

.field private newCMP:Z

.field private noinform:Z

.field private novalidate:Z

.field private nowarn:Z

.field private quiet:Z

.field private rmicOptions:Ljava/lang/String;

.field private tempdir:Ljava/lang/String;

.field private trace:Z

.field private use35MappingRules:Z

.field private wasClasspath:Lorg/apache/tools/ant/types/Path;

.field private websphereHome:Ljava/io/File;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 78
    invoke-static {}, Lorg/apache/tools/ant/util/FileUtils;->getFileUtils()Lorg/apache/tools/ant/util/FileUtils;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 62
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;-><init>()V

    .line 81
    const-string/jumbo v0, ".jar"

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;->jarSuffix:Ljava/lang/String;

    .line 88
    iput-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;->keepGeneric:Z

    .line 90
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;->alwaysRebuild:Z

    .line 92
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;->ejbdeploy:Z

    .line 95
    iput-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;->newCMP:Z

    .line 98
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;->wasClasspath:Lorg/apache/tools/ant/types/Path;

    .line 113
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;->quiet:Z

    .line 134
    const-string/jumbo v0, "_ejbdeploy_temp"

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;->tempdir:Ljava/lang/String;

    return-void
.end method

.method private buildWebsphereJar(Ljava/io/File;Ljava/io/File;)V
    .locals 8
    .param p1, "sourceJar"    # Ljava/io/File;
    .param p2, "destJar"    # Ljava/io/File;

    .prologue
    .line 556
    :try_start_0
    iget-boolean v6, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;->ejbdeploy:Z

    if-eqz v6, :cond_3

    .line 557
    new-instance v2, Lorg/apache/tools/ant/taskdefs/Java;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;->getTask()Lorg/apache/tools/ant/Task;

    move-result-object v6

    invoke-direct {v2, v6}, Lorg/apache/tools/ant/taskdefs/Java;-><init>(Lorg/apache/tools/ant/Task;)V

    .line 559
    .local v2, "javaTask":Lorg/apache/tools/ant/taskdefs/Java;
    invoke-virtual {v2}, Lorg/apache/tools/ant/taskdefs/Java;->createJvmarg()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v6

    const-string/jumbo v7, "-Xms64m"

    invoke-virtual {v6, v7}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 560
    invoke-virtual {v2}, Lorg/apache/tools/ant/taskdefs/Java;->createJvmarg()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v6

    const-string/jumbo v7, "-Xmx128m"

    invoke-virtual {v6, v7}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 563
    new-instance v5, Lorg/apache/tools/ant/types/Environment$Variable;

    invoke-direct {v5}, Lorg/apache/tools/ant/types/Environment$Variable;-><init>()V

    .line 565
    .local v5, "var":Lorg/apache/tools/ant/types/Environment$Variable;
    const-string/jumbo v6, "websphere.lib.dir"

    invoke-virtual {v5, v6}, Lorg/apache/tools/ant/types/Environment$Variable;->setKey(Ljava/lang/String;)V

    .line 566
    new-instance v3, Ljava/io/File;

    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;->websphereHome:Ljava/io/File;

    const-string/jumbo v7, "lib"

    invoke-direct {v3, v6, v7}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 567
    .local v3, "libdir":Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Lorg/apache/tools/ant/types/Environment$Variable;->setValue(Ljava/lang/String;)V

    .line 568
    invoke-virtual {v2, v5}, Lorg/apache/tools/ant/taskdefs/Java;->addSysproperty(Lorg/apache/tools/ant/types/Environment$Variable;)V

    .line 571
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;->websphereHome:Ljava/io/File;

    invoke-virtual {v2, v6}, Lorg/apache/tools/ant/taskdefs/Java;->setDir(Ljava/io/File;)V

    .line 574
    const-string/jumbo v6, "ejbdeploy"

    invoke-virtual {v2, v6}, Lorg/apache/tools/ant/taskdefs/Java;->setTaskName(Ljava/lang/String;)V

    .line 575
    const-string/jumbo v6, "com.ibm.etools.ejbdeploy.EJBDeploy"

    invoke-virtual {v2, v6}, Lorg/apache/tools/ant/taskdefs/Java;->setClassname(Ljava/lang/String;)V

    .line 577
    invoke-virtual {v2}, Lorg/apache/tools/ant/taskdefs/Java;->createArg()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v6

    invoke-virtual {p1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 578
    invoke-virtual {v2}, Lorg/apache/tools/ant/taskdefs/Java;->createArg()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v6

    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;->tempdir:Ljava/lang/String;

    invoke-virtual {v6, v7}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 579
    invoke-virtual {v2}, Lorg/apache/tools/ant/taskdefs/Java;->createArg()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v6

    invoke-virtual {p2}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 580
    invoke-virtual {v2}, Lorg/apache/tools/ant/taskdefs/Java;->createArg()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v6

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;->getOptions()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Lorg/apache/tools/ant/types/Commandline$Argument;->setLine(Ljava/lang/String;)V

    .line 581
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;->getCombinedClasspath()Lorg/apache/tools/ant/types/Path;

    move-result-object v6

    if-eqz v6, :cond_0

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;->getCombinedClasspath()Lorg/apache/tools/ant/types/Path;

    move-result-object v6

    invoke-virtual {v6}, Lorg/apache/tools/ant/types/Path;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    if-lez v6, :cond_0

    .line 583
    invoke-virtual {v2}, Lorg/apache/tools/ant/taskdefs/Java;->createArg()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v6

    const-string/jumbo v7, "-cp"

    invoke-virtual {v6, v7}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 584
    invoke-virtual {v2}, Lorg/apache/tools/ant/taskdefs/Java;->createArg()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v6

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;->getCombinedClasspath()Lorg/apache/tools/ant/types/Path;

    move-result-object v7

    invoke-virtual {v7}, Lorg/apache/tools/ant/types/Path;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 587
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;->wasClasspath:Lorg/apache/tools/ant/types/Path;

    .line 589
    .local v0, "classpath":Lorg/apache/tools/ant/types/Path;
    if-nez v0, :cond_1

    .line 590
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;->getCombinedClasspath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    .line 593
    :cond_1
    const/4 v6, 0x1

    invoke-virtual {v2, v6}, Lorg/apache/tools/ant/taskdefs/Java;->setFork(Z)V

    .line 594
    if-eqz v0, :cond_2

    .line 595
    invoke-virtual {v2, v0}, Lorg/apache/tools/ant/taskdefs/Java;->setClasspath(Lorg/apache/tools/ant/types/Path;)V

    .line 598
    :cond_2
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v7, "Calling websphere.ejbdeploy for "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {p1}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x3

    invoke-virtual {p0, v6, v7}, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;->log(Ljava/lang/String;I)V

    .line 601
    invoke-virtual {v2}, Lorg/apache/tools/ant/taskdefs/Java;->execute()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 609
    .end local v0    # "classpath":Lorg/apache/tools/ant/types/Path;
    .end local v2    # "javaTask":Lorg/apache/tools/ant/taskdefs/Java;
    .end local v3    # "libdir":Ljava/io/File;
    .end local v5    # "var":Lorg/apache/tools/ant/types/Environment$Variable;
    :cond_3
    return-void

    .line 603
    :catch_0
    move-exception v1

    .line 605
    .local v1, "e":Ljava/lang/Exception;
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v7, "Exception while calling ejbdeploy. Details: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    .line 607
    .local v4, "msg":Ljava/lang/String;
    new-instance v6, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v6, v4, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v6
.end method


# virtual methods
.method protected addVendorFiles(Ljava/util/Hashtable;Ljava/lang/String;)V
    .locals 12
    .param p1, "ejbFiles"    # Ljava/util/Hashtable;
    .param p2, "baseName"    # Ljava/lang/String;

    .prologue
    const/4 v11, 0x3

    .line 411
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;->usingBaseJarName()Z

    move-result v8

    if-eqz v8, :cond_0

    const-string/jumbo v1, ""

    .line 412
    .local v1, "ddPrefix":Ljava/lang/String;
    :goto_0
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;->dbVendor:Ljava/lang/String;

    if-nez v8, :cond_1

    const-string/jumbo v0, ""

    .line 415
    .local v0, "dbPrefix":Ljava/lang/String;
    :goto_1
    new-instance v5, Ljava/io/File;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;->getConfig()Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;

    move-result-object v8

    iget-object v8, v8, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;->descriptorDir:Ljava/io/File;

    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v9, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string/jumbo v10, "ibm-ejb-jar-ext.xmi"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v5, v8, v9}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 417
    .local v5, "websphereEXT":Ljava/io/File;
    invoke-virtual {v5}, Ljava/io/File;->exists()Z

    move-result v8

    if-eqz v8, :cond_2

    .line 418
    const-string/jumbo v8, "META-INF/ibm-ejb-jar-ext.xmi"

    invoke-virtual {p1, v8, v5}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 426
    :goto_2
    new-instance v4, Ljava/io/File;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;->getConfig()Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;

    move-result-object v8

    iget-object v8, v8, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;->descriptorDir:Ljava/io/File;

    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v9, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string/jumbo v10, "ibm-ejb-jar-bnd.xmi"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v4, v8, v9}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 428
    .local v4, "websphereBND":Ljava/io/File;
    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v8

    if-eqz v8, :cond_3

    .line 429
    const-string/jumbo v8, "META-INF/ibm-ejb-jar-bnd.xmi"

    invoke-virtual {p1, v8, v4}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 437
    :goto_3
    iget-boolean v8, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;->newCMP:Z

    if-nez v8, :cond_4

    .line 438
    const-string/jumbo v8, "The old method for locating CMP files has been DEPRECATED."

    invoke-virtual {p0, v8, v11}, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;->log(Ljava/lang/String;I)V

    .line 440
    const-string/jumbo v8, "Please adjust your websphere descriptor and set newCMP=\"true\" to use the new CMP descriptor inclusion mechanism. "

    invoke-virtual {p0, v8, v11}, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;->log(Ljava/lang/String;I)V

    .line 476
    :goto_4
    return-void

    .end local v0    # "dbPrefix":Ljava/lang/String;
    .end local v1    # "ddPrefix":Ljava/lang/String;
    .end local v4    # "websphereBND":Ljava/io/File;
    .end local v5    # "websphereEXT":Ljava/io/File;
    :cond_0
    move-object v1, p2

    .line 411
    goto :goto_0

    .line 412
    .restart local v1    # "ddPrefix":Ljava/lang/String;
    :cond_1
    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;->dbVendor:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    const-string/jumbo v9, "-"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    .line 421
    .restart local v0    # "dbPrefix":Ljava/lang/String;
    .restart local v5    # "websphereEXT":Ljava/io/File;
    :cond_2
    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v9, "Unable to locate websphere extensions. It was expected to be in "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v5}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0, v8, v11}, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;->log(Ljava/lang/String;I)V

    goto :goto_2

    .line 432
    .restart local v4    # "websphereBND":Ljava/io/File;
    :cond_3
    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v9, "Unable to locate websphere bindings. It was expected to be in "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v4}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0, v8, v11}, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;->log(Ljava/lang/String;I)V

    goto :goto_3

    .line 447
    :cond_4
    :try_start_0
    new-instance v6, Ljava/io/File;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;->getConfig()Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;

    move-result-object v8

    iget-object v8, v8, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;->descriptorDir:Ljava/io/File;

    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v9, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string/jumbo v10, "Map.mapxmi"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v6, v8, v9}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 450
    .local v6, "websphereMAP":Ljava/io/File;
    invoke-virtual {v6}, Ljava/io/File;->exists()Z

    move-result v8

    if-eqz v8, :cond_5

    .line 451
    const-string/jumbo v8, "META-INF/Map.mapxmi"

    invoke-virtual {p1, v8, v6}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 458
    :goto_5
    new-instance v7, Ljava/io/File;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;->getConfig()Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;

    move-result-object v8

    iget-object v8, v8, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;->descriptorDir:Ljava/io/File;

    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v9, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string/jumbo v10, "Schema.dbxmi"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v7, v8, v9}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 461
    .local v7, "websphereSchema":Ljava/io/File;
    invoke-virtual {v7}, Ljava/io/File;->exists()Z

    move-result v8

    if-eqz v8, :cond_6

    .line 462
    const-string/jumbo v8, "META-INF/Schema/Schema.dbxmi"

    invoke-virtual {p1, v8, v7}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_4

    .line 469
    .end local v6    # "websphereMAP":Ljava/io/File;
    .end local v7    # "websphereSchema":Ljava/io/File;
    :catch_0
    move-exception v2

    .line 470
    .local v2, "e":Ljava/lang/Exception;
    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v9, "Exception while adding Vendor specific files: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v2}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    .line 473
    .local v3, "msg":Ljava/lang/String;
    new-instance v8, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v8, v3, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v8

    .line 454
    .end local v2    # "e":Ljava/lang/Exception;
    .end local v3    # "msg":Ljava/lang/String;
    .restart local v6    # "websphereMAP":Ljava/io/File;
    :cond_5
    :try_start_1
    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v9, "Unable to locate the websphere Map: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v6}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x3

    invoke-virtual {p0, v8, v9}, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;->log(Ljava/lang/String;I)V

    goto :goto_5

    .line 465
    .restart local v7    # "websphereSchema":Ljava/io/File;
    :cond_6
    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v9, "Unable to locate the websphere Schema: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v7}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x3

    invoke-virtual {p0, v8, v9}, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;->log(Ljava/lang/String;I)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_4
.end method

.method public createWASClasspath()Lorg/apache/tools/ant/types/Path;
    .locals 2

    .prologue
    .line 144
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;->wasClasspath:Lorg/apache/tools/ant/types/Path;

    if-nez v0, :cond_0

    .line 145
    new-instance v0, Lorg/apache/tools/ant/types/Path;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;->getTask()Lorg/apache/tools/ant/Task;

    move-result-object v1

    invoke-virtual {v1}, Lorg/apache/tools/ant/Task;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;->wasClasspath:Lorg/apache/tools/ant/types/Path;

    .line 147
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;->wasClasspath:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Path;->createPath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    return-object v0
.end method

.method protected getClassLoaderFromJar(Ljava/io/File;)Ljava/lang/ClassLoader;
    .locals 3
    .param p1, "classjar"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 884
    new-instance v1, Lorg/apache/tools/ant/types/Path;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;->getTask()Lorg/apache/tools/ant/Task;

    move-result-object v2

    invoke-virtual {v2}, Lorg/apache/tools/ant/Task;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;)V

    .line 886
    .local v1, "lookupPath":Lorg/apache/tools/ant/types/Path;
    invoke-virtual {v1, p1}, Lorg/apache/tools/ant/types/Path;->setLocation(Ljava/io/File;)V

    .line 888
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;->getCombinedClasspath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    .line 890
    .local v0, "classpath":Lorg/apache/tools/ant/types/Path;
    if-eqz v0, :cond_0

    .line 891
    invoke-virtual {v1, v0}, Lorg/apache/tools/ant/types/Path;->append(Lorg/apache/tools/ant/types/Path;)V

    .line 894
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;->getTask()Lorg/apache/tools/ant/Task;

    move-result-object v2

    invoke-virtual {v2}, Lorg/apache/tools/ant/Task;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v2

    invoke-virtual {v2, v1}, Lorg/apache/tools/ant/Project;->createClassLoader(Lorg/apache/tools/ant/types/Path;)Lorg/apache/tools/ant/AntClassLoader;

    move-result-object v2

    return-object v2
.end method

.method protected getDescriptorHandler(Ljava/io/File;)Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;
    .locals 5
    .param p1, "srcDir"    # Ljava/io/File;

    .prologue
    .line 368
    new-instance v1, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;->getTask()Lorg/apache/tools/ant/Task;

    move-result-object v3

    invoke-direct {v1, v3, p1}, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;-><init>(Lorg/apache/tools/ant/Task;Ljava/io/File;)V

    .line 371
    .local v1, "handler":Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;
    const-string/jumbo v3, "-//Sun Microsystems, Inc.//DTD Enterprise JavaBeans 1.1//EN"

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;->ejb11DTD:Ljava/lang/String;

    invoke-virtual {v1, v3, v4}, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;->registerDTD(Ljava/lang/String;Ljava/lang/String;)V

    .line 373
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;->getConfig()Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;

    move-result-object v3

    iget-object v3, v3, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;->dtdLocations:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 374
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$DTDLocation;

    .line 376
    .local v0, "dtdLocation":Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$DTDLocation;
    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$DTDLocation;->getPublicId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$DTDLocation;->getLocation()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;->registerDTD(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 379
    .end local v0    # "dtdLocation":Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$DTDLocation;
    :cond_0
    return-object v1
.end method

.method protected getOptions()Ljava/lang/String;
    .locals 3

    .prologue
    .line 496
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 498
    .local v0, "options":Ljava/lang/StringBuffer;
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;->dbVendor:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 499
    const-string/jumbo v1, " -dbvendor "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;->dbVendor:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 501
    :cond_0
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;->dbName:Ljava/lang/String;

    if-eqz v1, :cond_1

    .line 502
    const-string/jumbo v1, " -dbname \""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;->dbName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, "\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 505
    :cond_1
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;->dbSchema:Ljava/lang/String;

    if-eqz v1, :cond_2

    .line 506
    const-string/jumbo v1, " -dbschema \""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;->dbSchema:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, "\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 509
    :cond_2
    iget-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;->codegen:Z

    if-eqz v1, :cond_3

    .line 510
    const-string/jumbo v1, " -codegen"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 513
    :cond_3
    iget-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;->quiet:Z

    if-eqz v1, :cond_4

    .line 514
    const-string/jumbo v1, " -quiet"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 517
    :cond_4
    iget-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;->novalidate:Z

    if-eqz v1, :cond_5

    .line 518
    const-string/jumbo v1, " -novalidate"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 521
    :cond_5
    iget-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;->nowarn:Z

    if-eqz v1, :cond_6

    .line 522
    const-string/jumbo v1, " -nowarn"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 525
    :cond_6
    iget-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;->noinform:Z

    if-eqz v1, :cond_7

    .line 526
    const-string/jumbo v1, " -noinform"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 529
    :cond_7
    iget-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;->trace:Z

    if-eqz v1, :cond_8

    .line 530
    const-string/jumbo v1, " -trace"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 533
    :cond_8
    iget-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;->use35MappingRules:Z

    if-eqz v1, :cond_9

    .line 534
    const-string/jumbo v1, " -35"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 537
    :cond_9
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;->rmicOptions:Ljava/lang/String;

    if-eqz v1, :cond_a

    .line 538
    const-string/jumbo v1, " -rmic \""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;->rmicOptions:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, "\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 541
    :cond_a
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method getVendorOutputJarFile(Ljava/lang/String;)Ljava/io/File;
    .locals 4
    .param p1, "baseName"    # Ljava/lang/String;

    .prologue
    .line 485
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;->getDestDir()Ljava/io/File;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;->jarSuffix:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v0
.end method

.method protected getWebsphereDescriptorHandler(Ljava/io/File;)Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;
    .locals 5
    .param p1, "srcDir"    # Ljava/io/File;

    .prologue
    .line 389
    new-instance v1, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool$1;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;->getTask()Lorg/apache/tools/ant/Task;

    move-result-object v3

    invoke-direct {v1, p0, v3, p1}, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool$1;-><init>(Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;Lorg/apache/tools/ant/Task;Ljava/io/File;)V

    .line 395
    .local v1, "handler":Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;->getConfig()Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;

    move-result-object v3

    iget-object v3, v3, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;->dtdLocations:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 396
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$DTDLocation;

    .line 398
    .local v0, "dtdLocation":Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$DTDLocation;
    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$DTDLocation;->getPublicId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$DTDLocation;->getLocation()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;->registerDTD(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 400
    .end local v0    # "dtdLocation":Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$DTDLocation;
    :cond_0
    return-object v1
.end method

.method protected isRebuildRequired(Ljava/io/File;Ljava/io/File;)Z
    .locals 38
    .param p1, "genericJarFile"    # Ljava/io/File;
    .param p2, "websphereJarFile"    # Ljava/io/File;

    .prologue
    .line 680
    const/16 v26, 0x0

    .line 682
    .local v26, "rebuild":Z
    const/4 v14, 0x0

    .line 683
    .local v14, "genericJar":Ljava/util/jar/JarFile;
    const/16 v31, 0x0

    .line 684
    .local v31, "wasJar":Ljava/util/jar/JarFile;
    const/16 v24, 0x0

    .line 685
    .local v24, "newwasJarFile":Ljava/io/File;
    const/16 v22, 0x0

    .line 686
    .local v22, "newJarStream":Ljava/util/jar/JarOutputStream;
    const/16 v16, 0x0

    .line 689
    .local v16, "genericLoader":Ljava/lang/ClassLoader;
    :try_start_0
    new-instance v33, Ljava/lang/StringBuffer;

    invoke-direct/range {v33 .. v33}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v34, "Checking if websphere Jar needs to be rebuilt for jar "

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v33

    invoke-virtual/range {p2 .. p2}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v34

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v33

    invoke-virtual/range {v33 .. v33}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v33

    const/16 v34, 0x3

    move-object/from16 v0, p0

    move-object/from16 v1, v33

    move/from16 v2, v34

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;->log(Ljava/lang/String;I)V

    .line 692
    invoke-virtual/range {p1 .. p1}, Ljava/io/File;->exists()Z

    move-result v33

    if-eqz v33, :cond_17

    invoke-virtual/range {p1 .. p1}, Ljava/io/File;->isFile()Z

    move-result v33

    if-eqz v33, :cond_17

    invoke-virtual/range {p2 .. p2}, Ljava/io/File;->exists()Z

    move-result v33

    if-eqz v33, :cond_17

    invoke-virtual/range {p2 .. p2}, Ljava/io/File;->isFile()Z

    move-result v33

    if-eqz v33, :cond_17

    .line 695
    new-instance v15, Ljava/util/jar/JarFile;

    move-object/from16 v0, p1

    invoke-direct {v15, v0}, Ljava/util/jar/JarFile;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_f
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_c
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 696
    .end local v14    # "genericJar":Ljava/util/jar/JarFile;
    .local v15, "genericJar":Ljava/util/jar/JarFile;
    :try_start_1
    new-instance v32, Ljava/util/jar/JarFile;

    move-object/from16 v0, v32

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Ljava/util/jar/JarFile;-><init>(Ljava/io/File;)V
    :try_end_1
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1 .. :try_end_1} :catch_10
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_d
    .catchall {:try_start_1 .. :try_end_1} :catchall_3

    .line 698
    .end local v31    # "wasJar":Ljava/util/jar/JarFile;
    .local v32, "wasJar":Ljava/util/jar/JarFile;
    :try_start_2
    new-instance v12, Ljava/util/Hashtable;

    invoke-direct {v12}, Ljava/util/Hashtable;-><init>()V

    .line 699
    .local v12, "genericEntries":Ljava/util/Hashtable;
    new-instance v29, Ljava/util/Hashtable;

    invoke-direct/range {v29 .. v29}, Ljava/util/Hashtable;-><init>()V

    .line 700
    .local v29, "wasEntries":Ljava/util/Hashtable;
    new-instance v28, Ljava/util/Hashtable;

    invoke-direct/range {v28 .. v28}, Ljava/util/Hashtable;-><init>()V

    .line 703
    .local v28, "replaceEntries":Ljava/util/Hashtable;
    invoke-virtual {v15}, Ljava/util/jar/JarFile;->entries()Ljava/util/Enumeration;

    move-result-object v9

    .local v9, "e":Ljava/util/Enumeration;
    :goto_0
    invoke-interface {v9}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v33

    if-eqz v33, :cond_4

    .line 704
    invoke-interface {v9}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Ljava/util/jar/JarEntry;

    .line 706
    .local v19, "je":Ljava/util/jar/JarEntry;
    invoke-virtual/range {v19 .. v19}, Ljava/util/jar/JarEntry;->getName()Ljava/lang/String;

    move-result-object v33

    const/16 v34, 0x5c

    const/16 v35, 0x2f

    invoke-virtual/range {v33 .. v35}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v33

    move-object/from16 v0, v33

    move-object/from16 v1, v19

    invoke-virtual {v12, v0, v1}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2
    .catch Ljava/lang/ClassNotFoundException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    goto :goto_0

    .line 820
    .end local v9    # "e":Ljava/util/Enumeration;
    .end local v12    # "genericEntries":Ljava/util/Hashtable;
    .end local v19    # "je":Ljava/util/jar/JarEntry;
    .end local v28    # "replaceEntries":Ljava/util/Hashtable;
    .end local v29    # "wasEntries":Ljava/util/Hashtable;
    :catch_0
    move-exception v7

    move-object/from16 v31, v32

    .end local v32    # "wasJar":Ljava/util/jar/JarFile;
    .restart local v31    # "wasJar":Ljava/util/jar/JarFile;
    move-object v14, v15

    .line 821
    .end local v15    # "genericJar":Ljava/util/jar/JarFile;
    .local v7, "cnfe":Ljava/lang/ClassNotFoundException;
    .restart local v14    # "genericJar":Ljava/util/jar/JarFile;
    :goto_1
    :try_start_3
    new-instance v33, Ljava/lang/StringBuffer;

    invoke-direct/range {v33 .. v33}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v34, "ClassNotFoundException while processing ejb-jar file. Details: "

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v33

    invoke-virtual {v7}, Ljava/lang/ClassNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v34

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v33

    invoke-virtual/range {v33 .. v33}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    .line 825
    .local v8, "cnfmsg":Ljava/lang/String;
    new-instance v33, Lorg/apache/tools/ant/BuildException;

    move-object/from16 v0, v33

    invoke-direct {v0, v8, v7}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v33
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 834
    .end local v7    # "cnfe":Ljava/lang/ClassNotFoundException;
    .end local v8    # "cnfmsg":Ljava/lang/String;
    :catchall_0
    move-exception v33

    :goto_2
    if-eqz v14, :cond_0

    .line 836
    :try_start_4
    invoke-virtual {v14}, Ljava/util/jar/JarFile;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_4

    .line 842
    :cond_0
    :goto_3
    if-eqz v31, :cond_1

    .line 844
    :try_start_5
    invoke-virtual/range {v31 .. v31}, Ljava/util/jar/JarFile;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_5

    .line 850
    :cond_1
    :goto_4
    if-eqz v22, :cond_2

    .line 852
    :try_start_6
    invoke-virtual/range {v22 .. v22}, Ljava/util/jar/JarOutputStream;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_6

    .line 858
    :goto_5
    :try_start_7
    sget-object v34, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    move-object/from16 v0, v34

    move-object/from16 v1, v24

    move-object/from16 v2, p2

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/util/FileUtils;->rename(Ljava/io/File;Ljava/io/File;)V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_7

    .line 864
    :cond_2
    :goto_6
    if-eqz v16, :cond_3

    move-object/from16 v0, v16

    instance-of v0, v0, Lorg/apache/tools/ant/AntClassLoader;

    move/from16 v34, v0

    if-eqz v34, :cond_3

    move-object/from16 v20, v16

    .line 866
    check-cast v20, Lorg/apache/tools/ant/AntClassLoader;

    .line 867
    .local v20, "loader":Lorg/apache/tools/ant/AntClassLoader;
    invoke-virtual/range {v20 .. v20}, Lorg/apache/tools/ant/AntClassLoader;->cleanup()V

    .line 834
    .end local v20    # "loader":Lorg/apache/tools/ant/AntClassLoader;
    :cond_3
    throw v33

    .line 709
    .end local v14    # "genericJar":Ljava/util/jar/JarFile;
    .end local v31    # "wasJar":Ljava/util/jar/JarFile;
    .restart local v9    # "e":Ljava/util/Enumeration;
    .restart local v12    # "genericEntries":Ljava/util/Hashtable;
    .restart local v15    # "genericJar":Ljava/util/jar/JarFile;
    .restart local v28    # "replaceEntries":Ljava/util/Hashtable;
    .restart local v29    # "wasEntries":Ljava/util/Hashtable;
    .restart local v32    # "wasJar":Ljava/util/jar/JarFile;
    :cond_4
    :try_start_8
    invoke-virtual/range {v32 .. v32}, Ljava/util/jar/JarFile;->entries()Ljava/util/Enumeration;

    move-result-object v9

    :goto_7
    invoke-interface {v9}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v33

    if-eqz v33, :cond_5

    .line 710
    invoke-interface {v9}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Ljava/util/jar/JarEntry;

    .line 712
    .restart local v19    # "je":Ljava/util/jar/JarEntry;
    invoke-virtual/range {v19 .. v19}, Ljava/util/jar/JarEntry;->getName()Ljava/lang/String;

    move-result-object v33

    move-object/from16 v0, v29

    move-object/from16 v1, v33

    move-object/from16 v2, v19

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_8
    .catch Ljava/lang/ClassNotFoundException; {:try_start_8 .. :try_end_8} :catch_0
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_1
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    goto :goto_7

    .line 826
    .end local v9    # "e":Ljava/util/Enumeration;
    .end local v12    # "genericEntries":Ljava/util/Hashtable;
    .end local v19    # "je":Ljava/util/jar/JarEntry;
    .end local v28    # "replaceEntries":Ljava/util/Hashtable;
    .end local v29    # "wasEntries":Ljava/util/Hashtable;
    :catch_1
    move-exception v17

    move-object/from16 v31, v32

    .end local v32    # "wasJar":Ljava/util/jar/JarFile;
    .restart local v31    # "wasJar":Ljava/util/jar/JarFile;
    move-object v14, v15

    .line 827
    .end local v15    # "genericJar":Ljava/util/jar/JarFile;
    .restart local v14    # "genericJar":Ljava/util/jar/JarFile;
    .local v17, "ioe":Ljava/io/IOException;
    :goto_8
    :try_start_9
    new-instance v33, Ljava/lang/StringBuffer;

    invoke-direct/range {v33 .. v33}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v34, "IOException while processing ejb-jar file . Details: "

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v33

    invoke-virtual/range {v17 .. v17}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v34

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v33

    invoke-virtual/range {v33 .. v33}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v21

    .line 831
    .local v21, "msg":Ljava/lang/String;
    new-instance v33, Lorg/apache/tools/ant/BuildException;

    move-object/from16 v0, v33

    move-object/from16 v1, v21

    move-object/from16 v2, v17

    invoke-direct {v0, v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v33
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    .line 716
    .end local v14    # "genericJar":Ljava/util/jar/JarFile;
    .end local v17    # "ioe":Ljava/io/IOException;
    .end local v21    # "msg":Ljava/lang/String;
    .end local v31    # "wasJar":Ljava/util/jar/JarFile;
    .restart local v9    # "e":Ljava/util/Enumeration;
    .restart local v12    # "genericEntries":Ljava/util/Hashtable;
    .restart local v15    # "genericJar":Ljava/util/jar/JarFile;
    .restart local v28    # "replaceEntries":Ljava/util/Hashtable;
    .restart local v29    # "wasEntries":Ljava/util/Hashtable;
    .restart local v32    # "wasJar":Ljava/util/jar/JarFile;
    :cond_5
    :try_start_a
    invoke-virtual/range {p0 .. p1}, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;->getClassLoaderFromJar(Ljava/io/File;)Ljava/lang/ClassLoader;

    move-result-object v16

    .line 718
    invoke-virtual {v12}, Ljava/util/Hashtable;->keys()Ljava/util/Enumeration;

    move-result-object v9

    :cond_6
    :goto_9
    invoke-interface {v9}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v33

    if-eqz v33, :cond_8

    .line 719
    invoke-interface {v9}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    .line 721
    .local v10, "filepath":Ljava/lang/String;
    move-object/from16 v0, v29

    invoke-virtual {v0, v10}, Ljava/util/Hashtable;->containsKey(Ljava/lang/Object;)Z

    move-result v33

    if-eqz v33, :cond_d

    .line 724
    invoke-virtual {v12, v10}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/util/jar/JarEntry;

    .line 725
    .local v13, "genericEntry":Ljava/util/jar/JarEntry;
    move-object/from16 v0, v29

    invoke-virtual {v0, v10}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v30

    check-cast v30, Ljava/util/jar/JarEntry;

    .line 727
    .local v30, "wasEntry":Ljava/util/jar/JarEntry;
    invoke-virtual {v13}, Ljava/util/jar/JarEntry;->getCrc()J

    move-result-wide v34

    invoke-virtual/range {v30 .. v30}, Ljava/util/jar/JarEntry;->getCrc()J

    move-result-wide v36

    cmp-long v33, v34, v36

    if-nez v33, :cond_7

    invoke-virtual {v13}, Ljava/util/jar/JarEntry;->getSize()J

    move-result-wide v34

    invoke-virtual/range {v30 .. v30}, Ljava/util/jar/JarEntry;->getSize()J

    move-result-wide v36

    cmp-long v33, v34, v36

    if-eqz v33, :cond_6

    .line 730
    :cond_7
    invoke-virtual {v13}, Ljava/util/jar/JarEntry;->getName()Ljava/lang/String;

    move-result-object v33

    const-string/jumbo v34, ".class"

    invoke-virtual/range {v33 .. v34}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v33

    if-eqz v33, :cond_c

    .line 732
    invoke-virtual {v13}, Ljava/util/jar/JarEntry;->getName()Ljava/lang/String;

    move-result-object v33

    sget-char v34, Ljava/io/File;->separatorChar:C

    const/16 v35, 0x2e

    invoke-virtual/range {v33 .. v35}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v6

    .line 735
    .local v6, "classname":Ljava/lang/String;
    const/16 v33, 0x0

    const-string/jumbo v34, ".class"

    move-object/from16 v0, v34

    invoke-virtual {v6, v0}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v34

    move/from16 v0, v33

    move/from16 v1, v34

    invoke-virtual {v6, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    .line 737
    move-object/from16 v0, v16

    invoke-virtual {v0, v6}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v11

    .line 739
    .local v11, "genclass":Ljava/lang/Class;
    invoke-virtual {v11}, Ljava/lang/Class;->isInterface()Z

    move-result v33

    if-eqz v33, :cond_b

    .line 741
    new-instance v33, Ljava/lang/StringBuffer;

    invoke-direct/range {v33 .. v33}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v34, "Interface "

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v33

    invoke-virtual {v11}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v34

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v33

    const-string/jumbo v34, " has changed"

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v33

    invoke-virtual/range {v33 .. v33}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v33

    const/16 v34, 0x3

    move-object/from16 v0, p0

    move-object/from16 v1, v33

    move/from16 v2, v34

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;->log(Ljava/lang/String;I)V

    .line 743
    const/16 v26, 0x1

    .line 770
    .end local v6    # "classname":Ljava/lang/String;
    .end local v10    # "filepath":Ljava/lang/String;
    .end local v11    # "genclass":Ljava/lang/Class;
    .end local v13    # "genericEntry":Ljava/util/jar/JarEntry;
    .end local v30    # "wasEntry":Ljava/util/jar/JarEntry;
    :cond_8
    :goto_a
    if-nez v26, :cond_16

    .line 771
    const-string/jumbo v33, "No rebuild needed - updating jar"

    const/16 v34, 0x3

    move-object/from16 v0, p0

    move-object/from16 v1, v33

    move/from16 v2, v34

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;->log(Ljava/lang/String;I)V

    .line 772
    new-instance v25, Ljava/io/File;

    new-instance v33, Ljava/lang/StringBuffer;

    invoke-direct/range {v33 .. v33}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual/range {p2 .. p2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v34

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v33

    const-string/jumbo v34, ".temp"

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v33

    invoke-virtual/range {v33 .. v33}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v33

    move-object/from16 v0, v25

    move-object/from16 v1, v33

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V
    :try_end_a
    .catch Ljava/lang/ClassNotFoundException; {:try_start_a .. :try_end_a} :catch_0
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_1
    .catchall {:try_start_a .. :try_end_a} :catchall_1

    .line 773
    .end local v24    # "newwasJarFile":Ljava/io/File;
    .local v25, "newwasJarFile":Ljava/io/File;
    :try_start_b
    invoke-virtual/range {v25 .. v25}, Ljava/io/File;->exists()Z

    move-result v33

    if-eqz v33, :cond_9

    .line 774
    invoke-virtual/range {v25 .. v25}, Ljava/io/File;->delete()Z

    .line 777
    :cond_9
    new-instance v23, Ljava/util/jar/JarOutputStream;

    new-instance v33, Ljava/io/FileOutputStream;

    move-object/from16 v0, v33

    move-object/from16 v1, v25

    invoke-direct {v0, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    move-object/from16 v0, v23

    move-object/from16 v1, v33

    invoke-direct {v0, v1}, Ljava/util/jar/JarOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_b
    .catch Ljava/lang/ClassNotFoundException; {:try_start_b .. :try_end_b} :catch_11
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_b} :catch_e
    .catchall {:try_start_b .. :try_end_b} :catchall_4

    .line 778
    .end local v22    # "newJarStream":Ljava/util/jar/JarOutputStream;
    .local v23, "newJarStream":Ljava/util/jar/JarOutputStream;
    const/16 v33, 0x0

    :try_start_c
    move-object/from16 v0, v23

    move/from16 v1, v33

    invoke-virtual {v0, v1}, Ljava/util/jar/JarOutputStream;->setLevel(I)V

    .line 781
    invoke-virtual/range {v29 .. v29}, Ljava/util/Hashtable;->elements()Ljava/util/Enumeration;

    move-result-object v9

    :goto_b
    invoke-interface {v9}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v33

    if-eqz v33, :cond_11

    .line 782
    const/16 v33, 0x400

    move/from16 v0, v33

    new-array v4, v0, [B

    .line 785
    .local v4, "buffer":[B
    invoke-interface {v9}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Ljava/util/jar/JarEntry;

    .line 787
    .restart local v19    # "je":Ljava/util/jar/JarEntry;
    invoke-virtual/range {v19 .. v19}, Ljava/util/jar/JarEntry;->getCompressedSize()J

    move-result-wide v34

    const-wide/16 v36, -0x1

    cmp-long v33, v34, v36

    if-eqz v33, :cond_a

    invoke-virtual/range {v19 .. v19}, Ljava/util/jar/JarEntry;->getCompressedSize()J

    move-result-wide v34

    invoke-virtual/range {v19 .. v19}, Ljava/util/jar/JarEntry;->getSize()J

    move-result-wide v36

    cmp-long v33, v34, v36

    if-nez v33, :cond_e

    .line 789
    :cond_a
    const/16 v33, 0x0

    move-object/from16 v0, v23

    move/from16 v1, v33

    invoke-virtual {v0, v1}, Ljava/util/jar/JarOutputStream;->setLevel(I)V

    .line 795
    :goto_c
    invoke-virtual/range {v19 .. v19}, Ljava/util/jar/JarEntry;->getName()Ljava/lang/String;

    move-result-object v33

    move-object/from16 v0, v28

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Ljava/util/Hashtable;->containsKey(Ljava/lang/Object;)Z

    move-result v33

    if-eqz v33, :cond_f

    .line 796
    new-instance v33, Ljava/lang/StringBuffer;

    invoke-direct/range {v33 .. v33}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v34, "Updating Bean class from generic Jar "

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v33

    invoke-virtual/range {v19 .. v19}, Ljava/util/jar/JarEntry;->getName()Ljava/lang/String;

    move-result-object v34

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v33

    invoke-virtual/range {v33 .. v33}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v33

    const/16 v34, 0x3

    move-object/from16 v0, p0

    move-object/from16 v1, v33

    move/from16 v2, v34

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;->log(Ljava/lang/String;I)V

    .line 799
    invoke-virtual/range {v19 .. v19}, Ljava/util/jar/JarEntry;->getName()Ljava/lang/String;

    move-result-object v33

    move-object/from16 v0, v28

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v19

    .end local v19    # "je":Ljava/util/jar/JarEntry;
    check-cast v19, Ljava/util/jar/JarEntry;

    .line 800
    .restart local v19    # "je":Ljava/util/jar/JarEntry;
    move-object/from16 v0, v19

    invoke-virtual {v15, v0}, Ljava/util/jar/JarFile;->getInputStream(Ljava/util/zip/ZipEntry;)Ljava/io/InputStream;

    move-result-object v18

    .line 806
    .local v18, "is":Ljava/io/InputStream;
    :goto_d
    new-instance v33, Ljava/util/jar/JarEntry;

    invoke-virtual/range {v19 .. v19}, Ljava/util/jar/JarEntry;->getName()Ljava/lang/String;

    move-result-object v34

    invoke-direct/range {v33 .. v34}, Ljava/util/jar/JarEntry;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v23

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Ljava/util/jar/JarOutputStream;->putNextEntry(Ljava/util/zip/ZipEntry;)V

    .line 808
    :goto_e
    move-object/from16 v0, v18

    invoke-virtual {v0, v4}, Ljava/io/InputStream;->read([B)I

    move-result v5

    .local v5, "bytesRead":I
    const/16 v33, -0x1

    move/from16 v0, v33

    if-eq v5, v0, :cond_10

    .line 809
    const/16 v33, 0x0

    move-object/from16 v0, v23

    move/from16 v1, v33

    invoke-virtual {v0, v4, v1, v5}, Ljava/util/jar/JarOutputStream;->write([BII)V
    :try_end_c
    .catch Ljava/lang/ClassNotFoundException; {:try_start_c .. :try_end_c} :catch_2
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_c} :catch_3
    .catchall {:try_start_c .. :try_end_c} :catchall_2

    goto :goto_e

    .line 820
    .end local v4    # "buffer":[B
    .end local v5    # "bytesRead":I
    .end local v18    # "is":Ljava/io/InputStream;
    .end local v19    # "je":Ljava/util/jar/JarEntry;
    :catch_2
    move-exception v7

    move-object/from16 v22, v23

    .end local v23    # "newJarStream":Ljava/util/jar/JarOutputStream;
    .restart local v22    # "newJarStream":Ljava/util/jar/JarOutputStream;
    move-object/from16 v24, v25

    .end local v25    # "newwasJarFile":Ljava/io/File;
    .restart local v24    # "newwasJarFile":Ljava/io/File;
    move-object/from16 v31, v32

    .end local v32    # "wasJar":Ljava/util/jar/JarFile;
    .restart local v31    # "wasJar":Ljava/util/jar/JarFile;
    move-object v14, v15

    .end local v15    # "genericJar":Ljava/util/jar/JarFile;
    .restart local v14    # "genericJar":Ljava/util/jar/JarFile;
    goto/16 :goto_1

    .line 747
    .end local v14    # "genericJar":Ljava/util/jar/JarFile;
    .end local v31    # "wasJar":Ljava/util/jar/JarFile;
    .restart local v6    # "classname":Ljava/lang/String;
    .restart local v10    # "filepath":Ljava/lang/String;
    .restart local v11    # "genclass":Ljava/lang/Class;
    .restart local v13    # "genericEntry":Ljava/util/jar/JarEntry;
    .restart local v15    # "genericJar":Ljava/util/jar/JarFile;
    .restart local v30    # "wasEntry":Ljava/util/jar/JarEntry;
    .restart local v32    # "wasJar":Ljava/util/jar/JarFile;
    :cond_b
    :try_start_d
    move-object/from16 v0, v28

    invoke-virtual {v0, v10, v13}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_9

    .line 834
    .end local v6    # "classname":Ljava/lang/String;
    .end local v9    # "e":Ljava/util/Enumeration;
    .end local v10    # "filepath":Ljava/lang/String;
    .end local v11    # "genclass":Ljava/lang/Class;
    .end local v12    # "genericEntries":Ljava/util/Hashtable;
    .end local v13    # "genericEntry":Ljava/util/jar/JarEntry;
    .end local v28    # "replaceEntries":Ljava/util/Hashtable;
    .end local v29    # "wasEntries":Ljava/util/Hashtable;
    .end local v30    # "wasEntry":Ljava/util/jar/JarEntry;
    :catchall_1
    move-exception v33

    move-object/from16 v31, v32

    .end local v32    # "wasJar":Ljava/util/jar/JarFile;
    .restart local v31    # "wasJar":Ljava/util/jar/JarFile;
    move-object v14, v15

    .end local v15    # "genericJar":Ljava/util/jar/JarFile;
    .restart local v14    # "genericJar":Ljava/util/jar/JarFile;
    goto/16 :goto_2

    .line 751
    .end local v14    # "genericJar":Ljava/util/jar/JarFile;
    .end local v31    # "wasJar":Ljava/util/jar/JarFile;
    .restart local v9    # "e":Ljava/util/Enumeration;
    .restart local v10    # "filepath":Ljava/lang/String;
    .restart local v12    # "genericEntries":Ljava/util/Hashtable;
    .restart local v13    # "genericEntry":Ljava/util/jar/JarEntry;
    .restart local v15    # "genericJar":Ljava/util/jar/JarFile;
    .restart local v28    # "replaceEntries":Ljava/util/Hashtable;
    .restart local v29    # "wasEntries":Ljava/util/Hashtable;
    .restart local v30    # "wasEntry":Ljava/util/jar/JarEntry;
    .restart local v32    # "wasJar":Ljava/util/jar/JarFile;
    :cond_c
    invoke-virtual {v13}, Ljava/util/jar/JarEntry;->getName()Ljava/lang/String;

    move-result-object v33

    const-string/jumbo v34, "META-INF/MANIFEST.MF"

    invoke-virtual/range {v33 .. v34}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v33

    if-nez v33, :cond_8

    .line 753
    new-instance v33, Ljava/lang/StringBuffer;

    invoke-direct/range {v33 .. v33}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v34, "Non class file "

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v33

    invoke-virtual {v13}, Ljava/util/jar/JarEntry;->getName()Ljava/lang/String;

    move-result-object v34

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v33

    const-string/jumbo v34, " has changed"

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v33

    invoke-virtual/range {v33 .. v33}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v33

    const/16 v34, 0x3

    move-object/from16 v0, p0

    move-object/from16 v1, v33

    move/from16 v2, v34

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;->log(Ljava/lang/String;I)V

    .line 755
    const/16 v26, 0x1

    goto/16 :goto_a

    .line 763
    .end local v13    # "genericEntry":Ljava/util/jar/JarEntry;
    .end local v30    # "wasEntry":Ljava/util/jar/JarEntry;
    :cond_d
    new-instance v33, Ljava/lang/StringBuffer;

    invoke-direct/range {v33 .. v33}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v34, "File "

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v33

    move-object/from16 v0, v33

    invoke-virtual {v0, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v33

    const-string/jumbo v34, " not present in websphere jar"

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v33

    invoke-virtual/range {v33 .. v33}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v33

    const/16 v34, 0x3

    move-object/from16 v0, p0

    move-object/from16 v1, v33

    move/from16 v2, v34

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;->log(Ljava/lang/String;I)V
    :try_end_d
    .catch Ljava/lang/ClassNotFoundException; {:try_start_d .. :try_end_d} :catch_0
    .catch Ljava/io/IOException; {:try_start_d .. :try_end_d} :catch_1
    .catchall {:try_start_d .. :try_end_d} :catchall_1

    .line 765
    const/16 v26, 0x1

    .line 766
    goto/16 :goto_a

    .line 791
    .end local v10    # "filepath":Ljava/lang/String;
    .end local v22    # "newJarStream":Ljava/util/jar/JarOutputStream;
    .end local v24    # "newwasJarFile":Ljava/io/File;
    .restart local v4    # "buffer":[B
    .restart local v19    # "je":Ljava/util/jar/JarEntry;
    .restart local v23    # "newJarStream":Ljava/util/jar/JarOutputStream;
    .restart local v25    # "newwasJarFile":Ljava/io/File;
    :cond_e
    const/16 v33, 0x9

    :try_start_e
    move-object/from16 v0, v23

    move/from16 v1, v33

    invoke-virtual {v0, v1}, Ljava/util/jar/JarOutputStream;->setLevel(I)V

    goto/16 :goto_c

    .line 826
    .end local v4    # "buffer":[B
    .end local v19    # "je":Ljava/util/jar/JarEntry;
    :catch_3
    move-exception v17

    move-object/from16 v22, v23

    .end local v23    # "newJarStream":Ljava/util/jar/JarOutputStream;
    .restart local v22    # "newJarStream":Ljava/util/jar/JarOutputStream;
    move-object/from16 v24, v25

    .end local v25    # "newwasJarFile":Ljava/io/File;
    .restart local v24    # "newwasJarFile":Ljava/io/File;
    move-object/from16 v31, v32

    .end local v32    # "wasJar":Ljava/util/jar/JarFile;
    .restart local v31    # "wasJar":Ljava/util/jar/JarFile;
    move-object v14, v15

    .end local v15    # "genericJar":Ljava/util/jar/JarFile;
    .restart local v14    # "genericJar":Ljava/util/jar/JarFile;
    goto/16 :goto_8

    .line 804
    .end local v14    # "genericJar":Ljava/util/jar/JarFile;
    .end local v22    # "newJarStream":Ljava/util/jar/JarOutputStream;
    .end local v24    # "newwasJarFile":Ljava/io/File;
    .end local v31    # "wasJar":Ljava/util/jar/JarFile;
    .restart local v4    # "buffer":[B
    .restart local v15    # "genericJar":Ljava/util/jar/JarFile;
    .restart local v19    # "je":Ljava/util/jar/JarEntry;
    .restart local v23    # "newJarStream":Ljava/util/jar/JarOutputStream;
    .restart local v25    # "newwasJarFile":Ljava/io/File;
    .restart local v32    # "wasJar":Ljava/util/jar/JarFile;
    :cond_f
    move-object/from16 v0, v32

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/util/jar/JarFile;->getInputStream(Ljava/util/zip/ZipEntry;)Ljava/io/InputStream;

    move-result-object v18

    .restart local v18    # "is":Ljava/io/InputStream;
    goto/16 :goto_d

    .line 811
    .restart local v5    # "bytesRead":I
    :cond_10
    invoke-virtual/range {v18 .. v18}, Ljava/io/InputStream;->close()V
    :try_end_e
    .catch Ljava/lang/ClassNotFoundException; {:try_start_e .. :try_end_e} :catch_2
    .catch Ljava/io/IOException; {:try_start_e .. :try_end_e} :catch_3
    .catchall {:try_start_e .. :try_end_e} :catchall_2

    goto/16 :goto_b

    .line 834
    .end local v4    # "buffer":[B
    .end local v5    # "bytesRead":I
    .end local v18    # "is":Ljava/io/InputStream;
    .end local v19    # "je":Ljava/util/jar/JarEntry;
    :catchall_2
    move-exception v33

    move-object/from16 v22, v23

    .end local v23    # "newJarStream":Ljava/util/jar/JarOutputStream;
    .restart local v22    # "newJarStream":Ljava/util/jar/JarOutputStream;
    move-object/from16 v24, v25

    .end local v25    # "newwasJarFile":Ljava/io/File;
    .restart local v24    # "newwasJarFile":Ljava/io/File;
    move-object/from16 v31, v32

    .end local v32    # "wasJar":Ljava/util/jar/JarFile;
    .restart local v31    # "wasJar":Ljava/util/jar/JarFile;
    move-object v14, v15

    .end local v15    # "genericJar":Ljava/util/jar/JarFile;
    .restart local v14    # "genericJar":Ljava/util/jar/JarFile;
    goto/16 :goto_2

    .end local v14    # "genericJar":Ljava/util/jar/JarFile;
    .end local v22    # "newJarStream":Ljava/util/jar/JarOutputStream;
    .end local v24    # "newwasJarFile":Ljava/io/File;
    .end local v31    # "wasJar":Ljava/util/jar/JarFile;
    .restart local v15    # "genericJar":Ljava/util/jar/JarFile;
    .restart local v23    # "newJarStream":Ljava/util/jar/JarOutputStream;
    .restart local v25    # "newwasJarFile":Ljava/io/File;
    .restart local v32    # "wasJar":Ljava/util/jar/JarFile;
    :cond_11
    move-object/from16 v22, v23

    .end local v23    # "newJarStream":Ljava/util/jar/JarOutputStream;
    .restart local v22    # "newJarStream":Ljava/util/jar/JarOutputStream;
    move-object/from16 v24, v25

    .end local v25    # "newwasJarFile":Ljava/io/File;
    .restart local v24    # "newwasJarFile":Ljava/io/File;
    :goto_f
    move-object/from16 v31, v32

    .end local v32    # "wasJar":Ljava/util/jar/JarFile;
    .restart local v31    # "wasJar":Ljava/util/jar/JarFile;
    move-object v14, v15

    .end local v9    # "e":Ljava/util/Enumeration;
    .end local v12    # "genericEntries":Ljava/util/Hashtable;
    .end local v15    # "genericJar":Ljava/util/jar/JarFile;
    .end local v28    # "replaceEntries":Ljava/util/Hashtable;
    .end local v29    # "wasEntries":Ljava/util/Hashtable;
    .restart local v14    # "genericJar":Ljava/util/jar/JarFile;
    :goto_10
    if-eqz v14, :cond_12

    .line 836
    :try_start_f
    invoke-virtual {v14}, Ljava/util/jar/JarFile;->close()V
    :try_end_f
    .catch Ljava/io/IOException; {:try_start_f .. :try_end_f} :catch_8

    .line 842
    :cond_12
    :goto_11
    if-eqz v31, :cond_13

    .line 844
    :try_start_10
    invoke-virtual/range {v31 .. v31}, Ljava/util/jar/JarFile;->close()V
    :try_end_10
    .catch Ljava/io/IOException; {:try_start_10 .. :try_end_10} :catch_9

    .line 850
    :cond_13
    :goto_12
    if-eqz v22, :cond_14

    .line 852
    :try_start_11
    invoke-virtual/range {v22 .. v22}, Ljava/util/jar/JarOutputStream;->close()V
    :try_end_11
    .catch Ljava/io/IOException; {:try_start_11 .. :try_end_11} :catch_a

    .line 858
    :goto_13
    :try_start_12
    sget-object v33, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    move-object/from16 v0, v33

    move-object/from16 v1, v24

    move-object/from16 v2, p2

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/util/FileUtils;->rename(Ljava/io/File;Ljava/io/File;)V
    :try_end_12
    .catch Ljava/io/IOException; {:try_start_12 .. :try_end_12} :catch_b

    .line 864
    :cond_14
    :goto_14
    if-eqz v16, :cond_15

    move-object/from16 v0, v16

    instance-of v0, v0, Lorg/apache/tools/ant/AntClassLoader;

    move/from16 v33, v0

    if-eqz v33, :cond_15

    move-object/from16 v20, v16

    .line 866
    check-cast v20, Lorg/apache/tools/ant/AntClassLoader;

    .line 867
    .restart local v20    # "loader":Lorg/apache/tools/ant/AntClassLoader;
    invoke-virtual/range {v20 .. v20}, Lorg/apache/tools/ant/AntClassLoader;->cleanup()V

    .line 871
    .end local v20    # "loader":Lorg/apache/tools/ant/AntClassLoader;
    :cond_15
    return v26

    .line 814
    .end local v14    # "genericJar":Ljava/util/jar/JarFile;
    .end local v31    # "wasJar":Ljava/util/jar/JarFile;
    .restart local v9    # "e":Ljava/util/Enumeration;
    .restart local v12    # "genericEntries":Ljava/util/Hashtable;
    .restart local v15    # "genericJar":Ljava/util/jar/JarFile;
    .restart local v28    # "replaceEntries":Ljava/util/Hashtable;
    .restart local v29    # "wasEntries":Ljava/util/Hashtable;
    .restart local v32    # "wasJar":Ljava/util/jar/JarFile;
    :cond_16
    :try_start_13
    const-string/jumbo v33, "websphere Jar rebuild needed due to changed interface or XML"

    const/16 v34, 0x3

    move-object/from16 v0, p0

    move-object/from16 v1, v33

    move/from16 v2, v34

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;->log(Ljava/lang/String;I)V
    :try_end_13
    .catch Ljava/lang/ClassNotFoundException; {:try_start_13 .. :try_end_13} :catch_0
    .catch Ljava/io/IOException; {:try_start_13 .. :try_end_13} :catch_1
    .catchall {:try_start_13 .. :try_end_13} :catchall_1

    goto :goto_f

    .line 818
    .end local v9    # "e":Ljava/util/Enumeration;
    .end local v12    # "genericEntries":Ljava/util/Hashtable;
    .end local v15    # "genericJar":Ljava/util/jar/JarFile;
    .end local v28    # "replaceEntries":Ljava/util/Hashtable;
    .end local v29    # "wasEntries":Ljava/util/Hashtable;
    .end local v32    # "wasJar":Ljava/util/jar/JarFile;
    .restart local v14    # "genericJar":Ljava/util/jar/JarFile;
    .restart local v31    # "wasJar":Ljava/util/jar/JarFile;
    :cond_17
    const/16 v26, 0x1

    goto :goto_10

    .line 837
    :catch_4
    move-exception v34

    goto/16 :goto_3

    .line 845
    :catch_5
    move-exception v34

    goto/16 :goto_4

    .line 853
    :catch_6
    move-exception v34

    goto/16 :goto_5

    .line 859
    :catch_7
    move-exception v27

    .line 860
    .local v27, "renameException":Ljava/io/IOException;
    invoke-virtual/range {v27 .. v27}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v34

    const/16 v35, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, v34

    move/from16 v2, v35

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;->log(Ljava/lang/String;I)V

    .line 861
    const/16 v26, 0x1

    goto/16 :goto_6

    .line 837
    .end local v27    # "renameException":Ljava/io/IOException;
    :catch_8
    move-exception v33

    goto :goto_11

    .line 845
    :catch_9
    move-exception v33

    goto :goto_12

    .line 853
    :catch_a
    move-exception v33

    goto :goto_13

    .line 859
    :catch_b
    move-exception v27

    .line 860
    .restart local v27    # "renameException":Ljava/io/IOException;
    invoke-virtual/range {v27 .. v27}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v33

    const/16 v34, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, v33

    move/from16 v2, v34

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;->log(Ljava/lang/String;I)V

    .line 861
    const/16 v26, 0x1

    goto :goto_14

    .line 834
    .end local v14    # "genericJar":Ljava/util/jar/JarFile;
    .end local v27    # "renameException":Ljava/io/IOException;
    .restart local v15    # "genericJar":Ljava/util/jar/JarFile;
    :catchall_3
    move-exception v33

    move-object v14, v15

    .end local v15    # "genericJar":Ljava/util/jar/JarFile;
    .restart local v14    # "genericJar":Ljava/util/jar/JarFile;
    goto/16 :goto_2

    .end local v14    # "genericJar":Ljava/util/jar/JarFile;
    .end local v24    # "newwasJarFile":Ljava/io/File;
    .end local v31    # "wasJar":Ljava/util/jar/JarFile;
    .restart local v9    # "e":Ljava/util/Enumeration;
    .restart local v12    # "genericEntries":Ljava/util/Hashtable;
    .restart local v15    # "genericJar":Ljava/util/jar/JarFile;
    .restart local v25    # "newwasJarFile":Ljava/io/File;
    .restart local v28    # "replaceEntries":Ljava/util/Hashtable;
    .restart local v29    # "wasEntries":Ljava/util/Hashtable;
    .restart local v32    # "wasJar":Ljava/util/jar/JarFile;
    :catchall_4
    move-exception v33

    move-object/from16 v24, v25

    .end local v25    # "newwasJarFile":Ljava/io/File;
    .restart local v24    # "newwasJarFile":Ljava/io/File;
    move-object/from16 v31, v32

    .end local v32    # "wasJar":Ljava/util/jar/JarFile;
    .restart local v31    # "wasJar":Ljava/util/jar/JarFile;
    move-object v14, v15

    .end local v15    # "genericJar":Ljava/util/jar/JarFile;
    .restart local v14    # "genericJar":Ljava/util/jar/JarFile;
    goto/16 :goto_2

    .line 826
    .end local v9    # "e":Ljava/util/Enumeration;
    .end local v12    # "genericEntries":Ljava/util/Hashtable;
    .end local v28    # "replaceEntries":Ljava/util/Hashtable;
    .end local v29    # "wasEntries":Ljava/util/Hashtable;
    :catch_c
    move-exception v17

    goto/16 :goto_8

    .end local v14    # "genericJar":Ljava/util/jar/JarFile;
    .restart local v15    # "genericJar":Ljava/util/jar/JarFile;
    :catch_d
    move-exception v17

    move-object v14, v15

    .end local v15    # "genericJar":Ljava/util/jar/JarFile;
    .restart local v14    # "genericJar":Ljava/util/jar/JarFile;
    goto/16 :goto_8

    .end local v14    # "genericJar":Ljava/util/jar/JarFile;
    .end local v24    # "newwasJarFile":Ljava/io/File;
    .end local v31    # "wasJar":Ljava/util/jar/JarFile;
    .restart local v9    # "e":Ljava/util/Enumeration;
    .restart local v12    # "genericEntries":Ljava/util/Hashtable;
    .restart local v15    # "genericJar":Ljava/util/jar/JarFile;
    .restart local v25    # "newwasJarFile":Ljava/io/File;
    .restart local v28    # "replaceEntries":Ljava/util/Hashtable;
    .restart local v29    # "wasEntries":Ljava/util/Hashtable;
    .restart local v32    # "wasJar":Ljava/util/jar/JarFile;
    :catch_e
    move-exception v17

    move-object/from16 v24, v25

    .end local v25    # "newwasJarFile":Ljava/io/File;
    .restart local v24    # "newwasJarFile":Ljava/io/File;
    move-object/from16 v31, v32

    .end local v32    # "wasJar":Ljava/util/jar/JarFile;
    .restart local v31    # "wasJar":Ljava/util/jar/JarFile;
    move-object v14, v15

    .end local v15    # "genericJar":Ljava/util/jar/JarFile;
    .restart local v14    # "genericJar":Ljava/util/jar/JarFile;
    goto/16 :goto_8

    .line 820
    .end local v9    # "e":Ljava/util/Enumeration;
    .end local v12    # "genericEntries":Ljava/util/Hashtable;
    .end local v28    # "replaceEntries":Ljava/util/Hashtable;
    .end local v29    # "wasEntries":Ljava/util/Hashtable;
    :catch_f
    move-exception v7

    goto/16 :goto_1

    .end local v14    # "genericJar":Ljava/util/jar/JarFile;
    .restart local v15    # "genericJar":Ljava/util/jar/JarFile;
    :catch_10
    move-exception v7

    move-object v14, v15

    .end local v15    # "genericJar":Ljava/util/jar/JarFile;
    .restart local v14    # "genericJar":Ljava/util/jar/JarFile;
    goto/16 :goto_1

    .end local v14    # "genericJar":Ljava/util/jar/JarFile;
    .end local v24    # "newwasJarFile":Ljava/io/File;
    .end local v31    # "wasJar":Ljava/util/jar/JarFile;
    .restart local v9    # "e":Ljava/util/Enumeration;
    .restart local v12    # "genericEntries":Ljava/util/Hashtable;
    .restart local v15    # "genericJar":Ljava/util/jar/JarFile;
    .restart local v25    # "newwasJarFile":Ljava/io/File;
    .restart local v28    # "replaceEntries":Ljava/util/Hashtable;
    .restart local v29    # "wasEntries":Ljava/util/Hashtable;
    .restart local v32    # "wasJar":Ljava/util/jar/JarFile;
    :catch_11
    move-exception v7

    move-object/from16 v24, v25

    .end local v25    # "newwasJarFile":Ljava/io/File;
    .restart local v24    # "newwasJarFile":Ljava/io/File;
    move-object/from16 v31, v32

    .end local v32    # "wasJar":Ljava/util/jar/JarFile;
    .restart local v31    # "wasJar":Ljava/util/jar/JarFile;
    move-object v14, v15

    .end local v15    # "genericJar":Ljava/util/jar/JarFile;
    .restart local v14    # "genericJar":Ljava/util/jar/JarFile;
    goto/16 :goto_1
.end method

.method public setCodegen(Z)V
    .locals 0
    .param p1, "codegen"    # Z

    .prologue
    .line 207
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;->codegen:Z

    .line 208
    return-void
.end method

.method public setDbname(Ljava/lang/String;)V
    .locals 0
    .param p1, "dbName"    # Ljava/lang/String;

    .prologue
    .line 186
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;->dbName:Ljava/lang/String;

    .line 187
    return-void
.end method

.method public setDbschema(Ljava/lang/String;)V
    .locals 0
    .param p1, "dbSchema"    # Ljava/lang/String;

    .prologue
    .line 196
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;->dbSchema:Ljava/lang/String;

    .line 197
    return-void
.end method

.method public setDbvendor(Ljava/lang/String;)V
    .locals 0
    .param p1, "dbvendor"    # Ljava/lang/String;

    .prologue
    .line 176
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;->dbVendor:Ljava/lang/String;

    .line 177
    return-void
.end method

.method public setEJBdtd(Ljava/lang/String;)V
    .locals 0
    .param p1, "inString"    # Ljava/lang/String;

    .prologue
    .line 328
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;->ejb11DTD:Ljava/lang/String;

    .line 329
    return-void
.end method

.method public setEjbdeploy(Z)V
    .locals 0
    .param p1, "ejbdeploy"    # Z

    .prologue
    .line 317
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;->ejbdeploy:Z

    .line 318
    return-void
.end method

.method public setKeepgeneric(Z)V
    .locals 0
    .param p1, "inValue"    # Z

    .prologue
    .line 306
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;->keepGeneric:Z

    .line 307
    return-void
.end method

.method public setNewCMP(Z)V
    .locals 0
    .param p1, "newCMP"    # Z

    .prologue
    .line 352
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;->newCMP:Z

    .line 353
    return-void
.end method

.method public setNoinform(Z)V
    .locals 0
    .param p1, "noinform"    # Z

    .prologue
    .line 247
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;->noinform:Z

    .line 248
    return-void
.end method

.method public setNovalidate(Z)V
    .locals 0
    .param p1, "novalidate"    # Z

    .prologue
    .line 227
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;->novalidate:Z

    .line 228
    return-void
.end method

.method public setNowarn(Z)V
    .locals 0
    .param p1, "nowarn"    # Z

    .prologue
    .line 237
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;->nowarn:Z

    .line 238
    return-void
.end method

.method public setOldCMP(Z)V
    .locals 1
    .param p1, "oldCMP"    # Z

    .prologue
    .line 338
    if-nez p1, :cond_0

    const/4 v0, 0x1

    :goto_0
    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;->newCMP:Z

    .line 339
    return-void

    .line 338
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setQuiet(Z)V
    .locals 0
    .param p1, "quiet"    # Z

    .prologue
    .line 217
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;->quiet:Z

    .line 218
    return-void
.end method

.method public setRebuild(Z)V
    .locals 0
    .param p1, "rebuild"    # Z

    .prologue
    .line 285
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;->alwaysRebuild:Z

    .line 286
    return-void
.end method

.method public setRmicoptions(Ljava/lang/String;)V
    .locals 0
    .param p1, "options"    # Ljava/lang/String;

    .prologue
    .line 266
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;->rmicOptions:Ljava/lang/String;

    .line 267
    return-void
.end method

.method public setSuffix(Ljava/lang/String;)V
    .locals 0
    .param p1, "inString"    # Ljava/lang/String;

    .prologue
    .line 296
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;->jarSuffix:Ljava/lang/String;

    .line 297
    return-void
.end method

.method public setTempdir(Ljava/lang/String;)V
    .locals 0
    .param p1, "tempdir"    # Ljava/lang/String;

    .prologue
    .line 362
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;->tempdir:Ljava/lang/String;

    .line 363
    return-void
.end method

.method public setTrace(Z)V
    .locals 0
    .param p1, "trace"    # Z

    .prologue
    .line 257
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;->trace:Z

    .line 258
    return-void
.end method

.method public setUse35(Z)V
    .locals 0
    .param p1, "attr"    # Z

    .prologue
    .line 275
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;->use35MappingRules:Z

    .line 276
    return-void
.end method

.method public setWASClasspath(Lorg/apache/tools/ant/types/Path;)V
    .locals 0
    .param p1, "wasClasspath"    # Lorg/apache/tools/ant/types/Path;

    .prologue
    .line 156
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;->wasClasspath:Lorg/apache/tools/ant/types/Path;

    .line 157
    return-void
.end method

.method public validateConfigured()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 641
    invoke-super {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->validateConfigured()V

    .line 642
    iget-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;->ejbdeploy:Z

    if-eqz v1, :cond_1

    .line 643
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;->getTask()Lorg/apache/tools/ant/Task;

    move-result-object v1

    invoke-virtual {v1}, Lorg/apache/tools/ant/Task;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    const-string/jumbo v2, "websphere.home"

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/Project;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 644
    .local v0, "home":Ljava/lang/String;
    if-nez v0, :cond_0

    .line 645
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v2, "The \'websphere.home\' property must be set when \'ejbdeploy=true\'"

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 648
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;->getTask()Lorg/apache/tools/ant/Task;

    move-result-object v1

    invoke-virtual {v1}, Lorg/apache/tools/ant/Task;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-virtual {v1, v0}, Lorg/apache/tools/ant/Project;->resolveFile(Ljava/lang/String;)Ljava/io/File;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;->websphereHome:Ljava/io/File;

    .line 650
    .end local v0    # "home":Ljava/lang/String;
    :cond_1
    return-void
.end method

.method protected writeJar(Ljava/lang/String;Ljava/io/File;Ljava/util/Hashtable;Ljava/lang/String;)V
    .locals 3
    .param p1, "baseName"    # Ljava/lang/String;
    .param p2, "jarFile"    # Ljava/io/File;
    .param p3, "files"    # Ljava/util/Hashtable;
    .param p4, "publicId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 614
    iget-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;->ejbdeploy:Z

    if-eqz v1, :cond_3

    .line 616
    invoke-super {p0, p1}, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->getVendorOutputJarFile(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    .line 618
    .local v0, "genericJarFile":Ljava/io/File;
    invoke-super {p0, p1, v0, p3, p4}, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->writeJar(Ljava/lang/String;Ljava/io/File;Ljava/util/Hashtable;Ljava/lang/String;)V

    .line 621
    iget-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;->alwaysRebuild:Z

    if-nez v1, :cond_0

    invoke-virtual {p0, v0, p2}, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;->isRebuildRequired(Ljava/io/File;Ljava/io/File;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 622
    :cond_0
    invoke-direct {p0, v0, p2}, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;->buildWebsphereJar(Ljava/io/File;Ljava/io/File;)V

    .line 624
    :cond_1
    iget-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;->keepGeneric:Z

    if-nez v1, :cond_2

    .line 625
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "deleting generic jar "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v0}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x3

    invoke-virtual {p0, v1, v2}, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;->log(Ljava/lang/String;I)V

    .line 627
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 633
    .end local v0    # "genericJarFile":Ljava/io/File;
    :cond_2
    :goto_0
    return-void

    .line 631
    :cond_3
    invoke-super {p0, p1, p2, p3, p4}, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->writeJar(Ljava/lang/String;Ljava/io/File;Ljava/util/Hashtable;Ljava/lang/String;)V

    goto :goto_0
.end method
