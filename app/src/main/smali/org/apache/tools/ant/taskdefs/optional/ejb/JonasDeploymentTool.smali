.class public Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;
.super Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;
.source "JonasDeploymentTool.java"


# static fields
.field protected static final DAVID_ORB:Ljava/lang/String; = "DAVID"

.field protected static final EJB_JAR_1_1_DTD:Ljava/lang/String; = "ejb-jar_1_1.dtd"

.field protected static final EJB_JAR_1_1_PUBLIC_ID:Ljava/lang/String; = "-//Sun Microsystems, Inc.//DTD Enterprise JavaBeans 1.1//EN"

.field protected static final EJB_JAR_2_0_DTD:Ljava/lang/String; = "ejb-jar_2_0.dtd"

.field protected static final EJB_JAR_2_0_PUBLIC_ID:Ljava/lang/String; = "-//Sun Microsystems, Inc.//DTD Enterprise JavaBeans 2.0//EN"

.field protected static final GENIC_CLASS:Ljava/lang/String; = "org.objectweb.jonas_ejb.genic.GenIC"

.field protected static final JEREMIE_ORB:Ljava/lang/String; = "JEREMIE"

.field protected static final JONAS_DD:Ljava/lang/String; = "jonas-ejb-jar.xml"

.field protected static final JONAS_EJB_JAR_2_4_DTD:Ljava/lang/String; = "jonas-ejb-jar_2_4.dtd"

.field protected static final JONAS_EJB_JAR_2_4_PUBLIC_ID:Ljava/lang/String; = "-//ObjectWeb//DTD JOnAS 2.4//EN"

.field protected static final JONAS_EJB_JAR_2_5_DTD:Ljava/lang/String; = "jonas-ejb-jar_2_5.dtd"

.field protected static final JONAS_EJB_JAR_2_5_PUBLIC_ID:Ljava/lang/String; = "-//ObjectWeb//DTD JOnAS 2.5//EN"

.field protected static final OLD_GENIC_CLASS_1:Ljava/lang/String; = "org.objectweb.jonas_ejb.tools.GenWholeIC"

.field protected static final OLD_GENIC_CLASS_2:Ljava/lang/String; = "org.objectweb.jonas_ejb.tools.GenIC"

.field protected static final RMI_ORB:Ljava/lang/String; = "RMI"


# instance fields
.field private additionalargs:Ljava/lang/String;

.field private descriptorName:Ljava/lang/String;

.field private javac:Ljava/lang/String;

.field private javacopts:Ljava/lang/String;

.field private jonasDescriptorName:Ljava/lang/String;

.field private jonasroot:Ljava/io/File;

.field private keepgenerated:Z

.field private keepgeneric:Z

.field private nocompil:Z

.field private nogenic:Z

.field private novalidation:Z

.field private orb:Ljava/lang/String;

.field private outputdir:Ljava/io/File;

.field private rmicopts:Ljava/lang/String;

.field private secpropag:Z

.field private suffix:Ljava/lang/String;

.field private verbose:Z


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 38
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;-><init>()V

    .line 119
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->keepgenerated:Z

    .line 125
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->nocompil:Z

    .line 131
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->novalidation:Z

    .line 151
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->secpropag:Z

    .line 157
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->verbose:Z

    .line 173
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->keepgeneric:Z

    .line 176
    const-string/jumbo v0, ".jar"

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->suffix:Ljava/lang/String;

    .line 189
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->nogenic:Z

    return-void
.end method

