.class public abstract Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;
.super Lorg/apache/tools/ant/Task;
.source "SOS.java"

# interfaces
.implements Lorg/apache/tools/ant/taskdefs/optional/sos/SOSCmd;


# static fields
.field private static final ERROR_EXIT_STATUS:I = 0xff


# instance fields
.field protected commandLine:Lorg/apache/tools/ant/types/Commandline;

.field private comment:Ljava/lang/String;

.field private filename:Ljava/lang/String;

.field private label:Ljava/lang/String;

.field private localPath:Ljava/lang/String;

.field private noCache:Z

.field private noCompress:Z

.field private projectPath:Ljava/lang/String;

.field private recursive:Z

.field private sosCmdDir:Ljava/lang/String;

.field private sosHome:Ljava/lang/String;

.field private sosPassword:Ljava/lang/String;

.field private sosServerPath:Ljava/lang/String;

.field private sosUsername:Ljava/lang/String;

.field private verbose:Z

.field private version:Ljava/lang/String;

.field private vssServerPath:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 37
    invoke-direct {p0}, Lorg/apache/tools/ant/Task;-><init>()V

    .line 41
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->sosCmdDir:Ljava/lang/String;

    .line 42
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->sosUsername:Ljava/lang/String;

    .line 43
    const-string/jumbo v0, ""

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->sosPassword:Ljava/lang/String;

    .line 44
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->projectPath:Ljava/lang/String;

    .line 45
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->vssServerPath:Ljava/lang/String;

    .line 46
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->sosServerPath:Ljava/lang/String;

    .line 47
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->sosHome:Ljava/lang/String;

    .line 48
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->localPath:Ljava/lang/String;

    .line 49
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->version:Ljava/lang/String;

    .line 50
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->label:Ljava/lang/String;

    .line 51
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->comment:Ljava/lang/String;

    .line 52
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->filename:Ljava/lang/String;

    .line 54
    iput-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->noCompress:Z

    .line 55
    iput-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->noCache:Z

    .line 56
    iput-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->recursive:Z

    .line 57
    iput-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->verbose:Z

    return-void
.end method


# virtual methods
.method abstract buildCmdLine()Lorg/apache/tools/ant/types/Commandline;
.end method

