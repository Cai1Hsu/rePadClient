.class public Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandDeploymentTool;
.super Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;
.source "BorlandDeploymentTool.java"

# interfaces
.implements Lorg/apache/tools/ant/taskdefs/ExecuteStreamHandler;


# static fields
.field static final BAS:I = 0x4

.field protected static final BAS_DD:Ljava/lang/String; = "ejb-inprise.xml"

.field static final BES:I = 0x5

.field protected static final BES_DD:Ljava/lang/String; = "ejb-borland.xml"

.field protected static final DEFAULT_BAS45_EJB11_DTD_LOCATION:Ljava/lang/String; = "/com/inprise/j2ee/xml/dtds/ejb-jar.dtd"

.field protected static final DEFAULT_BAS_DTD_LOCATION:Ljava/lang/String; = "/com/inprise/j2ee/xml/dtds/ejb-inprise.dtd"

.field protected static final JAVA2IIOP:Ljava/lang/String; = "java2iiop"

.field public static final PUBLICID_BORLAND_EJB:Ljava/lang/String; = "-//Inprise Corporation//DTD Enterprise JavaBeans 1.1//EN"

.field protected static final VERIFY:Ljava/lang/String; = "com.inprise.ejb.util.Verify"

.field static class$org$apache$tools$ant$taskdefs$optional$ejb$BorlandGenerateClient:Ljava/lang/Class;


# instance fields
.field private borlandDTD:Ljava/lang/String;

.field private generateclient:Z

.field private genfiles:Ljava/util/Hashtable;

.field private jarSuffix:Ljava/lang/String;

.field private java2iioparams:Ljava/lang/String;

.field private java2iiopdebug:Z

.field private verify:Z

.field private verifyArgs:Ljava/lang/String;

.field private version:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 77
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;-><init>()V

    .line 100
    const-string/jumbo v0, "-ejb.jar"

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandDeploymentTool;->jarSuffix:Ljava/lang/String;

    .line 106
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandDeploymentTool;->java2iiopdebug:Z

    .line 109
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandDeploymentTool;->java2iioparams:Ljava/lang/String;

    .line 112
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandDeploymentTool;->generateclient:Z

    .line 120
    const/4 v0, 0x4

    iput v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandDeploymentTool;->version:I

    .line 127
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandDeploymentTool;->verify:Z

    .line 128
    const-string/jumbo v0, ""

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandDeploymentTool;->verifyArgs:Ljava/lang/String;

    .line 130
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandDeploymentTool;->genfiles:Ljava/util/Hashtable;

    return-void
.end method

