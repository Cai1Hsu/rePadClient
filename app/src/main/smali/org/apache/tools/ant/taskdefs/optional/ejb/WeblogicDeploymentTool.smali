.class public Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool;
.super Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;
.source "WeblogicDeploymentTool.java"


# static fields
.field protected static final COMPILER_EJB11:Ljava/lang/String; = "weblogic.ejbc"

.field protected static final COMPILER_EJB20:Ljava/lang/String; = "weblogic.ejbc20"

.field protected static final DEFAULT_COMPILER:Ljava/lang/String; = "default"

.field protected static final DEFAULT_WL51_DTD_LOCATION:Ljava/lang/String; = "/weblogic/ejb/deployment/xml/weblogic-ejb-jar.dtd"

.field protected static final DEFAULT_WL51_EJB11_DTD_LOCATION:Ljava/lang/String; = "/weblogic/ejb/deployment/xml/ejb-jar.dtd"

.field protected static final DEFAULT_WL60_51_DTD_LOCATION:Ljava/lang/String; = "/weblogic/ejb20/dd/xml/weblogic510-ejb-jar.dtd"

.field protected static final DEFAULT_WL60_DTD_LOCATION:Ljava/lang/String; = "/weblogic/ejb20/dd/xml/weblogic600-ejb-jar.dtd"

.field protected static final DEFAULT_WL60_EJB11_DTD_LOCATION:Ljava/lang/String; = "/weblogic/ejb20/dd/xml/ejb11-jar.dtd"

.field protected static final DEFAULT_WL60_EJB20_DTD_LOCATION:Ljava/lang/String; = "/weblogic/ejb20/dd/xml/ejb20-jar.dtd"

.field protected static final DEFAULT_WL70_DTD_LOCATION:Ljava/lang/String; = "/weblogic/ejb20/dd/xml/weblogic700-ejb-jar.dtd"

.field private static final FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

.field public static final PUBLICID_EJB11:Ljava/lang/String; = "-//Sun Microsystems, Inc.//DTD Enterprise JavaBeans 1.1//EN"

.field public static final PUBLICID_EJB20:Ljava/lang/String; = "-//Sun Microsystems, Inc.//DTD Enterprise JavaBeans 2.0//EN"

.field public static final PUBLICID_WEBLOGIC_EJB510:Ljava/lang/String; = "-//BEA Systems, Inc.//DTD WebLogic 5.1.0 EJB//EN"

.field public static final PUBLICID_WEBLOGIC_EJB600:Ljava/lang/String; = "-//BEA Systems, Inc.//DTD WebLogic 6.0.0 EJB//EN"

.field public static final PUBLICID_WEBLOGIC_EJB700:Ljava/lang/String; = "-//BEA Systems, Inc.//DTD WebLogic 7.0.0 EJB//EN"

.field protected static final WL_CMP_DD:Ljava/lang/String; = "weblogic-cmp-rdbms-jar.xml"

.field protected static final WL_DD:Ljava/lang/String; = "weblogic-ejb-jar.xml"


# instance fields
.field private additionalArgs:Ljava/lang/String;

.field private additionalJvmArgs:Ljava/lang/String;

.field private alwaysRebuild:Z

.field private compiler:Ljava/lang/String;

.field private ejb11DTD:Ljava/lang/String;

.field private ejbcClass:Ljava/lang/String;

.field private jarSuffix:Ljava/lang/String;

.field private jvmDebugLevel:Ljava/lang/Integer;

.field private keepGeneric:Z

.field private keepgenerated:Z

.field private newCMP:Z

.field private noEJBC:Z

.field private outputDir:Ljava/io/File;

.field private sysprops:Ljava/util/Vector;

.field private weblogicDTD:Ljava/lang/String;

.field private wlClasspath:Lorg/apache/tools/ant/types/Path;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 99
    invoke-static {}, Lorg/apache/tools/ant/util/FileUtils;->getFileUtils()Lorg/apache/tools/ant/util/FileUtils;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 54
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;-><init>()V

    .line 102
    const-string/jumbo v0, ".jar"

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool;->jarSuffix:Ljava/lang/String;

    .line 111
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool;->keepgenerated:Z

    .line 117
    iput-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool;->ejbcClass:Ljava/lang/String;

    .line 119
    const-string/jumbo v0, ""

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool;->additionalArgs:Ljava/lang/String;

    .line 124
    const-string/jumbo v0, ""

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool;->additionalJvmArgs:Ljava/lang/String;

    .line 126
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool;->keepGeneric:Z

    .line 128
    iput-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool;->compiler:Ljava/lang/String;

    .line 130
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool;->alwaysRebuild:Z

    .line 133
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool;->noEJBC:Z

    .line 136
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool;->newCMP:Z

    .line 139
    iput-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool;->wlClasspath:Lorg/apache/tools/ant/types/Path;

    .line 142
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool;->sysprops:Ljava/util/Vector;

    .line 149
    iput-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool;->jvmDebugLevel:Ljava/lang/Integer;

    return-void
.end method