.method public execute()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 392
    const/4 v1, 0x0

    .line 393
    .local v1, "result":I
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->buildCmdLine()Lorg/apache/tools/ant/types/Commandline;

    .line 394
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->commandLine:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {p0, v2}, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->run(Lorg/apache/tools/ant/types/Commandline;)I

    move-result v1

    .line 395
    const/16 v2, 0xff

    if-ne v1, v2, :cond_0

    .line 396
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "Failed executing: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->commandLine:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v3}, Lorg/apache/tools/ant/types/Commandline;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 397
    .local v0, "msg":Ljava/lang/String;
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v3

    invoke-direct {v2, v0, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v2

    .line 399
    .end local v0    # "msg":Ljava/lang/String;
    :cond_0
    return-void
.end method

.method protected getComment()Ljava/lang/String;
    .locals 1

    .prologue
    .line 239
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->comment:Ljava/lang/String;

    return-object v0
.end method

.method protected getFilename()Ljava/lang/String;
    .locals 1

    .prologue
    .line 311
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->filename:Ljava/lang/String;

    return-object v0
.end method

.method protected getLabel()Ljava/lang/String;
    .locals 1

    .prologue
    .line 255
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->label:Ljava/lang/String;

    return-object v0
.end method

.method protected getLocalPath()Ljava/lang/String;
    .locals 6

    .prologue
    .line 359
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->localPath:Ljava/lang/String;

    if-nez v3, :cond_0

    .line 360
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v3

    invoke-virtual {v3}, Lorg/apache/tools/ant/Project;->getBaseDir()Ljava/io/File;

    move-result-object v3

    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    .line 373
    :goto_0
    return-object v3

    .line 363
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v3

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->localPath:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lorg/apache/tools/ant/Project;->resolveFile(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    .line 364
    .local v0, "dir":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v3

    if-nez v3, :cond_2

    .line 365
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    move-result v1

    .line 366
    .local v1, "done":Z
    if-nez v1, :cond_1

    .line 367
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "Directory "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->localPath:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, " creation was not "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, "successful for an unknown reason"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    .line 369
    .local v2, "msg":Ljava/lang/String;
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v4

    invoke-direct {v3, v2, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v3

    .line 371
    .end local v2    # "msg":Ljava/lang/String;
    :cond_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "Created dir: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;)V

    .line 373
    .end local v1    # "done":Z
    :cond_2
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    goto :goto_0
.end method

.method protected getNoCache()Ljava/lang/String;
    .locals 1

    .prologue
    .line 330
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->noCache:Z

    if-eqz v0, :cond_0

    const-string/jumbo v0, "-nocache"

    :goto_0
    return-object v0

    :cond_0
    const-string/jumbo v0, ""

    goto :goto_0
.end method

.method protected getNoCompress()Ljava/lang/String;
    .locals 1

    .prologue
    .line 321
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->noCompress:Z

    if-eqz v0, :cond_0

    const-string/jumbo v0, "-nocompress"

    :goto_0
    return-object v0

    :cond_0
    const-string/jumbo v0, ""

    goto :goto_0
.end method

.method protected getOptionalAttributes()V
    .locals 2

    .prologue
    .line 461
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->commandLine:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->getVerbose()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 463
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->commandLine:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->getNoCompress()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 465
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->getSosHome()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_1

    .line 467
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->commandLine:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->getNoCache()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 473
    :goto_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->getLocalPath()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 474
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->commandLine:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "-workdir"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 475
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->commandLine:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->getLocalPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 477
    :cond_0
    return-void

    .line 469
    :cond_1
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->commandLine:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "-soshome"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 470
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->commandLine:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->getSosHome()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    goto :goto_0
.end method

.method protected getPassword()Ljava/lang/String;
    .locals 1

    .prologue
    .line 271
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->sosPassword:Ljava/lang/String;

    return-object v0
.end method

.method protected getProjectPath()Ljava/lang/String;
    .locals 1

    .prologue
    .line 279
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->projectPath:Ljava/lang/String;

    return-object v0
.end method

.method protected getRecursive()Ljava/lang/String;
    .locals 1

    .prologue
    .line 348
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->recursive:Z

    if-eqz v0, :cond_0

    const-string/jumbo v0, "-recursive"

    :goto_0
    return-object v0

    :cond_0
    const-string/jumbo v0, ""

    goto :goto_0
.end method

.method protected getRequiredAttributes()V
    .locals 3

    .prologue
    .line 427
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->commandLine:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->getSosCommand()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline;->setExecutable(Ljava/lang/String;)V

    .line 429
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->getSosServerPath()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    .line 430
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "sosserverpath attribute must be set!"

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v0

    .line 432
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->commandLine:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "-server"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 433
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->commandLine:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->getSosServerPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 435
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->getUsername()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_1

    .line 436
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "username attribute must be set!"

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v0

    .line 438
    :cond_1
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->commandLine:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "-name"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 439
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->commandLine:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->getUsername()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 442
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->commandLine:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "-password"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 443
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->commandLine:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->getPassword()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 445
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->getVssServerPath()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_2

    .line 446
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "vssserverpath attribute must be set!"

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v0

    .line 448
    :cond_2
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->commandLine:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "-database"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 449
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->commandLine:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->getVssServerPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 451
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->getProjectPath()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_3

    .line 452
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "projectpath attribute must be set!"

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v0

    .line 454
    :cond_3
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->commandLine:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "-project"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 455
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->commandLine:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->getProjectPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 456
    return-void
.end method

.method protected getSosCommand()Ljava/lang/String;
    .locals 2

    .prologue
    .line 227
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->sosCmdDir:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 228
    const-string/jumbo v0, "soscmd"

    .line 230
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->sosCmdDir:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    sget-object v1, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string/jumbo v1, "soscmd"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method protected getSosHome()Ljava/lang/String;
    .locals 1

    .prologue
    .line 295
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->sosHome:Ljava/lang/String;

    return-object v0
.end method

.method protected getSosServerPath()Ljava/lang/String;
    .locals 1

    .prologue
    .line 303
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->sosServerPath:Ljava/lang/String;

    return-object v0
.end method

.method protected getUsername()Ljava/lang/String;
    .locals 1

    .prologue
    .line 263
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->sosUsername:Ljava/lang/String;

    return-object v0
.end method

.method protected getVerbose()Ljava/lang/String;
    .locals 1

    .prologue
    .line 339
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->verbose:Z

    if-eqz v0, :cond_0

    const-string/jumbo v0, "-verbose"

    :goto_0
    return-object v0

    :cond_0
    const-string/jumbo v0, ""

    goto :goto_0
.end method

.method protected getVersion()Ljava/lang/String;
    .locals 1

    .prologue
    .line 247
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->version:Ljava/lang/String;

    return-object v0
.end method

.method protected getVssServerPath()Ljava/lang/String;
    .locals 1

    .prologue
    .line 287
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->vssServerPath:Ljava/lang/String;

    return-object v0
.end method

.method protected run(Lorg/apache/tools/ant/types/Commandline;)I
    .locals 5
    .param p1, "cmd"    # Lorg/apache/tools/ant/types/Commandline;

    .prologue
    .line 410
    :try_start_0
    new-instance v1, Lorg/apache/tools/ant/taskdefs/Execute;

    new-instance v2, Lorg/apache/tools/ant/taskdefs/LogStreamHandler;

    const/4 v3, 0x2

    const/4 v4, 0x1

    invoke-direct {v2, p0, v3, v4}, Lorg/apache/tools/ant/taskdefs/LogStreamHandler;-><init>(Lorg/apache/tools/ant/Task;II)V

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/taskdefs/Execute;-><init>(Lorg/apache/tools/ant/taskdefs/ExecuteStreamHandler;)V

    .line 414
    .local v1, "exe":Lorg/apache/tools/ant/taskdefs/Execute;
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/taskdefs/Execute;->setAntRun(Lorg/apache/tools/ant/Project;)V

    .line 415
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v2

    invoke-virtual {v2}, Lorg/apache/tools/ant/Project;->getBaseDir()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/taskdefs/Execute;->setWorkingDirectory(Ljava/io/File;)V

    .line 416
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->getCommandline()[Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/taskdefs/Execute;->setCommandline([Ljava/lang/String;)V

    .line 417
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/taskdefs/Execute;->setVMLauncher(Z)V

    .line 418
    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/Execute;->execute()I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    return v2

    .line 419
    .end local v1    # "exe":Lorg/apache/tools/ant/taskdefs/Execute;
    :catch_0
    move-exception v0

    .line 420
    .local v0, "e":Ljava/io/IOException;
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v3

    invoke-direct {v2, v0, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v2
.end method

.method protected setInternalComment(Ljava/lang/String;)V
    .locals 0
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 202
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->comment:Ljava/lang/String;

    .line 203
    return-void
.end method

.method protected setInternalFilename(Ljava/lang/String;)V
    .locals 0
    .param p1, "file"    # Ljava/lang/String;

    .prologue
    .line 186
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->filename:Ljava/lang/String;

    .line 187
    return-void
.end method

.method protected setInternalLabel(Ljava/lang/String;)V
    .locals 0
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 210
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->label:Ljava/lang/String;

    .line 211
    return-void
.end method

.method protected setInternalRecursive(Z)V
    .locals 0
    .param p1, "recurse"    # Z

    .prologue
    .line 194
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->recursive:Z

    .line 195
    return-void
.end method

.method protected setInternalVersion(Ljava/lang/String;)V
    .locals 0
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 218
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->version:Ljava/lang/String;

    .line 219
    return-void
.end method

.method public final setLocalPath(Lorg/apache/tools/ant/types/Path;)V
    .locals 1
    .param p1, "path"    # Lorg/apache/tools/ant/types/Path;

    .prologue
    .line 167
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Path;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->localPath:Ljava/lang/String;

    .line 168
    return-void
.end method

.method public final setNoCache(Z)V
    .locals 0
    .param p1, "nocache"    # Z

    .prologue
    .line 72
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->noCache:Z

    .line 73
    return-void
.end method

.method public final setNoCompress(Z)V
    .locals 0
    .param p1, "nocompress"    # Z

    .prologue
    .line 81
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->noCompress:Z

    .line 82
    return-void
.end method

.method public final setPassword(Ljava/lang/String;)V
    .locals 0
    .param p1, "password"    # Ljava/lang/String;

    .prologue
    .line 111
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->sosPassword:Ljava/lang/String;

    .line 112
    return-void
.end method

.method public final setProjectPath(Ljava/lang/String;)V
    .locals 2
    .param p1, "projectpath"    # Ljava/lang/String;

    .prologue
    .line 122
    const-string/jumbo v0, "$"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 123
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->projectPath:Ljava/lang/String;

    .line 127
    :goto_0
    return-void

    .line 125
    :cond_0
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v1, "$"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->projectPath:Ljava/lang/String;

    goto :goto_0
.end method

.method public final setSosCmd(Ljava/lang/String;)V
    .locals 1
    .param p1, "dir"    # Ljava/lang/String;

    .prologue
    .line 91
    invoke-static {p1}, Lorg/apache/tools/ant/util/FileUtils;->translatePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->sosCmdDir:Ljava/lang/String;

    .line 92
    return-void
.end method

.method public final setSosHome(Ljava/lang/String;)V
    .locals 0
    .param p1, "sosHome"    # Ljava/lang/String;

    .prologue
    .line 146
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->sosHome:Ljava/lang/String;

    .line 147
    return-void
.end method

.method public final setSosServerPath(Ljava/lang/String;)V
    .locals 0
    .param p1, "sosServerPath"    # Ljava/lang/String;

    .prologue
    .line 158
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->sosServerPath:Ljava/lang/String;

    .line 159
    return-void
.end method

.method public final setUsername(Ljava/lang/String;)V
    .locals 0
    .param p1, "username"    # Ljava/lang/String;

    .prologue
    .line 102
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->sosUsername:Ljava/lang/String;

    .line 103
    return-void
.end method

.method public setVerbose(Z)V
    .locals 0
    .param p1, "verbose"    # Z

    .prologue
    .line 176
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->verbose:Z

    .line 177
    return-void
.end method

.method public final setVssServerPath(Ljava/lang/String;)V
    .locals 0
    .param p1, "vssServerPath"    # Ljava/lang/String;

    .prologue
    .line 137
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->vssServerPath:Ljava/lang/String;

    .line 138
    return-void
.end method