.method private addAllFiles(Ljava/io/File;Ljava/lang/String;Ljava/util/Hashtable;)V
    .locals 5
    .param p1, "file"    # Ljava/io/File;
    .param p2, "rootDir"    # Ljava/lang/String;
    .param p3, "hashtable"    # Ljava/util/Hashtable;

    .prologue
    .line 814
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v3

    if-nez v3, :cond_0

    .line 815
    new-instance v3, Ljava/lang/IllegalArgumentException;

    invoke-direct {v3}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v3

    .line 819
    :cond_0
    invoke-virtual {p1}, Ljava/io/File;->isDirectory()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 820
    invoke-virtual {p1}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v0

    .line 821
    .local v0, "files":[Ljava/io/File;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v3, v0

    if-ge v1, v3, :cond_3

    .line 822
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_1

    .line 823
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v3, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    sget-object v4, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    aget-object v4, v0, v1

    invoke-virtual {v4}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    .line 827
    .local v2, "newRootDir":Ljava/lang/String;
    :goto_1
    aget-object v3, v0, v1

    invoke-direct {p0, v3, v2, p3}, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->addAllFiles(Ljava/io/File;Ljava/lang/String;Ljava/util/Hashtable;)V

    .line 821
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 825
    .end local v2    # "newRootDir":Ljava/lang/String;
    :cond_1
    aget-object v3, v0, v1

    invoke-virtual {v3}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v2

    .restart local v2    # "newRootDir":Ljava/lang/String;
    goto :goto_1

    .line 830
    .end local v0    # "files":[Ljava/io/File;
    .end local v1    # "i":I
    .end local v2    # "newRootDir":Ljava/lang/String;
    :cond_2
    invoke-virtual {p3, p2, p1}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 832
    :cond_3
    return-void
.end method

.method private addGenICGeneratedFiles(Ljava/io/File;Ljava/util/Hashtable;)V
    .locals 15
    .param p1, "genericJarFile"    # Ljava/io/File;
    .param p2, "ejbFiles"    # Ljava/util/Hashtable;

    .prologue
    .line 520
    const/4 v5, 0x0

    .line 521
    .local v5, "genicTask":Lorg/apache/tools/ant/taskdefs/Java;
    const/4 v4, 0x0

    .line 523
    .local v4, "genicClass":Ljava/lang/String;
    iget-boolean v12, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->nogenic:Z

    if-eqz v12, :cond_0

    .line 668
    :goto_0
    return-void

    .line 527
    :cond_0
    new-instance v5, Lorg/apache/tools/ant/taskdefs/Java;

    .end local v5    # "genicTask":Lorg/apache/tools/ant/taskdefs/Java;
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->getTask()Lorg/apache/tools/ant/Task;

    move-result-object v12

    invoke-direct {v5, v12}, Lorg/apache/tools/ant/taskdefs/Java;-><init>(Lorg/apache/tools/ant/Task;)V

    .line 528
    .restart local v5    # "genicTask":Lorg/apache/tools/ant/taskdefs/Java;
    const-string/jumbo v12, "genic"

    invoke-virtual {v5, v12}, Lorg/apache/tools/ant/taskdefs/Java;->setTaskName(Ljava/lang/String;)V

    .line 529
    const/4 v12, 0x1

    invoke-virtual {v5, v12}, Lorg/apache/tools/ant/taskdefs/Java;->setFork(Z)V

    .line 532
    invoke-virtual {v5}, Lorg/apache/tools/ant/taskdefs/Java;->createJvmarg()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v12

    new-instance v13, Ljava/lang/StringBuffer;

    invoke-direct {v13}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v14, "-Dinstall.root="

    invoke-virtual {v13, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v13

    iget-object v14, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->jonasroot:Ljava/io/File;

    invoke-virtual {v13, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 535
    new-instance v12, Ljava/lang/StringBuffer;

    invoke-direct {v12}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v13, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->jonasroot:Ljava/io/File;

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v12

    sget-object v13, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    const-string/jumbo v13, "config"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    .line 536
    .local v7, "jonasConfigDir":Ljava/lang/String;
    new-instance v6, Ljava/io/File;

    const-string/jumbo v12, "java.policy"

    invoke-direct {v6, v7, v12}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 537
    .local v6, "javaPolicyFile":Ljava/io/File;
    invoke-virtual {v6}, Ljava/io/File;->exists()Z

    move-result v12

    if-eqz v12, :cond_1

    .line 538
    invoke-virtual {v5}, Lorg/apache/tools/ant/taskdefs/Java;->createJvmarg()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v12

    new-instance v13, Ljava/lang/StringBuffer;

    invoke-direct {v13}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v14, "-Djava.security.policy="

    invoke-virtual {v13, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v13

    invoke-virtual {v6}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 544
    :cond_1
    :try_start_0
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->createTempDir()Ljava/io/File;

    move-result-object v12

    iput-object v12, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->outputdir:Ljava/io/File;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 549
    new-instance v12, Ljava/lang/StringBuffer;

    invoke-direct {v12}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v13, "Using temporary output directory: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    iget-object v13, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->outputdir:Ljava/io/File;

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v12

    const/4 v13, 0x3

    invoke-virtual {p0, v12, v13}, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->log(Ljava/lang/String;I)V

    .line 551
    invoke-virtual {v5}, Lorg/apache/tools/ant/taskdefs/Java;->createArg()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v12

    const-string/jumbo v13, "-d"

    invoke-virtual {v12, v13}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 552
    invoke-virtual {v5}, Lorg/apache/tools/ant/taskdefs/Java;->createArg()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v12

    iget-object v13, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->outputdir:Ljava/io/File;

    invoke-virtual {v12, v13}, Lorg/apache/tools/ant/types/Commandline$Argument;->setFile(Ljava/io/File;)V

    .line 557
    invoke-virtual/range {p2 .. p2}, Ljava/util/Hashtable;->keys()Ljava/util/Enumeration;

    move-result-object v9

    .line 558
    .local v9, "keys":Ljava/util/Enumeration;
    :goto_1
    invoke-interface {v9}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v12

    if-eqz v12, :cond_2

    .line 559
    invoke-interface {v9}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    .line 560
    .local v8, "key":Ljava/lang/String;
    new-instance v3, Ljava/io/File;

    new-instance v12, Ljava/lang/StringBuffer;

    invoke-direct {v12}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v13, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->outputdir:Ljava/io/File;

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v12

    sget-object v13, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    invoke-virtual {v12, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v3, v12}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 561
    .local v3, "f":Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v12

    invoke-virtual {v12}, Ljava/io/File;->mkdirs()Z

    goto :goto_1

    .line 545
    .end local v3    # "f":Ljava/io/File;
    .end local v8    # "key":Ljava/lang/String;
    .end local v9    # "keys":Ljava/util/Enumeration;
    :catch_0
    move-exception v1

    .line 546
    .local v1, "aIOException":Ljava/io/IOException;
    new-instance v12, Ljava/lang/StringBuffer;

    invoke-direct {v12}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v13, "Cannot create temp dir: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    .line 547
    .local v10, "msg":Ljava/lang/String;
    new-instance v12, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v12, v10, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v12

    .line 563
    .end local v1    # "aIOException":Ljava/io/IOException;
    .end local v10    # "msg":Ljava/lang/String;
    .restart local v9    # "keys":Ljava/util/Enumeration;
    :cond_2
    const-string/jumbo v12, "Worked around a bug of GenIC 2.5."

    const/4 v13, 0x3

    invoke-virtual {p0, v12, v13}, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->log(Ljava/lang/String;I)V

    .line 566
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->getCombinedClasspath()Lorg/apache/tools/ant/types/Path;

    move-result-object v2

    .line 567
    .local v2, "classpath":Lorg/apache/tools/ant/types/Path;
    if-nez v2, :cond_3

    .line 568
    new-instance v2, Lorg/apache/tools/ant/types/Path;

    .end local v2    # "classpath":Lorg/apache/tools/ant/types/Path;
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->getTask()Lorg/apache/tools/ant/Task;

    move-result-object v12

    invoke-virtual {v12}, Lorg/apache/tools/ant/Task;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v12

    invoke-direct {v2, v12}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;)V

    .line 570
    .restart local v2    # "classpath":Lorg/apache/tools/ant/types/Path;
    :cond_3
    new-instance v12, Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Path;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v13

    invoke-direct {v12, v13, v7}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;Ljava/lang/String;)V

    invoke-virtual {v2, v12}, Lorg/apache/tools/ant/types/Path;->append(Lorg/apache/tools/ant/types/Path;)V

    .line 571
    new-instance v12, Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Path;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v13

    iget-object v14, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->outputdir:Ljava/io/File;

    invoke-virtual {v14}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-direct {v12, v13, v14}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;Ljava/lang/String;)V

    invoke-virtual {v2, v12}, Lorg/apache/tools/ant/types/Path;->append(Lorg/apache/tools/ant/types/Path;)V

    .line 574
    iget-object v12, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->orb:Ljava/lang/String;

    if-eqz v12, :cond_4

    .line 575
    new-instance v12, Ljava/lang/StringBuffer;

    invoke-direct {v12}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v13, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->jonasroot:Ljava/io/File;

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v12

    sget-object v13, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    const-string/jumbo v13, "lib"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    sget-object v13, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    iget-object v13, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->orb:Ljava/lang/String;

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    const-string/jumbo v13, "_jonas.jar"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v11

    .line 577
    .local v11, "orbJar":Ljava/lang/String;
    new-instance v12, Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Path;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v13

    invoke-direct {v12, v13, v11}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;Ljava/lang/String;)V

    invoke-virtual {v2, v12}, Lorg/apache/tools/ant/types/Path;->append(Lorg/apache/tools/ant/types/Path;)V

    .line 579
    .end local v11    # "orbJar":Ljava/lang/String;
    :cond_4
    new-instance v12, Ljava/lang/StringBuffer;

    invoke-direct {v12}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v13, "Using classpath: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Path;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v12

    const/4 v13, 0x3

    invoke-virtual {p0, v12, v13}, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->log(Ljava/lang/String;I)V

    .line 580
    invoke-virtual {v5, v2}, Lorg/apache/tools/ant/taskdefs/Java;->setClasspath(Lorg/apache/tools/ant/types/Path;)V

    .line 583
    invoke-virtual {p0, v2}, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->getGenicClassName(Lorg/apache/tools/ant/types/Path;)Ljava/lang/String;

    move-result-object v4

    .line 584
    if-nez v4, :cond_5

    .line 585
    const-string/jumbo v12, "Cannot find GenIC class in classpath."

    const/4 v13, 0x0

    invoke-virtual {p0, v12, v13}, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->log(Ljava/lang/String;I)V

    .line 586
    new-instance v12, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v13, "GenIC class not found, please check the classpath."

    invoke-direct {v12, v13}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v12

    .line 588
    :cond_5
    new-instance v12, Ljava/lang/StringBuffer;

    invoke-direct {v12}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v13, "Using \'"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    invoke-virtual {v12, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    const-string/jumbo v13, "\' GenIC class."

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v12

    const/4 v13, 0x3

    invoke-virtual {p0, v12, v13}, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->log(Ljava/lang/String;I)V

    .line 589
    invoke-virtual {v5, v4}, Lorg/apache/tools/ant/taskdefs/Java;->setClassname(Ljava/lang/String;)V

    .line 593
    iget-boolean v12, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->keepgenerated:Z

    if-eqz v12, :cond_6

    .line 594
    invoke-virtual {v5}, Lorg/apache/tools/ant/taskdefs/Java;->createArg()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v12

    const-string/jumbo v13, "-keepgenerated"

    invoke-virtual {v12, v13}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 598
    :cond_6
    iget-boolean v12, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->nocompil:Z

    if-eqz v12, :cond_7

    .line 599
    invoke-virtual {v5}, Lorg/apache/tools/ant/taskdefs/Java;->createArg()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v12

    const-string/jumbo v13, "-nocompil"

    invoke-virtual {v12, v13}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 603
    :cond_7
    iget-boolean v12, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->novalidation:Z

    if-eqz v12, :cond_8

    .line 604
    invoke-virtual {v5}, Lorg/apache/tools/ant/taskdefs/Java;->createArg()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v12

    const-string/jumbo v13, "-novalidation"

    invoke-virtual {v12, v13}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 608
    :cond_8
    iget-object v12, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->javac:Ljava/lang/String;

    if-eqz v12, :cond_9

    .line 609
    invoke-virtual {v5}, Lorg/apache/tools/ant/taskdefs/Java;->createArg()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v12

    const-string/jumbo v13, "-javac"

    invoke-virtual {v12, v13}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 610
    invoke-virtual {v5}, Lorg/apache/tools/ant/taskdefs/Java;->createArg()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v12

    iget-object v13, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->javac:Ljava/lang/String;

    invoke-virtual {v12, v13}, Lorg/apache/tools/ant/types/Commandline$Argument;->setLine(Ljava/lang/String;)V

    .line 614
    :cond_9
    iget-object v12, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->javacopts:Ljava/lang/String;

    if-eqz v12, :cond_a

    iget-object v12, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->javacopts:Ljava/lang/String;

    const-string/jumbo v13, ""

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_a

    .line 615
    invoke-virtual {v5}, Lorg/apache/tools/ant/taskdefs/Java;->createArg()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v12

    const-string/jumbo v13, "-javacopts"

    invoke-virtual {v12, v13}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 616
    invoke-virtual {v5}, Lorg/apache/tools/ant/taskdefs/Java;->createArg()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v12

    iget-object v13, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->javacopts:Ljava/lang/String;

    invoke-virtual {v12, v13}, Lorg/apache/tools/ant/types/Commandline$Argument;->setLine(Ljava/lang/String;)V

    .line 620
    :cond_a
    iget-object v12, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->rmicopts:Ljava/lang/String;

    if-eqz v12, :cond_b

    iget-object v12, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->rmicopts:Ljava/lang/String;

    const-string/jumbo v13, ""

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_b

    .line 621
    invoke-virtual {v5}, Lorg/apache/tools/ant/taskdefs/Java;->createArg()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v12

    const-string/jumbo v13, "-rmicopts"

    invoke-virtual {v12, v13}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 622
    invoke-virtual {v5}, Lorg/apache/tools/ant/taskdefs/Java;->createArg()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v12

    iget-object v13, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->rmicopts:Ljava/lang/String;

    invoke-virtual {v12, v13}, Lorg/apache/tools/ant/types/Commandline$Argument;->setLine(Ljava/lang/String;)V

    .line 626
    :cond_b
    iget-boolean v12, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->secpropag:Z

    if-eqz v12, :cond_c

    .line 627
    invoke-virtual {v5}, Lorg/apache/tools/ant/taskdefs/Java;->createArg()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v12

    const-string/jumbo v13, "-secpropag"

    invoke-virtual {v12, v13}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 631
    :cond_c
    iget-boolean v12, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->verbose:Z

    if-eqz v12, :cond_d

    .line 632
    invoke-virtual {v5}, Lorg/apache/tools/ant/taskdefs/Java;->createArg()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v12

    const-string/jumbo v13, "-verbose"

    invoke-virtual {v12, v13}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 636
    :cond_d
    iget-object v12, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->additionalargs:Ljava/lang/String;

    if-eqz v12, :cond_e

    .line 637
    invoke-virtual {v5}, Lorg/apache/tools/ant/taskdefs/Java;->createArg()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v12

    iget-object v13, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->additionalargs:Ljava/lang/String;

    invoke-virtual {v12, v13}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 642
    :cond_e
    invoke-virtual {v5}, Lorg/apache/tools/ant/taskdefs/Java;->createArg()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v12

    const-string/jumbo v13, "-noaddinjar"

    invoke-virtual {v12, v13}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 645
    invoke-virtual {v5}, Lorg/apache/tools/ant/taskdefs/Java;->createArg()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v12

    invoke-virtual/range {p1 .. p1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 648
    new-instance v12, Ljava/lang/StringBuffer;

    invoke-direct {v12}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v13, "Calling "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    invoke-virtual {v12, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    const-string/jumbo v13, " for "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->getConfig()Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;

    move-result-object v13

    iget-object v13, v13, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;->descriptorDir:Ljava/io/File;

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v12

    sget-object v13, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    iget-object v13, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->descriptorName:Ljava/lang/String;

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    const-string/jumbo v13, "."

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v12

    const/4 v13, 0x3

    invoke-virtual {p0, v12, v13}, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->log(Ljava/lang/String;I)V

    .line 651
    invoke-virtual {v5}, Lorg/apache/tools/ant/taskdefs/Java;->executeJava()I

    move-result v12

    if-eqz v12, :cond_10

    .line 654
    new-instance v12, Ljava/lang/StringBuffer;

    invoke-direct {v12}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v13, "Deleting temp output directory \'"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    iget-object v13, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->outputdir:Ljava/io/File;

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v12

    const-string/jumbo v13, "\'."

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v12

    const/4 v13, 0x3

    invoke-virtual {p0, v12, v13}, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->log(Ljava/lang/String;I)V

    .line 655
    iget-object v12, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->outputdir:Ljava/io/File;

    invoke-direct {p0, v12}, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->deleteAllFiles(Ljava/io/File;)V

    .line 657
    iget-boolean v12, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->keepgeneric:Z

    if-nez v12, :cond_f

    .line 658
    new-instance v12, Ljava/lang/StringBuffer;

    invoke-direct {v12}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v13, "Deleting generic JAR "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    invoke-virtual/range {p1 .. p1}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v12

    const/4 v13, 0x3

    invoke-virtual {p0, v12, v13}, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->log(Ljava/lang/String;I)V

    .line 660
    invoke-virtual/range {p1 .. p1}, Ljava/io/File;->delete()Z

    .line 663
    :cond_f
    new-instance v12, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v13, "GenIC reported an error."

    invoke-direct {v12, v13}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v12

    .line 667
    :cond_10
    iget-object v12, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->outputdir:Ljava/io/File;

    const-string/jumbo v13, ""

    move-object/from16 v0, p2

    invoke-direct {p0, v12, v13, v0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->addAllFiles(Ljava/io/File;Ljava/lang/String;Ljava/util/Hashtable;)V

    goto/16 :goto_0
.end method

.method private createTempDir()Ljava/io/File;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 779
    const-string/jumbo v1, "genic"

    invoke-static {v1, v2, v2}, Ljava/io/File;->createTempFile(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)Ljava/io/File;

    move-result-object v0

    .line 780
    .local v0, "tmpDir":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 781
    invoke-virtual {v0}, Ljava/io/File;->mkdir()Z

    move-result v1

    if-nez v1, :cond_0

    .line 782
    new-instance v1, Ljava/io/IOException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "Cannot create the temporary directory \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, "\'."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 784
    :cond_0
    return-object v0
.end method

.method private deleteAllFiles(Ljava/io/File;)V
    .locals 3
    .param p1, "aFile"    # Ljava/io/File;

    .prologue
    .line 794
    invoke-virtual {p1}, Ljava/io/File;->isDirectory()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 795
    invoke-virtual {p1}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v1

    .line 797
    .local v1, "someFiles":[Ljava/io/File;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v2, v1

    if-ge v0, v2, :cond_0

    .line 798
    aget-object v2, v1, v0

    invoke-direct {p0, v2}, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->deleteAllFiles(Ljava/io/File;)V

    .line 797
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 801
    .end local v0    # "i":I
    .end local v1    # "someFiles":[Ljava/io/File;
    :cond_0
    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    .line 802
    return-void
.end method

.method private getJonasDescriptorName()Ljava/lang/String;
    .locals 12

    .prologue
    const/4 v11, 0x3

    .line 401
    const/4 v3, 0x0

    .line 407
    .local v3, "jonasConvention":Z
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->descriptorName:Ljava/lang/String;

    sget-char v9, Ljava/io/File;->separatorChar:C

    invoke-virtual {v8, v9}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v7

    .line 408
    .local v7, "startOfFileName":I
    const/4 v8, -0x1

    if-eq v7, v8, :cond_0

    .line 410
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->descriptorName:Ljava/lang/String;

    const/4 v9, 0x0

    add-int/lit8 v10, v7, 0x1

    invoke-virtual {v8, v9, v10}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    .line 411
    .local v5, "path":Ljava/lang/String;
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->descriptorName:Ljava/lang/String;

    add-int/lit8 v9, v7, 0x1

    invoke-virtual {v8, v9}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    .line 418
    .local v2, "fileName":Ljava/lang/String;
    :goto_0
    const-string/jumbo v8, "ejb-jar.xml"

    invoke-virtual {v2, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 419
    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v8, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    const-string/jumbo v9, "jonas-ejb-jar.xml"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    .line 455
    :goto_1
    return-object v4

    .line 414
    .end local v2    # "fileName":Ljava/lang/String;
    .end local v5    # "path":Ljava/lang/String;
    :cond_0
    const-string/jumbo v5, ""

    .line 415
    .restart local v5    # "path":Ljava/lang/String;
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->descriptorName:Ljava/lang/String;

    .restart local v2    # "fileName":Ljava/lang/String;
    goto :goto_0

    .line 422
    :cond_1
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->descriptorName:Ljava/lang/String;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->getConfig()Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;

    move-result-object v9

    iget-object v9, v9, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;->baseNameTerminator:Ljava/lang/String;

    invoke-virtual {v8, v9, v7}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v1

    .line 429
    .local v1, "endOfBaseName":I
    if-gez v1, :cond_3

    .line 434
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->descriptorName:Ljava/lang/String;

    const/16 v9, 0x2e

    invoke-virtual {v8, v9}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v8

    add-int/lit8 v1, v8, -0x1

    .line 435
    if-gez v1, :cond_2

    .line 437
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->descriptorName:Ljava/lang/String;

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v8

    add-int/lit8 v1, v8, -0x1

    .line 440
    :cond_2
    const/4 v3, 0x1

    .line 443
    :cond_3
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->descriptorName:Ljava/lang/String;

    add-int/lit8 v9, v7, 0x1

    add-int/lit8 v10, v1, 0x1

    invoke-virtual {v8, v9, v10}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 444
    .local v0, "baseName":Ljava/lang/String;
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->descriptorName:Ljava/lang/String;

    add-int/lit8 v9, v1, 0x1

    invoke-virtual {v8, v9}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    .line 446
    .local v6, "remainder":Ljava/lang/String;
    if-eqz v3, :cond_4

    .line 447
    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v8, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    const-string/jumbo v9, "jonas-"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    const-string/jumbo v9, ".xml"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    .line 452
    .local v4, "jonasDN":Ljava/lang/String;
    :goto_2
    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v9, "Standard EJB descriptor name: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->descriptorName:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0, v8, v11}, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->log(Ljava/lang/String;I)V

    .line 453
    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v9, "JOnAS-specific descriptor name: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0, v8, v11}, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->log(Ljava/lang/String;I)V

    goto/16 :goto_1

    .line 449
    .end local v4    # "jonasDN":Ljava/lang/String;
    :cond_4
    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v8, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    const-string/jumbo v9, "jonas-"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    .restart local v4    # "jonasDN":Ljava/lang/String;
    goto :goto_2
.end method


# virtual methods
.method protected addVendorFiles(Ljava/util/Hashtable;Ljava/lang/String;)V
    .locals 3
    .param p1, "ejbFiles"    # Ljava/util/Hashtable;
    .param p2, "ddPrefix"    # Ljava/lang/String;

    .prologue
    .line 370
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->getJonasDescriptorName()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->jonasDescriptorName:Ljava/lang/String;

    .line 371
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->getConfig()Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;

    move-result-object v1

    iget-object v1, v1, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;->descriptorDir:Ljava/io/File;

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->jonasDescriptorName:Ljava/lang/String;

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 373
    .local v0, "jonasDD":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 374
    const-string/jumbo v1, "META-INF/jonas-ejb-jar.xml"

    invoke-virtual {p1, v1, v0}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 379
    :goto_0
    return-void

    .line 376
    :cond_0
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "Unable to locate the JOnAS deployment descriptor. It was expected to be in: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, "."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {p0, v1, v2}, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->log(Ljava/lang/String;I)V

    goto :goto_0
.end method

.method protected checkConfiguration(Ljava/lang/String;Ljavax/xml/parsers/SAXParser;)V
    .locals 3
    .param p1, "descriptorFileName"    # Ljava/lang/String;
    .param p2, "saxParser"    # Ljavax/xml/parsers/SAXParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 742
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->jonasroot:Ljava/io/File;

    if-nez v0, :cond_0

    .line 743
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "The jonasroot attribut is not set."

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 744
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->jonasroot:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-nez v0, :cond_1

    .line 745
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "The jonasroot attribut \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->jonasroot:Ljava/io/File;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, "\' is not a valid directory."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 750
    :cond_1
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->orb:Ljava/lang/String;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->orb:Ljava/lang/String;

    const-string/jumbo v1, "RMI"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->orb:Ljava/lang/String;

    const-string/jumbo v1, "JEREMIE"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->orb:Ljava/lang/String;

    const-string/jumbo v1, "DAVID"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 752
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "The orb attribut \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->orb:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, "\' is not valid (must be either "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, "RMI"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, "JEREMIE"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, " or "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, "DAVID"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, ")."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 758
    :cond_2
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->additionalargs:Ljava/lang/String;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->additionalargs:Ljava/lang/String;

    const-string/jumbo v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 759
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Empty additionalargs attribut."

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 763
    :cond_3
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->javac:Ljava/lang/String;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->javac:Ljava/lang/String;

    const-string/jumbo v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 764
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Empty javac attribut."

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 766
    :cond_4
    return-void
.end method

.method getGenicClassName(Lorg/apache/tools/ant/types/Path;)Ljava/lang/String;
    .locals 7
    .param p1, "classpath"    # Lorg/apache/tools/ant/types/Path;

    .prologue
    const/4 v6, 0x3

    .line 679
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "Looking for GenIC class in classpath: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Path;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4, v6}, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->log(Ljava/lang/String;I)V

    .line 682
    const/4 v0, 0x0

    .line 685
    .local v0, "cl":Lorg/apache/tools/ant/AntClassLoader;
    :try_start_0
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Path;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v4

    invoke-virtual {v4, p1}, Lorg/apache/tools/ant/Project;->createClassLoader(Lorg/apache/tools/ant/types/Path;)Lorg/apache/tools/ant/AntClassLoader;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    .line 688
    :try_start_1
    const-string/jumbo v4, "org.objectweb.jonas_ejb.genic.GenIC"

    invoke-virtual {v0, v4}, Lorg/apache/tools/ant/AntClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    .line 689
    const-string/jumbo v4, "Found GenIC class \'org.objectweb.jonas_ejb.genic.GenIC\' in classpath."

    const/4 v5, 0x3

    invoke-virtual {p0, v4, v5}, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->log(Ljava/lang/String;I)V

    .line 691
    const-string/jumbo v4, "org.objectweb.jonas_ejb.genic.GenIC"
    :try_end_1
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 725
    if-eqz v0, :cond_0

    .line 726
    invoke-virtual {v0}, Lorg/apache/tools/ant/AntClassLoader;->cleanup()V

    .line 729
    :cond_0
    :goto_0
    return-object v4

    .line 693
    :catch_0
    move-exception v1

    .line 694
    .local v1, "cnf1":Ljava/lang/ClassNotFoundException;
    :try_start_2
    const-string/jumbo v4, "GenIC class \'org.objectweb.jonas_ejb.genic.GenIC\' not found in classpath."

    const/4 v5, 0x3

    invoke-virtual {p0, v4, v5}, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->log(Ljava/lang/String;I)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 700
    :try_start_3
    const-string/jumbo v4, "org.objectweb.jonas_ejb.tools.GenWholeIC"

    invoke-virtual {v0, v4}, Lorg/apache/tools/ant/AntClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    .line 701
    const-string/jumbo v4, "Found GenIC class \'org.objectweb.jonas_ejb.tools.GenWholeIC\' in classpath."

    const/4 v5, 0x3

    invoke-virtual {p0, v4, v5}, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->log(Ljava/lang/String;I)V

    .line 704
    const-string/jumbo v4, "org.objectweb.jonas_ejb.tools.GenWholeIC"
    :try_end_3
    .catch Ljava/lang/ClassNotFoundException; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 725
    if-eqz v0, :cond_0

    .line 726
    invoke-virtual {v0}, Lorg/apache/tools/ant/AntClassLoader;->cleanup()V

    goto :goto_0

    .line 706
    :catch_1
    move-exception v2

    .line 707
    .local v2, "cnf2":Ljava/lang/ClassNotFoundException;
    :try_start_4
    const-string/jumbo v4, "GenIC class \'org.objectweb.jonas_ejb.tools.GenWholeIC\' not found in classpath."

    const/4 v5, 0x3

    invoke-virtual {p0, v4, v5}, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->log(Ljava/lang/String;I)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 713
    :try_start_5
    const-string/jumbo v4, "org.objectweb.jonas_ejb.tools.GenIC"

    invoke-virtual {v0, v4}, Lorg/apache/tools/ant/AntClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    .line 714
    const-string/jumbo v4, "Found GenIC class \'org.objectweb.jonas_ejb.tools.GenIC\' in classpath."

    const/4 v5, 0x3

    invoke-virtual {p0, v4, v5}, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->log(Ljava/lang/String;I)V

    .line 717
    const-string/jumbo v4, "org.objectweb.jonas_ejb.tools.GenIC"
    :try_end_5
    .catch Ljava/lang/ClassNotFoundException; {:try_start_5 .. :try_end_5} :catch_2
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 725
    if-eqz v0, :cond_0

    .line 726
    invoke-virtual {v0}, Lorg/apache/tools/ant/AntClassLoader;->cleanup()V

    goto :goto_0

    .line 719
    :catch_2
    move-exception v3

    .line 720
    .local v3, "cnf3":Ljava/lang/ClassNotFoundException;
    :try_start_6
    const-string/jumbo v4, "GenIC class \'org.objectweb.jonas_ejb.tools.GenIC\' not found in classpath."

    const/4 v5, 0x3

    invoke-virtual {p0, v4, v5}, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->log(Ljava/lang/String;I)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 725
    if-eqz v0, :cond_1

    .line 726
    invoke-virtual {v0}, Lorg/apache/tools/ant/AntClassLoader;->cleanup()V

    .line 729
    :cond_1
    const/4 v4, 0x0

    goto :goto_0

    .line 725
    .end local v1    # "cnf1":Ljava/lang/ClassNotFoundException;
    .end local v2    # "cnf2":Ljava/lang/ClassNotFoundException;
    .end local v3    # "cnf3":Ljava/lang/ClassNotFoundException;
    :catchall_0
    move-exception v4

    if-eqz v0, :cond_2

    .line 726
    invoke-virtual {v0}, Lorg/apache/tools/ant/AntClassLoader;->cleanup()V

    :cond_2
    throw v4
.end method

.method protected getJarBaseName(Ljava/lang/String;)Ljava/lang/String;
    .locals 8
    .param p1, "descriptorFileName"    # Ljava/lang/String;

    .prologue
    const/16 v7, 0x2f

    const/4 v6, -0x1

    .line 461
    const/4 v1, 0x0

    .line 463
    .local v1, "baseName":Ljava/lang/String;
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->getConfig()Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;

    move-result-object v4

    iget-object v4, v4, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;->namingScheme:Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$NamingScheme;

    invoke-virtual {v4}, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$NamingScheme;->getValue()Ljava/lang/String;

    move-result-object v4

    const-string/jumbo v5, "descriptor"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 466
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->getConfig()Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;

    move-result-object v4

    iget-object v4, v4, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;->baseNameTerminator:Ljava/lang/String;

    invoke-virtual {p1, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v4

    if-ne v4, v6, :cond_0

    .line 473
    const/16 v4, 0x5c

    invoke-virtual {p1, v4, v7}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v0

    .line 474
    .local v0, "aCanonicalDescriptor":Ljava/lang/String;
    invoke-virtual {v0, v7}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v3

    .line 477
    .local v3, "lastSeparatorIndex":I
    if-eq v3, v6, :cond_2

    .line 478
    const-string/jumbo v4, ".xml"

    invoke-virtual {p1, v4, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v2

    .line 483
    .local v2, "endOfBaseName":I
    :goto_0
    if-eq v2, v6, :cond_0

    .line 484
    const/4 v4, 0x0

    invoke-virtual {p1, v4, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 489
    .end local v0    # "aCanonicalDescriptor":Ljava/lang/String;
    .end local v2    # "endOfBaseName":I
    .end local v3    # "lastSeparatorIndex":I
    :cond_0
    if-nez v1, :cond_1

    .line 491
    invoke-super {p0, p1}, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->getJarBaseName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 494
    :cond_1
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "JAR base name: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x3

    invoke-virtual {p0, v4, v5}, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->log(Ljava/lang/String;I)V

    .line 496
    return-object v1

    .line 480
    .restart local v0    # "aCanonicalDescriptor":Ljava/lang/String;
    .restart local v3    # "lastSeparatorIndex":I
    :cond_2
    const-string/jumbo v4, ".xml"

    invoke-virtual {p1, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    .restart local v2    # "endOfBaseName":I
    goto :goto_0
.end method

.method protected getVendorOutputJarFile(Ljava/lang/String;)Ljava/io/File;
    .locals 4
    .param p1, "baseName"    # Ljava/lang/String;

    .prologue
    .line 383
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->getDestDir()Ljava/io/File;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->suffix:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v0
.end method

.method public processDescriptor(Ljava/lang/String;Ljavax/xml/parsers/SAXParser;)V
    .locals 3
    .param p1, "aDescriptorName"    # Ljava/lang/String;
    .param p2, "saxParser"    # Ljavax/xml/parsers/SAXParser;

    .prologue
    const/4 v2, 0x3

    .line 332
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->descriptorName:Ljava/lang/String;

    .line 334
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v1, "JOnAS Deployment Tool processing: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->descriptorName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, v2}, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->log(Ljava/lang/String;I)V

    .line 337
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->descriptorName:Ljava/lang/String;

    invoke-super {p0, v0, p2}, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->processDescriptor(Ljava/lang/String;Ljavax/xml/parsers/SAXParser;)V

    .line 339
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->outputdir:Ljava/io/File;

    if-eqz v0, :cond_0

    .line 341
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v1, "Deleting temp output directory \'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->outputdir:Ljava/io/File;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string/jumbo v1, "\'."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, v2}, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->log(Ljava/lang/String;I)V

    .line 342
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->outputdir:Ljava/io/File;

    invoke-direct {p0, v0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->deleteAllFiles(Ljava/io/File;)V

    .line 344
    :cond_0
    return-void
.end method

.method protected registerKnownDTDs(Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;)V
    .locals 3
    .param p1, "handler"    # Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;

    .prologue
    .line 501
    const-string/jumbo v0, "-//Sun Microsystems, Inc.//DTD Enterprise JavaBeans 1.1//EN"

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->jonasroot:Ljava/io/File;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    sget-object v2, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, "xml"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    sget-object v2, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, "ejb-jar_1_1.dtd"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;->registerDTD(Ljava/lang/String;Ljava/lang/String;)V

    .line 503
    const-string/jumbo v0, "-//Sun Microsystems, Inc.//DTD Enterprise JavaBeans 2.0//EN"

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->jonasroot:Ljava/io/File;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    sget-object v2, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, "xml"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    sget-object v2, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, "ejb-jar_2_0.dtd"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;->registerDTD(Ljava/lang/String;Ljava/lang/String;)V

    .line 506
    const-string/jumbo v0, "-//ObjectWeb//DTD JOnAS 2.4//EN"

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->jonasroot:Ljava/io/File;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    sget-object v2, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, "xml"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    sget-object v2, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, "jonas-ejb-jar_2_4.dtd"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;->registerDTD(Ljava/lang/String;Ljava/lang/String;)V

    .line 508
    const-string/jumbo v0, "-//ObjectWeb//DTD JOnAS 2.5//EN"

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->jonasroot:Ljava/io/File;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    sget-object v2, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, "xml"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    sget-object v2, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, "jonas-ejb-jar_2_5.dtd"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;->registerDTD(Ljava/lang/String;Ljava/lang/String;)V

    .line 510
    return-void
.end method

.method public setAdditionalargs(Ljava/lang/String;)V
    .locals 0
    .param p1, "aString"    # Ljava/lang/String;

    .prologue
    .line 210
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->additionalargs:Ljava/lang/String;

    .line 211
    return-void
.end method

.method public setJarsuffix(Ljava/lang/String;)V
    .locals 0
    .param p1, "aString"    # Ljava/lang/String;

    .prologue
    .line 304
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->suffix:Ljava/lang/String;

    .line 305
    return-void
.end method

.method public setJavac(Ljava/lang/String;)V
    .locals 0
    .param p1, "aString"    # Ljava/lang/String;

    .prologue
    .line 237
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->javac:Ljava/lang/String;

    .line 238
    return-void
.end method

.method public setJavacopts(Ljava/lang/String;)V
    .locals 0
    .param p1, "aString"    # Ljava/lang/String;

    .prologue
    .line 246
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->javacopts:Ljava/lang/String;

    .line 247
    return-void
.end method

.method public setJonasroot(Ljava/io/File;)V
    .locals 0
    .param p1, "aFile"    # Ljava/io/File;

    .prologue
    .line 286
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->jonasroot:Ljava/io/File;

    .line 287
    return-void
.end method

.method public setKeepgenerated(Z)V
    .locals 0
    .param p1, "aBoolean"    # Z

    .prologue
    .line 201
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->keepgenerated:Z

    .line 202
    return-void
.end method

.method public setKeepgeneric(Z)V
    .locals 0
    .param p1, "aBoolean"    # Z

    .prologue
    .line 295
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->keepgeneric:Z

    .line 296
    return-void
.end method

.method public setNocompil(Z)V
    .locals 0
    .param p1, "aBoolean"    # Z

    .prologue
    .line 219
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->nocompil:Z

    .line 220
    return-void
.end method

.method public setNogenic(Z)V
    .locals 0
    .param p1, "aBoolean"    # Z

    .prologue
    .line 322
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->nogenic:Z

    .line 323
    return-void
.end method

.method public setNovalidation(Z)V
    .locals 0
    .param p1, "aBoolean"    # Z

    .prologue
    .line 228
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->novalidation:Z

    .line 229
    return-void
.end method

.method public setOrb(Ljava/lang/String;)V
    .locals 0
    .param p1, "aString"    # Ljava/lang/String;

    .prologue
    .line 313
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->orb:Ljava/lang/String;

    .line 314
    return-void
.end method

.method public setRmicopts(Ljava/lang/String;)V
    .locals 0
    .param p1, "aString"    # Ljava/lang/String;

    .prologue
    .line 255
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->rmicopts:Ljava/lang/String;

    .line 256
    return-void
.end method

.method public setSecpropag(Z)V
    .locals 0
    .param p1, "aBoolean"    # Z

    .prologue
    .line 264
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->secpropag:Z

    .line 265
    return-void
.end method

.method public setVerbose(Z)V
    .locals 0
    .param p1, "aBoolean"    # Z

    .prologue
    .line 273
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->verbose:Z

    .line 274
    return-void
.end method

.method protected writeJar(Ljava/lang/String;Ljava/io/File;Ljava/util/Hashtable;Ljava/lang/String;)V
    .locals 3
    .param p1, "baseName"    # Ljava/lang/String;
    .param p2, "jarfile"    # Ljava/io/File;
    .param p3, "ejbFiles"    # Ljava/util/Hashtable;
    .param p4, "publicId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 351
    invoke-super {p0, p1}, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->getVendorOutputJarFile(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    .line 352
    .local v0, "genericJarFile":Ljava/io/File;
    invoke-super {p0, p1, v0, p3, p4}, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->writeJar(Ljava/lang/String;Ljava/io/File;Ljava/util/Hashtable;Ljava/lang/String;)V

    .line 355
    invoke-direct {p0, v0, p3}, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->addGenICGeneratedFiles(Ljava/io/File;Ljava/util/Hashtable;)V

    .line 358
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->getVendorOutputJarFile(Ljava/lang/String;)Ljava/io/File;

    move-result-object v1

    invoke-super {p0, p1, v1, p3, p4}, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->writeJar(Ljava/lang/String;Ljava/io/File;Ljava/util/Hashtable;Ljava/lang/String;)V

    .line 360
    iget-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->keepgeneric:Z

    if-nez v1, :cond_0

    .line 361
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "Deleting generic JAR "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v0}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x3

    invoke-virtual {p0, v1, v2}, Lorg/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool;->log(Ljava/lang/String;I)V

    .line 362
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 364
    :cond_0
    return-void
.end method