.method private buildWeblogicJar(Ljava/io/File;Ljava/io/File;Ljava/lang/String;)V
    .locals 14
    .param p1, "sourceJar"    # Ljava/io/File;
    .param p2, "destJar"    # Ljava/io/File;
    .param p3, "publicId"    # Ljava/lang/String;

    .prologue
    .line 538
    const/4 v8, 0x0

    .line 540
    .local v8, "javaTask":Lorg/apache/tools/ant/taskdefs/Java;
    iget-boolean v11, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool;->noEJBC:Z

    if-eqz v11, :cond_1

    .line 542
    :try_start_0
    sget-object v11, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    move-object/from16 v0, p2

    invoke-virtual {v11, p1, v0}, Lorg/apache/tools/ant/util/FileUtils;->copyFile(Ljava/io/File;Ljava/io/File;)V

    .line 543
    iget-boolean v11, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool;->keepgenerated:Z

    if-nez v11, :cond_0

    .line 544
    invoke-virtual {p1}, Ljava/io/File;->delete()Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 644
    :cond_0
    :goto_0
    return-void

    .line 547
    :catch_0
    move-exception v4

    .line 548
    .local v4, "e":Ljava/io/IOException;
    new-instance v11, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v12, "Unable to write EJB jar"

    invoke-direct {v11, v12, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v11

    .line 552
    .end local v4    # "e":Ljava/io/IOException;
    :cond_1
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool;->ejbcClass:Ljava/lang/String;

    .line 555
    .local v5, "ejbcClassName":Ljava/lang/String;
    :try_start_1
    new-instance v9, Lorg/apache/tools/ant/taskdefs/Java;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool;->getTask()Lorg/apache/tools/ant/Task;

    move-result-object v11

    invoke-direct {v9, v11}, Lorg/apache/tools/ant/taskdefs/Java;-><init>(Lorg/apache/tools/ant/Task;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2

    .line 556
    .end local v8    # "javaTask":Lorg/apache/tools/ant/taskdefs/Java;
    .local v9, "javaTask":Lorg/apache/tools/ant/taskdefs/Java;
    :try_start_2
    const-string/jumbo v11, "ejbc"

    invoke-virtual {v9, v11}, Lorg/apache/tools/ant/taskdefs/Java;->setTaskName(Ljava/lang/String;)V

    .line 558
    invoke-virtual {v9}, Lorg/apache/tools/ant/taskdefs/Java;->createJvmarg()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v11

    iget-object v12, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool;->additionalJvmArgs:Ljava/lang/String;

    invoke-virtual {v11, v12}, Lorg/apache/tools/ant/types/Commandline$Argument;->setLine(Ljava/lang/String;)V

    .line 559
    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool;->sysprops:Ljava/util/Vector;

    invoke-virtual {v11}, Ljava/util/Vector;->isEmpty()Z

    move-result v11

    if-nez v11, :cond_2

    .line 560
    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool;->sysprops:Ljava/util/Vector;

    invoke-virtual {v11}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v6

    .local v6, "en":Ljava/util/Enumeration;
    :goto_1
    invoke-interface {v6}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v11

    if-eqz v11, :cond_2

    .line 561
    invoke-interface {v6}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lorg/apache/tools/ant/types/Environment$Variable;

    .line 563
    .local v7, "entry":Lorg/apache/tools/ant/types/Environment$Variable;
    invoke-virtual {v9, v7}, Lorg/apache/tools/ant/taskdefs/Java;->addSysproperty(Lorg/apache/tools/ant/types/Environment$Variable;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_1

    .line 637
    .end local v6    # "en":Ljava/util/Enumeration;
    .end local v7    # "entry":Lorg/apache/tools/ant/types/Environment$Variable;
    :catch_1
    move-exception v4

    move-object v8, v9

    .line 639
    .end local v9    # "javaTask":Lorg/apache/tools/ant/taskdefs/Java;
    .local v4, "e":Ljava/lang/Exception;
    .restart local v8    # "javaTask":Lorg/apache/tools/ant/taskdefs/Java;
    :goto_2
    new-instance v11, Ljava/lang/StringBuffer;

    invoke-direct {v11}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v12, "Exception while calling "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v11, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    const-string/jumbo v12, ". Details: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v4}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    .line 642
    .local v10, "msg":Ljava/lang/String;
    new-instance v11, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v11, v10, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v11

    .line 567
    .end local v4    # "e":Ljava/lang/Exception;
    .end local v8    # "javaTask":Lorg/apache/tools/ant/taskdefs/Java;
    .end local v10    # "msg":Ljava/lang/String;
    .restart local v9    # "javaTask":Lorg/apache/tools/ant/taskdefs/Java;
    :cond_2
    :try_start_3
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool;->getJvmDebugLevel()Ljava/lang/Integer;

    move-result-object v11

    if-eqz v11, :cond_3

    .line 568
    invoke-virtual {v9}, Lorg/apache/tools/ant/taskdefs/Java;->createJvmarg()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v11

    new-instance v12, Ljava/lang/StringBuffer;

    invoke-direct {v12}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v13, " -Dweblogic.StdoutSeverityLevel="

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    iget-object v13, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool;->jvmDebugLevel:Ljava/lang/Integer;

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Lorg/apache/tools/ant/types/Commandline$Argument;->setLine(Ljava/lang/String;)V

    .line 571
    :cond_3
    if-nez v5, :cond_4

    .line 573
    const-string/jumbo v11, "-//Sun Microsystems, Inc.//DTD Enterprise JavaBeans 1.1//EN"

    move-object/from16 v0, p3

    invoke-virtual {v11, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_a

    .line 574
    const-string/jumbo v5, "weblogic.ejbc"

    .line 584
    :cond_4
    :goto_3
    invoke-virtual {v9, v5}, Lorg/apache/tools/ant/taskdefs/Java;->setClassname(Ljava/lang/String;)V

    .line 585
    invoke-virtual {v9}, Lorg/apache/tools/ant/taskdefs/Java;->createArg()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v11

    iget-object v12, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool;->additionalArgs:Ljava/lang/String;

    invoke-virtual {v11, v12}, Lorg/apache/tools/ant/types/Commandline$Argument;->setLine(Ljava/lang/String;)V

    .line 586
    iget-boolean v11, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool;->keepgenerated:Z

    if-eqz v11, :cond_5

    .line 587
    invoke-virtual {v9}, Lorg/apache/tools/ant/taskdefs/Java;->createArg()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v11

    const-string/jumbo v12, "-keepgenerated"

    invoke-virtual {v11, v12}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 589
    :cond_5
    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool;->compiler:Ljava/lang/String;

    if-nez v11, :cond_c

    .line 592
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool;->getTask()Lorg/apache/tools/ant/Task;

    move-result-object v11

    invoke-virtual {v11}, Lorg/apache/tools/ant/Task;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v11

    const-string/jumbo v12, "build.compiler"

    invoke-virtual {v11, v12}, Lorg/apache/tools/ant/Project;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 595
    .local v1, "buildCompiler":Ljava/lang/String;
    if-eqz v1, :cond_6

    const-string/jumbo v11, "jikes"

    invoke-virtual {v1, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_6

    .line 596
    invoke-virtual {v9}, Lorg/apache/tools/ant/taskdefs/Java;->createArg()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v11

    const-string/jumbo v12, "-compiler"

    invoke-virtual {v11, v12}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 597
    invoke-virtual {v9}, Lorg/apache/tools/ant/taskdefs/Java;->createArg()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v11

    const-string/jumbo v12, "jikes"

    invoke-virtual {v11, v12}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 606
    .end local v1    # "buildCompiler":Ljava/lang/String;
    :cond_6
    :goto_4
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool;->getCombinedClasspath()Lorg/apache/tools/ant/types/Path;

    move-result-object v3

    .line 607
    .local v3, "combinedClasspath":Lorg/apache/tools/ant/types/Path;
    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool;->wlClasspath:Lorg/apache/tools/ant/types/Path;

    if-eqz v11, :cond_7

    if-eqz v3, :cond_7

    invoke-virtual {v3}, Lorg/apache/tools/ant/types/Path;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/String;->length()I

    move-result v11

    if-lez v11, :cond_7

    .line 609
    invoke-virtual {v9}, Lorg/apache/tools/ant/taskdefs/Java;->createArg()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v11

    const-string/jumbo v12, "-classpath"

    invoke-virtual {v11, v12}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 610
    invoke-virtual {v9}, Lorg/apache/tools/ant/taskdefs/Java;->createArg()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v11

    invoke-virtual {v11, v3}, Lorg/apache/tools/ant/types/Commandline$Argument;->setPath(Lorg/apache/tools/ant/types/Path;)V

    .line 613
    :cond_7
    invoke-virtual {v9}, Lorg/apache/tools/ant/taskdefs/Java;->createArg()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v11

    invoke-virtual {p1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 614
    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool;->outputDir:Ljava/io/File;

    if-nez v11, :cond_d

    .line 615
    invoke-virtual {v9}, Lorg/apache/tools/ant/taskdefs/Java;->createArg()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v11

    invoke-virtual/range {p2 .. p2}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 620
    :goto_5
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool;->wlClasspath:Lorg/apache/tools/ant/types/Path;

    .line 622
    .local v2, "classpath":Lorg/apache/tools/ant/types/Path;
    if-nez v2, :cond_8

    .line 623
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool;->getCombinedClasspath()Lorg/apache/tools/ant/types/Path;

    move-result-object v2

    .line 626
    :cond_8
    const/4 v11, 0x1

    invoke-virtual {v9, v11}, Lorg/apache/tools/ant/taskdefs/Java;->setFork(Z)V

    .line 627
    if-eqz v2, :cond_9

    .line 628
    invoke-virtual {v9, v2}, Lorg/apache/tools/ant/taskdefs/Java;->setClasspath(Lorg/apache/tools/ant/types/Path;)V

    .line 631
    :cond_9
    new-instance v11, Ljava/lang/StringBuffer;

    invoke-direct {v11}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v12, "Calling "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v11, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    const-string/jumbo v12, " for "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {p1}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v11

    const/4 v12, 0x3

    invoke-virtual {p0, v11, v12}, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool;->log(Ljava/lang/String;I)V

    .line 634
    invoke-virtual {v9}, Lorg/apache/tools/ant/taskdefs/Java;->executeJava()I

    move-result v11

    if-eqz v11, :cond_e

    .line 635
    new-instance v11, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v12, "Ejbc reported an error"

    invoke-direct {v11, v12}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v11

    .line 575
    .end local v2    # "classpath":Lorg/apache/tools/ant/types/Path;
    .end local v3    # "combinedClasspath":Lorg/apache/tools/ant/types/Path;
    :cond_a
    const-string/jumbo v11, "-//Sun Microsystems, Inc.//DTD Enterprise JavaBeans 2.0//EN"

    move-object/from16 v0, p3

    invoke-virtual {v11, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_b

    .line 576
    const-string/jumbo v5, "weblogic.ejbc20"

    goto/16 :goto_3

    .line 578
    :cond_b
    new-instance v11, Ljava/lang/StringBuffer;

    invoke-direct {v11}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v12, "Unrecognized publicId "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    move-object/from16 v0, p3

    invoke-virtual {v11, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    const-string/jumbo v12, " - using EJB 1.1 compiler"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v11

    const/4 v12, 0x1

    invoke-virtual {p0, v11, v12}, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool;->log(Ljava/lang/String;I)V

    .line 580
    const-string/jumbo v5, "weblogic.ejbc"

    goto/16 :goto_3

    .line 600
    :cond_c
    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool;->compiler:Ljava/lang/String;

    const-string/jumbo v12, "default"

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_6

    .line 601
    invoke-virtual {v9}, Lorg/apache/tools/ant/taskdefs/Java;->createArg()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v11

    const-string/jumbo v12, "-compiler"

    invoke-virtual {v11, v12}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 602
    invoke-virtual {v9}, Lorg/apache/tools/ant/taskdefs/Java;->createArg()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v11

    iget-object v12, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool;->compiler:Ljava/lang/String;

    invoke-virtual {v11, v12}, Lorg/apache/tools/ant/types/Commandline$Argument;->setLine(Ljava/lang/String;)V

    goto/16 :goto_4

    .line 617
    .restart local v3    # "combinedClasspath":Lorg/apache/tools/ant/types/Path;
    :cond_d
    invoke-virtual {v9}, Lorg/apache/tools/ant/taskdefs/Java;->createArg()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v11

    iget-object v12, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool;->outputDir:Ljava/io/File;

    invoke-virtual {v12}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    goto/16 :goto_5

    .restart local v2    # "classpath":Lorg/apache/tools/ant/types/Path;
    :cond_e
    move-object v8, v9

    .line 644
    .end local v9    # "javaTask":Lorg/apache/tools/ant/taskdefs/Java;
    .restart local v8    # "javaTask":Lorg/apache/tools/ant/taskdefs/Java;
    goto/16 :goto_0

    .line 637
    .end local v2    # "classpath":Lorg/apache/tools/ant/types/Path;
    .end local v3    # "combinedClasspath":Lorg/apache/tools/ant/types/Path;
    :catch_2
    move-exception v4

    goto/16 :goto_2
.end method


# virtual methods
.method public addSysproperty(Lorg/apache/tools/ant/types/Environment$Variable;)V
    .locals 1
    .param p1, "sysp"    # Lorg/apache/tools/ant/types/Environment$Variable;

    .prologue
    .line 158
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool;->sysprops:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 159
    return-void
.end method

.method protected addVendorFiles(Ljava/util/Hashtable;Ljava/lang/String;)V
    .locals 13
    .param p1, "ejbFiles"    # Ljava/util/Hashtable;
    .param p2, "ddPrefix"    # Ljava/lang/String;

    .prologue
    .line 458
    new-instance v9, Ljava/io/File;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool;->getConfig()Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;

    move-result-object v10

    iget-object v10, v10, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;->descriptorDir:Ljava/io/File;

    new-instance v11, Ljava/lang/StringBuffer;

    invoke-direct {v11}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v11, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    const-string/jumbo v12, "weblogic-ejb-jar.xml"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v9, v10, v11}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 460
    .local v9, "weblogicDD":Ljava/io/File;
    invoke-virtual {v9}, Ljava/io/File;->exists()Z

    move-result v10

    if-eqz v10, :cond_1

    .line 461
    const-string/jumbo v10, "META-INF/weblogic-ejb-jar.xml"

    invoke-virtual {p1, v10, v9}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 470
    iget-boolean v10, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool;->newCMP:Z

    if-nez v10, :cond_2

    .line 471
    const-string/jumbo v10, "The old method for locating CMP files has been DEPRECATED."

    const/4 v11, 0x3

    invoke-virtual {p0, v10, v11}, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool;->log(Ljava/lang/String;I)V

    .line 472
    const-string/jumbo v10, "Please adjust your weblogic descriptor and set newCMP=\"true\" to use the new CMP descriptor inclusion mechanism. "

    const/4 v11, 0x3

    invoke-virtual {p0, v10, v11}, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool;->log(Ljava/lang/String;I)V

    .line 476
    new-instance v8, Ljava/io/File;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool;->getConfig()Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;

    move-result-object v10

    iget-object v10, v10, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;->descriptorDir:Ljava/io/File;

    new-instance v11, Ljava/lang/StringBuffer;

    invoke-direct {v11}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v11, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    const-string/jumbo v12, "weblogic-cmp-rdbms-jar.xml"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v8, v10, v11}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 478
    .local v8, "weblogicCMPDD":Ljava/io/File;
    invoke-virtual {v8}, Ljava/io/File;->exists()Z

    move-result v10

    if-eqz v10, :cond_0

    .line 479
    const-string/jumbo v10, "META-INF/weblogic-cmp-rdbms-jar.xml"

    invoke-virtual {p1, v10, v8}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 515
    .end local v8    # "weblogicCMPDD":Ljava/io/File;
    :cond_0
    :goto_0
    return-void

    .line 464
    :cond_1
    new-instance v10, Ljava/lang/StringBuffer;

    invoke-direct {v10}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v11, "Unable to locate weblogic deployment descriptor. It was expected to be in "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v9}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    const/4 v11, 0x1

    invoke-virtual {p0, v10, v11}, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool;->log(Ljava/lang/String;I)V

    goto :goto_0

    .line 488
    :cond_2
    :try_start_0
    const-string/jumbo v10, "META-INF/ejb-jar.xml"

    invoke-virtual {p1, v10}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/io/File;

    .line 489
    .local v1, "ejbDescriptor":Ljava/io/File;
    invoke-static {}, Ljavax/xml/parsers/SAXParserFactory;->newInstance()Ljavax/xml/parsers/SAXParserFactory;

    move-result-object v7

    .line 491
    .local v7, "saxParserFactory":Ljavax/xml/parsers/SAXParserFactory;
    const/4 v10, 0x1

    invoke-virtual {v7, v10}, Ljavax/xml/parsers/SAXParserFactory;->setValidating(Z)V

    .line 493
    invoke-virtual {v7}, Ljavax/xml/parsers/SAXParserFactory;->newSAXParser()Ljavax/xml/parsers/SAXParser;

    move-result-object v6

    .line 494
    .local v6, "saxParser":Ljavax/xml/parsers/SAXParser;
    invoke-virtual {v1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v10

    invoke-virtual {p0, v10}, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool;->getWeblogicDescriptorHandler(Ljava/io/File;)Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;

    move-result-object v2

    .line 497
    .local v2, "handler":Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;
    new-instance v10, Lorg/xml/sax/InputSource;

    new-instance v11, Ljava/io/FileInputStream;

    invoke-direct {v11, v9}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v10, v11}, Lorg/xml/sax/InputSource;-><init>(Ljava/io/InputStream;)V

    invoke-virtual {v6, v10, v2}, Ljavax/xml/parsers/SAXParser;->parse(Lorg/xml/sax/InputSource;Lorg/xml/sax/HandlerBase;)V

    .line 501
    invoke-virtual {v2}, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;->getFiles()Ljava/util/Hashtable;

    move-result-object v3

    .line 502
    .local v3, "ht":Ljava/util/Hashtable;
    invoke-virtual {v3}, Ljava/util/Hashtable;->keys()Ljava/util/Enumeration;

    move-result-object v0

    .line 504
    .local v0, "e":Ljava/util/Enumeration;
    :goto_1
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v10

    if-eqz v10, :cond_0

    .line 505
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 507
    .local v4, "key":Ljava/lang/String;
    invoke-virtual {v3, v4}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    invoke-virtual {p1, v4, v10}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 509
    .end local v0    # "e":Ljava/util/Enumeration;
    .end local v1    # "ejbDescriptor":Ljava/io/File;
    .end local v2    # "handler":Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;
    .end local v3    # "ht":Ljava/util/Hashtable;
    .end local v4    # "key":Ljava/lang/String;
    .end local v6    # "saxParser":Ljavax/xml/parsers/SAXParser;
    .end local v7    # "saxParserFactory":Ljavax/xml/parsers/SAXParserFactory;
    :catch_0
    move-exception v0

    .line 510
    .local v0, "e":Ljava/lang/Exception;
    new-instance v10, Ljava/lang/StringBuffer;

    invoke-direct {v10}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v11, "Exception while adding Vendor specific files: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    .line 512
    .local v5, "msg":Ljava/lang/String;
    new-instance v10, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v10, v5, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v10
.end method

.method public createWLClasspath()Lorg/apache/tools/ant/types/Path;
    .locals 2

    .prologue
    .line 167
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool;->wlClasspath:Lorg/apache/tools/ant/types/Path;

    if-nez v0, :cond_0

    .line 168
    new-instance v0, Lorg/apache/tools/ant/types/Path;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool;->getTask()Lorg/apache/tools/ant/Task;

    move-result-object v1

    invoke-virtual {v1}, Lorg/apache/tools/ant/Task;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool;->wlClasspath:Lorg/apache/tools/ant/types/Path;

    .line 170
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool;->wlClasspath:Lorg/apache/tools/ant/types/Path;

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
    .line 918
    new-instance v1, Lorg/apache/tools/ant/types/Path;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool;->getTask()Lorg/apache/tools/ant/Task;

    move-result-object v2

    invoke-virtual {v2}, Lorg/apache/tools/ant/Task;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;)V

    .line 920
    .local v1, "lookupPath":Lorg/apache/tools/ant/types/Path;
    invoke-virtual {v1, p1}, Lorg/apache/tools/ant/types/Path;->setLocation(Ljava/io/File;)V

    .line 922
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool;->getCombinedClasspath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    .line 924
    .local v0, "classpath":Lorg/apache/tools/ant/types/Path;
    if-eqz v0, :cond_0

    .line 925
    invoke-virtual {v1, v0}, Lorg/apache/tools/ant/types/Path;->append(Lorg/apache/tools/ant/types/Path;)V

    .line 928
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool;->getTask()Lorg/apache/tools/ant/Task;

    move-result-object v2

    invoke-virtual {v2}, Lorg/apache/tools/ant/Task;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v2

    invoke-virtual {v2, v1}, Lorg/apache/tools/ant/Project;->createClassLoader(Lorg/apache/tools/ant/types/Path;)Lorg/apache/tools/ant/AntClassLoader;

    move-result-object v2

    return-object v2
.end method

.method public getEjbcClass()Ljava/lang/String;
    .locals 1

    .prologue
    .line 323
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool;->ejbcClass:Ljava/lang/String;

    return-object v0
.end method

.method public getJvmDebugLevel()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 248
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool;->jvmDebugLevel:Ljava/lang/Integer;

    return-object v0
.end method

.method getVendorOutputJarFile(Ljava/lang/String;)Ljava/io/File;
    .locals 4
    .param p1, "baseName"    # Ljava/lang/String;

    .prologue
    .line 524
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool;->getDestDir()Ljava/io/File;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool;->jarSuffix:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v0
.end method

.method protected getWeblogicDescriptorHandler(Ljava/io/File;)Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;
    .locals 5
    .param p1, "srcDir"    # Ljava/io/File;

    .prologue
    .line 419
    new-instance v1, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool$1;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool;->getTask()Lorg/apache/tools/ant/Task;

    move-result-object v3

    invoke-direct {v1, p0, v3, p1, p1}, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool$1;-><init>(Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool;Lorg/apache/tools/ant/Task;Ljava/io/File;Ljava/io/File;)V

    .line 436
    .local v1, "handler":Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;
    const-string/jumbo v3, "-//BEA Systems, Inc.//DTD WebLogic 5.1.0 EJB//EN"

    const-string/jumbo v4, "/weblogic/ejb/deployment/xml/weblogic-ejb-jar.dtd"

    invoke-virtual {v1, v3, v4}, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;->registerDTD(Ljava/lang/String;Ljava/lang/String;)V

    .line 437
    const-string/jumbo v3, "-//BEA Systems, Inc.//DTD WebLogic 5.1.0 EJB//EN"

    const-string/jumbo v4, "/weblogic/ejb20/dd/xml/weblogic510-ejb-jar.dtd"

    invoke-virtual {v1, v3, v4}, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;->registerDTD(Ljava/lang/String;Ljava/lang/String;)V

    .line 438
    const-string/jumbo v3, "-//BEA Systems, Inc.//DTD WebLogic 6.0.0 EJB//EN"

    const-string/jumbo v4, "/weblogic/ejb20/dd/xml/weblogic600-ejb-jar.dtd"

    invoke-virtual {v1, v3, v4}, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;->registerDTD(Ljava/lang/String;Ljava/lang/String;)V

    .line 439
    const-string/jumbo v3, "-//BEA Systems, Inc.//DTD WebLogic 7.0.0 EJB//EN"

    const-string/jumbo v4, "/weblogic/ejb20/dd/xml/weblogic700-ejb-jar.dtd"

    invoke-virtual {v1, v3, v4}, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;->registerDTD(Ljava/lang/String;Ljava/lang/String;)V

    .line 440
    const-string/jumbo v3, "-//BEA Systems, Inc.//DTD WebLogic 5.1.0 EJB//EN"

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool;->weblogicDTD:Ljava/lang/String;

    invoke-virtual {v1, v3, v4}, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;->registerDTD(Ljava/lang/String;Ljava/lang/String;)V

    .line 441
    const-string/jumbo v3, "-//BEA Systems, Inc.//DTD WebLogic 6.0.0 EJB//EN"

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool;->weblogicDTD:Ljava/lang/String;

    invoke-virtual {v1, v3, v4}, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;->registerDTD(Ljava/lang/String;Ljava/lang/String;)V

    .line 443
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool;->getConfig()Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;

    move-result-object v3

    iget-object v3, v3, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;->dtdLocations:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 444
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$DTDLocation;

    .line 446
    .local v0, "dtdLocation":Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$DTDLocation;
    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$DTDLocation;->getPublicId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$DTDLocation;->getLocation()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;->registerDTD(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 448
    .end local v0    # "dtdLocation":Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$DTDLocation;
    :cond_0
    return-object v1
.end method

.method protected isRebuildRequired(Ljava/io/File;Ljava/io/File;)Z
    .locals 38
    .param p1, "genericJarFile"    # Ljava/io/File;
    .param p2, "weblogicJarFile"    # Ljava/io/File;

    .prologue
    .line 711
    const/16 v26, 0x0

    .line 713
    .local v26, "rebuild":Z
    const/4 v14, 0x0

    .line 714
    .local v14, "genericJar":Ljava/util/jar/JarFile;
    const/16 v31, 0x0

    .line 715
    .local v31, "wlJar":Ljava/util/jar/JarFile;
    const/16 v24, 0x0

    .line 716
    .local v24, "newWLJarFile":Ljava/io/File;
    const/16 v22, 0x0

    .line 717
    .local v22, "newJarStream":Ljava/util/jar/JarOutputStream;
    const/16 v16, 0x0

    .line 720
    .local v16, "genericLoader":Ljava/lang/ClassLoader;
    :try_start_0
    new-instance v33, Ljava/lang/StringBuffer;

    invoke-direct/range {v33 .. v33}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v34, "Checking if weblogic Jar needs to be rebuilt for jar "

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

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool;->log(Ljava/lang/String;I)V

    .line 723
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

    .line 726
    new-instance v15, Ljava/util/jar/JarFile;

    move-object/from16 v0, p1

    invoke-direct {v15, v0}, Ljava/util/jar/JarFile;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_f
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_c
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 727
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

    .line 729
    .end local v31    # "wlJar":Ljava/util/jar/JarFile;
    .local v32, "wlJar":Ljava/util/jar/JarFile;
    :try_start_2
    new-instance v12, Ljava/util/Hashtable;

    invoke-direct {v12}, Ljava/util/Hashtable;-><init>()V

    .line 730
    .local v12, "genericEntries":Ljava/util/Hashtable;
    new-instance v29, Ljava/util/Hashtable;

    invoke-direct/range {v29 .. v29}, Ljava/util/Hashtable;-><init>()V

    .line 731
    .local v29, "wlEntries":Ljava/util/Hashtable;
    new-instance v28, Ljava/util/Hashtable;

    invoke-direct/range {v28 .. v28}, Ljava/util/Hashtable;-><init>()V

    .line 734
    .local v28, "replaceEntries":Ljava/util/Hashtable;
    invoke-virtual {v15}, Ljava/util/jar/JarFile;->entries()Ljava/util/Enumeration;

    move-result-object v9

    .local v9, "e":Ljava/util/Enumeration;
    :goto_0
    invoke-interface {v9}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v33

    if-eqz v33, :cond_4

    .line 735
    invoke-interface {v9}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Ljava/util/jar/JarEntry;

    .line 737
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

    .line 854
    .end local v9    # "e":Ljava/util/Enumeration;
    .end local v12    # "genericEntries":Ljava/util/Hashtable;
    .end local v19    # "je":Ljava/util/jar/JarEntry;
    .end local v28    # "replaceEntries":Ljava/util/Hashtable;
    .end local v29    # "wlEntries":Ljava/util/Hashtable;
    :catch_0
    move-exception v7

    move-object/from16 v31, v32

    .end local v32    # "wlJar":Ljava/util/jar/JarFile;
    .restart local v31    # "wlJar":Ljava/util/jar/JarFile;
    move-object v14, v15

    .line 855
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

    .line 859
    .local v8, "cnfmsg":Ljava/lang/String;
    new-instance v33, Lorg/apache/tools/ant/BuildException;

    move-object/from16 v0, v33

    invoke-direct {v0, v8, v7}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v33
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 868
    .end local v7    # "cnfe":Ljava/lang/ClassNotFoundException;
    .end local v8    # "cnfmsg":Ljava/lang/String;
    :catchall_0
    move-exception v33

    :goto_2
    if-eqz v14, :cond_0

    .line 870
    :try_start_4
    invoke-virtual {v14}, Ljava/util/jar/JarFile;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_4

    .line 876
    :cond_0
    :goto_3
    if-eqz v31, :cond_1

    .line 878
    :try_start_5
    invoke-virtual/range {v31 .. v31}, Ljava/util/jar/JarFile;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_5

    .line 884
    :cond_1
    :goto_4
    if-eqz v22, :cond_2

    .line 886
    :try_start_6
    invoke-virtual/range {v22 .. v22}, Ljava/util/jar/JarOutputStream;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_6

    .line 892
    :goto_5
    :try_start_7
    sget-object v34, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    move-object/from16 v0, v34

    move-object/from16 v1, v24

    move-object/from16 v2, p2

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/util/FileUtils;->rename(Ljava/io/File;Ljava/io/File;)V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_7

    .line 898
    :cond_2
    :goto_6
    if-eqz v16, :cond_3

    move-object/from16 v0, v16

    instance-of v0, v0, Lorg/apache/tools/ant/AntClassLoader;

    move/from16 v34, v0

    if-eqz v34, :cond_3

    move-object/from16 v20, v16

    .line 900
    check-cast v20, Lorg/apache/tools/ant/AntClassLoader;

    .line 901
    .local v20, "loader":Lorg/apache/tools/ant/AntClassLoader;
    invoke-virtual/range {v20 .. v20}, Lorg/apache/tools/ant/AntClassLoader;->cleanup()V

    .line 868
    .end local v20    # "loader":Lorg/apache/tools/ant/AntClassLoader;
    :cond_3
    throw v33

    .line 740
    .end local v14    # "genericJar":Ljava/util/jar/JarFile;
    .end local v31    # "wlJar":Ljava/util/jar/JarFile;
    .restart local v9    # "e":Ljava/util/Enumeration;
    .restart local v12    # "genericEntries":Ljava/util/Hashtable;
    .restart local v15    # "genericJar":Ljava/util/jar/JarFile;
    .restart local v28    # "replaceEntries":Ljava/util/Hashtable;
    .restart local v29    # "wlEntries":Ljava/util/Hashtable;
    .restart local v32    # "wlJar":Ljava/util/jar/JarFile;
    :cond_4
    :try_start_8
    invoke-virtual/range {v32 .. v32}, Ljava/util/jar/JarFile;->entries()Ljava/util/Enumeration;

    move-result-object v9

    :goto_7
    invoke-interface {v9}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v33

    if-eqz v33, :cond_5

    .line 741
    invoke-interface {v9}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Ljava/util/jar/JarEntry;

    .line 743
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

    .line 860
    .end local v9    # "e":Ljava/util/Enumeration;
    .end local v12    # "genericEntries":Ljava/util/Hashtable;
    .end local v19    # "je":Ljava/util/jar/JarEntry;
    .end local v28    # "replaceEntries":Ljava/util/Hashtable;
    .end local v29    # "wlEntries":Ljava/util/Hashtable;
    :catch_1
    move-exception v17

    move-object/from16 v31, v32

    .end local v32    # "wlJar":Ljava/util/jar/JarFile;
    .restart local v31    # "wlJar":Ljava/util/jar/JarFile;
    move-object v14, v15

    .line 861
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

    .line 865
    .local v21, "msg":Ljava/lang/String;
    new-instance v33, Lorg/apache/tools/ant/BuildException;

    move-object/from16 v0, v33

    move-object/from16 v1, v21

    move-object/from16 v2, v17

    invoke-direct {v0, v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v33
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    .line 747
    .end local v14    # "genericJar":Ljava/util/jar/JarFile;
    .end local v17    # "ioe":Ljava/io/IOException;
    .end local v21    # "msg":Ljava/lang/String;
    .end local v31    # "wlJar":Ljava/util/jar/JarFile;
    .restart local v9    # "e":Ljava/util/Enumeration;
    .restart local v12    # "genericEntries":Ljava/util/Hashtable;
    .restart local v15    # "genericJar":Ljava/util/jar/JarFile;
    .restart local v28    # "replaceEntries":Ljava/util/Hashtable;
    .restart local v29    # "wlEntries":Ljava/util/Hashtable;
    .restart local v32    # "wlJar":Ljava/util/jar/JarFile;
    :cond_5
    :try_start_a
    invoke-virtual/range {p0 .. p1}, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool;->getClassLoaderFromJar(Ljava/io/File;)Ljava/lang/ClassLoader;

    move-result-object v16

    .line 749
    invoke-virtual {v12}, Ljava/util/Hashtable;->keys()Ljava/util/Enumeration;

    move-result-object v9

    :cond_6
    :goto_9
    invoke-interface {v9}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v33

    if-eqz v33, :cond_8

    .line 750
    invoke-interface {v9}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    .line 752
    .local v10, "filepath":Ljava/lang/String;
    move-object/from16 v0, v29

    invoke-virtual {v0, v10}, Ljava/util/Hashtable;->containsKey(Ljava/lang/Object;)Z

    move-result v33

    if-eqz v33, :cond_d

    .line 756
    invoke-virtual {v12, v10}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/util/jar/JarEntry;

    .line 757
    .local v13, "genericEntry":Ljava/util/jar/JarEntry;
    move-object/from16 v0, v29

    invoke-virtual {v0, v10}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v30

    check-cast v30, Ljava/util/jar/JarEntry;

    .line 759
    .local v30, "wlEntry":Ljava/util/jar/JarEntry;
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

    .line 762
    :cond_7
    invoke-virtual {v13}, Ljava/util/jar/JarEntry;->getName()Ljava/lang/String;

    move-result-object v33

    const-string/jumbo v34, ".class"

    invoke-virtual/range {v33 .. v34}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v33

    if-eqz v33, :cond_c

    .line 764
    invoke-virtual {v13}, Ljava/util/jar/JarEntry;->getName()Ljava/lang/String;

    move-result-object v33

    sget-char v34, Ljava/io/File;->separatorChar:C

    const/16 v35, 0x2e

    invoke-virtual/range {v33 .. v35}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v33

    const/16 v34, 0x2f

    const/16 v35, 0x2e

    invoke-virtual/range {v33 .. v35}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v6

    .line 769
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

    .line 771
    move-object/from16 v0, v16

    invoke-virtual {v0, v6}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v11

    .line 773
    .local v11, "genclass":Ljava/lang/Class;
    invoke-virtual {v11}, Ljava/lang/Class;->isInterface()Z

    move-result v33

    if-eqz v33, :cond_b

    .line 775
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

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool;->log(Ljava/lang/String;I)V

    .line 777
    const/16 v26, 0x1

    .line 804
    .end local v6    # "classname":Ljava/lang/String;
    .end local v10    # "filepath":Ljava/lang/String;
    .end local v11    # "genclass":Ljava/lang/Class;
    .end local v13    # "genericEntry":Ljava/util/jar/JarEntry;
    .end local v30    # "wlEntry":Ljava/util/jar/JarEntry;
    :cond_8
    :goto_a
    if-nez v26, :cond_16

    .line 805
    const-string/jumbo v33, "No rebuild needed - updating jar"

    const/16 v34, 0x3

    move-object/from16 v0, p0

    move-object/from16 v1, v33

    move/from16 v2, v34

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool;->log(Ljava/lang/String;I)V

    .line 806
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

    .line 807
    .end local v24    # "newWLJarFile":Ljava/io/File;
    .local v25, "newWLJarFile":Ljava/io/File;
    :try_start_b
    invoke-virtual/range {v25 .. v25}, Ljava/io/File;->exists()Z

    move-result v33

    if-eqz v33, :cond_9

    .line 808
    invoke-virtual/range {v25 .. v25}, Ljava/io/File;->delete()Z

    .line 811
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

    .line 812
    .end local v22    # "newJarStream":Ljava/util/jar/JarOutputStream;
    .local v23, "newJarStream":Ljava/util/jar/JarOutputStream;
    const/16 v33, 0x0

    :try_start_c
    move-object/from16 v0, v23

    move/from16 v1, v33

    invoke-virtual {v0, v1}, Ljava/util/jar/JarOutputStream;->setLevel(I)V

    .line 815
    invoke-virtual/range {v29 .. v29}, Ljava/util/Hashtable;->elements()Ljava/util/Enumeration;

    move-result-object v9

    :goto_b
    invoke-interface {v9}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v33

    if-eqz v33, :cond_11

    .line 816
    const/16 v33, 0x400

    move/from16 v0, v33

    new-array v4, v0, [B

    .line 819
    .local v4, "buffer":[B
    invoke-interface {v9}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Ljava/util/jar/JarEntry;

    .line 821
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

    .line 823
    :cond_a
    const/16 v33, 0x0

    move-object/from16 v0, v23

    move/from16 v1, v33

    invoke-virtual {v0, v1}, Ljava/util/jar/JarOutputStream;->setLevel(I)V

    .line 829
    :goto_c
    invoke-virtual/range {v19 .. v19}, Ljava/util/jar/JarEntry;->getName()Ljava/lang/String;

    move-result-object v33

    move-object/from16 v0, v28

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Ljava/util/Hashtable;->containsKey(Ljava/lang/Object;)Z

    move-result v33

    if-eqz v33, :cond_f

    .line 830
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

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool;->log(Ljava/lang/String;I)V

    .line 833
    invoke-virtual/range {v19 .. v19}, Ljava/util/jar/JarEntry;->getName()Ljava/lang/String;

    move-result-object v33

    move-object/from16 v0, v28

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v19

    .end local v19    # "je":Ljava/util/jar/JarEntry;
    check-cast v19, Ljava/util/jar/JarEntry;

    .line 834
    .restart local v19    # "je":Ljava/util/jar/JarEntry;
    move-object/from16 v0, v19

    invoke-virtual {v15, v0}, Ljava/util/jar/JarFile;->getInputStream(Ljava/util/zip/ZipEntry;)Ljava/io/InputStream;

    move-result-object v18

    .line 840
    .local v18, "is":Ljava/io/InputStream;
    :goto_d
    new-instance v33, Ljava/util/jar/JarEntry;

    invoke-virtual/range {v19 .. v19}, Ljava/util/jar/JarEntry;->getName()Ljava/lang/String;

    move-result-object v34

    invoke-direct/range {v33 .. v34}, Ljava/util/jar/JarEntry;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v23

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Ljava/util/jar/JarOutputStream;->putNextEntry(Ljava/util/zip/ZipEntry;)V

    .line 842
    :goto_e
    move-object/from16 v0, v18

    invoke-virtual {v0, v4}, Ljava/io/InputStream;->read([B)I

    move-result v5

    .local v5, "bytesRead":I
    const/16 v33, -0x1

    move/from16 v0, v33

    if-eq v5, v0, :cond_10

    .line 843
    const/16 v33, 0x0

    move-object/from16 v0, v23

    move/from16 v1, v33

    invoke-virtual {v0, v4, v1, v5}, Ljava/util/jar/JarOutputStream;->write([BII)V
    :try_end_c
    .catch Ljava/lang/ClassNotFoundException; {:try_start_c .. :try_end_c} :catch_2
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_c} :catch_3
    .catchall {:try_start_c .. :try_end_c} :catchall_2

    goto :goto_e

    .line 854
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

    .end local v25    # "newWLJarFile":Ljava/io/File;
    .restart local v24    # "newWLJarFile":Ljava/io/File;
    move-object/from16 v31, v32

    .end local v32    # "wlJar":Ljava/util/jar/JarFile;
    .restart local v31    # "wlJar":Ljava/util/jar/JarFile;
    move-object v14, v15

    .end local v15    # "genericJar":Ljava/util/jar/JarFile;
    .restart local v14    # "genericJar":Ljava/util/jar/JarFile;
    goto/16 :goto_1

    .line 781
    .end local v14    # "genericJar":Ljava/util/jar/JarFile;
    .end local v31    # "wlJar":Ljava/util/jar/JarFile;
    .restart local v6    # "classname":Ljava/lang/String;
    .restart local v10    # "filepath":Ljava/lang/String;
    .restart local v11    # "genclass":Ljava/lang/Class;
    .restart local v13    # "genericEntry":Ljava/util/jar/JarEntry;
    .restart local v15    # "genericJar":Ljava/util/jar/JarFile;
    .restart local v30    # "wlEntry":Ljava/util/jar/JarEntry;
    .restart local v32    # "wlJar":Ljava/util/jar/JarFile;
    :cond_b
    :try_start_d
    move-object/from16 v0, v28

    invoke-virtual {v0, v10, v13}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_9

    .line 868
    .end local v6    # "classname":Ljava/lang/String;
    .end local v9    # "e":Ljava/util/Enumeration;
    .end local v10    # "filepath":Ljava/lang/String;
    .end local v11    # "genclass":Ljava/lang/Class;
    .end local v12    # "genericEntries":Ljava/util/Hashtable;
    .end local v13    # "genericEntry":Ljava/util/jar/JarEntry;
    .end local v28    # "replaceEntries":Ljava/util/Hashtable;
    .end local v29    # "wlEntries":Ljava/util/Hashtable;
    .end local v30    # "wlEntry":Ljava/util/jar/JarEntry;
    :catchall_1
    move-exception v33

    move-object/from16 v31, v32

    .end local v32    # "wlJar":Ljava/util/jar/JarFile;
    .restart local v31    # "wlJar":Ljava/util/jar/JarFile;
    move-object v14, v15

    .end local v15    # "genericJar":Ljava/util/jar/JarFile;
    .restart local v14    # "genericJar":Ljava/util/jar/JarFile;
    goto/16 :goto_2

    .line 785
    .end local v14    # "genericJar":Ljava/util/jar/JarFile;
    .end local v31    # "wlJar":Ljava/util/jar/JarFile;
    .restart local v9    # "e":Ljava/util/Enumeration;
    .restart local v10    # "filepath":Ljava/lang/String;
    .restart local v12    # "genericEntries":Ljava/util/Hashtable;
    .restart local v13    # "genericEntry":Ljava/util/jar/JarEntry;
    .restart local v15    # "genericJar":Ljava/util/jar/JarFile;
    .restart local v28    # "replaceEntries":Ljava/util/Hashtable;
    .restart local v29    # "wlEntries":Ljava/util/Hashtable;
    .restart local v30    # "wlEntry":Ljava/util/jar/JarEntry;
    .restart local v32    # "wlJar":Ljava/util/jar/JarFile;
    :cond_c
    invoke-virtual {v13}, Ljava/util/jar/JarEntry;->getName()Ljava/lang/String;

    move-result-object v33

    const-string/jumbo v34, "META-INF/MANIFEST.MF"

    invoke-virtual/range {v33 .. v34}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v33

    if-nez v33, :cond_6

    .line 787
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

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool;->log(Ljava/lang/String;I)V

    .line 789
    const/16 v26, 0x1

    .line 790
    goto/16 :goto_a

    .line 797
    .end local v13    # "genericEntry":Ljava/util/jar/JarEntry;
    .end local v30    # "wlEntry":Ljava/util/jar/JarEntry;
    :cond_d
    new-instance v33, Ljava/lang/StringBuffer;

    invoke-direct/range {v33 .. v33}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v34, "File "

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v33

    move-object/from16 v0, v33

    invoke-virtual {v0, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v33

    const-string/jumbo v34, " not present in weblogic jar"

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v33

    invoke-virtual/range {v33 .. v33}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v33

    const/16 v34, 0x3

    move-object/from16 v0, p0

    move-object/from16 v1, v33

    move/from16 v2, v34

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool;->log(Ljava/lang/String;I)V
    :try_end_d
    .catch Ljava/lang/ClassNotFoundException; {:try_start_d .. :try_end_d} :catch_0
    .catch Ljava/io/IOException; {:try_start_d .. :try_end_d} :catch_1
    .catchall {:try_start_d .. :try_end_d} :catchall_1

    .line 799
    const/16 v26, 0x1

    .line 800
    goto/16 :goto_a

    .line 825
    .end local v10    # "filepath":Ljava/lang/String;
    .end local v22    # "newJarStream":Ljava/util/jar/JarOutputStream;
    .end local v24    # "newWLJarFile":Ljava/io/File;
    .restart local v4    # "buffer":[B
    .restart local v19    # "je":Ljava/util/jar/JarEntry;
    .restart local v23    # "newJarStream":Ljava/util/jar/JarOutputStream;
    .restart local v25    # "newWLJarFile":Ljava/io/File;
    :cond_e
    const/16 v33, 0x9

    :try_start_e
    move-object/from16 v0, v23

    move/from16 v1, v33

    invoke-virtual {v0, v1}, Ljava/util/jar/JarOutputStream;->setLevel(I)V

    goto/16 :goto_c

    .line 860
    .end local v4    # "buffer":[B
    .end local v19    # "je":Ljava/util/jar/JarEntry;
    :catch_3
    move-exception v17

    move-object/from16 v22, v23

    .end local v23    # "newJarStream":Ljava/util/jar/JarOutputStream;
    .restart local v22    # "newJarStream":Ljava/util/jar/JarOutputStream;
    move-object/from16 v24, v25

    .end local v25    # "newWLJarFile":Ljava/io/File;
    .restart local v24    # "newWLJarFile":Ljava/io/File;
    move-object/from16 v31, v32

    .end local v32    # "wlJar":Ljava/util/jar/JarFile;
    .restart local v31    # "wlJar":Ljava/util/jar/JarFile;
    move-object v14, v15

    .end local v15    # "genericJar":Ljava/util/jar/JarFile;
    .restart local v14    # "genericJar":Ljava/util/jar/JarFile;
    goto/16 :goto_8

    .line 838
    .end local v14    # "genericJar":Ljava/util/jar/JarFile;
    .end local v22    # "newJarStream":Ljava/util/jar/JarOutputStream;
    .end local v24    # "newWLJarFile":Ljava/io/File;
    .end local v31    # "wlJar":Ljava/util/jar/JarFile;
    .restart local v4    # "buffer":[B
    .restart local v15    # "genericJar":Ljava/util/jar/JarFile;
    .restart local v19    # "je":Ljava/util/jar/JarEntry;
    .restart local v23    # "newJarStream":Ljava/util/jar/JarOutputStream;
    .restart local v25    # "newWLJarFile":Ljava/io/File;
    .restart local v32    # "wlJar":Ljava/util/jar/JarFile;
    :cond_f
    move-object/from16 v0, v32

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/util/jar/JarFile;->getInputStream(Ljava/util/zip/ZipEntry;)Ljava/io/InputStream;

    move-result-object v18

    .restart local v18    # "is":Ljava/io/InputStream;
    goto/16 :goto_d

    .line 845
    .restart local v5    # "bytesRead":I
    :cond_10
    invoke-virtual/range {v18 .. v18}, Ljava/io/InputStream;->close()V
    :try_end_e
    .catch Ljava/lang/ClassNotFoundException; {:try_start_e .. :try_end_e} :catch_2
    .catch Ljava/io/IOException; {:try_start_e .. :try_end_e} :catch_3
    .catchall {:try_start_e .. :try_end_e} :catchall_2

    goto/16 :goto_b

    .line 868
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

    .end local v25    # "newWLJarFile":Ljava/io/File;
    .restart local v24    # "newWLJarFile":Ljava/io/File;
    move-object/from16 v31, v32

    .end local v32    # "wlJar":Ljava/util/jar/JarFile;
    .restart local v31    # "wlJar":Ljava/util/jar/JarFile;
    move-object v14, v15

    .end local v15    # "genericJar":Ljava/util/jar/JarFile;
    .restart local v14    # "genericJar":Ljava/util/jar/JarFile;
    goto/16 :goto_2

    .end local v14    # "genericJar":Ljava/util/jar/JarFile;
    .end local v22    # "newJarStream":Ljava/util/jar/JarOutputStream;
    .end local v24    # "newWLJarFile":Ljava/io/File;
    .end local v31    # "wlJar":Ljava/util/jar/JarFile;
    .restart local v15    # "genericJar":Ljava/util/jar/JarFile;
    .restart local v23    # "newJarStream":Ljava/util/jar/JarOutputStream;
    .restart local v25    # "newWLJarFile":Ljava/io/File;
    .restart local v32    # "wlJar":Ljava/util/jar/JarFile;
    :cond_11
    move-object/from16 v22, v23

    .end local v23    # "newJarStream":Ljava/util/jar/JarOutputStream;
    .restart local v22    # "newJarStream":Ljava/util/jar/JarOutputStream;
    move-object/from16 v24, v25

    .end local v25    # "newWLJarFile":Ljava/io/File;
    .restart local v24    # "newWLJarFile":Ljava/io/File;
    :goto_f
    move-object/from16 v31, v32

    .end local v32    # "wlJar":Ljava/util/jar/JarFile;
    .restart local v31    # "wlJar":Ljava/util/jar/JarFile;
    move-object v14, v15

    .end local v9    # "e":Ljava/util/Enumeration;
    .end local v12    # "genericEntries":Ljava/util/Hashtable;
    .end local v15    # "genericJar":Ljava/util/jar/JarFile;
    .end local v28    # "replaceEntries":Ljava/util/Hashtable;
    .end local v29    # "wlEntries":Ljava/util/Hashtable;
    .restart local v14    # "genericJar":Ljava/util/jar/JarFile;
    :goto_10
    if-eqz v14, :cond_12

    .line 870
    :try_start_f
    invoke-virtual {v14}, Ljava/util/jar/JarFile;->close()V
    :try_end_f
    .catch Ljava/io/IOException; {:try_start_f .. :try_end_f} :catch_8

    .line 876
    :cond_12
    :goto_11
    if-eqz v31, :cond_13

    .line 878
    :try_start_10
    invoke-virtual/range {v31 .. v31}, Ljava/util/jar/JarFile;->close()V
    :try_end_10
    .catch Ljava/io/IOException; {:try_start_10 .. :try_end_10} :catch_9

    .line 884
    :cond_13
    :goto_12
    if-eqz v22, :cond_14

    .line 886
    :try_start_11
    invoke-virtual/range {v22 .. v22}, Ljava/util/jar/JarOutputStream;->close()V
    :try_end_11
    .catch Ljava/io/IOException; {:try_start_11 .. :try_end_11} :catch_a

    .line 892
    :goto_13
    :try_start_12
    sget-object v33, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    move-object/from16 v0, v33

    move-object/from16 v1, v24

    move-object/from16 v2, p2

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/util/FileUtils;->rename(Ljava/io/File;Ljava/io/File;)V
    :try_end_12
    .catch Ljava/io/IOException; {:try_start_12 .. :try_end_12} :catch_b

    .line 898
    :cond_14
    :goto_14
    if-eqz v16, :cond_15

    move-object/from16 v0, v16

    instance-of v0, v0, Lorg/apache/tools/ant/AntClassLoader;

    move/from16 v33, v0

    if-eqz v33, :cond_15

    move-object/from16 v20, v16

    .line 900
    check-cast v20, Lorg/apache/tools/ant/AntClassLoader;

    .line 901
    .restart local v20    # "loader":Lorg/apache/tools/ant/AntClassLoader;
    invoke-virtual/range {v20 .. v20}, Lorg/apache/tools/ant/AntClassLoader;->cleanup()V

    .line 905
    .end local v20    # "loader":Lorg/apache/tools/ant/AntClassLoader;
    :cond_15
    return v26

    .line 848
    .end local v14    # "genericJar":Ljava/util/jar/JarFile;
    .end local v31    # "wlJar":Ljava/util/jar/JarFile;
    .restart local v9    # "e":Ljava/util/Enumeration;
    .restart local v12    # "genericEntries":Ljava/util/Hashtable;
    .restart local v15    # "genericJar":Ljava/util/jar/JarFile;
    .restart local v28    # "replaceEntries":Ljava/util/Hashtable;
    .restart local v29    # "wlEntries":Ljava/util/Hashtable;
    .restart local v32    # "wlJar":Ljava/util/jar/JarFile;
    :cond_16
    :try_start_13
    const-string/jumbo v33, "Weblogic Jar rebuild needed due to changed interface or XML"

    const/16 v34, 0x3

    move-object/from16 v0, p0

    move-object/from16 v1, v33

    move/from16 v2, v34

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool;->log(Ljava/lang/String;I)V
    :try_end_13
    .catch Ljava/lang/ClassNotFoundException; {:try_start_13 .. :try_end_13} :catch_0
    .catch Ljava/io/IOException; {:try_start_13 .. :try_end_13} :catch_1
    .catchall {:try_start_13 .. :try_end_13} :catchall_1

    goto :goto_f

    .line 852
    .end local v9    # "e":Ljava/util/Enumeration;
    .end local v12    # "genericEntries":Ljava/util/Hashtable;
    .end local v15    # "genericJar":Ljava/util/jar/JarFile;
    .end local v28    # "replaceEntries":Ljava/util/Hashtable;
    .end local v29    # "wlEntries":Ljava/util/Hashtable;
    .end local v32    # "wlJar":Ljava/util/jar/JarFile;
    .restart local v14    # "genericJar":Ljava/util/jar/JarFile;
    .restart local v31    # "wlJar":Ljava/util/jar/JarFile;
    :cond_17
    const/16 v26, 0x1

    goto :goto_10

    .line 871
    :catch_4
    move-exception v34

    goto/16 :goto_3

    .line 879
    :catch_5
    move-exception v34

    goto/16 :goto_4

    .line 887
    :catch_6
    move-exception v34

    goto/16 :goto_5

    .line 893
    :catch_7
    move-exception v27

    .line 894
    .local v27, "renameException":Ljava/io/IOException;
    invoke-virtual/range {v27 .. v27}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v34

    const/16 v35, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, v34

    move/from16 v2, v35

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool;->log(Ljava/lang/String;I)V

    .line 895
    const/16 v26, 0x1

    goto/16 :goto_6

    .line 871
    .end local v27    # "renameException":Ljava/io/IOException;
    :catch_8
    move-exception v33

    goto :goto_11

    .line 879
    :catch_9
    move-exception v33

    goto :goto_12

    .line 887
    :catch_a
    move-exception v33

    goto :goto_13

    .line 893
    :catch_b
    move-exception v27

    .line 894
    .restart local v27    # "renameException":Ljava/io/IOException;
    invoke-virtual/range {v27 .. v27}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v33

    const/16 v34, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, v33

    move/from16 v2, v34

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool;->log(Ljava/lang/String;I)V

    .line 895
    const/16 v26, 0x1

    goto :goto_14

    .line 868
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
    .end local v24    # "newWLJarFile":Ljava/io/File;
    .end local v31    # "wlJar":Ljava/util/jar/JarFile;
    .restart local v9    # "e":Ljava/util/Enumeration;
    .restart local v12    # "genericEntries":Ljava/util/Hashtable;
    .restart local v15    # "genericJar":Ljava/util/jar/JarFile;
    .restart local v25    # "newWLJarFile":Ljava/io/File;
    .restart local v28    # "replaceEntries":Ljava/util/Hashtable;
    .restart local v29    # "wlEntries":Ljava/util/Hashtable;
    .restart local v32    # "wlJar":Ljava/util/jar/JarFile;
    :catchall_4
    move-exception v33

    move-object/from16 v24, v25

    .end local v25    # "newWLJarFile":Ljava/io/File;
    .restart local v24    # "newWLJarFile":Ljava/io/File;
    move-object/from16 v31, v32

    .end local v32    # "wlJar":Ljava/util/jar/JarFile;
    .restart local v31    # "wlJar":Ljava/util/jar/JarFile;
    move-object v14, v15

    .end local v15    # "genericJar":Ljava/util/jar/JarFile;
    .restart local v14    # "genericJar":Ljava/util/jar/JarFile;
    goto/16 :goto_2

    .line 860
    .end local v9    # "e":Ljava/util/Enumeration;
    .end local v12    # "genericEntries":Ljava/util/Hashtable;
    .end local v28    # "replaceEntries":Ljava/util/Hashtable;
    .end local v29    # "wlEntries":Ljava/util/Hashtable;
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
    .end local v24    # "newWLJarFile":Ljava/io/File;
    .end local v31    # "wlJar":Ljava/util/jar/JarFile;
    .restart local v9    # "e":Ljava/util/Enumeration;
    .restart local v12    # "genericEntries":Ljava/util/Hashtable;
    .restart local v15    # "genericJar":Ljava/util/jar/JarFile;
    .restart local v25    # "newWLJarFile":Ljava/io/File;
    .restart local v28    # "replaceEntries":Ljava/util/Hashtable;
    .restart local v29    # "wlEntries":Ljava/util/Hashtable;
    .restart local v32    # "wlJar":Ljava/util/jar/JarFile;
    :catch_e
    move-exception v17

    move-object/from16 v24, v25

    .end local v25    # "newWLJarFile":Ljava/io/File;
    .restart local v24    # "newWLJarFile":Ljava/io/File;
    move-object/from16 v31, v32

    .end local v32    # "wlJar":Ljava/util/jar/JarFile;
    .restart local v31    # "wlJar":Ljava/util/jar/JarFile;
    move-object v14, v15

    .end local v15    # "genericJar":Ljava/util/jar/JarFile;
    .restart local v14    # "genericJar":Ljava/util/jar/JarFile;
    goto/16 :goto_8

    .line 854
    .end local v9    # "e":Ljava/util/Enumeration;
    .end local v12    # "genericEntries":Ljava/util/Hashtable;
    .end local v28    # "replaceEntries":Ljava/util/Hashtable;
    .end local v29    # "wlEntries":Ljava/util/Hashtable;
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
    .end local v24    # "newWLJarFile":Ljava/io/File;
    .end local v31    # "wlJar":Ljava/util/jar/JarFile;
    .restart local v9    # "e":Ljava/util/Enumeration;
    .restart local v12    # "genericEntries":Ljava/util/Hashtable;
    .restart local v15    # "genericJar":Ljava/util/jar/JarFile;
    .restart local v25    # "newWLJarFile":Ljava/io/File;
    .restart local v28    # "replaceEntries":Ljava/util/Hashtable;
    .restart local v29    # "wlEntries":Ljava/util/Hashtable;
    .restart local v32    # "wlJar":Ljava/util/jar/JarFile;
    :catch_11
    move-exception v7

    move-object/from16 v24, v25

    .end local v25    # "newWLJarFile":Ljava/io/File;
    .restart local v24    # "newWLJarFile":Ljava/io/File;
    move-object/from16 v31, v32

    .end local v32    # "wlJar":Ljava/util/jar/JarFile;
    .restart local v31    # "wlJar":Ljava/util/jar/JarFile;
    move-object v14, v15

    .end local v15    # "genericJar":Ljava/util/jar/JarFile;
    .restart local v14    # "genericJar":Ljava/util/jar/JarFile;
    goto/16 :goto_1
.end method

.method protected registerKnownDTDs(Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;)V
    .locals 2
    .param p1, "handler"    # Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;

    .prologue
    .line 406
    const-string/jumbo v0, "-//Sun Microsystems, Inc.//DTD Enterprise JavaBeans 1.1//EN"

    const-string/jumbo v1, "/weblogic/ejb/deployment/xml/ejb-jar.dtd"

    invoke-virtual {p1, v0, v1}, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;->registerDTD(Ljava/lang/String;Ljava/lang/String;)V

    .line 407
    const-string/jumbo v0, "-//Sun Microsystems, Inc.//DTD Enterprise JavaBeans 1.1//EN"

    const-string/jumbo v1, "/weblogic/ejb20/dd/xml/ejb11-jar.dtd"

    invoke-virtual {p1, v0, v1}, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;->registerDTD(Ljava/lang/String;Ljava/lang/String;)V

    .line 408
    const-string/jumbo v0, "-//Sun Microsystems, Inc.//DTD Enterprise JavaBeans 1.1//EN"

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool;->ejb11DTD:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;->registerDTD(Ljava/lang/String;Ljava/lang/String;)V

    .line 409
    const-string/jumbo v0, "-//Sun Microsystems, Inc.//DTD Enterprise JavaBeans 2.0//EN"

    const-string/jumbo v1, "/weblogic/ejb20/dd/xml/ejb20-jar.dtd"

    invoke-virtual {p1, v0, v1}, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;->registerDTD(Ljava/lang/String;Ljava/lang/String;)V

    .line 410
    return-void
.end method

.method public setArgs(Ljava/lang/String;)V
    .locals 0
    .param p1, "args"    # Ljava/lang/String;

    .prologue
    .line 292
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool;->additionalArgs:Ljava/lang/String;

    .line 293
    return-void
.end method

.method public setCompiler(Ljava/lang/String;)V
    .locals 0
    .param p1, "compiler"    # Ljava/lang/String;

    .prologue
    .line 212
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool;->compiler:Ljava/lang/String;

    .line 213
    return-void
.end method

.method public setEJBdtd(Ljava/lang/String;)V
    .locals 0
    .param p1, "inString"    # Ljava/lang/String;

    .prologue
    .line 359
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool;->ejb11DTD:Ljava/lang/String;

    .line 360
    return-void
.end method

.method public setEjbcClass(Ljava/lang/String;)V
    .locals 0
    .param p1, "ejbcClass"    # Ljava/lang/String;

    .prologue
    .line 314
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool;->ejbcClass:Ljava/lang/String;

    .line 315
    return-void
.end method

.method public setJvmDebugLevel(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "jvmDebugLevel"    # Ljava/lang/Integer;

    .prologue
    .line 239
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool;->jvmDebugLevel:Ljava/lang/Integer;

    .line 240
    return-void
.end method

.method public setJvmargs(Ljava/lang/String;)V
    .locals 0
    .param p1, "args"    # Ljava/lang/String;

    .prologue
    .line 301
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool;->additionalJvmArgs:Ljava/lang/String;

    .line 302
    return-void
.end method

.method public setKeepgenerated(Ljava/lang/String;)V
    .locals 1
    .param p1, "inValue"    # Ljava/lang/String;

    .prologue
    .line 282
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool;->keepgenerated:Z

    .line 283
    return-void
.end method

.method public setKeepgeneric(Z)V
    .locals 0
    .param p1, "inValue"    # Z

    .prologue
    .line 270
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool;->keepGeneric:Z

    .line 271
    return-void
.end method

.method public setNewCMP(Z)V
    .locals 0
    .param p1, "newCMP"    # Z

    .prologue
    .line 386
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool;->newCMP:Z

    .line 387
    return-void
.end method

.method public setNoEJBC(Z)V
    .locals 0
    .param p1, "noEJBC"    # Z

    .prologue
    .line 396
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool;->noEJBC:Z

    .line 397
    return-void
.end method

.method public setOldCMP(Z)V
    .locals 1
    .param p1, "oldCMP"    # Z

    .prologue
    .line 369
    if-nez p1, :cond_0

    const/4 v0, 0x1

    :goto_0
    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool;->newCMP:Z

    .line 370
    return-void

    .line 369
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setOutputDir(Ljava/io/File;)V
    .locals 0
    .param p1, "outputDir"    # Ljava/io/File;

    .prologue
    .line 180
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool;->outputDir:Ljava/io/File;

    .line 181
    return-void
.end method

.method public setRebuild(Z)V
    .locals 0
    .param p1, "rebuild"    # Z

    .prologue
    .line 228
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool;->alwaysRebuild:Z

    .line 229
    return-void
.end method

.method public setSuffix(Ljava/lang/String;)V
    .locals 0
    .param p1, "inString"    # Ljava/lang/String;

    .prologue
    .line 259
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool;->jarSuffix:Ljava/lang/String;

    .line 260
    return-void
.end method

.method public setWLClasspath(Lorg/apache/tools/ant/types/Path;)V
    .locals 0
    .param p1, "wlClasspath"    # Lorg/apache/tools/ant/types/Path;

    .prologue
    .line 195
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool;->wlClasspath:Lorg/apache/tools/ant/types/Path;

    .line 196
    return-void
.end method

.method public setWLdtd(Ljava/lang/String;)V
    .locals 0
    .param p1, "inString"    # Ljava/lang/String;

    .prologue
    .line 347
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool;->weblogicDTD:Ljava/lang/String;

    .line 348
    return-void
.end method

.method public setWeblogicdtd(Ljava/lang/String;)V
    .locals 0
    .param p1, "inString"    # Ljava/lang/String;

    .prologue
    .line 335
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool;->setEJBdtd(Ljava/lang/String;)V

    .line 336
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
    .line 680
    invoke-super {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->validateConfigured()V

    .line 681
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
    .line 660
    invoke-super {p0, p1}, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->getVendorOutputJarFile(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    .line 662
    .local v0, "genericJarFile":Ljava/io/File;
    invoke-super {p0, p1, v0, p3, p4}, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->writeJar(Ljava/lang/String;Ljava/io/File;Ljava/util/Hashtable;Ljava/lang/String;)V

    .line 664
    iget-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool;->alwaysRebuild:Z

    if-nez v1, :cond_0

    invoke-virtual {p0, v0, p2}, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool;->isRebuildRequired(Ljava/io/File;Ljava/io/File;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 665
    :cond_0
    invoke-direct {p0, v0, p2, p4}, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool;->buildWeblogicJar(Ljava/io/File;Ljava/io/File;Ljava/lang/String;)V

    .line 667
    :cond_1
    iget-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool;->keepGeneric:Z

    if-nez v1, :cond_2

    .line 668
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

    invoke-virtual {p0, v1, v2}, Lorg/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool;->log(Ljava/lang/String;I)V

    .line 670
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 672
    :cond_2
    return-void
.end method