.method private buildBorlandStubs(Ljava/util/Iterator;)V
    .locals 9
    .param p1, "ithomes"    # Ljava/util/Iterator;

    .prologue
    const/4 v8, 0x0

    .line 395
    const/4 v2, 0x0

    .line 397
    .local v2, "execTask":Lorg/apache/tools/ant/taskdefs/Execute;
    new-instance v2, Lorg/apache/tools/ant/taskdefs/Execute;

    .end local v2    # "execTask":Lorg/apache/tools/ant/taskdefs/Execute;
    invoke-direct {v2, p0}, Lorg/apache/tools/ant/taskdefs/Execute;-><init>(Lorg/apache/tools/ant/taskdefs/ExecuteStreamHandler;)V

    .line 398
    .restart local v2    # "execTask":Lorg/apache/tools/ant/taskdefs/Execute;
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandDeploymentTool;->getTask()Lorg/apache/tools/ant/Task;

    move-result-object v6

    invoke-virtual {v6}, Lorg/apache/tools/ant/Task;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v4

    .line 399
    .local v4, "project":Lorg/apache/tools/ant/Project;
    invoke-virtual {v2, v4}, Lorg/apache/tools/ant/taskdefs/Execute;->setAntRun(Lorg/apache/tools/ant/Project;)V

    .line 400
    invoke-virtual {v4}, Lorg/apache/tools/ant/Project;->getBaseDir()Ljava/io/File;

    move-result-object v6

    invoke-virtual {v2, v6}, Lorg/apache/tools/ant/taskdefs/Execute;->setWorkingDirectory(Ljava/io/File;)V

    .line 402
    new-instance v0, Lorg/apache/tools/ant/types/Commandline;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/Commandline;-><init>()V

    .line 403
    .local v0, "commandline":Lorg/apache/tools/ant/types/Commandline;
    const-string/jumbo v6, "java2iiop"

    invoke-virtual {v0, v6}, Lorg/apache/tools/ant/types/Commandline;->setExecutable(Ljava/lang/String;)V

    .line 405
    iget-boolean v6, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandDeploymentTool;->java2iiopdebug:Z

    if-eqz v6, :cond_0

    .line 406
    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v6

    const-string/jumbo v7, "-VBJdebug"

    invoke-virtual {v6, v7}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 409
    :cond_0
    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v6

    const-string/jumbo v7, "-VBJclasspath"

    invoke-virtual {v6, v7}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 410
    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v6

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandDeploymentTool;->getCombinedClasspath()Lorg/apache/tools/ant/types/Path;

    move-result-object v7

    invoke-virtual {v6, v7}, Lorg/apache/tools/ant/types/Commandline$Argument;->setPath(Lorg/apache/tools/ant/types/Path;)V

    .line 412
    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v6

    const-string/jumbo v7, "-list_files"

    invoke-virtual {v6, v7}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 414
    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v6

    const-string/jumbo v7, "-no_tie"

    invoke-virtual {v6, v7}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 416
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandDeploymentTool;->java2iioparams:Ljava/lang/String;

    if-eqz v6, :cond_1

    .line 417
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v7, "additional  "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandDeploymentTool;->java2iioparams:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string/jumbo v7, " to java2iiop "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v6, v8}, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandDeploymentTool;->log(Ljava/lang/String;I)V

    .line 418
    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v6

    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandDeploymentTool;->java2iioparams:Ljava/lang/String;

    invoke-virtual {v6, v7}, Lorg/apache/tools/ant/types/Commandline$Argument;->setLine(Ljava/lang/String;)V

    .line 423
    :cond_1
    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v6

    const-string/jumbo v7, "-root_dir"

    invoke-virtual {v6, v7}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 424
    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v6

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandDeploymentTool;->getConfig()Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;

    move-result-object v7

    iget-object v7, v7, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;->srcDir:Ljava/io/File;

    invoke-virtual {v7}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 426
    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v6

    const-string/jumbo v7, "-compile"

    invoke-virtual {v6, v7}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 428
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_2

    .line 429
    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v6

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    goto :goto_0

    .line 433
    :cond_2
    :try_start_0
    const-string/jumbo v6, "Calling java2iiop"

    const/4 v7, 0x3

    invoke-virtual {p0, v6, v7}, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandDeploymentTool;->log(Ljava/lang/String;I)V

    .line 434
    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->describeCommand()Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x4

    invoke-virtual {p0, v6, v7}, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandDeploymentTool;->log(Ljava/lang/String;I)V

    .line 435
    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->getCommandline()[Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Lorg/apache/tools/ant/taskdefs/Execute;->setCommandline([Ljava/lang/String;)V

    .line 436
    invoke-virtual {v2}, Lorg/apache/tools/ant/taskdefs/Execute;->execute()I

    move-result v5

    .line 437
    .local v5, "result":I
    invoke-static {v5}, Lorg/apache/tools/ant/taskdefs/Execute;->isFailure(I)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 438
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v7, "Failed executing java2iiop (ret code is "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string/jumbo v7, ")"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    .line 440
    .local v3, "msg":Ljava/lang/String;
    new-instance v6, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandDeploymentTool;->getTask()Lorg/apache/tools/ant/Task;

    move-result-object v7

    invoke-virtual {v7}, Lorg/apache/tools/ant/Task;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v7

    invoke-direct {v6, v3, v7}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v6
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 442
    .end local v3    # "msg":Ljava/lang/String;
    .end local v5    # "result":I
    :catch_0
    move-exception v1

    .line 443
    .local v1, "e":Ljava/io/IOException;
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v7, "java2iiop exception :"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v6, v8}, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandDeploymentTool;->log(Ljava/lang/String;I)V

    .line 444
    new-instance v6, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandDeploymentTool;->getTask()Lorg/apache/tools/ant/Task;

    move-result-object v7

    invoke-virtual {v7}, Lorg/apache/tools/ant/Task;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v7

    invoke-direct {v6, v1, v7}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v6

    .line 446
    .end local v1    # "e":Ljava/io/IOException;
    .restart local v5    # "result":I
    :cond_3
    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 364
    :try_start_0
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    :catch_0
    move-exception v0

    .local v0, "x1":Ljava/lang/ClassNotFoundException;
    new-instance v1, Ljava/lang/NoClassDefFoundError;

    invoke-direct {v1}, Ljava/lang/NoClassDefFoundError;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/NoClassDefFoundError;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    move-result-object v1

    throw v1
.end method

.method private generateClient(Ljava/io/File;)V
    .locals 9
    .param p1, "sourceJar"    # Ljava/io/File;

    .prologue
    .line 363
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandDeploymentTool;->getTask()Lorg/apache/tools/ant/Task;

    move-result-object v6

    invoke-virtual {v6}, Lorg/apache/tools/ant/Task;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v7

    const-string/jumbo v8, "internal_bas_generateclient"

    sget-object v6, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandDeploymentTool;->class$org$apache$tools$ant$taskdefs$optional$ejb$BorlandGenerateClient:Ljava/lang/Class;

    if-nez v6, :cond_1

    const-string/jumbo v6, "org.apache.tools.ant.taskdefs.optional.ejb.BorlandGenerateClient"

    invoke-static {v6}, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandDeploymentTool;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    sput-object v6, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandDeploymentTool;->class$org$apache$tools$ant$taskdefs$optional$ejb$BorlandGenerateClient:Ljava/lang/Class;

    :goto_0
    invoke-virtual {v7, v8, v6}, Lorg/apache/tools/ant/Project;->addTaskDefinition(Ljava/lang/String;Ljava/lang/Class;)V

    .line 366
    const/4 v3, 0x0

    .line 367
    .local v3, "gentask":Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandGenerateClient;
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v7, "generate client for "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x2

    invoke-virtual {p0, v6, v7}, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandDeploymentTool;->log(Ljava/lang/String;I)V

    .line 369
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandDeploymentTool;->getTask()Lorg/apache/tools/ant/Task;

    move-result-object v6

    invoke-virtual {v6}, Lorg/apache/tools/ant/Task;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v5

    .line 370
    .local v5, "project":Lorg/apache/tools/ant/Project;
    const-string/jumbo v6, "internal_bas_generateclient"

    invoke-virtual {v5, v6}, Lorg/apache/tools/ant/Project;->createTask(Ljava/lang/String;)Lorg/apache/tools/ant/Task;

    move-result-object v6

    move-object v0, v6

    check-cast v0, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandGenerateClient;

    move-object v3, v0

    .line 372
    invoke-virtual {v3, p1}, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandGenerateClient;->setEjbjar(Ljava/io/File;)V

    .line 373
    iget-boolean v6, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandDeploymentTool;->java2iiopdebug:Z

    invoke-virtual {v3, v6}, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandGenerateClient;->setDebug(Z)V

    .line 374
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandDeploymentTool;->getCombinedClasspath()Lorg/apache/tools/ant/types/Path;

    move-result-object v1

    .line 375
    .local v1, "classpath":Lorg/apache/tools/ant/types/Path;
    if-eqz v1, :cond_0

    .line 376
    invoke-virtual {v3, v1}, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandGenerateClient;->setClasspath(Lorg/apache/tools/ant/types/Path;)V

    .line 378
    :cond_0
    iget v6, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandDeploymentTool;->version:I

    invoke-virtual {v3, v6}, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandGenerateClient;->setVersion(I)V

    .line 379
    const-string/jumbo v6, "generate client"

    invoke-virtual {v3, v6}, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandGenerateClient;->setTaskName(Ljava/lang/String;)V

    .line 380
    invoke-virtual {v3}, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandGenerateClient;->execute()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 387
    return-void

    .line 363
    .end local v1    # "classpath":Lorg/apache/tools/ant/types/Path;
    .end local v3    # "gentask":Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandGenerateClient;
    .end local v5    # "project":Lorg/apache/tools/ant/Project;
    :cond_1
    sget-object v6, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandDeploymentTool;->class$org$apache$tools$ant$taskdefs$optional$ejb$BorlandGenerateClient:Ljava/lang/Class;

    goto :goto_0

    .line 381
    .restart local v3    # "gentask":Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandGenerateClient;
    :catch_0
    move-exception v2

    .line 383
    .local v2, "e":Ljava/lang/Exception;
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v7, "Exception while calling com.inprise.ejb.util.Verify Details: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v2}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    .line 385
    .local v4, "msg":Ljava/lang/String;
    new-instance v6, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v6, v4, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v6
.end method

.method private toClass(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p1, "filename"    # Ljava/lang/String;

    .prologue
    .line 496
    const/4 v1, 0x0

    const-string/jumbo v2, ".class"

    invoke-virtual {p1, v2}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 497
    .local v0, "classname":Ljava/lang/String;
    const/16 v1, 0x5c

    const/16 v2, 0x2e

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v0

    .line 498
    return-object v0
.end method

.method private toClassFile(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p1, "filename"    # Ljava/lang/String;

    .prologue
    .line 507
    const/4 v1, 0x0

    const-string/jumbo v2, ".java"

    invoke-virtual {p1, v2}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 508
    .local v0, "classfile":Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, ".class"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 509
    return-object v0
.end method

.method private verifyBorlandJar(Ljava/io/File;)V
    .locals 2
    .param p1, "sourceJar"    # Ljava/io/File;

    .prologue
    .line 277
    iget v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandDeploymentTool;->version:I

    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    .line 278
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandDeploymentTool;->verifyBorlandJarV4(Ljava/io/File;)V

    .line 287
    :goto_0
    return-void

    .line 281
    :cond_0
    iget v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandDeploymentTool;->version:I

    const/4 v1, 0x5

    if-ne v0, v1, :cond_1

    .line 282
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandDeploymentTool;->verifyBorlandJarV5(Ljava/io/File;)V

    goto :goto_0

    .line 285
    :cond_1
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v1, "verify jar skipped because the version is invalid ["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    iget v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandDeploymentTool;->version:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string/jumbo v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandDeploymentTool;->log(Ljava/lang/String;I)V

    goto :goto_0
.end method

.method private verifyBorlandJarV4(Ljava/io/File;)V
    .locals 9
    .param p1, "sourceJar"    # Ljava/io/File;

    .prologue
    .line 328
    const/4 v4, 0x0

    .line 329
    .local v4, "javaTask":Lorg/apache/tools/ant/taskdefs/Java;
    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v8, "verify BAS "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    const/4 v8, 0x2

    invoke-virtual {p0, v7, v8}, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandDeploymentTool;->log(Ljava/lang/String;I)V

    .line 331
    :try_start_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandDeploymentTool;->verifyArgs:Ljava/lang/String;

    .line 332
    .local v0, "args":Ljava/lang/String;
    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v7, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string/jumbo v8, " "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {p1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 334
    new-instance v5, Lorg/apache/tools/ant/taskdefs/Java;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandDeploymentTool;->getTask()Lorg/apache/tools/ant/Task;

    move-result-object v7

    invoke-direct {v5, v7}, Lorg/apache/tools/ant/taskdefs/Java;-><init>(Lorg/apache/tools/ant/Task;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 335
    .end local v4    # "javaTask":Lorg/apache/tools/ant/taskdefs/Java;
    .local v5, "javaTask":Lorg/apache/tools/ant/taskdefs/Java;
    :try_start_1
    const-string/jumbo v7, "verify"

    invoke-virtual {v5, v7}, Lorg/apache/tools/ant/taskdefs/Java;->setTaskName(Ljava/lang/String;)V

    .line 336
    const-string/jumbo v7, "com.inprise.ejb.util.Verify"

    invoke-virtual {v5, v7}, Lorg/apache/tools/ant/taskdefs/Java;->setClassname(Ljava/lang/String;)V

    .line 337
    invoke-virtual {v5}, Lorg/apache/tools/ant/taskdefs/Java;->createArg()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v1

    .line 338
    .local v1, "arguments":Lorg/apache/tools/ant/types/Commandline$Argument;
    invoke-virtual {v1, v0}, Lorg/apache/tools/ant/types/Commandline$Argument;->setLine(Ljava/lang/String;)V

    .line 339
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandDeploymentTool;->getCombinedClasspath()Lorg/apache/tools/ant/types/Path;

    move-result-object v2

    .line 340
    .local v2, "classpath":Lorg/apache/tools/ant/types/Path;
    if-eqz v2, :cond_0

    .line 341
    invoke-virtual {v5, v2}, Lorg/apache/tools/ant/taskdefs/Java;->setClasspath(Lorg/apache/tools/ant/types/Path;)V

    .line 342
    const/4 v7, 0x1

    invoke-virtual {v5, v7}, Lorg/apache/tools/ant/taskdefs/Java;->setFork(Z)V

    .line 345
    :cond_0
    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v8, "Calling com.inprise.ejb.util.Verify for "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {p1}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    const/4 v8, 0x3

    invoke-virtual {p0, v7, v8}, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandDeploymentTool;->log(Ljava/lang/String;I)V

    .line 347
    invoke-virtual {v5}, Lorg/apache/tools/ant/taskdefs/Java;->execute()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 354
    return-void

    .line 348
    .end local v0    # "args":Ljava/lang/String;
    .end local v1    # "arguments":Lorg/apache/tools/ant/types/Commandline$Argument;
    .end local v2    # "classpath":Lorg/apache/tools/ant/types/Path;
    .end local v5    # "javaTask":Lorg/apache/tools/ant/taskdefs/Java;
    .restart local v4    # "javaTask":Lorg/apache/tools/ant/taskdefs/Java;
    :catch_0
    move-exception v3

    .line 350
    .local v3, "e":Ljava/lang/Exception;
    :goto_0
    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v8, "Exception while calling com.inprise.ejb.util.Verify Details: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v3}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    .line 352
    .local v6, "msg":Ljava/lang/String;
    new-instance v7, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v7, v6, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v7

    .line 348
    .end local v3    # "e":Ljava/lang/Exception;
    .end local v4    # "javaTask":Lorg/apache/tools/ant/taskdefs/Java;
    .end local v6    # "msg":Ljava/lang/String;
    .restart local v0    # "args":Ljava/lang/String;
    .restart local v5    # "javaTask":Lorg/apache/tools/ant/taskdefs/Java;
    :catch_1
    move-exception v3

    move-object v4, v5

    .end local v5    # "javaTask":Lorg/apache/tools/ant/taskdefs/Java;
    .restart local v4    # "javaTask":Lorg/apache/tools/ant/taskdefs/Java;
    goto :goto_0
.end method

.method private verifyBorlandJarV5(Ljava/io/File;)V
    .locals 6
    .param p1, "sourceJar"    # Ljava/io/File;

    .prologue
    .line 294
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "verify BES "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x2

    invoke-virtual {p0, v4, v5}, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandDeploymentTool;->log(Ljava/lang/String;I)V

    .line 296
    const/4 v1, 0x0

    .line 297
    .local v1, "execTask":Lorg/apache/tools/ant/taskdefs/ExecTask;
    :try_start_0
    new-instance v2, Lorg/apache/tools/ant/taskdefs/ExecTask;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandDeploymentTool;->getTask()Lorg/apache/tools/ant/Task;

    move-result-object v4

    invoke-direct {v2, v4}, Lorg/apache/tools/ant/taskdefs/ExecTask;-><init>(Lorg/apache/tools/ant/Task;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 298
    .end local v1    # "execTask":Lorg/apache/tools/ant/taskdefs/ExecTask;
    .local v2, "execTask":Lorg/apache/tools/ant/taskdefs/ExecTask;
    :try_start_1
    new-instance v4, Ljava/io/File;

    const-string/jumbo v5, "."

    invoke-direct {v4, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v4}, Lorg/apache/tools/ant/taskdefs/ExecTask;->setDir(Ljava/io/File;)V

    .line 299
    const-string/jumbo v4, "iastool"

    invoke-virtual {v2, v4}, Lorg/apache/tools/ant/taskdefs/ExecTask;->setExecutable(Ljava/lang/String;)V

    .line 301
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandDeploymentTool;->getCombinedClasspath()Lorg/apache/tools/ant/types/Path;

    move-result-object v4

    if-eqz v4, :cond_0

    .line 302
    invoke-virtual {v2}, Lorg/apache/tools/ant/taskdefs/ExecTask;->createArg()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v4

    const-string/jumbo v5, "-VBJclasspath"

    invoke-virtual {v4, v5}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 303
    invoke-virtual {v2}, Lorg/apache/tools/ant/taskdefs/ExecTask;->createArg()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v4

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandDeploymentTool;->getCombinedClasspath()Lorg/apache/tools/ant/types/Path;

    move-result-object v5

    invoke-virtual {v5}, Lorg/apache/tools/ant/types/Path;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 306
    :cond_0
    iget-boolean v4, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandDeploymentTool;->java2iiopdebug:Z

    if-eqz v4, :cond_1

    .line 307
    invoke-virtual {v2}, Lorg/apache/tools/ant/taskdefs/ExecTask;->createArg()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v4

    const-string/jumbo v5, "-debug"

    invoke-virtual {v4, v5}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 309
    :cond_1
    invoke-virtual {v2}, Lorg/apache/tools/ant/taskdefs/ExecTask;->createArg()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v4

    const-string/jumbo v5, "-verify"

    invoke-virtual {v4, v5}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 310
    invoke-virtual {v2}, Lorg/apache/tools/ant/taskdefs/ExecTask;->createArg()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v4

    const-string/jumbo v5, "-src"

    invoke-virtual {v4, v5}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 312
    invoke-virtual {v2}, Lorg/apache/tools/ant/taskdefs/ExecTask;->createArg()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v4

    invoke-virtual {p1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 313
    const-string/jumbo v4, "Calling iastool"

    const/4 v5, 0x3

    invoke-virtual {p0, v4, v5}, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandDeploymentTool;->log(Ljava/lang/String;I)V

    .line 314
    invoke-virtual {v2}, Lorg/apache/tools/ant/taskdefs/ExecTask;->execute()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 321
    return-void

    .line 315
    .end local v2    # "execTask":Lorg/apache/tools/ant/taskdefs/ExecTask;
    .restart local v1    # "execTask":Lorg/apache/tools/ant/taskdefs/ExecTask;
    :catch_0
    move-exception v0

    .line 317
    .local v0, "e":Ljava/lang/Exception;
    :goto_0
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "Exception while calling generateclient Details: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    .line 319
    .local v3, "msg":Ljava/lang/String;
    new-instance v4, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v4, v3, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4

    .line 315
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v1    # "execTask":Lorg/apache/tools/ant/taskdefs/ExecTask;
    .end local v3    # "msg":Ljava/lang/String;
    .restart local v2    # "execTask":Lorg/apache/tools/ant/taskdefs/ExecTask;
    :catch_1
    move-exception v0

    move-object v1, v2

    .end local v2    # "execTask":Lorg/apache/tools/ant/taskdefs/ExecTask;
    .restart local v1    # "execTask":Lorg/apache/tools/ant/taskdefs/ExecTask;
    goto :goto_0
.end method


# virtual methods
.method protected addVendorFiles(Ljava/util/Hashtable;Ljava/lang/String;)V
    .locals 5
    .param p1, "ejbFiles"    # Ljava/util/Hashtable;
    .param p2, "ddPrefix"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x5

    const/4 v4, 0x4

    .line 244
    iget v2, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandDeploymentTool;->version:I

    if-eq v2, v3, :cond_0

    iget v2, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandDeploymentTool;->version:I

    if-eq v2, v4, :cond_0

    .line 245
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "version "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    iget v4, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandDeploymentTool;->version:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, " is not supported"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 248
    :cond_0
    iget v2, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandDeploymentTool;->version:I

    if-ne v2, v3, :cond_1

    const-string/jumbo v1, "ejb-borland.xml"

    .line 250
    .local v1, "dd":Ljava/lang/String;
    :goto_0
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "vendor file : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2, v4}, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandDeploymentTool;->log(Ljava/lang/String;I)V

    .line 252
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandDeploymentTool;->getConfig()Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;

    move-result-object v2

    iget-object v2, v2, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;->descriptorDir:Ljava/io/File;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v3, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 253
    .local v0, "borlandDD":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 254
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "Borland specific file found "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x3

    invoke-virtual {p0, v2, v3}, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandDeploymentTool;->log(Ljava/lang/String;I)V

    .line 255
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "META-INF/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2, v0}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 262
    :goto_1
    return-void

    .line 248
    .end local v0    # "borlandDD":Ljava/io/File;
    .end local v1    # "dd":Ljava/lang/String;
    :cond_1
    const-string/jumbo v1, "ejb-inprise.xml"

    goto :goto_0

    .line 257
    .restart local v0    # "borlandDD":Ljava/io/File;
    .restart local v1    # "dd":Ljava/lang/String;
    :cond_2
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "Unable to locate borland deployment descriptor. It was expected to be in "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    invoke-virtual {p0, v2, v3}, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandDeploymentTool;->log(Ljava/lang/String;I)V

    goto :goto_1
.end method

.method protected getBorlandDescriptorHandler(Ljava/io/File;)Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;
    .locals 5
    .param p1, "srcDir"    # Ljava/io/File;

    .prologue
    .line 209
    new-instance v1, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandDeploymentTool$1;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandDeploymentTool;->getTask()Lorg/apache/tools/ant/Task;

    move-result-object v3

    invoke-direct {v1, p0, v3, p1, p1}, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandDeploymentTool$1;-><init>(Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandDeploymentTool;Lorg/apache/tools/ant/Task;Ljava/io/File;Ljava/io/File;)V

    .line 225
    .local v1, "handler":Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;
    const-string/jumbo v4, "-//Inprise Corporation//DTD Enterprise JavaBeans 1.1//EN"

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandDeploymentTool;->borlandDTD:Ljava/lang/String;

    if-nez v3, :cond_0

    const-string/jumbo v3, "/com/inprise/j2ee/xml/dtds/ejb-inprise.dtd"

    :goto_0
    invoke-virtual {v1, v4, v3}, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;->registerDTD(Ljava/lang/String;Ljava/lang/String;)V

    .line 228
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandDeploymentTool;->getConfig()Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;

    move-result-object v3

    iget-object v3, v3, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;->dtdLocations:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 229
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$DTDLocation;

    .line 230
    .local v0, "dtdLocation":Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$DTDLocation;
    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$DTDLocation;->getPublicId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$DTDLocation;->getLocation()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;->registerDTD(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 225
    .end local v0    # "dtdLocation":Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$DTDLocation;
    .end local v2    # "i":Ljava/util/Iterator;
    :cond_0
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandDeploymentTool;->borlandDTD:Ljava/lang/String;

    goto :goto_0

    .line 232
    .restart local v2    # "i":Ljava/util/Iterator;
    :cond_1
    return-object v1
.end method

.method getVendorOutputJarFile(Ljava/lang/String;)Ljava/io/File;
    .locals 4
    .param p1, "baseName"    # Ljava/lang/String;

    .prologue
    .line 269
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandDeploymentTool;->getDestDir()Ljava/io/File;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandDeploymentTool;->jarSuffix:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v0
.end method

.method public setBASdtd(Ljava/lang/String;)V
    .locals 0
    .param p1, "inString"    # Ljava/lang/String;

    .prologue
    .line 172
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandDeploymentTool;->borlandDTD:Ljava/lang/String;

    .line 173
    return-void
.end method

.method public setDebug(Z)V
    .locals 0
    .param p1, "debug"    # Z

    .prologue
    .line 137
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandDeploymentTool;->java2iiopdebug:Z

    .line 138
    return-void
.end method

.method public setGenerateclient(Z)V
    .locals 0
    .param p1, "b"    # Z

    .prologue
    .line 182
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandDeploymentTool;->generateclient:Z

    .line 183
    return-void
.end method

.method public setJava2iiopParams(Ljava/lang/String;)V
    .locals 0
    .param p1, "params"    # Ljava/lang/String;

    .prologue
    .line 199
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandDeploymentTool;->java2iioparams:Ljava/lang/String;

    .line 200
    return-void
.end method

.method public setProcessErrorStream(Ljava/io/InputStream;)V
    .locals 4
    .param p1, "is"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 551
    new-instance v0, Ljava/io/BufferedReader;

    new-instance v2, Ljava/io/InputStreamReader;

    invoke-direct {v2, p1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v0, v2}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 552
    .local v0, "reader":Ljava/io/BufferedReader;
    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v1

    .line 553
    .local v1, "s":Ljava/lang/String;
    if-eqz v1, :cond_0

    .line 554
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "[java2iiop] "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {p0, v2, v3}, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandDeploymentTool;->log(Ljava/lang/String;I)V

    .line 556
    :cond_0
    return-void
.end method

.method public setProcessInputStream(Ljava/io/OutputStream;)V
    .locals 0
    .param p1, "param1"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 519
    return-void
.end method

.method public setProcessOutputStream(Ljava/io/InputStream;)V
    .locals 8
    .param p1, "is"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 528
    :try_start_0
    new-instance v5, Ljava/io/BufferedReader;

    new-instance v6, Ljava/io/InputStreamReader;

    invoke-direct {v6, p1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v5, v6}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 530
    .local v5, "reader":Ljava/io/BufferedReader;
    :cond_0
    :goto_0
    invoke-virtual {v5}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v2

    .local v2, "javafile":Ljava/lang/String;
    if-eqz v2, :cond_1

    .line 531
    const-string/jumbo v6, ".java"

    invoke-virtual {v2, v6}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 532
    invoke-direct {p0, v2}, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandDeploymentTool;->toClassFile(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 533
    .local v0, "classfile":Ljava/lang/String;
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandDeploymentTool;->getConfig()Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;

    move-result-object v6

    iget-object v6, v6, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;->srcDir:Ljava/io/File;

    invoke-virtual {v6}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    add-int/lit8 v6, v6, 0x1

    invoke-virtual {v0, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    .line 535
    .local v3, "key":Ljava/lang/String;
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandDeploymentTool;->genfiles:Ljava/util/Hashtable;

    new-instance v7, Ljava/io/File;

    invoke-direct {v7, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v3, v7}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 539
    .end local v0    # "classfile":Ljava/lang/String;
    .end local v2    # "javafile":Ljava/lang/String;
    .end local v3    # "key":Ljava/lang/String;
    .end local v5    # "reader":Ljava/io/BufferedReader;
    :catch_0
    move-exception v1

    .line 540
    .local v1, "e":Ljava/lang/Exception;
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v7, "Exception while parsing  java2iiop output. Details: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    .line 541
    .local v4, "msg":Ljava/lang/String;
    new-instance v6, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v6, v4, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v6

    .line 538
    .end local v1    # "e":Ljava/lang/Exception;
    .end local v4    # "msg":Ljava/lang/String;
    .restart local v2    # "javafile":Ljava/lang/String;
    .restart local v5    # "reader":Ljava/io/BufferedReader;
    :cond_1
    :try_start_1
    invoke-virtual {v5}, Ljava/io/BufferedReader;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 543
    return-void
.end method

.method public setSuffix(Ljava/lang/String;)V
    .locals 0
    .param p1, "inString"    # Ljava/lang/String;

    .prologue
    .line 154
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandDeploymentTool;->jarSuffix:Ljava/lang/String;

    .line 155
    return-void
.end method

.method public setVerify(Z)V
    .locals 0
    .param p1, "verify"    # Z

    .prologue
    .line 145
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandDeploymentTool;->verify:Z

    .line 146
    return-void
.end method

.method public setVerifyArgs(Ljava/lang/String;)V
    .locals 0
    .param p1, "args"    # Ljava/lang/String;

    .prologue
    .line 163
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandDeploymentTool;->verifyArgs:Ljava/lang/String;

    .line 164
    return-void
.end method

.method public setVersion(I)V
    .locals 0
    .param p1, "version"    # I

    .prologue
    .line 190
    iput p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandDeploymentTool;->version:I

    .line 191
    return-void
.end method

.method public start()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 515
    return-void
.end method

.method public stop()V
    .locals 0

    .prologue
    .line 517
    return-void
.end method

.method protected writeJar(Ljava/lang/String;Ljava/io/File;Ljava/util/Hashtable;Ljava/lang/String;)V
    .locals 6
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
    .line 461
    new-instance v2, Ljava/util/Vector;

    invoke-direct {v2}, Ljava/util/Vector;-><init>()V

    .line 462
    .local v2, "homes":Ljava/util/Vector;
    invoke-virtual {p3}, Ljava/util/Hashtable;->keySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .line 463
    .local v3, "it":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 464
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 465
    .local v0, "clazz":Ljava/lang/String;
    const-string/jumbo v4, "Home.class"

    invoke-virtual {v0, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 467
    invoke-direct {p0, v0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandDeploymentTool;->toClass(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 468
    .local v1, "home":Ljava/lang/String;
    invoke-virtual {v2, v1}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 469
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, " Home "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x3

    invoke-virtual {p0, v4, v5}, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandDeploymentTool;->log(Ljava/lang/String;I)V

    goto :goto_0

    .line 473
    .end local v0    # "clazz":Ljava/lang/String;
    .end local v1    # "home":Ljava/lang/String;
    :cond_1
    invoke-virtual {v2}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v4

    invoke-direct {p0, v4}, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandDeploymentTool;->buildBorlandStubs(Ljava/util/Iterator;)V

    .line 476
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandDeploymentTool;->genfiles:Ljava/util/Hashtable;

    invoke-virtual {p3, v4}, Ljava/util/Hashtable;->putAll(Ljava/util/Map;)V

    .line 478
    invoke-super {p0, p1, p2, p3, p4}, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->writeJar(Ljava/lang/String;Ljava/io/File;Ljava/util/Hashtable;Ljava/lang/String;)V

    .line 480
    iget-boolean v4, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandDeploymentTool;->verify:Z

    if-eqz v4, :cond_2

    .line 481
    invoke-direct {p0, p2}, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandDeploymentTool;->verifyBorlandJar(Ljava/io/File;)V

    .line 484
    :cond_2
    iget-boolean v4, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandDeploymentTool;->generateclient:Z

    if-eqz v4, :cond_3

    .line 485
    invoke-direct {p0, p2}, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandDeploymentTool;->generateClient(Ljava/io/File;)V

    .line 487
    :cond_3
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandDeploymentTool;->genfiles:Ljava/util/Hashtable;

    invoke-virtual {v4}, Ljava/util/Hashtable;->clear()V

    .line 488
    return-void
.end method
